package app.czyeru.patches.uvm

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.czyeru.patches.shared.Constants.COMPATIBILITY_UVM
import app.czyeru.util.findInstructionIndicesReversedOrThrow
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

/** The compiled JavaScript of the app. */
private const val BUNDLE = "assets/index.android.bundle"

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"

private val VERSION_REGEX = Regex("""\d+\.\d+\.\d+""")

private val hideUpdateModalResourcePatch = resourcePatch {
    execute {
        val bundle = get(BUNDLE, true)
        if (!bundle.isFile) throw PatchException("$BUNDLE was not found")
        val bytes = bundle.readBytes()
        val report = try {
            UvmUpdatePopupPatcher.apply(bytes)
        } catch (e: BundleException) {
            throw PatchException("${e.message}. This patch only supports Conexión Lince UVM 1.0.63.")
        }
        bundle.writeBytes(bytes)

        Logger.getLogger("UvmForcedUpdate").info("Forced update pop-up disabled: $report")
    }
}

@Suppress("unused")
val disableForcedUpdatePatch = bytecodePatch(
    name = "Disable forced update",
    description = "Reports a newer app version to the school's server and hides the store update pop-up, " +
        "so the app keeps working instead of getting stuck loading when a new version comes out.",
    default = true
) {
    compatibleWith(COMPATIBILITY_UVM)

    dependsOn(hideUpdateModalResourcePatch)

    val appVersion by stringOption(
        key = "appVersion",
        default = "1.0.64",
        values = mapOf(
            "1.0.64 (current)" to "1.0.64",
            "1.0.65" to "1.0.65",
        ),
        title = "App version",
        description = "Version sent to the school's server in the X-App-Version header, as X.Y.Z.",
        required = true,
    )

    execute {
        val version = appVersion?.trim().orEmpty()
        if (!VERSION_REGEX.matches(version)) {
            throw PatchException("App version must look like X.Y.Z (for example 1.0.64), got '$appVersion'")
        }

        DeviceInfoConstantsFingerprint.method.apply {
            val reads = findInstructionIndicesReversedOrThrow {
                opcode == Opcode.IGET_OBJECT && getReference<FieldReference>()?.let {
                    it.definingClass == PACKAGE_INFO &&
                        it.name == "versionName" &&
                        it.type == "Ljava/lang/String;"
                } == true
            }
            if (reads.size != 1) {
                throw PatchException(
                    "Expected one PackageInfo.versionName read in RNDeviceModule.getConstants, found ${reads.size}"
                )
            }

            val index = reads.single()
            val read = getInstruction<TwoRegisterInstruction>(index)
            replaceInstruction(
                index,
                "const-string v${read.registerA}, \"$version\""
            )
        }
    }
}
