package app.morphe.patches.google.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
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
import org.w3c.dom.Element

/**
 * Google アプリ（AGSA）のマニフェスト調整パッチ（表示名、Split制約解除、MicroG可視性、クラッシュレシーバー無効化）
 */
val googleAppManifestPatch = resourcePatch(
    name = "Google App Manifest Tweaks",
    description = "アプリ表示名を 'Google (Morphe)' に変更し、MicroG可視性を付与し、Split制約解除とクラッシュレシーバー無効化を行います。",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        document("AndroidManifest.xml").use { document ->
            val appNode = document.getElementsByTagName("application").item(0) as? Element
            if (appNode != null) {
                // MicroG-RE (7.0.0) 向けの署名偽装用メタデータ
                val metaName = document.createElement("meta-data")
                metaName.setAttribute("android:name", "app.revanced.android.gms.SPOOFED_PACKAGE_NAME")
                metaName.setAttribute("android:value", "com.google.android.googlequicksearchbox")
                appNode.appendChild(metaName)

                val metaSig = document.createElement("meta-data")
                metaSig.setAttribute("android:name", "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE")
                metaSig.setAttribute("android:value", VersionHookRegistry.target(HookId.GMS_CORE_REDIRECT, packageMetadata).value("originalGoogleSha1"))
                appNode.appendChild(metaSig)

                val metaPkg = document.createElement("meta-data")
                metaPkg.setAttribute("android:name", "app.revanced.MICROG_PACKAGE_NAME")
                metaPkg.setAttribute("android:value", "app.revanced.android.gms")
                appNode.appendChild(metaPkg)
            }

            // Android 11+ Package Visibility 対策: queries に MicroG-RE パッケージを追加
            val queriesNodes = document.getElementsByTagName("queries")
            val queriesNode = if (queriesNodes.length > 0) {
                queriesNodes.item(0) as Element
            } else {
                val q = document.createElement("queries")
                document.documentElement.appendChild(q)
                q
            }
            val pkgElem = document.createElement("package")
            pkgElem.setAttribute("android:name", "app.revanced.android.gms")
            queriesNode.appendChild(pkgElem)
            println("[GoogleAppManifestPatch] Added app.revanced.android.gms to <queries>")

            // Exact Alarm パーミッション追加（SecurityException によるクラッシュ防止）
            val alarmPermissions = listOf(
                "android.permission.GET_ACCOUNTS",
                "app.revanced.gms.EXTENDED_ACCESS",
                "android.permission.SCHEDULE_EXACT_ALARM",
                "android.permission.USE_EXACT_ALARM"
            )
            for (perm in alarmPermissions) {
                val pElem = document.createElement("uses-permission")
                pElem.setAttribute("android:name", perm)
                document.documentElement.appendChild(pElem)
            }

            // Split APK のスタンドアロン化（単体インストール時の INSTALL_FAILED_MISSING_SPLIT エラー防止）
            val manifestElement = document.documentElement
            val androidNs = "http://schemas.android.com/apk/res/android"
            manifestElement.removeAttributeNS(androidNs, "requiredSplitTypes")
            manifestElement.removeAttributeNS(androidNs, "splitTypes")
            manifestElement.removeAttribute("android:requiredSplitTypes")
            manifestElement.removeAttribute("android:splitTypes")
            manifestElement.removeAttribute("requiredSplitTypes")
            manifestElement.removeAttribute("splitTypes")

            // splits 関連のメタデータを削除
            val metaDataNodes = document.getElementsByTagName("meta-data")
            val toRemove = mutableListOf<Element>()
            for (i in 0 until metaDataNodes.length) {
                val node = metaDataNodes.item(i) as Element
                val name = node.getAttributeNS(androidNs, "name").ifEmpty { node.getAttribute("android:name") }
                if (name == "com.android.vending.splits.required" || name == "com.android.vending.splits") {
                    toRemove.add(node)
                }
            }
            for (node in toRemove) {
                node.parentNode?.removeChild(node)
            }
            VersionHookRegistry.logHook(HookId.SPLIT_RESTRICTION_REMOVAL, "Manifest", "SUCCESS", "Removed split restrictions")

            // アプリ表示名を "Google (Morphe)" に変更
            appNode?.setAttribute("android:label", "Google (Morphe)")

            val activityNodes = document.getElementsByTagName("activity")
            for (i in 0 until activityNodes.length) {
                val act = activityNodes.item(i) as Element
                val name = act.getAttribute("android:name")
                if (name.contains("RobinEntryPointActivity")) {
                    act.setAttribute("android:label", "Gemini (Morphe)")
                }
            }

            // activity-alias のラベル更新（特に SearchActivity 等のメインランチャーアイコン）
            val aliasNodes = document.getElementsByTagName("activity-alias")
            for (i in 0 until aliasNodes.length) {
                val alias = aliasNodes.item(i) as Element
                val name = alias.getAttribute("android:name")
                if (name.contains("Robin") || name.contains("bard")) {
                    alias.setAttribute("android:label", "Gemini (Morphe)")
                } else {
                    alias.setAttribute("android:label", "Google (Morphe)")
                }
            }
            VersionHookRegistry.logHook(HookId.APP_LABEL_UPDATE, "Manifest", "SUCCESS", "Updated app and alias labels to 'Google (Morphe)'")

            // クラッシュを引き起こすブート時・更新時のレシーバーを無効化
            val receiverNodes = document.getElementsByTagName("receiver")
            var disabledReceivers = 0
            for (i in 0 until receiverNodes.length) {
                val recv = receiverNodes.item(i) as Element
                val name = recv.getAttribute("android:name")
                if (name.contains("BootOrUpdateReceiver") || name.contains("GoogleAppProcessBootOrUpdateReceiver")) {
                    recv.setAttribute("android:enabled", "false")
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
    name = "GmsCore Bytecode Redirect (MicroG RE 7.0.0)",
    description = "Google アプリ内部の GMS パッケージ名・権限・Provider authority を MicroG RE へリダイレクトします。",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")

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

        // 2. 対象となる全クラスの収集 (完全一致検索)
        val targetClasses = LinkedHashSet<ClassDef>()
        for ((orig, _) in exactReplaceMap) {
            targetClasses.addAll(classDefByStrings(orig, StringComparisonType.EQUALS))
        }
        for (auth in GmsConstants.AUTHORITIES) {
            targetClasses.addAll(classDefByStrings("content://$auth", StringComparisonType.STARTS_WITH))
        }
        targetClasses.addAll(classDefByStrings("content://subscribedfeeds", StringComparisonType.STARTS_WITH))
        println("[GmsCoreBytecodePatch] Collected ${targetClasses.size} classes referencing targeted GMS strings")

        var totalReplacements = 0
        for (classDef in targetClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                val insList = method.instructions
                for (idx in insList.indices) {
                    val ins = insList[idx]
                    if (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) {
                        val ref = (ins as ReferenceInstruction).reference
                        if (ref is StringReference) {
                            val original = ref.string
                            var replaced: String? = exactReplaceMap[original]
                            if (replaced == null && original.startsWith("content://")) {
                                for (auth in GmsConstants.AUTHORITIES) {
                                    val prefix = "content://$auth"
                                    if (original.startsWith(prefix)) {
                                        val repAuth = auth.replace(vendorTarget, vendorReplacement)
                                        replaced = original.replace(prefix, "content://$repAuth")
                                        break
                                    }
                                }
                                if (replaced == null && original.startsWith("content://subscribedfeeds")) {
                                    replaced = "content://app.revanced.subscribedfeeds"
                                }
                            }
                            if (replaced != null && original != replaced) {
                                val reg = (ins as OneRegisterInstruction).registerA
                                val newIns = if (ins.opcode == Opcode.CONST_STRING_JUMBO) {
                                    BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, reg, ImmutableStringReference(replaced))
                                } else {
                                    BuilderInstruction21c(Opcode.CONST_STRING, reg, ImmutableStringReference(replaced))
                                }
                                method.replaceInstruction(idx, newIns)
                                totalReplacements++
                            }
                        }
                    }
                }
            }
        }
        VersionHookRegistry.logHook(
            HookId.GMS_CORE_REDIRECT,
            "DEX-Wide",
            "SUCCESS",
            "Replaced $totalReplacements occurrences of GMS strings across ${targetClasses.size} classes"
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
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val pkgName = packageMetadata.packageName
        val verName = packageMetadata.versionName
        println("[GmsSignatureBypassPatch] Applying signature and availability bypass to $pkgName ($verName)")

        fun ensureRegisters(impl: Any?, minRegs: Int) {
            if (impl == null) return
            try {
                val field = impl.javaClass.getDeclaredField("registerCount")
                field.isAccessible = true
                val cur = field.getInt(impl)
                if (cur < minRegs) {
                    field.setInt(impl, minRegs)
                    println("[GmsSignatureBypassPatch] Expanded registerCount from $cur to $minRegs")
                }
            } catch (e: Exception) {
                println("[GmsSignatureBypassPatch] Note expanding registerCount: ${e.message}")
            }
        }

        // 1. GooglePlayServicesUtil のバイパス (isGooglePlayServicesAvailable -> 0)
        val availabilitySpec = VersionHookRegistry.target(HookId.GMS_SIGNATURE_BYPASS, packageMetadata)
        val certificateSpec = VersionHookRegistry.target(HookId.GMS_CERTIFICATE_VERIFIER, packageMetadata)
        val playUtilCandidateStrings = availabilitySpec.anchorStrings
        val playUtilClasses = mutableSetOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        for (cand in playUtilCandidateStrings) {
            playUtilClasses.addAll(getAllClassesWithString(cand))
        }
        println("[GmsSignatureBypassPatch] Found ${playUtilClasses.size} classes matching GooglePlayServicesUtil candidates")
        var patchedPlayUtilCount = 0
        for (classDef in playUtilClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                // isGooglePlayServicesAvailable(Context, int) -> int (0 = SUCCESS)
                val params = method.parameterTypes
                if (availabilitySpec.matches(method) && params.size == 2 &&
                    params[0] == "Landroid/content/Context;" &&
                    params[1] == "I" &&
                    method.returnType == "I") {

                    ensureRegisters(method.implementation, 2)
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
        val sigVerifierClasses = getAllClassesWithString(certificateSpec.anchorStrings.single())
        println("[GmsSignatureBypassPatch] Found ${sigVerifierClasses.size} classes matching GoogleSignatureVerifier")
        var patchedSigVerifierCount = 0
        for (classDef in sigVerifierClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                // boolean を返すメソッド（c(PackageInfo, boolean) や b(String)）を全て true にバイパス
                if (method.returnType == "Z") {
                    check(certificateSpec.matches(method))
                    check("${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}" in certificateSpec.methodSignatures)
                    ensureRegisters(method.implementation, 2)
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
