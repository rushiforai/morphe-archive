package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/** The message handler's opener: the screen, the link, the link it was rewritten from, then the chat it came from. */
internal const val SYNTHETIC_CHAT_LINK =
    "LX/8Wg;->A0F(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;$FB_USER_SESSION$MESSAGE${THREAD_KEY_TYPE}LX/59J;)V"
/** The browser launcher's own entry, for the screens that ask it directly. */
internal const val SYNTHETIC_BROWSER_LAUNCH =
    "$MESSENGER_BROWSER_LAUNCHER->A0I(Landroid/content/Context;Landroid/net/Uri;${FB_USER_SESSION}LX/59J;LX/4sl;)V"
/** The launcher's static second entry, the one that takes a launcher of its own along with the screen and the link. */
internal const val SYNTHETIC_BROWSER_SELF =
    "$MESSENGER_BROWSER_LAUNCHER->A0B(Landroid/content/Context;Landroid/net/Uri;$FB_USER_SESSION$MESSENGER_BROWSER_LAUNCHER" +
        "LX/4sl;)V"
/** Instagram's own hand-off, which a card's instagram.com link goes through: the screen, then the link. */
internal const val SYNTHETIC_INSTAGRAM_LAUNCH = "LX/Ra7;->A00(Landroid/content/Context;Landroid/net/Uri;)V"
/** The Bloks open-URL action a shared link's preview card runs: the screen, the Bloks context and a number. */
internal const val SYNTHETIC_BLOKS_OPEN = "LX/Rwk;->Ana(Landroid/content/Context;LX/9Ae;Ljava/lang/Integer;)V"

/** An opener's body cut to what the gate cares about: it reads its own arguments and returns nothing. */
private val OPEN_BODY = """
    invoke-virtual {p0, p1, p2}, LX/8Wg;->A00(Landroid/content/Context;Landroid/net/Uri;)V
    return-void
""".trimIndent()

private val STATIC_OPENER = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun opener(id: String, body: String = OPEN_BODY, registers: Int = 10,
    flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, registers, flags)

/** The static entry's body, which reads the same two arguments one register down. */
private val SELF_BODY = """
    invoke-virtual {p3, p0, p1}, LX/8Wg;->A00(Landroid/content/Context;Landroid/net/Uri;)V
    return-void
""".trimIndent()

/** The launcher's own second entry is static on every tested build, so its screen and link start a register lower. */
private fun selfOpener(id: String = SYNTHETIC_BROWSER_SELF, body: String = SELF_BODY, registers: Int = 10) =
    fixtureMethod(id, body, registers, STATIC_OPENER)

/** Instagram's hand-off cut down: it names the app it hands the link to and the tag it reports a failed launch under. */
private fun instagramLaunch(
    id: String = SYNTHETIC_INSTAGRAM_LAUNCH,
    app: String = "com.instagram.android",
    tag: String = "InstagramLinkLauncher",
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
) = fixtureMethod(id, """
    const-string v0, "$app"
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    const-string v1, "$tag"
    return-void
""".trimIndent(), 7, flags)

/** 347617503's family builds the card's VIEW intent from the action in v8 and the link in v1 itself. */
private val BLOKS_INTENT_NEW = """
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0, v8, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
""".trimIndent()

/** 347617497's family hands the link and the action to a static helper that returns the intent. */
private val BLOKS_INTENT_HELPER = """
    invoke-static {v1, v8}, LX/T6E;->A07(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;
    move-result-object v0
""".trimIndent()

private const val CARD_LAUNCH = "LX/0kx;->A0A(Landroid/content/Context;Landroid/content/Intent;)Z"
private const val CARD_CATEGORY = "Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;"

/** A launch block that sends the link out: the intent, its categories, then the launcher and a goto to the launch. */
private fun bloksExternal(label: String, intent: String, categories: Int, extra: String) = buildString {
    appendLine(":$label")
    appendLine(intent)
    repeat(categories) { appendLine("invoke-virtual {v0, ${if (it % 2 == 0) "v7" else "v6"}}, $CARD_CATEGORY") }
    appendLine("move-result-object v1")
    if (extra.isNotEmpty()) appendLine(extra)
    appendLine("invoke-static {}, LX/08t;->A03()LX/0kx;")
    appendLine("move-result-object v0")
    append("goto :launch")
}

/**
 * The Bloks open-URL action cut down to its routes: the screen copied at entry, the link read from the action, a
 * Messenger route that adds one category and falls into the launch, an app-link route with both categories that ends
 * in another handler, and the external block both scheme checks jump to, built the way [intent]'s family builds it.
 */
private fun bloksOpen(
    id: String = SYNTHETIC_BLOKS_OPEN,
    intent: String = BLOKS_INTENT_NEW,
    categories: Int = 2,
    twice: Boolean = false,
    named: Boolean = true,
    extra: String = "",
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
) = fixtureMethod(id, buildString {
    appendLine("move-object/from16 v13, p1")
    appendLine("move-object/from16 v2, p0")
    appendLine("iget-object v1, v2, LX/Rwk;->A00:Landroid/net/Uri;")
    if (named) appendLine("const-string v3, \"$BLOKS_OPEN_URL\"")
    appendLine("""
        const-string v8, "android.intent.action.VIEW"
        const-string v7, "android.intent.category.DEFAULT"
        const-string v6, "android.intent.category.BROWSABLE"
        invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
        move-result-object v11
        if-eqz v11, :app_link
        invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
        move-result-object v12
        if-nez v12, :external
        invoke-virtual {v1}, Landroid/net/Uri;->isHierarchical()Z
        move-result v4
        if-eqz v4, :external
    """.trimIndent())
    if (twice) appendLine("if-nez v11, :external_too")
    appendLine("""
        new-instance v0, Landroid/content/Intent;
        invoke-direct {v0, v8, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
        invoke-virtual {v0, v7}, $CARD_CATEGORY
        move-result-object v1
        invoke-static {}, LX/08t;->A03()LX/0kx;
        move-result-object v0
        :launch
        invoke-virtual {v0, v13, v1}, $CARD_LAUNCH
        return-void
        :app_link
        new-instance v0, Landroid/content/Intent;
        invoke-direct {v0, v8, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
        invoke-virtual {v0, v7}, $CARD_CATEGORY
        invoke-virtual {v0, v6}, $CARD_CATEGORY
        move-result-object v1
        invoke-static {v13, v1}, LX/Fv4;->A00(Landroid/content/Context;Landroid/content/Intent;)V
        return-void
    """.trimIndent())
    append(bloksExternal("external", intent, categories, extra))
    if (twice) append("\n" + bloksExternal("external_too", intent, categories, extra))
}, 21, flags)

/**
 * The five openers beside a method of the same class that shares part of their shape and never gets a hook. [elsewhere]
 * goes into the message handler's class, which is where a launcher-shaped method has to be refused for its class alone.
 */
internal fun linkPlayerFixture(
    chat: MutableMethod = opener(SYNTHETIC_CHAT_LINK),
    launch: MutableMethod = opener(SYNTHETIC_BROWSER_LAUNCH),
    self: MutableMethod = selfOpener(),
    elsewhere: List<MutableMethod> = emptyList(),
    // The external-browser check lives on the launcher too, and the discovery union brings its own copy of it.
    browserCheck: Boolean = true,
    instagram: MutableMethod = instagramLaunch(),
    bloks: MutableMethod = bloksOpen(),
): List<MutableClass> = listOf(
    fixtureClass("LX/8Wg;", listOf(chat,
        fixtureMethod("LX/8Wg;->A0E(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;$FB_USER_SESSION$MESSAGE$THREAD_KEY_TYPE)V",
            OPEN_BODY, 10)) + elsewhere),
    fixtureClass(MESSENGER_BROWSER_LAUNCHER, listOf(launch, self) + if (!browserCheck) emptyList() else listOf(
        fixtureMethod("$MESSENGER_BROWSER_LAUNCHER->A0K(Landroid/net/Uri;$FB_USER_SESSION)Z",
            "const/4 v0, 0x0\nreturn v0", 4))),
    fixtureClass(instagram.definingClass, listOf(instagram)),
    fixtureClass(bloks.definingClass, listOf(bloks)),
)

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as ReferenceInstruction).reference.toString()

/** A body's opcodes with alignment nops dropped and widened gotos read as gotos, which an insert may change. */
private fun List<Instruction>.linkKinds() = filter { it.opcode != Opcode.NOP }
    .map { if (it.opcode == Opcode.GOTO_16 || it.opcode == Opcode.GOTO_32) Opcode.GOTO else it.opcode }

/** The stock body's kinds once the four gate instructions at [gate] come out. */
private fun List<Instruction>.withoutGate(gate: Int) = (take(gate) + drop(gate + 4)).linkKinds()

private val LINK_GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private val ALL_OPENERS = setOf(SYNTHETIC_CHAT_LINK, SYNTHETIC_BROWSER_LAUNCH, SYNTHETIC_BROWSER_SELF,
    SYNTHETIC_INSTAGRAM_LAUNCH, SYNTHETIC_BLOKS_OPEN)

class LinkPlayerTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(LINK_PLAYER).map { it.hookId() }.toSet()

    @Test fun bothOpenersAreFoundByTheirShape() {
        assertEquals(ALL_OPENERS, found(linkPlayerFixture()))
        validateControls(mirroredControls(linkPlayerFixture()), setOf(LINK_PLAYER))
    }

    @Test fun everyProfileHooksAllFive() {
        assertEquals(5, BASE_PROFILE.hooks.getValue(LINK_PLAYER).size)
        assertEquals(ALL_OPENERS, SYNTHETIC_PROFILE.hooks.getValue(LINK_PLAYER))
        for ((code, profile) in controlProfiles) {
            assertEquals(5, profile.hooks.getValue(LINK_PLAYER).size, code.toString())
        }
    }

    /** #246: a card's TikTok link left through the Bloks action's browser intent, and its Instagram link through Instagram's. */
    @Test fun theCardsOwnRoutesAreFoundByTheirShape() {
        val classes = linkPlayerFixture(bloks = bloksOpen(intent = BLOKS_INTENT_HELPER))
        assertEquals(ALL_OPENERS, found(classes))
        val site = assertNotNull(bloksOpen().bloksLaunchSite())
        // The external block is the one both scheme checks jump to, not the app-link block with the same two categories.
        assertEquals(Opcode.NEW_INSTANCE, bloksOpen().code()[site.start].opcode)
        assertEquals(listOf(13, 1, 0), listOf(site.screen, site.link, site.scratch))
    }

    @Test fun lookalikesOfTheCardsRoutesAreNotAnOpener() {
        val bloksless = ALL_OPENERS - SYNTHETIC_BLOKS_OPEN
        val instagramless = ALL_OPENERS - SYNTHETIC_INSTAGRAM_LAUNCH
        val cases = mapOf(
            "a launch block with one category" to (bloksless to linkPlayerFixture(bloks = bloksOpen(categories = 1))),
            "two launch blocks" to (bloksless to linkPlayerFixture(bloks = bloksOpen(twice = true))),
            "an action that never names itself" to (bloksless to linkPlayerFixture(bloks = bloksOpen(named = false))),
            "a block that writes over the screen" to (bloksless to linkPlayerFixture(bloks = bloksOpen(extra = "const/4 v13, 0x0"))),
            "a helper's intent landing on the link it reads" to (bloksless to linkPlayerFixture(bloks = bloksOpen(
                intent = BLOKS_INTENT_HELPER.replace("move-result-object v0", "move-result-object v1")))),
            "a static action" to (bloksless to linkPlayerFixture(bloks = bloksOpen(
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
            "Threads' hand-off" to (instagramless to linkPlayerFixture(instagram = instagramLaunch(
                "LX/Ra8;->A00(Landroid/content/Context;Landroid/net/Uri;)V", "com.instagram.barcelona", "ThreadsLinkLauncher"))),
            "a hand-off that never names the app" to (instagramless to linkPlayerFixture(instagram = instagramLaunch(
                app = "com.facebook.katana"))),
            "a static hand-off" to (instagramless to linkPlayerFixture(instagram = instagramLaunch(
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
            "a hand-off taking the link as text" to (instagramless to linkPlayerFixture(instagram = instagramLaunch(
                "LX/Ra7;->A00(Landroid/content/Context;Ljava/lang/String;)V"))),
        )
        for ((case, expected) in cases) assertEquals(expected.first, found(expected.second), case)
    }

    @Test fun lookalikesAreNotAnOpener() {
        val cases = mapOf(
            "the chat opener answering yes or no" to linkPlayerFixture(chat = opener(
                SYNTHETIC_CHAT_LINK.dropLast(1) + "Z", body = "const/4 v0, 0x0\nreturn v0")),
            "the chat opener without the chat it came from" to linkPlayerFixture(chat = opener(
                "LX/8Wg;->A0F(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;$FB_USER_SESSION$MESSAGE${THREAD_KEY_TYPE}I)V")),
            "the launcher's entry taking a number" to linkPlayerFixture(launch = opener(
                "$MESSENGER_BROWSER_LAUNCHER->A0I(Landroid/content/Context;Landroid/net/Uri;${FB_USER_SESSION}LX/59J;I)V")),
            "the launcher's static entry without a session" to linkPlayerFixture(self = selfOpener(
                "$MESSENGER_BROWSER_LAUNCHER->A0B(Landroid/content/Context;Landroid/net/Uri;$MESSENGER_BROWSER_LAUNCHER" +
                    "LX/59J;LX/4sl;)V")),
        )
        for ((case, classes) in cases) {
            val hooks = found(classes)
            assertEquals(4, hooks.size, "$case: $hooks")
        }
        // Both launcher entries' shapes on the message handler's class, where neither belongs.
        val strays = linkPlayerFixture(elsewhere = listOf(
            opener("LX/8Wg;->A0I(Landroid/content/Context;Landroid/net/Uri;${FB_USER_SESSION}LX/59J;LX/4sl;)V"),
            selfOpener("LX/8Wg;->A0B(Landroid/content/Context;Landroid/net/Uri;$FB_USER_SESSION${MESSENGER_BROWSER_LAUNCHER}LX/4sl;)V")))
        assertEquals(ALL_OPENERS, found(strays))
    }

    @Test fun theLinkPassesTheExtensionAndNothingElseMoves() {
        // The screen and the link sit one register lower in the static opener, and the gate has to read them there.
        val cases = mapOf(SYNTHETIC_CHAT_LINK to opener(SYNTHETIC_CHAT_LINK),
            SYNTHETIC_BROWSER_LAUNCH to opener(SYNTHETIC_BROWSER_LAUNCH), SYNTHETIC_BROWSER_SELF to selfOpener(),
            SYNTHETIC_INSTAGRAM_LAUNCH to instagramLaunch())
        for ((id, method) in cases) {
            val words = method.parameterTypes.size + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
            val screen = method.implementation!!.registerCount - words + if (id == SYNTHETIC_BROWSER_SELF) 0 else 1
            val before = method.code()
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
            val code = method.code()
            assertEquals(LINK_PLAYER_HELPER, code[0].ref(), id)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode, id)
            assertEquals(screen, (code[0] as RegisterRangeInstruction).startRegister, id)
            assertEquals(2, (code[0] as RegisterRangeInstruction).registerCount, id)
            assertEquals(Opcode.MOVE_RESULT, code[1].opcode, id)
            assertEquals(0, (code[1] as OneRegisterInstruction).registerA, id)
            assertEquals(Opcode.IF_EQZ, code[2].opcode, id)
            assertEquals(Opcode.RETURN_VOID, code[3].opcode, id)
            assertEquals(4, (code[2] as BuilderOffsetInstruction).target.location.index, id)
            // Messenger's own opener is still there, whole, and runs when the extension says no.
            assertEquals(before, code.drop(4), id)
            // A second pass finds the gate already there and leaves it alone.
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
            assertEquals(code, method.code(), "$id second pass")
        }
    }

    /**
     * #246: the gate goes where the card's external block starts building its intent, in both families' shapes. The scheme
     * checks that jumped to the block now land on the gate, a no runs the block as Messenger wrote it, and every register
     * the gate touches comes off the block's own instructions.
     */
    @Test fun aCardsExternalLinkPassesTheExtensionBeforeItsIntentIsBuilt() {
        for ((family, intent) in mapOf("347617503" to BLOKS_INTENT_NEW, "347617497" to BLOKS_INTENT_HELPER)) {
            val method = bloksOpen(intent = intent)
            val before = method.code()
            val site = assertNotNull(method.bloksLaunchSite(), family)
            val gate = site.start
            val launch = before.single { it.opcode == Opcode.INVOKE_VIRTUAL && it.ref() == CARD_LAUNCH } as FiveRegisterInstruction
            val (link, scratch) = if (intent == BLOKS_INTENT_NEW) {
                (before[gate + 1] as FiveRegisterInstruction).registerE to (before[gate] as OneRegisterInstruction).registerA
            } else (before[gate] as FiveRegisterInstruction).registerC to (before[gate + 1] as OneRegisterInstruction).registerA
            val jumpers = before.filter { (it as? BuilderOffsetInstruction)?.target?.location?.index == gate }
            assertEquals(2, jumpers.size, family)

            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
            val after = method.code()
            assertEquals(before.size + 4, after.size, family)
            val ask = after[gate] as FiveRegisterInstruction
            assertEquals(Opcode.INVOKE_STATIC, ask.opcode, family)
            assertEquals(LINK_PLAYER_HELPER, ask.ref(), family)
            assertEquals(listOf(2, launch.registerD, link), listOf(ask.registerCount, ask.registerC, ask.registerD), family)
            assertEquals(Opcode.MOVE_RESULT, after[gate + 1].opcode, family)
            assertEquals(scratch, (after[gate + 1] as OneRegisterInstruction).registerA, family)
            assertEquals(Opcode.IF_EQZ, after[gate + 2].opcode, family)
            assertEquals(scratch, (after[gate + 2] as OneRegisterInstruction).registerA, family)
            assertEquals(gate + 4, (after[gate + 2] as BuilderOffsetInstruction).target.location.index, family)
            assertEquals(Opcode.RETURN_VOID, after[gate + 3].opcode, family)
            assertEquals(before[gate].opcode, after[gate + 4].opcode, family)
            assertEquals(before[gate].ref(), after[gate + 4].ref(), family)
            for (jumper in jumpers) {
                assertEquals(gate, (jumper as BuilderOffsetInstruction).target.location.index, "$family: a scheme check skips the gate")
            }
            assertEquals(before.linkKinds(), after.withoutGate(gate), family)

            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
            assertEquals(after, method.code(), "$family second pass")
        }
    }

    @Test fun anActionWithNoRoomForTheAnswerRefusesBeforeAnyEdit() {
        // Four words of arguments in four registers: the action's block finds nowhere local to write the answer.
        val starved = MutableMethod(bloksOpen().starved())
        assertNotNull(starved.bloksLaunchSite())
        val before = starved.code()
        val refused = assertFailsWith<PatchException> {
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(starved)))
        }
        assertTrue(refused.message!!.contains("no local register"), refused.message!!)
        assertEquals(before.size, starved.code().size)
    }

    @Test fun anOpenerWithNoRoomForTheAnswerRefusesBeforeAnyEdit() {
        // Ten words of arguments in ten registers leaves nothing local to write the extension's answer into.
        val method = opener(SYNTHETIC_CHAT_LINK, registers = 8)
        val before = method.code()
        val refused = assertFailsWith<PatchException> {
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
        }
        assertTrue(refused.message!!.contains("no local register"), refused.message!!)
        assertEquals(before, method.code())
    }

    @Test fun anOpenerThatJumpsBackToItsFirstInstructionRefuses() {
        val method = opener(SYNTHETIC_BROWSER_LAUNCH, body = """
            :top
            invoke-virtual {p0, p1, p2}, LX/8Wg;->A00(Landroid/content/Context;Landroid/net/Uri;)V
            goto :top
        """.trimIndent())
        val before = method.code()
        val refused = assertFailsWith<PatchException> {
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
        }
        assertTrue(refused.message!!.contains("starts on a jump target"), refused.message!!)
        assertEquals(before, method.code())
    }

    @Test fun everySupportedBuildSendsItsLinksPastTheExtension() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val openers = findLinkPlayer(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(LINK_PLAYER), openers.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(LINK_PLAYER to openers), setOf(LINK_PLAYER))
            // Each build has one Bloks action and one Instagram hand-off beside the three openers.
            assertEquals(1, openers.count { it.isBloksLinkOpen() }, code)
            assertEquals(1, openers.count { it.isInstagramLinkLaunch() }, code)
            for (opener in openers) {
                val label = "$code ${opener.hookId()}"
                val method = MutableMethod(opener)
                val before = method.code()
                val site = method.bloksLaunchSite()
                // The block's goto lands on the action's one launch call, whose Context register is the screen.
                val launch = site?.let { found ->
                    val jump = (found.start until before.size).first { before[it].opcode in LINK_GOTOS }
                    before[before.branchTarget(jump)] as FiveRegisterInstruction
                }
                injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
                val after = method.code()
                val gate = site?.start ?: 0
                assertEquals(LINK_PLAYER_HELPER, after[gate].ref(), label)
                assertEquals(Opcode.IF_EQZ, after[gate + 2].opcode, label)
                assertEquals(gate + 4, (after[gate + 2] as BuilderOffsetInstruction).target.location.index, label)
                if (site != null && launch != null) {
                    assertTrue(launch.ref().endsWith("(Landroid/content/Context;Landroid/content/Intent;)Z"), label)
                    val built = if (before[gate].opcode == Opcode.NEW_INSTANCE) (before[gate + 1] as FiveRegisterInstruction).registerE
                        else (before[gate] as FiveRegisterInstruction).registerC
                    val ask = after[gate] as FiveRegisterInstruction
                    assertEquals(listOf(launch.registerD, built), listOf(ask.registerC, ask.registerD), label)
                }
                assertEquals(before.linkKinds(), after.withoutGate(gate), label)
                injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
                assertEquals(after.size, method.code().size, "$label second pass")
            }
        }
    }
}
