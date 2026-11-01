/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.ads.HomeFields
import app.morphe.patches.pinterest.ads.homeFieldsOrNull
import app.morphe.patches.pinterest.ads.installHomeFields
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.requireStub
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.methodsWithString
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.patches.pinterest.ui.parameters
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val SAVE_AND_DOWNLOAD = "$EXTENSION_PACKAGE/actions/SaveAndDownload;"

/** Keeps its name. Its fields name the class that makes a quick save and the one every save goes through. */
internal const val PIN_CLOSEUP_PRESENTER = "Lcom/pinterest/feature/pin/closeup/presenter/OrganicPinCloseupPresenter;"

/**
 * Where Save pins you download and Download pins you save (#17) go in: the one method every save goes
 * through, the constructor of the class that makes a quick save, that quick save and its reason enum,
 * and the pin's two accessors for what Pinterest fills once it's saved.
 */
internal class SaveRoute(
    val pin: String,
    val save: Method,
    val builder: Method,
    val returns: List<Int>,
    val quickSave: Method,
    val reason: String,
    val board: MethodReference,
    val profile: MethodReference,
    val homeFields: HomeFields?,
)

/** Null when the build has no closeup presenter. Throws when it has one this can't read. */
internal fun BytecodePatchContext.saveRoute(pin: String): SaveRoute? {
    val presenter = classDefByOrNull(PIN_CLOSEUP_PRESENTER) ?: return null
    fun fail(why: String): Nothing = throw PatchException("Download pins: the save route $why")
    fun callable(method: Method) = AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags)
    fun held(name: String) = presenter.fields.singleOrNull { it.name == name && it.type.startsWith("L") }?.type
        ?: fail("has no $name field in the closeup presenter")
    val helperType = held("repinUtils")
    val actionType = held("pinAction")
    val helper = classDefByOrNull(helperType) ?: fail("names $helperType, which isn't in the app")
    val action = classDefByOrNull(actionType) ?: fail("names $actionType, which isn't in the app")
    if (!AccessFlags.PUBLIC.isSet(helper.accessFlags)) fail("keeps its quick save class private")
    // The method every save goes through is the one the presenter's own board save calls with the pin.
    val repin = presenter.methods.singleOrNull { it.name == "repinToBoard" } ?: fail("has no board save in the closeup presenter")
    val called = repin.calls().filter { it.definingClass == actionType && it.parameters().firstOrNull() == pin }
        .distinctBy { it.toString() }.singleOrNull() ?: fail("has no single call from the board save")
    val save = action.methods.singleOrNull { it.toString() == called.toString() && callable(it) }
        ?: fail("calls ${called.name}, which $actionType doesn't declare as a public method")
    val init = helper.methods.singleOrNull { it.name == "<init>" && it.implementation != null }
        ?: fail("has no single quick save constructor")
    val returns = init.instructions().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    if (returns.isEmpty()) fail("has a quick save constructor that never finishes")
    init.requireThisIntact("Download pins", returns)
    val quickSaves = helper.methods.filter { method ->
        method.returnType == "V" && callable(method) && method.parameters().dropLast(1) ==
            listOf(pin, "Z", "Ljava/lang/String;", "Z", "Z", "Lkotlin/jvm/functions/Function1;", "Ljava/lang/String;")
    }
    val quickSave = quickSaves.singleOrNull() ?: fail("has ${quickSaves.size} quick saves")
    val reason = quickSave.parameters().last()
    val reasons = classDefByOrNull(reason)?.takeIf { AccessFlags.PUBLIC.isSet(it.accessFlags) }
        ?: fail("has a quick save reason $reason it can't read")
    if (listOf("UNKNOWN", "HOME_FEED").any { name -> reasons.fields.none { it.name == name && it.type == reason && AccessFlags.PUBLIC.isSet(it.accessFlags) } }) {
        fail("has a quick save reason $reason with no UNKNOWN and HOME_FEED")
    }
    // A pin's JSON writer names each field right before reading it through the pin's own static accessor.
    val writers = methodsWithString("pinned_to_profile").filter { it.returnType == "V" && it.parameters().getOrNull(1) == pin }
    val written = (writers.singleOrNull() ?: fail("has ${writers.size} pin writers")).instructions()
    fun accessor(label: String): MethodReference {
        val at = written.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
        if (at < 0) fail("has a pin writer that doesn't name $label")
        return written.drop(at + 1).firstNotNullOfOrNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.takeIf { instruction.opcode == Opcode.INVOKE_STATIC && it.definingClass == pin && it.parameters() == listOf(pin) }
        } ?: fail("has no accessor for $label")
    }
    val board = accessor("pinned_to_board")
    val profile = accessor("pinned_to_profile")
    if (!board.returnType.startsWith("L") || board.returnType == "Ljava/lang/Boolean;") fail("reads a board that isn't an object")
    if (profile.returnType != "Ljava/lang/Boolean;") fail("reads a profile flag that isn't a Boolean")
    val owner = classDefByOrNull(pin) ?: fail("has no pin model $pin")
    for (read in listOf(board, profile)) {
        if (owner.methods.none { it.toString() == read.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) }) fail("can't reach ${read.name}")
    }
    for (stub in listOf("savePin", "alreadySaved")) requireStub(SAVE_AND_DOWNLOAD, stub)
    for (hook in listOf("saving", "saver")) {
        if (mutableClassDefBy(SAVE_AND_DOWNLOAD).methods.count { it.name == hook && AccessFlags.STATIC.isSet(it.accessFlags) } != 1) {
            fail("has no extension hook $hook")
        }
    }
    return SaveRoute(pin, save, init, returns, quickSave, reason, board, profile, homeFieldsOrNull())
}

/** Fills the two stubs, then hooks the save and hands each new quick-save helper to the extension. */
internal fun BytecodePatchContext.installSaveRoute(route: SaveRoute) = with(route) {
    val saver = quickSave.definingClass
    // The arguments Pinterest's closeup passes: its own Saved toast, shown straight away, and no
    // reason to run its after-save work. The stub casts in place first, then lines them up in order.
    writeStub(SAVE_AND_DOWNLOAD, "savePin", 11, """
        check-cast p0, $saver
        check-cast p1, $pin
        move-object v0, p0
        move-object v1, p1
        const/4 v2, 0x1
        const/4 v3, 0x0
        const/4 v4, 0x0
        const/4 v5, 0x0
        const/4 v6, 0x0
        const/4 v7, 0x0
        sget-object v8, $reason->UNKNOWN:$reason
        invoke-virtual/range { v0 .. v8 }, $quickSave
        return-void
    """)
    writeStub(SAVE_AND_DOWNLOAD, "alreadySaved", 2, """
        check-cast p0, $pin
        invoke-static { p0 }, $board
        move-result-object v0
        if-nez v0, :saved
        invoke-static { p0 }, $profile
        move-result-object v0
        if-eqz v0, :unsaved
        invoke-virtual { v0 }, Ljava/lang/Boolean;->booleanValue()Z
        move-result v0
        return v0
        :saved
        const/4 v0, 0x1
        return v0
        :unsaved
        const/4 v0, 0x0
        return v0
    """)
    // Home's pins never say they're saved unless the request asks, and a saved one would be saved again.
    homeFields?.let { installHomeFields(it) }
    mutable(save).addInstructions(0, "invoke-static/range { p1 .. p1 }, $SAVE_AND_DOWNLOAD->saving(Ljava/lang/Object;)V")
    val built = mutable(builder)
    returns.sortedDescending().forEach { at ->
        built.addInstructionsAtControlFlowLabel(at, "invoke-static/range { p0 .. p0 }, $SAVE_AND_DOWNLOAD->saver(Ljava/lang/Object;)V")
    }
}
