package app.discord.patches.composer

/**
 * The chat composer buttons (+ upload, gift, emoji/sticker, mic) are NOT
 * native UI and have NO smali method to fingerprint. The composer root
 * layout (res/layout/chat_input_root_view.xml) holds only the DCDChatInput
 * EditText; the accessory buttons are the React Native actions array built
 * inside assets/index.android.bundle (Hermes bytecode v98 in all builds).
 *
 * Composer functions (all: props canStartThreads/channel/
 * isAppLauncherEnabled/keyboardType/onPressAction/
 * shouldPhotosButtonBeDisabled/shouldShowGiftButton/canUpload/canPostPolls
 * + CHAT_INPUT_ACTION_BUTTON_SIZE/MARGIN/GAP metrics, NITRO_GIFT vs THREAD
 * conditional push, no try/catch):
 *
 * - 343.12 Stable: fn 51985 (offset 30961797, 1391 bytes, frame 255).
 *   NITRO_GIFT GetById at fn offset 1054, gift push Call2 at file offset
 *   30962861.
 * - 342.16 Stable: fn 51714 (offset 30850567, 1347 bytes, frame 255).
 *   NITRO_GIFT GetById at fn offset 1002, gift push Call2 at file offset
 *   30851579.
 * - 341.13 Stable: fn 51354 (offset 30702447, 1347 bytes, frame 255).
 *   NITRO_GIFT GetById at fn offset 1002, gift push Call2 at file offset
 *   30703459.
 *
 * The shouldShowGiftButton prop itself is read in two functions per
 * version: the actions row (gift-push Call2 neutered; neutering the push
 * rather than the flag preserves the stock gift-XOR-thread fallback) and
 * ChatInputRightActions, the visible [gift?, emoji] composer row, where
 * the prop load itself is forced to false (verified single write + single
 * test per function; the false path renders emoji alone, stock behavior).
 *
 * RightActions functions (all: channel/keyboardType/showKeyboardIcon/
 * shouldShowGiftButton/onPressAction/onPressExpression + TransitionItem
 * gift child vs EXPRESSION button, no try/catch):
 *
 * - 343.12 Stable: fn 52671 (offset 31111162, 505 bytes, 107 instrs).
 * - 342.16 Stable: fn 52380 (offset 30994107, 505 bytes, 107 instrs).
 * - 341.13 Stable: fn 52020 (offset 30845510, 501 bytes, 107 instrs).
 *
 * v1.1.0 only patched the actions row and the composer gift survived;
 * v1.1.1 adds the RightActions surface.
 *
 * This file is notes-only; there is no Fingerprint to declare here.
 */
object ComposerTargetNotes {
    const val BUNDLE_ASSET = "assets/index.android.bundle"
}
