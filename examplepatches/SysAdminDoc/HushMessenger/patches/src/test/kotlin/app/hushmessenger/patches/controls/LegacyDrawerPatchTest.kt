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
    @AfterTest fun reset() { activeProfile = BASE_PROFILE }

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

    @Test fun factoryUsesFreshNativeModelsAndItsOwnCachedKeyAcrossAllMappings() {
        for (profile in controlProfiles.values.distinct()) {
            val fixture = legacyDrawerFixture(profile)
            val before = fixture.methods.map { it.implementation?.instructions?.toList() }
            val prepared = plan(fixture, profile)
            assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, "Preflight edited a source")
            val code = prepared.factory.implementation!!.instructions.toList()
            val references = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            val allocations = code.filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.toString() }
            assertEquals(listOf(SETTINGS_KEY, DRAWER_METADATA, fixture.mapping.row, fixture.mapping.section), allocations)
            assertContains(references, "${fixture.mapping.icon}->A00(${fixture.mapping.glyph})${fixture.mapping.icon}")
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

    @Test fun refreshHookUsesTheConnectedResultAndFragmentRegisters() {
        val fixture = legacyDrawerFixture(BASE_PROFILE)
        val id = BASE_PROFILE.hooks.getValue("menu_settings").single { it.endsWith("->A1i()V") }
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
        val prepared = plan(fixture, BASE_PROFILE)
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
        val failures = listOf("refresh-result", "refresh-owner", "refresh-duplicate", "refresh-incoming", "refresh-registers",
            "provider", "fragment", "row-field", "row-store", "icon-origin", "glyph", "icon-return", "icon-shared",
            "key-constructor", "key-equality", "map-store", "section-store", "section-kind", "section-branch",
            "factory", "cache-helper", "append-helper")
        for (profile in controlProfiles.values.distinct()) for (broken in failures) {
            val fixture = legacyDrawerFixture(profile, broken)
            val before = fixture.methods.map { it.implementation?.instructions?.toList() }
            assertFailsWith<PatchException>(broken) { plan(fixture, profile) }
            assertEquals(before, fixture.methods.map { it.implementation?.instructions?.toList() }, broken)
        }
    }

    @Test fun incomingCatchHandlerAtTheRefreshStoreIsRefused() {
        val fixture = legacyDrawerFixture(BASE_PROFILE)
        val id = BASE_PROFILE.hooks.getValue("menu_settings").single { it.endsWith("->A1i()V") }
        fixture.method(id).implementation!!.apply {
            val store = instructions.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT }
            addCatch(newLabelForIndex(0), newLabelForIndex(1), newLabelForIndex(store))
        }
        assertFailsWith<PatchException> { plan(fixture, BASE_PROFILE) }
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
        val fixture = legacyDrawerFixture(BASE_PROFILE)
        activeProfile = BASE_PROFILE
        validateControls(findControls(fixture.classes), setOf("menu_settings"))
        val owner = fixture.resolve("LX/9rv;")!!
        owner.methods.remove(fixture.method("LX/9rv;->A1i()V"))
        owner.methods.add(fixtureMethod("LX/9rv;->lookalike()V", "const-string v0, \"$DRAWER_REFRESH\"\nreturn-void"))
        val found = findControls(fixture.classes)
        assertTrue(found.getValue("menu_settings").any { it.name == "lookalike" })
        assertFailsWith<PatchException> { validateControls(found, setOf("menu_settings")) }
    }
}
