package app.pigfoot.patches.pitt

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest

internal const val PITT_LOGIN_OWNER = "Lcom/ihad/ptt/a;"
internal const val PITT_PACKAGE = "com.ihad.ptt"
internal const val PITT_VERSION = "12.0.0"
internal const val PITT_CODE = 40892
internal const val PITT_STATE = "Lcom/ihad/ptt/model/handler/g2;"
internal const val PITT_SPONSORED_FIELD = "a1"
internal const val PITT_FIELD = "$PITT_STATE->$PITT_SPONSORED_FIELD:Z"
internal const val PITT_SETTER = "morphe\$setLocalSponsored"

internal fun requirePittVersion(name: String, code: String) {
    require(name == PITT_VERSION && code == PITT_CODE.toString()) { "Unsupported PiTT version/build code" }
}

// Independently measured from both the pristine base and untouched merged ARM64 APKS.
internal val pittClassPins = mapOf(
    PITT_LOGIN_OWNER to "3c018ff8ed614af96f9a95c01b907782315b37ec6e7ac4c980fa2fc7ef4b7165",
    PITT_EXPIRY_NOTICE_OWNER to "52fa78495a715ade1cca06e86d27f85cd7b28299619ad9da44de95ecf250064b",
    "Lcom/ihad/ptt/d;" to "4ffa6ba7924357256002a228b3ec06de3fda65fb5272d7f044d29674cf9df479",
    "Lcom/ihad/ptt/j6\$l;" to "d44bd965421b0b70202a6b18faed31fda1fd35abdc2c6b28de09bbef0bbc857f",
    PITT_STATE to "15f687be4ea9421aec3806646c765bb3550902e849c89b78fb036383cc98f1c2"
)

internal fun pittClassHash(definition: ClassDef): String {
    val pool = DexPool(Opcodes.forDexVersion(39))
    pool.internClass(definition)
    val store = MemoryDataStore()
    pool.writeTo(store)
    return MessageDigest.getInstance("SHA-256").digest(store.data).joinToString("") { "%02x".format(it) }
}

internal fun Method.pittId() = definingClass + "->" + name + "(" + parameterTypes.joinToString("") + ")" + returnType

internal val pittWriterCounts = mapOf(
    "Lcom/ihad/ptt/d;->V0(Lcom/ihad/ptt/d;)V" to 1,
    "Lcom/ihad/ptt/d;->f1()V" to 1,
    "Lcom/ihad/ptt/d;->g1(Ljava/lang/String;)V" to 2,
    "Lcom/ihad/ptt/j6\$l;->b(Ljava/lang/String;Ljava/lang/String;)V" to 1,
    "$PITT_STATE-><init>()V" to 1
)

/** Scan all classes, not just the known writers, so newly added writes fail closed. */
internal fun pittWriteIndices(method: Method): List<Int> = method.implementation?.instructions?.toList()
    ?.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference?.toString()
        if (ref != PITT_FIELD || !instruction.opcode.name.uppercase().startsWith("IPUT") &&
            !instruction.opcode.name.uppercase().startsWith("SPUT")) null else {
            require(instruction.opcode == Opcode.IPUT_BOOLEAN) { "Unsupported PiTT sponsored field write" }
            index
        }
    } ?: emptyList()

internal fun requirePittWriterInventory(writers: Map<String, Int>) {
    require(writers == pittWriterCounts) { "Unsupported PiTT sponsored writer inventory" }
}

/** No caller register is overwritten. Mutable dexlib relocates branches and handlers. */
internal fun redirectPittWrites(method: MutableMethod) {
    val indices = pittWriteIndices(method)
    require(indices.size == pittWriterCounts[method.pittId()]) { "Unsupported PiTT sponsored writer method" }
    val implementation = requireNotNull(method.implementation)
    val target = ImmutableMethodReference(PITT_STATE, PITT_SETTER, listOf("Z", PITT_STATE), "V")
    // Keep original indices even if a builder must widen a branch after relocation.
    for (index in indices.asReversed()) {
        val instruction = implementation.instructions[index] as TwoRegisterInstruction
        implementation.replaceInstruction(index, BuilderInstruction35c(Opcode.INVOKE_STATIC,
            2, instruction.registerA, instruction.registerB, 0, 0, 0, target))
    }
}

/** The incoming boolean is deliberately ignored, without modifying its caller's value. */
internal fun pittSetterMethod(): ImmutableMethod = ImmutableMethod(
    PITT_STATE, PITT_SETTER,
    listOf(ImmutableMethodParameter("Z", emptySet(), null), ImmutableMethodParameter(PITT_STATE, emptySet(), null)),
    "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
    emptySet(), emptySet(), ImmutableMethodImplementation(2, listOf(
        ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
        ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, 0, 1, ImmutableFieldReference(PITT_STATE, PITT_SPONSORED_FIELD, "Z")),
        ImmutableInstruction10x(Opcode.RETURN_VOID)
    ), emptyList(), emptyList())
)
