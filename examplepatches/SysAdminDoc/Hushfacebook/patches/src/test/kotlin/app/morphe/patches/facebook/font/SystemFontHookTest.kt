/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What the font swap's return hooks read and borrow at each object return: the resolver reads the
 * family and the weight there and copies into v0 to v2, a builder's build reads `this` and copies
 * into v0 and v1. Each is proved rather than trusted.
 */
class SystemFontHookTest {
    private val family = "Lfixture/Family;"

    /** A resolver, (family, int weight)Typeface, static, with three locals: family in v3, weight in v4. */
    private fun resolver(smali: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Repository;", "resolve",
            listOf(ImmutableMethodParameter(family, null, null), ImmutableMethodParameter("I", null, null)),
            TYPEFACE, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(5, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    /** A builder's build, build(Context)Typeface on an instance, with two locals: this in v2. */
    private fun build(smali: String, static: Boolean = false): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Builder;", "build", listOf(ImmutableMethodParameter(CONTEXT, null, null)),
            TYPEFACE, AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
            ImmutableMethodImplementation(if (static) 3 else 4, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    private val lookup = "invoke-static { v3, v4 }, Lfixture/Cache;->get(${family}I)$TYPEFACE"

    @Test
    fun `a resolver that still holds its family and weight at every return takes the hook`() {
        resolver(
            """
                $lookup
                move-result-object v1
                if-eqz v1, :miss
                return-object v1
                :miss
                const/4 v0, 0x0
                return-object v0
            """,
        ).requireResolverHookFits()
    }

    /** The resolver is done with the family and puts something else in its register before returning. */
    @Test
    fun `a resolver writing over its family or weight before a return stops the patch`() {
        val family = assertThrows(PatchException::class.java) {
            resolver(
                """
                    $lookup
                    move-result-object v0
                    const/4 v3, 0x0
                    return-object v0
                """,
            ).requireResolverHookFits()
        }
        assertTrue(family.message, family.message.orEmpty().contains("writes over parameter 0 (v3)"))

        val weight = assertThrows(PatchException::class.java) {
            resolver(
                """
                    $lookup
                    move-result-object v0
                    const/4 v4, 0x1
                    return-object v0
                """,
            ).requireResolverHookFits()
        }
        assertTrue(weight.message, weight.message.orEmpty().contains("writes over parameter 1 (v4)"))
    }

    /**
     * The return sits in a try block whose handler reads v1, and the hook's call can throw into it
     * after the copies went into v0 to v2. The positive control is the same method with the
     * handler reading v1 only after writing it.
     */
    @Test
    fun `a return a handler can be reached from keeps what the handler reads`() {
        val cacheGet = ImmutableMethodReference("Lfixture/Cache;", "get", listOf(family, "I"), TYPEFACE)
        val note = ImmutableMethodReference("Lfixture/Log;", "note", listOf("Ljava/lang/Object;"), "V")
        fun resolverWithHandler(handlerWritesFirst: Boolean) = MutableMethod(
            ImmutableMethod(
                "Lfixture/Repository;", "resolve",
                listOf(ImmutableMethodParameter(family, null, null), ImmutableMethodParameter("I", null, null)),
                TYPEFACE, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(
                    5,
                    listOfNotNull(
                        // 0: address 0, 3 units
                        ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, 3, 4, 0, 0, 0, cacheGet),
                        // 1: address 3
                        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                        // 2: address 4, the return, inside the try
                        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                        // 3: address 5, the handler
                        ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, if (handlerWritesFirst) 1 else 2),
                        // 4: address 6, reads v1
                        ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0, note),
                        // 5: address 9
                        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                    ),
                    listOf(ImmutableTryBlock(0, 5, listOf(ImmutableExceptionHandler(null, 5)))),
                    null,
                ),
            ),
        )
        resolverWithHandler(handlerWritesFirst = true).requireResolverHookFits()
        val refused = assertThrows(PatchException::class.java) { resolverWithHandler(handlerWritesFirst = false).requireResolverHookFits() }
        assertTrue(refused.message, refused.message.orEmpty().contains("still reads v1"))
    }

    @Test
    fun `a build that still holds this at its returns takes the hook, and one that doesn't stops the patch`() {
        build(
            """
                invoke-static { v2, v3 }, Lfixture/Fonts;->make(Ljava/lang/Object;$CONTEXT)$TYPEFACE
                move-result-object v0
                return-object v0
            """,
        ).requireBuilderHookFits()

        val reused = assertThrows(PatchException::class.java) {
            build(
                """
                    invoke-static { v2, v3 }, Lfixture/Fonts;->make(Ljava/lang/Object;$CONTEXT)$TYPEFACE
                    move-result-object v0
                    move-object v2, v3
                    return-object v0
                """,
            ).requireBuilderHookFits()
        }
        assertTrue(reused.message, reused.message.orEmpty().contains("writes over this (v2)"))

        val static = assertThrows(PatchException::class.java) {
            build("const/4 v0, 0x0\nreturn-object v0", static = true).requireBuilderHookFits()
        }
        assertTrue(static.message, static.message.orEmpty().contains("is static"))
    }
}
