package app.template.patches.telegram.content

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY

/**
 * The former ChatPullingDownDrawable implementation is not present under its old
 * class/method names in Telegram/Web 13.1.1 or Plus 13.1.1.0 DEX sets.
 * The old three fingerprints therefore must
 * not be required: doing so is exactly what caused the 12.10.4 patch failure.
 *
 * This patch intentionally becomes a compatibility-safe no-op until a stable
 * semantic channel-switch hook can be identified without disabling Telegram's
 * generic RecyclerView edge-pull behavior.
 */
@Suppress("unused")
val telegramDisableChannelSwitchingPatch = bytecodePatch(
    name = "Disable channel switching",
    description = "Currently a compatibility-safe no-op: the channel-switch gesture target still needs a verified implementation.",
    default = false,
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )
    execute {
        // No unsafe replacement is applied to the audited current targets.
        // The obsolete ChatPullingDownDrawable hooks are absent from all three
        // inspected APKs, so leaving this patch as a no-op prevents a false
        // positive hook from breaking the rest of the patch set.
    }
}