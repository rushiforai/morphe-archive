package dev.jason.gboardpatches.patches.gboard.features.wisprflow

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardWisprFlowResourcePatch = resourcePatch(
    description = "Add the Wispr Flow toolbar feature marker and microphone icon.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize {
        applyFeatureMarker("dev.jason.gboardpatches.feature.wispr_flow")
        val icon = this["res/drawable/ic_wispr_flow.xml", false]
        icon.parentFile.mkdirs()
        icon.writeText(
            """
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp" android:viewportWidth="24"
                android:viewportHeight="24">
                <path android:fillColor="@android:color/transparent"
                    android:strokeColor="#FF202124" android:strokeWidth="2"
                    android:strokeLineJoin="round" android:strokeLineCap="round"
                    android:pathData="M9,5 A3,3 0,0 1,15 5 L15,11 A3,3 0,0 1,9 11 Z M6,10 L6,11 A6,6 0,0 0,18 11 L18,10 M12,17 L12,21 M9,21 L15,21"/>
            </vector>
            """.trimIndent(),
        )
    }
}
