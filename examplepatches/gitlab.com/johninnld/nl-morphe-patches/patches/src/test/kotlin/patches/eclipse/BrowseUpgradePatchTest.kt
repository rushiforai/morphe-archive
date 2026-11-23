package patches.eclipse

import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class BrowseUpgradePatchTest {
    private fun extensionClasses(): List<ClassDef> =
        DexBackedDexFile.fromInputStream(null, eclipseExtensionBundle.bytes.inputStream()).classes.toList()

    @Test fun theBrowseUpgradeIsADefaultOnPatchForTheSameAppAndBuild() {
        assertEquals("Android Auto browse upgrade", eclipseBrowseUpgrade.name)
        assertTrue(eclipseBrowseUpgrade.default)
        assertTrue(eclipseBrowseUpgrade.options.isEmpty())
        assertEquals(listOf<Compatibility>(eclipse), eclipseBrowseUpgrade.compatibility)
    }

    @Test fun bothPatchesShareOneExtensionAndTheBrowseUpgradeNeedsNeitherTheManifestNorTheOtherPatch() {
        assertTrue(eclipseBase in eclipseBrowseUpgrade.dependencies)
        assertTrue("the browse upgrade merges the shared extension itself", eclipseAutoExtension in eclipseBrowseUpgrade.dependencies)
        assertTrue(eclipseAutoExtension in eclipseTemplatedMedia.dependencies)
        assertFalse("it must work without the templated patch", eclipseTemplatedMedia in eclipseBrowseUpgrade.dependencies)
        assertFalse(eclipseBrowseUpgrade in eclipseTemplatedMedia.dependencies)
        // The shared patch is not selectable on its own.
        assertTrue(eclipseAutoExtension.name == null)
    }

    @Test fun theTwoHooksAreTheAppsChildrenAndPlayMethodsWithExactDescriptors() {
        assertEquals(
            listOf(
                "Lj16;->u(Lo36;Ljava/lang/String;ILu06;)Lai5;",
                "Lcm7;->d(Ljava/lang/String;Lp16;)V",
            ),
            BROWSE_HOOKS.map { it.descriptor },
        )
    }

    @Test fun eachPrologueCallsTheExtensionOnceAndOnlyReturnsEarlyForAnAnswerItOwns() {
        for (hook in BROWSE_HOOKS) {
            val lines = hook.prologue.lines().map { it.trim() }.filter { it.isNotEmpty() }
            assertEquals(hook.descriptor, 4, lines.size)
            assertTrue(lines[0], lines[0].startsWith("invoke-static/range {p0 .. p"))
            assertEquals(1, lines.count { it.startsWith("invoke-static") })
            assertTrue(lines[1], lines[1].startsWith("move-result"))
            assertTrue("falls through to the original code", lines[2].endsWith(":morphe_eclipse_original"))
            assertTrue(lines[3], lines[3].startsWith("return"))
        }
        assertTrue(CHILDREN_HOOK.prologue.contains("return-object v0"))
        assertTrue("a play hook returns nothing", PLAY_HOOK.prologue.contains("return-void"))
    }

    @Test fun theChildrenPrologueForwardsEveryParameterInOrder() {
        // p0 = the session, p1..p4 = controller, parent id, page size, params: five consecutive registers.
        assertTrue(CHILDREN_HOOK.prologue.contains("{p0 .. p4}"))
        assertTrue(CHILDREN_HOOK.prologue.contains("children(Lj16;Lo36;Ljava/lang/String;ILu06;)Lai5;"))
        assertTrue(PLAY_HOOK.prologue.contains("{p0 .. p1}"))
        assertTrue(PLAY_HOOK.prologue.contains("play(Lcm7;Ljava/lang/String;)Z"))
    }

    @Test fun theExtensionDeclaresBothHookTargetsWithTheAppsOwnTypes() {
        val tree = extensionClasses().single { it.type == "Lnl/johninnl/eclipse/auto/tree/BrowseTree;" }
        val methods = tree.methods.associateBy { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        for (target in listOf("children(Lj16;Lo36;Ljava/lang/String;ILu06;)Lai5;", "play(Lcm7;Ljava/lang/String;)Z",
            "page(Ljava/util/List;Lu06;)Lx45;")) {
            val method = methods[target] ?: error("BrowseTree has no $target in ${methods.keys}")
            assertTrue("$target is public static", method.accessFlags and AccessFlags.PUBLIC.value != 0 &&
                method.accessFlags and AccessFlags.STATIC.value != 0)
        }
        // The page cut takes the place of the app's result factory: same arguments, same result type.
        assertTrue(PAGE_CALL.endsWith("BrowseTree;->page(Ljava/util/List;Lu06;)Lx45;"))
        assertEquals(RESULT_CALL.substringAfter("->"), PAGE_CALL.substringAfter("->").replace("page(", "c("))
        val pageReferences = tree.methods.single { it.name == "page" }.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference }
            .map { ReferenceUtil.getMethodDescriptor(it) }
        assertTrue("the cut still ends in the app's own factory: $pageReferences", RESULT_CALL in pageReferences)
    }

    @Test fun theBrowseBridgeUsesExactlyTheAppMembersTheDesignNames() {
        val references = extensionClasses().filter { it.type.startsWith("Lnl/johninnl/eclipse/auto/app/Tree") }
            .flatMap { cls -> cls.methods.flatMap { m -> (m.implementation?.instructions ?: emptyList()).mapNotNull { (it as? ReferenceInstruction)?.reference } } }
            .map { ref ->
                when (ref) {
                    is com.android.tools.smali.dexlib2.iface.reference.MethodReference -> ReferenceUtil.getMethodDescriptor(ref)
                    is com.android.tools.smali.dexlib2.iface.reference.FieldReference -> ReferenceUtil.getFieldDescriptor(ref)
                    else -> ""
                }
            }.toSet()
        for (expected in listOf(
            "Lcm7;->b(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ls06;",
            "Lcm7;->h(Lcom/eclipse/android/data/models/Song;Ljava/lang/String;)Ls06;",
            "Lx45;->c(Ljava/util/List;Lu06;)Lx45;",
            "Lj62;->n0(Ljava/lang/Object;)Lm54;",
            "Lj16;->f(Lo36;Lm46;)V",
            "Lj16;->h()Lc16;",
            "Lj16;->g:Ld66;", "Ld66;->e:Le31;", "Lc16;->A:Le31;", "Le31;->Y()Lz54;",
            "Lj16;->f:Landroid/content/Context;", "Lj16;->e:Lcm7;",
            "Lcm7;->a:Lcom/eclipse/android/core/audio/PlaybackService;",
            "Lf16;-><init>(Lj16;Ljava/lang/String;ILu06;)V",
            "Lp16;->a()Ln16;", "Lp16;-><init>(Ln16;)V", "Lp16;->J:Landroid/os/Bundle;",
            "Ln16;->I:Landroid/os/Bundle;", "Ln16;->r:Ljava/lang/Boolean;", "Ln16;->s:Ljava/lang/Boolean;", "Ln16;->H:Ljava/lang/Integer;",
            "Ls06;-><init>(Ljava/lang/String;Li06;Ln06;Lm06;Lp16;Lo06;)V",
        )) {
            assertTrue("$expected is used by the browse bridge: ${references.sorted()}", expected in references)
        }
    }
}
