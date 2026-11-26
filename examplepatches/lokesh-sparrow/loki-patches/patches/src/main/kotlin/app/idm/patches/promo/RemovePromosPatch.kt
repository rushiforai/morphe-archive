/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.idm.patches.promo

import app.idm.patches.menu.idmMenuRowPatch
import app.idm.patches.shared.Constants.COMPATIBILITY_IDM
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

/**
 * 1DM's own "get 1DM+" promotion, which the ad patch does not touch because it is not an ad network:
 *
 *  - the green "Install 1DM+ for an Ad free experience" banner at the bottom. Its content is the fallback
 *    `BannerInfo` the app builds in code; both callers treat null as "no banner", so the builder now returns null.
 *  - the "Install Shoppers Search" button on the empty download list,
 *  - the notice strip under the tabs (`offer_vpnLL`), where 1DM's server pushes "Install Shoppers Search" and similar
 *    offers, with a close button.
 *
 * The drawer's "Upgrade to 1DM+" row is not removed: it becomes the Loki Patches row (see IdmMenuRowPatch).
 *
 * The code toggles the visibility of the two views itself, from several places, so hiding them in the layout is not
 * enough: they are also made 0dp x 0dp, which stays invisible whatever the code does with the visibility.
 */
private val defaultBanner = Fingerprint(
    returnType = "Lcom/aspsine/multithreaddownload/core/BannerInfo;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("utm_source=1DM&utm_medium=App&utm_campaign=DefaultBanner"),
)

private val PROMO_VIEWS = mapOf(
    "res/layout/download_list.xml" to listOf("install_shoppers_search", "offer_vpnLL"),
    "res/layout/default_banner_new.xml" to listOf("defaultBannerViewNew"),
)

private val promoLayouts = resourcePatch {
    execute {
        for ((file, ids) in PROMO_VIEWS) {
            document(file).use { document ->
                val all = document.getElementsByTagName("*")
                for (i in 0 until all.length) {
                    val element = all.item(i) as Element
                    if (element.getAttribute("android:id").removePrefix("@id/").removePrefix("@+id/") !in ids) continue
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0dp")
                    element.setAttribute("android:layout_height", "0dp")
                }
            }
        }
    }
}

@Suppress("unused")
val removePromosPatch = bytecodePatch(
    name = "Remove 1DM+ promotions",
    description = "Removes the app's own upsell: the \"Install 1DM+\" banner at the bottom, the \"Install Shoppers " +
        "Search\" button on the empty download list and the offer strip under the tabs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDM)
    dependsOn(promoLayouts)
    dependsOn(menuFlagPatch("app.loki.menu.promos"))
    dependsOn(idmMenuRowPatch)

    execute {
        defaultBanner.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
