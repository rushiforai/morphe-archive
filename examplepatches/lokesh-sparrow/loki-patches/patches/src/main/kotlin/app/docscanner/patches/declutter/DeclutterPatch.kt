/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.declutter

import app.docscanner.patches.shared.Constants.COMPATIBILITY_DOCSCANNER
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/**
 * The home screen's promo banner. The app reads its server list (`DASHBOARD_ANDROID_BANNER_LIST`) and decides from it
 * whether to draw a banner. That reader was split over two methods in 6.9.9 (`d(String)` answers per key, `e()` picks
 * one) and folded into one in 6.9.14 (`getBannerKeys()`), so the hook is "every method that reads that key" and the
 * answer matches whatever the method returns.
 */
private fun Method.readsBannerKey() =
    implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "DASHBOARD_ANDROID_BANNER_LIST"
    } == true

/**
 * The cross-promo cards. 6.9.9 keeps them on the save-success screen next to the ad banner and the cloud-login
 * warning; 6.9.14 moved them into their own layouts. Every layout that exists in the version being patched is
 * handled: the listed views are hidden, and a banner layout that no longer carries any of them is hidden whole.
 */
private val PROMO_LAYOUTS = listOf(
    "res/layout/activity_success.xml",
    "res/layout/apps_info_banner1.xml",
    "res/layout/apps_info_banner2.xml",
    "res/layout/apps_info_banner3.xml",
    "res/layout/apps_info_banner5.xml",
)

private val HIDDEN_IDS = listOf(
    "ads_banner_card_view",
    "banner_card_view",
    "serverBannerLayoutOne",
    "serverBannerLayoutTwo",
    "app_info_layout_banner",
    "app_info_layout_banner_two",
    "app_info_layout_banner_three",
    "app_info_layout_banner_four",
    "cloud_sync_not_login_warning",
)

private val declutterResources = resourcePatch {
    execute {
        var handled = 0
        for (file in PROMO_LAYOUTS) {
            val document = try {
                document(file)
            } catch (e: Exception) {
                continue // this layout is not in this version
            }
            document.use { doc ->
                handled++
                val all = doc.getElementsByTagName("*")
                val elements = (0 until all.length).map { all.item(it) as Element }
                var hidden = 0
                for (id in HIDDEN_IDS) {
                    for (element in elements) {
                        if (element.getAttribute("android:id") != "@id/$id") continue
                        // A card that wraps the view is hidden as a whole; every other view on its own.
                        val parent = element.parentNode as? Element
                        val card = parent?.getAttribute("android:id").orEmpty().startsWith("@id/card_view") == true
                        val target: Element = if (card && parent != null) parent else element
                        target.setAttribute("android:visibility", "gone")
                        hidden++
                    }
                }
                // A banner layout whose views were all renamed: hide the layout itself.
                if (hidden == 0 && file != "res/layout/activity_success.xml") {
                    doc.documentElement.setAttribute("android:visibility", "gone")
                }
            }
        }
        if (handled == 0) throw IllegalStateException("Declutter: none of the promo layouts exist in this version")
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
        // Find every reader first (walking the immutable classes), then make only those mutable.
        val hits = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { def ->
            def.methods.filter { it.readsBannerKey() }.forEach { hits += def to it }
        }
        if (hits.isEmpty()) throw IllegalStateException("Declutter: no reader of the banner list found")
        val readers: List<MutableMethod> = hits.map { (def, method) ->
            mutableClassDefBy(def).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
            }
        }

        // Every reader answers "nothing to show": false for a per-key check, an empty list for the whole list, null
        // for a picked banner.
        for (method in readers) {
            when (method.returnType) {
                "Z" -> method.addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent())
                "Ljava/util/List;" -> method.addInstructions(0, """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    return-object v0
                """.trimIndent())
                else -> method.addInstructions(0, """
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent())
            }
        }
    }
}
