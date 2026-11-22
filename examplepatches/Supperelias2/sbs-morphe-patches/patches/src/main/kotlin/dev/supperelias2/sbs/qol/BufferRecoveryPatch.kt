package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

private const val RECOVERY_MANAGER = "Lcom/sbs/ondemand/player/viewmodels/PlayerManager;"
private const val RECOVERY_HOOKS = "Ldev/supperelias2/sbs/morphe/features/BufferRecoveryHooks;"
private val recoveryInitialize = Fingerprint(
    definingClass = RECOVERY_MANAGER,
    name = "initializePlayer",
    returnType = "V",
    parameters = listOf("Landroidx/media3/ui/PlayerView;")
)
private val recoveryRelease = Fingerprint(
    definingClass = RECOVERY_MANAGER,
    name = "release",
    returnType = "V",
    parameters = emptyList()
)

@Suppress("unused")
val boundedBufferRecoveryPatch = bytecodePatch(
    name = "Experimental: bounded VOD buffer recovery",
    description = "Experimental opt-in restart after 25 seconds of continuous direct-VOD buffering, with at most two attempts per media session. Live, ads, DRM and player errors are excluded.",
    default = true
) {
    category("Experimental")
    compatibleWith(Compatibility(
        name = "SBS On Demand",
        packageName = "com.sbs.ondemand.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xDCBD1D,
        targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
    ))
    dependsOn(settingsPatch)
    execute {
        registerFeature("buffer_recovery")
        recoveryInitialize.method.apply {
            implementation!!.instructions.indices.reversed().filter {
                getInstruction(it).opcode == Opcode.RETURN_VOID
            }.forEach { index ->
                replaceInstruction(index, "invoke-static/range {p0 .. p0}, $RECOVERY_HOOKS->onPlayerReady(Ljava/lang/Object;)V")
                addInstructions(index + 1, "return-void")
            }
        }
        recoveryRelease.method.addInstructions(
            0,
            "invoke-static/range {p0 .. p0}, $RECOVERY_HOOKS->onPlayerReleased(Ljava/lang/Object;)V"
        )
    }
}
