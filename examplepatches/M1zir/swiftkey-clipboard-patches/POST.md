# Suggested announcement

I made an experimental Morphe patch for **SwiftKey 9.13.19.3** that keeps local
clipboard entries beyond the one-hour expiration. Select **Keep clipboard history
forever**. Pinning and manual deletion still work, and the patch fixes sorting
for entries weeks apart. Device storage and memory still set practical limits;
cloud clipboard behavior is unchanged.

Version 0.3.1 corrects **Restore Arabic 123 legacy layout**. Enable this patch,
then choose **Arabic 123 - Legacy** under SwiftKey → Languages → your Arabic
language. It restores the original built-in layout as an additional choice and
keeps the current layouts and default. It uses و as the third bottom-row letter
without a separate ؤ key. Reselect the legacy layout if updating from v0.3.0.

Based on murilosimao/swiftkey-patch v0.1.1, with GPL-3.0 attribution preserved.
The bundle retains the original optional toolbar and privacy patches.

Validated against Microsoft's original ARM64 APK using Morphe Desktop 2.1.1,
strict fingerprint checks, and emitted-bytecode execution-model tests.
Android Manager import and real-device behavior still need confirmation.

Download: https://github.com/M1zir/swiftkey-clipboard-patches/releases/tag/v0.3.1

Import the MPP in Morphe under Sources → Add → Local, apply it to an original
9.13.19.3 APK, and enable “Remember copied items” in SwiftKey. Existing expired
clips cannot be recovered.
