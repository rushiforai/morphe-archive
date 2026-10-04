/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.storiestray

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.hook.EDGE_SWAP_DROPPED
import app.morphe.patches.facebook.feed.hook.feedFilterHookPatch
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.shared.AddNewEdgeToCollectionFingerprint
import app.morphe.patches.facebook.shared.FEED_UNIT_EDGE
import app.morphe.patches.facebook.shared.admittedAsFeedFunnel
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The two Stories tray adapter methods, found in every Facebook build the bundle declares the way
 * the patch finds them, each with a local register free for the hook. The tray controller's own
 * setup, which holds the start and stop names too, is there and is not picked: its constructor on
 * 577 and 580, and on 581 a private method taking the constructor's parameters. Reads the
 * fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class StoriesTrayAdapterFixtureTest {
    /** The classic and unified tray adapters of [bundle], as the patch picks them, and their class. */
    private class TrayAdapters(val classic: Method, val unified: Method, val configuration: ClassDef)

    private fun trayAdapters(bundle: File): TrayAdapters {
        val classic = FixtureDex.classesHolding(bundle, ADD_STORIES_ADAPTER).flatMap(::legacyTrayAdapters)
        assertEquals("${bundle.name}: ${classic.map { it.toString() }}", 1, classic.size)
        val configuration = FixtureDex.classes(bundle, setOf(classic.single().definingClass))
            .getValue(classic.single().definingClass)
        val unified = unifiedTrayAdapters(configuration)
        assertEquals("${bundle.name}: ${unified.map { it.toString() }}", 1, unified.size)
        return TrayAdapters(classic.single(), unified.single(), configuration)
    }

    /** Every declared build's bundles, each handed to [check], which says what it checked. */
    private fun forEveryDeclaredBuild(check: (File) -> String) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                checked[version] = check(bundle)
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions.toSet(), checked.keys)
    }

    @Test
    fun `every declared build has one classic and one unified tray adapter, in one class`() {
        forEveryDeclaredBuild { bundle ->
            val adapters = trayAdapters(bundle)
            for (adapter in listOf(adapters.classic, adapters.unified)) {
                val implementation = adapter.implementation!!
                val locals = implementation.registerCount - adapter.parameterTypes.size
                assertTrue("${bundle.name}: $adapter has no local for the hook", locals >= 1)
            }

            // The control: the start name sits in more methods than the one picked, the tray
            // controller's setup among them, which takes the context, the feed type and the
            // session (its constructor on 577 and 580, a private method on 581).
            val holdingStart = FixtureDex.classesHolding(bundle, TRAY_ADAPTER_START)
                .flatMap { methodsHolding(it, TRAY_ADAPTER_START) }
            assertTrue("${bundle.name}: only ${holdingStart.size} method holds \"$TRAY_ADAPTER_START\"",
                holdingStart.size >= 2)
            val picked = setOf(adapters.classic.toString(), adapters.unified.toString())
            val setup = holdingStart.filter { it.toString() !in picked }
            assertTrue("${bundle.name}: no tray setup holds \"$TRAY_ADAPTER_START\" to tell apart", setup.any {
                it.parameterTypes.map(Any::toString) == listOf(
                    "Landroid/content/Context;",
                    "Lcom/facebook/api/feedtype/FeedType;",
                    "Lcom/facebook/auth/usersession/FbUserSession;",
                )
            })
            "${adapters.classic} and ${adapters.unified}"
        }
    }

    /**
     * Why the switch waits for a restart: on every declared build, the one method holding the
     * createAdapter trace name calls both tray adapters and returns first thing while the list it
     * built before is still there. A build that rebuilds the list on a refresh fails here, and the
     * settings row and README wording is the thing to revisit.
     */
    @Test
    fun `every declared build asks the tray adapters from a list it builds once per feed view`() {
        forEveryDeclaredBuild { bundle ->
            val adapters = trayAdapters(bundle)
            val builders = FixtureDex.classesHolding(bundle, CREATE_ADAPTER).flatMap { methodsHolding(it, CREATE_ADAPTER) }
            assertEquals("${bundle.name}: ${builders.map { it.toString() }}", 1, builders.size)
            assertTrue("${bundle.name}: ${builders.single()} doesn't keep the list it built",
                buildsListOnce(builders.single(), listOf(adapters.classic, adapters.unified)))
            builders.single().toString()
        }
    }

    /** The actual patch blocks run over each fixture's methods without compiling an APK. */
    @Test
    fun `every declared build keeps one feed guard and a separate guard on each top tray adapter`() {
        val hideEdge = "Lapp/morphe/extension/facebook/feed/FeedFilter;->hideEdge(Ljava/lang/Object;Ljava/lang/Object;)Z"
        forEveryDeclaredBuild { bundle ->
            val adapters = trayAdapters(bundle)
            val funnels = FixtureDex.methodsWhere(bundle,
                { dex -> dex.stringSection.any { it == "addNewEdgeToCollection" } },
            ) { admittedAsFeedFunnel(it) }
            assertEquals("${bundle.name}: feed funnels", 1, funnels.size)
            val classes = FixtureDex.classes(bundle, setOf(FEED_UNIT_EDGE, funnels.single().definingClass)).values +
                FixtureDex.classesHolding(bundle, EDGE_SWAP_DROPPED) + adapters.configuration + status()
            val context = PatchContexts.of(classes)
            AddNewEdgeToCollectionFingerprint.clearMatch()
            feedFilterHookPatch.execute(context)
            hideStoriesTrayPatch.execute(context)

            fun calls(method: Method, target: String) = method.implementation!!.instructions.count {
                (it as? ReferenceInstruction)?.reference?.toString() == target
            }
            val feed = context.mutableClassDefBy(funnels.single().definingClass).methods.single {
                it.name == "addNewEdgeToCollection" && it.parameterTypes == funnels.single().parameterTypes
            }
            assertEquals("${bundle.name}: feed guard count", 1, calls(feed, hideEdge))
            val tray = context.mutableClassDefBy(adapters.configuration.type).methods
            for (adapter in listOf(adapters.classic, adapters.unified)) {
                val patched = tray.single { it.name == adapter.name && it.parameterTypes == adapter.parameterTypes }
                assertEquals("${bundle.name}: $adapter top guard count", 1, calls(patched, HIDE_STORIES_TRAY))
                assertEquals("${bundle.name}: the tray adapter got a feed guard", 0, calls(patched, hideEdge))
            }
            "one feed guard, one classic and one unified top-tray guard"
        }
    }

    private fun status(): ClassDef = ImmutableClassDef(
        SETTINGS_STATUS, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
        listOf(ImmutableMethod(SETTINGS_STATUS, "storiesTray", emptyList(), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(1, listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                ImmutableInstruction11x(Opcode.RETURN, 0)), null, null))),
    )
}
