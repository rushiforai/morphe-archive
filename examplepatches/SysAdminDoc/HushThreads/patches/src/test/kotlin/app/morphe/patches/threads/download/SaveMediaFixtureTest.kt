/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.download

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.settings.FUNCTION0
import app.morphe.patches.threads.misc.theme.holdsNote
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Save in a post's menu, on each declared build: the menu asks the extension for the row just after
 * it draws Copy link, the extension's stubs draw the row with Copy link's own calls, read the menu's
 * post and activity and close the menu the way Copy link's click does, and the media bridges are
 * written.
 */
class SaveMediaFixtureTest {
    @Test
    fun `the extension's row and stubs have the shapes the patch writes against`() {
        val row = ExtensionDex.classDef(SAVE_MEDIA_ROW)
        val add = row.methods.single { it.name == "add" }
        assertTrue(AccessFlags.STATIC.isSet(add.accessFlags) && AccessFlags.PUBLIC.isSet(add.accessFlags))
        assertEquals(ADD_SAVE_ROW, add.signature())
        val stubs = mapOf(
            "showRow" to "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)V",
            "media" to "(Ljava/lang/Object;)Ljava/lang/Object;",
            "activity" to "(Ljava/lang/Object;)Landroid/app/Activity;",
            "dismiss" to "(Ljava/lang/Object;)V",
        )
        for ((name, shape) in stubs) {
            val stub = row.methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(stub.accessFlags))
            assertEquals(name, "$SAVE_MEDIA_ROW->$name$shape", stub.signature())
        }
        val click = ExtensionDex.classDef(SAVE_MEDIA_CLICK)
        assertTrue(click.interfaces.isEmpty())
        val invoke = click.methods.single { it.name == "invoke" }
        assertTrue(AccessFlags.PUBLIC.isSet(invoke.accessFlags) && !AccessFlags.STATIC.isSet(invoke.accessFlags))
        assertEquals("Ljava/lang/Object;", invoke.returnType)
        assertTrue(invoke.parameterTypes.isEmpty())
    }

    @Test
    fun `each declared build asks for the row just after Copy link and the stubs draw it with Copy link's calls`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val expected = EXPECTED.entries.single { build.name.startsWith("threads-${it.key}-") }.value
            val fixture = fixture(build)
            assertEquals("$where: the menu lambda", expected.menu, fixture.menu.definingClass)
            val stock = fixture.menu.body()
            val rowAt = copyLinkRow(fixture.copyLink, stock)

            val context = context(fixture)
            saveMediaPatch.execute(context)

            // Copy link's own path gets a copy of the row call, the hook and a goto to where the row
            // call went on; the original call stays for any other item that branches to it.
            val patched = context.menu(fixture).body()
            assertTrue("$where: no alignment before the row", stock.subList(0, rowAt).none { it.opcode == Opcode.NOP })
            assertEquals("$where: three instructions added", stock.code().size + 3, patched.code().size)
            assertEquals("$where: no new registers", fixture.menu.implementation!!.registerCount,
                context.menu(fixture).implementation!!.registerCount)
            assertEquals("$where: the copied row call", stock[rowAt].opcode, patched[rowAt].opcode)
            assertEquals("$where: the copied row call", stock[rowAt].method().toString(), patched[rowAt].method().toString())
            assertEquals("$where: the copied row call's registers", stock[rowAt].registers(), patched[rowAt].registers())
            val hook = patched[rowAt + 1] as RegisterRangeInstruction
            assertEquals("$where: the hook", Opcode.INVOKE_STATIC_RANGE, patched[rowAt + 1].opcode)
            assertEquals(ADD_SAVE_ROW, patched[rowAt + 1].method().toString())
            val p0 = fixture.menu.implementation!!.registerCount - 1 - fixture.menu.parameterTypes.size
            assertEquals("$where: the lambda and its composer", p0, hook.startRegister)
            assertEquals(2, hook.registerCount)
            assertEquals("$where: Copy link's row call is still there", stock[rowAt].method().toString(), patched[rowAt + 3].method().toString())
            assertEquals("$where: the rest is the stock menu", stock.code().map { it.opcode },
                patched.filterIndexed { index, _ -> index !in rowAt..rowAt + 2 }.code().map { it.opcode })
            fun moved(index: Int) = if (index < rowAt) index else index + 3
            val expectedBranches = branches(stock).map { (from, to) -> moved(from) to moved(to) } + ((rowAt + 2) to (rowAt + 4))
            assertEquals("$where: every branch lands where it did, and the copy goes on past the row call",
                expectedBranches.sortedBy { it.first }, branches(patched).sortedBy { it.first })
            assertEquals("$where: one call in the menu", 1, patched.count { it.method()?.toString() == ADD_SAVE_ROW })

            // The row's stub makes calls Copy link's case makes, ending on Copy link's row.
            val caseCalls = stock.subList(stock.indexOfFirst { it.isCopyLinkCheck(fixture.copyLink) }, rowAt + 1)
                .mapNotNull { it.method()?.toString() }.toSet()
            val stub = context.stub("showRow")
            val calls = stub.filter { it.opcode == Opcode.INVOKE_STATIC_RANGE }.map { it.method().toString() }
            assertEquals("$where: role, click, style, icon and row", 5, calls.size)
            assertEquals("$where: Copy link's row", stock[rowAt].method().toString(), calls.last())
            assertTrue("$where: $calls in $caseCalls", caseCalls.containsAll(calls))
            assertEquals(Opcode.RETURN_VOID, stub.last().opcode)

            assertEquals("$where: the post", expected.media, context.stub("media").single { it.opcode == Opcode.IGET_OBJECT }.getReference<FieldReference>().toString())
            val activity = context.stub("activity").single { it.opcode == Opcode.IGET_OBJECT }.getReference<FieldReference>()!!
            assertEquals("$where: the activity", "Landroid/app/Activity;", activity.type)
            assertEquals("$where: the activity's owner", expected.menu, activity.definingClass)
            val dismiss = context.stub("dismiss")
            assertEquals("$where: the controller", expected.controller, dismiss.single { it.opcode == Opcode.IGET_OBJECT }.getReference<FieldReference>().toString())
            assertEquals("$where: how Copy link closes the menu", expected.dismiss, dismiss.single { it.opcode == Opcode.INVOKE_VIRTUAL }.method().toString())

            assertEquals("$where: the click is a Function0", listOf(FUNCTION0), context.mutableClassDefBy(SAVE_MEDIA_CLICK).interfaces.toList())
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "saveMedia" }.body()
            assertEquals("$where: the status answers true", 1, (status.first() as NarrowLiteralInstruction).narrowLiteral)
            val unwritten = context.mutableClassDefBy(INSTAGRAM_MEDIA).methods
                .filter { it.name in BRIDGES && it.body().first().opcode != Opcode.CHECK_CAST }.map { it.name }
            assertEquals("$where: every bridge is written", emptyList<String>(), unwritten)
        }
    }

    /**
     * Each way the menu could stop being what was read refuses the build: a second Copy link
     * check, a branch into its case, a composer that isn't the lambda's parameter, a
     * parameter the lambda overwrites, a click that no longer closes the menu, a second post field,
     * and a closing call the extension couldn't reach.
     */
    @Test
    fun `a post menu that differs from the one read is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val stock = fixture.menu.body()
            val rowAt = copyLinkRow(fixture.copyLink, stock)
            val composer = (stock[rowAt] as? RegisterRangeInstruction)?.startRegister
                ?: (stock[rowAt] as FiveRegisterInstruction).registerC
            val site = context(fixture).saveRowSite()
            val cases = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
                "checks for Copy link 2 times" to { context ->
                    context.menu(fixture).addInstructions(0, "instance-of v0, v0, ${fixture.copyLink}")
                },
                "branches into its Copy link case" to { context ->
                    val menu = context.menu(fixture)
                    menu.addInstructionsWithLabels(0, "if-eqz v0, :inside", ExternalLabel("inside", menu.getInstruction(rowAt - 1)))
                },
                "isn't passed the menu's composer parameter" to { context ->
                    context.menu(fixture).addInstructions(rowAt, "move-object/from16 v$composer, p0")
                },
                "overwrites its own parameters" to { context ->
                    context.menu(fixture).addInstructions(rowAt + 1, "const/16 p1, 0x0")
                },
                "closes the menu with" to { context ->
                    val invoke = context.mutableClassDefBy(fixture.click).methods.single { it.name == "invoke" && it.parameterTypes.isEmpty() }
                    invoke.body().indices.filter { invoke.body()[it].method()?.toString() == site.dismiss.toString() }
                        .forEach { invoke.replaceInstruction(it, "nop") }
                },
                "the post menu's post" to { context ->
                    context.mutableClassDefBy(fixture.menu.definingClass).fields.add(MutableField(ImmutableField(
                        fixture.menu.definingClass, "copyOfPost", MEDIA, AccessFlags.PUBLIC.value, null, null, null,
                    )))
                },
                "isn't public" to { context ->
                    context.mutableClassDefBy(site.dismiss.definingClass).methods
                        .single { it.name == site.dismiss.name && it.parameterTypes.isEmpty() && it.returnType == "V" }
                        .accessFlags = AccessFlags.PRIVATE.value
                },
            )
            for ((expected, mutate) in cases) {
                val context = context(fixture)
                mutate(context)
                val error = assertThrows("${build.name}: $expected", PatchException::class.java) { context.saveRowSite() }
                    .message.orEmpty()
                assertTrue("${build.name}: $error", error.contains(expected))
            }
        }
    }

    /** Read apart from the patch: the first row call after the menu's Copy link check. */
    private fun copyLinkRow(copyLink: String, body: List<Instruction>): Int {
        val check = body.indexOfFirst { it.isCopyLinkCheck(copyLink) }
        return (check until body.size).first { at ->
            body[at].opcode.let { it == Opcode.INVOKE_STATIC || it == Opcode.INVOKE_STATIC_RANGE } &&
                body[at].method()?.let { it.returnType == "V" && it.parameterTypes.size == 5 && it.parameterTypes[4].toString() == "Ljava/lang/String;" } == true
        }
    }

    private fun Instruction.isCopyLinkCheck(copyLink: String) =
        opcode == Opcode.INSTANCE_OF && getReference<TypeReference>()?.type == copyLink

    private data class Expected(val menu: String, val media: String, val controller: String, val dismiss: String)

    private data class Fixture(val classes: Collection<ClassDef>, val menu: Method, val copyLink: String, val click: String)

    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            method.holdsNote(MENU_NOTE) ||
                method.name == "toString" && method.body().any { it.getReference<StringReference>()?.string == COPY_LINK }
        }
        val copyLink = found.single { classDef ->
            classDef.methods.any { m -> m.name == "toString" && m.body().any { it.getReference<StringReference>()?.string == COPY_LINK } }
        }.type
        val menu = found.flatMap { it.methods }.single { method ->
            method.holdsNote(MENU_NOTE) && method.body().any { it.opcode == Opcode.INSTANCE_OF && it.getReference<TypeReference>()?.type == copyLink }
        }
        val read = FixtureDex.classes(build, menu.body().flatMap { it.types() }.toSet() + FUNCTION0 + MODEL)
        // Copy link's click is the first object its case makes.
        val check = menu.body().indexOfFirst { it.isCopyLinkCheck(copyLink) }
        val click = menu.body().drop(check).first { it.opcode == Opcode.NEW_INSTANCE }.getReference<TypeReference>()!!.type
        val clickTypes = read.getValue(click).methods.flatMap { m -> m.body().flatMap { it.types() } }.toSet() - read.keys
        val more = FixtureDex.classes(build, clickTypes)
        Fixture((found + read.values + more.values).distinctBy { it.type }, menu, copyLink, click)
    }

    private fun Instruction.types(): List<String> = when (val reference = (this as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference) {
        is MethodReference -> listOf(reference.definingClass)
        is FieldReference -> listOf(reference.definingClass, reference.type)
        is TypeReference -> listOf(reference.type)
        else -> emptyList()
    }

    private fun context(fixture: Fixture) = PatchContexts.of(ExtensionDex.classes() + fixture.classes)

    private fun BytecodePatchContext.menu(fixture: Fixture) =
        mutableClassDefBy(fixture.menu.definingClass).methods.single {
            it.name == fixture.menu.name &&
                it.parameterTypes.map { p -> p.toString() } == fixture.menu.parameterTypes.map { p -> p.toString() }
        }

    private fun BytecodePatchContext.stub(name: String) =
        mutableClassDefBy(SAVE_MEDIA_ROW).methods.single { it.name == name }.body()

    private fun Instruction.method(): MethodReference? = getReference<MethodReference>()

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    /** Each if and goto as (from, to), counted without the nops that align payloads. */
    private fun branches(body: List<Instruction>): List<Pair<Int, Int>> {
        var address = 0
        val at = IntArray(body.size) { i -> address.also { address += body[i].codeUnits } }
        val code = body.indices.filter { body[it].opcode != Opcode.NOP }.withIndex().associate { (counted, index) -> index to counted }
        return body.indices.filter {
            body[it] is OffsetInstruction && body[it].opcode !in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)
        }.map { from ->
            code.getValue(from) to code.getValue(at.indexOfFirst { it == at[from] + (body[from] as OffsetInstruction).codeOffset })
        }
    }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    private companion object {
        val fixtures = HashMap<File, Fixture>()

        val MODEL = setOf(MEDIA, USER, VIDEO_VERSION, PANDO_VIDEO_VERSION, IMAGE_INFO, PANDO_IMAGE_INFO, IMAGE_URL)

        val BRIDGES = setOf(
            "videoVersions", "dashManifest", "mediaId", "owner", "takenAt", "carouselMedia", "username",
            "versionUrl", "versionWidth", "versionHeight",
            "imageVersions", "imageCandidates", "candidateUrl", "candidateWidth", "candidateHeight",
        )

        /** Read off each build by hand: the menu lambda, its post and controller, and how Copy link's click closes the menu. */
        val EXPECTED = mapOf(
            "450.0.0.51.78" to Expected("LX/Slj;", "LX/Slj;->A0G:$MEDIA", "LX/Slj;->A0D:LX/At4;", "LX/At4;->A0u()V"),
        )
    }
}
