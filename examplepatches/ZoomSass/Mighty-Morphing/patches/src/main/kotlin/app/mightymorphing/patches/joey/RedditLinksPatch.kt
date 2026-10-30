package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element

private const val EXTENSION = "Lapp/mightymorphing/extension/joey/RedditLinks;"

private val ADDITIONAL_REDDIT_HOSTS = listOf(
    "www.reddit.com",
    "old.reddit.com",
    "new.reddit.com",
    "np.reddit.com",
    "m.reddit.com",
    "s.reddit.com",
    "sh.reddit.com",
    "mod.reddit.com",
    "applink.reddit.com",
    "c.redditmail.com",
    "click.redditmail.com",
    "reddit.onelink.me",
)

private const val OPEN_REDDIT_LINK = """
    invoke-static {p0, p1, p2}, $EXTENSION->open(ZLandroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
    if-eqz p2, :done
    invoke-static {p0, p2, p1}, Lfb/b;->m(ZLjava/lang/String;Landroid/content/Context;)V
    :done
    return-void
"""

private const val OPEN_REDDIT_INTERNAL_LINK = """
    const/4 v0, 0x0
    invoke-static {v0, p0, p1}, Lfb/b;->j(ZLandroid/content/Context;Ljava/lang/String;)V
    return-void
"""

private val redditLinksManifestPatch = resourcePatch {
    compatibleWith(JOEY)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            var targetFilter: Element? = null
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as Element
                if (activity.getAttribute("android:name") != "o.o.joey.Activities.OpenInApp") continue
                val filters = activity.getElementsByTagName("intent-filter")
                if (filters.length > 0) {
                    targetFilter = filters.item(0) as Element
                }
                break
            }
            val filter = targetFilter ?: error("OpenInApp intent-filter was not found in AndroidManifest.xml")
            val existingHosts = mutableSetOf<String>()
            val dataNodes = filter.getElementsByTagName("data")
            for (index in 0 until dataNodes.length) {
                val dataNode = dataNodes.item(index) as Element
                existingHosts.add(dataNode.getAttribute("android:host"))
            }
            for (host in ADDITIONAL_REDDIT_HOSTS) {
                if (host in existingHosts) continue
                for (scheme in listOf("https", "http")) {
                    val data = manifest.createElement("data")
                    data.setAttribute("android:host", host)
                    data.setAttribute("android:pathPattern", ".*")
                    data.setAttribute("android:scheme", scheme)
                    filter.appendChild(data)
                }
            }
        }
    }
}

@Suppress("unused")
val redditLinksPatch = bytecodePatch(
    name = "Open Reddit share links",
    description = "Opens modern Reddit share links directly to the right post or comment in Joey instead of loading the web page. To open Reddit links from other apps, make sure all links are ticked in Android Settings -> Apps -> Joey -> Open by default.",
) {
    compatibleWith(JOEY)
    dependsOn(redditLinksManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val openContent = OpenContentFingerprint.method
        openContent.insertAt(
            0,
            """
            invoke-static {p0, p1}, $EXTENSION->interceptOpenContent(Landroid/content/Context;Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :morphe_open_content_continue
            return-void
            """,
            ExternalLabel("morphe_open_content_continue", openContent.instructions[0]),
        )

        writeBody(OpenRedditLinkFingerprint.method, 3, OPEN_REDDIT_LINK)
        writeBody(OpenRedditInternalLinkFingerprint.method, 3, OPEN_REDDIT_INTERNAL_LINK)

        NormalizeRedditLinkFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0}, $EXTENSION->normalizeUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
            """,
        )
    }
}
