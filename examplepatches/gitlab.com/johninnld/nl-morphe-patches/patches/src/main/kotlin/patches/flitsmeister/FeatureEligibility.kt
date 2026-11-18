package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream

private val eligibilityInput = bytecodePatch {
    dependsOn(originalInput)
    execute {
        check(classDefByOrNull(ELIGIBILITY) == null) { "Feature-local State helper already present" }
        val state = classDefBy("Landroidx/compose/runtime/State;")
        check(state.accessFlags and AccessFlags.INTERFACE.value != 0)
        check(state.methods.count { it.name == "getValue" && it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() } == 1)
    }
}

/** Generate DEX through descriptor strings: the patch bundle has no Compose
 * compile dependency. Each scoped read receives a fresh immutable true State;
 * there is no setter, snapshot state, shared preference or membership mutation. */
internal val featureEligibility = bytecodePatch {
    dependsOn(originalInput, eligibilityInput)
    extendWith {
        fun method(name: String, result: String, parameters: List<String>, locals: Int, flags: Int, code: String) =
            MutableMethod(ImmutableMethod(ELIGIBILITY, name,
                parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result, flags,
                emptySet(), emptySet(), ImmutableMethodImplementation(locals + parameters.size + if (flags and AccessFlags.STATIC.value == 0) 1 else 0,
                    emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }
        val constructor = method("<init>", "V", emptyList(), 0,
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                return-void
            """)
        val value = method("getValue", "Ljava/lang/Object;", emptyList(), 1, AccessFlags.PUBLIC.value, """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
        """)
        val factory = method("state", "Landroidx/compose/runtime/State;", listOf("Landroidx/compose/runtime/Composer;"), 1,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, """
                new-instance v0, $ELIGIBILITY
                invoke-direct {v0}, $ELIGIBILITY-><init>()V
                return-object v0
            """)
        val cls = ImmutableClassDef(ELIGIBILITY, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            "Ljava/lang/Object;", listOf("Landroidx/compose/runtime/State;"), "MorpheFeatureEligibility", emptySet(), emptyList(), listOf(constructor, value, factory))
        val store = MemoryDataStore()
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(32), listOf(cls)))
        ByteArrayInputStream(store.data)
    }
}
