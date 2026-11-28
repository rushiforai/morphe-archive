package semicoloncolonel.mobilestream.patches.nikkeiasia.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.nikkeiasia.shared.Constants

// Nikkei Asia (Capacitor). The free-limit screen is ArticlePaywall (cOt):
//   {showBody:n,...}=t ... ,n)return null
// When showBody is true it returns null (no overlay). When false it draws
// "You've reached your free limit of articles".
//
// Force that guard to always succeed so the overlay never mounts.
// showPaywall:!i is only used for analytics (paywall_type / content_status).
//
// body:e?t.body:t.preview is unchanged — preview vs full HTML still follows
// whatever the API put on the article object.

private const val BUNDLE_FOLDER = "assets/public/assets"

// Unique in this build's main bundle (cOt early-return).
private const val PAYWALL_GUARD = ",n)return null;let h"
private const val PAYWALL_NEVER = ",!0)return null;let h"

// Optional: prefer full body field when the object has it (still no server spoof).
private const val BODY_PICK = "body:e?t.body:t.preview"
private const val BODY_FULL = "body:e?t.body:t.body"

private val hideArticlePaywallInBundlePatch = rawResourcePatch {
    execute {
        val bundles = get(BUNDLE_FOLDER).listFiles { file -> file.name.endsWith(".js") }.orEmpty()
        var guardHits = 0
        var bodyHits = 0

        bundles.forEach { file ->
            var text = file.readText()
            var changed = false

            if (PAYWALL_GUARD in text) {
                text = text.replace(PAYWALL_GUARD, PAYWALL_NEVER)
                guardHits += 1
                changed = true
            }

            // Best-effort: if both body and preview exist, always pass body into renderers.
            if (BODY_PICK in text) {
                val count = text.split(BODY_PICK).size - 1
                text = text.replace(BODY_PICK, BODY_FULL)
                bodyHits += count
                changed = true
            }

            if (changed) file.writeText(text)
        }

        if (guardHits < 1) {
            throw PatchException(
                "ArticlePaywall guard (,n)return null;let h) not found — bundle shape changed?",
            )
        }
    }
}

@Suppress("unused")
val hideArticlePaywallOverlayPatch = bytecodePatch(
    name = "Hide article paywall overlay",
    description = "Stops the free-limit ArticlePaywall screen from rendering. " +
        "Does not invent server-side article access.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideArticlePaywallInBundlePatch)
}