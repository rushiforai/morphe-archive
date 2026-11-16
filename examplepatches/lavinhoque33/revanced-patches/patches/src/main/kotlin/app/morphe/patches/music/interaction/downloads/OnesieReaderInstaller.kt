/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printInfo
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val OBJECT = "Ljava/lang/Object;"
private const val EXCEPTION = "Ljava/lang/Exception;"
private const val HOOK = "Lapp/morphe/extension/music/patches/downloads/OnesieFallback;"

private data class ReaderAbi(val reader: String, val owner: String, val start: String, val receiver: String = "p0")

/** A read error must reach both outputs before the stock abort notification can cancel the scalar Future. */
internal fun BytecodePatchContext.prepareOnesieReader(controller: String): () -> Unit {
    val abi = when (packageMetadata.versionName) {
        "9.45.51" -> ReaderAbi("Lysn;", "Lyso;", "j")
        "9.40.51" -> ReaderAbi("Lypc;", "Lypd;", "s")
        "9.15.51" -> ReaderAbi("Latxa;", "Latxb;", "r")
        "8.30.54" -> ReaderAbi("Laqvd;", "Laqve;", "t")
        "8.28.54" -> ReaderAbi("Laqnv;", "Laqnw;", "t")
        "8.12.54" -> ReaderAbi("Laopp;", "Laopq;", "s", "v1")
        else -> error("Onesie reader: unsupported version")
    }
    val start = classDefBy(controller).methods.single { it.name == abi.start && it.parameterTypes.isEmpty() }
    val startCode = start.implementation!!.instructions.toList()
    val constructors = startCode.indices.filter {
        startCode[it].getReference<MethodReference>()?.let { call ->
            call.definingClass == abi.owner && call.name == "<init>"
        } == true
    }.map { index ->
        val register = when (val instruction = startCode[index]) {
            is RegisterRangeInstruction -> instruction.startRegister
            else -> (instruction as FiveRegisterInstruction).registerC
        }
        check(register < 16)
        index to register
    }
    val oneReader = packageMetadata.versionName in setOf("9.45.51", "8.12.54")
    check(constructors.size == if (oneReader) 1 else 2)
    val readerOwner = classDefBy(abi.reader).fields.single { it.name == "a" && it.type == abi.owner }
    val run = classDefBy(abi.reader).methods.single { it.name == "run" && it.parameterTypes.isEmpty() }
    val code = run.implementation!!.instructions.toList()
    val ioMessage = code.indices.single { code[it].getReference<StringReference>()?.string == "IO error " }
    val handler = (0 until ioMessage).last { code[it].opcode == Opcode.MOVE_EXCEPTION }
    val failure = (code[handler] as OneRegisterInstruction).registerA
    val errorOpcode = if (packageMetadata.versionName == "9.45.51") Opcode.INVOKE_VIRTUAL else Opcode.INVOKE_INTERFACE
    val errorDelivery = (ioMessage + 1 until code.size).first {
        code[it].opcode == errorOpcode &&
            code[it].getReference<MethodReference>()?.parameterTypes == listOf(EXCEPTION)
    }
    val cleanup = (errorDelivery + 1 until code.size).first {
        code[it].opcode == Opcode.IGET_OBJECT && code[it].getReference<FieldReference>()?.let { field ->
            field.definingClass == abi.reader && field.type == abi.owner
        } == true
    }

    return {
        val owner = mutableClassDefBy(abi.owner)
        owner.addOnesieControllerField()
        val method = mutableClassDefBy(controller).findMutableMethodOf(start)
        constructors.sortedByDescending { it.first }.forEach { (index, register) ->
            method.addInstructions(index + 1, "iput-object v1, v$register, ${abi.owner}->rvxController:$OBJECT")
        }
        val reader = mutableClassDefBy(abi.reader)
        reader.addDownloadsBridge("rvxReadFailure", listOf(EXCEPTION), "Z", 6, """
            iget-object v0, p0, $readerOwner
            iget-object v0, v0, ${abi.owner}->rvxController:$OBJECT
            move-object v1, p1
            const/16 v2, 0x10
            :find_network
            instance-of v3, v1, Lorg/chromium/net/NetworkException;
            if-nez v3, :network
            add-int/lit8 v2, v2, -0x1
            if-eqz v2, :not_network
            invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;
            move-result-object v1
            if-nez v1, :find_network
            :not_network
            const/4 v3, 0x0
            return v3
            :network
            invoke-static {v0, p1}, $HOOK->failed($OBJECT$EXCEPTION)Z
            move-result v3
            return v3
        """)
        val mutableRun = reader.findMutableMethodOf(run)
        val close = ExternalLabel("rvx_read_close", mutableRun.getInstruction<Instruction>(cleanup))
        mutableRun.addInstructionsWithLabels(handler + 1, """
            invoke-virtual {${abi.receiver}, v$failure}, ${abi.reader}->rvxReadFailure($EXCEPTION)Z
            move-result v2
            if-nez v2, :rvx_read_close
        """, close)
        printInfo("PlayerFallback: Onesie body read $run; owner ${abi.owner}; exception v$failure")
    }
}
