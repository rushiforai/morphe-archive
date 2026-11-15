/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.patches.instagram.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.asSequence
import app.template.patches.shared.findElementByAttributeValue
import app.template.patches.shared.findMutableMethodOf
import app.template.patches.shared.forEachChildElement
import app.template.patches.shared.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE_NAME = "com.instagram.android"
private const val DEFAULT_CLONED_PACKAGE_NAME = "com.instagram.android.proteus"
private const val DEFAULT_CLONED_APP_NAME = "Instagram Distraction Free"

@Suppress("unused")
val instagramClonePatch = resourcePatch(
    name = "Clone",
    description = "Changes the package name and the app name so you can install the patched app alongside the official Instagram app. " +
        "Caution: Do not combine with the universal \"Change package name\" patch.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    val packageName by stringOption(
        key = "packageName",
        default = DEFAULT_CLONED_PACKAGE_NAME,
        title = "Package name",
        description = "A new package name for the patched app.",
        required = true,
    ) {
        it?.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) == true
    }

    val appName by stringOption(
        key = "appName",
        default = DEFAULT_CLONED_APP_NAME,
        title = "App name",
        description = "A new app name (label). Entering \"Instagram\" will skip changing the app name.",
        required = true,
    ) { !it.isNullOrBlank() }

    var bytecodePatchContext: BytecodePatchContext? = null

    dependsOn(
        bytecodePatch {
            execute {
                bytecodePatchContext = this
            }
        },
    )

    execute {
        val newPackageName = packageName ?: DEFAULT_CLONED_PACKAGE_NAME
        val resolvedAppName = appName ?: DEFAULT_CLONED_APP_NAME

        val providerReplacements = mutableListOf<Pair<String, String>>()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newPackageName)

            val permissions = manifest.getElementsByTagName("permission")
            val usesPermissions = manifest.getElementsByTagName("uses-permission")
            val usesPermissions23 = manifest.getElementsByTagName("uses-permission-sdk-23")

            permissions.asSequence().mapNotNull { it as? Element }.forEach { permissionEl ->
                val oldName = permissionEl.getAttribute("android:name")
                if (oldName.startsWith('.') || oldName.isBlank()) return@forEach
                val newName = rewriteInstagramPackagePrefix(oldName, newPackageName)
                permissionEl.setAttribute("android:name", newName)

                usesPermissions.findElementByAttributeValue("android:name", oldName)
                    ?.setAttribute("android:name", newName)
                usesPermissions23.findElementByAttributeValue("android:name", oldName)
                    ?.setAttribute("android:name", newName)
            }

            val providers = manifest.getElementsByTagName("provider").asSequence().mapNotNull { it as? Element }
            for (provider in providers) {
                val oldAuthorityAttr = provider.getAttribute("android:authorities")
                if (oldAuthorityAttr.isBlank()) continue
                val newAuthorityAttr = oldAuthorityAttr.split(";").joinToString(";") { oldAuthority ->
                    val newAuthority = rewriteInstagramAuthority(oldAuthority, newPackageName)
                    providerReplacements.add(oldAuthority to newAuthority)
                    newAuthority
                }
                provider.setAttribute("android:authorities", newAuthorityAttr)
            }
        }

        if (resolvedAppName != "Instagram") {
            document("res/values/strings.xml").use { document ->
                document.documentElement.forEachChildElement { element ->
                    if (element.textContent == "Instagram") {
                        element.textContent = resolvedAppName
                    }
                }
            }
        }

        // Replace references to "com.instagram.android" and provider authorities in bytecode so
        // video stories and IPC calls keep working on the cloned package name.
        val context = checkNotNull(bytecodePatchContext) {
            "BytecodePatchContext was not initialized before Clone execute block"
        }
        try {
            context(context) {
                transformInstagramStringReferences { value ->
                    if (value == ORIGINAL_PACKAGE_NAME) {
                        return@transformInstagramStringReferences newPackageName
                    }

                    val matchedReplacement = providerReplacements.find { value.contains(it.first) }
                    matchedReplacement?.let {
                        value.replaceFirst(it.first, it.second)
                    }
                }
            }
        } finally {
            bytecodePatchContext = null
        }
    }
}

internal fun rewriteInstagramPackagePrefix(identifier: String, newPackageName: String): String {
    if (!identifier.startsWith(ORIGINAL_PACKAGE_NAME)) {
        return identifier
    }
    val after = identifier.drop(ORIGINAL_PACKAGE_NAME.length)
    val extraSuffix = newPackageName.removePrefix(ORIGINAL_PACKAGE_NAME)
    if (extraSuffix.isNotEmpty() && after.startsWith(extraSuffix)) {
        return identifier
    }
    return newPackageName + after
}

internal fun rewriteInstagramAuthority(oldAuthority: String, newPackageName: String): String =
    if (oldAuthority.startsWith("$ORIGINAL_PACKAGE_NAME.") || oldAuthority == ORIGINAL_PACKAGE_NAME) {
        rewriteInstagramPackagePrefix(oldAuthority, newPackageName)
    } else if (oldAuthority.startsWith("${newPackageName}_")) {
        oldAuthority
    } else {
        "${newPackageName}_$oldAuthority"
    }

context(patchContext: BytecodePatchContext)
private fun transformInstagramStringReferences(transform: (str: String) -> String?) {
    patchContext.getAllClassesWithStrings().forEach { classDef ->
        if (classDef.type.startsWith("Lapp/template/extension/")) return@forEach

        val mutableClass by lazy {
            patchContext.mutableClassDefBy(classDef)
        }

        classDef.methods.forEach { method ->
            val mutableMethod by lazy {
                mutableClass.findMutableMethodOf(method)
            }

            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                val string = instruction.getReference<StringReference>()?.string
                    ?: return@forEachIndexed

                val transformedString = transform(string) ?: return@forEachIndexed
                val register = (instruction as? OneRegisterInstruction)?.registerA ?: return@forEachIndexed
                val replacement = when (instruction.opcode) {
                    Opcode.CONST_STRING -> BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(transformedString),
                    )
                    Opcode.CONST_STRING_JUMBO -> BuilderInstruction31c(
                        Opcode.CONST_STRING_JUMBO,
                        register,
                        ImmutableStringReference(transformedString),
                    )
                    else -> return@forEachIndexed
                }

                mutableMethod.replaceInstruction(index, replacement)
            }
        }
    }
}
