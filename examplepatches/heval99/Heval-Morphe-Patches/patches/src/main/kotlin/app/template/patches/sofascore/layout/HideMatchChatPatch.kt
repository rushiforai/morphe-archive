package app.template.patches.sofascore.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EXTENDED_FAB = "Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;"

// The chat button helper (R8-renamed, dn9.S in 26.10.26): static (ExtendedFloatingActionButton,
// Function0 onClick)V. It shows the button (the button's show motion), starts the animated chat
// icon when "PREF_CHAT_SHOW_ANIMATED_CHAT_ICON" is set and sets the click listener that opens the
// chat. The match page, the league / featured tournament page and the stage page call it.
internal object ChatButtonHelperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(EXTENDED_FAB, "Lkotlin/jvm/functions/Function0;"),
    filters = listOf(string("PREF_CHAT_SHOW_ANIMATED_CHAT_ICON")),
)

internal val HIDE_MATCH_CHAT = HevalFeature(
    id = "sofascore.hide_match_chat",
    name = "Hide chat",
    description = "Hides the chat button on match and league pages.",
    category = SofascoreControlsCategory.MATCH_PAGE,
)

/**
 * At the start of [this] (receiver or first parameter the button, p0): return at once while
 * SofascoreControls.hideChatButton says so. Only for void methods with a local register.
 */
private fun MutableMethod.returnWhenChatHidden(what: String) {
    if (returnType != "V") throw PatchException("$definingClass->$name returns $returnType, not V")
    if (implementation!!.registerCount - parameterTypes.size - (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) < 1) {
        throw PatchException("$definingClass->$name has no local register")
    }
    requireNoBranchTargetAt(0, what)
    addInstructionsWithLabelsChecked(
        0,
        """
            invoke-static/range { p0 .. p0 }, $SOFASCORE_CONTROLS->hideChatButton(Landroid/view/View;)Z
            move-result v0
            if-eqz v0, :heval_stock
            return-void
        """.trimIndent(),
        ExternalLabel("heval_stock", getInstruction(0)),
    )
}

// A Heval Controls feature, off in Manager by default (a new hide), on in Controls once selected.
@Suppress("unused")
val hideMatchChatPatch = sofascoreControls.featurePatch(
    HIDE_MATCH_CHAT,
    // The Manager patch keeps its name and description; only the Patch settings row was reworded (2026-11-11).
    name = "Hide match chat",
    description = "Hides the Chat button on match and league pages.",
    default = false,
) {
    // The chat button is the ExtendedFloatingActionButton with the id floating_action_button, the
    // only button with that id in the app's layouts (match, league, historical league and
    // collapsible header pages, always labelled "Chat"). The pages move it through the button's
    // motion method (show, hide, extend, shrink) and some set its visibility directly. Both hooks
    // let the extension set the chat button GONE and keep it GONE with a pre-draw guard; every
    // other button and the switch off are stock.
    val helper = ChatButtonHelperFingerprint.method

    // The motion method: the button's (I)V that the helper calls. ExtendedFloatingActionButton is
    // named in layouts, so it keeps its name; the motion method's own name is R8's.
    val motions = helper.instructions.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref ->
            it.opcode == Opcode.INVOKE_VIRTUAL && ref.definingClass == EXTENDED_FAB &&
                ref.returnType == "V" && ref.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
    }.distinct()
    val motionRef = motions.singleOrNull()
        ?: throw PatchException("Chat button helper: expected one motion call, found $motions")
    val motion = mutableClassDefBy(EXTENDED_FAB).methods.singleOrNull {
        it.name == motionRef.name && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("I") && it.implementation != null
    } ?: throw PatchException("$EXTENDED_FAB does not declare ${motionRef.name}(I)V")

    // Validate both sites before the first edit.
    helper.requireNoBranchTargetAt(0, "chat button helper")
    motion.requireNoBranchTargetAt(0, "chat button motion")
    helper.returnWhenChatHidden("chat button helper")
    motion.returnWhenChatHidden("chat button motion")
}
