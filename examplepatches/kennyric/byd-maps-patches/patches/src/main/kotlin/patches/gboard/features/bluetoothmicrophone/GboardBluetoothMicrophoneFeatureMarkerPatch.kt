package patches.gboard.features.bluetoothmicrophone

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardBluetoothMicrophoneFeatureMarkerPatch = resourcePatch(
    description = "Mark the Use Bluetooth Microphone feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(BLUETOOTH_MICROPHONE_FEATURE_MARKER)
    }
}

internal const val BLUETOOTH_MICROPHONE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.bluetooth_microphone"
