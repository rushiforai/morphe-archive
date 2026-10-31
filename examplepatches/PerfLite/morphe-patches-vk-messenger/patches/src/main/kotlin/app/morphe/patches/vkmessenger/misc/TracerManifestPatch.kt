package app.morphe.patches.vkmessenger.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkmessenger.shared.Constants.COMPATIBILITY_VK_MESSENGER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val TRACER_MANIFEST_INTERFACE = "Lru/ok/tracer/manifest/TracerManifest;"

// The class name is obfuscated, so it is matched by the interface it implements instead.
private object TracerApplicationIdFingerprint : Fingerprint(
    name = "applicationId",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.interfaces?.contains(TRACER_MANIFEST_INTERFACE) == true },
)

@Suppress("unused")
val tracerManifestPatch = bytecodePatch(
    name = "Fix Tracer manifest for clone",
    description = "Points the OK Tracer manifest at the cloned package name, otherwise its upload thread throws IllegalStateException and takes the app down on login.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_MESSENGER)

    execute {
        val originalPackageName = packageMetadata.packageName
        val clonePackageName = clonedPackageName(originalPackageName)

        val method = TracerApplicationIdFingerprint.methodOrNull
        if (method == null) {
            println("WARNING: Tracer manifest applicationId() was not found - clone may crash on login")
            return@execute
        }

        val instructions = method.implementation?.instructions?.toList() ?: return@execute
        var repointed = 0

        instructions.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed

            val reference = (instruction as ReferenceInstruction).reference as StringReference
            if (reference.string != originalPackageName) return@forEachIndexed

            val register = (instruction as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const-string v$register, \"$clonePackageName\"")
            repointed++
        }

        if (repointed == 0) {
            println("WARNING: Tracer manifest applicationId() does not return $originalPackageName - left alone")
        } else {
            println("TracerManifestPatch: applicationId() now returns $clonePackageName")
        }
    }
}
