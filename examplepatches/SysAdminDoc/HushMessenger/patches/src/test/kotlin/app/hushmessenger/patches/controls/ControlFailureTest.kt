package app.hushmessenger.patches.controls

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import java.nio.file.Path
import java.nio.file.Files
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
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
        for (broken in listOf(false, true)) withResourceContext(temporary.resolve("run-$broken")) { resources, config ->
            val anchor = pluginGates.getValue("people").anchors.single()
            val listEnd = pluginGates.getValue("people_list_end").anchors.single()
            // A supported APK supplies all six suggestion placements the control selects.
            val classes = listOf(
                fixtureMethod("LX/1pm;->A0C()Z", pluginBody(anchor)),
                fixtureMethod("LX/1pm;->A0B()Z", pluginBody(listEnd)),
                fixtureMethod("LX/2Wl;->A04()Z", pluginBody(anchor, if (broken) "if-ne" else "if-eq")),
                fixtureMethod("LX/2Wl;->A03()Z", pluginBody(listEnd)),
                peopleJewelMethod(),
                peopleTabMethod(),
                peopleTabFetchMethod(),
                peopleSearchMethod(),
                peopleStoryMethod(),
            ).groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) }
                .plus(peopleJewelKeyHolder()).plus(screenHostClasses()).toSet()
            val context = BytecodePatchContext::class.java.declaredConstructors.single()
                .newInstance(config, resources.packageMetadata) as BytecodePatchContext
            val patchClasses = Class.forName("app.morphe.patcher.util.PatchClasses")
            BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", patchClasses)
                .invoke(context, patchClasses.getConstructor(Set::class.java).newInstance(classes))
            context.use {
                feature.execute(resources)
                discovery.execute(context)
                try {
                    if (broken) assertFailsWith<PatchException> { hidePeoplePatch.execute(context) }
                    else hidePeoplePatch.execute(context)
                    feature.finalize(resources)
                    assertEquals(!broken, resources.hasPeopleFeature())
                    // A Root Mount install reads the same list from the patched code.
                    assertEquals(if (broken) emptySet() else setOf("people"), bundledControls.toSet())
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
