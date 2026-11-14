package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertSame

class ControlProfileTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    @Test fun eachBuildListsTheSameControlsWithTheSameNumberOfHooks() {
        // The other arm64 builds' Redex pass merged two analytics upload Runnables into one class, but left the Google Play
        // upload service's task route as its own method, so their analytics hooks come out at the same count.
        for (profile in controlProfiles.values) {
            assertEquals(BASE_PROFILE.hooks.keys, profile.hooks.keys)
            for (key in BASE_PROFILE.hooks.keys) {
                assertEquals(BASE_PROFILE.hooks.getValue(key).size, profile.hooks.getValue(key).size, key)
            }
            assertEquals(ExpectedTotals.HOOKS_587, profile.hooks.values.sumOf { it.size })
        }
        assertEquals(1, PROFILE_347415280.hooks.getValue(ANALYTICS_UPLOADS).count { it.endsWith("->run()V") })
        assertEquals(3, BASE_PROFILE.hooks.getValue(EMOJI_DRAWER).size)
    }

    @Test fun theVersionCodePicksTheProfile() {
        assertEquals(MessengerTarget.VERSION_CODES.toSet(), controlProfiles.keys)
        assertSame(PROFILE_347415354, BASE_PROFILE)
        for (code in listOf("347415354", "347215348", null)) assertSame(BASE_PROFILE, controlProfileFor(code))
        // The armv7 builds are the same release under other Redex names, so they get their own profile, never the base one.
        for (code in listOf("347415262", "347415295", "347415348")) assertSame(PROFILE_347415262, controlProfileFor(code))
        // So do the four arm64 builds from another Redex pass, which share one.
        for (code in listOf("347415280", "347415281", "347415284", "347415285")) assertSame(PROFILE_347415280, controlProfileFor(code))
        // And the two that carry the main build's code under other class names.
        for (code in listOf("347415302", "347415355")) assertSame(PROFILE_347415302, controlProfileFor(code))
        assertEquals(4, controlProfiles.values.distinct().size)
        val profiles = controlProfiles + (348000001 to SYNTHETIC_PROFILE)
        assertSame(SYNTHETIC_PROFILE, controlProfileFor("348000001", profiles))
        assertSame(BASE_PROFILE, controlProfileFor("347415354", profiles))
    }

    @Test fun aSecondVersionNameUsesItsOwnBuildsProfile() {
        val versions = MessengerTarget.VERSIONS + ("588.0.0.1.91" to listOf(348000001))
        val profiles = controlProfiles + (348000001 to SYNTHETIC_PROFILE)
        assertSame(SYNTHETIC_PROFILE, controlProfileFor("348000001", profiles))
        assertSame(BASE_PROFILE, controlProfileFor("347415354", profiles))
        val found = mapOf("ad_context_banner" to SYNTHETIC_PROFILE.hooks.getValue("ad_context_banner").map { id ->
            fixtureMethod(id, "const/4 v0, 0x0\nreturn v0")
        })
        activeProfile = controlProfileFor("348000001", profiles)
        validateControls(found, setOf("ad_context_banner"), versions)
        activeProfile = controlProfileFor("347415354", profiles)
        val failure = assertFailsWith<PatchException> { validateControls(found, setOf("ad_context_banner"), versions) }
        assertContains(failure.message.orEmpty(),
            "Use an unmodified Messenger ${MessengerTarget.supportedApks()} or 588.0.0.1.91 APK (version code 348000001).")
    }

    @Test fun validationFollowsTheActiveBuild() {
        fun found(ids: Set<String>) = mapOf("ad_context_banner" to ids.map { id ->
            fixtureMethod(id, "const/4 v0, 0x0\nreturn v0")
        })
        activeProfile = BASE_PROFILE
        val base = found(BASE_PROFILE.hooks.getValue("ad_context_banner"))
        val other = found(SYNTHETIC_PROFILE.hooks.getValue("ad_context_banner"))
        validateControls(base, setOf("ad_context_banner"))
        assertFailsWith<PatchException> { validateControls(other, setOf("ad_context_banner")) }
        activeProfile = SYNTHETIC_PROFILE
        validateControls(other, setOf("ad_context_banner"))
        assertFailsWith<PatchException> { validateControls(base, setOf("ad_context_banner")) }
    }

    @Test fun theSameClassesPassDiscoveryAndValidationOnlyForTheBuildTheyMatch() {
        val banner = pluginGates.getValue(AD_CONTEXT_BANNER).anchors.single()
        val gate = fixtureMethod(SYNTHETIC_AD_BANNER_GATE, pluginBody(banner))
        val classes = listOf(fixtureClass(gate.definingClass, listOf(gate)))
        for (profile in listOf(SYNTHETIC_PROFILE, BASE_PROFILE)) {
            activeProfile = profile
            val found = findControls(classes)
            assertEquals(BASE_PROFILE.hooks.keys, found.keys)
            assertEquals(listOf(SYNTHETIC_AD_BANNER_GATE), found.getValue(AD_CONTEXT_BANNER).map { it.hookId() })
            if (profile === SYNTHETIC_PROFILE) validateControls(found, setOf(AD_CONTEXT_BANNER))
            else assertFailsWith<PatchException> { validateControls(found, setOf(AD_CONTEXT_BANNER)) }
        }
    }

    private val builder = "Lcom/google/common/collect/ImmutableList${'$'}Builder;"
    private val addAll = "$builder->addAll(Ljava/lang/Iterable;)$builder"
    private val build = "LX/32c;->A00($builder)Lcom/google/common/collect/ImmutableList;"
    private val copy = "LX/35T;->A01(${builder}Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;"

    // Shaped like 587's BaseXappComposerConfigurationFactory.A0R, where one static call takes the fresh builder and the
    // local list, adds it all and builds, and the method returns the built list, as 583 did. [addAllCopy] is 584 to
    // 586's form instead: the builder's addAll, then a static build.
    private fun inlineTabs(
        extraCopy: Boolean = false,
        branchIntoCopy: Boolean = false,
        switchIntoCopy: Boolean = false,
        catchIntoCopy: Boolean = false,
        addAllCopy: Boolean = false,
        rangeCopy: Boolean = false,
        apart: Boolean = false,
        otherBuilder: Boolean = false,
    ) = fixtureMethod("$COMPOSER_FACTORY->A0S()$IMMUTABLE_LIST", """
            new-instance v12, Ljava/util/ArrayList;
            invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V
            const/4 v4, 0x0
            ${if (branchIntoCopy) "if-eqz v4, :copy" else "nop"}
            ${if (switchIntoCopy) "packed-switch v4, :cases" else "nop"}
            invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()$builder
            move-result-object v2
            :copy
            ${when {
                addAllCopy -> "invoke-virtual {v2, v12}, $addAll\ninvoke-static {v2}, $build"
                rangeCopy -> "move-object/from16 v3, v12\ninvoke-static/range {v2 .. v3}, $copy"
                apart -> "const/4 v4, 0x0\ninvoke-static {v2, v12}, $copy"
                otherBuilder -> "invoke-static {v12, v2}, $copy"
                else -> "invoke-static {v2, v12}, $copy"
            }}
            move-result-object v3
            ${if (extraCopy) "invoke-static {v2, v12}, $copy" else "nop"}
            sget-object v0, $AVATAR_TAB_EVENT->A00:$AVATAR_TAB_EVENT
            return-object v3
            ${if (switchIntoCopy) ":cases\n.packed-switch 0x1\n:copy\n.end packed-switch" else ""}
        """.trimIndent(), registers = 16).apply {
            // Instruction snippets carry no try blocks, so the handler is added directly.
            if (catchIntoCopy) implementation!!.run {
                val copyIndex = instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString() == copy }
                addCatch(newLabelForIndex(2), newLabelForIndex(4), newLabelForIndex(copyIndex))
            }
        }

    @Test fun anInlineTabListIsFilteredJustBeforeItsOneCopyAddsIt() {
        val method = inlineTabs()
        val copyIndex = method.implementation!!.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString() == copy
        }
        method.injectKeyboardTabsInline()
        val call = method.getInstruction(copyIndex)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals("$SETTINGS->removeAvatarTabs(Ljava/lang/Iterable;)V", (call as ReferenceInstruction).reference.toString())
        // The hook gets the Iterable (v12), not the Builder (v2).
        val range = call as com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
        assertEquals(12, range.startRegister)
        assertEquals(1, range.registerCount)
        assertEquals(copy, (method.getInstruction(copyIndex + 1) as ReferenceInstruction).reference.toString())
    }

    @Test fun anInlineTabListWithTwoCopiesOrAJumpIntoTheCopyIsRefused() {
        assertFailsWith<PatchException> { inlineTabs(extraCopy = true).injectKeyboardTabsInline() }
        assertFailsWith<PatchException> { inlineTabs(branchIntoCopy = true).injectKeyboardTabsInline() }
        assertFailsWith<PatchException> { inlineTabs(switchIntoCopy = true).injectKeyboardTabsInline() }
        assertFailsWith<PatchException> { inlineTabs(catchIntoCopy = true).injectKeyboardTabsInline() }
    }

    @Test fun a586TabListCopiedThroughAddAllIsRefused() {
        assertFailsWith<PatchException> { inlineTabs(addAllCopy = true).injectKeyboardTabsInline() }
    }

    @Test fun compatReportTakesTheTabListOnlyWhereThePatchCanFilterIt() {
        // The patch finds the method, then validates it just before its edit; CompatReport does both at discovery.
        fun takenBy(method: com.android.tools.smali.dexlib2.iface.Method): Pair<Boolean, Boolean> {
            val classes = listOf(fixtureClass(COMPOSER_FACTORY, listOf(method)))
            val found = mirroredControls(classes)["avatar_tabs"].orEmpty()
            val patch = found.size == 1 && runCatching { (found.single() as MutableMethod).validateKeyboardTabsInline() }.isSuccess
            return patch to CompatMirror.controls(classes).containsKey("avatar_tabs")
        }
        assertEquals(true to true, takenBy(inlineTabs()))
        for ((name, refused) in mapOf(
            "two copies" to inlineTabs(extraCopy = true), "a branch into the copy" to inlineTabs(branchIntoCopy = true),
            "a switch case into the copy" to inlineTabs(switchIntoCopy = true), "a catch into the copy" to inlineTabs(catchIntoCopy = true),
            "586's addAll" to inlineTabs(addAllCopy = true), "the range form" to inlineTabs(rangeCopy = true),
            "a copy apart from its builder" to inlineTabs(apart = true), "the builder in the list's place" to inlineTabs(otherBuilder = true),
        )) assertEquals(false to false, takenBy(refused), name)
    }
}
