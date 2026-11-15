package app.template.patches.reddit.shared

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

private const val LIST = "Ljava/util/List;"
private const val MAP = "Ljava/util/Map;"
private const val CHANGES = "Lhye;"

/**
 * Regression coverage for the Reddit comment-tree discovery.  Reddit 2026.42.0
 * shipped at least two versionCodes whose R8 output names the TreeData class
 * differently (`Lc5l0;` vs `Lm5l0;`); the resolver must match by constructor
 * shape, not by name, and must reject interfaces/abstract classes that happen
 * to share the shape.
 */
object RedditCommentTreeTest {
    @JvmStatic
    fun main(args: Array<String>) {
        val valid = treeDataClass("Lm5l0;")
        check(valid.matchesCommentTreeData()) { "concrete TreeData shape should match" }

        val writes = valid.methods.single { it.name == "<init>" }.fieldWrites()
        check(writes.map { it.type } == listOf(LIST, MAP, MAP))
        check(writes.map { it.register } == listOf(2, 3, 4)) {
            "expected constructor parameter registers v2/v3/v4, got ${writes.map { it.register }}"
        }

        // An interface can carry the same constructor signature in the dex
        // (abstract methods have no body), which is exactly how `Lc5l0;` fooled
        // the old hard-coded fingerprint.  It must never be selected.
        check(!treeDataClass("Lc5l0;", AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value)
            .matchesCommentTreeData()) { "interface must not match" }
        check(!treeDataClass("Lc5l0;", AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)
            .matchesCommentTreeData()) { "abstract class must not match" }

        // Field-write order is the stable anchor.  A class that writes the maps
        // before the ordered id list is a different shape and must be rejected.
        check(!treeDataClass("Lbad1;", writeOrder = listOf(MAP, MAP, LIST))
            .matchesCommentTreeData()) { "reordered writes must not match" }

        // Same arity but wrong parameter types must be rejected.
        check(!treeDataClass("Lbad2;", parameters = listOf(CHANGES, MAP, LIST, MAP))
            .matchesCommentTreeData()) { "wrong parameter types must not match" }

        println("Reddit comment-tree shape discovery passed")
    }

    private fun treeDataClass(
        type: String,
        accessFlags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        parameters: List<String> = listOf(CHANGES, LIST, MAP, MAP),
        writeOrder: List<String> = listOf(LIST, MAP, MAP),
    ): ClassDef {
        val fields = listOf(
            ImmutableField(type, "a", CHANGES, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null, null, emptySet()),
            ImmutableField(type, "b", LIST, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null, null, emptySet()),
            ImmutableField(type, "c", MAP, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null, null, emptySet()),
            ImmutableField(type, "d", MAP, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null, null, emptySet()),
        )

        val body = MutableMethodImplementation(parameters.size + 1)
        var mapIndex = 0
        writeOrder.forEachIndexed { index, fieldType ->
            val name = if (fieldType == LIST) "b" else "c".takeIf { mapIndex++ == 0 } ?: "d"
            body.addInstruction(
                BuilderInstruction22c(
                    Opcode.IPUT_OBJECT,
                    index + 2,
                    0,
                    ImmutableFieldReference(type, name, fieldType),
                ),
            )
        }
        body.addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))

        val constructor = ImmutableMethod(
            type,
            "<init>",
            parameters.map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            null,
            null,
            body,
        )

        return ImmutableClassDef(
            type,
            accessFlags,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            null,
            fields,
            listOf(constructor),
        )
    }
}
