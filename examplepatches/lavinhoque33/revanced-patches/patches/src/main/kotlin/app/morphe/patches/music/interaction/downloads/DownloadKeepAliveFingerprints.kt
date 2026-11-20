/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val KEEP_ALIVE_SERVICE =
    "Lcom/google/android/libraries/youtube/offline/transfer/service/OfflineKeepAliveService;"

internal val keepAliveCreateFingerprint = Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    custom = { _, owner -> owner.type == KEEP_ALIVE_SERVICE && owner.superclass == "Landroid/app/Service;" },
)

internal fun Instruction.keepAliveForegroundCall(): MethodReference? = getReference<MethodReference>()?.takeIf {
    opcode == Opcode.INVOKE_DIRECT && it.definingClass == KEEP_ALIVE_SERVICE &&
        it.name != "<init>" && it.returnType == "V" && it.parameterTypes.isEmpty()
}
