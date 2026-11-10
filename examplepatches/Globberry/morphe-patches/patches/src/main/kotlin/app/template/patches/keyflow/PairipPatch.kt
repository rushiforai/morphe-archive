package app.template.patches.keyflow

import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

@Suppress("unused")
val pairipPatch = patch(
    name = "PairIP License Check",
    description = "Neuters PairIP license verification so the app runs without a valid license.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // Find LicenseClient: implements ServiceConnection, has checkLicense(Context)V
        classDefForEach { classDef: ClassDef ->
            val implementsServiceConnection = classDef.interfaces.any { it == "Landroid/content/ServiceConnection;" }
            val hasCheckLicense = classDef.methods.any { m ->
                m.name == "checkLicense" &&
                    m.parameters.size == 1 &&
                    m.parameters[0].type == "Landroid/content/Context;" &&
                    m.returnType == "V" &&
                    (m.accessFlags and AccessFlags.STATIC.value) != 0
            }
            if (implementsServiceConnection && hasCheckLicense) {
                val mutable = mutableClassDefBy(classDef)
                val method = mutable.methods.first { m ->
                    m.name == "checkLicense" &&
                        m.parameters.size == 1 &&
                        m.parameters[0].type == "Landroid/content/Context;" &&
                        m.returnType == "V" &&
                        (m.accessFlags and AccessFlags.STATIC.value) != 0
                }
                method.returnEarly()
            }
        }
    }
}
