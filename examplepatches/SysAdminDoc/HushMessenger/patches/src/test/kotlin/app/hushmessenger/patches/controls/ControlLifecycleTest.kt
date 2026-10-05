package app.hushmessenger.patches.controls

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherContext
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatchContext
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import java.nio.file.Path
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull

class ControlLifecycleTest {
    private data class Selection(
        val name: String,
        val patches: Set<Patch<*>>,
        val keys: Set<String>,
        val failed: BytecodePatch? = null,
    )

    @Test fun visibleSelectionsFinalizeExactCapabilitiesAcrossFailuresAndFreshContexts(@TempDir temporary: Path) {
        val extension = lifecycleExtension()
        val extensionTypes = DexBackedDexFile.fromInputStream(Opcodes.forApi(28), ByteArrayInputStream(extension))
            .classes.map { it.type }.toSet()
        val selections = listOf(
            Selection("menu-people", setOf(menuSettingsPatch, hidePeoplePatch), setOf("menu_row", "people")),
            Selection("menu-theme", setOf(menuSettingsPatch, materialYouPatch), setOf("menu_row", "material_you")),
            // People executes first by name; its successful edits must survive the later menu failure.
            Selection("failed-menu", setOf(menuSettingsPatch, hidePeoplePatch), setOf("people"), menuSettingsPatch),
            Selection("failed-people", setOf(menuSettingsPatch, hidePeoplePatch), setOf("menu_row"), hidePeoplePatch),
            Selection("theme-only", setOf(materialYouPatch), setOf("material_you")),
            Selection("changed-viewer", setOf(hidePeoplePatch), setOf("people")),
            Selection("changed-community", setOf(hidePeoplePatch), setOf("people")),
        )
        for (selection in selections) {
            val native = lifecycleClasses(selection.failed === menuSettingsPatch, selection.failed === hidePeoplePatch).toMutableList()
            if (selection.name == "changed-viewer") native += fixtureClass(EPHEMERAL_VIEWER, listOf(
                fixtureMethod("$EPHEMERAL_VIEWER->onResume()V", "return-void")))
            if (selection.name == "changed-community") {
                val community = communityInboxFixture()
                val contract = assertNotNull(findCommunityInbox(community))
                val changed = community.single { it.type == contract.requests.substringBefore("->") }
                changed.methods.removeIf { it.name == "<clinit>" }
                changed.directMethods.removeIf { it.name == "<clinit>" }
                native += community.filter { candidate -> native.none { it.type == candidate.type } }
            }
            val apk = lifecycleApk(temporary.resolve("input-${selection.name}"), native)
            withLifecycleExtension(extension) { extensionReads ->
                // Patcher initialization deletes its temporary root, which must not contain the input APK.
                Patcher(PatcherConfig(apk, temporary.resolve("patcher-${selection.name}").toFile(),
                    useBytecodeMode = BytecodeMode.FULL)).use { patcher ->
                    patcher += selection.patches
                    val results = collectLifecycle(patcher)
                    assertEquals(selection.patches, results.map { it.patch }.toSet(), selection.name)
                    assertEquals(selection.patches.size, results.size, selection.name)
                    for (result in results) {
                        if (result.patch === selection.failed) assertNotNull(result.exception, selection.name)
                        else assertNull(result.exception, "${selection.name}: ${result.exception?.stackTraceToString()}")
                    }
                    assertEquals(1, extensionReads(), "${selection.name}: extension stream reads")
                    val resources = PatcherContext::class.java.getMethod("getResourceContext\$morphe_patcher")
                        .invoke(patcher.context) as ResourcePatchContext
                    val bytecode = PatcherContext::class.java.getMethod("getBytecodeContext\$morphe_patcher")
                        .invoke(patcher.context) as BytecodePatchContext
                    resources.document("AndroidManifest.xml").use { assertCapabilities(it, selection) }
                    val classes = mutableListOf<ClassDef>().also { list -> bytecode.classDefForEach { list.add(it) } }
                    assertPatchedClasses(classes, native, extensionTypes, selection)
                    for (key in selection.keys) for (type in targetTypes(key)) {
                        assertFalse(lifecycleDex(listOf(native.single { it.type == type })).contentEquals(
                            lifecycleDex(listOf(classes.single { it.type == type }))), "${selection.name}: $type was not patched")
                    }
                    selection.failed?.let { failed ->
                        val key = if (failed === menuSettingsPatch) "menu_row" else "people"
                        for (type in targetTypes(key)) assertContentEquals(
                            lifecycleDex(listOf(native.single { it.type == type })),
                            lifecycleDex(listOf(classes.single { it.type == type })), "${selection.name}: failed target $type")
                    }
                    // Exercise the writer too: final output must retain the same capabilities and unique helpers.
                    val output = patcher.get()
                    val compiled = output.dexFiles.flatMap { file ->
                        file.stream.buffered().use { DexBackedDexFile.fromInputStream(Opcodes.forApi(28), it).classes.toList() }
                    }
                    if (selection.name.startsWith("changed-")) for (cls in native.filter { it.type !in targetTypes("people") &&
                        it.type !in setOf(FACTORY_TYPE, SCREEN_HOST, SHORTCUT_HOST) }) {
                        assertContentEquals(lifecycleDex(listOf(cls)), lifecycleDex(listOf(compiled.single { it.type == cls.type })),
                            "${selection.name}: unrelated target ${cls.type}")
                    }
                    assertPatchedClasses(compiled, native, extensionTypes, selection)
                    assertCapabilities(lifecycleManifest(assertNotNull(output.resources.resourcesApk)), selection)
                }
            }
        }
    }

    private fun targetTypes(key: String): Set<String> = when (key) {
        "menu_row" -> BASE_PROFILE.hooks.getValue("menu_settings").map { it.substringBefore("->") }.toSet()
        "people" -> listOf("people", "people_list_end", "people_jewel", "people_tab", "people_search", "people_story")
            .flatMap { BASE_PROFILE.hooks.getValue(it) }.map { it.substringBefore("->") }.toSet()
        "material_you" -> setOf(DARK_SCHEME, FDS_COLORS, "LX/DarkCheck;", "LX/ThemeColors;")
        else -> error("Unexpected fixture control $key")
    }

    private fun assertCapabilities(document: Document, selection: Selection) {
        val metadata = document.getElementsByTagName("meta-data")
        val features = (0 until metadata.length).map { metadata.item(it) as Element }
            .filter { it.getAttribute("android:name").startsWith("hush.feature.") }
        assertEquals(selection.keys.map { "hush.feature.$it" }.sorted(),
            features.map { it.getAttribute("android:name") }.sorted(), selection.name)
        assertEquals(List(features.size) { "true" }, features.map { it.getAttribute("android:value") }, selection.name)
        fun count(tag: String, name: String): Int = document.getElementsByTagName(tag).let { nodes ->
            (0 until nodes.length).count { (nodes.item(it) as Element).getAttribute("android:name") == name }
        }
        assertEquals(1, count("provider", "app.hushmessenger.extension.SettingsProvider"), selection.name)
        assertEquals(1, count("activity", "app.hushmessenger.extension.SettingsActivity"), selection.name)
        assertEquals(1, count("activity", "app.hushmessenger.extension.RestartActivity"), selection.name)
        assertEquals(1, count("activity-alias", "app.hushmessenger.extension.SettingsLauncher"), selection.name)
    }

    private fun assertPatchedClasses(classes: List<ClassDef>, native: List<ClassDef>, extensionTypes: Set<String>, selection: Selection) {
        val types = classes.map { it.type }
        assertEquals(types.size, types.toSet().size, "${selection.name}: duplicate class")
        assertEquals(native.map { it.type }.toSet() + extensionTypes, types.toSet(), selection.name)
        val host = classes.single { it.type == HOST_SCREENS }
        val controls = host.methods.single { it.hookId() == BUNDLED_CONTROLS }
        assertEquals(selection.keys.sorted().joinToString(","),
            ((controls.implementation!!.instructions.first() as ReferenceInstruction).reference as StringReference).string,
            "${selection.name}: finalized bundled controls")
        val factory = classes.single { it.type == FACTORY_TYPE }
        for ((method, call) in mapOf(
            INSTANTIATE_ACTIVITY to "$HOST_SCREENS->activityFor(Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;",
            INSTANTIATE_APPLICATION to "$HOST_SCREENS->applicationCreated(Landroid/app/Application;)V",
        )) assertEquals(1, factory.methods.single { it.hookId() == method }.implementation!!.instructions.count {
            (it as? ReferenceInstruction)?.reference.toString() == call
        }, "${selection.name}: single $call injection")
        val settings = classes.single { it.type == SETTINGS }
        assertEquals(1, settings.methods.count { it.hookId() == LEGACY_SECTION }, selection.name)
        assertEquals(1, settings.directMethods.count { it.hookId() == LEGACY_SECTION }, selection.name)
    }
}
