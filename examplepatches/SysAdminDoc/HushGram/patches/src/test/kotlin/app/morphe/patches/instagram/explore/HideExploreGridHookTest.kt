/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.explore

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
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class HideExploreGridHookTest {
    /** The hook the patch writes is in the ExploreGrid the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(HIDE_GRID.substringBefore("->")).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$HIDE_GRID is not in the extension: $declared", HIDE_GRID.substringAfter("->") in declared)
    }

    @Test
    fun theParserIsFoundWithItsPageFields() {
        val context = PatchContexts.of(listOf(parser()))

        val found = context.findExploreParser()

        assertEquals(PARSER, found.type)
        assertEquals(PAGE, found.page)
        assertEquals(3, found.register)
        assertEquals("A06", found.sections.name)
        assertEquals("A09", found.moreAvailable.name)
        assertEquals("A0A", found.autoLoadMore.name)
    }

    /** On the way out, the page goes past the extension, and a yes empties it and turns off its "more" flags. */
    @Test
    fun thePageIsEmptiedOnTheWayOut() {
        val context = PatchContexts.of(listOf(parser()))

        context.emptyExplorePages(context.findExploreParser())

        assertEmptiedBeforeReturn("stand-in", context.mutableClassDefBy(PARSER).methods.single { it.name == "unsafeParseFromJson" })
    }

    /** The parser's loop jumps straight to its return, and that jump goes through the hook too. */
    @Test
    fun aBranchToTheReturnGoesThroughTheHook() {
        val context = PatchContexts.of(listOf(parser()))

        context.emptyExplorePages(context.findExploreParser())

        val code = context.mutableClassDefBy(PARSER).methods.single { it.name == "unsafeParseFromJson" }
            .implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val branch = code.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        val target = addresses.indexOf(addresses[branch] + (code[branch] as OffsetInstruction).codeOffset)
        assertEquals(Opcode.IGET_OBJECT, code[target].opcode)
        assertEquals(Opcode.INVOKE_STATIC, code[target + 1].opcode)
        assertEquals(HIDE_GRID, (code[target + 1] as ReferenceInstruction).reference.toString())
    }

    @Test
    fun noParserFailsThePatch() {
        val context = PatchContexts.of(listOf(parser(pagingToken = "next_max_id")))
        assertThrows(PatchException::class.java) { context.findExploreParser() }
    }

    @Test
    fun twoParsersFailThePatch() {
        val context = PatchContexts.of(listOf(parser(), parser(type = "Lfixture/OtherExploreParser;")))
        assertThrows(PatchException::class.java) { context.findExploreParser() }
    }

    /** A flag read into anything but a boolean on the page is an update the patch hasn't seen. */
    @Test
    fun aFlagReadIntoSomethingElseFailsThePatch() {
        val context = PatchContexts.of(listOf(parser(moreAvailableType = "I")))
        assertThrows(PatchException::class.java) { context.findExploreParser() }
    }

    @Test
    fun theExtensionIsLeftAlone() {
        val own = parser(type = "Lapp/hushgram/extension/instagram/explore/Probe;")
        val context = PatchContexts.of(listOf(own, parser()))

        assertEquals(PARSER, context.findExploreParser().type)
    }

    /**
     * In each declared build there's one topical Explore parser, its page fields are found, and after
     * the patch its return goes past the extension. On 449 that's LX/0AdL.
     */
    @Test
    fun eachDeclaredBuildEmptiesTheExplorePage() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val holders = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { it.holds(SECTIONS) }) holders += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(holders)

                val found = context.findExploreParser()
                context.emptyExplorePages(found)

                assertEquals("${bundle.name}: the page's sections", "Ljava/util/List;", found.sections.type)
                assertEmptiedBeforeReturn(
                    "${bundle.name} ${found.type}",
                    context.mutableClassDefBy(found.type).methods.single { it.name == "unsafeParseFromJson" },
                )
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    private fun Method.holds(string: String): Boolean = implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == string
    } == true

    /**
     * Right before the page's return: the sections are handed to the hook, and on a yes a new list
     * and two falses are written to the page.
     */
    private fun assertEmptiedBeforeReturn(what: String, method: Method) {
        val code = method.implementation!!.instructions.toList()
        val call = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == HIDE_GRID }
        assertTrue("$what never asks the extension", call > 0)
        assertEquals("$what: one hook", 1, code.count { (it as? ReferenceInstruction)?.reference?.toString() == HIDE_GRID })
        val ret = (call until code.size).first { code[it].opcode == Opcode.RETURN_OBJECT }
        val page = (code[ret] as OneRegisterInstruction).registerA
        val read = code[call - 1]
        assertEquals("$what: the sections are read", Opcode.IGET_OBJECT, read.opcode)
        assertEquals("$what: from the page", page, (read as TwoRegisterInstruction).registerB)
        val writes = code.subList(call, ret).filter { it.opcode == Opcode.IPUT_OBJECT || it.opcode == Opcode.IPUT_BOOLEAN }
        assertEquals(
            "$what: writes",
            listOf(Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN, Opcode.IPUT_BOOLEAN),
            writes.map { it.opcode },
        )
        assertTrue("$what: on the page", writes.all { (it as TwoRegisterInstruction).registerB == page })
        assertEquals(
            "$what: the new sections",
            "Ljava/util/ArrayList;",
            code.subList(call, ret).single { it.opcode == Opcode.NEW_INSTANCE }.let { (it as ReferenceInstruction).reference.toString() },
        )
        assertTrue("$what: the flags are falses", code.subList(call, ret).any { it.opcode == Opcode.CONST_4 })
        val fields = writes.map { ((it as ReferenceInstruction).reference as FieldReference).type }
        assertEquals("$what: field types", listOf("Ljava/util/List;", "Z", "Z"), fields)
    }

    private companion object {
        const val PARSER = "Lfixture/ExploreParser;"
        const val PAGE = "Lfixture/ExplorePage;"
        const val JSON = "Lfixture/JsonParser;"

        /**
         * Shaped like 449's: a new page, a branch to the return as the parser's loop has, then each
         * key followed by the write of its value into the page.
         */
        fun parser(
            type: String = PARSER,
            pagingToken: String = PAGING_TOKEN,
            moreAvailableType: String = "Z",
        ): ClassDef {
            fun string(key: String) = ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(key))
            fun put(opcode: Opcode, value: Int, name: String, fieldType: String) =
                ImmutableInstruction22c(opcode, value, 3, ImmutableFieldReference(PAGE, name, fieldType))
            val moreOpcode = if (moreAvailableType == "Z") Opcode.IPUT_BOOLEAN else Opcode.IPUT
            val code = listOf<Instruction>(
                ImmutableInstruction21c(Opcode.NEW_INSTANCE, 3, ImmutableTypeReference(PAGE)),
                ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 3, 0, 0, 0, 0, ImmutableMethodReference(PAGE, "<init>", emptyList(), "V")),
                ImmutableInstruction21t(Opcode.IF_EQZ, 5, 20),
                string("next_max_id"),
                put(Opcode.IPUT_OBJECT, 2, "A03", "Ljava/lang/String;"),
                string(SECTIONS),
                put(Opcode.IPUT_OBJECT, 2, "A06", "Ljava/util/List;"),
                string(MORE_AVAILABLE),
                put(moreOpcode, 1, "A09", moreAvailableType),
                string(AUTO_LOAD_MORE),
                put(Opcode.IPUT_BOOLEAN, 1, "A0A", "Z"),
                string(pagingToken),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 3),
            )
            return ImmutableClassDef(
                type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null, null,
                listOf(
                    ImmutableMethod(
                        type, "unsafeParseFromJson", listOf(ImmutableMethodParameter(JSON, null, null)), "Ljava/lang/Object;",
                        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
                        ImmutableMethodImplementation(6, code, null, null),
                    ),
                ),
            )
        }
    }
}
