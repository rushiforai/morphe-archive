package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue

internal fun fixtureMethod(
    id: String,
    body: String,
    registers: Int = 8,
    flags: Int = AccessFlags.PUBLIC.value,
): MutableMethod {
    val owner = id.substringBefore("->")
    val name = id.substringAfter("->").substringBefore('(')
    val parameters = Regex("\\[*(?:L[^;]+;|[ZBSCIJFD])").findAll(id.substringAfter('(').substringBefore(')'))
        .map { ImmutableMethodParameter(it.value, null, null) }.toList()
    return MutableMethod(ImmutableMethod(owner, name, parameters, id.substringAfter(')'), flags,
        null, null, ImmutableMethodImplementation(registers, emptyList(), null, null)))
        .apply { addInstructionsWithLabels(0, body) }
}

internal fun fixtureClass(type: String, methods: List<Method> = emptyList(), originalName: String? = null): MutableClass {
    val fields = originalName?.let {
        listOf(ImmutableField(type, "__redex_internal_original_name", "Ljava/lang/String;",
            AccessFlags.STATIC.value, ImmutableStringEncodedValue(it), null, null))
    }.orEmpty()
    return MutableClass(ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
        emptyList(), null, emptySet(), fields, methods))
}

internal fun pluginBody(anchor: String, branch: String = "if-eq") = """
    iget-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
    const/4 v6, 0x1
    const/4 v5, 0x0
    const-string v2, "$anchor"
    iget-object v1, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
    sget-object v0, LX/1dj;->A03:Ljava/lang/Object;
    $branch v1, v0, :disabled
    return v6
    :disabled
    return v5
""".trimIndent()
