package patches.eclipse

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import patches.eclipse.StubApp.withFlags
import patches.eclipse.StubApp.withSuperclass
import patches.eclipse.StubApp.withoutField
import patches.eclipse.StubApp.withoutMethod
import patches.shared.stubTypeToAppType

class ExtensionRelocationTest {
    @Test fun stubsMapToTheAppsDefaultPackage() {
        assertEquals("Ljh0;", stubTypeToAppType(STUB_NAMESPACE, "Lnl/johninnl/eclipse/app/jh0;"))
        assertEquals("Ly0c;", stubTypeToAppType(STUB_NAMESPACE, "Lnl/johninnl/eclipse/app/y0c;"))
        assertEquals("Lj62\$a;", stubTypeToAppType(STUB_NAMESPACE, "Lnl/johninnl/eclipse/app/j62\$a;"))
    }

    @Test fun typesOutsideTheStubNamespaceAreLeftAlone() {
        for (type in listOf("Lcom/eclipse/android/core/audio/PlaybackService;",
            "Landroid/support/v4/media/session/MediaSessionCompat\$Token;",
            "Lnl/johninnl/eclipse/auto/app/AppBridge;", "Ljava/lang/String;", "I")) {
            assertNull(type, stubTypeToAppType(STUB_NAMESPACE, type))
        }
    }

    @Test fun stubSubpackagesAreRefused() {
        assertThrows(IllegalArgumentException::class.java) {
            stubTypeToAppType(STUB_NAMESPACE, "Lnl/johninnl/eclipse/app/sub/jh0;")
        }
    }

    private fun references(cls: ClassDef): Set<String> = cls.methods.flatMap { method ->
        (method.implementation?.instructions ?: emptyList()).mapNotNull { (it as? ReferenceInstruction)?.reference }
    }.mapNotNull {
        when (it) {
            is MethodReference -> ReferenceUtil.getMethodDescriptor(it)
            is FieldReference -> ReferenceUtil.getFieldDescriptor(it)
            else -> null
        }
    }.toSet()

    private fun extensionClasses(): List<ClassDef> =
        DexBackedDexFile.fromInputStream(null, eclipseExtension().bytes.inputStream()).classes.toList()

    @Test fun theBuiltExtensionReferencesTheAppsRealClassesAndNoStubSurvives() {
        val extension = eclipseExtension()
        val classes = extensionClasses()
        assertTrue(extension.types.all { it.startsWith("Landroidx/car/app/") || it.startsWith(EXTENSION_NAMESPACE) })
        // Neither a stub nor the app's own compat token ships in the extension.
        assertFalse(extension.types.any { it.startsWith(STUB_NAMESPACE) || it.startsWith("Lcom/eclipse/") })
        assertFalse("MediaSessionCompat\$Token must stay the app's own class",
            extension.types.any { it.contains("MediaSessionCompat") })
        for (needed in listOf("EclipseCarAppService", "EclipseCarSession", "MediaLink", "screens/RootScreen",
            "screens/PlayerScreen", "screens/CollectionScreen", "screens/QueueScreen", "screens/SearchScreen", "app/AppBridge",
            "app/Suspend", "app/Signals", "data/Catalog", "data/ComposeClient", "data/ComposeCache", "data/SearchModel",
            "data/HomeBuilder", "data/HomeLayout", "tree/BrowseTree", "tree/TreeModel", "tree/MediaIds", "tree/Paging",
            "app/TreeBridge", "app/TreeRuntime", "app/PendingResult")) {
            assertTrue(needed, "Lnl/johninnl/eclipse/auto/$needed;" in extension.types)
        }
        assertTrue(classes.flatMap { references(it) }.none { "nl/johninnl/eclipse/app/" in it })
        // The bridge's anonymous Runnables hold the mutating calls, so read the whole AppBridge family.
        val bridge = classes.filter { it.type.startsWith("Lnl/johninnl/eclipse/auto/app/AppBridge") }.flatMap { references(it) }.toSet()
        for (expected in listOf("Ljh0;->K0:Ly0c;", "Ly0c;->p(Landroid/content/Context;)Ljh0;",
            "Lle8;->x:Lry6;", "Lry6;->u(Landroid/content/Context;)Lle8;", "Lle8;->E(I)V", "Lle8;->A(I)V", "Lle8;->f()V",
            "Ljh0;->K(Z)V", "Ljh0;->O(Lcom/eclipse/android/data/models/Song;)V",
            "Ljh0;->P(Ljava/util/List;ILke8;)V", "Lhe8;->e:Lhe8;", "Lvi8;->getValue()Ljava/lang/Object;",
            "Lcom/eclipse/android/core/audio/CarArtworkProvider;->q:Lz0c;",
            "Lz0c;->B(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;",
            "Lcom/eclipse/android/core/audio/PlaybackService;->I:Lw06;",
            "Landroid/support/v4/media/session/MediaSessionCompat\$Token;-><init>(Landroid/os/Parcelable;Landroid/support/v4/media/session/b;)V")) {
            assertTrue("$expected in ${bridge.sorted()}", expected in bridge)
        }
        // Packages 4 and 5: the catalogue loaders, live stations, search, history resolver and compose credentials.
        for (expected in listOf(
            "Led9;->u(Landroid/content/Context;Lm6b;Lvz1;)Ljava/lang/Object;",
            "Led9;->t(Landroid/content/Context;Ld6b;Lvz1;)Ljava/lang/Object;",
            "Lvf8;->X(Landroid/content/Context;Lcom/eclipse/android/data/models/CanonicalAlbum;Lvz1;)Ljava/io/Serializable;",
            "Lbfa;->a(Landroid/content/Context;Lhka;)Ljava/lang/Object;",
            "Ldh8;->a:Ldh8;", "Ldh8;->d:Llea;", "Ldh8;->a(Landroid/content/Context;Lvz1;)Ljava/lang/Object;",
            "Lcm7;->a(Lcm7;Ljava/lang/String;Lvz1;)Ljava/lang/Object;",
            "Lcom/eclipse/android/core/audio/PlaybackService;->I:Lw06;",
            "Le69;->c:Lry6;", "Le69;->b:Landroid/content/SharedPreferences;", "La82;->a:Ljava/lang/String;",
            "Lbt1;->k(Landroid/content/Context;)Ljava/lang/String;",
            "Lbt1;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;",
            "Lvm3;->k(Lorg/json/JSONArray;)Leh5;",
            "Lfm3;->a(Landroid/content/Context;)Lcom/eclipse/android/data/models/Song;",
            "Lsf4;->g0:Ldb2;", "Ldb2;->n(Landroid/content/Context;)Lsf4;", "Lsf4;->E:Lvi8;",
            "Lfe8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V")) {
            assertTrue("$expected in ${bridge.sorted()}", expected in bridge)
        }
        val suspend = classes.filter { it.type.startsWith("Lnl/johninnl/eclipse/auto/app/Suspend") }.flatMap { references(it) }
        assertTrue(suspend.toString(), "Lhka;-><init>(ILtz1;)V" in suspend)
        assertTrue(suspend.toString(), "Lgy2;->q:Lgy2;" in suspend)
        assertTrue(suspend.toString(), "Lq12;->COROUTINE_SUSPENDED:Lq12;" in suspend)
        assertTrue(suspend.toString(), "Lzv8;->q:Ljava/lang/Throwable;" in suspend)
    }

    private fun report(app: Map<String, ClassDef>) = linkCheck(extensionClasses(), app::get, shapes = STUB_SHAPES)

    @Test fun theBuiltExtensionLinksCleanlyAgainstTheStubsAndEveryStubShapeHolds() {
        val report = report(StubApp.classes())
        assertEquals(emptyList<LinkMiss>(), report.misses)
        assertEquals(emptyList<String>(), report.unverified)
        assertTrue("expected far more than the four references of work package 1, got ${report.referencesChecked}",
            report.referencesChecked > 60)
    }

    @Test fun everyStubTheLinkCheckDependsOnIsNamedByTheShapeTableOrIsFlat() {
        val app = StubApp.classes()
        // Stub classes that extend or implement another stub must be covered by STUB_SHAPES, or the
        // patch would never confirm the relationship against the app.
        val covered = STUB_SHAPES.map { it.type }.toSet()
        for ((type, cls) in app) {
            if (!type.startsWith("L") || '/' in type) continue
            val relations = (listOfNotNull(cls.superclass).filter { it != "Ljava/lang/Object;" } + cls.interfaces).filter { '/' !in it }
            if (relations.isNotEmpty()) assertTrue("$type extends/implements $relations but is not in STUB_SHAPES", type in covered)
        }
    }

    @Test fun aDriftedFieldNameFailsPatchingWithTheExactReference() {
        val app = StubApp.classes().toMutableMap()
        app["Ljh0;"] = app.getValue("Ljh0;").withoutField("K0")
        val report = report(app)
        assertEquals(listOf("Ljh0;->K0:Ly0c;"), report.misses.map { it.reference })
        assertTrue(linkFailure("Eclipse Music", report).contains("Ljh0;->K0:Ly0c;"))
    }

    @Test fun aDriftedMethodFailsAndANonPublicClassFails() {
        val app = StubApp.classes().toMutableMap()
        app["Lle8;"] = app.getValue("Lle8;").withoutMethod("E")
        app["Lvi8;"] = app.getValue("Lvi8;").withFlags(0)
        val misses = report(app).misses.map { it.reference to it.reason }
        assertTrue(misses.toString(), misses.any { (reference, _) -> reference == "Lle8;->E(I)V" })
        assertTrue(misses.toString(), misses.any { (_, reason) -> reason == "class Lvi8; is not public" })
    }

    @Test fun aStubShapeTheAppDoesNotHaveFailsPatching() {
        val app = StubApp.classes().toMutableMap()
        app["Lhe8;"] = app.getValue("Lhe8;").withSuperclass("Ljava/lang/Object;")
        val misses = report(app).misses.map { it.reference }
        assertTrue(misses.toString(), "Lhe8; extends Lke8;" in misses)
    }

    @Test fun anAppWithoutTheTokenClassFailsEvenThoughItIsNotInTheExtension() {
        val app = StubApp.classes().filterKeys { !it.contains("MediaSessionCompat") }
        val report = report(app)
        assertTrue(report.misses.any { it.reference.contains("MediaSessionCompat\$Token;-><init>") })
    }
}
