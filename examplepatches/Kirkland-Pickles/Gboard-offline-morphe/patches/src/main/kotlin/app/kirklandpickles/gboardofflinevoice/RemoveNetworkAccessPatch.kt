package app.kirklandpickles.gboardofflinevoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val LAUNCHER_CLASS = "Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;"
private const val LAUNCHER_HELPER = "Lapp/kirklandpickles/gboardofflinevoice/LauncherSetup;"

private val REMOVED_PERMISSIONS = setOf(
    "android.permission.INTERNET",
    "android.permission.GET_ACCOUNTS",
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "com.google.android.apps.aicore.service.BIND_SERVICE",
    "com.google.android.setupwizard.READ_DEVICE_ORIGIN_FIRST_PARTY",
    "android.permission.PERSONAL_CONTEXT_HOST_INSIGHT_SURFACE",
    "android.permission.PERSONAL_CONTEXT_PUBLISH_HINTS",
    "android.permission.PERSONAL_CONTEXT_RECEIVE_INSIGHTS",
)

private fun Element.androidAttr(name: String): String? =
    getAttributeNodeNS(ANDROID_NS, name)?.value ?: getAttribute("android:$name").ifEmpty { null }

private fun ResourcePatchContext.manifest(block: (Document) -> Unit) =
    document("AndroidManifest.xml").use(block)

private val launcherSetupPatch = bytecodePatch {
    extendWith("extensions/launcher.mpe")

    execute {
        val launcher = mutableClassDefBy(LAUNCHER_CLASS)
        val onResume = launcher.methods.singleOrNull {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Gboard launcher: expected one onResume() method")
        val instructions = onResume.implementation?.instructions
            ?: throw PatchException("Gboard launcher onResume() has no implementation")
        val superCall = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onResume"
        }
        if (superCall < 0) throw PatchException("Gboard launcher: onResume() super call not found")
        onResume.addInstructions(superCall + 1, """
            invoke-static/range {p0 .. p0}, $LAUNCHER_HELPER->open(Landroid/app/Activity;)V
            return-void
        """)
    }
}

@Suppress("unused")
val removeNetworkAccessPatch = resourcePatch(
    name = "Remove network access",
    description = "Removes Gboard's Internet, account and Google-service permissions. Online features stop working.",
    default = true,
) {
    compatibleWith(GBOARD)
    dependsOn(launcherSetupPatch)

    execute {
        manifest { doc ->
            val permissionTags = arrayOf("uses-permission", "uses-permission-sdk-23")
            for (tag in permissionTags) {
                val permissions = doc.getElementsByTagName(tag)
                for (index in permissions.length - 1 downTo 0) {
                    val permission = permissions.item(index) as Element
                    if (permission.androidAttr("name") in REMOVED_PERMISSIONS) {
                        permission.parentNode?.removeChild(permission)
                    }
                }
            }

            for (tag in permissionTags) {
                val permissions = doc.getElementsByTagName(tag)
                for (index in 0 until permissions.length) {
                    val name = (permissions.item(index) as Element).androidAttr("name")
                    if (name in REMOVED_PERMISSIONS) {
                        throw PatchException("Gboard permission remains: $name")
                    }
                }
            }
        }
    }
}

