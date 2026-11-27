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
    description = "Adds a Debugging section to Nezumi's Settings with a local log the user can export and share " +
        "with the developer. Errors, crashes and ANRs are always recorded and named by patch; detailed logging " +
        "and turning the log off completely are options.",
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
        registerApplied(PatchId.BUG_LOG, selfReportedHook = true)
        // A dependency, so always applied with this patch; it is a raw resource patch and cannot register itself.
        registerApplied(PatchId.NATIVE_SIGNATURE_FIX)

        // Bake the bundle version into the log header.
        bakeStringStub(NEZUMI_LOG, "bundleVersion", nezumiBundleVersion())

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
        // install() logs this patch's breadcrumb itself; a crash in this method is still attributed.
        registerTouched(PatchId.BUG_LOG, attach)

        attachNezumiSettings("attachBugLog")
    }

    // Runs after every patch's execute block: bake which patches were applied, which Zalo methods
    // they modified, and their hook breadcrumbs.
    finalize {
        bakeBugLogRegistry()
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
