/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.misc.crashlytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.baridimob.shared.BaridimobConstants
import app.morphe.patches.shared.dom.doRecursively
import app.morphe.patches.shared.dom.removeFromParent
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val META_DATA = "meta-data"
private const val PROVIDER = "provider"

/**
 * MobileBankApp manually initializes Fabric from onCreate(), so manifest
 * cleanup alone is not sufficient to stop Crashlytics/Answers startup.
 */
@Suppress("unused")
private val removeCrashlyticsBytecodePatch = bytecodePatch {
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)

    execute {
        val initFabricFingerprint = object : Fingerprint(
            definingClass = "Lcom/bpcbt/android/app/application/MobileBankApp;",
            name = "initFabric",
            returnType = "V",
            parameters = listOf(),
        ) {}

        runCatching { initFabricFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(0, "return-void")
        }
    }
}

/**
 * Disables analytics and crash reporting while keeping push notifications.
 * Removes from the manifest: the Crashlytics/Fabric init provider, the
 * Fabric API key meta-data, and the Firebase component registrars for
 * Crashlytics / Sessions / Analytics.
 */
@Suppress("unused")
val removeCrashlyticsPatch = resourcePatch(
    name = "Disable analytics and crash reporting",
    description = "Disables analytics and crash reporting while keeping push notifications.",
    default = true,
) {
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)
    dependsOn(removeCrashlyticsBytecodePatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            document.doRecursively { node ->
                if (node is Element) {
                    val name = node.getAttribute("android:name")
                    val isCrashlyticsNode = when (node.tagName) {
                        META_DATA -> name == "io.fabric.ApiKey"
                            || (name.startsWith("com.google.firebase.components:")
                                && (name.contains("crashlytics", ignoreCase = true)
                                    || name.contains("sessions", ignoreCase = true)
                                    || name.contains("analytics", ignoreCase = true)))
                        PROVIDER -> name == "com.crashlytics.android.CrashlyticsInitProvider"
                        else -> false
                    }
                    if (isCrashlyticsNode) {
                        node.removeFromParent()
                    }
                }
            }
        }
    }
}
