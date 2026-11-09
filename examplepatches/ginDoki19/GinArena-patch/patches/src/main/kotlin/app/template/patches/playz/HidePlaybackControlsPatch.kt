package app.template.patches.playz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYZ_TV
import org.w3c.dom.Element

/** Experimental: suppress Media3 automatic controller display in the main player only. */
private val startupControllerPolicy = resourcePatch() {
    compatibleWith(COMPATIBILITY_PLAYZ_TV)
    execute {
        check(packageMetadata.packageName == "com.playz.tv" &&
              packageMetadata.versionName == "2.3.1" && packageMetadata.versionCode == "8") {
            "Unsupported app/version for playback controls patch."
        }
        val androidNs = "http://schemas.android.com/apk/res/android"
        val appNs = "http://schemas.android.com/apk/res-auto"
        document("res/layout/activity_player.xml").use { doc ->
            val nodes = doc.getElementsByTagName("androidx.media3.ui.PlayerView")
            val views = (0 until nodes.length).map { nodes.item(it) as Element }.filter {
                it.getAttributeNS(androidNs, "id") == "@id/player_view"
            }
            check(views.size == 1) { "Expected one main PlayerView; found ${views.size}." }
            val view = views.single()
            check(view.getAttributeNS(appNs, "controller_layout_id") == "@layout/player_controller" &&
                  view.getAttributeNS(appNs, "auto_show") == "true") {
                "Unexpected main-player controller layout or auto_show; refusing to patch."
            }
            view.setAttributeNS(appNs, "app:auto_show", "false")
        }
    }
}


private object FullscreenToggle : Fingerprint(
    definingClass = "Lcom/playz/tv/activities/PlayerActivity;", name = "I", returnType = "V", parameters = emptyList(),
)
private object MainPlayerHide : Fingerprint(
    definingClass = "Landroidx/media3/ui/PlayerView;", name = "b", returnType = "V", parameters = emptyList(),
)

@Suppress("unused")
val hidePlaybackControlsPatch = bytecodePatch(
    name = "Hide playback controls at stream open",
    description = "Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PLAYZ_TV)
    dependsOn(startupControllerPolicy)
    execute {
        check(packageMetadata.packageName == "com.playz.tv" && packageMetadata.versionName == "2.3.1" &&
              packageMetadata.versionCode == "8") { "Unsupported app/version for fullscreen controls patch." }
        val hide = MainPlayerHide.method.instructions.toList()
        val hideCall = (hide.getOrNull(2) as? ReferenceInstruction)?.reference as? MethodReference
        check(hide.size == 4 && hide[0].opcode == Opcode.IGET_OBJECT && hide[1].opcode == Opcode.IF_EQZ &&
              hide[2].opcode == Opcode.INVOKE_VIRTUAL && hideCall?.definingClass == "Li4/r;" &&
              hideCall.name == "g" && hideCall.returnType == "V" && hideCall.parameterTypes.isEmpty() &&
              hide[3].opcode == Opcode.RETURN_VOID) { "Unexpected PlayerView hide implementation; refusing to patch." }
        val toggle = FullscreenToggle.method
        val insns = toggle.instructions.toList()
        check(toggle.implementation?.registerCount == 4 && insns.size == 58) { "Unexpected fullscreen toggle." }
        val viewLoads = insns.filter { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "Lcom/playz/tv/activities/PlayerActivity;" &&
                ref.name == "f0" && ref.type == "Landroidx/media3/ui/PlayerView;" &&
                (instruction as? TwoRegisterInstruction)?.registerA == 0 &&
                (instruction as? TwoRegisterInstruction)?.registerB == 3
        }
        check(viewLoads.size == 2) { "Unexpected fullscreen player field; refusing to patch." }
        val refs = insns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        check(refs.count { it.definingClass == "Landroid/app/Activity;" && it.name == "setRequestedOrientation" } == 2 &&
              refs.count { it.definingClass == "Landroidx/media3/ui/PlayerView;" && it.name == "setResizeMode" } == 2 &&
              refs.none { it.definingClass == "Landroidx/media3/ui/PlayerView;" && it.name == "b" }) {
            "Unexpected fullscreen operations; refusing to patch."
        }
        val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_VOID }
        check(returns.size == 2 && returns.all { index ->
            val prev = insns[index - 1]
            val ref = (prev as? ReferenceInstruction)?.reference as? FieldReference
            prev.opcode == Opcode.IPUT_BOOLEAN && (prev as? TwoRegisterInstruction)?.registerB == 3 &&
                ref?.definingClass == "Lcom/playz/tv/activities/PlayerActivity;" && ref.name == "s0" && ref.type == "Z"
        }) { "Unexpected fullscreen exit branches; refusing to patch." }
        // Insertion before a branch-targeted return could otherwise be skipped.
        val pcs = insns.runningFold(0) { pc, instruction -> pc + instruction.codeUnits }
        val stateRef = (insns[0] as? ReferenceInstruction)?.reference as? FieldReference
        check(insns[0].opcode == Opcode.IGET_BOOLEAN && stateRef?.definingClass == "Lcom/playz/tv/activities/PlayerActivity;" &&
              stateRef.name == "s0" && stateRef.type == "Z" &&
              (insns[0] as? TwoRegisterInstruction)?.registerA == 0 &&
              (insns[0] as? TwoRegisterInstruction)?.registerB == 3 &&
              insns[2].opcode == Opcode.IF_EQZ &&
              (insns[2] as? com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction)?.registerA == 0 &&
              pcs[2] + ((insns[2] as? OffsetInstruction)?.codeOffset ?: Int.MIN_VALUE) == pcs[returns.first() + 1]) {
            "Unexpected fullscreen branch structure; refusing to patch."
        }
        val returnPcs = returns.map { pcs[it] }.toSet()
        check(insns.indices.none { i ->
            val branch = insns[i] as? OffsetInstruction
            branch != null && pcs[i] + branch.codeOffset in returnPcs
        }) { "Fullscreen return is branch-targeted; refusing to patch." }
        returns.asReversed().forEach { index ->
            toggle.addInstructions(index, """
                iget-object v0, p0, Lcom/playz/tv/activities/PlayerActivity;->f0:Landroidx/media3/ui/PlayerView;
                invoke-virtual {v0}, Landroidx/media3/ui/PlayerView;->b()V
            """)
        }
    }
}
