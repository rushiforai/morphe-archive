/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.swipesearch

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.util.argumentRegister
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Disable swipe to Search on each declared build: the constructor of the home screen's state asks
 * the extension for the swipe flag first thing, before it stores the flag the home screen's pager
 * check reads. Anything that would make the hook miss the flag, or the flag miss the check, is
 * refused before the constructor changes.
 */
class DisableSwipeToSearchFixtureTest {
    @Test
    fun `each declared build asks the extension whether the feed swipes into Search`() {
        val extension = ExtensionDex.classDef(SWIPE_TO_SEARCH).methods.single { it.name == "allow" }
        assertTrue(AccessFlags.STATIC.isSet(extension.accessFlags) && AccessFlags.PUBLIC.isSet(extension.accessFlags))
        assertEquals("Z", extension.parameterTypes.joinToString(""))
        assertEquals("Z", extension.returnType)

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            // Read apart from the patch: one method holds the note, and in it one if-eqz on a
            // boolean field skips a page read on the way to an array of two pages.
            val holders = screens(build).flatMap { it.methods }.filter { method -> method.body().any { it.isTabsNote() } }
            assertEquals("$where: methods holding the note", 1, holders.size)
            val screen = holders.single()
            val code = screen.body()
            val checks = pagerChecks(code)
            assertEquals("$where: pager checks", 1, checks.size)
            val (guard, array) = checks.single()
            val flag = code[guard - 1].getReference<FieldReference>()!!
            val page = code[guard + 1].getReference<FieldReference>()!!
            assertEquals(where, Opcode.FILLED_NEW_ARRAY, code[array].opcode)
            val extra = FixtureDex.classes(build, setOf(flag.definingClass, page.type))
            // The page the check skips is the enum constant named SEARCH.
            val pageInit = extra.getValue(page.type).methods.single { it.name == "<clinit>" }.body()
            val pageStore = pageInit.indexOfFirst { it.opcode == Opcode.SPUT_OBJECT && it.getReference<FieldReference>()?.name == page.name }
            val pageName = (pageStore downTo 0).first { pageInit[it].opcode == Opcode.CONST_STRING }
            assertEquals(where, SEARCH_PAGE, pageInit[pageName].getReference<StringReference>()!!.string)
            // One constructor of the state stores the flag, from a boolean parameter.
            val stores = extra.getValue(flag.definingClass).methods.flatMap { method ->
                method.body().indices.filter { method.body()[it].getReference<FieldReference>()?.name == flag.name &&
                    method.body()[it].opcode == Opcode.IPUT_BOOLEAN }.map { method to it }
            }
            assertEquals("$where: stores of the flag", 1, stores.size)
            val (stock, store) = stores.single()
            assertEquals(where, "<init>", stock.name)
            val register = (stock.body()[store] as TwoRegisterInstruction).registerA
            val parameter = stock.parameterTypes.indices.single { stock.parameterRegisterNumber(it) == register }
            assertEquals("$where: the flag", "Z", stock.parameterTypes[parameter].toString())
            // The second of its two booleans, last of its seven parameters.
            assertEquals(where, 6, parameter)

            val context = context(build)
            assertEquals(where, 0, status(context))
            val found = context.swipePage()
            assertEquals(where, screen.signature(), found.screen.signature())
            assertEquals(where, guard, found.guard)
            assertEquals(where, "${flag.definingClass}->${flag.name}:${flag.type}",
                "${found.flag.definingClass}->${found.flag.name}:${found.flag.type}")
            assertEquals(where, stock.signature(), found.constructor.signature())
            assertEquals(where, parameter, found.parameter)
            assertEquals(where, store, found.store)
            disableSwipeToSearchPatch.execute(context)

            val patched = context.mutableClassDefBy(flag.definingClass).methods.single { it.signature() == stock.signature() }
            val body = patched.body()
            val stockBody = stock.body()
            assertEquals(where, stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(where, stockBody.size + 2, body.size)
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
            assertEquals(where, ALLOW, body[0].getReference<MethodReference>().toString())
            assertEquals(where, register, (body[0] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, (body[0] as RegisterRangeInstruction).registerCount)
            // The answer goes back in the flag's own register, and the store writes it.
            assertEquals(where, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals(where, register, (body[1] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.map { it.opcode }, body.drop(2).map { it.opcode })
            assertEquals(where, register, (body[store + 2] as TwoRegisterInstruction).registerA)
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a flag the constructor works out itself is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val page = context.swipePage()
            page.constructor.addInstructions(page.store, "const/4 ${page.constructor.parameterRegister(page.parameter)}, 0x1")
            val error = assertThrows(build.name, PatchException::class.java) { disableSwipeToSearchPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("something it worked out"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, page.constructor.body().any { it.calls(ALLOW) })
        }
    }

    @Test
    fun `a second write of the flag is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val page = context.swipePage()
            val flag = "${page.flag.definingClass}->${page.flag.name}:${page.flag.type}"
            page.constructor.addInstructions(page.store + 1,
                "iput-boolean ${page.constructor.parameterRegister(page.parameter)}, p0, $flag")
            val error = assertThrows(build.name, PatchException::class.java) { disableSwipeToSearchPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `pages that aren't FEED and SEARCH are refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val page = context.swipePage()
            val search = page.screen.body()[page.guard + 1].getReference<FieldReference>()!!
            val init = context.mutableClassDefBy(search.type).methods.single { it.name == "<clinit>" }
            val code = init.body()
            val store = code.indexOfFirst { it.opcode == Opcode.SPUT_OBJECT && it.getReference<FieldReference>()?.name == search.name }
            val name = (code[(store downTo 0).first { code[it].opcode == Opcode.CONST_STRING }] as OneRegisterInstruction).registerA
            // The name's register is done with by the time the constant is stored.
            init.addInstructions(store, "const-string v$name, \"EXPLORE\"")
            val error = assertThrows(build.name, PatchException::class.java) { disableSwipeToSearchPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not an enum of $FEED_PAGE and $SEARCH_PAGE"))
            assertEquals(build.name, 0, status(context))
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.calls(method: String) = getReference<MethodReference>()?.toString() == method

    private fun context(build: File): BytecodePatchContext {
        val screens = screens(build)
        val screen = screens.flatMap { it.methods }.single { method -> method.body().any { it.isTabsNote() } }
        val code = screen.body()
        // The state and the page enum, read off the screen's pager check.
        val types = pagerChecks(code).flatMap { (guard, _) ->
            listOf(code[guard - 1].getReference<FieldReference>()!!.definingClass, code[guard + 1].getReference<FieldReference>()!!.type)
        }.toSet()
        return PatchContexts.of(ExtensionDex.classes() + screens + FixtureDex.classes(build, types).values)
    }

    /**
     * The shape of the home pager's check: a boolean field read, an if-eqz on it, the Search page
     * read, and the array of pages the two paths meet at. 452 falls straight into the array; 453
     * loads null on the branch and jumps back to it.
     */
    private fun pagerChecks(code: List<Instruction>): List<Pair<Int, Int>> =
        (1 until code.size - 1).filter { at ->
            code[at].opcode == Opcode.IF_EQZ && code[at - 1].opcode == Opcode.IGET_BOOLEAN &&
                code[at + 1].opcode == Opcode.SGET_OBJECT
        }.mapNotNull { at ->
            val search = (code[at + 1] as OneRegisterInstruction).registerA
            val array = code.indices.firstOrNull { index ->
                index > at + 1 && code[index].opcode == Opcode.FILLED_NEW_ARRAY &&
                    code[index].getReference<TypeReference>()?.type?.startsWith("[") == true &&
                    (code[index] as FiveRegisterInstruction).let { pages ->
                        (0 until pages.registerCount).any { pages.argumentRegister(it) == search }
                    }
            } ?: return@mapNotNull null
            at to array
        }

    private fun screens(build: File): List<ClassDef> = fixtures.getOrPut(build) {
        FixtureDex.classesWhere(build, { dex -> dex.stringSection.any { it.startsWith(TABS_NOTE) } }) { method ->
            method.implementation?.instructions?.any { it.isTabsNote() } == true
        }
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "disableSwipeToSearch" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<List<ClassDef>>()
    }
}
