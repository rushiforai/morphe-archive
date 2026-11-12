import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.scores365"
private const val SPOILER_FREE = "Lapp/template/extension/scores365/SpoilerFree;"
private const val GAME_OBJ = "Lcom/scores365/entitys/GameObj;"
private const val ROW_BINDING = "Lcom/scores365/viewslibrary/databinding/ScoresGameItemLayoutBinding;"
private const val ENTITLEMENT_STATE = "Lcom/scores365/billingClient/entitlement/EntitlementState;"
private const val GATE_ACTIVITY = "Lcom/scores365/gameCenter/GameCenterBaseActivity;"
private const val SPLASH = "Lcom/scores365/ui/Splash;"
private const val SIGNATURE_SHA1 = "47f994bd2eac89f4aeea0aa1d95cb3ba3ec3f1a1"

private const val ADS_REMOVED = "isUserAdsRemoved="
private val FORCE_SHOW_ADS = setOf("forceShowAds", "force_show_ads") // renamed in 15.0.1
private const val PURCHASE_FLAG = "IsUserRemovedAdsPackageBuying"
private val UPDATE_EXTRAS = setOf("ForceUpdateDialog", "NewVersionPopup")

class Scores365SmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `365Scores patches unlock premium, remove ads and update prompts, and route GMS to MicroG RE`() {
        val root = repoRoot()
        val apk = File(root, "apks/365scores/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "15.0.1",
            patchNames = setOf(
                "Disable ads", "Enable Premium", "Disable update prompts", "GmsCore support", "Spoof signature",
                "Spoiler-free mode", "Patch settings", "Hide competitions", "Hide countries", "AMOLED black",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }

        assertDisableAds(classes)
        assertEnablePremium(byType)
        assertDisableUpdatePrompts(classes)
        assertGmsCoreSupport(classes, workDir, PKG, SPLASH, SIGNATURE_SHA1)
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)
        assertSpoilerFree(classes, byType)
        assertPatchSettingsEntry(classes)
        assertHideLists(byType)
        assertAmoledBlack(workDir)
    }

    /** AMOLED black: the five dark theme colors of the decoded values/colors.xml carry the AMOLED values. */
    private fun assertAmoledBlack(workDir: File) {
        val colors = workDir.walkTopDown().singleOrNull { it.name == "colors.xml" && it.parentFile.name == "values" }
            ?: error("res/values/colors.xml was not decoded under $workDir")
        val doc = javax.xml.parsers.DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(colors)
        val nodes = doc.getElementsByTagName("color")
        val values = (0 until nodes.length).associate { index ->
            val node = nodes.item(index) as org.w3c.dom.Element
            node.getAttribute("name") to node.textContent.trim().lowercase().let { if (it.length == 9 && it.startsWith("#ff")) "#" + it.substring(3) else it }
        }
        val expected = mapOf(
            "dark_theme_card_background" to "#0a0a0a", "dark_theme_scores_new" to "#0a0a0a",
            "dark_theme_surface_secondary" to "#0a0a0a", "dark_theme_toolbar_color" to "#000000",
            "dark_theme_picks_trend_card" to "#121212",
        )
        for ((name, value) in expected) assertEquals(value, values[name], "AMOLED black: $name")
        // The dark background stays pure black and the dividers are not touched.
        assertEquals("#000000", values["dark_theme_background"], "dark_theme_background")
        assertEquals("#3a4145", values["dark_theme_divider_color"], "dark_theme_divider_color")
    }

    /**
     * Hide competitions / Hide countries: GamesObj.getGames() and getCompetitions() hand the value of
     * every return-object to ListFilters first (filterGames / filterCompetitions), and the extension
     * class is in the dex.
     */
    private fun assertHideLists(byType: Map<String, ClassDef>) {
        val filters = "Lapp/template/extension/scores365/ListFilters;"
        check(byType[filters] != null) { "ListFilters is not in the patched dex" }
        val games = byType["Lcom/scores365/entitys/GamesObj;"] ?: error("GamesObj not found")
        for ((name, helper) in listOf("getGames" to "filterGames", "getCompetitions" to "filterCompetitions")) {
            val insns = games.method(name, emptyList()).instructions()
            val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_OBJECT }
            assertTrue(returns.isNotEmpty(), "GamesObj.$name has a return")
            for (at in returns) {
                val call = insns[at - 2].call()
                assertEquals(filters, call?.definingClass, "GamesObj.$name: filter before the return at $at")
                assertEquals(helper, call?.name, "GamesObj.$name: filter before the return at $at")
                assertEquals(Opcode.MOVE_RESULT_OBJECT, insns[at - 1].opcode, "GamesObj.$name: the filtered value is returned")
            }
        }
    }

    /**
     * The Patch settings row: the Settings page's list builder (found by its "Change Server" and
     * notifications strings, as the patch does) adds a "Patch settings" row built with the same row
     * class before its single return, and the row click handler (found by the Bolao activity class)
     * asks SettingsEntry.handles first and returns when it answers true.
     */
    private fun assertPatchSettingsEntry(classes: List<ClassDef>) {
        val all = classes.flatMap { cls -> cls.methods.filter { it.implementation != null } }
        val builders = all.filter { method ->
            val strings = method.strings()
            "Change Server" in strings && "SETTINGS_CATEGORY_NOTIFICATIONS" in strings
        }
        assertEquals(1, builders.size, "Settings list builders")
        val build = builders.single().instructions()
        val titleAt = build.indexOfFirst { it.stringOrNull() == "Patch settings" }
        assertTrue(titleAt >= 0, "list builder: no Patch settings row")
        val returnAt = build.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
        assertTrue(titleAt < returnAt, "list builder: the row is added before the return")
        // Each row's constructor is the first (String, int, int) <init> after its title string.
        fun constructorAfter(title: String): MethodReference {
            val at = build.indexOfFirst { it.stringOrNull() == title }
            assertTrue(at >= 0, "list builder: no $title row")
            return build.drop(at).firstNotNullOf { insn ->
                insn.call()?.takeIf { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "I") }
            }
        }
        assertEquals(constructorAfter("Change Server").definingClass, constructorAfter("Patch settings").definingClass, "both rows use the same row class")
        assertTrue(build.any { it is WideLiteralInstruction && it.wideLiteral == 0x5EE7L }, "list builder: the row id 0x5EE7")

        val clicks = all.filter { method ->
            method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                method.instructions().any { it.opcode == Opcode.CONST_CLASS && ((it as ReferenceInstruction).reference as? TypeReference)?.type == "Lcom/scores365/bolao/BolaoWebActivity;" }
        }
        assertEquals(1, clicks.size, "Settings row click handlers")
        val click = clicks.single().instructions()
        val handlesAt = click.indexOfFirst { it.call()?.definingClass == "Lapp/template/extension/scores365/SettingsEntry;" && it.call()?.name == "handles" }
        assertTrue(handlesAt > 0, "click handler: no SettingsEntry.handles call")
        assertEquals(Opcode.MOVE_RESULT, click[handlesAt + 1].opcode, "handles result is read")
        assertTrue(click[handlesAt + 2].opcode == Opcode.IF_EQZ, "handles result is tested")
        assertEquals(Opcode.RETURN_VOID, click[handlesAt + 3].opcode, "a handled click returns")
    }

    /**
     * Spoiler-free mode: each hook calls its own SpoilerFree entry point, and each entry point asks
     * its own surface switch (isSurfaceOn with its SURFACE_* constant) before it looks at the marks.
     */
    private fun assertSpoilerFree(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        val extension = byType[SPOILER_FREE] ?: error("SpoilerFree is not in the patched dex")

        // The surface each extension entry point checks: the constant loaded into the argument of
        // its isSurfaceOn(int) calls.
        fun Method.surfaces(): Set<Int> {
            val insns = instructions()
            return insns.indices.filter { insns[it].isSpoilerCall("isSurfaceOn") }.map { at ->
                val register = (insns[at] as FiveRegisterInstruction).registerC
                val load = insns.subList(0, at).lastOrNull {
                    it is OneRegisterInstruction && it.registerA == register && it.opcode.setsRegister()
                }
                (load as? NarrowLiteralInstruction)?.narrowLiteral ?: error("$name: isSurfaceOn argument is not a constant")
            }.toSet()
        }
        val expectedSurfaces = mapOf(
            "blocksNotification" to setOf(0), "rowScoreText" to setOf(1),
            "afterRowBound" to setOf(3, 4), "afterScoreBox" to setOf(2, 3, 4),
        )
        for ((name, surfaces) in expectedSurfaces) {
            val method = extension.methods.single { it.name == name }
            assertEquals(surfaces, method.surfaces(), "SpoilerFree.$name surface checks")
        }

        val all = classes.flatMap { cls -> cls.methods.filter { it.implementation != null } }
        fun Method.params() = parameterTypes.map(CharSequence::toString)
        fun Method.hasString(prefix: String) = instructions().any { it.stringOrNull()?.startsWith(prefix) == true }

        // 1. The notification handler returns at entry when blocksNotification(p1) says so.
        val handler = all.single {
            it.params() == listOf("Lcom/scores365/entitys/GCMNotificationObj;", "Ljava/lang/Boolean;") &&
                it.hasString("IAA silencing push notification")
        }
        val h = handler.instructions()
        assertRangeCall(h[0], "blocksNotification", handler.p(1)..handler.p(1), "notification handler")
        assertEquals(
            listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), h.subList(1, 4).map { it.opcode },
            "notification handler: spoiler path",
        )
        assertEquals(4, h.branchTarget(2), "notification handler: an unmarked notification does not reach the stock code")

        // 2. and 3. Both toggles go into the bell's group right after the bell's addView: the match
        // page toolbar builder and the entity page header observer.
        fun assertToggleAfterBell(method: Method, bellArgs: Int, helper: String, label: String) {
            val insns = method.instructions()
            val bell = insns.indices.single {
                insns[it].call()?.let { r -> r.name == "addView" && r.parameterTypes.size == bellArgs } == true
            }
            val group = (insns[bell] as? FiveRegisterInstruction)?.registerC ?: (insns[bell] as RegisterRangeInstruction).startRegister
            assertRangeCall(insns[bell + 1], helper, group..group, label)
            assertEquals(1, insns.count { it.isSpoilerCall(helper) }, "$label: $helper calls")
        }
        val toolbar = byType.getValue(GATE_ACTIVITY).methods.single {
            it.returnType == "V" && it.params() == listOf("Landroid/view/ViewGroup;") && it.hasString("Error adding notification bell")
        }
        assertToggleAfterBell(toolbar, 2, "addMatchToggle", "match toolbar")
        val header = all.single {
            it.name == "onChanged" && it.hasString("SingleEntityMainPage") && it.hasString("Error adding notification bell")
        }
        assertToggleAfterBell(header, 3, "addCompetitionToggle", "entity header")

        // 4. Row score formatter: kickoff time at entry for a marked match.
        val formatter = all.single {
            it.returnType == "Ljava/lang/String;" && AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.params() == listOf(GAME_OBJ, "Z", "Lcom/scores365/entitys/extensions/AbnormalGameStatusTexts;")
        }
        val f = formatter.instructions()
        assertRangeCall(f[0], "rowScoreText", formatter.p(0)..formatter.p(0), "row formatter")
        assertEquals(
            listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT), f.subList(1, 4).map { it.opcode },
            "row formatter: spoiler path",
        )
        assertEquals(4, f.branchTarget(2), "row formatter: an unmarked match does not reach the stock code")

        // 5. Row binder: afterRowBound(binding, item, game) before every return.
        val binder = all.single { m ->
            m.returnType == "V" && m.params().let { it.size >= 4 && it[1] == ROW_BINDING && it[3] == GAME_OBJ } &&
                m.instructions().any { it.call()?.let { r -> r.definingClass == formatter.definingClass && r.name == formatter.name } == true }
        }
        assertHookBeforeEveryReturn(binder, "afterRowBound", binder.p(1)..binder.p(3), "row binder")

        // 6. Match page header: ScoreBoxView's binder hands (this, game) to beforeScoreBox at entry
        // (it reuses its parameter registers later), and calls afterScoreBox() before every return.
        val scoreBox = byType.getValue("Lcom/scores365/Design/components/view/ScoreBoxView;").methods.single {
            it.returnType == "V" && it.params() == listOf(GAME_OBJ)
        }
        val s = scoreBox.instructions()
        assertRangeCall(s[0], "beforeScoreBox", scoreBox.p(0)..scoreBox.p(1), "score box")
        val boxReturns = s.indices.filter { s[it].opcode == Opcode.RETURN_VOID }
        assertTrue(boxReturns.isNotEmpty(), "score box: no return-void")
        for (index in boxReturns) {
            assertTrue(
                s[index - 1].opcode == Opcode.INVOKE_STATIC && s[index - 1].isSpoilerCall("afterScoreBox"),
                "score box: return at $index is not preceded by SpoilerFree.afterScoreBox(); got ${s[index - 1].opcode}",
            )
        }
        assertEquals(boxReturns.size, s.count { it.isSpoilerCall("afterScoreBox") }, "score box: afterScoreBox calls")
    }

    private fun Instruction.isSpoilerCall(name: String) = call()?.let { it.definingClass == SPOILER_FREE && it.name == name } == true

    private fun assertRangeCall(insn: Instruction, name: String, registers: IntRange, label: String) {
        assertTrue(
            insn.opcode == Opcode.INVOKE_STATIC_RANGE && insn.isSpoilerCall(name),
            "$label: expected invoke-static/range SpoilerFree.$name, got ${insn.opcode} ${insn.call()}",
        )
        val range = insn as RegisterRangeInstruction
        assertEquals(registers, range.startRegister until range.startRegister + range.registerCount, "$label: $name arguments")
    }

    private fun assertHookBeforeEveryReturn(method: Method, name: String, registers: IntRange, label: String) {
        val insns = method.instructions()
        val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_VOID }
        assertTrue(returns.isNotEmpty(), "$label: no return-void")
        for (index in returns) assertRangeCall(insns[index - 1], name, registers, "$label (return at $index)")
        assertEquals(returns.size, insns.count { it.isSpoilerCall(name) }, "$label: $name calls")
    }

    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    /** The real register index of parameter p[index]. */
    private fun Method.p(index: Int): Int {
        val ins = (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) +
            parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }.sum()
        return implementation!!.registerCount - ins + index
    }

    /** The instruction index the offset instruction at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val offsets = runningFold(0) { address, insn -> address + insn.codeUnits }
        return offsets.indexOf(offsets[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    /** The 14.9.8 ad stack is app-layer: the entitlement gates, plus every activity's own gate. */
    private fun assertDisableAds(classes: List<ClassDef>) {
        val owner = classes.firstOrNull { cls -> cls.methods.any { it.isEntitlementGate() } }
            ?: error("no class with a ()Z gate logging \"$ADS_REMOVED\"")
        val removed = owner.methods.singleOrNull { it.isEntitlementGate() }
            ?: error("expected exactly one \"$ADS_REMOVED\" gate in ${owner.type}")
        assertForcedBoolean(removed, expected = true, label = "${owner.type}.${removed.name}()")

        val sibling = owner.methods.singleOrNull { method ->
            method !== removed &&
                method.returnType == "Z" && method.parameterTypes.isEmpty() && method.implementation != null &&
                !method.strings().contains(ADS_REMOVED) &&
                PURCHASE_FLAG in method.strings() && method.strings().any { it in FORCE_SHOW_ADS }
        } ?: error("no sibling gate reading $FORCE_SHOW_ADS + $PURCHASE_FLAG in ${owner.type}")
        assertForcedBoolean(sibling, expected = true, label = "${owner.type}.${sibling.name}()")

        // Every concrete app ad gate returns false, including the readable base activities.
        val gates = classes.flatMap { cls ->
            cls.methods.filter {
                it.name in setOf("showAdsForContext", "isBannerNeedToBeShown") &&
                    it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            }.map { cls to it }
        }
        check(gates.any { (cls, _) -> cls.type == GATE_ACTIVITY }) { "no app ad gate patched in $GATE_ACTIVITY" }
        for ((cls, method) in gates) {
            assertForcedBoolean(method, expected = false, label = "${cls.type}.${method.name}()")
        }
    }

    private fun assertEnablePremium(byType: Map<String, ClassDef>) {
        // The constructor overwrites the five feature flags (p1..p5) with true before storing them.
        val state = byType[ENTITLEMENT_STATE] ?: error("$ENTITLEMENT_STATE not found")
        val constructor = state.method(
            "<init>",
            listOf("Z", "Z", "Z", "Z", "Z", "Ljava/util/Set;", "Ljava/util/List;", "J", "Z"),
        )
        // p0 = this; parameters take 1+1+1+1+1+1+1+2+1 = 10 registers.
        val p1 = constructor.implementation!!.registerCount - 10
        val insns = constructor.instructions()
        for (slot in 0 until 5) {
            val insn = insns.getOrNull(slot)
            check(
                insn?.opcode == Opcode.CONST_16 &&
                    (insn as OneRegisterInstruction).registerA == p1 + slot &&
                    (insn as WideLiteralInstruction).wideLiteral == 1L
            ) {
                "EntitlementState.<init> instruction $slot is not const/16 p${slot + 1}, 0x1; got ${insn?.opcode}"
            }
        }

        // The Gson-restored cache skips the constructor, so the getters are forced too.
        for (getter in listOf(
            "isPremium", "getAdsFree", "getTipster", "getPlus", "getDelayedNotifications", "getNotificationSounds",
        )) {
            assertForcedBoolean(state.method(getter, emptyList()), expected = true, label = "EntitlementState.$getter()")
        }

        // The Remove ads screen no longer sees the grace start time the forced state triggers.
        val removeAds = byType["Lcom/scores365/removeAds/RemoveAdsBasicActivity;"]
            ?: error("RemoveAdsBasicActivity not found")
        val strings = removeAds.method("onCreate", listOf("Landroid/os/Bundle;")).instructions().mapNotNull { it.stringOrNull() }
        check("iabc_fnrts" !in strings) { "RemoveAdsBasicActivity.onCreate still reads \"iabc_fnrts\"" }
        check("morphe_disabled_iabc_fnrts" in strings) { "RemoveAdsBasicActivity.onCreate is missing the renamed key" }
    }

    private fun assertDisableUpdatePrompts(classes: List<ClassDef>) {
        val readers = classes.flatMap { cls -> cls.methods.filter { it.isUpdateReader() }.map { cls to it } }
        check(readers.size == 2) { "expected 2 onCreate update readers, found ${readers.map { it.first.type }}" }
        for ((cls, onCreate) in readers) {
            val strings = onCreate.instructions().mapNotNull { it.stringOrNull() }
            for (key in UPDATE_EXTRAS) {
                check(key !in strings) { "${cls.type}.onCreate still reads the \"$key\" extra" }
                check("morphe_disabled_$key" in strings) { "${cls.type}.onCreate is missing the renamed \"$key\" key" }
            }
        }
    }

    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringOrNull() }

    private fun Method.isEntitlementGate(): Boolean =
        returnType == "Z" && parameterTypes.isEmpty() && implementation != null &&
            strings().contains(ADS_REMOVED)

    private fun Method.isUpdateReader(): Boolean =
        name == "onCreate" && returnType == "V" && parameterTypes == listOf("Landroid/os/Bundle;") &&
            implementation != null &&
            strings().containsAll(UPDATE_EXTRAS.map { "morphe_disabled_$it" })
}
