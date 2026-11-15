/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.declutter

import app.docscanner.patches.shared.Constants.COMPATIBILITY_DOCSCANNER
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val DASHBOARD = "Lcom/cv/docscanner/views/guide/DashboardInfoLayout;"

/** `DashboardInfoLayout.d(String)`: is this promo banner enabled in the server's banner list? */
private val bannerEnabled = Fingerprint(
    definingClass = DASHBOARD,
    name = "d",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

/** `DashboardInfoLayout.e()`: picks one server-driven promo banner for the home screen. */
private val pickBanner = Fingerprint(
    definingClass = DASHBOARD,
    name = "e",
    parameters = listOf(),
)

/**
 * Cross-promo and upsell blocks in the layouts. Each entry is a layout file and the ids whose view is hidden; an id
 * with a `^` suffix hides its parent instead (a card that wraps the view).
 */
private val HIDDEN = mapOf(
    "res/layout/activity_success.xml" to listOf(
        "ads_banner_card_view",
        "serverBannerLayoutOne",
        "serverBannerLayoutTwo",
        "card_view^^",
        "cloud_sync_not_login_warning",
    ),
)

private val declutterResources = resourcePatch {
    execute {
        for ((file, ids) in HIDDEN) {
            document(file).use { document ->
                val all = document.getElementsByTagName("*")
                for (spec in ids) {
                    val id = spec.trimEnd('^')
                    val up = spec.length - id.length
                    val element = (0 until all.length).map { all.item(it) as Element }
                        .firstOrNull { it.getAttribute("android:id") == "@id/$id" }
                        ?: throw IllegalStateException("$file: no view with id $id")
                    var target: Element = element
                    repeat(up) { target = target.parentNode as Element }
                    target.setAttribute("android:visibility", "gone")
                }
            }
        }
    }
}

private val declutterFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.declutter") }
    }
}

@Suppress("unused")
val declutterPatch = bytecodePatch(
    name = "Declutter",
    description = "Removes the promo banner on the home screen and the cross-promotion and cloud-login cards on " +
        "the save-success screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOCSCANNER)
    dependsOn(declutterResources)
    dependsOn(declutterFlag)
    dependsOn(menuPatch)

    execute {
        bannerEnabled.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        pickBanner.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}
