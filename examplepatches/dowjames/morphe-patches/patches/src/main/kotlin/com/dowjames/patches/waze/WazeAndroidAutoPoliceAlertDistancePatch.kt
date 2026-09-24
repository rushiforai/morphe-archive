package com.dowjames.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.dowjames.patches.waze.WazeConstants.COMPATIBILITY_WAZE

private const val NEW_DISTANCE_METERS = 1200L

@Suppress("unused")
val wazeAndroidAutoPoliceAlertDistancePatch = bytecodePatch(
    name = "Android Auto police alert distance",
    description = "Increases the Android Auto heads-up (police/enforcement) alert distance to 1200m.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        NumericConfigGetterFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/waze/config/ConfigValues;->CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE:Lcom/waze/config/c;
                if-eq p0, v0, :force
                sget-object v0, Lcom/waze/config/ConfigValues;->CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_NORMAL:Lcom/waze/config/c;
                if-eq p0, v0, :force
                sget-object v0, Lcom/waze/config/ConfigValues;->CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_FREEWAY:Lcom/waze/config/c;
                if-eq p0, v0, :force
                goto :skip
                :force
                const-wide/16 v0, ${NEW_DISTANCE_METERS}
                invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object v0
                return-object v0
                :skip
            """
        )
    }
}
