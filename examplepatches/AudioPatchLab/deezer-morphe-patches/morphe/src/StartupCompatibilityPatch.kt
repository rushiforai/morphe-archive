package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val ORIGINAL_APPLICATION = "deezer.android.app.DZMidlet"
private const val PLAY_APPLICATION = "com.pairip.application.Application"

internal val startupCompatibilityPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        // PairIP normally initializes these constants before any providers run.
        // Restore every value when using the original Deezer Application lifecycle.
        for ((type, values) in startupStringValues()) {
            val holder = mutableClassDefBy(type)
            check(holder.fields.size == values.size && holder.methods.isEmpty())
            for ((name, value) in values) {
                val field = holder.fields.single { it.name == name && it.type == "Ljava/lang/String;" }
                check(field.initialValue == null || field.initialValue.toString() == "null")
                check(holder.fields.remove(field))
                check(holder.fields.add(MutableField(ImmutableField(
                    type, name, field.type, field.accessFlags,
                    ImmutableStringEncodedValue(value), field.annotations, field.hiddenApiRestrictions,
                ))))
            }
        }

        restoreStartupMethods()
        restoreStartupCallbacks()
        restoreStartupNativeLibraries()

        val startup = mutableClassDefBy("Lcom/pairip/StartupLauncher;").methods.single {
            it.name == "launch" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        check(checkNotNull(startup.implementation).instructions.any {
            (it as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/pairip/VMRunner;->invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;"
        })
        startup.addInstructions(0, "return-void")

        val wrapper = mutableClassDefBy("Lcom/pairip/application/Application;")
        check(wrapper.superclass == "Ldeezer/android/app/DZMidlet;")
        val attach = wrapper.methods.single {
            it.name == "attachBaseContext" && it.parameterTypes == listOf("Landroid/content/Context;")
        }
        val calls = checkNotNull(attach.implementation).instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference?.toString()
        }
        check("Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V" in calls)
        check("Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V" in calls)

        // The re-signed, side-by-side APK cannot use the Play installation wrapper.
        // Keep Deezer's own Application lifecycle, which is the wrapper's direct superclass.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").single()
            check(application.attribute("android:name") == PLAY_APPLICATION)
            application.setAttribute("android:name", ORIGINAL_APPLICATION)
        }
    }
}
