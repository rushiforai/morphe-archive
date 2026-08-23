package dev.jason.gboardpatches.patches.gboard.features.clipboard

import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

internal val CLIPBOARD_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.CLIPBOARD_RUNTIME_AFTER_ADAPTER_TRIM,
).owner
internal const val CLIPBOARD_LOADER_CALLABLE_CLASS = "Leun;"
internal const val CLIPBOARD_PRUNE_CALLABLE_CLASS = "Levu;"
internal const val CLIPBOARD_ADAPTER_CLASS = "Levn;"
internal const val CLIPBOARD_KEYBOARD_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;"
internal const val RECYCLER_VIEW_HOLDER_CLASS = "Lkl;"
