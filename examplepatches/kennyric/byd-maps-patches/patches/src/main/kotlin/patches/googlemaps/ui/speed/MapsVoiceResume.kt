package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val MAPS_NATIVE_REPLAY = "Lorg/ungoogled/ui/MapsGuidanceCoordinator\$NativeReplay;"
internal const val MAPS_CAN_RESUME_VOICE = "morpheCanResumeGuidance"
internal const val MAPS_RESUME_VOICE = "morpheResumeGuidance"
private const val ORIGINAL = "Lbmon;->u(Lycx;)V"

/** u selects INSPECT_STEP before requesting speech. Copy only its guarded voice branch. */
internal fun mapsVoiceResumeMethods(original: Method): List<MutableMethod> {
    val contract = mapsVoiceContracts.getValue(ORIGINAL)
    check(original.toString() == ORIGINAL && original.accessFlags == contract.flags &&
        original.implementation?.registerCount == contract.registers &&
        original.implementation!!.instructions.count() == contract.count &&
        mapsVoiceFingerprint(original) == contract.hash) { "Changed Maps native voice/step selection" }
    val instructions = original.implementation!!.instructions.toList()
    fun nativeInvoke(reference: String, registers: String): String {
        val matches = instructions.filter { (it as? ReferenceInstruction)?.reference?.toString() == reference }
        check(matches.isNotEmpty()) { "Missing native voice call $reference" }
        val opcode = matches.map { it.opcode }.distinct().single()
        val mnemonic=when(opcode){
            Opcode.INVOKE_STATIC -> "invoke-static"
            Opcode.INVOKE_VIRTUAL -> "invoke-virtual"
            Opcode.INVOKE_INTERFACE -> "invoke-interface"
            else -> error("Changed native voice invoke $reference")
        }
        return "$mnemonic {$registers}, $reference"
    }
    val eligibility = nativeInvoke("Lbudy;->y(Landroid/content/Context;)Z", "v0")
    val provider = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.name=="a" && it.parameterTypes.isEmpty() && it.returnType=="Ljava/lang/Object;" }
        .map { it.toString() }.distinct().single()
    val speech = nativeInvoke("Lbnby;->d(Lblvb;Lyda;)Lbncc;", "v2, v1, v3")
    val queue = nativeInvoke("Lbnaz;->j(Lbncc;Lbnbc;Lbnay;)Lcom/google/common/util/concurrent/ListenableFuture;", "v0, v1, v2, v3")
    fun method(name: String, result: String, registers: Int, code: String) =
        MutableMethod(ImmutableMethod("Lbmon;", name, emptyList(), result,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.SYNTHETIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
            .apply { addInstructions(0, code.trimIndent()) }
    val canResume = method(MAPS_CAN_RESUME_VOICE, "Z", 2, """
        iget-object v0, p0, Lbmon;->o:Lycx;
        if-eqz v0, :unavailable
        iget-object v0, p0, Lbmon;->e:Lblvb;
        if-eqz v0, :unavailable
        iget-object v0, p0, Lbmon;->d:Landroid/content/Context;
        $eligibility
        move-result v0
        if-nez v0, :unavailable
        const/4 v0, 0x1
        return v0
        :unavailable
        const/4 v0, 0x0
        return v0
    """)
    val resume = method(MAPS_RESUME_VOICE, "V", 5, """
        invoke-virtual {p0}, Lbmon;->$MAPS_CAN_RESUME_VOICE()Z
        move-result v0
        if-eqz v0, :done
        iget-object v1, p0, Lbmon;->e:Lblvb;
        iget-object v0, p0, Lbmon;->a:Lcqvj;
        ${nativeInvoke(provider, "v0")}
        move-result-object v0
        check-cast v0, Lbnaz;
        iget-object v2, p0, Lbmon;->b:Lcqvj;
        ${nativeInvoke(provider, "v2")}
        move-result-object v2
        check-cast v2, Lbnby;
        const/4 v3, 0x0
        $speech
        move-result-object v1
        sget-object v2, Lbnbc;->c:Lbnbc;
        $queue
        :done
        return-void
    """)
    return listOf(canResume, resume)
}

internal fun bindMapsVoiceResume(owner: MutableClass, original: Method) {
    check(owner.type == "Lbmon;" && MAPS_NATIVE_REPLAY !in owner.interfaces &&
        owner.methods.none { it.name == MAPS_CAN_RESUME_VOICE || it.name == MAPS_RESUME_VOICE }) {
        "Changed or already installed Maps voice-only recovery"
    }
    owner.interfaces.add(MAPS_NATIVE_REPLAY)
    owner.methods.addAll(mapsVoiceResumeMethods(original))
}
