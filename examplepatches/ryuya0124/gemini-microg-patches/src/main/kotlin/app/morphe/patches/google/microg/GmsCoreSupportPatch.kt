package app.morphe.patches.google.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.google.common.editManifest
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.replaceStrings
import app.morphe.patcher.string
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import app.morphe.patcher.StringComparisonType

/**
 * Google アプリ（AGSA）のマニフェスト調整パッチ（表示名、Split制約解除、MicroG可視性、クラッシュレシーバー無効化）
 */
val googleAppManifestPatch = rawResourcePatch(
    name = "Google App Manifest Tweaks",
    description = "アプリ表示名を 'Google (Morphe)' に変更し、MicroG可視性を付与し、Split制約解除とクラッシュレシーバー無効化を行います。",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox"))

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val originalSha1 = VersionHookRegistry.target(HookId.GMS_CORE_REDIRECT, packageMetadata).value("originalGoogleSha1")
        editManifest { document ->
            val appNode = document.elements("application").firstOrNull()
            if (appNode != null) {
                // MicroG-RE (7.0.0) 向けの署名偽装用メタデータ
                for ((name, value) in listOf(
                    "app.revanced.android.gms.SPOOFED_PACKAGE_NAME" to "com.google.android.googlequicksearchbox",
                    "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" to originalSha1,
                    "app.revanced.MICROG_PACKAGE_NAME" to "app.revanced.android.gms",
                )) {
                    appNode.addChild("meta-data").apply { setAndroid("name", name); setAndroid("value", value) }
                }
            }

            // Android 11+ Package Visibility 対策: queries に MicroG-RE パッケージを追加
            val queriesNode = document.elements("queries").firstOrNull() ?: document.root.addChild("queries")
            queriesNode.addChild("package").setAndroid("name", "app.revanced.android.gms")
            println("[GoogleAppManifestPatch] Added app.revanced.android.gms to <queries>")

            // Exact Alarm パーミッション追加（SecurityException によるクラッシュ防止）
            for (perm in listOf(
                "android.permission.GET_ACCOUNTS",
                "app.revanced.gms.EXTENDED_ACCESS",
                "android.permission.SCHEDULE_EXACT_ALARM",
                "android.permission.USE_EXACT_ALARM"
            )) {
                document.root.addChild("uses-permission").setAndroid("name", perm)
            }

            // Split APK のスタンドアロン化（単体インストール時の INSTALL_FAILED_MISSING_SPLIT エラー防止）
            document.root.removeAttribute("requiredSplitTypes")
            document.root.removeAttribute("splitTypes")

            // splits 関連のメタデータを削除
            document.elements("meta-data").filter {
                it.android("name") == "com.android.vending.splits.required" || it.android("name") == "com.android.vending.splits"
            }.forEach { it.remove() }
            VersionHookRegistry.logHook(HookId.SPLIT_RESTRICTION_REMOVAL, "Manifest", "SUCCESS", "Removed split restrictions")

            // アプリ表示名を "Google (Morphe)" に変更
            appNode?.setAndroid("label", "Google (Morphe)")
            for (act in document.elements("activity")) {
                if (act.android("name").contains("RobinEntryPointActivity")) act.setAndroid("label", "Gemini (Morphe)")
            }

            // activity-alias のラベル更新（特に SearchActivity 等のメインランチャーアイコン）
            for (alias in document.elements("activity-alias")) {
                val name = alias.android("name")
                alias.setAndroid("label", if (name.contains("Robin") || name.contains("bard")) "Gemini (Morphe)" else "Google (Morphe)")
            }
            VersionHookRegistry.logHook(HookId.APP_LABEL_UPDATE, "Manifest", "SUCCESS", "Updated app and alias labels to 'Google (Morphe)'")

            // クラッシュを引き起こすブート時・更新時のレシーバーを無効化
            var disabledReceivers = 0
            for (recv in document.elements("receiver")) {
                val name = recv.android("name")
                if (name.contains("BootOrUpdateReceiver") || name.contains("GoogleAppProcessBootOrUpdateReceiver")) {
                    recv.setAndroidBoolean("enabled", false)
                    println("[GoogleAppManifestPatch] Disabled crash-prone receiver: $name")
                    disabledReceivers++
                }
            }
            println("[GoogleAppManifestPatch] Total disabled crash-prone receivers: $disabledReceivers")
        }
    }
}

/**
 * Google アプリ（AGSA）内の GMS パッケージ名および Action 名を MicroG-RE (app.revanced.android.gms) へ包括リダイレクトするバイトコードパッチ
 */
val gmsCoreBytecodePatch = bytecodePatch(
    name = "GmsCore Bytecode Redirect (MicroG RE)",
    description = "Redirects GMS package/permissions/provider references to app.revanced.android.gms. Tested with microG RE 7.3.0; the previous 7.0.0 title was not a version requirement.",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox"))

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val pkgName = packageMetadata.packageName
        val verName = packageMetadata.versionName
        println("[GmsCoreBytecodePatch] Target App: $pkgName (Version: $verName)")

        val targetPrefix = "com.google.android.gms"
        val replacementPrefix = "app.revanced.android.gms"
        val vendorTarget = "com.google"
        val vendorReplacement = "app.revanced"

        // ReVanced の GmsCore support と同じ範囲だけを書き換える。
        // GMS の service action は MicroG が互換名のまま受け取るため、変更してはいけない。
        val exactReplaceMap = mutableMapOf<String, String>()
        exactReplaceMap[targetPrefix] = replacementPrefix
        exactReplaceMap[vendorTarget] = vendorReplacement
        exactReplaceMap["subscribedfeeds"] = "$vendorReplacement.subscribedfeeds"
        val gmsPermissions = setOf(
            "com.google.android.providers.gsf.permission.READ_GSERVICES",
            "com.google.android.c2dm.permission.RECEIVE",
            "com.google.android.c2dm.permission.SEND",
            "com.google.android.gtalkservice.permission.GTALK_SERVICE",
            "com.google.android.googleapps.permission.GOOGLE_AUTH",
            "com.google.android.googleapps.permission.GOOGLE_AUTH.cp",
            "com.google.android.googleapps.permission.GOOGLE_AUTH.local",
            "com.google.android.googleapps.permission.GOOGLE_AUTH.mail",
            "com.google.android.googleapps.permission.GOOGLE_AUTH.writely",
            "com.google.android.gms.permission.ACTIVITY_RECOGNITION",
            "com.google.android.gms.permission.AD_ID",
            "com.google.android.gms.permission.AD_ID_NOTIFICATION",
            "com.google.android.gms.auth.api.phone.permission.SEND",
            "com.google.android.gms.permission.CAR_INFORMATION",
            "com.google.android.gms.permission.CAR_SPEED",
            "com.google.android.gms.permission.CAR_FUEL",
            "com.google.android.gms.permission.CAR_MILEAGE",
            "com.google.android.gms.permission.CAR_VENDOR_EXTENSION",
            "com.google.android.gms.locationsharingreporter.periodic.STATUS_UPDATE",
            "com.google.android.gms.auth.permission.GOOGLE_ACCOUNT_CHANGE"
        )
        for (permission in gmsPermissions) {
            exactReplaceMap[permission] = permission.replace(vendorTarget, vendorReplacement)
        }
        // ContentProviderClient can be acquired by bare authority, without a
        // content:// URI. Redirect both forms to microG's account provider.
        for (authority in GmsConstants.AUTHORITIES) {
            exactReplaceMap[authority] = authority.replace(vendorTarget, vendorReplacement)
        }
        // These activities use namespaced actions in the installed microG
        // manifest. Binder service actions remain the original GMS names.
        for (action in listOf(
            "com.google.android.gms.common.account.CHOOSE_ACCOUNT",
            "com.google.android.gms.common.account.CHOOSE_ACCOUNT_USERTILE",
            "com.google.android.gms.auth.GOOGLE_SIGN_IN"
        )) {
            exactReplaceMap[action] = action.replace(vendorTarget, vendorReplacement)
        }
        println("[GmsCoreBytecodePatch] Loaded ${exactReplaceMap.size} safe package/permission mappings")

        fun replacementFor(original: String): String? {
            exactReplaceMap[original]?.let { return it }
            if (!original.startsWith("content://")) return null
            for (auth in GmsConstants.AUTHORITIES) {
                val prefix = "content://$auth"
                if (original.startsWith(prefix)) {
                    val repAuth = auth.replace(vendorTarget, vendorReplacement)
                    return original.replace(prefix, "content://$repAuth")
                }
            }
            return if (original.startsWith("content://subscribedfeeds")) "content://app.revanced.subscribedfeeds" else null
        }

        // 2. One indexed pass over the same strings as before. Classes become mutable
        // only when one of their const-string instructions is actually replaced.
        val filters = exactReplaceMap.keys.map { string(it) } +
            GmsConstants.AUTHORITIES.map { string("content://$it", StringComparisonType.STARTS_WITH) } +
            string("content://subscribedfeeds", StringComparisonType.STARTS_WITH)
        val totalReplacements = replaceStrings(filters) { _, _, original -> replacementFor(original) }
        VersionHookRegistry.logHook(
            HookId.GMS_CORE_REDIRECT,
            "DEX-Wide",
            "SUCCESS",
            "Replaced $totalReplacements occurrences of GMS strings"
        )
    }
}

/**
 * GooglePlayServicesUtil および GoogleSignatureVerifier の署名検証・可用性チェックをバイパスするパッチ
 *
 * ReVanced / Morphe クローン環境下では署名が変更されているため、公式 GMS および MicroG に対する
 * 署名検証で SERVICE_INVALID (9) が返され、アカウント切り替えや機能フラグ同期でスタックします。
 * 本パッチは署名検証および可用性チェックを SUCCESS (0) / true に短絡バイパスします。
 */
val gmsSignatureBypassPatch = bytecodePatch(
    name = "GmsCore Signature and Availability Bypass",
    description = "Google Play Services の署名不一致 (SERVICE_INVALID) や可用性チェックを常時成功 (SUCCESS / true) にバイパスします。",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox"))

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val pkgName = packageMetadata.packageName
        val verName = packageMetadata.versionName
        println("[GmsSignatureBypassPatch] Applying signature and availability bypass to $pkgName ($verName)")

        // 1. GooglePlayServicesUtil のバイパス (isGooglePlayServicesAvailable -> 0)
        val availabilitySpec = VersionHookRegistry.target(HookId.GMS_SIGNATURE_BYPASS, packageMetadata)
        val certificateSpec = VersionHookRegistry.target(HookId.GMS_CERTIFICATE_VERIFIER, packageMetadata)
        val playUtilCandidateStrings = availabilitySpec.anchorStrings
        val playUtilClasses = mutableSetOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        for (cand in playUtilCandidateStrings) {
            playUtilClasses.addAll(classDefByStrings(cand))
        }
        println("[GmsSignatureBypassPatch] Found ${playUtilClasses.size} classes matching GooglePlayServicesUtil candidates")
        var patchedPlayUtilCount = 0
        fun isAvailabilityMethod(method: com.android.tools.smali.dexlib2.iface.Method): Boolean {
            val params = method.parameterTypes
            return availabilitySpec.matches(method) && params.size == 2 &&
                params[0] == "Landroid/content/Context;" && params[1] == "I" && method.returnType == "I"
        }
        for (classDef in playUtilClasses.filter { c -> c.methods.any { it.implementation != null && isAvailabilityMethod(it) } }) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                // isGooglePlayServicesAvailable(Context, int) -> int (0 = SUCCESS)
                val params = method.parameterTypes
                if (availabilitySpec.matches(method) && params.size == 2 &&
                    params[0] == "Landroid/content/Context;" &&
                    params[1] == "I" &&
                    method.returnType == "I") {

                    check(method.implementation!!.registerCount >= 1) { "Availability bypass requires v0" }
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x0
                            return v0
                        """
                    )
                    patchedPlayUtilCount++
                    println("[GmsSignatureBypassPatch] Patched isGooglePlayServicesAvailable in ${mutableClass.type}->${method.name}")
                }
            }
        }

        // 2. GoogleSignatureVerifier のバイパス (c(...) -> true, b(...) -> true)
        val sigVerifierClasses = classDefByStrings(certificateSpec.anchorStrings.single())
        println("[GmsSignatureBypassPatch] Found ${sigVerifierClasses.size} classes matching GoogleSignatureVerifier")
        var patchedSigVerifierCount = 0
        for (classDef in sigVerifierClasses.filter { c -> c.methods.any { it.implementation != null && it.returnType == "Z" } }) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                // boolean を返すメソッド（c(PackageInfo, boolean) や b(String)）を全て true にバイパス
                if (method.returnType == "Z") {
                    check(certificateSpec.matches(method))
                    check("${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}" in certificateSpec.methodSignatures)
                    check(method.implementation!!.registerCount >= 1) { "Certificate bypass requires v0" }
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """
                    )
                    patchedSigVerifierCount++
                    println("[GmsSignatureBypassPatch] Patched GoogleSignatureVerifier method ${mutableClass.type}->${method.name}${method.parameterTypes}")
                }
            }
        }

        check(patchedPlayUtilCount == availabilitySpec.expectedMatches)
        check(patchedSigVerifierCount == certificateSpec.expectedMatches)
        VersionHookRegistry.logHook(
            HookId.GMS_SIGNATURE_BYPASS,
            "Bytecode",
            "SUCCESS",
            "Patched $patchedPlayUtilCount GooglePlayServicesUtil methods and $patchedSigVerifierCount GoogleSignatureVerifier methods"
        )
    }
}
