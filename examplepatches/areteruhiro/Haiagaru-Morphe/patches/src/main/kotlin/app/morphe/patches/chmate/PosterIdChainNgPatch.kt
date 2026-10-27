package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val POSTER_CHAIN = "Lapp/morphe/extension/chmate/PosterIdChainNg;"

/** Insert before the native chain cache write, not after the final rendering flags were computed. */
internal fun BytecodePatchContext.patchPosterIdChainNg() {
    patchPosterIdHiddenChain()
    val profile = when (packageMetadata.versionName) {
        "0.8.10.191 dev" -> listOf("Lo/m9ExternalSyntheticLambda1;", "SE_", "Lo/processAdDisplayErrorPostbackForUserError;", "Landroid/util/SparseIntArray;", "put", "c")
        "0.8.10.226 dev" -> listOf("Lo/listener;", "d", "Lo/BouncyCastleSocketAdapterCompanion;", "Lo/getUpstreamReader;", "c", "b")
        "0.8.10.241" -> listOf("Lo/SignInButton;", "a", "Lo/setDislikeWidth;", "Lo/ComponentModela;", "b", "")
        "0.8.10.242 dev" -> listOf("Lo/zzaW;", "c", "Lo/KeJ11;", "Lo/hLnYhp;", "c", "")
        "0.8.10.243 dev" -> listOf("Lo/zzdpd;", "e", "Lo/zzabv;", "Lo/requiresSignIn;", "e", "")
        else -> error("Unsupported poster ID chain profile: ${packageMetadata.versionName}")
    }
    val owner = mutableClassDefBy(profile[0])
    val method = owner.methods.single {
        it.name == profile[1] && it.returnType == "I" &&
            it.parameterTypes.take(2) == listOf(profile[2], "Z")
    }
    val writes = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass != profile[3] || reference.name != profile[4]
            || reference.parameterTypes.map(CharSequence::toString) != listOf("I", "I")) null
        else {
            val state = when (instruction) {
                is FiveRegisterInstruction -> {
                    check(instruction.registerCount == 3) { "Poster ID chain write argument count changed" }
                    instruction.registerE
                }
                is RegisterRangeInstruction -> {
                    check(instruction.registerCount == 3) { "Poster ID chain write argument count changed" }
                    instruction.startRegister + 2
                }
                else -> error("Unsupported poster ID chain write instruction")
            }
            index to state
        }
    }
    check(writes.size == 1) { "Poster ID chain cache write changed: ${packageMetadata.versionName}" }
    val (index, state) = writes.single()
    if (profile[5].isEmpty()) {
        // Modern engines reuse p1 for the response number and p2 for the cache
        // before the write. Merge while p1 still contains the response object,
        // without overwriting either native argument register.
        val p0 = method.implementation!!.registerCount - method.parameterTypes.size - 1
        val number = method.implementation!!.instructions[index - 1]
        check(number.opcode == Opcode.IGET && number is TwoRegisterInstruction &&
            number.registerA == p0 + 1 && number.registerB == p0 + 1 &&
            p0 + 1 <= 15 && state <= 15) {
            "Modern poster ID chain response-number anchor changed: ${packageMetadata.versionName}"
        }
        method.addInstructionsWithLabels(index - 1, """
            invoke-static {p0, p1, v$state}, $POSTER_CHAIN->merge(Ljava/lang/Object;Ljava/lang/Object;I)I
            move-result v$state
        """)
    } else {
        // Legacy engines retain the response parameter and no longer use p2.
        method.addInstructionsWithLabels(index, """
            move/16 p2, v$state
            invoke-static/range {p0 .. p2}, $POSTER_CHAIN->merge(Ljava/lang/Object;Ljava/lang/Object;I)I
            move-result v$state
        """)
    }
    if (profile[5].isNotEmpty()) {
        val rebuild = owner.methods.single {
            it.name == profile[5] && it.returnType == "V" && it.parameterTypes == listOf("Z")
        }
        rebuild.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p0}, $POSTER_CHAIN->reset(Ljava/lang/Object;)V
        """)
    }
}

/** Transparent filtering happens before the separate display-chain cache is consulted. */
private fun BytecodePatchContext.patchPosterIdHiddenChain() {
    val (ownerName, methodName, mapOwner, mapName) = when (packageMetadata.versionName) {
        "0.8.10.191 dev" -> listOf("Lo/m9ExternalSyntheticLambda1;", "c", "Lo/m9ExternalSyntheticLambda1;", "N")
        "0.8.10.226 dev" -> listOf("Lo/listener;", "b", "Lo/listener;", "K")
        "0.8.10.242 dev" -> listOf(
            "Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel\$onBackPressedInput_delegatelambda0\$3;",
            "invokeSuspend", "Lo/zzaW;", "j")
        else -> return // Existing display-chain compatibility for 241/243 is unchanged.
    }
    val method = mutableClassDefBy(ownerName).methods.single {
        it.name == methodName && (if (methodName == "invokeSuspend")
            it.parameterTypes == listOf("Ljava/lang/Object;") else it.parameterTypes == listOf("Z"))
    }
    val instructions = method.implementation!!.instructions.toList()
    val anchors = instructions.mapIndexedNotNull { index, instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        val next = (instructions.getOrNull(index + if (methodName == "invokeSuspend") 3 else 1)
            as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode == Opcode.IGET_OBJECT && field?.definingClass == mapOwner && field.name == mapName
            && next?.name == "size" && next.definingClass.startsWith("Ljava/util/")) index else null
    }
    check(anchors.size == 1) { "Transparent poster ID NG filter anchor changed: ${packageMetadata.versionName}" }
    val index = anchors.single()
    val receiver = (instructions[index] as TwoRegisterInstruction).registerB
    check(receiver <= 15) { "Transparent poster ID NG owner register out of range" }
    // No scratch registers, original instructions or arguments are changed. Native jump
    // targets to this filtering phase must also execute the extension before reading the map.
    val read = instructions[index] as TwoRegisterInstruction
    val field = (instructions[index] as ReferenceInstruction).reference as FieldReference
    // Replace the anchor so its existing labels remain on the hook. A plain insert
    // would let native jumps skip the extension and land on the original map read.
    method.replaceInstruction(index, "invoke-static {v$receiver}, $POSTER_CHAIN->applyHidden(Ljava/lang/Object;)V")
    method.addInstructionsWithLabels(index + 1,
        "iget-object v${read.registerA}, v$receiver, ${field.definingClass}->${field.name}:${field.type}")
}
