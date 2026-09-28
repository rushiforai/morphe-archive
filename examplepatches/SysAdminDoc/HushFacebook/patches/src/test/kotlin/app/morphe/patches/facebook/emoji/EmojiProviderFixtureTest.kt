/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.emoji

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Use the phone's emoji on every Facebook build the bundle declares: the one provider the hook goes
 * into, and the facts that make that one hook enough. Meta's emoji font reaches nothing except
 * through the provider, and the span Facebook puts on emoji in text draws with whatever typeface
 * the provider gave it. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class EmojiProviderFixtureTest {
    private val typefaceSpan = "Landroid/text/style/TypefaceSpan;"
    private val setTypeface = "Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;"

    /** The family name Facebook's emoji span passes to TypefaceSpan, the literal its constructor loads. */
    private val spanFamily = "FacebookEmoji"

    private fun signature(method: Method) =
        method.definingClass + "->" + method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType

    private fun MethodReference.signature() = definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType

    private fun FieldReference.key() = "$definingClass->$name:$type"

    private fun references(method: Method) = method.implementation?.instructions?.toList().orEmpty()
        .mapNotNull { instruction -> (instruction as? ReferenceInstruction)?.reference?.let { instruction.opcode to it } }

    /** The Typeface fields [method] reads: for the provider, the holders Meta's font is kept in. */
    private fun typefaceReads(method: Method): Set<String> = references(method).mapNotNull { (opcode, reference) ->
        (reference as? FieldReference)?.takeIf {
            (opcode == Opcode.IGET_OBJECT || opcode == Opcode.SGET_OBJECT) && it.type == TYPEFACE
        }?.key()
    }.toSet()

    private fun calls(method: Method, signature: String) = references(method).any { (_, reference) ->
        (reference as? MethodReference)?.signature() == signature
    }

    private fun creates(method: Method, type: String) = references(method).any { (opcode, reference) ->
        opcode == Opcode.NEW_INSTANCE && (reference as? TypeReference)?.type == type
    }

    @Test
    fun `each declared build has one emoji typeface provider, the only way out of Meta's emoji font`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun check(bundle: File) {
        val name = bundle.name
        val holding = FixtureDex.classesHolding(bundle, FORCE_SYSTEM_EMOJI_FONT)
            .flatMap { owner -> owner.methods.filter { holdsString(it, FORCE_SYSTEM_EMOJI_FONT) } }
        val providers = holding.filter(::isEmojiTypefaceProvider)
        assertEquals("$name: emoji typeface providers", 1, providers.size)
        val provider = providers.single()
        val providerSignature = signature(provider)
        assertEquals("$name: methods loading the end-to-end flag", listOf(providerSignature), holding.map(::signature))
        assertTrue("$name: the provider has no local for the hook's answer", provider.localRegisterCount() >= 1)

        // The provider takes the typeface out of two holders: the one it builds from the phone's Noto
        // file under the end-to-end flag, and the one the downloaded-font loader answers with Meta's
        // FacebookEmoji.ttf.
        val holders = typefaceReads(provider)
        assertEquals("$name: holders the provider reads a Typeface from: $holders", 2, holders.size)

        val holderReaders = mutableListOf<String>()
        val spans = mutableListOf<Pair<String, Set<String>>>()
        FixtureDex.forEach(bundle) { dex ->
            val readsHolder = dex.fieldSection.any { field -> field.key() in holders }
            val namesFamily = dex.stringSection.any { it == spanFamily }
            if (!readsHolder && !namesFamily) return@forEach
            for (classDef in dex.classes) {
                if (readsHolder) {
                    classDef.methods.filter { typefaceReads(it).any { read -> read in holders } }
                        .forEach { holderReaders += signature(it) }
                }
                if (namesFamily && classDef.superclass == typefaceSpan &&
                    classDef.methods.any { it.name == "<init>" && holdsString(it, spanFamily) }
                ) {
                    spans += classDef.type to classDef.methods.filter { calls(it, setTypeface) }.map { it.name }.toSet()
                }
            }
        }
        assertEquals("$name: methods reading the holders of Meta's emoji font", listOf(providerSignature),
            holderReaders.distinct())

        // The span Facebook puts on a run of emoji is a TypefaceSpan named FacebookEmoji that sets the
        // paint's typeface to the one it was built with, when the text is measured and when it's drawn.
        assertEquals("$name: TypefaceSpans named $spanFamily", 1, spans.size)
        val (span, setters) = spans.single()
        assertEquals("$name: where the emoji span sets its typeface", setOf("updateDrawState", "updateMeasureState"),
            setters)

        // And whatever builds that span asks the provider for its typeface.
        val makers = FixtureDex.methodsWhere(bundle, dexFilter = { dex -> dex.typeSection.any { it == span } }) {
            creates(it, span)
        }
        assertTrue("$name: nothing builds the emoji span $span", makers.isNotEmpty())
        makers.forEach { maker ->
            assertTrue("$name: ${signature(maker)} builds the emoji span without asking the provider",
                calls(maker, providerSignature))
        }
    }
}
