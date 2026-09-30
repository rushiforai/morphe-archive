/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #27's Page card in search results, on each declared build. The card stayed #333334 after
 * route one's cards went near black, because it never asks a resolver: Facebook builds its search
 * results from server templates, each module waiting for its template parsed in the background (the
 * component logs as SearchResultsNativeTemplateBackgroundParser), so the card's colours come as text.
 * A template colour, plain or a light and dark pair its theme picks from (the reader that logs "Error
 * parsing themed color"), goes through one parser, the one method that fails with "can't parse color
 * value: ", and that parser is `Color.parseColor`. Route four sends that call to AMOLED's stand-in,
 * which takes a server card's grey to near black, and on to Material You's with both in the build.
 *
 * Read from 580 and 577 (2026-09-29): the parser is `LX/4yV;->A03` and `LX/4fl;->A03`, the themed
 * reader `LX/4yz;->A00` and `LX/4gT;->A00`, the search module `LX/BY1` and `LX/BWN`. None of those
 * names is used here.
 */
class ServerCardColourFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Method.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

    @Test
    fun `a search result card's colour goes through route four's parser, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                assertEquals("$name: search results wait for their parsed templates", 1,
                    FixtureDex.classesHolding(bundle, "SearchResultsNativeTemplateBackgroundParser").size)

                val parsers = FixtureDex.classesHolding(bundle, PARSE_FAILURE)
                assertEquals("$name: one class holds the template colour parser", 1, parsers.size)
                val colours = parsers.single()
                val parser = colours.methods.single { holdsString(it, PARSE_FAILURE) }
                assertTrue("$name: the parser is static", parser.isStatic())
                assertEquals("$name: it takes the text", listOf("Ljava/lang/String;"), parser.parameterTypes.map(CharSequence::toString))
                assertEquals("$name: and answers a colour", "I", parser.returnType)
                val parses = parser.body().withIndex().filter { it.value.call()?.toString() == PARSE_COLOR }
                assertEquals("$name: the parser is Color.parseColor", 1, parses.size)

                // The themed reader hands the light or the dark text to the parser's (String, int) helper.
                val helpers = colours.methods.filter { method ->
                    method.isStatic() && method.returnType == "I" &&
                        method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I") &&
                        method.body().any { it.call()?.toString() == parser.descriptor() }
                }.map { it.descriptor() }.toSet()
                assertEquals("$name: one helper calls the parser", 1, helpers.size)
                val readers = FixtureDex.classesHolding(bundle, THEMED_FAILURE).flatMap { it.methods }.filter { method ->
                    holdsString(method, THEMED_FAILURE) && method.isStatic() && method.returnType == "I" &&
                        method.parameterTypes.size == 3 && method.parameterTypes.last().toString() == "I"
                }
                assertEquals("$name: one themed colour reader", 1, readers.size)
                assertEquals("$name: it reads the light text and the dark text through the helper", 2,
                    readers.single().body().count { it.call()?.toString() in helpers })

                val framework = parses.single().value as FiveRegisterInstruction
                for (you in listOf(false, true)) {
                    val themes = "$name, AMOLED, Material You $you"
                    val context = PatchContexts.of(listOf(colours))
                    val stand = with(context) {
                        assertEquals("$themes: AMOLED sends the parser's call", 1,
                            rerouteColourCalls(AMOLED_COLOUR_CALLS).getValue(PARSE_COLOR))
                        if (you) {
                            assertEquals("$themes: Material You takes AMOLED's stand-in", 1,
                                rerouteColourCalls(YOU_COLOUR_CALLS).getValue(PARSE_COLOR_DARK))
                            standIn(MATERIAL_YOU, PARSE_COLOR)
                        } else {
                            PARSE_COLOR_DARK
                        }
                    }
                    val after = context.mutableClassDefBy(colours.type).methods.single { it.descriptor() == parser.descriptor() }.body()
                    val call = after[parses.single().index]
                    assertEquals("$themes: the parser's call", stand, call.call()?.toString())
                    assertEquals("$themes: static", Opcode.INVOKE_STATIC, call.opcode)
                    assertEquals("$themes: on the text's register", framework.registerC, (call as FiveRegisterInstruction).registerC)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private companion object {
        const val PARSE_FAILURE = "can't parse color value: "
        const val THEMED_FAILURE = "Error parsing themed color"
    }
}
