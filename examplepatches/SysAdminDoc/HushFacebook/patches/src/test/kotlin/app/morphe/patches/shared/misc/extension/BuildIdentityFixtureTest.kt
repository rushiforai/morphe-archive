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
        for (payload in listOf("shared", "facebook")) {
            val bytes = javaClass.classLoader.getResourceAsStream("extensions/$payload.mpe")!!.use { it.readBytes() }
            for (clazz in DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).classes) {
                for (method in clazz.methods) {
                    if (method.implementation?.instructions?.any {
                        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.definingClass == EXTENSION_CLASS_DESCRIPTOR && ref.name == "getPatchesBuildIdentity"
                    } == true) callers += clazz.type
                }
            }
        }
        for (reader in listOf("Lapp/morphe/extension/facebook/settings/HushfacebookPreferenceFragment;",
                "Lapp/morphe/extension/facebook/settings/SettingsNavigation;",
                "Lapp/morphe/extension/facebook/settings/HushfacebookPages;",
                "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;")) {
            assertTrue("Identity call was optimized away in $reader: $callers", reader in callers)
        }
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
