/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.metaai

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class InboxRowHookTest {
    @Test
    fun oneLocalFilterKeepsTheNativeListsStateAndRowRegistrationIntact() {
        val classes = listOf(renderer(), callback(), sectionBuilder(), factory())
        val context = PatchContexts.of(classes)
        val site = context.findOptionalInboxRow()
        context.holdOptionalInboxRow(site)
        assertGuard(context.method(site), site)
        assertNativeMethods(classes, context, site)
    }

    @Test fun duplicateRenderersRefuseBeforeMutation() = refuses(extra = renderer("Lfixture/OtherRenderer;"))
    @Test fun duplicateItemCallbacksRefuseBeforeMutation() = refuses(extra = callback("Lfixture/OtherItem;"))
    @Test fun duplicateSectionBuildersRefuseBeforeMutation() = refuses(extra = sectionBuilder("Lfixture/OtherSections;"))
    @Test fun anItemWithAnotherModelRefusesBeforeMutation() = refuses(replace = callback(cast = ORDINARY))
    @Test fun anItemCastingAnotherRendererArgumentRefusesBeforeMutation() = refuses(replace = callback(castRegister = 5))
    @Test fun anItemCallingAnotherRendererRefusesBeforeMutation() = refuses(replace = callback(render = "Lfixture/OtherRenderer;"))
    @Test fun aSectionWithoutItsStableMarkerRefusesBeforeMutation() = refuses(replace = sectionBuilder(marker = "ordinary section"))
    @Test fun aFieldReadOfAnotherRowRefusesBeforeMutation() = refuses(replace = sectionBuilder(model = ORDINARY))
    @Test fun aBranchBypassingTheFreshReadRefusesBeforeMutation() = refuses(replace = sectionBuilder(entryTarget = 5))
    @Test fun aNullCheckOfAnotherRegisterRefusesBeforeMutation() = refuses(replace = sectionBuilder(nullRegister = 2))
    @Test fun anEligibilityReadOnAnotherRowRefusesBeforeMutation() = refuses(replace = sectionBuilder(eligibilityReceiver = 3))
    @Test fun aBranchTestingAnotherEligibilityResultRefusesBeforeMutation() = refuses(replace = sectionBuilder(eligibilityTest = 3))
    @Test fun anEligibleRowFollowingTheNullResetRefusesBeforeMutation() = refuses(replace = sectionBuilder(acceptTarget = 2))
    @Test fun anIneligibleRowBypassingTheNullResetRefusesBeforeMutation() = refuses(replace = sectionBuilder(rejectTarget = 9))
    @Test fun aNullPathClearingAnotherLocalRefusesBeforeMutation() = refuses(replace = sectionBuilder(clearRegister = 2))
    @Test fun aNullPathUsingANonNullConstantRefusesBeforeMutation() = refuses(replace = sectionBuilder(zero = 1))
    @Test fun anInsertionNotGuardedByTheOptionalRowRefusesBeforeMutation() = refuses(replace = sectionBuilder(insertTest = 2))
    @Test fun anInsertionNullBranchThatStillAddsTheRowRefusesBeforeMutation() = refuses(replace = sectionBuilder(insertSkip = 10))

    @Test
    fun extensionMarkersDoNotDuplicateTheNativeDiscovery() {
        val context = PatchContexts.of(listOf(renderer(), callback(), sectionBuilder(),
            renderer("Lapp/hushgram/extension/instagram/metaai/Probe;")))
        assertEquals(SECTIONS, context.findOptionalInboxRow().type)
    }

    @Test
    fun guardVerificationRejectsMissingDuplicateWrongRegisterAndWrongCastMutants() {
        val context = PatchContexts.of(listOf(renderer(), callback(), sectionBuilder()))
        val site = context.findOptionalInboxRow()
        context.holdOptionalInboxRow(site)
        val code = context.method(site).code()
        val at = site.read + 1
        val reference = (code[at] as ReferenceInstruction).reference as MethodReference
        val wrongRegister = code.toMutableList().also { it[at] = ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 2, 1, reference) }
        val wrongCast = code.toMutableList().also { it[at + 2] = ImmutableInstruction21c(Opcode.CHECK_CAST, 1, ImmutableTypeReference(ORDINARY)) }
        for (mutant in listOf(code.take(at) + code.drop(at + 3), code.take(at) + code.subList(at, at + 3) + code.drop(at), wrongRegister, wrongCast)) {
            assertThrows(AssertionError::class.java) { assertGuard(method(SECTIONS, "build", PARAMETERS, "Z", 8, mutant), site) }
        }
    }

    @Test
    fun bodyVerificationRejectsChangingTheOrdinaryListBuilderAfterInjection() {
        val classes = listOf(renderer(), callback(), sectionBuilder(), factory())
        val context = PatchContexts.of(classes)
        val site = context.findOptionalInboxRow()
        context.holdOptionalInboxRow(site)
        val patched = context.method(site)
        val code = patched.code().toMutableList()
        code[14] = ImmutableInstruction10x(Opcode.NOP)
        val original = classes.single { it.type == site.type }.methods.single { it.name == site.name }
        assertThrows(AssertionError::class.java) { assertNativeBody(original, method(SECTIONS, "build", PARAMETERS, "Z", 8, code), site) }
    }

    /** Every retained native branch and ordinary sibling must survive, including row registration. */
    @Test
    fun eachDeclaredBuildUsesOnlyItsNativeOptionalInboxRow() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
            val holders = mutableListOf<ClassDef>()
            FixtureDex.forEach(bundle) { dex -> for (owner in dex.classes) {
                if (owner.methods.any { method -> method.code().any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string in
                        listOf(INBOX_ROW_RENDER_MARKER, INBOX_ROW_ITEM_MARKER, INBOX_SECTION_MARKER)
                } }) holders += ImmutableClassDef.of(owner)
            } }
            val context = PatchContexts.of(holders)
            val site = context.findOptionalInboxRow()
            // Include native factories that register the model without retained source strings.
            FixtureDex.forEach(bundle) { dex -> for (owner in dex.classes) {
                if (holders.none { it.type == owner.type } && owner.methods.any { method -> method.code().any {
                    it.opcode == Opcode.CONST_CLASS && it.referenceText() == site.model
                } }) holders += ImmutableClassDef.of(owner)
            } }
            val fullContext = PatchContexts.of(holders)
            val fullSite = fullContext.findOptionalInboxRow()
            fullContext.holdOptionalInboxRow(fullSite)
            assertGuard(fullContext.method(fullSite), fullSite)
            assertNativeMethods(holders, fullContext, fullSite)
            checked++
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    private fun refuses(extra: ClassDef? = null, replace: ClassDef? = null) {
        val classes = listOf(renderer(), callback(), sectionBuilder(), factory()).map { if (it.type == replace?.type) replace else it } + listOfNotNull(extra)
        val context = PatchContexts.of(classes)
        assertThrows(PatchException::class.java) { context.findOptionalInboxRow() }
        for (owner in classes) for (method in owner.methods) {
            val patched = context.mutableClassDefBy(owner.type).methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes }
            assertEquals("discovery changed ${method.name}", method.code().map { it.key() }, patched.code().map { it.key() })
        }
    }

    private fun assertGuard(method: Method, site: InboxRowSite) {
        val code = method.code()
        val at = site.read + 1
        assertEquals(1, code.count { it.referenceText() == INBOX_ROW })
        assertEquals(Opcode.IGET_OBJECT, code[site.read].opcode)
        assertEquals(site.model, ((code[site.read] as ReferenceInstruction).reference as FieldReference).type)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
        assertEquals(INBOX_ROW, code[at].referenceText())
        assertEquals(site.register, (code[at] as RegisterRangeInstruction).startRegister)
        assertEquals(1, (code[at] as RegisterRangeInstruction).registerCount)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at + 1].opcode)
        assertEquals(site.register, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.CHECK_CAST, code[at + 2].opcode)
        assertEquals(site.register, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(site.model, code[at + 2].referenceText())
        assertEquals(Opcode.IF_EQZ, code[at + 3].opcode)
        assertEquals(site.register, (code[at + 3] as OneRegisterInstruction).registerA)
    }

    private fun assertNativeMethods(classes: List<ClassDef>, context: BytecodePatchContext, site: InboxRowSite) {
        for (owner in classes) {
            val patchedOwner = context.mutableClassDefBy(owner.type)
            assertEquals(owner.methods.count(), patchedOwner.methods.size)
            for (original in owner.methods) {
                val patched = patchedOwner.methods.single { it.name == original.name && it.parameterTypes == original.parameterTypes && it.returnType == original.returnType }
                if (owner.type == site.type && original.name == site.name && original.parameterTypes.map(CharSequence::toString) == site.parameters) {
                    assertNativeBody(original, patched, site)
                } else {
                    assertEquals("ordinary sibling ${original.name}", original.code().map { it.key() }, patched.code().map { it.key() })
                }
            }
        }
    }

    private fun assertNativeBody(original: Method, patched: Method, site: InboxRowSite) {
        val before = original.code()
        val after = patched.code()
        val at = site.read + 1
        val native = after.take(at) + after.drop(at + 3)
        assertEquals("native register frame", original.implementation!!.registerCount, patched.implementation!!.registerCount)
        assertEquals("all native operations and their data", before.map { it.key(offset = false) }, native.map { it.key(offset = false) })
        for (index in before.indices) if (before[index] is OffsetInstruction) {
            val patchedIndex = if (index < at) index else index + 3
            val target = after.target(patchedIndex)
            assertTrue("native branch enters the injected guard", target !in at until at + 3)
            val nativeTarget = if (target < at) target else target - 3
            assertEquals("native branch $index", before.target(index), nativeTarget)
        }
    }

    private companion object {
        const val MODEL = "Lfixture/HatchRow;"
        const val ORDINARY = "Lfixture/OrdinaryRow;"
        const val RENDER = "Lfixture/HatchRenderer;"
        const val ITEM = "Lfixture/HatchItem;"
        const val SECTIONS = "Lfixture/Sections;"
        val PARAMETERS = listOf("Lfixture/State;", "Ljava/util/List;", "Lfixture/Context;", "Lfixture/Layout;")

        fun renderer(type: String = RENDER): ClassDef = clazz(type, listOf(method(type, "render", listOf("Lfixture/Compose;", "Lfixture/Modifier;", "Lfixture/Callback;", MODEL, "I", "I"), "V", 6,
            listOf(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(INBOX_ROW_RENDER_MARKER)), ImmutableInstruction10x(Opcode.RETURN_VOID)))))

        fun callback(type: String = ITEM, cast: String = MODEL, render: String = RENDER, castRegister: Int = 3): ClassDef = clazz(type, listOf(method(type, "renderItem", listOf("Ljava/lang/Object;"), "V", 6, listOf(
            ImmutableInstruction21c(Opcode.CHECK_CAST, castRegister, ImmutableTypeReference(cast)),
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(INBOX_ROW_ITEM_MARKER)),
            ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 6, ImmutableMethodReference(render, "render", listOf("Lfixture/Compose;", "Lfixture/Modifier;", "Lfixture/Callback;", MODEL, "I", "I"), "V")),
            ImmutableInstruction10x(Opcode.RETURN_VOID)))))

        fun sectionBuilder(type: String = SECTIONS, marker: String = INBOX_SECTION_MARKER, model: String = MODEL,
                           nullRegister: Int = 1, eligibilityReceiver: Int = 1, eligibilityTest: Int = 2,
                           acceptTarget: Int = 3, rejectTarget: Int = 2, clearRegister: Int = 1, zero: Int = 0,
                           insertTest: Int = 1, insertSkip: Int = 11, entryTarget: Int = 4): ClassDef {
            val code = mutableListOf<Instruction>(
                ImmutableInstruction11n(Opcode.CONST_4, 0, zero),
                ImmutableInstruction10t(Opcode.GOTO, 0),
                ImmutableInstruction12x(Opcode.MOVE_OBJECT, clearRegister, 0),
                ImmutableInstruction10t(Opcode.GOTO, 0),
                ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 4, ImmutableFieldReference("Lfixture/State;", "hatch", model)),
                ImmutableInstruction21t(Opcode.IF_EQZ, nullRegister, 0),
                ImmutableInstruction22c(Opcode.IGET_BOOLEAN, 2, eligibilityReceiver, ImmutableFieldReference(MODEL, "eligible", "Z")),
                ImmutableInstruction21t(Opcode.IF_NEZ, eligibilityTest, 0),
                ImmutableInstruction10t(Opcode.GOTO, 0),
                ImmutableInstruction21t(Opcode.IF_EQZ, insertTest, 0),
                call(Opcode.INVOKE_VIRTUAL, listOf(3, 1), "Ljava/util/AbstractCollection;", "add", listOf("Ljava/lang/Object;"), "Z"),
                call(Opcode.INVOKE_VIRTUAL, listOf(3, 5), "Ljava/util/AbstractCollection;", "addAll", listOf("Ljava/util/Collection;"), "Z"),
                ImmutableInstruction11n(Opcode.CONST_4, 2, 1),
                ImmutableInstruction11x(Opcode.RETURN, 2),
            )
            for ((from, to) in listOf(1 to entryTarget, 3 to 9, 8 to rejectTarget)) code[from] = ImmutableInstruction10t(Opcode.GOTO, offset(code, from, to))
            code[5] = ImmutableInstruction21t(Opcode.IF_EQZ, nullRegister, offset(code, 5, 2))
            code[7] = ImmutableInstruction21t(Opcode.IF_NEZ, eligibilityTest, offset(code, 7, acceptTarget))
            code[9] = ImmutableInstruction21t(Opcode.IF_EQZ, insertTest, offset(code, 9, insertSkip))
            return clazz(type, listOf(method(type, "build", PARAMETERS, "Z", 8, code), method(type, "requireSection", emptyList(), "V", 1,
                listOf(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(marker)), ImmutableInstruction10x(Opcode.RETURN_VOID)))))
        }

        fun factory(): ClassDef = clazz("Lfixture/InboxFactory;", listOf(method("Lfixture/InboxFactory;", "register", emptyList(), "V", 2, listOf(
            ImmutableInstruction21c(Opcode.CONST_CLASS, 0, ImmutableTypeReference(MODEL)),
            call(Opcode.INVOKE_STATIC, listOf(0), "Lfixture/Registry;", "register", listOf("Ljava/lang/Class;"), "V"),
            ImmutableInstruction21c(Opcode.CONST_CLASS, 0, ImmutableTypeReference(ORDINARY)),
            call(Opcode.INVOKE_STATIC, listOf(0), "Lfixture/Registry;", "register", listOf("Ljava/lang/Class;"), "V"),
            ImmutableInstruction10x(Opcode.RETURN_VOID)))))

        fun BytecodePatchContext.method(site: InboxRowSite): Method = mutableClassDefBy(site.type).methods.single { it.name == site.name && it.parameterTypes.map(CharSequence::toString) == site.parameters }
        fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
        fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()
        fun Instruction.key(offset: Boolean = true): List<Any?> = listOf(opcode, codeUnits,
            (this as? OneRegisterInstruction)?.registerA, (this as? TwoRegisterInstruction)?.registerB,
            (this as? ThreeRegisterInstruction)?.registerC, (this as? FiveRegisterInstruction)?.let { listOf(it.registerCount, it.registerC, it.registerD, it.registerE, it.registerF, it.registerG) },
            (this as? RegisterRangeInstruction)?.let { listOf(it.startRegister, it.registerCount) },
            (this as? WideLiteralInstruction)?.wideLiteral, if (offset) (this as? OffsetInstruction)?.codeOffset else null,
            (this as? SwitchPayload)?.switchElements?.map { listOf(it.key, it.offset) },
            (this as? ArrayPayload)?.let { listOf(it.elementWidth, it.arrayElements.map { number -> number.toLong() }) }, referenceText())
        fun List<Instruction>.target(index: Int): Int {
            val address = take(index).sumOf { it.codeUnits } + (this[index] as OffsetInstruction).codeOffset
            var current = 0
            for (candidate in indices) {
                if (current == address) return candidate
                current += this[candidate].codeUnits
            }
            throw AssertionError("branch $index has no instruction target")
        }
        fun offset(code: List<Instruction>, from: Int, to: Int): Int = code.take(to).sumOf { it.codeUnits } - code.take(from).sumOf { it.codeUnits }
        fun call(opcode: Opcode, registers: List<Int>, owner: String, name: String, parameters: List<String>, returns: String): Instruction {
            val r = registers + List(5 - registers.size) { 0 }
            return ImmutableInstruction35c(opcode, registers.size, r[0], r[1], r[2], r[3], r[4], ImmutableMethodReference(owner, name, parameters, returns))
        }
        fun clazz(type: String, methods: List<Method>): ClassDef = ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, methods)
        fun method(type: String, name: String, parameters: List<String>, returns: String, registers: Int, code: List<Instruction>): Method = ImmutableMethod(type, name,
            parameters.map { ImmutableMethodParameter(it, null, null) }, returns, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(registers, code, null, null))
    }
}
