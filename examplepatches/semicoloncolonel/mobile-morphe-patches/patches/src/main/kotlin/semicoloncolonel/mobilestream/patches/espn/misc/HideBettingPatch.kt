package semicoloncolonel.mobilestream.patches.espn.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.espn.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// ESPN 8.29.0 — Hide betting.
//
//   1. ESPN reads its betting switches from the "sportsBettingPrefs" settings
//      file through one helper. Its answers are changed: "hideSportsBetting"
//      reads as on, and the odds strip ("six pack"), My Bets, the bet
//      container, the soccer three-pack, and DraftKings account linking read
//      as off. That also removes the ESPN BET section from the More tab. ESPN
//      syncs the hide setting to the user's ESPN profile at sign-in.
//   2. GamesIntentComposite.getOdds() returns nothing, so no game shows odds,
//      odds promos, or the bet container. Every caller already handles a game
//      without odds.
//   3. The sportsbook exit prompt ("Go to DraftKings") does nothing, so odds
//      taps, article links, and deep links never open a sportsbook.
//   4. Every betting feature ESPN sends with its requests is set to "false",
//      as ESPN does for users under 18, so pages built on the server, such as
//      Gamecast, leave betting out.
//   5. The odds sections of team and league pages are removed.
//   6. The "Sports Betting Odds Links" switch in settings is removed, so it
//      cannot turn betting back on.
// ─────────────────────────────────────────────────────────────────────────────

private const val HIDE = "Lsemicoloncolonel/mobilestream/extension/espn/HideBetting;"

private fun Method.hasString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

// SportsBettingAccountRepository's "is betting hidden" check.
internal object HideSportsBettingCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.hasString("sportsBettingPrefs") && method.hasString("hideSportsBetting") },
)

internal object GetOddsFingerprint : Fingerprint(
    definingClass = "Lcom/espn/data/models/content/event/GamesIntentComposite;",
    name = "getOdds",
    parameters = listOf(),
    returnType = "Lcom/espn/bet/data/model/odds/OddsApiModel;",
)

internal object ExitModalShowFingerprint : Fingerprint(
    name = "show",
    returnType = "V",
    custom = { _, classDef -> classDef.methods.any { it.hasString("betting interaction - success - skip interstitial") } },
)

internal object FeatureTogglesGetFingerprint : Fingerprint(
    name = "get",
    parameters = listOf(),
    returnType = "Ljava/util/LinkedHashMap;",
    custom = { _, classDef -> classDef.methods.any { it.name == "<init>" && it.hasString("FeatureTogglePreferences") } },
)

internal object ClubhouseSectionsFingerprint : Fingerprint(
    definingClass = "Lcom/dtci/mobile/clubhouse/model/JSClubhouseMeta;",
    name = "getSections",
    parameters = listOf(),
    returnType = "Ljava/util/List;",
)

internal object HideSportsBettingToggleFingerprint : Fingerprint(
    name = "addHideSportsBettingToggle",
    returnType = "V",
)

/** Inserts [smali] before every [opcode] return; the lambda gets the returned register. */
private fun MutableMethod.beforeReturns(opcode: Opcode, smali: (Int) -> String): Int {
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == opcode }.toList()
    returns.reversed().forEach { (index, instruction) ->
        addInstructions(index, smali((instruction as OneRegisterInstruction).registerA))
    }
    return returns.size
}

@Suppress("unused")
val hideBettingPatch = bytecodePatch(
    name = "Hide betting",
    description = "Removes odds, sportsbook links and promos, and DraftKings account linking.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. The betting settings helper (settings file, key, default) -> boolean.
        val helper = HideSportsBettingCheckFingerprint.method.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .firstOrNull {
                it.returnType == "Z" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z")
            } ?: throw PatchException("Betting settings helper not found")
        val read = mutableClassDefBy(helper.definingClass).methods.first {
            it.name == helper.name &&
                it.parameterTypes.map { p -> p.toString() } == helper.parameterTypes.map { p -> p.toString() }
        }
        val isStatic = read.accessFlags and 0x8 != 0
        val file = if (isStatic) "p0" else "p1"
        val key = if (isStatic) "p1" else "p2"
        val hooked = read.beforeReturns(Opcode.RETURN) { r ->
            """
                invoke-static { $file, $key, v$r }, $HIDE->pref(Ljava/lang/String;Ljava/lang/String;Z)Z
                move-result v$r
            """.trimIndent()
        }
        if (hooked == 0) throw PatchException("Betting settings helper has no return")

        // 2. No odds on any game.
        GetOddsFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // 3. No sportsbook exit prompt or redirect.
        ExitModalShowFingerprint.method.addInstructions(0, "return-void")

        // 4. Betting features sent with each request: all off.
        if (FeatureTogglesGetFingerprint.method.beforeReturns(Opcode.RETURN_OBJECT) { r ->
                "invoke-static { v$r }, $HIDE->featuresOff(Ljava/util/Map;)V"
            } == 0
        ) {
            throw PatchException("Betting feature store has no return")
        }

        // 5. No odds sections on team and league pages.
        ClubhouseSectionsFingerprint.method.beforeReturns(Opcode.RETURN_OBJECT) { r ->
            """
                invoke-static { v$r }, $HIDE->sections(Ljava/util/List;)Ljava/util/List;
                move-result-object v$r
            """.trimIndent()
        }

        // 6. No settings switch that turns betting back on.
        HideSportsBettingToggleFingerprint.method.addInstructions(0, "return-void")
    }
}
