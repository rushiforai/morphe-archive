package app.ahmedyarub.patches.x.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringsOption
import app.morphe.util.asSequence
import org.w3c.dom.Element

/** The string array the extension reads the hosts from. */
internal const val CUSTOM_LINK_HOSTS_ARRAY = "morphe_x_custom_link_hosts"

/**
 * The app's router only accepts x.com and twitter.com, so the host of a link to one of the custom
 * hosts is rewritten before the activity reads it.
 */
private val rewriteCustomLinksPatch = bytecodePatch {
    dependsOn(xExtensionPatch)

    execute {
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $LINKS_CLASS->rewriteCustomDeepLinks(Landroid/app/Activity;)V",
        )
        MainActivityOnNewIntentFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $LINKS_CLASS->rewriteCustomDeepLinks(Landroid/app/Activity;Landroid/content/Intent;)V",
        )
    }
}

@Suppress("unused")
val handleCustomLinksPatch = resourcePatch(
    name = "Handle custom twitter links",
    description = "Opens links to other X frontends, such as fxtwitter and vxtwitter, in the app. " +
        "They have to be enabled under \"Open by default\" in the app's system settings.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(rewriteCustomLinksPatch)

    val customLinkHosts by stringsOption(
        key = "customLinkHosts",
        default = listOf("vxtwitter.com", "fixvx.com", "fxtwitter.com", "fixupx.com", "twittpr.com", "xcancel.com"),
        title = "Hosts",
        description = "Link hosts to open in the app. Subdomains are included.",
        required = true,
    )

    execute {
        val hosts = customLinkHosts!!.map { it.trim().lowercase() }.filter { it.isNotEmpty() }
        if (hosts.isEmpty()) throw PatchException("No hosts given")

        document("AndroidManifest.xml").use { document ->
            // The main activity, and every activity alias carrying the x.com filter: choosing
            // another app icon disables the activity and enables an alias, and a filter on the
            // activity alone would stop working then.
            val targets = (
                document.getElementsByTagName("activity").asSequence() +
                    document.getElementsByTagName("activity-alias").asSequence()
                )
                .map { it as Element }
                .filter { component ->
                    component.getElementsByTagName("data").asSequence().any { data ->
                        (data as Element).getAttribute("android:host") == "x.com"
                    }
                }
                .toList()

            if (targets.none { it.getAttribute("android:name") == "com.x.android.main.MainActivity" }) {
                throw PatchException("MainActivity does not handle x.com links")
            }

            targets.forEach { component ->
                val filter = document.createElement("intent-filter")

                fun child(tag: String, vararg attributes: Pair<String, String>) {
                    filter.appendChild(
                        document.createElement(tag).apply {
                            attributes.forEach { (name, value) -> setAttribute(name, value) }
                        },
                    )
                }

                child("action", "android:name" to "android.intent.action.VIEW")
                child("category", "android:name" to "android.intent.category.DEFAULT")
                child("category", "android:name" to "android.intent.category.BROWSABLE")
                child("data", "android:scheme" to "http")
                child("data", "android:scheme" to "https")
                child("data", "android:pathPattern" to "/..*")
                hosts.forEach { host ->
                    child("data", "android:host" to host)
                    child("data", "android:host" to "*.$host")
                }

                component.appendChild(filter)
            }
        }

        document("res/values/arrays.xml").use { document ->
            document.documentElement.appendChild(
                document.createElement("string-array").apply {
                    setAttribute("name", CUSTOM_LINK_HOSTS_ARRAY)
                    hosts.forEach { host ->
                        appendChild(document.createElement("item").apply { textContent = host })
                    }
                },
            )
        }
    }
}
