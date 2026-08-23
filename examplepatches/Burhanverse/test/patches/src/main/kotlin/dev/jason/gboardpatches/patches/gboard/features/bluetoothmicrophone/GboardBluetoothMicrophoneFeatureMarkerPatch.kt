package dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardBluetoothMicrophoneFeatureMarkerPatch = resourcePatch(
    description = "標記 Use Bluetooth Microphone feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(BLUETOOTH_MICROPHONE_FEATURE_MARKER)
    }
}

internal const val BLUETOOTH_MICROPHONE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.bluetooth_microphone"
