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
 * Meta's server test that swaps the chat list's search bar for a search icon, as 587 numbers it (586 read 0x810b0200004674). Meta renumbers it with
 * each release.
 */
internal const val SEARCH_ICON_FLAG = 0x810af1000046adL

/** The top bar's search icon. Only the method that builds it names the class, which ties the flag to the search bar. */
internal const val SEARCH_ICON_ANCHOR = "com.facebook.messaging.search.plugins.toolbarbutton.searchbutton.InboxSearchToolbarButtonImplementation"

internal const val SEARCH_ICON_HELPER = "$SETTINGS->inboxSearchIcon(Ljava/lang/Object;J)Z"

/** The extension's stand-in for Messenger's own flag check, which the patch fills in with this build's check. */
internal const val SEARCH_ICON_STUB = "$SETTINGS->searchIconFlag(Ljava/lang/Object;J)Z"

internal fun Instruction.isSearchIconFlag() =
    opcode == Opcode.CONST_WIDE && (this as? WideLiteralInstruction)?.wideLiteral == SEARCH_ICON_FLAG

/**
 * Every method that reads the search icon flag, but only when the one method that builds the top bar's search icon
 * reads it itself, as 587 does, or calls a [isSearchIconGetter] reader, the shared static getter 586 asks. Without that
 * link nothing is found, so the switch can't patch an unrelated flag.
 */
internal fun connectSearchBar(readers: List<Method>, anchors: List<Method>): List<Method> {
    val anchor = anchors.singleOrNull() ?: return emptyList()
    val getters = readers.filter { it.isSearchIconGetter() }.map { it.hookId() }.toSet()
    val linked = readers.any { it.hookId() == anchor.hookId() } || anchor.implementation?.instructions?.any {
        it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() in getters
    } == true
    return if (linked) readers.distinctBy { it.hookId() } else emptyList()
}

/** A static boolean method whose one flag read, through the config's interface, is its whole answer, as 586's shared getter is. */
internal fun Method.isSearchIconGetter(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z") return false
    val code = implementation?.instructions?.toList() ?: return false
    val site = try { searchIconSites().singleOrNull() } catch (_: PatchException) { null } ?: return false
    if (code[site.call].opcode != Opcode.INVOKE_INTERFACE) return false
    val result = code.getOrNull(site.call + 1) as? OneRegisterInstruction ?: return false
    val back = code.getOrNull(site.call + 2) as? OneRegisterInstruction ?: return false
    return back.opcode == Opcode.RETURN && back.registerA == result.registerA && code.size == site.call + 3
}

/** One flag read: the index of the check call and the check it calls, the config interface's or a static helper's. */
internal class SearchIconSite(val call: Int, val check: MethodReference)

private val CONFIG_HELPER_PARAMETERS = listOf("Ljava/lang/Object;", "J")

/**
 * Each read loads the flag into a register pair and passes it straight to a boolean check, whose answer the next
 * instruction moves out. 586 casts the config to its interface and asks that interface's (long) check. 587 hands the
 * config and the flag to a static (Object, long) helper that does the same, which [searchIconCheck] reads before any
 * edit. Any other use of the constant refuses the whole switch.
 */
internal fun Method.searchIconSites(): List<SearchIconSite> {
    fun refuse(): Nothing = throw PatchException("Messenger controls: the inbox search icon flag read in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    val sites = code.indices.filter { code[it].isSearchIconFlag() }.map { at ->
        val pair = (code[at] as OneRegisterInstruction).registerA
        val cast = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.CHECK_CAST } as? OneRegisterInstruction
        val callAt = if (cast == null) at + 1 else at + 2
        val invoke = code.getOrNull(callAt) as? FiveRegisterInstruction ?: refuse()
        val check = (invoke as? ReferenceInstruction)?.reference as? MethodReference ?: refuse()
        val through = invoke.registerCount == 3 && invoke.registerD == pair && invoke.registerE == pair + 1 &&
            invoke.registerC != pair && invoke.registerC != pair + 1 &&
            check.returnType == "Z" && code.getOrNull(callAt + 1)?.opcode == Opcode.MOVE_RESULT
        val form = if (cast != null) {
            invoke.opcode == Opcode.INVOKE_INTERFACE && invoke.registerC == cast.registerA &&
                (code[at + 1] as ReferenceInstruction).reference.toString() == check.definingClass &&
                check.parameterTypes.map { it.toString() } == listOf("J")
        } else {
            invoke.opcode == Opcode.INVOKE_STATIC && check.parameterTypes.map { it.toString() } == CONFIG_HELPER_PARAMETERS
        }
        if (!through || !form) refuse()
        SearchIconSite(callAt, check)
    }
    if (sites.isEmpty()) refuse()
    return sites
}

/**
 * The interface check a static (Object, long) helper asks: its whole body casts the config to the interface, asks the
 * check with the flag and returns the answer. Null for anything else.
 */
internal fun Method.configHelperCheck(): MethodReference? {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" ||
        parameterTypes.map { it.toString() } != CONFIG_HELPER_PARAMETERS) return null
    val impl = implementation ?: return null
    val code = impl.instructions.toList()
    if (code.map { it.opcode } != listOf(Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.RETURN) ||
        impl.tryBlocks.isNotEmpty()) return null
    val config = impl.registerCount - 3
    val cast = code[0] as OneRegisterInstruction
    val invoke = code[1] as FiveRegisterInstruction
    val check = (invoke as ReferenceInstruction).reference as MethodReference
    val answered = (code[2] as OneRegisterInstruction).registerA == (code[3] as OneRegisterInstruction).registerA
    return check.takeIf {
        cast.registerA == config && invoke.registerCount == 3 && invoke.registerC == config &&
            invoke.registerD == config + 1 && invoke.registerE == config + 2 && answered &&
            (code[0] as ReferenceInstruction).reference.toString() == it.definingClass &&
            it.returnType == "Z" && it.parameterTypes.map { p -> p.toString() } == listOf("J")
    }
}

internal fun MutableMethod.validateSearchBar() {
    searchIconSites()
}

/**
 * Each check call goes to the extension instead, with the same registers, so no instruction moves. The chat list's
 * builder, where Hide joined community chats proves its edit by instruction index, asks the getter and isn't edited.
 */
internal fun MutableMethod.injectSearchBar() {
    for (site in searchIconSites()) {
        val call = getInstruction<FiveRegisterInstruction>(site.call)
        replaceInstruction(site.call, "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $SEARCH_ICON_HELPER")
    }
}

/**
 * The one check every read calls, either directly or through a static helper. The extension's stand-in asks it on the
 * config from another package, so the owner has to be a public interface that declares it.
 */
internal fun searchIconCheck(readers: List<Method>, classDef: (String) -> ClassDef?): MethodReference {
    fun refuse(why: String): Nothing = throw PatchException("Messenger controls: the inbox search icon flag check $why")
    fun asked(check: MethodReference): MethodReference {
        if (check.parameterTypes.size == 1) return check
        val helper = classDef(check.definingClass)?.methods?.singleOrNull {
            it.name == check.name && it.parameterTypes.map { p -> p.toString() } == CONFIG_HELPER_PARAMETERS && it.returnType == "Z"
        } ?: refuse("is missing")
        return helper.configHelperCheck() ?: refuse("helper does more than ask the config")
    }
    val checks = readers.flatMap { it.searchIconSites() }.map { asked(it.check) }.distinctBy { it.toString() }
    val check = checks.singleOrNull() ?: refuse("isn't the same in every read")
    val owner = classDef(check.definingClass) ?: refuse("is missing")
    if (!AccessFlags.INTERFACE.isSet(owner.accessFlags) || !AccessFlags.PUBLIC.isSet(owner.accessFlags) || owner.methods.none {
            it.name == check.name && it.parameterTypes.map { p -> p.toString() } == listOf("J") && it.returnType == "Z" })
        refuse("isn't a public interface check")
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
    // The config arrives as Object, so the stub casts it to the check's interface first, the way Messenger does.
    built.addInstructionsWithLabels(0, """
        check-cast p0, ${check.definingClass}
        invoke-interface {p0, p1, p2}, $check
        move-result v0
        return v0
    """.trimIndent())
    return built
}
