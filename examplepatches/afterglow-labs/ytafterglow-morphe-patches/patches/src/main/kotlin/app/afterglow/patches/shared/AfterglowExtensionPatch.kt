package app.afterglow.patches.shared

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val APPLICATION = "com.google.android.apps.youtube.app.YouTubeTikTokRoot_Application"

/** Check the actual manifest owner before modifying its inherited startup method. */
private val applicationContextManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val applications = document.getElementsByTagName("application")
            require(applications.length == 1
                    && (applications.item(0) as Element).getAttribute("android:name") == APPLICATION) {
                "Afterglow application context requires the verified YouTube application"
            }
        }
    }
}

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Merges the Afterglow extension and publishes its base context before native
 * application initialization, then records the main activity when it starts.
 */
val afterglowExtensionPatch = bytecodePatch(
    description = "Loads the Afterglow extension.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(applicationContextManifestPatch)

    extendWith(EXTENSION)

    execute {
        // Playlist owners can cache architecture choices before MainActivity.
        // Use the application's supplied base context, without relying on the
        // reflective currentApplication fallback or relatching a live owner.
        val applicationChain = mutableListOf<String>()
        var type = "L${APPLICATION.replace('.', '/')};"
        while (type != "Landroid/app/Application;") {
            require(type !in applicationChain && applicationChain.size < 10) {
                "Unexpected YouTube application hierarchy"
            }
            applicationChain.add(type)
            type = requireNotNull(classDefBy(type).superclass)
        }
        val baseContexts = applicationChain.flatMap { owner ->
            classDefBy(owner).methods.filter { method ->
                method.name == "attachBaseContext" && method.returnType == "V"
                        && method.parameterTypes == listOf("Landroid/content/Context;")
            }
        }
        require(baseContexts.size == 1) { "Expected one inherited YouTube application base-context method" }
        val baseContext = baseContexts.single()
        val original = baseContext.implementation!!.instructions.toList()
        require(original.map { it.opcode } == listOf(Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_WIDE, Opcode.IPUT_WIDE, Opcode.INVOKE_SUPER, Opcode.RETURN_VOID)) {
            "YouTube application base-context startup changed"
        }
        val clockCall = (original[0] as ReferenceInstruction).reference as MethodReference
        val superCall = (original[3] as ReferenceInstruction).reference as MethodReference
        require(clockCall.smali == "Landroid/os/SystemClock;->elapsedRealtime()J"
                && superCall.definingClass == classDefBy(baseContext.definingClass).superclass
                && superCall.name == "attachBaseContext"
                && superCall.parameterTypes == baseContext.parameterTypes && superCall.returnType == "V") {
            "YouTube application base-context forwarding changed"
        }
        Fingerprint(definingClass = baseContext.definingClass, name = "attachBaseContext",
            returnType = "V", parameters = listOf("Landroid/content/Context;"))
            .method.addInstruction(0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/Afterglow;->onBaseContext(Landroid/content/Context;)V")

        // onCreate uses more than 16 registers, so p0 can be above v15: the
        // range form reaches any register, plain invoke-static cannot.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/Afterglow;->onMainActivityCreate(Landroid/app/Activity;)V",
        )
        println("Afterglow context: ${baseContext.smali}, verified application hierarchy ${applicationChain.size}")
    }
}
