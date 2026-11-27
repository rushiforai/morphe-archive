package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

/**
 * Makes the app call [extensionMethod] (a static method taking a Context) as the first
 * thing in its Application.onCreate().
 *
 * If the manifest declares no Application class, [fallbackApplication] (a class from the
 * extension, in Java dot notation) is set as the app's Application instead; it must call
 * the extension method itself. Pass null to fail in that case.
 *
 * Must be called from a patch's execute block (it uses the current resource and bytecode context).
 */
fun hookApplicationOnCreate(extensionMethod: String, fallbackApplication: String?) {
    val applicationType = document("AndroidManifest.xml").use { manifest ->
        val packageName = manifest.documentElement.getAttribute("package")
        val application = manifest.getElementsByTagName("application").item(0) as? Element
            ?: throw PatchException("AndroidManifest.xml has no <application> element.")

        val name = application.getAttribute("android:name")
        if (name.isEmpty()) {
            if (fallbackApplication == null) {
                throw PatchException("The manifest declares no Application class, so there is nowhere to hook.")
            }
            // The app uses the plain android.app.Application, so use ours instead.
            application.setAttribute("android:name", fallbackApplication)
            return@use null
        }

        // Names may be relative (".App" or "App") or fully qualified.
        val fullName = when {
            name.startsWith(".") -> packageName + name
            !name.contains('.') -> "$packageName.$name"
            else -> name
        }
        "L" + fullName.replace('.', '/') + ";"
    } ?: return

    val applicationClass = mutableClassDefByOrNull(applicationType)
        ?: throw PatchException(
            "Application class $applicationType was not found in the dex files. " +
                "The app may be packed or protected, which this patch can't handle.",
        )

    // The range form, because the short form can only name registers v0-v15, and p0 is the last
    // register of the method, which in a method with many locals is far past v15.
    val call = "invoke-static/range {p0 .. p0}, $extensionMethod"

    val onCreate = applicationClass.methods.firstOrNull { method ->
        method.name == "onCreate" &&
            method.returnType == "V" &&
            method.parameterTypes.isEmpty() &&
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation != null
    }

    if (onCreate != null) {
        // p0 is "this" (the Application), so no free register is needed.
        onCreate.addInstruction(0, call)
        return
    }

    // The class does not override onCreate(), so add one that calls super first.
    val superclass = applicationClass.superclass
        ?: throw PatchException("$applicationType has no superclass.")

    ImmutableMethod(
        applicationClass.type,
        "onCreate",
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(1),
    ).toMutable().apply {
        addInstructions(
            0,
            """
                invoke-super {p0}, $superclass->onCreate()V
                $call
                return-void
            """,
        )
    }.also(applicationClass.methods::add)
}
