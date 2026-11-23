package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private const val ORIGINAL_APPLICATION = "deezer.android.app.DZMidlet"
private const val PLAY_APPLICATION = "com.pairip.application.Application"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Native library and manifest restoration, which need the decoded resource workspace. */
private val startupResources = resourcePatch {
    dependsOn(originalInput)

    execute {
        restoreStartupNativeLibraries()

        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val name = application.getAttributeNodeNS(ANDROID_NS, "name")
                ?: application.getAttributeNode("android:name")
            check(name != null && name.value == PLAY_APPLICATION) {
                "Deezer protected application startup changed"
            }
            // A re-signed APK cannot use the Play installation wrapper. Keep Deezer's own
            // Application lifecycle, which is the wrapper's direct superclass.
            name.value = ORIGINAL_APPLICATION
        }
    }
}

/**
 * Re-signed builds cannot run the PairIP Play installation wrapper. Restore Deezer's own
 * Application lifecycle and the startup data that PairIP normally supplies before providers run.
 * This is required for every patched build, including a build that keeps the original package.
 */
internal val startupCompatibilityPatch = bytecodePatch {
    compatibleWith(deezer)
    dependsOn(startupResources)

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
    }
}
