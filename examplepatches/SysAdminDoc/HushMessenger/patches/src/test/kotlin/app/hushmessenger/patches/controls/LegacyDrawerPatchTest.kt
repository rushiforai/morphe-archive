package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class LegacyDrawerPatchTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun menuBinderRejectsHolderWritesBeforeAnyMutation() {
        for (write in listOf("const/4 p1, 0x0", "move-object p1, p0", "const-wide/16 p0, 0x0", "const-wide/16 p1, 0x0")) {
            val method = fixtureMethod("LX/Binder;->bind(Ljava/lang/Object;I)V", "$write\nreturn-void", registers = 5)
            val before = lifecycleDex(listOf(fixtureClass(method.definingClass, listOf(method))))
            assertFailsWith<PatchException>(write) { method.injectMenuSettingsBind() }
            assertTrue(before.contentEquals(lifecycleDex(listOf(fixtureClass(method.definingClass, listOf(method))))))
        }
        val method = fixtureMethod("LX/Binder;->bind(Ljava/lang/Object;I)V", """
            check-cast p1, Landroid/view/View;
            const/4 v0, 0x0
            if-eqz p2, :done
            invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V
            :done
            return-void
        """.trimIndent(), registers = 5)
        method.injectMenuSettingsBind()
        val code = method.implementation!!.instructions.toList()
        assertEquals("$SETTINGS->handleMenuItemBound(Ljava/lang/Object;)V", (code[code.branchTarget(2)] as ReferenceInstruction).reference.toString())
    }

    private fun plan(fixture: LegacyDrawerFixture, profile: ControlProfile): LegacyDrawerPlan {
        val ids = profile.hooks.getValue("menu_settings")
        return prepareLegacyDrawer(fixture.method(ids.single { it.endsWith("()V") }),
            fixture.method(ids.single { it.endsWith("Ljava/util/ArrayList;") }), fixture.resolve(SETTINGS)!!, fixture::resolve)
    }

    @Test fun factoryUsesFreshNativeModelsAndItsOwnCachedKeyAcrossAllFactoryMappings() {
        val profiles = controlProfiles.values.distinct()
        // 584.1's armv7 build makes the Settings icon in place; every other recorded build calls the icon's factory.
        assertEquals(setOf(false, true), profiles.map { legacyDrawerFixture(it).mapping.inlineIcon }.toSet())
        for (profile in profiles.filter { !legacyDrawerFixture(it).mapping.inlineIcon }) {
            val fixture = legacyDrawerFixture(profile)
            val before = fixture.methods.map { it.implementation?.instructions?.toList() }
            val prepared = plan(fixture, profile)
            assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, "Preflight edited a source")
            val code = prepared.factory.implementation!!.instructions.toList()
            val references = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            val allocations = code.filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.toString() }
            val glyph = fixture.mapping.glyph
            assertEquals(listOf(SETTINGS_KEY, DRAWER_METADATA, fixture.mapping.row, fixture.mapping.section), allocations)
            assertContains(references, fixture.mapping.iconFactory())
            assertContains(references, "$glyph->A65:$glyph")
            assertContains(references, "Ljava/util/Collections;->emptyMap()Ljava/util/Map;")
            assertContains(references, "Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;")
            assertContains(references, LEGACY_KEY_CACHE)
            assertFalse(references.any { it == "$SETTINGS_KEY->A00:$SETTINGS_KEY" }, "Factory reused Meta's singleton key")
            assertFalse(code.any { it.opcode == Opcode.IGET_OBJECT }, "Factory copied account or row data")
            assertEquals(11, prepared.factory.implementation!!.registerCount)
            assertEquals(LEGACY_SECTION, prepared.factory.hookId())
            assertEquals(7, prepared.refresh.fragment)
            assertEquals(0, prepared.refresh.sections)
            assertEquals(2, code.count { it.opcode == Opcode.INVOKE_DIRECT_RANGE })
        }
    }

    /** 584.1's 951 family calls G7K.A00, which lives on the icon's parent and returns a new G7P. */
    @Test fun anIconFactoryOnTheParentTypeIsAcceptedButNotOneOnAnUnrelatedClass() {
        for (profile in controlProfiles.values.distinct()) {
            if (legacyDrawerFixture(profile).mapping.inlineIcon) continue
            val onBase = legacyDrawerFixture(profile, iconFactoryOn = "base")
            val references = plan(onBase, profile).factory.implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            assertContains(references, onBase.mapping.iconFactory(onBase.mapping.iconBase))
            val unrelated = legacyDrawerFixture(profile, iconFactoryOn = "dispatcher")
            val before = unrelated.methods.map { it.implementation?.instructions?.toList() }
            assertFailsWith<PatchException> { plan(unrelated, profile) }
            assertEquals(before, unrelated.methods.map { it.implementation?.instructions?.toList() })
        }
        assertTrue(controlProfiles.values.distinct().any { legacyDrawerFixture(it).mapping.iconFactoryOnBase })
    }

    @Test fun anInlineSettingsIconUsesItsOwnConstructorAndKeepsTheFactoryUnused() {
        for (profile in controlProfiles.values.distinct()) {
            val fixture = legacyDrawerFixture(profile)
            if (!fixture.mapping.inlineIcon) continue
            val before = fixture.methods.map { it.implementation?.instructions?.toList() }
            val prepared = plan(fixture, profile)
            assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, "Preflight edited a source")
            val code = prepared.factory.implementation!!.instructions.toList()
            val references = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            val allocations = code.filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.toString() }
            assertEquals(listOf(fixture.mapping.icon, SETTINGS_KEY, DRAWER_METADATA, fixture.mapping.row, fixture.mapping.section), allocations)
            assertContains(references, "${fixture.mapping.icon}-><init>(${fixture.mapping.glyph}Lfixture/Color;)V")
            assertContains(references, "Lfixture/DrawerColor;->A0A:Lfixture/DrawerColor;")
            assertFalse(references.contains(fixture.mapping.iconFactory()))
            assertEquals(11, prepared.factory.implementation!!.registerCount)
        }
    }

    @Test fun refreshHookUsesTheConnectedResultAndFragmentRegisters() {
        val fixture = legacyDrawerFixture(SYNTHETIC_PROFILE)
        val id = SYNTHETIC_PROFILE.hooks.getValue("menu_settings").single { it.endsWith("->A1i()V") }
        val owner = fixture.resolve(id.substringBefore("->"))!!
        val original = fixture.method(id)
        val method = fixtureMethod(id, """
            const-string v4, "$DRAWER_REFRESH"
            invoke-interface {v3}, ${fixture.mapping.provider}->${fixture.mapping.getter}()Ljava/util/ArrayList;
            move-result-object v2
            iput-object v2, p0, ${owner.type}->A0G:Ljava/util/List;
            return-void
        """.trimIndent(), 12)
        owner.methods.remove(original)
        owner.methods.add(method)
        val prepared = plan(fixture, SYNTHETIC_PROFILE)
        assertEquals(LegacyDrawerRefresh(3, 11, 2), prepared.refresh)
        method.injectLegacyDrawer(prepared.refresh)
        val code = method.implementation!!.instructions.toList()
        val call = code[3] as FiveRegisterInstruction
        assertEquals(LEGACY_DRAWER_ADD, (call as ReferenceInstruction).reference.toString())
        assertEquals(11, call.registerC)
        assertEquals(2, call.registerD)
        assertEquals(2, (code[4] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IPUT_OBJECT, code[5].opcode)
    }

    @Test fun unsupportedNativeContractsAreRefusedWithoutEditingAnyMethod() {
        val common = listOf("refresh-result", "refresh-owner", "refresh-duplicate", "refresh-incoming", "refresh-registers",
            "provider", "fragment", "row-field", "row-store", "glyph",
            "key-constructor", "key-equality", "map-store", "section-store", "section-kind", "section-branch",
            "factory", "cache-helper", "append-helper")
        val factoryOnly = listOf("icon-origin", "icon-return", "icon-shared")
        val inlineOnly = listOf("inline-icon-missing-ctor", "inline-icon-constructor", "inline-icon-type", "inline-icon-color")
        for (profile in controlProfiles.values.distinct()) {
            val failures = common + if (legacyDrawerFixture(profile).mapping.inlineIcon) inlineOnly else factoryOnly
            for (broken in failures) {
            val fixture = legacyDrawerFixture(profile, broken)
            val before = fixture.methods.map { it.implementation?.instructions?.toList() }
            assertFailsWith<PatchException>(broken) { plan(fixture, profile) }
            assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, broken)
            }
        }
    }

    /** CompatReport's drawer preflight accepts what the patch accepts and refuses what it refuses, minus extension checks. */
    @Test fun compatReportRefusesTheDrawerContractsThePatchRefuses() {
        fun problems(fixture: LegacyDrawerFixture, profile: ControlProfile): List<String> {
            val ids = profile.hooks.getValue("menu_settings")
            val menu = listOf(fixture.method(ids.single { it.endsWith("()V") }), fixture.method(ids.single { it.endsWith("Ljava/util/ArrayList;") }))
            return app.hushmessenger.patches.CompatMirror.legacyDrawerProblems(fixture.classes, menu)
        }
        val common = listOf("refresh-result", "refresh-owner", "refresh-duplicate", "refresh-incoming", "refresh-registers",
            "provider", "fragment", "row-field", "row-store", "glyph",
            "key-constructor", "key-equality", "map-store", "section-store", "section-kind", "section-branch",
            "check-missing", "check-side-effect", "check-parameter", "check-access", "check-target") +
            listOf("row", "section", "icon", "map", "key").flatMap { kind -> listOf("$kind-abstract", "$kind-interface") }
        for (profile in controlProfiles.values.distinct()) {
            val inline = legacyDrawerFixture(profile).mapping.inlineIcon
            assertEquals(emptyList(), problems(legacyDrawerFixture(profile), profile), "$profile")
            if (!inline) {
                assertEquals(emptyList(), problems(legacyDrawerFixture(profile, iconFactoryOn = "base"), profile), "$profile base")
                assertTrue(problems(legacyDrawerFixture(profile, iconFactoryOn = "dispatcher"), profile).isNotEmpty(), "$profile dispatcher")
            }
            val variants = common + if (inline) listOf("inline-icon-missing-ctor", "inline-icon-constructor", "inline-icon-type", "inline-icon-color")
                else listOf("icon-origin", "icon-return", "icon-shared")
            for (broken in variants) {
                // The patch's refusal for the same fixture, so a variant only it refuses for an extension reason can't slip in.
                assertFailsWith<PatchException>(broken) { plan(legacyDrawerFixture(profile, broken), profile) }
                val found = problems(legacyDrawerFixture(profile, broken), profile)
                assertTrue(found.isNotEmpty() && found.all { it.startsWith("legacy drawer ") }, "$broken: $found")
            }
        }
    }

    @Test fun incomingCatchHandlerAtTheRefreshStoreIsRefused() {
        val fixture = legacyDrawerFixture(SYNTHETIC_PROFILE)
        val id = SYNTHETIC_PROFILE.hooks.getValue("menu_settings").single { it.endsWith("->A1i()V") }
        fixture.method(id).implementation!!.apply {
            val store = instructions.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT }
            addCatch(newLabelForIndex(0), newLabelForIndex(1), newLabelForIndex(store))
        }
        assertFailsWith<PatchException> { plan(fixture, SYNTHETIC_PROFILE) }
    }

    @Test fun changedConstructorChecksAreRejectedBeforeAnyMenuEdits() {
        for (profile in controlProfiles.values.distinct()) for (broken in listOf(
            "check-missing", "check-side-effect", "check-parameter", "check-access", "check-target",
        )) {
            val fixture = legacyDrawerFixture(profile, broken)
            val before = fixture.methods.map { it.implementation?.instructions?.toList() }
            assertFailsWith<PatchException>(broken) { plan(fixture, profile) }
            assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, broken)
        }
    }

    @Test fun allocatedModelsMustBeConcreteWhileTheKeyBaseCanRemainAbstract() {
        for (profile in controlProfiles.values.distinct()) {
            plan(legacyDrawerFixture(profile), profile)
            for (kind in listOf("row", "section", "icon", "map", "key")) for (flag in listOf("abstract", "interface")) {
                val fixture = legacyDrawerFixture(profile, "$kind-$flag")
                val before = fixture.methods.map { it.implementation?.instructions?.toList() }
                assertFailsWith<PatchException>("$kind-$flag") { plan(fixture, profile) }
                assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, "$kind-$flag")
            }
        }
    }

    @Test fun clickHookMustDominateNativeRowHandlingBeyondTheTraceMarker() {
        for (profile in controlProfiles.values.distinct()) {
            val fixture = legacyDrawerFixture(profile, "click-late-branch")
            val click = fixture.method(profile.hooks.getValue("menu_settings").single { it.contains("onClick") })
            val before = click.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { click.menuFolderCastIndex(fixture.mapping.row) }
            assertEquals(before, click.implementation!!.instructions.toList())
        }
    }

    @Test fun legacyRefreshIsMandatoryAndLookalikesCannotReplaceItsRecordedId() {
        val fixture = legacyDrawerFixture(SYNTHETIC_PROFILE)
        activeProfile = SYNTHETIC_PROFILE
        validateControls(mirroredControls(fixture.classes), setOf("menu_settings"))
        val owner = fixture.resolve("LX/9rv;")!!
        owner.methods.remove(fixture.method("LX/9rv;->A1i()V"))
        owner.methods.add(fixtureMethod("LX/9rv;->lookalike()V", "const-string v0, \"$DRAWER_REFRESH\"\nreturn-void"))
        val found = mirroredControls(fixture.classes)
        assertTrue(found.getValue("menu_settings").any { it.name == "lookalike" })
        assertFailsWith<PatchException> { validateControls(found, setOf("menu_settings")) }
    }
}
