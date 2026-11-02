package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val INBOX_SEARCH_BAR = "inbox_search_bar"

/**
 * Meta's server test that swaps the chat list's search bar for a search icon, as 585 numbers it (on the 585 arm64 build
 * the icon shows up as a fourth tab in the bottom bar). Meta renumbers it with each release.
 */
internal const val SEARCH_ICON_FLAG = 0x810b24000045b3L

/** The top bar's search icon. Only the method that builds it names the class, which ties the flag to the search bar. */
internal const val SEARCH_ICON_ANCHOR = "com.facebook.messaging.search.plugins.toolbarbutton.searchbutton.InboxSearchToolbarButtonImplementation"

internal const val SEARCH_ICON_HELPER = "$SETTINGS->inboxSearchIcon(Ljava/lang/Object;J)Z"

/** The extension's stand-in for Messenger's own flag check, which the patch fills in with this build's check. */
internal const val SEARCH_ICON_STUB = "$SETTINGS->searchIconFlag(Ljava/lang/Object;J)Z"

private val FLAG_CHECK_PARAMETERS = listOf("Ljava/lang/Object;", "J")

internal fun Instruction.isSearchIconFlag() =
    opcode == Opcode.CONST_WIDE && (this as? WideLiteralInstruction)?.wideLiteral == SEARCH_ICON_FLAG

/**
 * Every method that reads the search icon flag, but only when the one method that builds the top bar's search icon
 * reads it too. Without that link nothing is found, so the switch can't patch an unrelated flag.
 */
internal fun connectSearchBar(readers: List<Method>, anchors: List<Method>): List<Method> {
    val anchor = anchors.singleOrNull() ?: return emptyList()
    return if (readers.any { it.hookId() == anchor.hookId() }) readers.distinctBy { it.hookId() } else emptyList()
}

/** One flag read: the index of the check call and the static (config, flag) check it calls. */
internal class SearchIconSite(val call: Int, val check: MethodReference)

/**
 * Each read loads the flag into a register pair and passes it straight to a static (Object, long) boolean check whose
 * answer the next instruction moves out. Any other use of the constant refuses the whole switch.
 */
internal fun Method.searchIconSites(): List<SearchIconSite> {
    fun refuse(): Nothing = throw PatchException("Messenger controls: the inbox search icon flag read in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    val sites = code.indices.filter { code[it].isSearchIconFlag() }.map { at ->
        val pair = (code[at] as OneRegisterInstruction).registerA
        val invoke = code.getOrNull(at + 1) as? FiveRegisterInstruction ?: refuse()
        val check = (invoke as? ReferenceInstruction)?.reference as? MethodReference ?: refuse()
        if (invoke.opcode != Opcode.INVOKE_STATIC || invoke.registerCount != 3 || invoke.registerD != pair ||
            invoke.registerE != pair + 1 || check.returnType != "Z" ||
            check.parameterTypes.map { it.toString() } != FLAG_CHECK_PARAMETERS ||
            code.getOrNull(at + 2)?.opcode != Opcode.MOVE_RESULT) refuse()
        SearchIconSite(at + 1, check)
    }
    if (sites.isEmpty()) refuse()
    return sites
}

internal fun MutableMethod.validateSearchBar() {
    searchIconSites()
}

/**
 * Each check call goes to the extension instead, with the same registers, so no instruction moves. Another control
 * (Hide joined community chats) proves its edit by instruction index in the chat list's builder, which reads this flag.
 */
internal fun MutableMethod.injectSearchBar() {
    for (site in searchIconSites()) {
        val call = getInstruction<FiveRegisterInstruction>(site.call)
        replaceInstruction(site.call, "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $SEARCH_ICON_HELPER")
    }
}

/**
 * The one check every read calls. The extension's stand-in calls it from another package, so it has to be public and
 * static on a public class.
 */
internal fun searchIconCheck(readers: List<Method>, classDef: (String) -> ClassDef?): MethodReference {
    fun refuse(why: String): Nothing = throw PatchException("Messenger controls: the inbox search icon flag check $why")
    val checks = readers.flatMap { it.searchIconSites() }.map { it.check }.distinctBy { it.toString() }
    val check = checks.singleOrNull() ?: refuse("isn't the same in every read")
    val owner = classDef(check.definingClass) ?: refuse("is missing")
    val method = owner.methods.singleOrNull { it.name == check.name && it.parameterTypes.map { p -> p.toString() } == FLAG_CHECK_PARAMETERS &&
        it.returnType == "Z" } ?: refuse("is missing")
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
        !AccessFlags.STATIC.isSet(method.accessFlags)) refuse("isn't public")
    return check
}

internal fun MutableMethod.validateSearchIconStub() {
    val code = implementation?.instructions?.toList()
    if (hookId() != SEARCH_ICON_STUB || !AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.PRIVATE.isSet(accessFlags) ||
        code?.map { it.opcode } != listOf(Opcode.CONST_4, Opcode.RETURN) || (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the inbox search bar's extension stub changed")
}

/** The searchIconFlag(config, flag) stub's replacement: this build's own check, asked as Messenger would ask it. */
internal fun searchIconReader(stub: MutableMethod, check: MethodReference): MutableMethod {
    stub.validateSearchIconStub()
    val built = MutableMethod(ImmutableMethod(stub.definingClass, stub.name, stub.parameters, stub.returnType, stub.accessFlags,
        stub.annotations, stub.hiddenApiRestrictions, ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
    built.addInstructionsWithLabels(0, """
        invoke-static {p0, p1, p2}, $check
        move-result v0
        return v0
    """.trimIndent())
    return built
}
