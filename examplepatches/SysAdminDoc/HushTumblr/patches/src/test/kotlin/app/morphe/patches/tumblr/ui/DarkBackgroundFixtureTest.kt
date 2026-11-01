/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.PatchLogCapture
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * Where Dark background color hands Tumblr's themes to the extension in each declared build: right
 * after the palette helper sets an activity's theme, on that activity, and right after the Compose
 * colors take their theme, on that theme. Tumblr's own code around each call is unchanged, and the
 * patch turns its switch and target on. The design system's Dark colors hand over their two surface
 * grays as they read them, and a build that keeps those some other way gets the rest of the patch.
 */
@Category(FixtureTests::class)
class DarkBackgroundFixtureTest {
    @Test
    fun `each declared build hands both themes to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + themeClasses(build))
            val hooks = context.resolveThemeHooks()
            val activity = "${hooks.activity.definingClass}->${hooks.activity.name}"
            val compose = "${hooks.compose.definingClass}->${hooks.compose.name}"
            val activityBefore = hooks.activity.instructionList().map { it.opcode }
            val composeBefore = hooks.compose.instructionList().map { it.opcode }

            darkBackgroundPatch.execute(context)

            val activityBody = context.mutableClassDefBy(hooks.activity.definingClass).methods
                .single { it.name == hooks.activity.name && it.parameterTypes == hooks.activity.parameterTypes }
                .instructionList()
            assertEquals("$activity: one call added", activityBefore.size + 1, activityBody.size)
            assertEquals("$activity: right after setTheme", "setTheme",
                activityBody[hooks.activityIndex - 1].methodRef()?.name)
            val activityCall = activityBody[hooks.activityIndex]
            assertEquals(activity, ACTIVITY_THEME_HOOK, activityCall.descriptor())
            assertEquals("$activity: on the activity setTheme was called on",
                listOf(hooks.activityRegister), activityCall.namedRegisters())
            assertEquals("$activity: Tumblr's own code around it", activityBefore,
                activityBody.filterIndexed { index, _ -> index != hooks.activityIndex }.map { it.opcode })

            val composeBody = context.mutableClassDefBy(hooks.compose.definingClass).methods
                .single { it.name == "<init>" && it.parameterTypes == hooks.compose.parameterTypes }
                .instructionList()
            assertEquals("$compose: one call added", composeBefore.size + 1, composeBody.size)
            assertEquals("$compose: after getTheme", "getTheme", composeBody[hooks.composeIndex - 2].methodRef()?.name)
            assertEquals("$compose: once the theme is kept", Opcode.MOVE_RESULT_OBJECT,
                composeBody[hooks.composeIndex - 1].opcode)
            val composeCall = composeBody[hooks.composeIndex]
            assertEquals(compose, COMPOSE_THEME_HOOK, composeCall.descriptor())
            assertEquals("$compose: on the theme", listOf(hooks.composeRegister), composeCall.namedRegisters())
            assertEquals("$compose: Tumblr's own code around it", composeBefore,
                composeBody.filterIndexed { index, _ -> index != hooks.composeIndex }.map { it.opcode })

            for (flag in listOf("darkBackground", "themeBackground")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    /**
     * The Dark palette's design colors hand each of their two surface grays to the extension right
     * after reading it, and the answer goes back where the gray was. Nothing else in that initializer
     * moves, and no other class the design system's theme draws on changes at all, which is every
     * other palette's colors.
     */
    @Test
    fun `each declared build hands the Dark palette's design grays to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val design = designClasses(build)
            val context = PatchContexts.of((ExtensionDex.classes() + themeClasses(build) + design).distinctBy { it.type })
            val found = context.resolveDesignColors() ?: throw AssertionError("${build.name}: the design colors weren't found")
            val holder = found.initializer.definingClass
            val before = found.initializer.instructionList()
            val reads = found.reads.sortedBy { it.index }
            assertEquals("${build.name}: the page, the content container and two menus", 4, reads.count { it.hook == DESIGN_PAGE_HOOK })
            assertEquals("${build.name}: two panels, the bar and a dialog", 4, reads.count { it.hook == DESIGN_PANEL_HOOK })
            for (read in reads) {
                assertEquals("$holder ${read.index}: after a color is read", "J", before[read.index - 2].methodRef()?.returnType)
                val kept = before[read.index - 1]
                assertEquals("$holder ${read.index}: and kept", Opcode.MOVE_RESULT_WIDE, kept.opcode)
                assertEquals("$holder ${read.index}: in the register the hook reads", read.register, (kept as OneRegisterInstruction).registerA)
            }
            val getters = reads.groupBy({ it.hook }) { before[it.index - 2].methodRef().toString() }.mapValues { it.value.toSet() }
            assertEquals("${build.name}: one getter hands out each gray", listOf(1, 1), getters.values.map { it.size })
            assertEquals("${build.name}: and they're two getters", 2, getters.values.flatten().toSet().size)
            // The grays are told by value, so each has to be written once where the getters live.
            val list = design.single { it.type == before[reads.first().index - 2].methodRef()!!.definingClass }
            val written = list.methods.single { it.name == "<clinit>" }.instructionList()
                .mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
            assertEquals("${build.name}: the page gray", 1, written.count { it == DARK_PAGE_GRAY })
            assertEquals("${build.name}: the panel gray", 1, written.count { it == DARK_PANEL_GRAY })
            val others = design.filter { it.type != holder }.associate { it.type to shapeOf(it) }

            darkBackgroundPatch.execute(context)

            val after = context.mutableClassDefBy(holder).methods.single { it.name == "<clinit>" }.instructionList()
            assertEquals("$holder: a call and its answer for each gray", before.size + 2 * reads.size, after.size)
            val added = mutableSetOf<Int>()
            reads.forEachIndexed { earlier, read ->
                val at = read.index + 2 * earlier
                assertEquals("$holder $at", Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
                assertEquals("$holder $at", read.hook, after[at].descriptor())
                assertEquals("$holder $at: on the long just kept", listOf(read.register, read.register + 1), after[at].namedRegisters())
                assertEquals("$holder $at: the answer", Opcode.MOVE_RESULT_WIDE, after[at + 1].opcode)
                assertEquals("$holder $at: goes back where the gray was", read.register, (after[at + 1] as OneRegisterInstruction).registerA)
                added += listOf(at, at + 1)
            }
            assertEquals("$holder: Tumblr's own code around them", before.map { it.opcode },
                after.filterIndexed { index, _ -> index !in added }.map { it.opcode })
            for ((type, shape) in others) {
                assertEquals("$type: left as Tumblr wrote it", shape, shapeOf(context.classDefBy(type)))
            }
        }
    }

    /**
     * The footer under a post hands the color it paints itself with to the extension right after
     * reading it, before the background modifier takes it, and the answer goes back where the color
     * was. Nothing else in the footer moves.
     */
    @Test
    fun `each declared build hands the post footer's color to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val footers = FixtureDex.classesWhere(build, { true }) { method ->
                method.strings().any { it.startsWith(POST_FOOTER_NOTE) }
            }
            val context = PatchContexts.of((ExtensionDex.classes() + themeClasses(build) + designClasses(build) + footers + pageClasses(build)).distinctBy { it.type })
            val (footer, read) = context.resolvePostFooterColor()
                ?: throw AssertionError("${build.name}: the post footer's color wasn't found")
            val before = footer.instructionList()

            val warnings = PatchLogCapture.warnings { darkBackgroundPatch.execute(context) }

            assertEquals(build.name, emptyList<String>(), warnings)
            val after = context.mutableClassDefBy(footer.definingClass).methods
                .single { it.name == footer.name && it.parameterTypes == footer.parameterTypes }
                .instructionList()
            val at = read.index
            assertEquals("${footer.name}: a call and its answer", before.size + 2, after.size)
            assertEquals("${footer.name} $at: after the color is kept", Opcode.MOVE_RESULT_WIDE, after[at - 1].opcode)
            assertEquals("${footer.name} $at", DESIGN_FOOTER_HOOK, after[at].descriptor())
            assertEquals("${footer.name} $at: on the long just kept", listOf(read.register, read.register + 1), after[at].namedRegisters())
            assertEquals("${footer.name} $at: goes back where the color was", read.register, (after[at + 1] as OneRegisterInstruction).registerA)
            assertEquals("${footer.name}: the background takes the answer", before[at].methodRef(), after[at + 2].methodRef())
            assertEquals("${footer.name}: Tumblr's own code around it", before.map { it.opcode },
                after.filterIndexed { index, _ -> index != at && index != at + 1 }.map { it.opcode })
        }
    }

    /**
     * A blog's page, title and link colors go through the extension right before their functions
     * return them, and a tag page's right after it's read from the header, the answer going back where
     * it was. The JSON adapter's read and the customize screens' reads of the theme stay Tumblr's.
     */
    @Test
    fun `each declared build hands blog and tag page colors to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val pages = pageClasses(build)
            val adapter = pages.filter { it.type.endsWith("JsonAdapter;") }.map { it.type to shapeOf(it) }
            assertEquals("${build.name}: the header's JSON adapter reads the color too", 1, adapter.size)
            val context = PatchContexts.of((ExtensionDex.classes() + themeClasses(build) + pages).distinctBy { it.type })
            val blogs = context.resolveBlogColors()
            assertEquals("${build.name}: a blog's page color, then its title and link colors",
                listOf(PAGE_COLOR_HOOK, PAGE_TEXT_COLOR_HOOK, PAGE_TEXT_COLOR_HOOK), blogs.map { it.second.hook })
            assertEquals("${build.name}: three functions", 3, blogs.map { it.first.toString() }.toSet().size)
            val blogsBefore = blogs.associate { (method, _) -> method.toString() to method.instructionList() }
            val tags = context.resolveTagPageColors()
            assertEquals("${build.name}: the page's bars and the timeline's two reads", 3, tags.size)
            val tagsBefore = tags.associate { (method, _) -> method.toString() to method.instructionList() }

            darkBackgroundPatch.execute(context)

            for ((blog, blogRead) in blogs) {
                val blogBefore = blogsBefore.getValue(blog.toString())
                val blogAfter = context.mutableClassDefBy(blog.definingClass).methods
                    .single { it.name == blog.name && it.parameterTypes == blog.parameterTypes }.instructionList()
                val at = blogRead.index
                assertEquals("${blog.name}: a call and its answer", blogBefore.size + 2, blogAfter.size)
                assertEquals("${blog.name} $at: after the color is kept", Opcode.MOVE_RESULT, blogAfter[at - 1].opcode)
                assertEquals("${blog.name} $at", blogRead.hook, blogAfter[at].descriptor())
                assertEquals("${blog.name} $at: on the color", listOf(blogRead.register), blogAfter[at].namedRegisters())
                assertEquals("${blog.name} $at: goes back where the color was", blogRead.register, (blogAfter[at + 1] as OneRegisterInstruction).registerA)
                assertEquals("${blog.name}: and that's returned", Opcode.RETURN, blogAfter[at + 2].opcode)
                assertEquals("${blog.name}: Tumblr's own code around it", blogBefore.map { it.opcode },
                    blogAfter.filterIndexed { index, _ -> index != at && index != at + 1 }.map { it.opcode })
            }

            for ((method, read) in tags) {
                val before = tagsBefore.getValue(method.toString())
                val after = context.mutableClassDefBy(method.definingClass).methods
                    .single { it.name == method.name && it.parameterTypes == method.parameterTypes }.instructionList()
                assertEquals("$method: a call and its answer", before.size + 2, after.size)
                assertEquals("$method: right after the header's color", "getBackgroundColor", after[read.index - 2].methodRef()?.name)
                assertEquals("$method: once it's kept", Opcode.MOVE_RESULT_OBJECT, after[read.index - 1].opcode)
                assertEquals("$method", HUB_COLOR_HOOK, after[read.index].descriptor())
                assertEquals("$method: on the color", listOf(read.register), after[read.index].namedRegisters())
                assertEquals("$method: goes back where it was", read.register, (after[read.index + 1] as OneRegisterInstruction).registerA)
                assertEquals("$method: Tumblr's own code around it", before.map { it.opcode },
                    after.filterIndexed { index, _ -> index != read.index && index != read.index + 1 }.map { it.opcode })
            }
            for ((type, shape) in adapter) {
                assertEquals("$type: left as Tumblr wrote it", shape, shapeOf(context.classDefBy(type)))
            }
        }
    }

    /** Without a blog's or a tag's color where it was, the themes still get the style. */
    @Test
    fun `a build without the page colors gets a warning for each and the rest of the patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of((ExtensionDex.classes() + themeClasses(build) + designClasses(build)).distinctBy { it.type })
            val setter = context.resolveThemeHooks().let { it.activity to it.activity.instructionList().size }

            val warnings = PatchLogCapture.warnings { darkBackgroundPatch.execute(context) }

            assertEquals(build.name, 1, warnings.count { it.endsWith("a blog's page keeps the color its owner chose") })
            assertEquals(build.name, 1, warnings.count { it.endsWith("a tag's page keeps its own color") })
            assertEquals("${build.name}: the activity's theme is still handed over", setter.second + 1,
                context.mutableClassDefBy(setter.first.definingClass).methods
                    .single { it.name == setter.first.name && it.parameterTypes == setter.first.parameterTypes }
                    .instructionList().size)
        }
    }

    /** Every hook here fails open: without the design system where it was, the themes still get the style. */
    @Test
    fun `a build without the design system's colors gets a warning and the rest of the patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of((ExtensionDex.classes() + themeClasses(build) + pageClasses(build)).distinctBy { it.type })
            val hooks = context.resolveThemeHooks()
            val setter = hooks.activity.instructionList().size

            val warnings = PatchLogCapture.warnings { darkBackgroundPatch.execute(context) }

            assertEquals(build.name, 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().startsWith("Dark background color: 0 functions carry"))
            assertTrue(warnings.single(), warnings.single().endsWith("keep their own grays"))
            assertEquals("${build.name}: the activity's theme is still handed over", setter + 1,
                context.mutableClassDefBy(hooks.activity.definingClass).methods
                    .single { it.name == hooks.activity.name && it.parameterTypes == hooks.activity.parameterTypes }
                    .instructionList().size)

            // The theme and each palette's colors, but not the color list the grays are told by.
            val design = designClasses(build)
            val lists = design.filter { owner ->
                owner.methods.any { method ->
                    method.name == "<clinit>" &&
                        method.instructionList().any { (it as? WideLiteralInstruction)?.wideLiteral == DARK_PAGE_GRAY }
                }
            }
            assertEquals("${build.name}: one color list", 1, lists.size)
            val unlisted = PatchContexts.of((ExtensionDex.classes() + design.filter { it !in lists }).distinctBy { it.type })
            val refused = PatchLogCapture.warnings { assertNull(unlisted.resolveDesignColors()) }
            assertEquals(build.name, 1, refused.size)
            assertTrue(refused.single(), refused.single().contains("doesn't read both of the Dark palette's surface grays"))
        }
    }

    /** The patch's style name is the one the extension looks up. */
    @Test
    fun `the patch and the extension name the same style`() {
        assertEquals(DARK_BACKGROUND_STYLE, ExtensionDex.stringConstant(DARK_BACKGROUND, "STYLE"))
        assertEquals(DARK_WALLPAPER_STYLE, ExtensionDex.stringConstant(DARK_BACKGROUND, "WALLPAPER_STYLE"))
    }

    /** A design system row is as far from its page as a highlighted surface in the style is. */
    @Test
    fun `the patch and the extension raise a surface by the same step`() {
        assertEquals(HIGHLIGHT_STEP, ExtensionDex.intConstant(DARK_BACKGROUND, "RAISE_STEP"))
    }

    /** The classes that set an activity's theme or read the card surface, with each activity's chain. */
    private fun themeClasses(build: File): List<ClassDef> {
        val classes = FixtureDex.classesWhere(build, { true }) { method ->
            method.instructionList().any { it.methodRef()?.name == "setTheme" || it.isCardAttribute() }
        }
        // The activity's own class both calls setTheme and starts its chain, so it's kept once.
        return classes + activityChains(build, classes).filter { link -> classes.none { it.type == link.type } }
    }

    /** The class that compares and answers a blog's background, and every class that reads a tag page header's color. */
    private fun pageClasses(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { method ->
            BLOG_BACKGROUND_KEY in method.strings() && method.parameterTypes.map(CharSequence::toString) == listOf(BLOG_THEME, BLOG_THEME) ||
                method.instructionList().any { step -> step.methodRef()?.let { it.definingClass == HUB_HEADER && it.name == "getBackgroundColor" } == true }
        }

    /**
     * The design system's theme function, every class it asks for something without arguments (each
     * palette's colors among them), and every class those build themselves from (the color list).
     */
    private fun designClasses(build: File): List<ClassDef> {
        val themes = FixtureDex.classesWhere(build, { true }) { method ->
            method.strings().any { it.startsWith(DESIGN_THEME_NOTE) }
        }
        val asked = themes.flatMap { it.methods }.flatMap { it.instructionList() }.mapNotNull { step ->
            step.methodRef()?.takeIf { step.opcode == Opcode.INVOKE_STATIC && it.parameterTypes.isEmpty() }?.definingClass
        }
        val holders = FixtureDex.classes(build, asked.toSet()).values
        val built = holders.flatMap { it.methods }.filter { it.name == "<clinit>" }.flatMap { it.instructionList() }
            .mapNotNull { it.methodRef()?.definingClass }
        return (themes + holders + FixtureDex.classes(build, built.toSet()).values).distinctBy { it.type }
    }

    /** Each method of [owner] as its name and opcodes, enough to see whether anything was put into it. */
    private fun shapeOf(owner: ClassDef): List<String> =
        owner.methods.map { method -> "${method.name}${method.parameterTypes}${method.instructionList().map { it.opcode }}" }.sorted()

    /**
     * The classes each two-parameter method of [owners] takes first extends, up to the framework, so
     * the patch can see the one whose theme Tumblr sets is an activity.
     */
    private fun activityChains(build: File, owners: List<ClassDef>): Collection<ClassDef> {
        val supers = mutableMapOf<String, String?>()
        FixtureDex.forEach(build) { dex -> for (classDef in dex.classes) supers.putIfAbsent(classDef.type, classDef.superclass) }
        val wanted = mutableSetOf<String>()
        val starts = owners.flatMap { owner ->
            owner.methods.filter { it.parameterTypes.size == 2 }.map { it.parameterTypes[0].toString() }
        }
        for (start in starts) {
            var current: String? = start
            while (current != null && current in supers && wanted.add(current)) current = supers[current]
        }
        return FixtureDex.classes(build, wanted).values
    }

    private fun Instruction.descriptor(): String? = methodRef()?.let {
        "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
    }
}
