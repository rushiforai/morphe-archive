/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.addme

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

private val logger = Logger.getLogger("RunAddMeWithoutEdgeTpuPatch")

/**
 * Makes Add Me run on the CPU models instead of the Tensor EdgeTPU.
 *
 * ### The problem
 *
 * A re-signed, renamed Pixel Camera is rejected by the device's EdgeTPU
 * gatekeepers, in two independent ways:
 *
 * ```
 * E vendor.google.edgetpu_app_service: <package> is not in the EdgeTPU allowed list
 *     or signature mismatched. Please add the app to the edgetpu allowlist.
 * W CriticalPath: avc: denied { read } for name="gxp" scontext=u:r:untrusted_app:s0
 *     tcontext=u:object_r:gxp_device:s0 permissive=0
 * ```
 *
 * The first is a vendor HAL service that checks the caller's package name and
 * signature. The second is the kernel: a non-privileged install runs in the
 * `untrusted_app` SELinux domain, which cannot open `/dev/gxp`.
 *
 * Add Me's person detector then fails to build its TFLite delegate, and Google's
 * code treats that as fatal rather than falling back:
 *
 * ```
 * F DEBUG: Abort message: 'RET_CHECK failure (…/person_detector_tflite_client.cc:50)
 *     client->InitializeTfliteRuntime(options) returned generic::internal:
 *     RET_CHECK failure (…/tflite_wrapper.cc:789) delegate_
 *     Plugin did not create EdgeTpu delegate.'
 * ```
 *
 * Neither gate is reachable from the APK, and the abort happens in native code,
 * so it cannot be caught.
 *
 * ### The fix
 *
 * Do not ask for the EdgeTPU in the first place.
 *
 * Pixel Camera ships **two** complete sets of Add Me models — a TPU-compiled set
 * with `custom_op_tpu` in the file names, and a plain set that runs on the
 * normal TFLite runtime:
 *
 * | TPU model | plain twin |
 * |---|---|
 * | `all_in_film_blender_sharded_512_256-graph-custom_op_tpu_p25.tflite` | `all_in_film_blender.tflite` |
 * | `raid_person_segmenter_…-graph-custom_op_tpu_25.tflite` | `raid_person_segmenter_….tflite` |
 * | `mobile_raid_v21_640_qat_u8-graph-custom_op_tpu_25.tflite` | `mobile_raid_v21_640_qat_u8.tflite` |
 *
 * Which set is opened, and whether the processor requests an EdgeTPU delegate,
 * are both decided by one boolean read from the flag `camera.cottage_use_tpu`
 * ("cottage" is Add Me's internal name). This patch forces every read of that
 * boolean inside the asset loader to `false`, so the plain models are opened and
 * no EdgeTPU delegate is requested.
 *
 * ### Cost
 *
 * Add Me runs on the CPU/GPU instead of the Tensor accelerator, so it is slower.
 * Nothing else is affected: the flag is read only by Add Me's asset loader.
 *
 * ### Why this is enabled by default
 *
 * Only a build that keeps Pixel Camera's original package name and Google's
 * signature can use the EdgeTPU, and such a build cannot be installed on an
 * unrooted phone at all - the signature check rejects it and the stock app
 * cannot be uninstalled. Every installable patched build is therefore renamed
 * and re-signed, and every renamed build crashes on Add Me without this patch.
 *
 * Leaving it off would mean shipping a default configuration that is known to
 * crash. Disable it only if you are patching for a rooted setup where the
 * original package name and signature survive.
 */
@Suppress("unused")
val runAddMeWithoutEdgeTpuPatch = bytecodePatch(
    name = "Run Add Me without the EdgeTPU",
    description = "Makes Add Me load its CPU models instead of the Tensor EdgeTPU models. " +
        "Without this, Add Me crashes the app instantly in any renamed or re-signed build, " +
        "because the EdgeTPU allowlist rejects it and the app aborts instead of falling " +
        "back. Add Me becomes slower. Disable only if the original package name and " +
        "signature are preserved.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)

    execute {
        val method = AddMeModelAssetLoaderFingerprint.methodOrNull
            ?: throw PatchException(
                "Could not find the Add Me model-asset loader. Expected a public final " +
                    "void method with no parameters that references the string " +
                    "\"$ADD_ME_ASSET_TRACE\" and reads a boolean instance field. Re-run " +
                    "`python tools/dexscan.py xref <base.apk> " +
                    "--string \"$ADD_ME_ASSET_TRACE\" --context 12` and update Fingerprints.kt.",
            )

        // The first iget-boolean after the trace string is the useTpu read that
        // guards the TPU-versus-CPU model-map branch. Take its field reference
        // and neutralise every read of that same field in this method - there is
        // a second one that is handed to the processor constructor.
        val instructions = method.instructions.toList()

        val traceIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as? ReferenceInstruction)?.reference?.toString() == ADD_ME_ASSET_TRACE)
        }
        if (traceIndex < 0) {
            throw PatchException(
                "Matched the Add Me asset loader but the trace string " +
                    "\"$ADD_ME_ASSET_TRACE\" is not a const-string in it.",
            )
        }

        val firstReadIndex = instructions
            .withIndex()
            .firstOrNull { (index, insn) -> index > traceIndex && insn.opcode == Opcode.IGET_BOOLEAN }
            ?.index
            ?: throw PatchException(
                "No boolean field read follows \"$ADD_ME_ASSET_TRACE\". The Add Me asset " +
                    "loader no longer selects its models with a boolean flag; this patch " +
                    "must be re-derived before it can be trusted.",
            )

        val useTpuField = (instructions[firstReadIndex] as ReferenceInstruction).reference
            as? FieldReference
            ?: throw PatchException("The useTpu read at index $firstReadIndex has no field reference.")

        // Rewrite highest index first so earlier indices stay valid.
        val readIndices = instructions.indices.filter { index ->
            val insn = instructions[index]
            insn.opcode == Opcode.IGET_BOOLEAN &&
                (insn as? ReferenceInstruction)?.reference == useTpuField
        }.reversed()

        if (readIndices.isEmpty()) {
            throw PatchException("Found the useTpu field but no reads of it. Refusing to patch.")
        }

        readIndices.forEach { index ->
            val register = (instructions[index] as TwoRegisterInstruction).registerA
            if (register > 0xFF) {
                throw PatchException(
                    "useTpu read at index $index targets v$register, which cannot be " +
                        "written with a const/16. Refusing to patch.",
                )
            }
            // const/16 rather than const/4 so any register up to v255 encodes.
            method.replaceInstruction(index, "const/16 v$register, 0x0")
        }

        logger.info(
            "Add Me will use CPU models: forced ${readIndices.size} read(s) of " +
                "${useTpuField.definingClass}->${useTpuField.name} to false.",
        )
    }
}
