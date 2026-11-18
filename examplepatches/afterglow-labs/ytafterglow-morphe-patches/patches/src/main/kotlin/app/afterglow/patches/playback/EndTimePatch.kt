package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.video.installAtStartup
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal val endTimeHookPatch = bytecodePatch {
    dependsOn(videoStatePatch)
    execute {
        val label = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("Landroid/view/View;"), filters = listOf(
                resourceLiteral(ResourceType.ID, "time_bar_total_time"),
                checkCast("Landroid/widget/TextView;", MatchAfterWithin(5))
            ))
        val match = label.instructionMatches.last()
        val register = (label.method.implementation!!.instructions[match.index] as OneRegisterInstruction).registerA
        label.method.addInstruction(match.index + 1,
            "invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/PlayerEndTime;->bind(Landroid/widget/TextView;)V")
        installAtStartup("$EXTENSION_PACKAGE/playback/PlayerEndTime;")
        println("Afterglow playback end time: ${label.method.definingClass}->${label.method.name}")
    }
}
