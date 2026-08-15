/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.webetu.shared.WebetuConstants
import org.w3c.dom.Element

private const val PAIRIP_APPLICATION = "Lcom/pairip/application/Application;"
private const val PAIRIP_PREFIX = "com.pairip."

/** Extracted original Application class, shared between the two patches. */
internal var pairipOriginalApplication: String? = null
    private set

/**
 * Bytecode half of the PairIP removal. It is private because the public
 * resource patch below depends on it and must run after the real Application
 * superclass has been extracted.
 */
@Suppress("unused")
private val removePairIpProtectionBytecodePatch = bytecodePatch {
    execute {
        // PairIP's wrapper subclasses the app's original Application class.
        val pairipApplicationFingerprint = object : Fingerprint(
            definingClass = PAIRIP_APPLICATION,
        ) {}

        pairipOriginalApplication = requireNotNull(pairipApplicationFingerprint.classDef.superclass) {
            "Could not determine the original Application superclass in PairIP wrapper"
        }

        // Neuter the license client: attachBaseContext returns immediately
        //    so the wrapper never runs its license check.
        val attachBaseContextFingerprint = object : Fingerprint(
            definingClass = PAIRIP_APPLICATION,
            name = "attachBaseContext",
            returnType = "V",
            parameters = listOf("Landroid/content/Context;"),
        ) {}

        attachBaseContextFingerprint.method?.let { method ->
            method.addInstructions(
                0,
                """
                    return-void
                """,
            )
        }
    }
}

/**
 * Removes Google Play's PairIP anti-tamper wrapper so the app runs without
 * license checks. The bytecode dependency runs first, then this resource
 * patch restores the original Application class and removes injected
 * com.pairip.* manifest components.
 */
@Suppress("unused")
val removePairIpProtectionPatch = resourcePatch(
    name = "Remove PairIP protection",
    description = "Removes Google Play's PairIP anti-tamper wrapper so the app runs without license checks. Restores the original Application class in the manifest, removes all injected com.pairip.* components, and neuters PairIP's license client.",
    default = true,
) {
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)
    dependsOn(removePairIpProtectionBytecodePatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val applicationElement = document.getElementsByTagName("application").item(0) as? Element
                ?: return@execute

            val originalApplication = requireNotNull(pairipOriginalApplication) {
                "PairIP bytecode half did not extract the original Application class"
            }
                .removePrefix("L")
                .removeSuffix(";")
                .replace('/', '.')

            applicationElement.setAttribute("android:name", originalApplication)

            listOf(
                "activity", "activity-alias", "service", "receiver", "provider", "meta-data",
            ).forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (i in nodes.length - 1 downTo 0) {
                    val node = nodes.item(i)
                    if (node is Element && node.getAttribute("android:name").startsWith(PAIRIP_PREFIX)) {
                        node.parentNode?.removeChild(node)
                    }
                }
            }
        }
    }
}
