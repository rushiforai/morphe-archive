package patches.vela

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import java.io.InputStream

/** The host owns the car framework. Generate only this app-specific Screen subclass. */
internal fun carProviderScreenDex(): InputStream {
    val type = "Lnl/johninnl/vela/car/ProviderScreen;"
    fun method(name: String, result: String, params: List<String>, locals: Int, flags: Int, code: String) =
        MutableMethod(ImmutableMethod(type, name,
            params.map { ImmutableMethodParameter(it, emptySet(), null) }, result, flags,
            emptySet(), emptySet(), ImmutableMethodImplementation(locals + params.size + if (flags and AccessFlags.STATIC.value == 0) 1 else 0,
                emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }
    val constructor = method("<init>", "V", listOf("Landroidx/car/app/i;"), 0,
        AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, """
            invoke-direct {p0, p1}, Lnt3;-><init>(Landroidx/car/app/i;)V
            return-void
        """)
    val template = method("k", "Lse4;", emptyList(), 1, AccessFlags.PUBLIC.value, """
        invoke-static {p0}, Lnl/johninnl/vela/CarUi;->providerTemplate(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Lse4;
        return-object v0
    """)
    // R8 removed qj4's constructor and invokes Object.<init> directly in the original hw.o.
    // Java reflection cannot allocate that builder; preserve the original verified DEX sequence.
    val toggle = method("nativeToggle", "Ljava/lang/Object;", listOf("Ljava/lang/Object;", "Z"), 2,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, """
            new-instance v0, Lqj4;
            invoke-direct {v0}, Ljava/lang/Object;-><init>()V
            check-cast p0, Lev2;
            iput-object p0, v0, Lqj4;->a:Lev2;
            iput-boolean p1, v0, Lqj4;->b:Z
            new-instance v1, Landroidx/car/app/model/Toggle;
            invoke-direct {v1, v0}, Landroidx/car/app/model/Toggle;-><init>(Lqj4;)V
            return-object v1
        """)
    val screen = ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Lnt3;", emptyList(), "MorpheVelaProviderScreen", emptySet(), emptyList(), listOf(constructor, template, toggle))
    val output = MemoryDataStore()
    DexPool.writeTo(output, ImmutableDexFile(Opcodes.forApi(26), listOf(screen)))
    return ByteArrayInputStream(output.data)
}
