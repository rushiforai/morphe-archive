package patches.gboard.features.bluetoothmicrophone

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardBluetoothMicrophoneFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the Bluetooth microphone exact flag policy after the approved rollout flag getter.",
    feature = GboardFlagFamilyFeature.USE_BLUETOOTH_MICROPHONE,
)
