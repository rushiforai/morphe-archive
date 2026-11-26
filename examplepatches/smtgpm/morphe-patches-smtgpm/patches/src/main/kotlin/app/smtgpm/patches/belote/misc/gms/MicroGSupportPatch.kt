/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.misc.gms

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.returnEarly
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.Constants.PACKAGE_NAME
import app.smtgpm.patches.belote.shared.Constants.SIGNER_SHA1
import app.smtgpm.patches.belote.shared.resignFixPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

/** Same vendor as the official GmsCore support patch: MicroG-RE is app.revanced.android.gms. */
private const val GMS_CORE_VENDOR_GROUP_ID = "app.revanced"
private const val GOOGLE_ACCOUNT_TYPE = "com.google"
private const val GMS = "com.google.android.gms"
private const val MICROG = "$GMS_CORE_VENDOR_GROUP_ID.android.gms"

/** Sign-in intents and provider authorities this app uses that MicroG-RE serves. */
private val EXTRA_ACTIONS_AND_AUTHORITIES = setOf(
    "$GMS.auth.GOOGLE_SIGN_IN",
    "$GMS.auth.APPAUTH_SIGN_IN",
    "$GMS.auth.START_ACCOUNT_EXPORT",
    "$GMS.chimera",
    "$GMS.phenotype",
)

/**
 * Moves the Google account type, the GMS package, service actions (*.START), sign-in intents and
 * authorities to MicroG-RE. Binder interface descriptors, Bundle keys and c2dm/FCM push stay.
 */
private fun transform(string: String): String? = when {
    // MicroG-RE keeps its accounts under "app.revanced". Its SIGN_IN service answers
    // SIGN_IN_REQUIRED for any account AccountManager doesn't list under the sent type.
    string == GOOGLE_ACCOUNT_TYPE -> GMS_CORE_VENDOR_GROUP_ID
    string == GMS -> MICROG
    string.startsWith("$GMS.") && (string.endsWith(".START") || string in EXTRA_ACTIONS_AND_AUTHORITIES) ->
        string.replaceFirst("com.google", GMS_CORE_VENDOR_GROUP_ID)
    else -> null
}

private val microGManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") != PACKAGE_NAME) {
                throw PatchException("Unexpected package ${manifest.getAttribute("package")}")
            }

            // MicroG-RE reports the original package and signature to Google.
            val application = document.getElementsByTagName("application").item(0) as Element
            mapOf(
                "$MICROG.SPOOFED_PACKAGE_NAME" to PACKAGE_NAME,
                "$MICROG.SPOOFED_PACKAGE_SIGNATURE" to SIGNER_SHA1,
                "$GMS_CORE_VENDOR_GROUP_ID.MICROG_PACKAGE_NAME" to MICROG,
            ).forEach { (name, value) ->
                application.appendChild(
                    document.createElement("meta-data").apply {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    },
                )
            }

            // Android 11+ package visibility.
            val queries = document.getElementsByTagName("queries").item(0) as? Element
                ?: document.createElement("queries").also(manifest::appendChild)
            queries.appendChild(
                document.createElement("package").apply { setAttribute("android:name", MICROG) },
            )
        }
    }
}

@Suppress("unused")
val microGSupportPatch = bytecodePatch(
    name = "MicroG-RE support",
    description = "Allows Google sign-in through MicroG-RE (needed after patching).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(microGManifestPatch, resignFixPatch)

    execute {
        // MicroG-RE is not signed by Google: report Play Services as available. Patched first,
        // because these fingerprints match strings that the transform below rewrites.
        GooglePlayUtilityFingerprint.method.returnEarly(0)
        ServiceCheckFingerprint.method.returnEarly()

        var transformed = 0
        string(GOOGLE_ACCOUNT_TYPE, StringComparisonType.STARTS_WITH).matchAllMethodIndicesForEach { index ->
            val instruction = getInstruction<ReferenceInstruction>(index)
            val replacement = transform((instruction.reference as StringReference).string)
                ?: return@matchAllMethodIndicesForEach

            replaceInstruction(
                index,
                BuilderInstruction21c(
                    Opcode.CONST_STRING,
                    (instruction as OneRegisterInstruction).registerA,
                    ImmutableStringReference(replacement),
                ),
            )
            transformed++
        }
        if (transformed == 0) throw PatchException("No Google Play services references found")
    }
}
