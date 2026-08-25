package dev.alastorkaneki.morphe.patches.mcpecenter

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.alastorkaneki.morphe.patches.mcpecenter.Constants.MCPE_CENTER
import dev.alastorkaneki.morphe.patches.mcpecenter.Constants.ORIGINAL_FILE_PROVIDER
import dev.alastorkaneki.morphe.patches.mcpecenter.Constants.ORIGINAL_PACKAGE
import org.w3c.dom.Element

private lateinit var packageNameOption: Option<String>

private fun selectedPackageName() = packageNameOption.value!!

@Suppress("unused")
val renamePackagePatch = resourcePatch(
    name = "Rename package",
    description =
        "Changes the Android package ID and updates the app-specific provider/permission references used for Minecraft imports.",
    default = false
) {
    compatibleWith(MCPE_CENTER)

    packageNameOption = stringOption(
        key = "packageName",
        default = "$ORIGINAL_PACKAGE.morphe",
        values = mapOf("Default" to "$ORIGINAL_PACKAGE.morphe"),
        title = "Package name",
        description = "Android package ID for the patched app.",
        required = true
    ) {
        it != null && it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    // Android 13+ Minecraft importing in this build contains two literal package/provider
    // strings. Keep the bytecode fix scoped to that one method so Play/Billing strings are
    // not accidentally rewritten.
    dependsOn(bytecodePatch {
        compatibleWith(MCPE_CENTER)

        execute {
            val newPackageName = selectedPackageName()
            val newProvider = "$newPackageName.fileProvider"

            SendToMinecraft33Fingerprint.method.apply {
                instructions.forEachIndexed { index, instruction ->
                    val oldValue =
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                            ?: return@forEachIndexed
                    val replacement = when (oldValue) {
                        ORIGINAL_PACKAGE -> newPackageName
                        ORIGINAL_FILE_PROVIDER -> newProvider
                        else -> null
                    } ?: return@forEachIndexed

                    val register = (instruction as? OneRegisterInstruction)?.registerA
                        ?: return@forEachIndexed
                    replaceInstruction(
                        index,
                        "const-string v$register, \"$replacement\""
                    )
                }
            }
        }
    })

    execute {
        val newPackageName = selectedPackageName()

        fun replacePackagePrefix(value: String): String = when {
            value == ORIGINAL_PACKAGE -> newPackageName
            value.startsWith("$ORIGINAL_PACKAGE.") ->
                newPackageName + value.removePrefix(ORIGINAL_PACKAGE)
            else -> value
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newPackageName)

            // AndroidX generates an app-specific dynamic-receiver permission. Keep its
            // declaration and matching uses-permission in sync with the new package.
            listOf("permission", "uses-permission").forEach { tagName ->
                val nodes = document.getElementsByTagName(tagName)
                for (index in 0 until nodes.length) {
                    val element = nodes.item(index) as? Element ?: continue
                    val oldName = element.getAttribute("android:name")
                    if (oldName.isNotEmpty()) {
                        element.setAttribute(
                            "android:name",
                            replacePackagePrefix(oldName)
                        )
                    }
                }
            }

            // Provider authorities must be globally unique, especially when the original
            // and a renamed clone are installed side-by-side.
            val providers = document.getElementsByTagName("provider")
            for (index in 0 until providers.length) {
                val provider = providers.item(index) as? Element ?: continue
                val authorities = provider.getAttribute("android:authorities")
                if (authorities.isNotEmpty()) {
                    provider.setAttribute(
                        "android:authorities",
                        authorities.split(';')
                            .joinToString(";") { replacePackagePrefix(it) }
                    )
                }
            }

            // Update only app-owned intent actions. Component class names remain fully
            // qualified to the original Java package and are intentionally left untouched.
            val actions = document.getElementsByTagName("action")
            for (index in 0 until actions.length) {
                val action = actions.item(index) as? Element ?: continue
                val oldName = action.getAttribute("android:name")
                if (oldName.startsWith("$ORIGINAL_PACKAGE.")) {
                    action.setAttribute(
                        "android:name",
                        replacePackagePrefix(oldName)
                    )
                }
            }
        }
    }
}
