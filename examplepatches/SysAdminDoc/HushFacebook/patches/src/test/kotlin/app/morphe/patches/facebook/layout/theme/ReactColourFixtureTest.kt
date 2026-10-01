/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
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
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Marketplace home is a React Native screen, so its colours come from its JavaScript as ints on
 * props: a view's background, a view's border, an image's tint and a text span's colour. On each
 * declared build the patch sends the first three through ReactColours first thing in React's own
 * setters, and gives React's text colour span an updateDrawState that asks ReactColours for the
 * colour it paints. Both theme patches call it, and the second call changes nothing.
 *
 * Read from 580 and 577 (2026-09-30): the text view manager's callback for built text is `LX/9WO`
 * and `LX/9W2`, the span builders `LX/7UZ;->A05` and `LX/7Tg;->A04`, the span `LX/7Ui` and
 * `LX/7Tn`, which declare no method. None of those names is used here.
 */
class ReactColourFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private val managers = setOf(REACT_BASE_VIEW_MANAGER, REACT_VIEW_MANAGER, REACT_IMAGE_MANAGER, REACT_TEXT_MANAGER)

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.parameters() = parameterTypes.map(CharSequence::toString)

    private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    /** The React managers, every one-method interface, every static Spannable builder and every ForegroundColorSpan subclass. */
    private fun reactClasses(bundle: File): Collection<ClassDef> {
        val found = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            for (classDef in dex.classes) {
                if (classDef.type in found) continue
                val keep = classDef.type in managers ||
                    classDef.superclass == FOREGROUND_COLOR_SPAN ||
                    (AccessFlags.INTERFACE.isSet(classDef.accessFlags) && classDef.methods.count() == 1) ||
                    classDef.methods.any { AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Landroid/text/Spannable;" }
                if (keep) found[classDef.type] = ImmutableClassDef.of(classDef)
            }
        }
        return found.values
    }

    @Test
    fun `React's colour setters and text span go through ReactColours, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val classes = reactClasses(bundle)
                val byType = classes.associateBy { it.type }
                managers.forEach { assertTrue("$name: $it is in the build", it in byType) }

                val setters = listOf(
                    Triple(REACT_BASE_VIEW_MANAGER, "setBackgroundColor", "$REACT_COLOURS->background(I)I"),
                    Triple(REACT_VIEW_MANAGER, "setBorderColor", "$REACT_COLOURS->colour(Ljava/lang/Integer;)Ljava/lang/Integer;"),
                    Triple(REACT_IMAGE_MANAGER, "setTintColor", "$REACT_COLOURS->colour(Ljava/lang/Integer;)Ljava/lang/Integer;"),
                )
                val originals = setters.map { (type, method, _) ->
                    byType.getValue(type).methods.single { it.name == method && it.implementation != null && it.parameters().last() in setOf("I", "Ljava/lang/Integer;") }
                }
                val spans = classes.filter { it.superclass == FOREGROUND_COLOR_SPAN }.associate { it.type to it.methods.count() }

                val context = PatchContexts.of(classes)
                val patched = { index: Int ->
                    val (type, method, _) = setters[index]
                    context.mutableClassDefBy(type).methods.single { it.name == method && it.parameters() == originals[index].parameters() }.body()
                }
                context.hookReactColours()
                val once = setters.indices.map { patched(it).size }
                context.hookReactColours()

                setters.forEachIndexed { index, (_, method, call) ->
                    val original = originals[index]
                    val body = patched(index)
                    // The colour is the last parameter, one register wide, so it sits in the last register.
                    val colour = original.implementation!!.registerCount - 1
                    val ask = body[0] as RegisterRangeInstruction
                    assertEquals("$name $method: first thing, the ask", Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
                    assertEquals("$name $method: what it asks", call, body[0].reference())
                    assertEquals("$name $method: about the colour", listOf(colour, 1), listOf(ask.startRegister, ask.registerCount))
                    assertEquals("$name $method: the answer",
                        if (method == "setBackgroundColor") Opcode.MOVE_RESULT else Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
                    assertEquals("$name $method: back into the colour's own register", colour, (body[1] as OneRegisterInstruction).registerA)
                    assertEquals("$name $method: the rest of it", original.body().map { it.opcode }, body.drop(2).map { it.opcode })
                    assertEquals("$name $method: the second call added nothing", once[index], body.size)
                    assertEquals("$name $method: one ask", 1, body.count { it.reference() == call })
                }

                val painted = spans.keys.filter { type ->
                    context.mutableClassDefBy(type).methods.any { it.name == "updateDrawState" && it.implementation?.instructions?.any { i -> i.reference() == "$REACT_COLOURS->text(I)I" } == true }
                }
                assertEquals("$name: one span paints through ReactColours", 1, painted.size)
                val span = painted.single()
                assertEquals("$name: $span declared no method of its own", 0, spans.getValue(span))
                val methods = context.mutableClassDefBy(span).methods
                assertEquals("$name: once, after both calls", 1, methods.size)
                val draw = methods.single()
                assertEquals("$name: it overrides ForegroundColorSpan's", listOf("Landroid/text/TextPaint;"), draw.parameters())
                assertEquals("V", draw.returnType)
                assertTrue("$name: an instance method", !AccessFlags.STATIC.isSet(draw.accessFlags) && AccessFlags.PUBLIC.isSet(draw.accessFlags))
                val body = draw.body()
                assertEquals("$name: the span's colour, ReactColours' answer, onto the paint",
                    listOf("$FOREGROUND_COLOR_SPAN->getForegroundColor()I", "$REACT_COLOURS->text(I)I", "Landroid/text/TextPaint;->setColor(I)V"),
                    body.mapNotNull { it.reference() })
                val paint = body.single { it.reference() == "Landroid/text/TextPaint;->setColor(I)V" } as FiveRegisterInstruction
                assertEquals("$name: onto the paint it was given, in the colour ReactColours gave",
                    listOf(draw.implementation!!.registerCount - 1, (body[3] as OneRegisterInstruction).registerA),
                    listOf(paint.registerC, paint.registerD))

                // The span is the one React's text builders create for a colour: they take the text
                // manager's callback for built text and hand back the Spannable.
                val callback = byType.getValue(REACT_TEXT_MANAGER).interfaces.single { type ->
                    byType[type]?.methods?.singleOrNull()?.parameters() == listOf("Landroid/text/Spannable;")
                }
                val builders = classes.flatMap { it.methods }.filter { method ->
                    AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Landroid/text/Spannable;" && callback in method.parameters()
                }
                assertTrue("$name: a builder takes $callback", builders.isNotEmpty())
                assertTrue("$name: a builder creates $span", builders.any { builder ->
                    builder.body().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == span }
                })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
