/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.fakh.patches.muslimpro.shared.duplicateApplicationNamePatch
import app.fakh.patches.shared.disableProviders
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import org.w3c.dom.Element

/**
 * AdMobNetwork.initAdSdk: the only place the app starts the Google Mobile Ads SDK, which in turn loads the AppLovin,
 * Unity, Vungle, Pangle and Audience Network mediation adapters. Every ad slot waits for its "initialized" callback,
 * so the SDK never starts and no slot ever requests an ad.
 */
private object InitAdSdkFingerprint : Fingerprint(
    definingClass = "Lcom/bitsmedia/android/ads/adnetwork/AdMobNetwork;",
    name = "initAdSdk",
    returnType = "V",
)

/** SDKs that start from a content provider or androidx.startup before any app code runs. */
private val adSdkManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.applovin.sdk.AppLovinInitProvider",
                "com.vungle.ads.VungleProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
            )
            val entries = manifest.getElementsByTagName("meta-data")
            (0 until entries.length).map { entries.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.unity3d.services.core.configuration.AdsSdkInitializer" }
                .also { if (it.size != 1) throw PatchException("Muslim Pro: Unity AdsSdkInitializer not found in the manifest.") }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

/**
 * The banner strip (view id 0x7f0b00be) is included on dozens of screens (Belajar, Doa, ...) and most includes
 * override its height, so every include with that id and the strip's own layout get a height of 1dp (0dp means match-constraint in a ConstraintLayout) and no background.
 */
private val adStripLayoutPatch = patch {
    execute {
        // Layouts are decoded on demand, so decode them all before reading or editing any of them.
        val layouts = decode("res/layout*/*.xml")
        layouts.single { resourceFile(it).readText().contains("layout/ad_view_layout_0") }.let { path ->
            document(path).use { layout ->
                layout.documentElement.setAttribute("android:layout_height", "1.0dip")
                layout.documentElement.setAttribute("android:background", "@android:color/transparent")
            }
        }
        var strips = 0
        layouts.filter { Regex("""<include[^>]*@id/id_0x7f0b00be""").containsMatchIn(resourceFile(it).readText()) }.forEach { path ->
            document(path).use { layout ->
                val views = layout.getElementsByTagName("*")
                for (i in 0 until views.length) {
                    val view = views.item(i) as Element
                    if (view.tagName != "include" || view.getAttribute("android:id") != "@id/id_0x7f0b00be") continue
                    view.setAttribute("android:layout_height", "1.0dip")
                    strips++
                }
            }
        }
        if (strips == 0) throw PatchException("Muslim Pro: no ad strip views found in the layouts.")
    }
}

/** The Today feed's ad cards (Compose trace strings name them; the classes are R8-renamed). */
private val adCardFingerprints = listOf(
    "BoxAdCard (BoxAdCard.kt:43)",
    "ExtraSmallAdCard (ExtraSmallAdCard.kt:50)",
    "LargeAdCard (LargeAdCard.kt:53)",
    "MediumAdCard (MediumAdCard.kt:47)",
    "MediumRectangleAdCard (MediumRectangleAdCard.kt:54)",
    "SmallAdCard (SmallAdCard.kt:40)",
).map { Fingerprint(returnType = "V", strings = listOf("com.bitsmedia.android.timelinev2.presentation.components.ads.$it")) } +
    /** The sponsor card (image, headline and "Unduh Sekarang" button) at the end of the Today feed. */
    Fingerprint(returnType = "V", strings = listOf("com.bitsmedia.android.timelinev2.presentation.components.generic.LargeCard (LargeCard.kt:154)")) +
    /** The partner card (Giving, image and "Give Now" button) on the prayer times screen. */
    Fingerprint(returnType = "V", strings = listOf("com.bitsmedia.android.prayer.prayers.components.widget.PrayersPartnershipCard (PrayersPartnershipCard.kt:61)"))

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Removes banner, full-screen, app open and rewarded ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Ads")
    dependsOn(duplicateApplicationNamePatch, adSdkManifestPatch, adStripLayoutPatch)

    execute {
        InitAdSdkFingerprint.method.addInstructions(0, "return-void")
        adCardFingerprints.forEach { it.method.addInstructions(0, "return-void") }
    }
}
