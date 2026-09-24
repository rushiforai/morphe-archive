/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.addme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Trace name used by Pixel Camera's Add Me ("cottage") model-asset loader.
 *
 * Add Me is called *Cottage* internally: the mode enum constant behind the
 * `"ADD_ME"` intent value is literally named `COTTAGE`, and the feature flags
 * are `camera.cottage_*`. The asset loader opens its TFLite models under this
 * trace section, which makes the string a stable, meaningful anchor.
 */
internal const val ADD_ME_ASSET_TRACE = "AllInAssetManager#openModelAssets"

/**
 * The Add Me model-asset loader.
 *
 * In 10.4.117.936816638.14 this is `Lfom;->run()V`:
 *
 * ```
 * 0015: const-string v6, "AllInAssetManager#openModelAssets"
 * 001a: iget-boolean v5, v1, Lfpd;->e:Z          # <- useTpu
 * 001c: if-eqz v5, :011f                          #    false -> CPU branch
 * 0023: sget-object v6, Lfpd;->a:Luar;            #    TPU model map
 * ...
 * 011f: sget-object v5, Lfpd;->b:Luar;            #    CPU model map
 * ...
 * 01e0: iget-boolean v4, v1, Lfpd;->e:Z          # <- useTpu again
 * 01ea: invoke-direct {v5, v2, v4, v1, v3}, Lfpc;-><init>(Lvjh;ZLvjb;Lual;)V
 * ```
 *
 * `Lfpd;->e` is initialised in `Lfpd;-><init>` from the flag
 * `camera.cottage_use_tpu`. It does two things: it picks which of the two
 * shipped model maps to open, and it is handed to the processor, which decides
 * whether to request an EdgeTPU TFLite delegate.
 *
 * Both model sets ship in the APK. For every TPU model there is a plain twin,
 * for example `all_in_film_blender_sharded_512_256-graph-custom_op_tpu_p25.tflite`
 * versus `all_in_film_blender.tflite`, so forcing the flag off selects models
 * that do not need the EdgeTPU custom ops.
 *
 * The fingerprint deliberately matches on the trace string plus the presence of
 * an `iget-boolean`, not on the obfuscated class or field names.
 */
internal object AddMeModelAssetLoaderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string(ADD_ME_ASSET_TRACE),
        // The useTpu read guarding the TPU/CPU model-map branch.
        opcode(Opcode.IGET_BOOLEAN),
    ),
)
