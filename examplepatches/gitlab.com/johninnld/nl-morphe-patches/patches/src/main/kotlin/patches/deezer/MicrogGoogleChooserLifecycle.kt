package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val GOOGLE_CHOOSER_COPY = "morpheCreateGoogleChooser"

internal fun beginGoogleChooserGeneration(start: MutableMethod) {
    check(start.definingClass == DEEZER_WELCOME && start.name == "onSignInWithGoogle" &&
        start.returnType == "V" && start.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
        !AccessFlags.STATIC.isSet(start.accessFlags) && start.implementation!!.registerCount == 6)
    start.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $DEEZER_WELCOME->morpheBeginGoogleChooser(${DEEZER_WELCOME}Landroid/content/Context;)Z
        move-result v0
        if-nez v0, :morphe_begin_chooser
        return-void
    """, ExternalLabel("morphe_begin_chooser", start.getInstruction(0)))
}

internal fun captureGoogleChooserGeneration(constructor: MutableMethod) {
    check(constructor.definingClass == GOOGLE_CHOOSER && constructor.name == "<init>" &&
        constructor.parameterTypes.map(CharSequence::toString) == listOf(DEEZER_WELCOME,
            "Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "LlIIIIIlllIlIlll;") &&
        constructor.implementation!!.registerCount == 5)
    val code = constructor.instructions.toList()
    val superCall = code.indices.single { index ->
        code[index].opcode == Opcode.INVOKE_DIRECT && (code[index] as? ReferenceInstruction)?.reference?.toString() ==
            "LIlIllIIlIIIIlIII;-><init>(ILlIIIIIlllIlIlll;)V"
    }
    check(code.drop(superCall + 1).single().opcode == Opcode.RETURN_VOID)
    // p1 is already the integer arity here. Read the captured owner field, not that register.
    constructor.addInstructions(superCall + 1, """
        iget-object p1, p0, $GOOGLE_CHOOSER->this${'$'}0:$DEEZER_WELCOME
        iget-object p1, p1, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        iput-object p1, p0, $GOOGLE_CHOOSER->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
    """)
}

internal fun copyGoogleChooserGeneration(create: MutableMethod): Pair<MutableMethod, MutableMethod> {
    check(create.definingClass == GOOGLE_CHOOSER && create.name == "create" &&
        create.returnType == "LlIIIIIlllIlIlll;" &&
        create.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;", "LlIIIIIlllIlIlll;") &&
        create.implementation!!.registerCount == 5 && !AccessFlags.STATIC.isSet(create.accessFlags))
    val original = ImmutableMethod(create.definingClass, GOOGLE_CHOOSER_COPY, create.parameters, create.returnType,
        (create.accessFlags and AccessFlags.PUBLIC.value.inv()) or AccessFlags.PRIVATE.value or AccessFlags.SYNTHETIC.value,
        create.annotations, create.hiddenApiRestrictions, ImmutableMethodImplementation.of(create.implementation)).toMutable()
    val wrapped = ImmutableMethod(create.definingClass, create.name, create.parameters, create.returnType,
        create.accessFlags, create.annotations, create.hiddenApiRestrictions, MutableMethodImplementation(5)).toMutable()
    // The native create() overwrites p0. Its wrapper retains an independent p0 frame.
    wrapped.addInstructions(0, """
        invoke-direct {p0, p1, p2}, $GOOGLE_CHOOSER->$GOOGLE_CHOOSER_COPY(Ljava/lang/Object;LlIIIIIlllIlIlll;)LlIIIIIlllIlIlll;
        move-result-object v0
        check-cast v0, $GOOGLE_CHOOSER
        iget-object v1, p0, $GOOGLE_CHOOSER->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        iput-object v1, v0, $GOOGLE_CHOOSER->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        return-object v0
    """)
    return wrapped to original
}

internal fun guardGoogleChooserResume(method: MutableMethod) {
    check(method.definingClass == GOOGLE_CHOOSER && method.name == "invokeSuspend" &&
        method.returnType == "Ljava/lang/Object;" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
        method.implementation!!.registerCount == 11)
    val callback = method.instructions.withIndex().single {
        it.value.opcode == Opcode.INVOKE_STATIC && (it.value as? ReferenceInstruction)?.reference?.toString() ==
            "$DEEZER_WELCOME->access${'$'}onCredentialManagerSignIn(${DEEZER_WELCOME}Landroid/content/Context;LlIIIlllllIIlIll;)V"
    }
    val args = callback.value as FiveRegisterInstruction
    check(args.registerCount == 3 && args.registerC == 1 && args.registerD == 0 && args.registerE == 10)
    // v2/v3 are dead at this exact call; the owner/context/credential registers stay intact.
    method.addInstructionsWithLabels(callback.index, """
        iget-object v2, p0, $GOOGLE_CHOOSER->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        invoke-virtual {v2, v10}, $GOOGLE_GENERATION->bindCredential(Ljava/lang/Object;)Z
        move-result v3
        if-nez v3, :morphe_matched_chooser
        sget-object v2, LIlIIlIIIlII;->IllIlIlIIlIllIll:LIlIIlIIIlII;
        return-object v2
    """, ExternalLabel("morphe_matched_chooser", method.getInstruction(callback.index)))
    method.addInstructionsWithLabels(0, """
        iget-object v0, p0, $GOOGLE_CHOOSER->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        iget-object v1, p0, $GOOGLE_CHOOSER->this${'$'}0:$DEEZER_WELCOME
        invoke-static {v1, v0}, $DEEZER_WELCOME->morpheGoogleGenerationCurrent($DEEZER_WELCOME$GOOGLE_GENERATION)Z
        move-result v0
        if-nez v0, :morphe_current_chooser
        sget-object v0, LIlIIlIIIlII;->IllIlIlIIlIllIll:LIlIIlIIIlII;
        return-object v0
    """, ExternalLabel("morphe_current_chooser", method.getInstruction(0)))
}
