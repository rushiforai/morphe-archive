package app.template.patches.redditsync.removeprivacy

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Confirmed by hand from real resources (via apktool): the only way to reach the
 * "Privacy" screen (res/xml/cat_analytics.xml — privacy policy link, the Crashlytics
 * toggle, "Delete Firebase installation ID", "Revoke GDPR consent for ads") is a
 * single RootPreference entry titled "Privacy" in res/xml/cat_root.xml's "Other"
 * category. No other screen, onboarding flow, or code path references
 * cat_analytics.xml. With the removeTelemetryPatch bundle already forcing Crashlytics
 * and Analytics off unconditionally and ads off entirely, this whole screen has
 * nothing left to do.
 *
 * Removing the single navigation entry makes every class this screen would have used
 * permanently unreachable — nothing ever constructs or calls into them again, which
 * is the practical equivalent of deleting that code. This patcher's API has no way to
 * excise classes from the compiled app outright (confirmed: no such method exists on
 * BytecodePatchContext or anywhere else in the patcher), so removing the entry point
 * and the now-orphaned resource file is as thorough a cleanup as is possible here.
 */
val removePrivacySectionPatch = resourcePatch(
    name = "Remove Privacy section",
    description = "Removes the \"Privacy\" entry (privacy policy link, Crashlytics toggle, " +
        "\"Delete Firebase installation ID\", \"Revoke GDPR consent for ads\") from Sync for " +
        "Reddit's settings, now that telemetry and ads have already been removed.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("res/xml/cat_root.xml").use { document ->
            val root = document.documentElement
            val entries = root.getElementsByTagName("*")

            var privacyEntry: Element? = null
            for (i in 0 until entries.length) {
                val element = entries.item(i) as? Element ?: continue
                val localTag = element.localName ?: element.tagName.substringAfterLast('.')
                if (!localTag.endsWith("RootPreference")) continue

                val title = element.attributes?.let { attrs ->
                    (0 until attrs.length)
                        .map { attrs.item(it) }
                        .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "title" }
                        ?.nodeValue
                }

                if (title == "Privacy") {
                    privacyEntry = element
                    break
                }
            }

            val entry = privacyEntry ?: error(
                "Could not find the \"Privacy\" entry in res/xml/cat_root.xml. The structure " +
                    "may differ from what was inspected, or another patch already removed it.",
            )

            entry.parentNode?.removeChild(entry)
        }

        delete("res/xml/cat_analytics.xml")
    }
}
