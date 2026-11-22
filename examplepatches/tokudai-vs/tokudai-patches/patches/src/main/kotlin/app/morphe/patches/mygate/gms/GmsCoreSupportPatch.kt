/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.mygate.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.mygate.shared.Constants.COMPATIBILITY_MYGATE
import app.morphe.patches.mygate.shared.Constants.MYGATE_ORIGINAL_CERT_SHA1
import app.morphe.patches.mygate.shared.Constants.MYGATE_PACKAGE_NAME
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun liveDataFieldOf(method: MutableMethod): FieldReference? =
    method.implementation?.instructions
        ?.filterIsInstance<ReferenceInstruction>()
        ?.mapNotNull { it.reference as? FieldReference }
        ?.firstOrNull { it.type == "Landroidx/lifecycle/MutableLiveData;" }

@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Enables push notifications, gate approvals, and e-Intercom on re-signed APKs using MicroG-RE (GmsCore).",
) {
    compatibleWith(COMPATIBILITY_MYGATE)

    val gmsCoreVendorOption = stringOption(
        key = "gmsCoreVendor",
        title = "GmsCore vendor package",
        description = "The package name of the MicroG-RE / GmsCore build.",
        default = "app.revanced.android.gms",
    )

    execute {
        val vendorPackage = gmsCoreVendorOption.value ?: "app.revanced.android.gms"
        val vendorPrefix = vendorPackage.removeSuffix(".android.gms")
        val sha1Lower = MYGATE_ORIGINAL_CERT_SHA1.lowercase()
        val sha1Upper = MYGATE_ORIGINAL_CERT_SHA1.uppercase()

        // ── 1. AndroidManifest.xml: package spoofing metadata and queries ─────────────
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()

            // MicroG-RE / Morphe spoofing metadata (vendor package)
            application.appendChild("meta-data") {
                setAttribute("android:name", "$vendorPackage.SPOOFED_PACKAGE_NAME")
                setAttribute("android:value", MYGATE_PACKAGE_NAME)
            }
            application.appendChild("meta-data") {
                setAttribute("android:name", "$vendorPackage.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", sha1Lower)
            }
            // Explicit app.revanced.android.gms spoofing metadata
            application.appendChild("meta-data") {
                setAttribute("android:name", "app.revanced.android.gms.SPOOFED_PACKAGE_NAME")
                setAttribute("android:value", MYGATE_PACKAGE_NAME)
            }
            application.appendChild("meta-data") {
                setAttribute("android:name", "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", sha1Lower)
            }
            // Explicit app.morphe.android.gms spoofing metadata
            application.appendChild("meta-data") {
                setAttribute("android:name", "app.morphe.android.gms.SPOOFED_PACKAGE_NAME")
                setAttribute("android:value", MYGATE_PACKAGE_NAME)
            }
            application.appendChild("meta-data") {
                setAttribute("android:name", "app.morphe.android.gms.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", sha1Lower)
            }
            application.appendChild("meta-data") {
                setAttribute("android:name", "app.revanced.MICROG_PACKAGE_NAME")
                setAttribute("android:value", vendorPackage)
            }

            // Android 11+ Package Visibility Queries
            manifest.elements("queries").firstOrNull()?.let { queries ->
                queries.appendChild("package") { setAttribute("android:name", vendorPackage) }
                queries.appendChild("package") { setAttribute("android:name", "app.revanced.android.gms") }
                queries.appendChild("package") { setAttribute("android:name", "app.morphe.android.gms") }
                queries.appendChild("package") { setAttribute("android:name", "com.google.android.gms") }
            }

            // Manifest attribute transformations for C2DM
            manifest.elements().forEach { element ->
                element.attributeNames.forEach attributes@{ name ->
                    val value = element.attribute(name) ?: return@attributes
                    val transformed = value.replace("com.google.android.c2dm", "$vendorPrefix.android.c2dm")
                    if (transformed != value) {
                        element.setAttribute(name, transformed)
                    }
                }
            }
        }

        // ── 2. Bytecode: GMS Client Package & C2DM Redirection ────────────────────────
        fun replaceStrings(fromString: String, toString: String) {
            string(fromString).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(index, "const-string v$register, \"$toString\"")
            }
        }

        replaceStrings("com.google.android.gms", vendorPackage)
        replaceStrings("com.google.android.c2dm.intent.RECEIVE", "$vendorPrefix.android.c2dm.intent.RECEIVE")
        replaceStrings("com.google.android.c2dm.intent.REGISTER", "$vendorPrefix.android.c2dm.intent.REGISTER")
        replaceStrings("com.google.android.c2dm.intent.REGISTRATION", "$vendorPrefix.android.c2dm.intent.REGISTRATION")
        replaceStrings("com.google.android.c2dm.permission.RECEIVE", "$vendorPrefix.android.c2dm.permission.RECEIVE")
        replaceStrings("com.google.android.c2dm.permission.SEND", "$vendorPrefix.android.c2dm.permission.SEND")

        // ── 3. Bypass Google Play Services availability check ─────────────────────────
        Fingerprint(
            definingClass = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
            returnType = "I",
            parameters = listOf("Landroid/content/Context;", "I"),
            strings = listOf("MetadataValueReader", "This should never happen."),
        ).method.returnEarly(0)

        // ── 4. Spoof Firebase X-Android-Cert header ───────────────────────────────────
        // Re-signing changes the APK cert. Firebase Installations API validates it over HTTPS.
        // Runtime override matches the original developer certificate SHA-1.
        Fingerprint(
            returnType = "Ljava/net/HttpURLConnection;",
            parameters = listOf("Ljava/net/URL;", "Ljava/lang/String;"),
            strings = listOf(
                "X-Android-Cert",
                "Firebase Installations Service is unavailable. Please try again later.",
            ),
        ).let { fingerprint ->
            val method = fingerprint.method
            val xAndroidCertIndex = fingerprint.stringMatches.firstOrNull()?.index
            if (xAndroidCertIndex != null) {
                var addRequestPropertyInstrIndex = -1
                var targetRegister = -1
                for (i in xAndroidCertIndex until method.instructions.size) {
                    val instr = method.instructions[i]
                    if (instr.opcode == Opcode.INVOKE_VIRTUAL) {
                        val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.name == "addRequestProperty") {
                            addRequestPropertyInstrIndex = i
                            targetRegister = (instr as FiveRegisterInstruction).registerE
                            break
                        }
                    }
                }
                if (addRequestPropertyInstrIndex >= 0 && targetRegister >= 0) {
                    method.addInstruction(
                        addRequestPropertyInstrIndex,
                        "const-string v$targetRegister, \"$sha1Upper\"",
                    )
                }
            }
        }

        // ── 5. Fix flash notification routing ─────────────────────────────────────────
        // Fixes the app routing approval notifications to SplashActivity instead of NotificationCampaignActivity
        Fingerprint(
            definingClass = "Lcom/mygate/user/utilities/CommonUtility;",
            returnType = "Landroid/content/Intent;",
            parameters = listOf("Lcom/mygate/user/modules/notifications/entity/ApprovalNotification;"),
            strings = listOf("approvalNotification"),
        ).method.addInstructions(
            0,
            """
                new-instance v0, Landroid/content/Intent;
                sget-object v1, Lcom/mygate/user/app/AppController;->O:Lcom/mygate/user/app/AppController;
                invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
                move-result-object v1
                const-class v2, Lcom/mygate/user/modules/notifications/ui/NotificationCampaignActivity;
                invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                const-string v1, "approvalNotification"
                invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
                move-result-object v0
                return-object v0
            """,
        )

        // ── 6. Fix tokenNotFound troubleshooting gate ─────────────────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/common/preferences/ReadPref;",
            returnType = "I",
            parameters = emptyList(),
            strings = listOf("tokenNotFound"),
        ).method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // ── 7. Fix e-Intercom status spoof ────────────────────────────────────────────
        val returnOne = "const/4 v0, 0x1\ninvoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;\nmove-result-object v0\nreturn-object v0"
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/notifications/entity/AppNotificationSettings;",
            name = "getEintercom",
            returnType = "Ljava/lang/Integer;",
            parameters = emptyList(),
        ).method.addInstructions(0, returnOne)

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/notifications/entity/NotificationSettings;",
            name = "getNotify",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"1\"\nreturn-object v0")

        // ── 8. Fix troubleshooting ViewModel — emit valid NotificationSettings ────────
        val viewModelClassName =
            "Lcom/mygate/user/modules/testnotification/ui/viewmodel/TestNotificationTroubleshootingViewModel;"

        val settingsSuccessMethod = Fingerprint(
            definingClass = viewModelClassName,
            name = "onNotificationSettingsManagerSuccess",
            returnType = "V",
            parameters = listOf("Lcom/mygate/user/modules/notifications/events/manager/INotificationSettingsManagerSuccessEvent;"),
        ).method
        val settingsField = liveDataFieldOf(settingsSuccessMethod)
        if (settingsField != null) {
            val liveDataClassName = settingsField.type
            val liveDataMethodName = classDefByOrNull(liveDataClassName)?.methods
                ?.firstOrNull { it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/Object;" && it.returnType == "V" }
                ?.name ?: "l"

            val emitFakeSettings = """
                new-instance v0, Lcom/mygate/user/modules/notifications/entity/NotificationSettings;
                invoke-direct {v0}, Lcom/mygate/user/modules/notifications/entity/NotificationSettings;-><init>()V
                iget-object v1, p0, $viewModelClassName->${settingsField.name}:$liveDataClassName
                invoke-virtual {v1, v0}, $liveDataClassName->$liveDataMethodName(Ljava/lang/Object;)V
                return-void
            """.trimIndent()

            settingsSuccessMethod.apply {
                removeInstructions(instructions.size)
                addInstructions(0, emitFakeSettings)
            }

            Fingerprint(
                definingClass = viewModelClassName,
                name = "onNotificationSettingsManagerFailure",
                returnType = "V",
                parameters = listOf("Lcom/mygate/user/modules/notifications/events/manager/INotificationSettingsManagerFailureEvent;"),
            ).method.apply {
                removeInstructions(instructions.size)
                addInstructions(0, emitFakeSettings)
            }
        }

        val appSettingsSuccessMethod = Fingerprint(
            definingClass = viewModelClassName,
            name = "onNotificationSettingsManagerSuccess",
            returnType = "V",
            parameters = listOf("Lcom/mygate/user/modules/notifications/events/manager/IGetAppNotificationSettingManagerSuccess;"),
        ).method
        val appSettingsField = liveDataFieldOf(appSettingsSuccessMethod)
        if (appSettingsField != null) {
            val appFieldName = appSettingsField.name
            val appFieldType = appSettingsField.type
            val liveDataMethodName = classDefByOrNull(appFieldType)?.methods
                ?.firstOrNull { it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/Object;" && it.returnType == "V" }
                ?.name ?: "l"

            val emitFakeAppSettings = """
                iget-object v0, p0, $viewModelClassName->$appFieldName:$appFieldType
                new-instance v1, Lcom/mygate/user/modules/notifications/entity/AppNotificationSettings;
                const/4 v2, 0x0
                const-string v3, ""
                invoke-direct {v1, v2, v3, v2}, Lcom/mygate/user/modules/notifications/entity/AppNotificationSettings;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;)V
                invoke-virtual {v0, v1}, $appFieldType->$liveDataMethodName(Ljava/lang/Object;)V
                return-void
            """.trimIndent()

            appSettingsSuccessMethod.apply {
                removeInstructions(instructions.size)
                addInstructions(0, emitFakeAppSettings)
            }

            Fingerprint(
                definingClass = viewModelClassName,
                name = "onNotificationSettingsManagerFailure",
                returnType = "V",
                parameters = listOf("Lcom/mygate/user/modules/notifications/events/manager/IGetAppNotificationSettingManagerFailure;"),
            ).method.apply {
                removeInstructions(instructions.size)
                addInstructions(0, emitFakeAppSettings)
            }
        }
    }
}
