/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

// Warung Life is a Godot game. Its GDScript (scripts/iklan_unity.gdc) reaches Unity Ads only through the Godot plugin
// `com.neopawstudio.unityads.GodotUnityAds`: `initialize`, `load` and `show`, answered by the signals `init_complete`,
// `ad_loaded`, `ad_show_started` and `ad_show_complete(placement, completed)`. The plugin's private
// `kirim(String, Object[])` emits a signal on the render thread. Every call is answered at once as if the ad had
// played to the end, so a rewarded placement (full energy, extra side job, double pay, upgrade discount) pays out
// without an ad and the level-up interstitial closes before it opens. The SDK is never started.

private const val PLUGIN = "Lcom/neopawstudio/unityads/GodotUnityAds;"
private const val KIRIM = "$PLUGIN->kirim(Ljava/lang/String;[Ljava/lang/Object;)V"

/** Unity Ads starts itself from androidx.startup before the game asks; the same provider hosts WorkManager. */
private val adSdkManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val entries = manifest.getElementsByTagName("meta-data")
            (0 until entries.length).map { entries.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.unity3d.services.core.configuration.AdsSdkInitializer" }
                .also { if (it.size != 1) throw PatchException("Warung Life: Unity AdsSdkInitializer not found in the manifest.") }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val warungLifeInstantAdRewardsPatch = patch(
    name = "Instant ad rewards",
    description = "Gives the rewards of rewarded ads without watching them and skips the level-up ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    dependsOn(pairipLicenseCheckPatch, adSdkManifestPatch)

    execute {
        val plugin = mutableClassDefBy(PLUGIN)
        if (plugin.methods.none { it.name == "kirim" }) throw PatchException("Warung Life: GodotUnityAds.kirim not found.")

        // Helpers with their own registers: `load` and `show` keep only one local, too few to build a signal's array.
        fun helper(name: String, registers: Int, smali: String) = plugin.methods.add(
            ImmutableMethod(
                PLUGIN,
                name,
                listOf(ImmutableMethodParameter("Ljava/lang/String;", null, null)),
                "V",
                AccessFlags.PRIVATE.value,
                null,
                null,
                MutableMethodImplementation(registers),
            ).toMutable().apply { addInstructions(0, smali) },
        )
        helper(
            "fakhAdLoaded",
            4,
            """
                const/4 v0, 0x1
                new-array v0, v0, [Ljava/lang/Object;
                const/4 v1, 0x0
                aput-object p1, v0, v1
                const-string v1, "ad_loaded"
                invoke-direct { p0, v1, v0 }, $KIRIM
                return-void
            """,
        )
        helper(
            "fakhAdShown",
            5,
            """
                const/4 v0, 0x1
                new-array v0, v0, [Ljava/lang/Object;
                const/4 v1, 0x0
                aput-object p1, v0, v1
                const-string v2, "ad_show_started"
                invoke-direct { p0, v2, v0 }, $KIRIM
                const/4 v0, 0x2
                new-array v0, v0, [Ljava/lang/Object;
                aput-object p1, v0, v1
                const/4 v1, 0x1
                sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                aput-object v2, v0, v1
                const-string v2, "ad_show_complete"
                invoke-direct { p0, v2, v0 }, $KIRIM
                return-void
            """,
        )

        fun method(name: String, parameters: String) = plugin.methods.singleOrNull {
            it.name == name && it.parameterTypes.joinToString("") == parameters && it.implementation != null
        } ?: throw PatchException("Warung Life: GodotUnityAds.$name($parameters) not found.")

        method("initialize", "Ljava/lang/String;Z").addInstructions(
            0,
            """
                const/4 p2, 0x0
                new-array p2, p2, [Ljava/lang/Object;
                const-string p1, "init_complete"
                invoke-direct { p0, p1, p2 }, $KIRIM
                return-void
            """,
        )
        method("isInitialized", "").addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        method("setUserConsent", "Z").addInstructions(0, "return-void")
        method("load", "Ljava/lang/String;").addInstructions(
            0,
            """
                invoke-direct { p0, p1 }, $PLUGIN->fakhAdLoaded(Ljava/lang/String;)V
                return-void
            """,
        )
        method("show", "Ljava/lang/String;").addInstructions(
            0,
            """
                invoke-direct { p0, p1 }, $PLUGIN->fakhAdShown(Ljava/lang/String;)V
                return-void
            """,
        )
    }
}
