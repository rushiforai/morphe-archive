/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.explore

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class HideExploreLoadMoreRowTest {
    private val state = "Lfixture/State;"
    private val picker = "Lfixture/Picker;"
    private val fragment = "Lfixture/ExploreFragment;"
    private val adapter = "Lfixture/GridAdapter;"
    private val check = "$picker->show($state)Z"
    private val built = "$adapter-><init>(Ljava/lang/Object;J$state)V"

    /** Both calls the patch writes are in the ExploreGrid the bundle ships, public and static. */
    @Test
    fun theHooksAreInTheExtension() {
        val declared = ExtensionDex.classDef(TRACK_STATE.substringBefore("->")).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        for (hook in listOf(TRACK_STATE, LOAD_MORE_ROW)) assertTrue("$hook is not in the extension: $declared", hook.substringAfter("->") in declared)
    }

    /** The row's state is what LoadMoreButton binds, and its check is the picker class's one boolean static taking it. */
    @Test
    fun theRowIsFoundBesideThePicker() {
        val row = PatchContexts.of(listOf(button(), picker())).findLoadMoreRow()

        assertEquals(state, row.state)
        assertEquals(check, row.check.toString())
    }

    @Test
    fun aPickerClassWithoutTheCheckFailsThePatch() {
        val context = PatchContexts.of(listOf(button(), picker(withCheck = false)))
        assertThrows(PatchException::class.java) { context.findLoadMoreRow() }
    }

    /**
     * The state the fragment hands its adapter is noted right after the adapter's built, past a
     * long that takes two registers, and the button's own check goes past the extension with it.
     */
    @Test
    fun exploresStateIsNotedAndTheButtonAsks() {
        val context = PatchContexts.of(listOf(button(), picker(), fragment(), gridAdapter(adapter), other()))

        val row = context.findLoadMoreRow()
        context.hideLoadMoreRow(row, context.findExploreAdapter(context.findExploreFragment(), row))

        val create = context.code(fragment, "onCreate")
        val at = create.indexOfFirst { it.calls(built) }
        assertTrue("noted right after it's built", create[at + 1].calls(TRACK_STATE))
        assertEquals("the state, not the adapter", (create[at] as FiveRegisterInstruction).registerG,
            (create[at + 1] as RegisterRangeInstruction).startRegister)
        assertEquals("noted once", 1, create.count { it.calls(TRACK_STATE) })

        val bind = context.code(LOAD_MORE_BUTTON, "bind")
        val asked = bind.indexOfFirst { it.calls(LOAD_MORE_ROW) }
        assertTrue(bind[asked - 2].calls(check))
        assertEquals(Opcode.MOVE_RESULT, bind[asked - 1].opcode)
        val call = bind[asked] as FiveRegisterInstruction
        assertEquals("the state", (bind[asked - 2] as FiveRegisterInstruction).registerC, call.registerC)
        assertEquals("the check's answer", (bind[asked - 1] as OneRegisterInstruction).registerA, call.registerD)
        assertEquals(Opcode.MOVE_RESULT, bind[asked + 1].opcode)
        assertEquals(call.registerD, (bind[asked + 1] as OneRegisterInstruction).registerA)
        assertTrue("the adapter's own check stays", context.code(adapter, "update").none { it.calls(LOAD_MORE_ROW) })
    }

    @Test
    fun twoAskingAdaptersFailThePatch() {
        val context = PatchContexts.of(listOf(button(), picker(), fragment(also = "Lfixture/SecondAdapter;"), gridAdapter(adapter),
            gridAdapter("Lfixture/SecondAdapter;"), other()))
        assertThrows(PatchException::class.java) {
            context.findExploreAdapter(context.findExploreFragment(), context.findLoadMoreRow())
        }
    }

    /**
     * In each declared build the row check is found beside LoadMoreButton's picker, the Explore
     * fragment builds one adapter with the row state that asks it, that state is noted once, and the
     * button's one check goes past the extension. On 449 that's LX/03xP;->A01, LX/038a;->onCreate
     * noting v39 and LoadMoreButton;->A01.
     */
    @Test
    fun eachDeclaredBuildHidesTheRow() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val first = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.type == LOAD_MORE_BUTTON || classDef.methods.any { it.holds(EXPLORE_FRAGMENT_TAG) }) {
                            first += ImmutableClassDef.of(classDef)
                        }
                    }
                }
                val wanted = first.flatMap { classDef ->
                    classDef.methods.flatMap { method -> method.implementation?.instructions?.toList().orEmpty().mapNotNull {
                        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass
                    } }
                }.toSet()
                val classes = first.toMutableList()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) if (classDef.type in wanted) classes += ImmutableClassDef.of(classDef)
                }
                val context = PatchContexts.of(classes.distinctBy { it.type })

                val row = context.findLoadMoreRow()
                val found = context.findExploreAdapter(context.findExploreFragment(), row)
                context.hideLoadMoreRow(row, found)

                val noted = context.classDefBy(found.fragment).methods.flatMap { method ->
                    val code = method.implementation?.instructions?.toList().orEmpty()
                    code.indices.filter { code[it].calls(TRACK_STATE) }.map { code to it }
                }
                assertEquals("${bundle.name}: ${found.fragment} notes its row state once", 1, noted.size)
                val (create, at) = noted.single()
                val construct = create[at - 1]
                assertTrue("${bundle.name}: right after the adapter's built", construct.calls("${found.type}-><init>", prefix = true))
                val registers = when (construct) {
                    is RegisterRangeInstruction -> construct.startRegister until construct.startRegister + construct.registerCount
                    else -> (construct as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG) }
                }
                assertTrue("${bundle.name}: an argument of the adapter", (create[at] as RegisterRangeInstruction).startRegister in registers)

                val asked = context.classDefBy(LOAD_MORE_BUTTON).methods.flatMap { method ->
                    val code = method.implementation?.instructions?.toList().orEmpty()
                    code.indices.filter { code[it].calls(LOAD_MORE_ROW) }.map { code to it }
                }
                assertEquals("${bundle.name}: the button asks the extension once", 1, asked.size)
                val (code, hook) = asked.single()
                assertTrue("${bundle.name}: after the row check", code[hook - 2].calls(row.check.toString()))
                assertEquals(Opcode.MOVE_RESULT, code[hook + 1].opcode)
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    private fun Instruction.calls(reference: String, prefix: Boolean = false) =
        ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
            ?.let { if (prefix) it.startsWith(reference) else it == reference } == true

    private fun Method.holds(string: String): Boolean = implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == string
    } == true

    private fun BytecodePatchContext.code(type: String, name: String): List<Instruction> =
        classDefBy(type).methods.single { it.name == name }.implementation!!.instructions.toList()

    /** The button picks what it draws from the state, and binds by asking the check first. */
    private fun button() = classDef(LOAD_MORE_BUTTON, listOf(
        method(LOAD_MORE_BUTTON, SET_VIEW_TYPE, listOf(state, "Lfixture/Callback;"), "V", static = false, registers = 4, body = """
            invoke-static { v2 }, $picker->pick($state)Ljava/lang/Integer;
            move-result-object v0
            return-void
        """),
        method(LOAD_MORE_BUTTON, "bind", listOf(state, "Lfixture/Callback;"), "V", static = false, registers = 5, body = """
            invoke-static { v3 }, $check
            move-result v0
            if-nez v0, :show
            return-void
            :show
            invoke-virtual { v2, v3, v4 }, $LOAD_MORE_BUTTON->$SET_VIEW_TYPE(${state}Lfixture/Callback;)V
            return-void
        """),
    ))

    private fun picker(withCheck: Boolean = true) = classDef(picker, listOfNotNull(
        method(picker, "pick", listOf(state), "Ljava/lang/Integer;", static = true, registers = 2, body = """
            const/4 v0, 0x0
            return-object v0
        """),
        if (withCheck) method(picker, "show", listOf(state), "Z", static = true, registers = 2, body = """
            invoke-interface { v1 }, $state->isLoading()Z
            move-result v0
            return v0
        """) else null,
    ))

    /** The fragment builds an unrelated type, its grid adapter with the row state, and maybe one more. */
    private fun fragment(also: String? = null) = classDef(fragment, listOf(
        method(fragment, "onCreate", listOf("Landroid/os/Bundle;"), "V", static = false, registers = 7, body = """
            const-string v0, "$EXPLORE_FRAGMENT_TAG"
            new-instance v1, Lfixture/Other;
            invoke-direct { v1 }, Lfixture/Other;-><init>()V
            const-wide/16 v2, 0x0
            const/4 v4, 0x0
            new-instance v0, $adapter
            invoke-direct { v0, v1, v2, v3, v4 }, $built
        """ + (if (also != null) "\nnew-instance v0, $also\ninvoke-direct { v0, v1, v2, v3, v4 }, $also-><init>(Ljava/lang/Object;J$state)V" else "") +
            "\nreturn-void"),
    ))

    private fun gridAdapter(type: String) = classDef(type, listOf(
        method(type, "<init>", listOf("Ljava/lang/Object;", "J", state), "V", static = false, registers = 5, body = "return-void"),
        method(type, "update", listOf(type), "V", static = true, registers = 3, body = """
            iget-object v1, v2, $type->state:$state
            invoke-static { v1 }, $check
            move-result v0
            return-void
        """),
    ))

    private fun other() = classDef("Lfixture/Other;", listOf(
        method("Lfixture/Other;", "<init>", emptyList(), "V", static = false, registers = 1, body = "return-void"),
    ))

    private fun method(type: String, name: String, parameters: List<String>, returnType: String, static: Boolean, registers: Int, body: String): Method {
        val access = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0) or
            (if (name == "<init>") AccessFlags.CONSTRUCTOR.value else 0)
        val mutable = MutableMethod(
            ImmutableMethod(
                type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType, access, null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        return ImmutableMethod.of(mutable)
    }

    private fun classDef(type: String, methods: List<Method>): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods)
}
