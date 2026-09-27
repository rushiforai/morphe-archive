/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The anchors the font swap stands on, pinned on each declared Facebook build: one typeface
 * resolver, the family enum with Meta's interface families, the builder factory and the two
 * builders it makes, with the frames the injections need.
 */
class SystemFontFixtureTest {
    /** The families the switch swaps. SystemFontTest holds the extension to the same twelve. */
    private val metaFamilies = sortedSetOf(
        "FACEBOOK_SANS_VARIABLE", "OPTIMISTIC_AI", "OPTIMISTIC_AI_1_BETA", "OPTIMISTIC_AI_2_BETA",
        "OPTIMISTIC_AI_3_BETA", "OPTIMISTIC_DISPLAY_APP", "OPTIMISTIC_DISPLAY_APP_MEDIUM",
        "OPTIMISTIC_TEXT_APP_BOLD", "OPTIMISTIC_TEXT_APP_MEDIUM", "OPTIMISTIC_TEXT_APP_REGULAR",
        "OPTIMISTIC_VARIABLE_APP_LITE", "OPTIMISTIC_VF_APP_LITE",
    )

    @Test
    fun `each declared build has one typeface resolver, Meta's families and the builder route`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val owners = FixtureDex.classesHolding(bundle, NO_BACKING_SOURCE)
                assertEquals("${bundle.name}: classes holding the no-source refusal", 1, owners.size)
                checkResolver(bundle, owners.single())
                checkBuilders(bundle, owners.single())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
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
}
