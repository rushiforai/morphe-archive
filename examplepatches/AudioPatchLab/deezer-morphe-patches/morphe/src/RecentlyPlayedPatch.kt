package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PLAYBACK_SCOPE = "LlIIlIllIIlIlI;"

internal val recentlyPlayedPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val owner = mutableClassDefBy("LIl;")
        val original = owner.methods.single {
            it.name == "lIIIIIlllllIIIII" &&
                it.parameterTypes == listOf(PLAYBACK_SCOPE, "Ljava/lang/String;") && it.returnType == "Z"
        }
        val instructions = checkNotNull(original.implementation).instructions
        check(instructions[1].opcode == Opcode.IF_NEZ && instructions[5].opcode == Opcode.SGET_OBJECT &&
            (instructions[5] as ReferenceInstruction).reference.toString() == "LIlIIIIIIllIlIIII;->lIIIIIlllllIIIII:[I")
        val native = MutableMethod(ImmutableMethod(original.definingClass, "morpheNativeScopePolicy",
            original.parameters, "Z", AccessFlags.PRIVATE.value, original.annotations,
            original.hiddenApiRestrictions, original.implementation))
        val policy = MutableMethod(ImmutableMethod(original.definingClass, original.name,
            original.parameters, "Z", original.accessFlags, original.annotations,
            original.hiddenApiRestrictions, ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
        // Use a wrapper with a scratch register, preserving the ID for every native fallback.
        policy.addInstructionsWithLabels(
            0,
            """
                if-eqz p2, :original
                sget-object v0, LlIIlIllIIlIlI;->IIIllIlllllIlIIl:$PLAYBACK_SCOPE
                if-eq p1, v0, :selectable
                sget-object v0, LlIIlIllIIlIlI;->IlllIIllIIIIll:$PLAYBACK_SCOPE
                if-eq p1, v0, :selectable
                sget-object v0, LlIIlIllIIlIlI;->llIIIIIllIIl:$PLAYBACK_SCOPE
                if-ne p1, v0, :original
                :selectable
                const/4 v0, 0x1
                return v0
                :original
                invoke-direct {p0, p1, p2}, LIl;->morpheNativeScopePolicy(${PLAYBACK_SCOPE}Ljava/lang/String;)Z
                move-result v0
                return v0
            """.trimIndent(),
        )
        check(owner.methods.remove(original))
        owner.methods.add(native)
        owner.methods.add(policy)
    }
}
