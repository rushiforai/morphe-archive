package app.template.patches.keyflow

import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

/**
 * Keyflow 1.5.10 — Trusted Signer Bypass (LUuxmVJjT.yMQp6hm).
 *
 * mMDNzWiQL checks whether the app's certificate is "trusted" via
 * LUuxmVJjT.yMQp6hm(packageName, certSet). When this returns false, the app
 * treats itself as modified and resets/disables Pro. Forcing it to return
 * true prevents the "modified app" message and keeps Pro active.
 */
@Suppress("unused")
val trustedSignerPatch = patch(
    name = "Keyflow Trusted Signer Bypass",
    description = "Always report the app signature as trusted so Pro is not reset when opening a project or exporting.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // LUuxmVJjT.yMQp6hm(String, Set) -> always return true (trusted)
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LuuxmVJjT;") return@classDefForEach

            val mutable = mutableClassDefBy(classDef)
            mutable.methods.first { m ->
                m.name == "yMQp6hm" &&
                    m.parameters.size == 2 &&
                    m.parameters[0].type == "Ljava/lang/String;" &&
                    m.parameters[1].type == "Ljava/util/Set;" &&
                    m.returnType == "Z" &&
                    (m.accessFlags and AccessFlags.STATIC.value) != 0
            }.returnEarly(true)
        }
    }
}
