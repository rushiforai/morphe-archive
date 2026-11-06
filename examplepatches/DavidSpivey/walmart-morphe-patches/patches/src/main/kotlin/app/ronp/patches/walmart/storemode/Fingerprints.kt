package app.ronp.patches.walmart.storemode

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

/**
 * Matches `InternalStoreModeApiImpl.clearStoreModeMessages()` (obfuscated name `f()V` in 26.42).
 *
 * It is the only method in the app that removes all three store mode in-app messages by tag,
 * so it pins down the `InternalStoreModeApiImpl` class without relying on obfuscated names.
 */
internal object InternalStoreModeApiClassFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf(
        "StoreModeSignInBottomSheetFragment",
        "StoreModeBottomSheetFragment",
        "InStorePromptFragment",
    ),
)

/**
 * Matches `InternalStoreModeApiImpl.onStoreStatusChanged(StoreStatus)` (obfuscated `h(...)V` in 26.42).
 *
 * The store mode banner calls this every time your in-store status changes. It runs a small
 * state machine (`when (state.ordinal)`), and when you have just walked into a store it queues
 * `StoreModeBottomSheetFragment` (or the sign-in sheet) as an automatic in-app popup.
 *
 * Tapping the store mode banner yourself opens the sheet through a different code path
 * (`StoreModeBottomSheetFragment().showNow(...)` in the banner's click handler), so that keeps working.
 */
internal object StoreStatusChangedFingerprint : Fingerprint(
    classFingerprint = InternalStoreModeApiClassFingerprint,
    returnType = "V",
    // Exactly one object parameter: the store status (com.walmart.glass.store.api.a in 26.42).
    parameters = listOf("L"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/Enum;",
            name = "ordinal",
        ),
        fieldAccess(
            definingClass = "Ljava/lang/Boolean;",
            name = "FALSE",
        ),
    ),
)
