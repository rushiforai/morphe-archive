/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.quality

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Default playback quality's anchors on every Facebook build the bundle declares: the one (String)V
 * call in the method holding "HeroServicePlayer.setCustomQualityInternal", on a DASH format
 * evaluator built with an AbrContextAwareConfiguration; that setter's one array of tracks and its
 * one way of reading a track's label; the one String field the evaluator hands its own setter,
 * which its constructor fills in, the first choice empties right after, and nothing else in the
 * build writes; and the setter's only callers, that first choice and the Hero player's. Then the
 * patch itself, run on those classes: the extension asked first in the setter with its own two
 * arguments, told before every return of the constructor, where the constructor's own branches now
 * land, and each stub reading the member it stands for. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class DefaultPlaybackQualityFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private val Instruction.field: FieldReference?
        get() = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build has every anchor once, and the patch goes in on its own classes`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, SET_CUSTOM_QUALITY).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val holding = holders.flatMap { it.methods }.filter { holdsString(it, SET_CUSTOM_QUALITY) }
                assertEquals("$name: methods holding \"$SET_CUSTOM_QUALITY\"", 1, holding.size)
                val calls = customQualityCalls(holding.single())
                assertEquals("$name: (String)V calls there", 1, calls.size)
                val call = calls.single()

                val evaluator = FixtureDex.classes(bundle, setOf(call.definingClass)).values.single()
                assertTrue("$name: ${evaluator.type} isn't public", AccessFlags.PUBLIC.isSet(evaluator.accessFlags))
                assertTrue("$name: ${evaluator.type} isn't built with an $ABR_CONFIGURATION", takesAbrConfiguration(evaluator))
                val setter = evaluator.methods.single { it.name == call.name && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") }
                val constructor = evaluator.methods.single { it.name == "<init>" }

                val formatsFields = formatsFields(setter)
                assertEquals("$name: arrays of tracks the setter reads", 1, formatsFields.size)
                val formats = formatsFields.single()
                val format = formats.type.removePrefix("[")
                val labelReads = labelReads(setter, format)
                assertEquals("$name: ways the setter reads a track's label", 1, labelReads.size)
                val (labelOf, label) = labelReads.single()

                val preselects = preselectedReads(evaluator, setter)
                assertEquals("$name: labels the evaluator hands its own setter", 1, preselects.size)
                val preselected = preselects.single()
                assertTrue("$name: the constructor doesn't fill in ${preselected.name}",
                    constructor.code().any { it.opcode == Opcode.IPUT_OBJECT && it.field.toString() == preselected.toString() })

                // The first choice hands the label over once: it empties the field straight after.
                val firstChoice = evaluator.methods.single { method ->
                    method.code().any { it.call?.let { c -> c.definingClass == evaluator.type && c.name == setter.name } == true }
                }
                val code = firstChoice.code()
                val at = code.indexOfFirst { it.call?.let { c -> c.definingClass == evaluator.type && c.name == setter.name } == true }
                assertEquals("$name: what ${firstChoice.name} does after handing the label over",
                    Opcode.IPUT_OBJECT to preselected.toString(), code[at + 1].opcode to code[at + 1].field.toString())

                // Nothing else in the build writes the label, and only the Hero player and the first
                // choice call the setter.
                val writers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.fieldSection.any { it.definingClass == evaluator.type && it.name == preselected.name }
                }) { method ->
                    method.implementation?.instructions?.any { it.opcode == Opcode.IPUT_OBJECT && it.field.toString() == preselected.toString() } == true
                }
                assertEquals("$name: methods writing ${preselected.name}",
                    setOf("<init>", firstChoice.name), writers.map { it.name }.toSet())
                assertTrue("$name: a writer of ${preselected.name} outside ${evaluator.type}", writers.all { it.definingClass == evaluator.type })
                val callers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.methodSection.any { it.definingClass == evaluator.type && it.name == setter.name }
                }) { method ->
                    method.implementation?.instructions?.any { it.call?.let { c -> c.definingClass == evaluator.type && c.name == setter.name } == true } == true
                }
                assertEquals("$name: callers of ${setter.name}",
                    setOf("${evaluator.type}->${firstChoice.name}", "${holding.single().definingClass}->${holding.single().name}"),
                    callers.map { it.definingClass + "->" + it.name }.toSet())

                val formatClass = FixtureDex.classes(bundle, setOf(format)).values.single()
                val labelClass = FixtureDex.classes(bundle, setOf(labelOf.definingClass)).values.single()
                val infoClass = FixtureDex.classes(bundle, setOf(label.definingClass)).values.single()
                val context = PatchContexts.of(listOf(holders.single(), evaluator, formatClass, labelClass, infoClass)
                    .distinctBy { it.type } + listOf(ExtensionDex.classDef(QUALITY_CHOICE), ExtensionDex.classDef(SETTINGS_STATUS)))
                defaultPlaybackQualityPatch.execute(context)

                fun patched(method: Method): List<Instruction> = context.mutableClassDefBy(method.definingClass).methods.single {
                    it.name == method.name && it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }.implementation!!.instructions.toList()

                // First in the setter: the extension gets the evaluator and the label and answers the label.
                val self = setter.localRegisterCount()
                val setterCode = patched(setter)
                assertEquals("$name: the setter's first instruction", Opcode.INVOKE_STATIC_RANGE, setterCode[0].opcode)
                assertEquals("$name: the setter's first call", CUSTOM_QUALITY, setterCode[0].call.toString())
                assertEquals("$name: the registers the setter hands over", listOf(self, self + 1), setterCode[0].registers())
                assertEquals("$name: the answer takes the label's place", Opcode.MOVE_RESULT_OBJECT to self + 1,
                    setterCode[1].opcode to (setterCode[1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the setter's own code follows", setter.code().size + 2, setterCode.size)

                // Before every return of the constructor, and a branch that went to a return lands on its hook.
                val original = constructor.code()
                val addresses = original.runningFold(0) { address, instruction -> address + instruction.codeUnits }
                val branchesToReturns = original.indices.count { index ->
                    val branch = original[index] as? OffsetInstruction ?: return@count false
                    val target = addresses.indexOf(addresses[index] + branch.codeOffset)
                    original.getOrNull(target)?.opcode == Opcode.RETURN_VOID
                }
                val built = patched(constructor)
                val returns = built.indices.filter { built[it].opcode == Opcode.RETURN_VOID }
                assertEquals("$name: the constructor's returns", original.count { it.opcode == Opcode.RETURN_VOID }, returns.size)
                val branches = built.filterIsInstance<BuilderOffsetInstruction>()
                var branchesToHooks = 0
                for (index in returns) {
                    val hook = built[index - 1]
                    assertEquals("$name: the call before the constructor's return", EVALUATOR_BUILT, hook.call.toString())
                    assertEquals("$name: the register the constructor hands over", listOf(constructor.localRegisterCount()), hook.registers())
                    assertTrue("$name: a branch of the constructor skips the hook", branches.none { it.target.location.instruction === built[index] })
                    branchesToHooks += branches.count { it.target.location.instruction === hook }
                }
                assertEquals("$name: branches that went to a return now going to its hook", branchesToReturns, branchesToHooks)

                // Each stub reads or writes what it stands for, from its own arguments.
                val stubs = context.mutableClassDefBy(QUALITY_CHOICE)
                fun stub(stubName: String) = stubs.methods.single { it.name == stubName }.implementation!!.instructions.toList()
                fun cast(instruction: Instruction) = ((instruction as ReferenceInstruction).reference as TypeReference).type

                val read = stub(PRESELECTED_STUB)
                assertEquals("$name: the preselected stub's cast", evaluator.type, cast(read[0]))
                assertEquals("$name: the preselected stub's read", Opcode.IGET_OBJECT to preselected.toString(), read[1].opcode to read[1].field.toString())
                assertEquals("$name: the preselected stub's answer", Opcode.RETURN_OBJECT, read[2].opcode)
                val write = stub(PRESELECT_STUB)
                assertEquals("$name: the preselect stub's cast", evaluator.type, cast(write[0]))
                assertEquals("$name: the preselect stub's write", Opcode.IPUT_OBJECT to preselected.toString(), write[1].opcode to write[1].field.toString())
                assertEquals("$name: the preselect stub writes its label into its evaluator", 1 to 0,
                    (write[1] as TwoRegisterInstruction).let { it.registerA to it.registerB })
                assertEquals("$name: the preselect stub's end", Opcode.RETURN_VOID, write[2].opcode)
                val tracks = stub(FORMATS_STUB)
                assertEquals("$name: the tracks stub's cast", evaluator.type, cast(tracks[0]))
                assertEquals("$name: the tracks stub's read", Opcode.IGET_OBJECT to formats.toString(), tracks[1].opcode to tracks[1].field.toString())
                assertEquals("$name: the tracks stub's answer", Opcode.RETURN_OBJECT, tracks[2].opcode)
                val labelStub = stub(LABEL_STUB)
                assertEquals("$name: the label stub's cast", format, cast(labelStub[0]))
                assertEquals("$name: the label stub's call", labelOf.toString(), labelStub[1].call.toString())
                assertEquals("$name: the label stub's read", Opcode.IGET_OBJECT to label.toString(), labelStub[3].opcode to labelStub[3].field.toString())
                assertEquals("$name: the label stub's answer", Opcode.RETURN_OBJECT, labelStub[4].opcode)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "defaultPlaybackQuality" }
                assertEquals("$name: SettingsStatus.defaultPlaybackQuality() isn't switched on", 1,
                    (status.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
