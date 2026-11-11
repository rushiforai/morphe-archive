package app.template.patches.keyflow

import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.addFreeRegisters
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

/**
 * Keyflow 1.5.10 — byYKY0yXO Signer Identity Bypass (NMGZ06).
 *
 * byYKY0yXO.NMGZ06(Context, LyDPQAXIU) is called during export to verify the
 * app's signer identity. If it returns null (e.g. because the APK was re-signed
 * by the patcher), the export path fails with "Preparing Assets" flashing and
 * disappearing. Returning a non-null dummy string lets export proceed.
 */
@Suppress("unused")
val byYky0yXoSignerPatch = patch(
    name = "Keyflow byYKY0yXO Signer Bypass",
    description = "Return a dummy signer identity string during export so the export path does not fail on re-signed APKs.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // byYKY0yXO.NMGZ06(Context, LyDPQAXIU) -> return dummy non-null string
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LbyYKY0yXO;") return@classDefForEach

            val mutable = mutableClassDefBy(classDef)
            mutable.methods.first { m ->
                m.name == "NMGZ06" &&
                    m.parameters.size == 2 &&
                    m.parameters[0].type == "Landroid/content/Context;" &&
                    m.parameters[1].type.startsWith("L") &&
                    m.parameters[1].type.endsWith(";") &&
                    m.returnType == "Ljava/lang/String;" &&
                    (m.accessFlags and AccessFlags.STATIC.value) != 0
            }.let { method ->
                val (cloned, added) = method.addFreeRegisters(1)
                cloned.addInstructions(added, """
                    const-string v0, "dummy"
                    return-object v0
                """)
            }
        }
    }
}
