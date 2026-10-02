/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.share

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class HideRepostButtonHookTest {
    @Test
    fun theHooksAreInTheExtension() {
        for (hook in listOf(HIDE_REPOSTS, REPOSTS_ELIGIBLE)) {
            val declared = ExtensionDex.classDef(hook.substringBefore("->")).methods
                .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
                .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
            assertTrue("$hook is not in the extension: $declared", hook.substringAfter("->") in declared)
        }
    }

    /** The field's hash is the hash of its name, the key Instagram's data trees use. */
    @Test
    fun theHashIsTheFieldNames() {
        assertEquals(-0x207dadd2, REPOSTS_HASH)
    }

    /**
     * The model's getter answers FALSE first on a yes, both tree reads of the field are filtered
     * right after their answer, a read of another field is left alone, and so is the model's own
     * copy of the field.
     */
    @Test
    fun theGetterAndEveryTreeReadAreHooked() {
        val context = PatchContexts.of(classes())

        val sites = context.findRepostSites()
        assertEquals("A3o", sites.getter)
        assertEquals(listOf(2 to 2, 6 to 3), sites.reads.map { it.at to it.register })
        assertTrue(sites.reads.all { it.type == READER })
        context.guardRepostGetter(sites.getter)
        sites.reads.groupBy { Triple(it.type, it.name, it.parameters) }.values.forEach { context.filterRepostReads(it) }

        assertGetterGuarded("stand-in", context.mutableClassDefBy(MEDIA).methods.single { it.name == "A3o" })
        val reader = context.mutableClassDefBy(READER).methods.single()
        // The first read's filter moves the second's answer from 6 to 8.
        assertReadsFiltered("stand-in", reader, listOf(2, 8))
        val copy = context.mutableClassDefBy(MEDIA).methods.single { it.name == "A06" }
        assertEquals(0, copy.implementation!!.instructions.count { it.names(REPOSTS_ELIGIBLE) })
    }

    @Test
    fun aSecondGetterFailsThePatch() {
        val context = PatchContexts.of(classes(secondGetter = true))
        assertThrows(PatchException::class.java) { context.findRepostSites() }
    }

    /** Without the field's name, the getter could be any Boolean the model keys by that number. */
    @Test
    fun aGetterWithoutTheFieldsNameFailsThePatch() {
        val context = PatchContexts.of(classes(getterString = false))
        assertThrows(PatchException::class.java) { context.findRepostSites() }
    }

    @Test
    fun aGetterWithNoRegisterToSpareFailsThePatch() {
        val context = PatchContexts.of(classes(getterRegisters = 1))
        assertThrows(PatchException::class.java) { context.findRepostSites() }
    }

    /** A read whose answer isn't moved out straight away is a shape the filter can't follow. */
    @Test
    fun aReadDroppingItsAnswerFailsThePatch() {
        val context = PatchContexts.of(classes(dropsAnswer = true))
        assertThrows(PatchException::class.java) { context.findRepostSites() }
    }

    @Test
    fun noTreeReadFailsThePatch() {
        val context = PatchContexts.of(classes().filter { it.type != READER })
        assertThrows(PatchException::class.java) { context.findRepostSites() }
    }

    @Test
    fun noModelFailsThePatch() {
        val context = PatchContexts.of(classes().filter { it.type != MEDIA })
        assertThrows(PatchException::class.java) { context.findRepostSites() }
    }

    /**
     * In each declared build the model's getter is guarded and every tree read of the field is
     * filtered. On 449 that's Media.A3o and six reads: the feed's UFI state, the repost and clips
     * button use cases, the repost action and one more button state.
     */
    @Test
    fun eachDeclaredBuildHidesTheButton() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val holders = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.type == MEDIA || classDef.methods.any { it.loadsHash() }) holders += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(holders.distinctBy { it.type })

                val sites = context.findRepostSites()
                assertEquals("${bundle.name}: tree reads ${sites.reads.map { "${it.type}->${it.name}" }}", 6, sites.reads.size)
                context.guardRepostGetter(sites.getter)
                val byMethod = sites.reads.groupBy { Triple(it.type, it.name, it.parameters) }
                byMethod.values.forEach { context.filterRepostReads(it) }

                assertGetterGuarded("${bundle.name} ${sites.getter}", context.mutableClassDefBy(MEDIA).methods.single {
                    it.name == sites.getter && it.parameterTypes.isEmpty()
                })
                for ((key, reads) in byMethod) {
                    val method = context.mutableClassDefBy(key.first).methods.single {
                        it.name == key.second && it.parameterTypes.map(CharSequence::toString) == key.third
                    }
                    // Each earlier read's filter moves the later ones down by two.
                    val shifted = reads.sortedBy { it.at }.mapIndexed { i, read -> read.at + 2 * i }
                    assertReadsFiltered("${bundle.name} ${key.first}->${key.second}", method, shifted)
                }
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    /** The getter opens with the extension call and its test, then on a yes answers FALSE; one call in all. */
    private fun assertGetterGuarded(what: String, method: Method) {
        val code = method.implementation!!.instructions.toList()
        assertEquals("$what: hooks", 1, code.count { it.names(HIDE_REPOSTS) })
        assertEquals("$what: the call", HIDE_REPOSTS, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals("$what: the answer", Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals("$what: the test", Opcode.IF_EQZ, code[2].opcode)
        assertEquals("$what: FALSE", "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", (code[3] as ReferenceInstruction).reference.toString())
        assertEquals("$what: the early return", Opcode.RETURN_OBJECT, code[4].opcode)
    }

    /** At each index a read's answer is moved out, then passed through the filter and moved back into the same register. */
    private fun assertReadsFiltered(what: String, method: Method, answers: List<Int>) {
        val code = method.implementation!!.instructions.toList()
        assertEquals("$what: filters", answers.size, code.count { it.names(REPOSTS_ELIGIBLE) })
        for (at in answers) {
            assertEquals("$what: the answer at $at", Opcode.MOVE_RESULT_OBJECT, code[at].opcode)
            val register = (code[at] as OneRegisterInstruction).registerA
            val filter = code[at + 1]
            assertTrue("$what: the filter at ${at + 1}", filter.names(REPOSTS_ELIGIBLE))
            assertEquals("$what: the filter's register at ${at + 1}", register, (filter as RegisterRangeInstruction).startRegister)
            assertEquals("$what: back at ${at + 2}", Opcode.MOVE_RESULT_OBJECT, code[at + 2].opcode)
            assertEquals("$what: into the same register at ${at + 2}", register, (code[at + 2] as OneRegisterInstruction).registerA)
        }
    }

    private fun Instruction.names(reference: String) = (this as? ReferenceInstruction)?.reference?.toString() == reference

    private fun Method.loadsHash() = implementation?.instructions?.any {
        it is NarrowLiteralInstruction && it.opcode == Opcode.CONST && it.narrowLiteral == REPOSTS_HASH
    } == true

    private companion object {
        const val READER = "Lfixture/RepostButtonUseCase;"
        val TREE_READ = ImmutableMethodReference("Lfixture/Tree;", "Crf", listOf("I"), "Ljava/lang/Boolean;")

        fun treeRead(answer: Int, hash: Int = REPOSTS_HASH, dropsAnswer: Boolean = false) = listOf(
            ImmutableInstruction31i(Opcode.CONST, 0, hash),
            ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 1, 0, 0, 0, 0, TREE_READ),
            if (dropsAnswer) ImmutableInstruction10x(Opcode.NOP) else ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, answer),
        )

        fun method(type: String, name: String, returnType: String, registers: Int, code: List<Instruction>, static: Boolean = false) =
            ImmutableMethod(
                type, name, emptyList(), returnType,
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
                null, null, ImmutableMethodImplementation(registers, code, null, null),
            )

        fun classOf(type: String, methods: List<ImmutableMethod>) = ImmutableClassDef(
            type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
            null, null, null, null, methods,
        )

        /**
         * The model with its getter (the field's name, its hash, then null) and a copy that reads the
         * field the way a button does, and a button use case reading the field twice and another
         * field once:
         *
         *     0 const v0, hash | 1 invoke-interface {v1, v0} | 2 move-result-object v2
         *     3 const v0, hash | 4 nop | 5 invoke-interface {v1, v0} | 6 move-result-object v3
         *     7 const v0, other | 8 invoke-interface {v1, v0} | 9 move-result-object v4
         *     10 return-object v2
         */
        fun classes(
            secondGetter: Boolean = false,
            getterString: Boolean = true,
            getterRegisters: Int = 4,
            dropsAnswer: Boolean = false,
        ): List<ClassDef> {
            fun getter(name: String) = method(
                MEDIA, name, "Ljava/lang/Boolean;", getterRegisters,
                listOfNotNull(
                    if (getterString) ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(REPOSTS_FIELD)) else null,
                    ImmutableInstruction31i(Opcode.CONST, 0, REPOSTS_HASH),
                    ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                    ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                ),
            )
            val copy = method(MEDIA, "A06", "V", 5, treeRead(2) + ImmutableInstruction10x(Opcode.RETURN_VOID))
            val media = classOf(MEDIA, listOfNotNull(getter("A3o"), if (secondGetter) getter("A3p") else null, copy))

            val second = treeRead(3, dropsAnswer = dropsAnswer).toMutableList().apply { add(1, ImmutableInstruction10x(Opcode.NOP)) }
            val reader = classOf(
                READER,
                listOf(
                    method(
                        READER, "invoke", "Ljava/lang/Object;", 6,
                        treeRead(2) + second + treeRead(4, hash = 0x1234) + ImmutableInstruction11x(Opcode.RETURN_OBJECT, 2),
                    ),
                ),
            )
            return listOf(media, reader)
        }
    }
}
