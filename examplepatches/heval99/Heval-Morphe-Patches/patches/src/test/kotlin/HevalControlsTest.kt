import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalFeatureKind
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import app.template.patches.shared.hevalcontrols.addHevalControlsComponents
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.addHevalSkip
import app.template.patches.shared.hevalcontrols.addHevalStockPath
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.shared.hevalcontrols.hevalReturnNull
import app.template.patches.sofascore.betting.HIDE_BETTING_CONTENT
import app.template.patches.sofascore.competitions.HIDDEN_COMPETITIONS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.countries.HIDDEN_COUNTRIES
import app.template.patches.sofascore.layout.HIDE_AI_INSIGHTS
import app.template.patches.sofascore.layout.HIDE_MATCH_CHAT
import app.template.patches.sofascore.layout.MAIN_TAB_FEATURES
import app.template.patches.sofascore.layout.MATCH_TAB_FEATURES
import app.template.patches.sofascore.misc.animations.ANIMATION_FEATURES
import app.template.patches.sofascore.misc.notifications.BLOCK_MARKETING_NOTIFICATIONS
import app.template.patches.sofascore.misc.popups.PROMO_POPUP_FEATURES
import app.template.patches.sofascore.misc.promo.PROMO_SECTION_FEATURES
import app.template.patches.sofascore.misc.rating.DISABLE_RATING_PROMPTS
import app.template.patches.sofascore.misc.theme.AMOLED_BLACK
import app.template.patches.sofascore.misc.video.TURN_OFF_VIDEO_AUTOPLAY
import app.template.patches.sofascore.misc.widget.SLOWER_WIDGET_REFRESH
import app.template.patches.sofascore.spoiler.SPOILER_FEATURES
import app.template.patches.sofascore.sports.SPORT_FEATURES
import app.template.patches.truecaller.controls.truecallerHevalControlsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

/**
 * Heval Controls patch-side helpers: the registry encoder against the fixture shared with the Java
 * decoder, the manifest components and the runtime gate. No APK needed.
 */
class HevalControlsTest {
    private val fixtureFeatures = listOf(
        HevalFeature("demo.hide_ads", "Hide ads", "Removes banner and feed ads.", "Ads"),
        HevalFeature(
            "demo.read_receipts", "Hide read receipts",
            "Chats stay unread for the sender.\nApplies to new chats.", "Privacy",
            default = false, restartRequired = true, dependencies = listOf("demo.hide_ads"),
        ),
        HevalFeature(
            "demo.telemetry", "Block telemetry",
            "Removed at patch time: analytics provider and meta-data.", "Privacy", buildTimeOnly = true,
        ),
        HevalFeature(
            "demo.rtl_text", "إخفاء القصص",
            "Tab\there, backslash \\ and émoji ✓", "Feed",
            dependencies = listOf("demo.hide_ads", "demo.telemetry"),
        ),
    )

    @Test
    fun encoderMatchesTheFixtureSharedWithTheJavaDecoder() {
        val fixture = File(repoRoot(), "extensions/hevalcontrols/core/src/test/resources/registry-v1.txt")
        assertTrue(fixture.isFile, "missing ${fixture.path}")
        // core.autocrlf may check the fixture out with CRLF; the encoder (and the dex) use LF.
        assertEquals(fixture.readText(Charsets.UTF_8).replace("\r\n", "\n"), HevalRegistryCodec.encode(fixtureFeatures))
    }

    @Test
    fun listEncoderMatchesTheListFixtureSharedWithTheJavaDecoder() {
        val features = listOf(
            HevalFeature("demo.hide_ads", "Hide ads", "Removes banner and feed ads.", "Ads"),
            HevalListFeature(
                "demo.hidden_countries", "Hidden countries",
                "Leagues from the picked countries are hidden.", "Leagues", restartRequired = true,
            ),
            HevalListFeature("demo.hidden_teams", "Hidden teams", "Needs ads off.", "Teams", dependencies = listOf("demo.hide_ads")),
        )
        val fixture = File(repoRoot(), "extensions/hevalcontrols/core/src/test/resources/registry-v1-lists.txt")
        assertTrue(fixture.isFile, "missing ${fixture.path}")
        assertEquals(fixture.readText(Charsets.UTF_8).replace("\r\n", "\n"), HevalRegistryCodec.encode(features))
    }

    @Test
    fun switchRecordsKeepTheirEightFields() {
        // Codec compatibility: adding list settings must not change how switches are written, so
        // feature ids and registries encoded before 2026-11-03 decode the same.
        val switches = HevalRegistryCodec.encode(fixtureFeatures).lines().drop(1).filter { it.isNotEmpty() }
        switches.forEach { assertEquals(8, it.split('\t').size, it) }
        val list = HevalRegistryCodec.encode(listOf(HevalListFeature("demo.list", "List", "", "X"))).lines()[1]
        assertEquals(listOf("demo.list", "List", "", "X", "0", "0", "0", "", "list"), list.split('\t'))
    }

    @Test
    fun iconRecordsMatchTheSharedFixture() {
        val features = listOf(
            HevalFeature("demo.hide_ads", "Hide ads", "Removes banner and feed ads.", "Ads", icon = "ads"),
            HevalListFeature(
                "demo.hidden_countries", "Hidden countries",
                "Leagues from the picked countries are hidden.", "Leagues", restartRequired = true, icon = "globe",
            ),
            HevalFeature("demo.plain", "Plain", "No icon of its own.", "Ads"),
            HevalFeature(
                "demo.anim_off", "Animations off", "Turns off animations.", "Display", default = false,
                restartRequired = true, icon = "play", choice = "Animation speed",
            ),
            HevalFeature(
                "demo.anim_fast", "Faster animations", "Plays animations faster.", "Display", default = false,
                restartRequired = true, icon = "play", choice = "Animation speed",
            ),
            HevalFeature("demo.calm_on", "Calm", "Part of calm mode.", "Ads", calm = true),
        )
        val fixture = File(repoRoot(), "extensions/hevalcontrols/core/src/test/resources/registry-v1-icons.txt")
        assertTrue(fixture.isFile, "missing ${fixture.path}")
        assertEquals(fixture.readText(Charsets.UTF_8).replace("\r\n", "\n"), HevalRegistryCodec.encode(features))
        // A feature without an icon still has exactly eight fields (the encoding is unchanged).
        assertEquals(8, HevalRegistryCodec.encode(listOf(features[2])).lines()[1].split('\t').size)
    }

    @Test
    fun iconKeyValidation() {
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", icon = "Bad Icon") }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", icon = "tab\tkey") }
        assertEquals("eye_off", HevalFeature("demo.a", "A", "", "X", icon = "eye_off").icon)
    }

    @Test
    fun calmValidation() {
        assertEquals(true, HevalFeature("demo.a", "A", "", "X", calm = true).calm)
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", default = false, kind = HevalFeatureKind.LIST, calm = true)
        }
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", default = false, buildTimeOnly = true, calm = true)
        }
    }

    @Test
    fun choiceValidation() {
        assertEquals("Animation speed", HevalFeature("demo.a", "A", "", "X", choice = "Animation speed").choice)
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", default = false, buildTimeOnly = true, choice = "Speed")
        }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", choice = " ") }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", choice = "x".repeat(41)) }
        // A list cannot be a choice option (HevalListFeature has no choice parameter).
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", default = false, kind = HevalFeatureKind.LIST, choice = "Speed")
        }
    }

    @Test
    fun listFeatureValidation() {
        val list = HevalListFeature("demo.countries", "Hidden countries", "", "Leagues")
        assertEquals(HevalFeatureKind.LIST, list.kind)
        assertEquals(false, list.default)
        assertEquals(false, list.buildTimeOnly)
        assertEquals(HevalFeatureKind.SWITCH, HevalFeature("demo.a", "A", "", "X").kind)
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", kind = HevalFeatureKind.LIST) }
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", default = false, buildTimeOnly = true, kind = HevalFeatureKind.LIST)
        }
        assertThrows<IllegalArgumentException> { HevalListFeature("Bad-Id", "A", "", "X") }
    }

    /**
     * The Sofascore rows (2026-11-11 readability pass): every shipped id is kept (the ids name the
     * saved choices), the sections are few and plain with the spoiler section first, and every row
     * has one short plain sentence without SDK or technical names.
     */
    @Test
    fun sofascoreRowsKeepTheirIdsAndArePlain() {
        val features = listOf(HIDE_AI_INSIGHTS, HIDE_MATCH_CHAT, HIDE_BETTING_CONTENT, HIDDEN_COUNTRIES, HIDDEN_COMPETITIONS,
            BLOCK_MARKETING_NOTIFICATIONS, DISABLE_RATING_PROMPTS, AMOLED_BLACK, SLOWER_WIDGET_REFRESH, TURN_OFF_VIDEO_AUTOPLAY) +
            MAIN_TAB_FEATURES + MATCH_TAB_FEATURES.map { it.second } + SPORT_FEATURES.map { it.second } +
            PROMO_POPUP_FEATURES.map { it.second } + PROMO_SECTION_FEATURES.map { it.second } + ANIMATION_FEATURES + SPOILER_FEATURES
        val sports = listOf("football", "tennis", "basketball", "ice_hockey", "volleyball", "handball", "esports", "mma",
            "baseball", "cricket", "motorsport", "american_football", "rugby", "badminton", "snooker", "darts", "futsal",
            "minifootball", "table_tennis", "beach_volley", "waterpolo", "cycling", "aussie_rules", "floorball", "bandy")
        val shipped = listOf(
            "hide_ai_insights", "hide_match_chat", "hide_betting_content", "hidden_countries", "hidden_competitions",
            "block_marketing_notifications", "disable_rating_prompts", "amoled_black", "slower_widget_refresh",
            "turn_off_video_autoplay", "animations_off", "animations_fast", "spoiler_free", "spoiler_notifications", "spoiler_lists", "spoiler_widget",
            "spoiler_events", "spoiler_competitions",
        ) + listOf("favorites", "feed", "fantasy", "featured").map { "hide_main_tab_$it" } +
            listOf("commentary", "crowdsourcing", "media", "graphs", "standings", "cup_tree", "matches").map { "hide_tab_$it" } +
            sports.map { "hide_sport_$it" } +
            listOf("match_of_the_week", "remove_ads", "promotion", "weekly_challenge", "survey", "propose_follow").map { "hide_modal_$it" } +
            listOf("world_cup", "sofa_season", "referral", "fantasy", "dream_team", "nba", "sfl", "utr", "sevilla_marseille",
                "in_app_messages").map { "hide_promo_$it" }
        assertEquals(shipped.map { "sofascore.$it" }.sorted(), features.map { it.id }.sorted())

        val sections = features.map { it.category }.distinct()
        assertTrue(sections.size <= 8, "too many sections: $sections")
        assertTrue(SofascoreControlsCategory.SPOILER_FREE.contains("spoiler", ignoreCase = true), "the spoiler section is not listed first")
        sections.forEach { assertTrue(it.first().isUpperCase() && it.drop(1) == it.drop(1).lowercase(), "not sentence case: $it") }

        val technical = Regex("\\b(SDK|Firebase|Remote Config|FCM|R8|API|modal|flag|enum)\\b", RegexOption.IGNORE_CASE)
        features.forEach { feature ->
            val text = feature.description
            assertTrue(text.endsWith('.') && ". " !in text && '\n' !in text, "${feature.id}: not one sentence: $text")
            assertTrue(text.length <= 90, "${feature.id}: description too long (${text.length}): $text")
            assertTrue(feature.name.length <= 40, "${feature.id}: name too long: ${feature.name}")
            assertTrue(!technical.containsMatchIn(text) && !technical.containsMatchIn(feature.name), "${feature.id}: technical words: ${feature.name} / $text")
        }
    }

    @Test
    fun emptyRegistryIsJustTheHeader() {
        assertEquals("hevalcontrols-registry:1\n", HevalRegistryCodec.encode(emptyList()))
    }

    @Test
    fun encoderRejectsDuplicateIds() {
        val feature = HevalFeature("demo.a", "A", "", "X")
        assertThrows<IllegalArgumentException> { HevalRegistryCodec.encode(listOf(feature, feature.copy(name = "B"))) }
    }

    @Test
    fun featureValidation() {
        listOf("", "Upper", "1st", "with-dash", "with,comma", "a".repeat(65)).forEach { id ->
            assertThrows<IllegalArgumentException>(id) { HevalFeature(id, "Name", "", "X") }
        }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", " ", "", "X") }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "") }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", dependencies = listOf("demo.a")) }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", dependencies = listOf("Bad")) }
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", dependencies = listOf("demo.b", "demo.b"))
        }
    }

    @Test
    fun manifestGetsANonExportedProviderAndActivity() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            """
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.app">
                    <application android:name="com.example.App">
                        <provider android:name="androidx.startup.InitializationProvider"
                            android:authorities="com.example.app.androidx-startup" android:exported="false"/>
                    </application>
                </manifest>
            """.trimIndent().byteInputStream(),
        )
        document.addHevalControlsComponents()

        val providers = document.getElementsByTagName("provider")
        val provider = (0 until providers.length).map { providers.item(it) as Element }
            .single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.InitProvider" }
        assertEquals("com.example.app.hevalcontrols", provider.getAttribute("android:authorities"))
        assertEquals("false", provider.getAttribute("android:exported"))
        assertEquals("1000", provider.getAttribute("android:initOrder"))

        val activity = document.getElementsByTagName("activity").item(0) as Element
        assertEquals("app.template.extension.hevalcontrols.ui.HevalControlsActivity", activity.getAttribute("android:name"))
        assertEquals("false", activity.getAttribute("android:exported"))
        assertEquals("Patch settings", activity.getAttribute("android:label"))
        assertEquals(0, document.getElementsByTagName("activity-alias").length)
        assertEquals(0, document.getElementsByTagName("intent-filter").length)

        // Patching an already patched APK is refused.
        assertThrows<PatchException> { document.addHevalControlsComponents() }
    }

    @Test
    fun hostIsAvailableOnEveryInstaller() {
        // The converted feature patches depend on the host: an UNAVAILABLE host (Root Mount, which
        // keeps the stock manifest) would take every one of them away.
        val availability = truecallerHevalControlsPatch.availability ?: return
        InstallerType.entries.forEach { installer ->
            ApkArchitecture.entries.forEach { architecture ->
                assertTrue(
                    availability.resolve(installer, architecture) != PatchAvailability.UNAVAILABLE,
                    "Patch settings is unavailable for $installer / $architecture",
                )
            }
        }
    }

    @Test
    fun booleanGateKeepsTheOriginalCodeReachable() {
        // public boolean isPromotedVisible() { return true; }   .registers 2 (v0, p0)
        val method = method(
            "Z", registers = 2,
            ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        )
        method.hevalReturnEarly("demo.hide_promoted", false)

        val instructions = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN,
            ),
            instructions.map { it.opcode },
        )
        assertEquals("demo.hide_promoted", ((instructions[0] as ReferenceInstruction).reference as StringReference).string)
        val call = (instructions[1] as ReferenceInstruction).reference as MethodReference
        assertEquals(HEVAL_SETTINGS_CLASS, call.definingClass)
        assertEquals("isEnabled", call.name)
        assertEquals(listOf("Ljava/lang/String;"), call.parameterTypes.map { it.toString() })
        assertEquals("Z", call.returnType)
        assertEquals(0, (instructions[1] as RegisterRangeInstruction).startRegister)
        assertEquals(0, (instructions[2] as OneRegisterInstruction).registerA)
        // The patched path answers false; the stock path is the untouched original.
        assertEquals(0, (instructions[4] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(1, (instructions[6] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(instructions[6], branchTarget(method, 3))
    }

    @Test
    fun voidAndObjectGates() {
        val void = method("V", registers = 2, ImmutableInstruction10x(Opcode.RETURN_VOID))
        void.hevalReturnEarly("demo.no_upload")
        assertEquals(
            listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.RETURN_VOID),
            void.implementation!!.instructions.map { it.opcode },
        )

        val obj = method(
            "Ljava/lang/Object;", registers = 2,
            ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
        )
        obj.hevalReturnNull("demo.no_banner")
        assertEquals(
            listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4,
                Opcode.RETURN_OBJECT, Opcode.MOVE_OBJECT, Opcode.RETURN_OBJECT),
            obj.implementation!!.instructions.map { it.opcode },
        )
    }

    @Test
    fun customGateUsesTheGivenRegister() {
        val method = method(
            "Z", registers = 20,
            ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        )
        method.addHevalGate("demo.custom", register = 17) { v -> "const/16 $v, 0x0\nreturn $v" }
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(17, (instructions[1] as RegisterRangeInstruction).startRegister)
        assertEquals(17, (instructions[3] as OneRegisterInstruction).registerA)
    }

    @Test
    fun gateRefusesUnsafeRegistersAndAnchors() {
        // Only p0 (this): no local for the scratch register.
        val noLocals = method("Z", registers = 1, ImmutableInstruction11x(Opcode.RETURN, 0))
        assertThrows<PatchException> { noLocals.hevalReturnEarly("demo.x", true) }

        // A parameter register is never used as scratch.
        val method = method("Z", registers = 2, ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0))
        assertThrows<PatchException> { method.addHevalGate("demo.x", register = 1) { "" } }
        assertThrows<PatchException> { method.addHevalGate("demo.x", index = 5) { "" } }
        assertThrows<IllegalArgumentException> { method.addHevalGate("Bad Id") { "" } }
        assertThrows<PatchException> { method.hevalReturnEarly("demo.x") } // not void
        assertThrows<PatchException> { method.hevalReturnNull("demo.x") } // not an object
    }

    @Test
    fun gateRefusesToSplitAResultOrExceptionMove() {
        // static int value() { invoke-static {}, Lcom/example/Feed;->f()X; move-result* v0; ... }
        listOf(
            Opcode.MOVE_RESULT to "I",
            Opcode.MOVE_RESULT_OBJECT to "Ljava/lang/Object;",
            Opcode.MOVE_RESULT_WIDE to "J",
            Opcode.MOVE_EXCEPTION to "V",
        ).forEach { (move, type) ->
            val method = method("V", registers = 4, invoke(type), ImmutableInstruction11x(move, 0), ImmutableInstruction10x(Opcode.RETURN_VOID))
            val e = assertThrows<PatchException>(move.name) { method.addHevalGate("demo.x", index = 1, register = 2) { "" } }
            assertTrue(e.message!!.contains("cannot be inserted before"), e.message)
            assertEquals(listOf(Opcode.INVOKE_STATIC, move, Opcode.RETURN_VOID), method.implementation!!.instructions.map { it.opcode })
        }
    }

    @Test
    fun gateAtMethodEntryBeforeAnInvokeStillWorks() {
        val method = method("V", registers = 2, invoke("I"), ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction10x(Opcode.RETURN_VOID))
        method.hevalReturnEarly("demo.entry")
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN_VOID,
            ),
            method.implementation!!.instructions.map { it.opcode },
        )
    }

    @Test
    fun stockPathRunsWhileTheFeatureIsOff() {
        // A generated helper: the patched behaviour is the body; while off it returns at once.
        val method = method("V", registers = 2, ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction10x(Opcode.RETURN_VOID))
        method.addHevalStockPath("demo.helper") { "return-void" }
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_NEZ,
                Opcode.RETURN_VOID, Opcode.CONST_4, Opcode.RETURN_VOID,
            ),
            instructions.map { it.opcode },
        )
        assertEquals("demo.helper", ((instructions[0] as ReferenceInstruction).reference as StringReference).string)
        // On: jump over the stock path into the original code.
        assertEquals(instructions[5], branchTarget(method, 3))

        // A stock path that would fall through into the patched code is refused.
        val other = method("V", registers = 2, ImmutableInstruction10x(Opcode.RETURN_VOID))
        assertThrows<PatchException> { other.addHevalStockPath("demo.helper") { "const/4 v0, 0x0" } }
    }

    @Test
    fun skipGateJumpsOverTheSkippedCodeWhileOn() {
        // invoke-static {}, f()V (the call to skip); const/4 v1, 1; return-void
        val method = method("V", registers = 4, invoke("V"), ImmutableInstruction11n(Opcode.CONST_4, 1, 1), ImmutableInstruction10x(Opcode.RETURN_VOID))
        method.addHevalSkip("demo.skip", index = 0, target = 1, register = 2)
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_NEZ,
                Opcode.INVOKE_STATIC, Opcode.CONST_4, Opcode.RETURN_VOID,
            ),
            instructions.map { it.opcode },
        )
        assertEquals("demo.skip", ((instructions[0] as ReferenceInstruction).reference as StringReference).string)
        assertEquals(2, (instructions[3] as OneRegisterInstruction).registerA)
        // On: over the call; off: the call runs (fall-through).
        assertEquals(instructions[5], branchTarget(method, 3))

        // The target must come after the index.
        assertThrows<PatchException> { method.addHevalSkip("demo.skip", index = 5, target = 4, register = 2) }
        assertThrows<PatchException> { method.addHevalSkip("demo.skip", index = 0, target = 99, register = 2) }
    }

    @Test
    fun valueHelperPassesTheStockValueThroughWhileOff() {
        val cls = MutableClass(
            ImmutableClassDef("Lcom/example/Feed;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, null),
        )
        val forceFalse = cls.addHevalValueHelper("demo.flag", "morpheFlag", "Z") { v -> "const/4 $v, 0x0\nreturn $v" }
        assertEquals("Lcom/example/Feed;->morpheFlag(Z)Z", forceFalse.toString())
        // A second call reuses the helper.
        cls.addHevalValueHelper("demo.flag", "morpheFlag", "Z") { error("not rebuilt") }
        val helper = cls.methods.single { it.name == "morpheFlag" }
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        val body = helper.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_4, Opcode.RETURN, Opcode.RETURN,
            ),
            body.map { it.opcode },
        )
        // Off: return p0 (v1), the stock value.
        assertEquals(body[6], branchTarget(helper, 3))
        assertEquals(1, (body[6] as OneRegisterInstruction).registerA)
        assertThrows<PatchException> { cls.addHevalValueHelper("demo.flag", "morpheWide", "J") { "return-wide p0" } }

        // const/4 v1, 1; return v1  ->  const/4 v1, 1; invoke-static/range {v1 .. v1}, helper; move-result v1; return v1
        val site = method("Z", registers = 3, ImmutableInstruction11n(Opcode.CONST_4, 1, 1), ImmutableInstruction11x(Opcode.RETURN, 1))
        site.filterThroughHevalHelper(1, 1, forceFalse)
        val instructions = site.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.RETURN), instructions.map { it.opcode })
        assertEquals(forceFalse.toString(), (instructions[1] as ReferenceInstruction).reference.toString())
        assertEquals(1, (instructions[1] as RegisterRangeInstruction).startRegister)
        assertEquals(1, (instructions[2] as OneRegisterInstruction).registerA)
        assertThrows<PatchException> { site.filterThroughHevalHelper(1, 3, forceFalse) }
    }

    /** `invoke-static {}, Lcom/example/Feed;->f()<returnType>`. */
    private fun invoke(returnType: String) = ImmutableInstruction35c(
        Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
        ImmutableMethodReference("Lcom/example/Feed;", "f", emptyList(), returnType),
    )

    private fun method(returnType: String, registers: Int, vararg instructions: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
        MutableMethod(
            ImmutableMethod(
                "Lcom/example/Feed;",
                "gated",
                emptyList<ImmutableMethodParameter>(),
                returnType,
                AccessFlags.PUBLIC.value,
                null,
                null,
                ImmutableMethodImplementation(registers, instructions.toList(), null, null),
            ),
        )

    /** The instruction an [OffsetInstruction] at [index] jumps to. */
    private fun branchTarget(method: MutableMethod, index: Int): com.android.tools.smali.dexlib2.iface.instruction.Instruction {
        val instructions = method.implementation!!.instructions.toList()
        val offsets = instructions.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val target = offsets[index] + (instructions[index] as OffsetInstruction).codeOffset
        return instructions[offsets.indexOf(target)]
    }
}
