package dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardBluetoothMicrophoneFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "在已核准 rollout flag getter 後套用 Bluetooth microphone exact flag policy。",
    feature = GboardFlagFamilyFeature.USE_BLUETOOTH_MICROPHONE,
)
