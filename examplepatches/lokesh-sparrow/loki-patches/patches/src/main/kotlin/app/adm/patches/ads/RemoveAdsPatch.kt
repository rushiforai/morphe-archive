/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.adm.patches.ads

import app.adm.patches.menu.admMenuRowPatch
import app.adm.patches.shared.Constants.APPODEAL_APP_KEY
import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.loki.patches.universal.menuFlagPatch
import app.loki.patches.universal.stopAdSdks
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction

/**
 * ADM has exactly three ad entry points of its own, all in one obfuscated class:
 *
 *  - the banner: builds an Appodeal banner view and shows it in the main layout
 *  - the interstitial: shows one after a download finishes ("AppoInterShow" is its analytics tag)
 *  - the SDK bootstrap: Appodeal.initialize() with the app key, plus the interstitial callbacks
 *
 * All three are static methods that return nothing, so stopping them at the first instruction leaves the
 * app with no ad surface at all - and nothing to un-break if Appodeal changes internally, because we never
 * touch the SDK itself.
 */
private val banner = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(),
    strings = listOf("main-toolend"),
)

private val interstitial = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    strings = listOf("AppoInterShow"),
)

private val adBootstrap = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    strings = listOf(APPODEAL_APP_KEY),
)

/**
 * ADM's navigation drawer ends with a red "Disable Ads" item (its own purchase prompt). It is one entry built under the
 * id "S369" and added to the drawer's list, so skipping that one add leaves the drawer without it.
 */
private val disableAdsDrawerItem = Fingerprint(
    definingClass = "Lcom/dv/get/Main;",
    strings = listOf("S369"),
)

/**
 * The "Disable Ads" purchase bar and the "Join ADM group in Telegram" bar are two small layouts ADM inflates under the
 * download list, from two ViewStubs in the main screen. The app shows the Telegram one again after inflating it, so the
 * stubs themselves are made zero high (an inflated view takes its stub's size) and the layouts start hidden. The views
 * stay in place because the app looks them up.
 */
private val hidePromoBars = resourcePatch {
    execute {
        val android = "http://schemas.android.com/apk/res/android"
        listOf("stub_purchase", "stub_telegram").forEach { name ->
            val layout = "res/layout/$name.xml"
            if (!get(layout).exists()) return@forEach
            document(layout).use { document ->
                val root = document.documentElement
                root.setAttributeNS(android, "android:visibility", "gone")
                root.setAttributeNS(android, "android:layout_height", "0dp")
            }
        }
        get("res").listFiles { file -> file.isDirectory && file.name.startsWith("layout") }.orEmpty().forEach { directory ->
            val main = "res/${directory.name}/activity_main.xml"
            if (!get(main).exists()) return@forEach
            document(main).use { document ->
                val stubs = document.getElementsByTagName("ViewStub")
                for (index in 0 until stubs.length) {
                    val stub = stubs.item(index) as org.w3c.dom.Element
                    val id = stub.getAttributeNS(android, "id")
                    if (id == "@id/purchaseStub" || id == "@id/telegramStub") {
                        stub.setAttributeNS(android, "android:layout_height", "0dp")
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads (ADM)",
    description = "Removes the ads in ADM, including Google and AppBrain banners, the red \"Disable Ads\" menu item, and the Disable Ads and Telegram bars.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ADM)
    dependsOn(menuFlagPatch("app.loki.menu.hideads"))
    dependsOn(admMenuRowPatch)
    dependsOn(hidePromoBars)

    execute {
        adBootstrap.method.addInstructions(0, "return-void")
        banner.method.addInstructions(0, "return-void")
        interstitial.method.addInstructions(0, "return-void")

        // ADM also has Google AdMob and its own AppBrain SDK (the "Get more great apps for your phone / Install Now"
        // bar and the orange strip). AppBrain starts from a content provider at launch, so it is stopped directly.
        stopAdSdks()

        disableAdsDrawerItem.method.apply {
            val all = instructions.toList()
            val label = all.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "S369"
            }
            check(label >= 0) { "ADM: the Disable Ads drawer item was not found" }
            val add = (label until all.size).first {
                val reference = (all[it] as? ReferenceInstruction)?.reference as? MethodReference
                all[it].opcode == Opcode.INVOKE_VIRTUAL && reference?.definingClass == "Ljava/util/ArrayList;" &&
                    reference.name == "add"
            }
            // The result of the add is not used, so the instruction can simply be dropped.
            replaceInstruction(add, "nop")
        }
    }
}
