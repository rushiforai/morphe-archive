package app.morphe.patches.google.gemini

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Gemini アプリが呼び出す Google アプリのパッケージ名をクローン版（.morphe）へ変更するパッチ
 */
val geminiTargetPackagePatch = bytecodePatch(
    name = "Gemini Redirect to Cloned Google App",
    description = "Gemini アプリからの連携先 Google アプリをクローン版（com.google.android.googlequicksearchbox.morphe）へリダイレクトします。",
    default = true
) {
    compatibleWith("com.google.android.apps.bard")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val pkgName = packageMetadata.packageName
        val verName = packageMetadata.versionName
        println("[GeminiTargetPatch] Target App: $pkgName (Version: $verName)")

        val targetPackage = "com.google.android.googlequicksearchbox"
        val replacementPackage = "com.google.android.googlequicksearchbox.morphe"

        val targetSpec = VersionHookRegistry.getTargetSpec(HookId.GEMINI_TARGET_REDIRECT, pkgName, verName)
        val searchPackage = targetSpec.anchorStrings.single()

        val classes = getAllClassesWithString(searchPackage)
        println("[GeminiTargetPatch] Found ${classes.size} classes with string '$searchPackage'")

        var totalReplacements = 0
        for (classDef in classes) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                val insList = method.instructions
                for (idx in insList.indices) {
                    val ins = insList[idx]
                    if (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) {
                        val ref = (ins as ReferenceInstruction).reference
                        if (ref is StringReference && ref.string == targetPackage) {
                            val reg = (ins as OneRegisterInstruction).registerA
                            method.replaceInstruction(
                                idx,
                                """
                                    const-string v$reg, "$replacementPackage"
                                """
                            )
                            totalReplacements++
                        }
                    }
                }
            }
        }
        check(totalReplacements == targetSpec.expectedMatches) { "Unexpected Gemini target count: $totalReplacements" }
        VersionHookRegistry.logHook(
            HookId.GEMINI_TARGET_REDIRECT,
            "DEX-Wide",
            "SUCCESS",
            "Replaced $totalReplacements occurrences across ${classes.size} classes"
        )
    }
}

/**
 * Gemini アプリ（com.google.android.apps.bard）の Split APK 制約を解除しスタンドアロン化するパッチ
 */
val geminiStandalonePatch = app.morphe.patcher.patch.resourcePatch(
    name = "Gemini Standalone Support",
    description = "Gemini アプリの AndroidManifest.xml から Split APK 制約（requiredSplitTypes等）を除去し単体インストール可能にします。",
    default = true
) {
    compatibleWith("com.google.android.apps.bard")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val pkgName = packageMetadata.packageName
        val verName = packageMetadata.versionName
        println("[GeminiStandalonePatch] Target App: $pkgName (Version: $verName)")

        document("AndroidManifest.xml").use { document ->
            val manifestElement = document.documentElement
            val androidNs = "http://schemas.android.com/apk/res/android"
            manifestElement.removeAttributeNS(androidNs, "requiredSplitTypes")
            manifestElement.removeAttributeNS(androidNs, "splitTypes")
            manifestElement.removeAttribute("android:requiredSplitTypes")
            manifestElement.removeAttribute("android:splitTypes")
            manifestElement.removeAttribute("requiredSplitTypes")
            manifestElement.removeAttribute("splitTypes")

            val metaDataNodes = document.getElementsByTagName("meta-data")
            val toRemove = mutableListOf<org.w3c.dom.Element>()
            for (i in 0 until metaDataNodes.length) {
                val node = metaDataNodes.item(i) as org.w3c.dom.Element
                val name = node.getAttributeNS(androidNs, "name").ifEmpty { node.getAttribute("android:name") }
                if (name == "com.android.vending.splits.required" || name == "com.android.vending.splits") {
                    toRemove.add(node)
                }
            }
            for (node in toRemove) {
                node.parentNode?.removeChild(node)
            }
            VersionHookRegistry.logHook(HookId.SPLIT_RESTRICTION_REMOVAL, "Manifest", "SUCCESS", "Removed Gemini split restrictions")

            // アプリ表示名を "Gemini (Morphe)" に変更
            val appNode = document.getElementsByTagName("application").item(0) as? org.w3c.dom.Element
            appNode?.setAttribute("android:label", "Gemini (Morphe)")

            val activityNodes = document.getElementsByTagName("activity")
            for (i in 0 until activityNodes.length) {
                val act = activityNodes.item(i) as org.w3c.dom.Element
                if (act.hasAttribute("android:label")) {
                    act.setAttribute("android:label", "Gemini (Morphe)")
                }
            }
            val aliasNodes = document.getElementsByTagName("activity-alias")
            for (i in 0 until aliasNodes.length) {
                val alias = aliasNodes.item(i) as org.w3c.dom.Element
                if (alias.hasAttribute("android:label")) {
                    alias.setAttribute("android:label", "Gemini (Morphe)")
                }
            }
            VersionHookRegistry.logHook(HookId.APP_LABEL_UPDATE, "Manifest", "SUCCESS", "Updated Gemini labels to 'Gemini (Morphe)'")
        }
    }
}
