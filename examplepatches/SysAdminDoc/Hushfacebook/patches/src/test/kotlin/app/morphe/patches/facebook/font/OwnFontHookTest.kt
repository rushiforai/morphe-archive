/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What the font swap's return hooks read and borrow at each object return: the resolver reads the
 * family and the weight there and copies into v0 to v2, a builder's build reads `this` and copies
 * into v0 and v1, and React Native's resolver reads the family name and copies into v0 and v1. Each
 * is proved rather than trusted.
 */
class OwnFontHookTest {
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

    private val reactUtils = "Lfixture/ReactTypefaceUtils;"

    /**
     * React Native's resolver, (AssetManager, Typeface, String family, int style, int weight)Typeface,
     * static, with two locals: the family in v4, the style in v5 and the weight in v6.
     */
    private fun reactResolver(smali: String, name: String = "applyStyles", static: Boolean = true): MutableMethod =
        MutableMethod(
            ImmutableMethod(
                reactUtils, name,
                listOf(ASSET_MANAGER, TYPEFACE, STRING, "I", "I").map { ImmutableMethodParameter(it, null, null) },
                TYPEFACE, AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
                ImmutableMethodImplementation(if (static) 7 else 8, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }

    private val fromAsset =
        "invoke-static { v2, v4 }, $TYPEFACE->createFromAsset($ASSET_MANAGER$STRING)$TYPEFACE"

    /** Two returns: the asset it found, and the phone's family by the name when there's none. */
    private val twoReturns = """
        $fromAsset
        move-result-object v0
        if-eqz v0, :system
        return-object v0
        :system
        const/4 v5, 0x0
        invoke-static { v4, v5 }, $TYPEFACE->create(${STRING}I)$TYPEFACE
        move-result-object v1
        return-object v1
    """

    /** It resolves the style and the weight in place, which the hook doesn't read. The family it reads. */
    @Test
    fun `a React Native resolver that keeps its family name to every return takes the hook`() {
        reactResolver(twoReturns).requireReactNativeHookFits()

        val refused = assertThrows(PatchException::class.java) {
            reactResolver(
                """
                    $fromAsset
                    move-result-object v0
                    const/4 v4, 0x0
                    return-object v0
                """,
            ).requireReactNativeHookFits()
        }
        assertTrue(refused.message, refused.message.orEmpty().contains("writes over parameter 2 (v4)"))
    }

    @Test
    fun `React Native's resolver is told apart by its shape and its asset lookup`() {
        val resolver = reactResolver("$fromAsset\nmove-result-object v0\nreturn-object v0")
        val noAssets = reactResolver(
            "invoke-static { v4, v5 }, $TYPEFACE->create(${STRING}I)$TYPEFACE\nmove-result-object v0\nreturn-object v0",
            name = "withoutAssets",
        )
        val instance = reactResolver(
            "invoke-static { v3, v5 }, $TYPEFACE->createFromAsset($ASSET_MANAGER$STRING)$TYPEFACE\n" +
                "move-result-object v0\nreturn-object v0",
            name = "onAnInstance", static = false,
        )
        val owner = ImmutableClassDef(reactUtils, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
            listOf(resolver, noAssets, instance))
        assertEquals(listOf("applyStyles"), reactNativeResolvers(owner).map { it.name })
    }

    /** A method that logs the refusal React Native's utilities log, so the patcher's string search finds the class. */
    private fun refusalLogger(type: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            type, "parseFontVariationSettings", listOf(ImmutableMethodParameter(STRING, null, null)), STRING,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(2, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, "const-string v0, \"$INVALID_FONT_VARIATION\"\nreturn-object v0") }

    /**
     * Through the patcher: each return of the one resolver hands its answer and the family name to
     * the extension and returns what comes back. The extension's own class, which the patcher sees
     * merged in, doesn't count even when it holds the same literal and shape.
     */
    @Test
    fun `the hook hands each answer and the family name to the extension`() {
        val extension = "Lapp/morphe/extension/facebook/font/Stub;"
        val context = PatchContexts.of(
            listOf(
                ImmutableClassDef(reactUtils, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
                    listOf(refusalLogger(reactUtils), reactResolver(twoReturns))),
                ImmutableClassDef(extension, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
                    listOf(refusalLogger(extension), reactResolver(twoReturns).let {
                        ImmutableMethod(extension, it.name, it.parameters, it.returnType, it.accessFlags, null, null,
                            it.implementation)
                    })),
            ),
        )
        context.hookReactNativeFonts()

        val body = context.mutableClassDefBy(reactUtils).methods.single { it.name == "applyStyles" }
            .implementation!!.instructions.toList()
        val calls = body.indices.filter { (body[it] as? ReferenceInstruction)?.reference?.toString() == REPLACE_REACT_NATIVE }
        assertEquals("one call before each of the two returns", 2, calls.size)
        for ((call, returned) in calls.zip(listOf(0, 1))) {
            assertEquals(listOf(0, 1), (body[call] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
            val family = body[call - 1] as TwoRegisterInstruction
            assertEquals("the family is copied down from v4", listOf(Opcode.MOVE_OBJECT_FROM16, 1, 4),
                listOf(family.opcode, family.registerA, family.registerB))
            assertEquals(Opcode.MOVE_RESULT_OBJECT, body[call + 1].opcode)
            assertEquals(returned, (body[call + 1] as OneRegisterInstruction).registerA)
            assertEquals(Opcode.RETURN_OBJECT, body[call + 2].opcode)
            assertEquals(returned, (body[call + 2] as OneRegisterInstruction).registerA)
        }
        val answer = body[calls[1] - 2] as TwoRegisterInstruction
        assertEquals("the answer in v1 is copied to v0 first", listOf(Opcode.MOVE_OBJECT_FROM16, 0, 1),
            listOf(answer.opcode, answer.registerA, answer.registerB))
        assertEquals("the extension's copy was hooked", 0, context.mutableClassDefBy(extension).methods
            .single { it.name == "applyStyles" }.implementation!!.instructions
            .count { (it as? ReferenceInstruction)?.reference?.toString() == REPLACE_REACT_NATIVE })
    }

    @Test
    fun `a build without React Native's resolver stops the patch`() {
        val empty = PatchContexts.of(
            listOf(ImmutableClassDef(reactUtils, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
                listOf(refusalLogger(reactUtils)))),
        )
        val refused = assertThrows(PatchException::class.java) { empty.hookReactNativeFonts() }
        assertTrue(refused.message, refused.message.orEmpty().contains("found 0"))
    }

    /**
     * The four calls the patch writes are in the OwnFont the bundle ships, public and static, with
     * exactly the descriptors the patch writes. Read from the compiled extension, so a Java
     * parameter that compiles to another type fails here rather than as a NoSuchMethodError when
     * Facebook first draws text.
     */
    @Test
    fun `every call the patch writes is in the extension`() {
        val declared = ExtensionDex.classDef(OWN_FONT).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "$OWN_FONT->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        for (call in listOf(REPLACE, REMEMBER_VARIATION, REPLACE_BUILT, REPLACE_REACT_NATIVE)) {
            assertTrue("OwnFont declares no public static $call: $declared", call in declared)
        }
    }
}
