/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.composer

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Tag suggestions only after @ on every Facebook build the bundle declares: one mention box whose
 * performFiltering has one gate for words without @; the flag it reads belongs to the
 * MentionsAutoCompleteBehavior, which holds the box, and nothing else in the build reads it; the box
 * is an AutoCompleteTextView that the post composer's box extends and the comment composer hands
 * back; and the patch, run on the build's own classes, asks the extension right after the read.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class TagSuggestionsFixtureTest {
    private val autoCompleteTextView = "Landroid/widget/AutoCompleteTextView;"
    private val composerTextData = "Lcom/facebook/ipc/composer/model/ComposerTextData;"

    /** The field Redex leaves on a class to say what it was called, and what the behaviour was. */
    private val originalName = "__redex_internal_original_name"
    private val behaviourName = "MentionsAutoCompleteBehavior"

    @Test
    fun `each declared build has one gate for words without at, on the box both composers use`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val boxes = FixtureDex.classesHolding(bundle, COMMON_WORDS_FAILURE)
                    .flatMap { owner -> owner.methods.filter(::isMentionFiltering) }
                assertEquals("$name: mention boxes", 1, boxes.size)
                val filtering = boxes.single()
                val box = filtering.definingClass
                val gate = wordGate(filtering)
                assertNotNull("$name: the gate for a word without @", gate)
                gate!!
                val behaviourType = gate.flagField.definingClass

                // One pass over the build for everything else the patch relies on.
                val supers = HashMap<String, String?>()
                val kept = mutableMapOf<String, ClassDef>()
                val flagUses = mutableListOf<String>()
                val postBoxes = mutableListOf<String>()
                val commentBoxes = mutableListOf<String>()
                FixtureDex.forEach(bundle) { dex ->
                    // Instructions are read only in a dex that names the flag or the comment view.
                    val namesFlag = dex.fieldSection.any {
                        it.definingClass == behaviourType && it.name == gate.flagField.name
                    }
                    val namesCommentView = dex.stringSection.any { it == "CommentComposerEditTextView" }
                    for (classDef in dex.classes) {
                        supers.putIfAbsent(classDef.type, classDef.superclass)
                        if (classDef.type == behaviourType || classDef.type == box) {
                            kept.putIfAbsent(classDef.type, ImmutableClassDef.of(classDef))
                        }
                        if (classDef.superclass == box && classDef.fields.any { it.type == composerTextData } &&
                            classDef.methods.any { method ->
                                method.name == "performFiltering" && method.implementation?.instructions?.any {
                                    it.opcode == Opcode.INVOKE_SUPER &&
                                        ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                                            ref.definingClass == box && ref.name == "performFiltering"
                                        }
                                } == true
                            }
                        ) postBoxes += classDef.type
                        if (!namesFlag && !namesCommentView) continue
                        for (method in classDef.methods) {
                            val code = method.implementation?.instructions ?: continue
                            for (instruction in code) {
                                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                                if (field.definingClass == behaviourType && field.name == gate.flagField.name &&
                                    field.type == "Z"
                                ) flagUses += "${instruction.opcode} in ${method.definingClass}->${method.name}"
                            }
                            if (method.returnType == box && holdsString(method, "CommentComposerEditTextView")) {
                                commentBoxes += "${method.definingClass}->${method.name}"
                            }
                        }
                    }
                }

                // The flag is the behaviour's, the class Redex remembers as MentionsAutoCompleteBehavior.
                val behaviour = kept[behaviourType]
                assertNotNull("$name: the flag's class", behaviour)
                val remembered = behaviour!!.staticFields.singleOrNull { it.name == originalName }?.initialValue
                assertEquals("$name: what Redex says the flag's class was", behaviourName,
                    (remembered as? StringEncodedValue)?.value)
                assertNotNull("$name: the behaviour's field holding the box", boxField(behaviour, box))

                // Only the gate reads the flag. The rest are the Litho builders that set it.
                val reads = flagUses.filter { it.startsWith("${Opcode.IGET_BOOLEAN}") }
                assertEquals("$name: reads of the flag", listOf("${Opcode.IGET_BOOLEAN} in $box->performFiltering"), reads)
                assertTrue("$name: something other than a store touches the flag: $flagUses",
                    (flagUses - reads.toSet()).all { it.startsWith("${Opcode.IPUT_BOOLEAN}") })

                // The box is an AutoCompleteTextView, which gives the extension isPopupShowing and
                // dismissDropDown to close a list left open.
                val chain = generateSequence(supers[box]) { supers[it] }.toList()
                assertTrue("$name: the box's classes above it: $chain", autoCompleteTextView in chain)

                // Both composers reach this method: the post composer's box extends the box and
                // calls up to it, and the comment composer's view hands back the box.
                assertEquals("$name: post composer boxes", 1, postBoxes.size)
                assertEquals("$name: comment composer views handing back the box", 1, commentBoxes.size)

                // The patch on the build's own classes asks the extension right after the read.
                val context = PatchContexts.of(listOf(kept.getValue(box), behaviour, ExtensionDex.classDef(SETTINGS_STATUS)))
                tagSuggestionsOnlyAfterAtPatch.execute(context)
                val patched = context.mutableClassDefBy(box).methods.single {
                    it.name == filtering.name && it.parameterTypes.map(CharSequence::toString) ==
                        filtering.parameterTypes.map(CharSequence::toString)
                }.implementation!!.instructions.toList()
                assertEquals("$name: the hook's size", filtering.implementation!!.instructions.count() + 3, patched.size)
                assertEquals(Opcode.IGET_BOOLEAN, patched[gate.flagRead].opcode)
                val read = patched[gate.flagRead + 1]
                assertEquals("$name: the box's read", Opcode.IGET_OBJECT, read.opcode)
                val boxRead = (read as ReferenceInstruction).reference as FieldReference
                assertEquals(behaviourType, boxRead.definingClass)
                assertEquals(box, boxRead.type)
                val held = (read as TwoRegisterInstruction).registerA
                assertEquals(gate.behaviour, read.registerB)
                assertTrue("$name: the box is read into v$held", held <= 15 && held != gate.flag)
                val asks = patched[gate.flagRead + 2]
                assertEquals("$name: the call", SKIPS_WORD, (asks as ReferenceInstruction).reference.toString())
                val registers = (asks as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD).take(it.registerCount) }
                assertEquals("$name: what the call reads", listOf(gate.flag, held), registers)
                assertEquals(Opcode.MOVE_RESULT, patched[gate.flagRead + 3].opcode)
                assertEquals(Opcode.IF_EQZ, patched[gate.flagRead + 4].opcode)
                listOf(gate.flagRead + 3, gate.flagRead + 4).forEach {
                    assertEquals("$name: ${patched[it].opcode} after the call", gate.flag,
                        (patched[it] as OneRegisterInstruction).registerA)
                }
                assertEquals(Opcode.RETURN_VOID, patched[gate.flagRead + 5].opcode)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
