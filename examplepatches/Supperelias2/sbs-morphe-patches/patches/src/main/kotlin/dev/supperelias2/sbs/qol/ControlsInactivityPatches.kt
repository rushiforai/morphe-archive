package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

private const val GENERAL = "Ldev/supperelias2/sbs/morphe/features/GeneralHooks;"
private const val UI = "Lcom/sbs/ondemand/player/viewmodels/PlayerUiStateController;"
private const val PLAYER_VM = "Lcom/sbs/ondemand/player/viewmodels/PlayerViewModel;"

private val controlsMobile640 = Compatibility(
    name = "SBS On Demand", packageName = "com.sbs.ondemand.android",
    apkFileType = ApkFileType.APKM, appIconColor = 0xDCBD1D,
    targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
)

private val controlsDelay = Fingerprint(
    definingClass = "Lcom/sbs/ondemand/player/viewmodels/PlayerUiStateController\$resetControlsHideTimer\$1;",
    name = "invokeSuspend", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;")
)
private val resetControlsTimer = Fingerprint(
    definingClass = UI, name = "resetControlsHideTimer", returnType = "V", parameters = emptyList()
)

@Suppress("unused")
val controlsTimeoutPatch = bytecodePatch(
    name = "Experimental: controls timeout",
    description = "Adds an opt-in controls timeout to Morphe settings. Normal three-second behavior is preserved by default.",
    default = true
) {
    category("Experimental")
    compatibleWith(controlsMobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("controls_timeout")
        val method = controlsDelay.method
        val constants = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode in setOf(Opcode.CONST_WIDE, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_HIGH16) &&
                (instruction as? WideLiteralInstruction)?.wideLiteral == 3000L
        }
        check(constants.size == 1) { "Unexpected SBS controls timer layout" }
        val constant = constants.single()
        val register = (constant.value as OneRegisterInstruction).registerA
        method.addInstructions(constant.index + 1, """
            invoke-static/range {v$register .. v${register + 1}}, $GENERAL->controlsTimeout(J)J
            move-result-wide v$register
        """)
    }
}

@Suppress("unused")
val cleanPauseControlsPatch = bytecodePatch(
    name = "Experimental: clean paused picture",
    description = "Adds opt-in hiding of controls while paused, using the synchronized SBS visibility path. Off by default.",
    default = true
) {
    category("Experimental")
    compatibleWith(controlsMobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("clean_pause_overlay")
        resetControlsTimer.method.addInstructions(
            0, "invoke-static/range {p0 .. p0}, $GENERAL->onControlsTimerReset(Ljava/lang/Object;)V"
        )
    }
}

@Suppress("unused")
val stillWatchingPatch = bytecodePatch(
    name = "Experimental: uninterrupted watching",
    description = "Adds an opt-in switch to stop inactivity prompts and their player exit. Long-pause stream refresh is preserved.",
    default = true
) {
    category("Experimental")
    compatibleWith(controlsMobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("disable_still_watching")
        listOf("startUserInactivityTimer", "showInactivityPrompt", "exitDueToInactivity").forEach { name ->
            val method = Fingerprint(definingClass = PLAYER_VM, name = name, returnType = "V", parameters = emptyList()).method
            check(method.implementation!!.registerCount >= 2) { "No scratch register in SBS $name" }
            method.addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p0}, $GENERAL->blockInactivity(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbs_normal_inactivity
                return-void
                :sbs_normal_inactivity
                nop
            """)
        }
    }
}
