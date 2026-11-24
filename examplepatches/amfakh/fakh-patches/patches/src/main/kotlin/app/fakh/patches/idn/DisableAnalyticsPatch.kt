/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.document
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Switches the analytics SDKs off that have a manifest switch. The values replace the entry if the app already has it. */
private val analyticsManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            val existing = document.getElementsByTagName("meta-data")
            val switches = mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "firebase_sessions_enabled" to "false",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "CLEVERTAP_USE_GOOGLE_AD_ID" to "0",
            )
            switches.forEach { (name, value) ->
                val entry = (0 until existing.length).map { existing.item(it) as org.w3c.dom.Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                    ?: document.createElement("meta-data").also {
                        it.setAttribute("android:name", name)
                        application.appendChild(it)
                    }
                entry.setAttribute("android:value", value)
            }
        }
    }
}

/** IDNApp.onCreate: the app's entry point, where AppsFlyer is stopped before the startup steps set it up. */
private object AppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/IDNApp;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** The startup step that sets Google Tag Manager up; R8 merged it with other startup steps, which this method also runs for another case. */
private object GtmInitFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("Google Tag Manager initialization failed"),
)

/** ComScoreInitializer.create: the androidx.startup entry that starts comScore. */
private object ComScoreInitFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/util/initializer/ComScoreInitializer;",
    name = "create",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;"),
)

/** The startup step that sets Firebase up: it turns Crashlytics collection on right after Firebase starts. */
private object FirebaseInitFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("Firebase initialization failed \u2014 disabling Crashlytics"),
)

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Privacy")
    dependsOn(analyticsManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // GTM shares its method with another startup step. Its code starts at the first read of the static config
        // map; there it returns Success (the value the method returns on its normal exit) without doing the work.
        GtmInitFingerprint.method.apply {
            val success = instructions.withIndex().firstNotNullOfOrNull { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.type == it.definingClass && it.definingClass != definingClass }
            } ?: throw PatchException("IDN: the Success result of the Google Tag Manager step was not found.")
            val start = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference.let { reference -> reference is FieldReference && reference.type == "Ljava/util/LinkedHashMap;" && it.opcode == Opcode.SGET_OBJECT }
            }
            if (start < 0) throw PatchException("IDN: the start of the Google Tag Manager step was not found.")
            addInstructions(
                start,
                """
                    sget-object v0, ${success.definingClass}->${success.name}:${success.type}
                    return-object v0
                """,
            )
        }

        ComScoreInitFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object p0
            """,
        )

        // AppsFlyer starts later with start(); the extension stops it first, and a stopped SDK ignores start().
        AppCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { }, Lapp/fakh/extension/idn/IdnAnalytics;->stopAppsFlyer()V",
        )

        FirebaseInitFingerprint.method.apply {
            val enable = instructions.indexOfFirst {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference != null && it.opcode == Opcode.INVOKE_VIRTUAL && reference.parameterTypes.map { type -> type.toString() } == listOf("Z") &&
                    reference.returnType == "V"
            }
            if (enable < 0) throw PatchException("IDN: the Crashlytics collection switch was not found.")
            val register = (instructions[enable] as FiveRegisterInstruction).registerD
            // Crashlytics collection stays off, whatever the app asks for.
            addInstruction(enable, "const/4 v$register, 0x0")
        }
    }
}
