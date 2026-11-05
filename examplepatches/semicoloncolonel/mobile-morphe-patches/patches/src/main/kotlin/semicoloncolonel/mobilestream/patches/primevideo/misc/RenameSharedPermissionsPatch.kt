package semicoloncolonel.mobilestream.patches.primevideo.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants

// Prime Video declares custom permissions that every Amazon app with the MAP
// sign-in SDK also declares (com.amazon.identity.*, com.amazon.dcp.sso.*, ...).
// Android lets only apps with the same signing key declare the same
// permission, so once the patched app is re-signed, installing Amazon
// Shopping and other Amazon apps fails with
// INSTALL_FAILED_DUPLICATE_PERMISSION ("conflicting package"). This
// prefixes every com.amazon.* permission the manifest declares, and every
// reference to it, as ReVanced does with "revanced.".
//
// Permissions under the app's own package name are left alone: no other app
// can declare them, and AndroidX builds
// <package>.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION at runtime.
//
// Three of them are also string literals in the code: MAP sends its account
// changed and account property changed broadcasts with them, and the player
// sends its playback events with SDK_ACCESS. A receiver must hold the broadcast's
// permission, so the literals get the same prefix, or the app's own
// receivers would stop getting them. The re-signed app cannot share a
// sign-in with official Amazon apps anyway, since MAP checks signatures.
private const val PREFIX = "mobilestream."

private val permissionTags = setOf("permission", "uses-permission", "uses-permission-sdk-23")
private val permissionAttributes = listOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
)

private val renamed = mutableMapOf<String, String>()

private val renameManifestPermissionsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val packageName = manifest.getAttribute("package")
            renamed.clear()

            val declared = document.getElementsByTagName("permission")
            for (i in 0 until declared.length) {
                val name = (declared.item(i) as Element).getAttribute("android:name")
                if (name.startsWith("com.amazon.") && !name.startsWith("$packageName.")) {
                    renamed[name] = PREFIX + name
                }
            }
            if (renamed.isEmpty()) throw PatchException("No shared Amazon permissions declared")

            val elements = document.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                val attributes = if (element.tagName in permissionTags) {
                    permissionAttributes + "android:name"
                } else {
                    permissionAttributes
                }
                for (attribute in attributes) {
                    renamed[element.getAttribute(attribute)]?.let {
                        element.setAttribute(attribute, it)
                    }
                }
            }
        }
    }
}

private fun Instruction.renamedString(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    val string = ((this as ReferenceInstruction).reference as StringReference).string
    return renamed[string]
}

@Suppress("unused")
val renameSharedPermissionsPatch = bytecodePatch(
    name = "Rename shared permissions",
    description = "Renames shared Amazon permissions, so other Amazon apps can still install.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(renameManifestPermissionsPatch)

    execute {
        val types = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.renamedString() != null } == true
                }
            ) {
                types += classDef.type
            }
        }

        types.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val matches = method.implementation?.instructions
                    ?.mapIndexedNotNull { index, instruction ->
                        instruction.renamedString()?.let { Triple(index, instruction, it) }
                    }
                    ?: return@forEach
                for ((index, instruction, name) in matches) {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const-string v$register, \"$name\"")
                }
            }
        }
    }
}
