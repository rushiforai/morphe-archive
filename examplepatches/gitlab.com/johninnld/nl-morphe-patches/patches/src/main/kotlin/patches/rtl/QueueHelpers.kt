package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun queueHelper(owner: String, name: String, params: List<String>, result: String,
    locals: Int, code: String, catchParserErrors: Boolean = false): MutableMethod =
    MutableMethod(ImmutableMethod(owner, name,
        params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.sumOf { if (it == "J" || it == "D") 2 else 1 },
            emptyList(), emptyList(), emptyList()))).apply {
        val source = code.trimIndent()
        addInstructions(0, source)
        if (catchParserErrors) {
            fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
                .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
            implementation!!.addCatch("Ljava/lang/Exception;",
                implementation!!.newLabelForIndex(index(":try_start")),
                implementation!!.newLabelForIndex(index(":try_end")),
                implementation!!.newLabelForIndex(index(":parse_error")))
        }
    }
