/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.suggested

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The profile hook of Hide suggested and promoted posts on every declared Facebook build: one
 * section children builder loads the carousel's name, its class hands that name to the section
 * base class, the base declares the kept getLogTag() and setChildren of what the builder answers,
 * that Children type can be built empty, and the hook goes in first with the builder whole after
 * it. The section is built by the profile's root section and by the wrapper that places it below
 * the intro card, and by nothing else.
 */
class ProfileSuggestionsFixtureTest {
    /** The names of the sections that may build the carousel's section. */
    private val builtBy = setOf("ProfileSection", "ProfilePeopleYouMayKnowBelowIntrocardSection")

    private fun locals(method: Method): Int {
        val self = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
        return method.implementation!!.registerCount - self - method.parameterTypes.size
    }

    /** The strings a class's constructors load: a section's is the name it hands its base class. */
    private fun constructorStrings(methods: Iterable<Method>): Set<String> =
        methods.filter { it.name == "<init>" }.flatMap { method ->
            method.implementation?.instructions?.toList().orEmpty().mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            }
        }.toSet()

    @Test
    fun `each declared build has one profile People you may know section, and the hook goes in first`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, PROFILE_PYMK_SECTION)
                assertEquals("$name: classes loading \"$PROFILE_PYMK_SECTION\"", 1, holders.size)
                val section = holders.single()
                val builders = profileSuggestionBuilders(section)
                assertEquals("$name: children builders loading the name", 1, builders.size)
                val builder = builders.single()
                assertTrue("$name: ${section.type} doesn't name itself", namesItself(section))
                assertTrue("$name: the builder has no local register to borrow", locals(builder) >= 1)

                val children = builder.returnType
                val found = FixtureDex.classes(bundle, setOf(section.superclass!!, children))
                val base = found[section.superclass] ?: throw AssertionError("$name: no ${section.superclass}")
                assertTrue("$name: ${base.type} isn't the section base of $children", isSectionBase(base, children))
                val list = found[children] ?: throw AssertionError("$name: no $children")
                assertTrue("$name: $children can't be built empty", isChildrenList(list))

                // Only the profile's root and the below-intro-card wrapper build the section.
                val creators = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.typeSection.any { it == section.type }
                }) { method ->
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.NEW_INSTANCE &&
                            ((it as ReferenceInstruction).reference as TypeReference).type == section.type
                    } == true
                }.map { it.definingClass }.toSet()
                val creatorClasses = FixtureDex.classes(bundle, creators)
                assertEquals("$name: a class that builds the section is missing", creators, creatorClasses.keys)
                val creatorNames = creatorClasses.values.map { constructorStrings(it.methods).intersect(builtBy) }
                assertTrue("$name: a class building the section isn't one of $builtBy: $creatorNames",
                    creatorNames.all { it.size == 1 })
                assertEquals("$name: the sections that build the carousel's", builtBy, creatorNames.flatten().toSet())
                assertEquals("$name: classes building the section", 2, creators.size)

                // The hook as the patch puts it in, on this build's own classes.
                val context = PatchContexts.of(listOf(section, base, list))
                context.hideProfileSuggestions()
                val hooked = context.mutableClassDefBy(section.type).methods.single {
                    it.name == builder.name && it.returnType == builder.returnType &&
                        it.parameterTypes.map(Any::toString) == builder.parameterTypes.map(Any::toString)
                }.implementation!!.instructions.toList()
                val ask = hooked[0]
                assertEquals("$name: the builder's first instruction", Opcode.INVOKE_STATIC_RANGE, ask.opcode)
                assertEquals(HIDE_PROFILE_SECTION, (ask as ReferenceInstruction).reference.toString())
                assertEquals("$name: the hook isn't handed this", locals(builder), (ask as RegisterRangeInstruction).startRegister)
                assertEquals("$name: an empty Children of another type", children,
                    ((hooked[3] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: the builder after the hook", builder.implementation!!.instructions.map { it.opcode },
                    hooked.drop(6).map { it.opcode })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
