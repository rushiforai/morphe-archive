/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The anchors the font swap stands on, pinned on each declared Facebook build: one typeface
 * resolver, the family enum with Meta's interface families, the builder factory and the two
 * builders it makes, and React Native's typeface resolver, with the frames the injections need.
 */
class OwnFontFixtureTest {
    /** The families the switch swaps. OwnFontTest holds the extension to the same twelve. */
    private val metaFamilies = sortedSetOf(
        "FACEBOOK_SANS_VARIABLE", "OPTIMISTIC_AI", "OPTIMISTIC_AI_1_BETA", "OPTIMISTIC_AI_2_BETA",
        "OPTIMISTIC_AI_3_BETA", "OPTIMISTIC_DISPLAY_APP", "OPTIMISTIC_DISPLAY_APP_MEDIUM",
        "OPTIMISTIC_TEXT_APP_BOLD", "OPTIMISTIC_TEXT_APP_MEDIUM", "OPTIMISTIC_TEXT_APP_REGULAR",
        "OPTIMISTIC_VARIABLE_APP_LITE", "OPTIMISTIC_VF_APP_LITE",
    )

    private fun bundles(check: (File) -> Unit) {
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

    @Test
    fun `each declared build has one typeface resolver, Meta's families and the builder route`() = bundles { bundle ->
        val owners = FixtureDex.classesHolding(bundle, NO_BACKING_SOURCE)
        assertEquals("${bundle.name}: classes holding the no-source refusal", 1, owners.size)
        checkResolver(bundle, owners.single())
        checkBuilders(bundle, owners.single())
    }

    private fun checkResolver(bundle: File, owner: ClassDef) {
        val resolvers = typefaceResolvers(owner)
        assertEquals("${bundle.name}: typeface resolvers", 1, resolvers.size)
        val resolver = resolvers.single()
        assertTrue("${bundle.name}: the resolver needs three free locals", localRegisters(resolver) >= 3)
        assertTrue("${bundle.name}: the resolver returns an object", objectReturns(resolver).isNotEmpty())
        // At every object return the family and the weight are still in their own registers, and
        // v0 to v2 hold nothing the resolver reads afterwards.
        resolver.requireResolverHookFits()

        val type = familyType(resolver)
        val family = FixtureDex.classes(bundle, setOf(type)).getValue(type)
        assertEquals("${bundle.name}: the family is an enum", ENUM, family.superclass)
        val names = familyNames(family)
        assertEquals("${bundle.name}: Meta's interface families", metaFamilies,
            names.filter(::isInterfaceFamily).toSortedSet())
        assertTrue("${bundle.name}: the creative families stay",
            "MONTSERRAT_REGULAR" in names && "COURIER_PRIME_BOLD" in names && "FACEBOOK_NARROW" in names)
        val withAxes = familiesWithAxes(family)
        assertTrue("${bundle.name}: the variable Optimistic family has axes: $withAxes",
            "OPTIMISTIC_VARIABLE_APP_LITE" in withAxes)
        assertEquals("${bundle.name}: every family with axes is Meta's", emptyList<String>(),
            withAxes.filterNot(::isInterfaceFamily))
    }

    private fun checkBuilders(bundle: File, owner: ClassDef) {
        val apiUtils = FixtureDex.classes(bundle, setOf(TYPEFACE_BUILDERS)).getValue(TYPEFACE_BUILDERS)
        val builders = builderClasses(apiUtils)
        assertEquals("${bundle.name}: an asset builder and a font file builder", 2, builders.size)

        // Every maker of a builder reads the family enum (580 takes it in the repository, 577 looks
        // it up by name in a helper), so a builder is only ever made for a family, and only one
        // with variable axes reaches it: the check above says those are all Meta's.
        val makers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
            dex.methodSection.any { it.definingClass == TYPEFACE_BUILDERS && it.name == BUILDER_FACTORY }
        }) { method ->
            method.implementation?.instructions?.any { instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                call?.definingClass == TYPEFACE_BUILDERS && call.name == BUILDER_FACTORY
            } == true
        }
        assertTrue("${bundle.name}: nothing makes builders", makers.isNotEmpty())
        val familyType = familyType(typefaceResolvers(owner).single())
        val strangers = makers.filterNot { touchesFamily(it, familyType) }.map { "${it.definingClass}->${it.name}" }
        assertEquals("${bundle.name}: makers that don't read the family enum", emptyList<String>(), strangers)

        val chains = chains(bundle, builders)
        for (builder in builders) {
            val chain = chains.getValue(builder)
            val builds = chain.flatMap(::buildMethods)
            assertTrue("${bundle.name}: $builder builds nothing", builds.isNotEmpty())
            builds.forEach { assertTrue("${bundle.name}: a build needs two free locals", localRegisters(it) >= 2) }
            // And at each of its object returns `this` is still the builder, and v0 and v1 are free.
            builds.forEach { it.requireBuilderHookFits() }
            assertTrue("${bundle.name}: $builder takes no variation string", chain.flatMap(::variationSetters).isNotEmpty())
        }
    }

    /** Each builder with its superclasses, nearest first, as far as the app's own classes go. */
    private fun chains(bundle: File, builders: List<String>): Map<String, List<ClassDef>> {
        val loaded = FixtureDex.classes(bundle, builders.toSet()).toMutableMap()
        while (true) {
            val wanted = loaded.values.mapNotNull { it.superclass }.filter { !isObject(it) && it !in loaded }.toSet()
            if (wanted.isEmpty()) break
            val found = FixtureDex.classes(bundle, wanted)
            if (found.isEmpty()) break
            loaded += found
        }
        return builders.associateWith { builder ->
            generateSequence(loaded[builder]) { at -> at.superclass?.let { loaded[it] } }.toList()
        }
    }

    /**
     * React Native's resolver on each declared build: one class holds the variation refusal, and one
     * of its methods has the resolver's shape and loads assets. It reads React Native's font manager,
     * the singleton whose class names the asset suffixes, and React Native's text layout, its spans
     * and its text inputs all call it. Its family name is intact at each return and v0 and v1 are
     * free there, and the patch's hook goes in at every return.
     */
    @Test
    fun `each declared build has one React Native typeface resolver the hook fits`() = bundles { bundle ->
        val owners = FixtureDex.classesHolding(bundle, INVALID_FONT_VARIATION)
        assertEquals("${bundle.name}: classes holding the variation refusal", 1, owners.size)
        val owner = owners.single()
        val refusers = owner.methods.filter { holdsString(it, INVALID_FONT_VARIATION) }
        assertEquals("${bundle.name}: the parse and the apply log it", 2, refusers.size)
        assertTrue("${bundle.name}: both log it as ReactNative", refusers.all { holdsString(it, "ReactNative") })

        val resolvers = reactNativeResolvers(owner)
        assertEquals("${bundle.name}: React Native typeface resolvers", 1, resolvers.size)
        val resolver = resolvers.single()
        assertTrue("${bundle.name}: the resolver needs two free locals", localRegisters(resolver) >= 2)
        assertTrue("${bundle.name}: two returns, the cached or created answer and the asset's",
            objectReturns(resolver).size >= 2)
        resolver.requireReactNativeHookFits()
        checkFontManager(bundle, resolver)
        checkReactNativeCallers(bundle, resolver)

        val context = PatchContexts.of(listOf(owner))
        context.hookReactNativeFonts()
        val body = context.mutableClassDefBy(owner.type).methods.single { it.name == resolver.name &&
            it.parameterTypes.map { type -> type.toString() } == resolver.parameterTypes.map { type -> type.toString() } }
            .implementation!!.instructions.toList()
        val family = localRegisters(resolver) + REACT_FAMILY
        val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
        assertEquals("${bundle.name}: a return lost its hook or gained one", objectReturns(resolver).size, returns.size)
        for (at in returns) {
            val answer = (body[at] as OneRegisterInstruction).registerA
            val where = "${bundle.name}: the return at $at"
            assertEquals("$where: move-result", Opcode.MOVE_RESULT_OBJECT, body[at - 1].opcode)
            assertEquals("$where: back into its own register", answer, (body[at - 1] as OneRegisterInstruction).registerA)
            val call = body[at - 2] as FiveRegisterInstruction
            assertEquals("$where: calls the extension", REPLACE_REACT_NATIVE, (call as ReferenceInstruction).reference.toString())
            assertEquals("$where: with v0 and v1", listOf(0, 1), listOf(call.registerC, call.registerD))
            val copy = body[at - 3] as TwoRegisterInstruction
            assertEquals("$where: the family copied down", listOf(Opcode.MOVE_OBJECT_FROM16, 1, family),
                listOf(copy.opcode, copy.registerA, copy.registerB))
        }
    }

    /**
     * The resolver reads React Native's font manager: a singleton, held in a static field of its own
     * class, whose static initializer lists the style suffixes and file extensions it tries on the
     * app's font assets. Facebook's font prefetcher registers Meta's families there.
     */
    private fun checkFontManager(bundle: File, resolver: Method) {
        // A singleton of the app's own, which Typeface.DEFAULT, read there too, is not.
        val managers = resolver.implementation!!.instructions.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf {
                instruction.opcode == Opcode.SGET_OBJECT && it.type == it.definingClass &&
                    !it.definingClass.startsWith("Landroid/") && !it.definingClass.startsWith("Ljava/")
            }?.definingClass
        }.distinct()
        assertEquals("${bundle.name}: the font manager singletons the resolver reads", 1, managers.size)
        val manager = FixtureDex.classes(bundle, managers.toSet()).getValue(managers.single())
        val initializer = manager.methods.single { it.name == "<clinit>" }
        for (literal in listOf("_bold", "_italic", "_bold_italic", ".ttf", ".otf")) {
            assertTrue("${bundle.name}: the font manager doesn't list \"$literal\"", holdsString(initializer, literal))
        }
    }

    /** React Native's text layout, a text span and a text input ask the resolver; the layout keeps its name. */
    private fun checkReactNativeCallers(bundle: File, resolver: Method) {
        val callers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
            dex.methodSection.any { it.definingClass == resolver.definingClass && it.name == resolver.name }
        }) { method ->
            method.implementation?.instructions?.any { instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                call?.definingClass == resolver.definingClass && call.name == resolver.name &&
                    call.parameterTypes.map { it.toString() } == resolver.parameterTypes.map { it.toString() }
            } == true
        }
        assertTrue("${bundle.name}: ${callers.size} callers", callers.size >= 3)
        assertTrue("${bundle.name}: React Native's text layout doesn't ask it: ${callers.map { it.name }}",
            callers.any { it.name.startsWith("updateTextPaint") })
    }
}
