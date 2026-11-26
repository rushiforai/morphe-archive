package app.template.patches.zalo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.jar.Manifest

private const val MAIN_APPLICATION = "Lcom/zing/zalo/MainApplication;"

@Suppress("unused")
val bugLogPatch = bytecodePatch(
    name = "Bug log",
    description = "Adds a Debugging section to Nezumi's Settings that records patch errors, crashes and ANRs " +
        "to a local log the user can export and share with the developer. Recording is off until the user turns it on.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Bake the bundle version into the log header.
        val version = nezumiBundleVersion().replace("\\", "").replace("\"", "")
        val bundleVersion = mutableClassDefBy(NEZUMI_LOG).methods.single { it.name == "bundleVersion" }
        repeat(bundleVersion.implementation!!.instructions.size) {
            bundleVersion.implementation!!.removeInstruction(0)
        }
        bundleVersion.addInstructions(0, "const-string v0, \"$version\"\nreturn-object v0")

        // Install as early as possible in every process, right after the base context is attached,
        // so crashes during Application.onCreate are captured too.
        val attach = mutableClassDefBy(MAIN_APPLICATION).methods.single {
            it.name == "attachBaseContext" && it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == "V"
        }
        val superIndex = attach.implementation!!.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER &&
                ((instruction as ReferenceInstruction).reference as? MethodReference)?.name == "attachBaseContext"
        }
        check(superIndex >= 0) { "MainApplication.attachBaseContext super call not found" }
        attach.addInstructions(superIndex + 1, "invoke-static {p0}, $NEZUMI_LOG->install(Landroid/content/Context;)V")

        attachNezumiSettings("attachBugLog")
    }
}

/** Reads the bundle version from this patch bundle's own jar manifest. */
private fun nezumiBundleVersion(): String = runCatching {
    val loader = BugLogMarker::class.java.classLoader
    loader.getResources("META-INF/MANIFEST.MF").toList().firstNotNullOfOrNull { url ->
        url.openStream().use { stream ->
            Manifest(stream).mainAttributes.takeIf { it.getValue("Name") == "Nezumi Patches" }?.getValue("Version")
        }
    }
}.getOrNull() ?: "unknown"

private object BugLogMarker
