/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printInfo
import app.morphe.util.fingerprint.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LOCAL_SWAP = "Lapp/morphe/extension/music/patches/downloads/StreamSwapDataSource;"
private const val LOCAL_URI = "Landroid/net/Uri;"
private const val LOCAL_STRING = "Ljava/lang/String;"

/** The constant the cache data source adds to the read position before it limits an upstream read (media3). */
private const val UPSTREAM_READ_WINDOW = 0x19000L

/** A string only the plain file data source (`RandomAccessFile` reader) contains, one match per version. */
private const val FILE_SOURCE_MARKER = "c.FileNotFound;src."

/**
 * Every stock cache data source (9.40.51 `Ljqt`, 9.15.51 `Lrwz`, 8.30.54 `Lrgu`: the offline caches and the encrypted
 * online media cache) starts a read in `i(Z)V`. A swapped download must not depend on what those caches hold (they
 * can answer the format's cache key with the ORIGINAL stream) and must not go through their cache-read source (an AES
 * decrypting wrapper that would garble a plain file). So for a request the extension issued, the read is redirected
 * at the entry of `i`: a fresh plain file data source opens the raw download's `file://` URI at the requested position
 * and length, and execution continues at the code that follows the stock source selection. No socket, no cache lookup,
 * no guard, no decryption. The hook skips `i(true)` (`read()` reopening mid-stream), so it is only correct while the
 * public `open(DataSpec)` calls `i(false)`; [checkInitialOpenIsNotMidStream] verifies that on every version.
 */
internal fun BytecodePatchContext.prepareStreamSwapLocalSource(): () -> Unit {
        val dataSpec = streamSwapDataSpec()
        val uriField = dataSpec.fields.single { it.type == LOCAL_URI }
        val open = Fingerprint(
            returnType = "V",
            parameters = listOf("Z"),
            custom = { method, _ -> method.hasLiteral(UPSTREAM_READ_WINDOW) },
        ).matchSingle()
        val fileReader = Fingerprint(
            returnType = "J",
            parameters = listOf(dataSpec.type),
            strings = listOf(FILE_SOURCE_MARKER),
        ).matchSingle().classDef
        check(fileReader.methods.any { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
            listOf(LOCAL_STRING) }) { "file source has no (String) constructor" }
        val cache = open.classDef
        val method = open.method
        val instructions = method.implementation!!.instructions.toList()
        checkInitialOpenIsNotMidStream(cache, method, dataSpec.type)

        // The stock miss branch: `new Builder(spec)`, then position and length copied from the cache's own fields.
        val builderInit = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_DIRECT && it.getReference<MethodReference>()?.let { reference ->
                reference.name == "<init>" && reference.definingClass != dataSpec.type &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf(dataSpec.type)
            } == true
        }
        check(builderInit > 0 && instructions[builderInit - 1].opcode == Opcode.NEW_INSTANCE) { "no builder copy" }
        val init = instructions[builderInit] as FiveRegisterInstruction
        val builder = init.registerC
        val builderType = init.getReference<MethodReference>()!!.definingClass
        val build = instructions.drop(builderInit).first {
            it.opcode == Opcode.INVOKE_VIRTUAL && it.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == builderType && reference.returnType == dataSpec.type &&
                    reference.parameterTypes.isEmpty()
            } == true
        }.getReference<MethodReference>()!!
        val builderUri = instructions.drop(builderInit).filter { it.opcode == Opcode.IPUT_OBJECT }
            .mapNotNull { it.getReference<FieldReference>() }
            .first { it.definingClass == builderType && it.type == LOCAL_URI }
        val wideCopies = (builderInit + 1 until instructions.size).filter { index ->
            instructions[index].opcode == Opcode.IPUT_WIDE && instructions[index - 1].opcode == Opcode.IGET_WIDE &&
                instructions[index].getReference<FieldReference>()?.definingClass == builderType
        }
        check(wideCopies.size >= 2) { "no position/length copy" }
        val positionCopy = wideCopies[0]
        val lengthCopy = wideCopies[1]
        val positionRead = instructions[positionCopy - 1].getReference<FieldReference>()!!
        val lengthRead = instructions[lengthCopy - 1].getReference<FieldReference>()!!
        val builderPosition = instructions[positionCopy].getReference<FieldReference>()!!
        val builderLength = instructions[lengthCopy].getReference<FieldReference>()!!
        val wide = (instructions[positionCopy - 1] as OneRegisterInstruction).registerA

        // The registers the stock code reads after the source selection: span, null, and the -1 length.
        val minusOne = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_WIDE_16 && (it as WideLiteralInstruction).wideLiteral == -1L
        }
        check(minusOne > 0 && instructions[minusOne + 1].opcode == Opcode.IF_NEZ) { "no span test" }
        val minusReg = (instructions[minusOne] as OneRegisterInstruction).registerA
        val span = (instructions[minusOne + 1] as OneRegisterInstruction).registerA
        val nullReg = instructions.first {
            it.opcode == Opcode.CONST_4 && (it as WideLiteralInstruction).wideLiteral == 0L
        }.let { (it as OneRegisterInstruction).registerA }

        // Stock miss branch: `iget source <- this.upstream`, `iget spec <- this.spec`, `new Builder`, `Builder(spec)`.
        val specGet = instructions[builderInit - 2]
        val sourceGet = instructions[builderInit - 3]
        check(instructions[0].opcode == Opcode.MOVE_OBJECT_FROM16 && specGet.opcode == Opcode.IGET_OBJECT &&
            sourceGet.opcode == Opcode.IGET_OBJECT) { "unexpected miss branch" }
        val specField = specGet.getReference<FieldReference>()!!
        check(specField.type == dataSpec.type) { "no spec field" }
        val thisRegister = (specGet as TwoRegisterInstruction).registerB
        val specRegister = (specGet as OneRegisterInstruction).registerA
        val sourceRegister = (sourceGet as OneRegisterInstruction).registerA
        val keyGet = instructions.first {
            it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.let { field ->
                field.definingClass == dataSpec.type && field.type == LOCAL_STRING
            } == true
        }
        val keyField = keyGet.getReference<FieldReference>()!!
        val keyRegister = (keyGet as OneRegisterInstruction).registerA
        val mergeGoto = instructions.drop(builderInit).first { it.opcode == Opcode.GOTO || it.opcode == Opcode.GOTO_16 }
        val merge = ExternalLabel(
            "stream_swap_merge",
            method.getInstruction<Instruction>((mergeGoto as BuilderOffsetInstruction).target.location.index),
        )
        val stock = ExternalLabel("stream_swap_stock_request", method.getInstruction<Instruction>(1))
        val wideNext = wide + 2
        check(wideNext + 1 <= 15 && builder <= 15 && specRegister <= 15 && sourceRegister <= 15) { "register range" }

        val localFile = "$LOCAL_SWAP->route(${LOCAL_URI}JJ)$LOCAL_URI"
        return {
        method.addInstructionsWithLabels(1, """
            if-nez p1, :stream_swap_stock_request
            iget-object v$specRegister, v$thisRegister, ${specField.definingClass}->${specField.name}:${specField.type}
            iget-object v$sourceRegister, v$specRegister, ${dataSpec.type}->${uriField.name}:$LOCAL_URI
            iget-wide v$wide, v$thisRegister, ${positionRead.definingClass}->${positionRead.name}:J
            iget-wide v$wideNext, v$thisRegister, ${lengthRead.definingClass}->${lengthRead.name}:J
            invoke-static {v$sourceRegister, v$wide, v${wide + 1}, v$wideNext, v${wideNext + 1}}, $localFile
            move-result-object v$sourceRegister
            if-eqz v$sourceRegister, :stream_swap_stock_request
            new-instance v$builder, $builderType
            invoke-direct {v$builder, v$specRegister}, $builderType-><init>(${dataSpec.type})V
            iput-object v$sourceRegister, v$builder, $builderType->${builderUri.name}:$LOCAL_URI
            iput-wide v$wide, v$builder, ${builderPosition.definingClass}->${builderPosition.name}:J
            iput-wide v$wideNext, v$builder, ${builderLength.definingClass}->${builderLength.name}:J
            invoke-virtual {v$builder}, $builderType->${build.name}()${build.returnType}
            move-result-object v$specRegister
            invoke-static {v$sourceRegister}, $LOCAL_SWAP->isLocal($LOCAL_URI)Z
            move-result v$wide
            if-nez v$wide, :stream_swap_local_file
            iput-object v$specRegister, v$thisRegister, ${specField.definingClass}->${specField.name}:${specField.type}
            goto :stream_swap_stock_request
            :stream_swap_local_file
            iget-object v$keyRegister, v$specRegister, ${dataSpec.type}->${keyField.name}:$LOCAL_STRING
            new-instance v$sourceRegister, ${fileReader.type}
            const-string v$wide, "StreamSwap"
            invoke-direct {v$sourceRegister, v$wide}, ${fileReader.type}-><init>($LOCAL_STRING)V
            const/4 v$span, 0x0
            const/4 v$nullReg, 0x0
            const-wide/16 v$minusReg, -0x1
            goto :stream_swap_merge
        """, stock, merge)
        printInfo("StreamSwap: local file route hooked ${cache.type}->${method.name}; reader ${fileReader.type}")
    }
}

/**
 * `open(DataSpec)` must reach the cache reader as `i(false)`: the flag it passes is the constant 0 loaded last before
 * the call (identical on 9.40.51, 9.15.51 and 8.30.54). A version that opened with `i(true)` would bypass the hook
 * and send the swapped token URL to the network, so such a version fails this check and the swap stays unsupported.
 */
private fun checkInitialOpenIsNotMidStream(cache: ClassDef, reader: Method, dataSpecType: String) {
    val open = cache.methods.single {
        it.returnType == "J" && it.parameterTypes.map(CharSequence::toString) == listOf(dataSpecType)
    }
    val instructions = open.implementation!!.instructions.toList()
    val calls = instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_DIRECT && instruction.getReference<MethodReference>()?.let { reference ->
            reference.definingClass == cache.type && reference.name == reader.name &&
                reference.parameterTypes.map(CharSequence::toString) == listOf("Z")
        } == true
    }
    check(calls.size == 1) { "open does not call the cache reader exactly once" }

    val (callIndex, call) = calls.single()
    val flag = (call as FiveRegisterInstruction).registerD
    val loaded = instructions.subList(0, callIndex)
        .lastOrNull { it is OneRegisterInstruction && it.registerA == flag }
    check(loaded?.opcode == Opcode.CONST_4 && (loaded as WideLiteralInstruction).wideLiteral == 0L) {
        "open does not start the cache reader with i(false)"
    }
}

private fun Method.hasLiteral(value: Long): Boolean = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_WIDE_32 && (it as WideLiteralInstruction).wideLiteral == value
} == true
