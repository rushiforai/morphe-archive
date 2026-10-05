/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.shared.misc.extension

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.nio.ByteBuffer

class BuildIdentityFixtureTest {
    @Test fun `packaged runtime readers still call the injected stub`() {
        val callers = mutableSetOf<String>()
        val overview = "Lapp/morphe/extension/facebook/settings/HushfacebookPreferenceFragment;"
        val navigation = "Lapp/morphe/extension/facebook/settings/SettingsNavigation;"
        var overviewReadsIdentity = false
        var navigationUsesOverview = false
        for (payload in listOf("shared", "facebook")) {
            val bytes = javaClass.classLoader.getResourceAsStream("extensions/$payload.mpe")!!.use { it.readBytes() }
            for (clazz in DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).classes) {
                for (method in clazz.methods) {
                    val implementation = method.implementation ?: continue
                    for (instruction in implementation.instructions) {
                        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                        if (ref.definingClass == EXTENSION_CLASS_DESCRIPTOR && ref.name == "getPatchesBuildIdentity") {
                            callers += clazz.type
                            if (clazz.type == overview && method.name == "overviewBuildDetails") overviewReadsIdentity = true
                        }
                        if (clazz.type == navigation && ref.definingClass == overview && ref.name == "overviewBuildDetails") {
                            navigationUsesOverview = true
                        }
                    }
                }
            }
        }
        for (reader in listOf("Lapp/morphe/extension/facebook/settings/HushfacebookPreferenceFragment;",
                "Lapp/morphe/extension/facebook/settings/HushfacebookPages;",
                "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;")) {
            assertTrue("Identity call was optimized away in $reader: $callers", reader in callers)
        }
        // The compact card shares its formatter with recovery states; R8 may retain or inline it.
        assertTrue("Navigation lost its path to the injected identity", navigation in callers
                || (navigationUsesOverview && overviewReadsIdentity))
    }

    @Test fun `every declared fixture keeps the injected identity through DEX serialization`() {
        val bytes = javaClass.classLoader.getResourceAsStream("extensions/shared.mpe")!!.use { it.readBytes() }
        val utils = DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).classes
            .single { it.type == EXTENSION_CLASS_DESCRIPTOR }
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        val host = "Lcom/facebook/base/activity/FbFragmentActivity;"
        val values = listOf("unknown", "unverified",
            "sha256=${"1".repeat(64)}; source=dirty:${"2".repeat(40)}; tree=${"3".repeat(40)}; inputs=${"4".repeat(64)}")
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(fixture, setOf(host))
                assertTrue("${fixture.name}: missing real host class", host in classes)
                for (value in values) {
                    val context = PatchContexts.of(classes.values + utils)
                    context.injectBuildIdentity(value)
                    val modified = context.mutableClassDefBy(EXTENSION_CLASS_DESCRIPTOR)
                    val store = MemoryDataStore()
                    val pool = DexPool(Opcodes.getDefault())
                    pool.internClass(modified)
                    pool.writeTo(store)
                    val roundTrip = DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(store.data))
                        .classes.single { it.type == EXTENSION_CLASS_DESCRIPTOR }
                        .methods.single { it.name == "getPatchesBuildIdentity" }
                    val constant = roundTrip.implementation!!.instructions.first() as ReferenceInstruction
                    assertEquals("${fixture.name}: injected value", value, (constant.reference as StringReference).string)
                    store.close()
                }
                checked += version
            }
        }
        assertEquals("missing supported fixture", versions, checked)
    }
}
