/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.branchTarget
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.one
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide popular apps"
internal const val POPULAR_APPS = "$EXTENSION_PACKAGE/misc/PopularApps;"
internal const val GET_POPULAR_APP_BOTS = "Lorg/telegram/tgnet/tl/TL_bots\$getPopularAppBots;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val STRINGS = "Lorg/telegram/messenger/R\$string;"

@Suppress("unused")
val hidePopularAppsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the Popular apps list on the Apps tab of search and stops Telegram from loading it. On by " +
        "default. Turn it off in HushTelegram settings > Ads. Two more switches there start off. Search only my " +
        "chats keeps search to your own chats and contacts, with nothing public. Find names in styled letters finds " +
        "names written in decorative letters when you type plain ones.",
    default = true,
) {
    category("Search")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hidePopularApps")
        requireStatusMethod("myChatsSearch")
        requireNameFoldRuntime()
        requireNewChatsBlockRuntime()
        // Every target, borrowed register and runtime call of both switches is checked before the first edit.
        val sites = resolvePopularAppsSites()
        val search = resolveMyChatsSearch()
        val popular = listOf(sites.load, sites.section)
        val searched = search.chat.edits.map { it.method } + listOf(search.tabs.update, search.downloads.method, search.hashtag.search,
            search.found.read, search.stories.method)
        shape(popular.none { method -> searched.any { it === method } }, "search only my chats shares a method with the Apps tab")
        search.rehearse()
        // The styled names switch rides along while the catalog is held. A build without its shape keeps
        // the rest of the patch and leaves the switch out.
        val fold = resolveNameFold()
        // Blocking new chats rides along the same way, a parental control that's all there or not at all.
        val chats = resolveNewChatsBlock()
        shape(chats.sites.none { site -> (popular + searched).any { it === site.method } }, "blocking new chats shares a method with search")
        // The runtime's stubs first: on their own nothing calls them.
        writeMyChatsSearchStubs(search)
        sites.apply()
        search.apply()
        enableCapability("myChatsSearch")
        if (fold.missing == null) {
            fold.apply()
            enableCapability("nameFold")
        } else {
            patchLog.warning("$PATCH: ${fold.missing}. The patch goes on without finding names in styled letters.")
        }
        if (chats.missing == null) {
            chats.apply()
            enableCapability("blockNewChats")
        } else {
            patchLog.warning("$PATCH: ${chats.missing}. The patch goes on without blocking new channels and groups.")
        }
        enableStatus("hidePopularApps")
    }
}

/**
 * [load] is the popular-apps loader, the only code that builds getPopularAppBots. [section] is the
 * Apps tab's fill, where [read] loads the loader's list and [empty] is where Telegram goes when
 * that list is empty, not loading and fully loaded: the section adds nothing from there.
 */
internal class PopularAppsSites(val load: MutableMethod, val section: MutableMethod, val read: Int, val empty: Int)

internal fun BytecodePatchContext.resolvePopularAppsSites(): PopularAppsSites {
    requireRuntimeHooks()
    val builders = mutableListOf<Method>()
    forEachClassMentioning(Mention.type(GET_POPULAR_APP_BOTS)) { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@forEachClassMentioning
        classDef.methods.filterTo(builders) { method -> method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.type() == GET_POPULAR_APP_BOTS } }
    }
    val builder = builders.one("getPopularAppBots builder", ::refuse)
    val loaderType = builder.definingClass
    shape(!AccessFlags.STATIC.isSet(builder.accessFlags) && builder.parameterTypes.isEmpty() && builder.returnType == "V",
        "the popular apps loader is no longer an instance method with no arguments")
    val load = mutableClassDefBy(loaderType).methods.single { it.name == builder.name && it.parameterTypes.isEmpty() && it.returnType == "V" }

    // The loader keeps its list in its one ArrayList field, and says it is loading by setting a
    // boolean to true right after checking it.
    val loaderClass = classDefBy(loaderType)
    val list = loaderClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == ARRAY_LIST }.one("loader list field", ::refuse)
    val loadBody = load.instructions()
    shape(loadBody.size > 2 && loadBody[0].opcode == Opcode.IGET_BOOLEAN && loadBody[1].opcode == Opcode.IF_NEZ,
        "the loader no longer starts by checking whether it is loading")
    val loading = loadBody[0].field()!!
    shape(loading.definingClass == loaderType && loadBody.any { it.opcode == Opcode.IPUT_BOOLEAN && it.field() == loading },
        "the loader no longer marks itself loading")
    val finishedReads = loadBody.filter { it.opcode == Opcode.IGET_BOOLEAN && it.field() != loading && it.field()?.definingClass == loaderType }
    val finished = finishedReads.firstOrNull()?.field() ?: refuse("the loader no longer checks whether it has loaded everything")

    // The Apps tab: the one method that reads the list and names the Popular heading.
    val fills = mutableListOf<Method>()
    forEachClassMentioning(Mention.member(list.definingClass, list.name) and Mention.member(STRINGS, "SearchAppsPopular")) { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@forEachClassMentioning
        classDef.methods.filterTo(fills) { method -> method.instructions().let { body ->
            body.any { it.opcode == Opcode.IGET_OBJECT && it.field() == list } &&
                body.any { it.opcode == Opcode.SGET && it.field()?.let { field -> field.definingClass == STRINGS && field.name == "SearchAppsPopular" } == true }
        } }
    }
    val fill = fills.one("Apps tab fill", ::refuse)
    val section = mutableClassDefBy(fill.definingClass).methods.single { it.name == fill.name &&
        it.parameterTypes.map(CharSequence::toString) == fill.parameterTypes.map(CharSequence::toString) && it.returnType == fill.returnType }
    val body = section.instructions()
    val read = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].field() == list }.one("list read in the Apps tab", ::refuse)
    val listRegister = body[read].namedRegisters()[0]
    val owner = body[read].namedRegisters()[1]
    // isEmpty() on the list, and its true branch.
    shape(body.getOrNull(read + 1)?.call()?.let { it.definingClass == ARRAY_LIST && it.name == "isEmpty" } == true &&
        body[read + 1].namedRegisters() == listOf(listRegister) && body[read + 2].opcode == Opcode.MOVE_RESULT &&
        body[read + 3].opcode == Opcode.IF_NEZ && body[read + 3].namedRegisters() == body[read + 2].namedRegisters(),
        "the Apps tab no longer checks whether the popular list is empty")
    val emptyBranch = body.branchTarget(read + 3, ::refuse)
    // Empty: loading shows placeholders, a list with more to load shows them too, a finished list adds nothing.
    shape(body[emptyBranch].isFieldRead(Opcode.IGET_BOOLEAN, loading, owner) && body[emptyBranch + 1].opcode == Opcode.IF_NEZ &&
        body[emptyBranch + 2].isFieldRead(Opcode.IGET_BOOLEAN, finished, owner) && body[emptyBranch + 3].opcode == Opcode.IF_NEZ,
        "the empty popular list no longer checks loading and then whether it is finished")
    val empty = body.branchTarget(emptyBranch + 3, ::refuse)
    shape(body[empty].opcode == Opcode.CONST_4 && (body[empty] as NarrowLiteralInstruction).narrowLiteral == 0,
        "a finished, empty popular list no longer clears the section's footer flag")
    val footerFlag = body[empty].namedRegisters()[0]
    shape(body.getOrNull(empty + 1)?.let { it.opcode == Opcode.IF_EQZ && it.namedRegisters() == listOf(footerFlag) } == true,
        "the section's footer no longer depends on what the popular list added")
    shape(read < emptyBranch && emptyBranch < empty, "the popular section is no longer laid out in order")
    return PopularAppsSites(load, section, read, empty)
}

private fun PopularAppsSites.apply() {
    // A hidden section jumps to where a finished, empty list goes, so it adds no heading, row or placeholder.
    val answer = section.freeLocalsAt(PATCH, read, 1, targets = listOf(empty), highest = 255).single()
    section.addInstructionsAtControlFlowLabel(read, """
        invoke-static {}, $POPULAR_APPS->hideSection()Z
        move-result v$answer
        if-nez v$answer, :hush_done
    """.trimIndent(), ExternalLabel("hush_done", section.getInstruction(empty)))

    val skip = load.freeLocalsAt(PATCH, 0, 1, highest = 255).single()
    load.addInstructionsAtControlFlowLabel(0, """
        invoke-static {}, $POPULAR_APPS->skipLoad()Z
        move-result v$skip
        if-eqz v$skip, :hush_stock
        return-void
        :hush_stock
        nop
    """.trimIndent())
}

private fun BytecodePatchContext.requireRuntimeHooks() {
    val owner = classDefByOrNull(POPULAR_APPS)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public popular apps runtime")
    for (name in listOf("skipLoad", "hideSection")) {
        shape(owner!!.methods.count { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "Z" &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation?.instructions?.any { instruction -> !instruction.opcode.format.isPayloadFormat } == true } == 1,
            "no callable public static runtime $name")
    }
}

private fun Instruction.isFieldRead(opcode: Opcode, field: FieldReference, owner: Int) =
    this.opcode == opcode && field() == field && namedRegisters().getOrNull(1) == owner
private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed popular apps geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.type(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
@Suppress("unused")
private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
