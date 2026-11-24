// Portions derived from zeldrisho/morphe-patches (GPL-3.0):
// patches/src/main/kotlin/com/zeldrisho/patches/zalo/{backup,microg}/
// Modified by Nezumi-2711 on <2026-10-20>: merged into a single patch, ...

package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import org.w3c.dom.Element

private val driveCompatibility = Compatibility(
    name = "Zalo",
    packageName = "com.zing.zalo",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0068FF,
    targets = listOf(AppTarget(version = "26.11.01")),
)

private object BackupConfiguration : Fingerprint(
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;", "Lorg/json/JSONObject;", "Lorg/json/JSONObject;", "Z"),
    filters = listOf(string("ENABLE_BACKUP_MEDIA")),
)

private object BackupEligibility : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lcom/zing/zalo/data/backuprestore/model/TargetBackupInfo;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/text/TextUtils;", name = "isEmpty"),
        fieldAccess(definingClass = "Landroid/util/Patterns;", name = "EMAIL_ADDRESS"),
        methodCall(definingClass = "Ljava/util/regex/Matcher;", name = "matches"),
    ),
)

// GMS auth helpers are located by their string constants instead of obfuscated names.
// GoogleAuthUtil internals: binds "com.google.android.gms.auth.GetToken" and validates account types.
private object GoogleAuthTokenService : Fingerprint(
    filters = listOf(string("com.google.android.gms.auth.GetToken")),
)

// Zalo's SMLGoogleAuthProvider: builds Account(name, "com.google") to fetch the Drive account id.
private object GoogleAccountIdProvider : Fingerprint(
    filters = listOf(string("^^_account_id_^^")),
)

// Drive token refresh used by media backup: builds Account(email, "com.google") for the drive.appdata scope.
// Without the account-type rewrite microG rejects it and media backup stops with gdrive_token_invalid.
private object DriveTokenRefresher : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("Check refresh Google Auth token: currToken="),
        string("com.google"),
        string("oauth2: https://www.googleapis.com/auth/drive.appdata"),
    ),
)

// Drive token getter used by every backup/restore path: reuses the cached token or calls the refresher above.
private object DriveTokenGetter : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Z"),
    filters = listOf(string("appBackupGdriveToken")),
)

private const val TYPES_LATEST = 9
private const val SYNC_VIEW = "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;"
private const val MANAGE_VIEW = "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;"
private const val CHOOSE_ACCOUNT_SHEET = "Lcom/zing/zalo/ui/backuprestore/encryption/setup/drive/ChooseDriveAccountBS;"
private const val ZCLOUD_LOGIN_SHEET = "Lcom/zing/zalo/ui/zalocloud/migration/ZCloudDriveLoginBS;"
private fun replaceBody(method: MutableMethod, minRegisters: Int, body: String) {
    val implementation = method.implementation ?: error("Missing Drive method body")
    check(implementation.tryBlocks.isEmpty()) { "Drive method has unexpected try blocks" }
    if (implementation.registerCount < minRegisters) {
        val registerCount = MutableMethodImplementation::class.java.getDeclaredField("registerCount")
        registerCount.isAccessible = true
        registerCount.setInt(implementation, minRegisters)
    }
    repeat(implementation.instructions.size) { implementation.removeInstruction(0) }
    method.addInstructionsWithLabels(0, body)
}

private fun replaceAccountPicker(method: MutableMethod, contextOwner: String) = replaceBody(method, 10, """
    const/4 v0, 0x1
    new-array v3, v0, [Ljava/lang/String;
    const/4 v1, 0x0
    const/4 v2, 0x0
    const-string v4, "app.revanced"
    aput-object v4, v3, v1
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    invoke-static/range {v1 .. v7}, Landroid/accounts/AccountManager;->newChooseAccountIntent(Landroid/accounts/Account;Ljava/util/List;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    move-result-object v0
    invoke-virtual {p0}, $contextOwner->getContext()Landroid/content/Context;
    move-result-object v2
    check-cast v2, Landroid/app/Activity;
    invoke-static {v2}, $MICROG_SUPPORT->checkGmsCore(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :microg_missing
    const/16 v1, 0x3eb
    invoke-virtual {v2, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :microg_missing
    return-void
""".trimIndent())

private val driveMicroGManifest = resourcePatch {
    compatibleWith(driveCompatibility)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element
            val queries = (0 until manifest.childNodes.length).map { manifest.childNodes.item(it) }
                .filterIsInstance<Element>().firstOrNull { it.tagName == "queries" }
                ?: document.createElement("queries").also { manifest.appendChild(it) }
            if ((0 until queries.childNodes.length).none {
                    val node = queries.childNodes.item(it) as? Element
                    node?.tagName == "package" && node.getAttribute("android:name") == "app.revanced.android.gms"
                }) {
                queries.appendChild(document.createElement("package").apply {
                    setAttribute("android:name", "app.revanced.android.gms")
                })
            }
            val metadata = mapOf(
                "app.revanced.android.gms.SPOOFED_PACKAGE_NAME" to "com.zing.zalo",
                "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" to STOCK_ZALO_CERT,
            )
            metadata.forEach { (name, value) ->
                val entries = (0 until application.childNodes.length).map { application.childNodes.item(it) }
                    .filterIsInstance<Element>().filter {
                        it.tagName == "meta-data" && it.getAttribute("android:name") == name
                    }
                check(entries.size <= 1 && (entries.isEmpty() || entries.single().getAttribute("android:value") == value)) {
                    "Conflicting microG identity metadata: $name"
                }
                if (entries.isEmpty()) application.appendChild(document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                })
            }
        }
    }
}

private const val STOCK_ZALO_CERT =
    "3082019d30820106a00302010202044f178971300d06092a864886f70d010105050030133111300f060355040313087a" +
        "696e6774616c6b301e170d3132303131393033303933375a170d3337303131323033303933375a30133111300f060355" +
        "040313087a696e6774616c6b30819f300d06092a864886f70d010101050003818d0030818902818100d8dc86eeaccd8d" +
        "7fe722391a3a1ae034082b24af0ca63244d2ff12cc9fda4d6a9c1bdff5c587c648ac3e99e54852ca52cee01203cb99f5" +
        "94593ab1e023bcd8a6be9b1e056c3de73631c56f85f5ed8576e850f67ddbca000b5338481df238a0d27c293b9e28b69a" +
        "ce24c9c9263063223832094c85201001b7be7f2107a452835f0203010001300d06092a864886f70d0101050500038181" +
        "00aebd8af27fc3178b6082d1db7a5f66aad1db55c823145c5dd21fe721e229f90b7702738654432b5c5e8667f4995e9d" +
        "206adb7d26c3db70f2c971638d44b762416df5d510a08526ed91fdd1c1e8e6751d8832ec32154c11680e647e605c0e86" +
        "12702c70524324a611424c69c4d3e43a2756551eec5f4e4de966331194c74484a1"

private fun enableDriveMediaBackup(method: MutableMethod) {
    val instructions = method.implementation!!.instructions.toList()
    val keys = instructions.indices.filter { index ->
        (instructions[index] as? ReferenceInstruction)?.reference.let { it as? StringReference }
            ?.string == "ENABLE_BACKUP_MEDIA"
    }
    check(keys.size == 1) { "Expected one ENABLE_BACKUP_MEDIA key" }
    val index = keys.single()
    val keyRegister = (instructions[index] as OneRegisterInstruction).registerA
    val invoke = instructions.getOrNull(index + 1) as? FiveRegisterInstruction
        ?: error("Backup flag setter is not a fixed-register invoke")
    val reference = (invoke as? ReferenceInstruction)?.reference as? MethodReference
    check(invoke.opcode == Opcode.INVOKE_STATIC && invoke.registerCount == 3 &&
        invoke.registerC == keyRegister && invoke.registerD != invoke.registerE &&
        reference?.parameterTypes == listOf("Ljava/lang/String;", "Z", "Z") && reference.returnType == "V") {
        "Unexpected backup flag setter"
    }
    method.addInstructions(index + 1, "const/4 v${invoke.registerD}, 0x1")
}

private fun Method.invokes(predicate: (MethodReference) -> Boolean) =
    implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let(predicate) == true
    } == true

@Suppress("unused")
val driveBackupMicroGPatch = bytecodePatch(
    name = "Drive backup via microG",
    description = "Enable Google Drive photo backup and use microG for Drive accounts and authentication.",
    default = true,
) {
    compatibleWith(driveCompatibility)
    dependsOn(nativeSignaturePatch)
    dependsOn(driveMicroGManifest)
    extendWith("extensions/extension.mpe")

    execute {
        check(BackupConfiguration.matchAll(1..1).size == 1)
        check(BackupEligibility.matchAll(1..1).size == 1)
        enableDriveMediaBackup(BackupConfiguration.method)
        val eligibility = BackupEligibility.method
        check(eligibility.implementation?.registerCount ?: 0 >= 1)
        check(eligibility.implementation!!.tryBlocks.isEmpty())
        repeat(eligibility.implementation!!.instructions.size) {
            eligibility.implementation!!.removeInstruction(0)
        }
        eligibility.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        check(GoogleAuthTokenService.matchAll(1..1).size == 1)
        check(GoogleAccountIdProvider.matchAll(1..1).size == 1)
        check(DriveTokenRefresher.matchAll(1..1).size == 1)
        val authOwners = setOf(
            GoogleAuthTokenService.classDef.type, GoogleAccountIdProvider.classDef.type, DriveTokenRefresher.classDef.type,
        )
        val scopedAccounts = setOf(
            SYNC_VIEW, MANAGE_VIEW, "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountMediaRestoreView;",
            CHOOSE_ACCOUNT_SHEET, ZCLOUD_LOGIN_SHEET,
        )
        val owners = scopedAccounts + authOwners + "Lcom/zing/zalo/ui/ZaloLauncherActivity;"
        // Account picker methods, found by shape: the Sync view's (String)V that calls
        // AccountManager.addAccount, and the Manage view's try-free (String)V that looks up accounts and delegates to it.
        fun isStringConsumer(m: Method) = m.parameterTypes == listOf("Ljava/lang/String;") && m.returnType == "V"
        val syncPicker = classDefBy(SYNC_VIEW).methods.single { m ->
            isStringConsumer(m) && m.invokes { it.definingClass == "Landroid/accounts/AccountManager;" && it.name == "addAccount" }
        }.name
        val managePicker = classDefBy(MANAGE_VIEW).methods.single { m ->
            isStringConsumer(m) && m.invokes { it.name == syncPicker && it.parameterTypes == listOf("Ljava/lang/String;") } &&
                m.invokes { it.name == "getAccountsByType" } && m.implementation!!.tryBlocks.isEmpty()
        }.name
        val counts = mutableMapOf("binding" to 0, "type" to 0, "picker" to 0, "refresh" to 0, "result" to 0, "launch" to 0)
        classDefForEach { classDef ->
            if (classDef.type !in owners) return@classDefForEach
            val mutableClass = mutableClassDefBy(classDef)
            classDef.methods.filter { it.implementation != null }.forEach { original ->
                val method = mutableClass.methods.single { it.name == original.name &&
                    it.parameterTypes == original.parameterTypes && it.returnType == original.returnType }
                val picker = (classDef.type == SYNC_VIEW && original.name == syncPicker ||
                    classDef.type == MANAGE_VIEW && original.name == managePicker) &&
                    original.parameterTypes == listOf("Ljava/lang/String;") && original.returnType == "V"
                if (picker) {
                    replaceAccountPicker(method, classDef.type)
                    counts["picker"] = counts.getValue("picker") + 1
                    return@forEach
                }
                original.implementation!!.instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    val literal = (reference as? StringReference)?.string
                    val register = (instruction as? OneRegisterInstruction)?.registerA
                    if (literal == "authAccount" && classDef.type == SYNC_VIEW && original.name == "onActivityResult") {
                        method.replaceInstruction(index, "sget-object v$register, Landroid/accounts/AccountManager;->KEY_ACCOUNT_NAME:Ljava/lang/String;")
                        counts["result"] = counts.getValue("result") + 1
                    } else if (literal == "com.google.android.gms" && classDef.type in authOwners) {
                        method.replaceInstruction(index, "const-string v$register, \"app.revanced.android.gms\"")
                        counts["binding"] = counts.getValue("binding") + 1
                    } else if (literal == "com.google" && classDef.type in scopedAccounts + authOwners) {
                        method.replaceInstruction(index, "const-string v$register, \"app.revanced\"")
                        counts["type"] = counts.getValue("type") + 1
                    }
                    val call = reference as? MethodReference
                    if (classDef.type == SYNC_VIEW && original.name == "onActivityResult" &&
                        call?.definingClass == SYNC_VIEW && call.parameterTypes == listOf("Ljava/lang/String;") && call.returnType == "V") {
                        val invoke = instruction as? FiveRegisterInstruction ?: error("Unexpected account refresh invoke")
                        check(invoke.registerCount == 2)
                        method.replaceInstruction(index, "invoke-static {v${invoke.registerC}, v${invoke.registerD}}, $MICROG_SUPPORT->scheduleAccountRefresh(Ljava/lang/Object;Ljava/lang/String;)V")
                        counts["refresh"] = counts.getValue("refresh") + 1
                    }
                }
                if (classDef.type == "Lcom/zing/zalo/ui/ZaloLauncherActivity;" && original.name == "onCreate" &&
                    original.parameterTypes == listOf("Landroid/os/Bundle;")) {
                    check(method.implementation!!.registerCount > 2)
                    method.addInstructions(0, "move-object/from16 v0, p0\ninvoke-static {v0}, $MICROG_SUPPORT->checkGmsCore(Landroid/app/Activity;)Z\nmove-result v0")
                    counts["launch"] = counts.getValue("launch") + 1
                }
            }
        }
        check(counts == mapOf("binding" to 1, "type" to TYPES_LATEST, "picker" to 2, "refresh" to 1, "result" to 1, "launch" to 1)) {
            "Unexpected Zalo Drive microG targets: $counts"
        }
        wrapDriveTokenRefresh(DriveTokenGetter.also { check(it.matchAll(1..1).size == 1) }.method,
            DriveTokenRefresher.classDef.type, DriveTokenRefresher.method.name)
    }
}

// Routes the background token refresh through DriveTokenRecovery: retries transient failures with a forced
// refresh and posts a notification that opens microG's consent screen when user action is required.
private fun wrapDriveTokenRefresh(getter: MutableMethod, refresherType: String, refreshName: String) {
    val calls = getter.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL && reference?.definingClass == refresherType &&
            reference.name == refreshName && reference.parameterTypes == listOf("Ljava/lang/Object;") &&
            reference.returnType == "Ljava/lang/Object;"
    }
    check(calls.size == 1) { "Expected one Drive token refresh call, found ${calls.size}" }
    val (index, instruction) = calls.single()
    val invoke = instruction as FiveRegisterInstruction
    check(invoke.registerCount == 2) { "Unexpected Drive token refresh invoke" }
    getter.replaceInstruction(index, "invoke-static {v${invoke.registerC}, v${invoke.registerD}}, " +
        "$DRIVE_TOKEN_RECOVERY->refresh(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;")
}