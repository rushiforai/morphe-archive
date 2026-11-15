package app.template.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.instagram.misc.rewriteInstagramAuthority
import app.template.patches.instagram.misc.rewriteInstagramPackagePrefix
import app.template.patches.instagram.shared.replaceJsonFieldWithBogus
import app.template.patches.shared.cloneMutable
import app.template.patches.shared.getFreeRegisterProvider
import app.template.patches.shared.getReference
import app.template.patches.shared.numberOfParameterRegisters
import app.template.patches.shared.returnBoxedBooleanEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction12x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.BufferedInputStream
import java.io.ByteArrayInputStream

/** Run by the testInstagram Gradle task; verifies DEX round-trips and clone helpers without an APK. */
object InstagramPatchTest {
    @JvmStatic
    fun main(args: Array<String>) {
        testReplaceJsonFieldWithBogus()
        testReturnBoxedBooleanEarly()
        testCloneParametersPreservesLongParam()
        testCloneRewritingHelpers()
        testLikeAnimationUsesParameterRegistersOnly()
        println("Instagram patch DEX round trips and helper tests passed")
    }

    private fun testReplaceJsonFieldWithBogus() {
        val body = MutableMethodImplementation(2).apply {
            addInstruction(BuilderInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("feed_items")))
            addInstruction(BuilderInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference("auto_load_more_enabled")))
            addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        }
        val method = MutableMethod(
            ImmutableMethod(
                "LInstagramTest;",
                "unsafeParseFromJson",
                emptyList(),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                body,
            ),
        )
        method.replaceJsonFieldWithBogus("feed_items")
        val roundTripped = roundTrip(method)
        val strings = roundTripped.implementation!!.instructions.mapNotNull {
            it.getReference<StringReference>()?.string
        }
        check(strings == listOf("BOGUS", "auto_load_more_enabled")) {
            "Expected BOGUS replacement, got $strings"
        }
    }

    private fun testReturnBoxedBooleanEarly() {
        val body = MutableMethodImplementation(1).apply {
            addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        }
        val method = MutableMethod(
            ImmutableMethod(
                "LInstagramTest;",
                "enableNotes",
                emptyList(),
                "Ljava/lang/Boolean;",
                AccessFlags.PUBLIC.value,
                null,
                null,
                body,
            ),
        )
        method.returnBoxedBooleanEarly(false)
        val insns = roundTrip(method).implementation!!.instructions.toList()
        check(insns[0].opcode == Opcode.SGET_OBJECT && insns[1].opcode == Opcode.RETURN_OBJECT) {
            "Expected boxed Boolean early return, got $insns"
        }
    }

    private fun testCloneParametersPreservesLongParam() {
        val params = listOf(
            ImmutableMethodParameter("Ljava/lang/Object;", null, null),
            ImmutableMethodParameter("J", null, null),
            ImmutableMethodParameter("Z", null, null),
        )
        val body = MutableMethodImplementation(5).apply {
            addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        }
        val original = ImmutableMethod(
            "LInstagramTest;",
            "getBoolFlag",
            params,
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            body,
        )
        val cloned = original.cloneMutable(additionalRegisters = original.numberOfParameterRegisters)
        val insns = roundTrip(cloned).implementation!!.instructions.toList()
        check(cloned.implementation!!.registerCount == 10) {
            "Expected 5 original + 5 parameter registers = 10, got ${cloned.implementation!!.registerCount}"
        }
        check(insns.first().opcode == Opcode.MOVE_OBJECT_FROM16) {
            "Expected move-object/from16 prologue for `this`, got ${insns.first().opcode}"
        }
        check(insns[2].opcode == Opcode.MOVE_WIDE_FROM16) {
            "Expected move-wide/from16 prologue for long param, got ${insns[2].opcode}"
        }
    }

    private fun testCloneRewritingHelpers() {
        check(
            rewriteInstagramPackagePrefix("com.instagram.android.permission.RECEIVE", "com.instagram.android.proteus") ==
                "com.instagram.android.proteus.permission.RECEIVE",
        )
        check(
            rewriteInstagramPackagePrefix("com.instagram.android.proteus.permission.RECEIVE", "com.instagram.android.proteus") ==
                "com.instagram.android.proteus.permission.RECEIVE",
        )
        check(
            rewriteInstagramAuthority("com.instagram.android.fileprovider", "com.instagram.android.proteus") ==
                "com.instagram.android.proteus.fileprovider",
        )
        check(
            rewriteInstagramAuthority("com.facebook.appmanager.provider", "com.instagram.android.proteus") ==
                "com.instagram.android.proteus_com.facebook.appmanager.provider",
        )
    }

    /**
     * Regression test for the "No free registers available" failure of the
     * "Change like animation" patch on Instagram 439.0.0.37.89.
     *
     * The `XDTUserActivationMetadataImpl.<init>` constructor is register
     * saturated, so `getFreeRegisterProvider(0, 2)` throws
     * `IllegalStateException: No free registers available` and the whole patch
     * fails to apply.
     *
     * The fix asks for a single 4-bit scratch register and carries the
     * Boolean flag in the p2 parameter register, exactly like upstream piko.
     */
    private fun testLikeAnimationUsesParameterRegistersOnly() {
        // A constructor shaped like XDTUserActivationMetadataImpl.<init>:
        // (this, <enum> animation, Boolean explicitChoice).
        //
        // Every register is live (p0/p1/p2 plus v0..v2 all touched), so a
        // free-register search finds fewer than two 4-bit registers.
        val body = MutableMethodImplementation(19).apply {
            // Every register except one is live: each move reads and writes
            // the same register, so the free-register search sees them as
            // used and cannot hand them out. The three parameter registers
            // (this, the animation enum and the Boolean) sit at v16-v18,
            // leaving only v15 unused.
            //
            // This reproduces the register-saturated
            // XDTUserActivationMetadataImpl.<init> frame that made the old
            // patch fail with "No free registers available": only a single
            // 4-bit register is left, so a request for two fails while a
            // request for one succeeds.
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 0, 0))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 1, 1))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 2, 2))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 3, 3))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 4, 4))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 5, 5))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 6, 6))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 7, 7))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 8, 8))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 9, 9))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 10, 10))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 11, 11))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 12, 12))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 13, 13))
            addInstruction(BuilderInstruction12x(Opcode.MOVE_OBJECT, 14, 14))
            addInstruction(BuilderInstruction22x(Opcode.MOVE_FROM16, 16, 16))
            addInstruction(BuilderInstruction22x(Opcode.MOVE_FROM16, 17, 17))
            addInstruction(BuilderInstruction22x(Opcode.MOVE_FROM16, 18, 18))
            addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        }
        val method = MutableMethod(
            ImmutableMethod(
                "Lcom/instagram/api/schemas/XDTUserActivationMetadataImpl;",
                "<init>",
                listOf(
                    ImmutableMethodParameter(
                        "Lcom/instagram/api/schemas/XDTUserActivationMetadataImpl\$Animation;",
                        null,
                        null,
                    ),
                    ImmutableMethodParameter("Ljava/lang/Boolean;", null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value,
                null,
                null,
                body,
            ),
        )

        // Reproduce the reported failure: the frame cannot satisfy a request
        // for two scratch registers. Depending on how many registers the
        // search manages to find, this surfaces either as
        // "Could not find a free register ..." (nothing found) or as
        // "No free registers available" (found one, then ran out) - which is
        // exactly what the user hit on 439.0.0.37.89.
        val provider = method.getFreeRegisterProvider(0, 2)
        val twoRegistersFailed = try {
            provider.getFreeRegister()
            provider.getFreeRegister()
            false
        } catch (exception: IllegalArgumentException) {
            exception.message?.startsWith("Could not find a free register") == true
        } catch (exception: IllegalStateException) {
            exception.message == "No free registers available"
        }
        check(twoRegistersFailed) {
            "Expected the saturated constructor to fail when two scratch registers are requested"
        }

        // The fix must only need a single 4-bit scratch register, which is
        // exactly what remains available in this frame (v15).
        val single = try {
            method.getFreeRegisterProvider(0, 1).getFreeRegister4BitOrNull()
        } catch (exception: IllegalArgumentException) {
            null
        }
        check(single != null && single < 16) {
            "Expected a single free 4-bit register, got $single"
        }
    }

    private fun roundTrip(method: Method): Method {
        val cls = ImmutableClassDef(
            "LInstagramTest;",
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptyList(),
            emptyList(),
            listOf(method),
        )
        val store = MemoryDataStore()
        val opcodes = Opcodes.getDefault()
        DexPool.writeTo(store, ImmutableDexFile(opcodes, listOf(cls)))
        return DexBackedDexFile.fromInputStream(opcodes, BufferedInputStream(ByteArrayInputStream(store.data)))
            .classes.single().methods.single()
    }
}
