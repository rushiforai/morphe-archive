package patches.gboard.features.toprowswipe

import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallId

internal val TOP_ROW_SWIPE_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_PATCH_INCOMING_SOFT_KEY_METADATA,
).owner
