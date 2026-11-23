package patches.gboard.features.clipboard

import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallId

internal val CLIPBOARD_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.CLIPBOARD_RUNTIME_AFTER_ADAPTER_TRIM,
).owner
internal const val CLIPBOARD_LOADER_CALLABLE_CLASS = "Llgo;"
internal const val CLIPBOARD_PRUNE_CALLABLE_CLASS = "Lljp;"
internal const val CLIPBOARD_ADAPTER_CLASS = "Llii;"
internal const val CLIPBOARD_KEYBOARD_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;"
internal const val RECYCLER_VIEW_HOLDER_CLASS = "Lra;"
