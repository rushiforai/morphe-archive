package hoodles.morphe.patches.shared.misc.signature

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.getNode
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.analysis.reflection.util.ReflectionUtils
import hoodles.morphe.patches.shared.misc.extension.sharedExtensionPatch
import hoodles.morphe.util.removeFlag
import org.w3c.dom.Element

private lateinit var applicationPath: String;

private val manifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getNode("application") as Element
            applicationPath = application.getAttribute("android:name")
            application.setAttribute("android:name", Constants.SPOOF_CLASS_JAVA_NAME)
        }
    }
}

fun spoofSignaturePatch(signature: String) = bytecodePatch {
    dependsOn(manifestPatch, sharedExtensionPatch("signature"))

    finalize {
        val strippedSig = signature.filter { !it.isWhitespace() }
        GetSignatureFingerprint.method.returnEarly(strippedSig)

        val originalApplicationClassName = ReflectionUtils.javaToDexName(applicationPath)

        // remove `final` access flag on original application class
        mutableClassDefBy(originalApplicationClassName).removeFlag(AccessFlags.FINAL)

        GetSignatureFingerprint.classDef.setSuperClass(originalApplicationClassName)

        ConstructorFingerprint.method.replaceInstruction(0, """
            invoke-direct {p0}, $originalApplicationClassName-><init>()V
        """.trimIndent())

        AttachBaseContextFingerprint.method.replaceInstruction(1, """
            invoke-super {p0, p1}, $originalApplicationClassName->attachBaseContext(Landroid/content/Context;)V
        """.trimIndent())

        mutableClassDefBy(originalApplicationClassName).apply {
            methods.firstOrNull { method -> method.name == "attachBaseContext"}?.removeFlag(
                AccessFlags.FINAL)
        }
    }
}