package app.hushmessenger.patches.controls

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Path
import java.nio.file.Files
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotSame
import kotlin.test.assertSame
import kotlin.test.assertTrue

class ControlFailureTest {
    @Test fun aLateGateFailurePreservesEveryMethodAfterRealDiscovery() {
        val anchor = pluginGates.getValue("people").anchors.single()
        val first = fixtureMethod("LX/1pm;->A0C()Z", pluginBody(anchor))
        val second = fixtureMethod("LX/2Wl;->A04()Z", pluginBody(anchor, "if-ne"))
        val found = findControls(listOf(fixtureClass(first.definingClass, listOf(first)),
            fixtureClass(second.definingClass, listOf(second))))
        validateControls(found, setOf("people"))
        val methods = found.getValue("people").map { it as MutableMethod }
        assertEquals(listOf(first.hookId(), second.hookId()), methods.map { it.hookId() })
        val before = methods.map { it.implementation!!.instructions.toList() }

        assertFailsWith<PatchException> { injectControl("people", mapOf("people" to methods)) }

        assertEquals(before, methods.map { it.implementation!!.instructions.toList() })
    }

    @Test fun resourceDependencyCannotAdvertiseAControlBeforeBytecodeSucceeds(@TempDir temporary: Path) {
        withResourceContext(temporary) { context, _ ->
            val feature = hidePeoplePatch.dependencies.filterIsInstance<ResourcePatch>().single()
            feature.execute(context)
            feature.finalize(context)
            assertEquals(false, context.hasPeopleFeature(), "A resource dependency advertised a control that never executed")
        }
    }

    @Test fun successfulControlStateDoesNotLeakIntoTheNextFailedRun(@TempDir temporary: Path) {
        val feature = hidePeoplePatch.dependencies.filterIsInstance<ResourcePatch>().single()
        val discovery = hidePeoplePatch.dependencies.filterIsInstance<BytecodePatch>().single()
        for (broken in listOf("none", "gate", "route")) withResourceContext(temporary.resolve("run-$broken")) { resources, config ->
            val anchor = pluginGates.getValue("people").anchors.single()
            val listEnd = pluginGates.getValue("people_list_end").anchors.single()
            // A supported APK supplies all six suggestion placements the control selects, and the chat list supplier.
            // An observer that no longer sets the listed count fails the whole control before any edit.
            val classes = listOf(
                fixtureMethod("LX/1pm;->A0C()Z", pluginBody(anchor)),
                fixtureMethod("LX/1pm;->A0B()Z", pluginBody(listEnd)),
                fixtureMethod("LX/2Wl;->A04()Z", pluginBody(anchor, if (broken == "gate") "if-ne" else "if-eq")),
                fixtureMethod("LX/2Wl;->A03()Z", pluginBody(listEnd)),
                peopleJewelMethod(),
                peopleTabMethod(),
                peopleTabFetchMethod(),
                peopleSearchMethod(),
                peopleStoryMethod(),
            ).groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) }
                .plus(peopleJewelKeyHolder()).plus(screenHostClasses())
                .plus(if (broken == "route") listOf(inboxSupplierClass(), inboxObserverClass(low = 0)) else inboxRefreshClasses()).toSet()
            val context = BytecodePatchContext::class.java.declaredConstructors.single()
                .newInstance(config, resources.packageMetadata) as BytecodePatchContext
            val patchClasses = Class.forName("app.morphe.patcher.util.PatchClasses")
            BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", patchClasses)
                .invoke(context, patchClasses.getConstructor(Set::class.java).newInstance(classes))
            context.use {
                feature.execute(resources)
                discovery.execute(context)
                try {
                    if (broken != "none") assertFailsWith<PatchException> { hidePeoplePatch.execute(context) }
                    else hidePeoplePatch.execute(context)
                    feature.finalize(resources)
                    assertEquals(broken == "none", resources.hasPeopleFeature())
                    // A Root Mount install reads the same list from the patched code.
                    assertEquals(if (broken != "none") emptySet() else setOf("people"), bundledControls.toSet())
                    val route = context.mutableClassDefBy(HOST_SCREENS).methods.single { it.hookId() == INBOX_REFRESH_ROUTE }
                    assertEquals(if (broken == "none") INBOX_ROUTE.toString() else "",
                        ((route.implementation!!.instructions.first() as ReferenceInstruction).reference as StringReference).string, broken)
                    val items = context.mutableClassDefBy(INBOX_SUPPLIER).methods.single { it.hookId() == INBOX_ITEMS_HOOK }
                    assertEquals(if (broken == "none") INBOX_ITEMS_CALL else INBOX_ITEMS_TRACE,
                        (items.implementation!!.instructions.first() as ReferenceInstruction).reference.let { (it as? StringReference)?.string ?: it.toString() }, broken)
                } finally {
                    discovery.finalize(context)
                }
            }
        }
    }

    @Test fun aMenuRowThatFailsIsNeverAdvertised(@TempDir temporary: Path) {
        val record = menuSettingsPatch.dependencies.filterIsInstance<ResourcePatch>().single()
        withResourceContext(temporary) { resources, config ->
            val context = BytecodePatchContext::class.java.declaredConstructors.single()
                .newInstance(config, resources.packageMetadata) as BytecodePatchContext
            context.use {
                record.execute(resources)
                discoveredControls = emptyMap()
                assertFailsWith<PatchException> { menuSettingsPatch.execute(context) }
                record.finalize(resources)
                assertEquals(false, resources.hasFeature("menu_row"), "A failed Menu row was advertised")
            }
        }
    }

    private fun ResourcePatchContext.hasPeopleFeature(): Boolean = hasFeature("people")

    @Test fun menuTargetsAreAtomicAcrossAllMappingGroups(@TempDir temporary: Path) {
        val originalProfile = activeProfile
        val record = menuSettingsPatch.dependencies.filterIsInstance<ResourcePatch>().single()
        val discovery = menuSettingsPatch.dependencies.filterIsInstance<BytecodePatch>().single()
        try {
            assertEquals(6, controlProfiles.values.distinct().size)
            for ((group, profile) in controlProfiles.values.distinct().withIndex()) {
                activeProfile = profile
                val ids = profile.hooks.getValue("menu_settings")
                for (broken in listOf("none", "add", "bind", "drawer", "click", "bind-registers", "drawer-registers",
                    "refresh-result", "row-store", "factory", "click-branch", "click-late-branch")) {
                    // The fifth mandatory target now needs complete native model contracts, not a MenuRow placeholder.
                    val classes = legacyDrawerFixture(profile, broken).classes.toSet()
                    withResourceContext(temporary.resolve("$group-$broken")) { resources, config ->
                        val context = BytecodePatchContext::class.java.declaredConstructors.single()
                            .newInstance(config, resources.packageMetadata) as BytecodePatchContext
                        val patchClasses = Class.forName("app.morphe.patcher.util.PatchClasses")
                        BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", patchClasses)
                            .invoke(context, patchClasses.getConstructor(Set::class.java).newInstance(classes))
                        context.use {
                            record.execute(resources)
                            discoveredControls = findControls(classes)
                            validateControls(discoveredControls, setOf("menu_settings"))
                            bundledControls.clear()
                            val targets = classes.flatMap { it.methods }.filter { it.hookId() in ids }
                            val allMethods = classes.flatMap { it.methods }.filter { it.implementation != null }
                            val originalFactory = classes.single { it.type == SETTINGS }.methods.single { it.hookId() == LEGACY_SECTION }
                            val before = allMethods.map { it.implementation!!.instructions.toList() }
                            if (broken == "none") {
                                menuSettingsPatch.execute(context)
                                assertTrue(targets.all { method -> method.implementation!!.instructions.any {
                                    (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                                        ?.reference.toString().startsWith("$SETTINGS->")
                                } })
                                // The stub is swapped for the generated factory in both method views the dex writer reads.
                                val settings = classes.single { it.type == SETTINGS }
                                val factory = settings.methods.single { it.hookId() == LEGACY_SECTION }
                                assertNotSame(originalFactory, factory, "$group stub")
                                assertEquals(11, factory.implementation!!.registerCount, "$group factory registers")
                                assertSame(factory, settings.directMethods.single { it.hookId() == LEGACY_SECTION })
                            } else {
                                assertFailsWith<PatchException>("$group $broken") { menuSettingsPatch.execute(context) }
                                assertEquals(before, allMethods.map { it.implementation!!.instructions.toList() }, "$group $broken")
                                assertSame(originalFactory, classes.single { it.type == SETTINGS }.methods.single { it.hookId() == LEGACY_SECTION })
                            }
                            record.finalize(resources)
                            assertEquals(broken == "none", resources.hasFeature("menu_row"))
                            assertEquals(if (broken == "none") setOf("menu_row") else emptySet(), bundledControls.toSet())
                        }
                    }
                }
            }
        } finally {
            activeProfile = originalProfile
            // Reset the shared run state as the real discovery dependency does.
            withResourceContext(temporary.resolve("reset")) { resources, config ->
                val context = BytecodePatchContext::class.java.declaredConstructors.single()
                    .newInstance(config, resources.packageMetadata) as BytecodePatchContext
                context.use { discovery.finalize(context) }
            }
        }
    }

    private fun ResourcePatchContext.hasFeature(key: String): Boolean = document("AndroidManifest.xml").use { document ->
        val metadata = document.getElementsByTagName("meta-data")
        (0 until metadata.length).any {
            (metadata.item(it) as Element).getAttribute("android:name") == "hush.feature.$key"
        }
    }

    private fun withResourceContext(temporary: Path, action: (ResourcePatchContext, PatcherConfig) -> Unit) {
        // processResources builds this small resource APK while producing the extension.
        val apk = Path.of("../extensions/messenger/build/intermediates/linked_resources_binary_format/release/" +
            "processReleaseResources/linked-resources-binary-format-release.ap_").toFile()
        assertTrue(apk.isFile, "The extension's compiled resource fixture is missing")
        val config = PatcherConfig(apk, temporary.toFile())
        // Use the real resource context without adding a coroutine dependency to the bundle.
        val context = ResourcePatchContext::class.java.getDeclaredConstructor(PatcherConfig::class.java)
            .newInstance(config)
        context.use {
            ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                .invoke(context, ResourceMode.RAW_ONLY)
            // This framework-only extension has no application resource package to decode.
            Files.writeString(temporary.resolve("apk/AndroidManifest.xml"),
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application /></manifest>""")
            action(context, config)
        }
    }
}
