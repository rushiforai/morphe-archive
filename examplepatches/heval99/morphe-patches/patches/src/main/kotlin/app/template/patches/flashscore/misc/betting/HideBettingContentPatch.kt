package app.template.patches.flashscore.misc.betting

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.flashscore.shared.ForcedConfigValue
import app.template.patches.flashscore.shared.forceRemoteConfigValues
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.addHevalStockPath
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val BETTING_HELPER_NAME = "morpheBettingGet"
private const val TABS_HELPER_NAME = "morpheWithoutOddsTab"

// The league tab-id enum constant for the ODDS tab (its feed id is "OD").
private const val ODDS_TAB = "ODDS"
private const val SET = "Ljava/util/Set;"

// The app's own odds kill switches (used for geo blocks and underage users), by enum constant
// name. Enum names survive R8: Enum.name() is backed by the constructor's string argument.
private const val ODDS_ENABLE = "ODDS_ENABLE"
private val FORCED_KEYS = linkedMapOf(
    ODDS_ENABLE to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_COMPARISON_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_AFFILIATE_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_BETSLIP_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_PREMATCH_BUTTON_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_POSTMATCH_BUTTON_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_LIVE_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_LIVE_BET_BUTTON_ENABLE" to ForcedConfigValue.FALSE,
    "DETAIL_ODDS_SUMMARY_REDIRECT_TO_ODDS" to ForcedConfigValue.FALSE,
    "DETAIL_SUMMARY_GAMBLING_TEXT_ENABLED" to ForcedConfigValue.FALSE,
    "DETAIL_BROADCASTING_BOOKMAKERS_DISABLE" to ForcedConfigValue.TRUE,
    "DETAIL_ODDS_SUMMARY_IMAGES_DISABLED" to ForcedConfigValue.TRUE,
    "BONUS_PROMO_GIFT_ICON_URL" to ForcedConfigValue.EMPTY_STRING,
    "LEAGUE_DETAIL_HEADER_STRIP_SPORTS_ENABLED" to ForcedConfigValue.EMPTY_LIST,
    // The "gamble responsibly" notices that go with the odds: blank text and no link, no titles.
    "GAMBLE_RESPONSIBLY" to ForcedConfigValue.EMPTY_STRING,
    "GAMBLE_RESPONSIBLY_BODY" to ForcedConfigValue.EMPTY_STRING,
    "GAMBLE_RESPONSIBLY_TYPE" to ForcedConfigValue.EMPTY_STRING,
    "GAMBLE_RESPONSIBLY_SUMMARY_PLACEMENT_TYPE" to ForcedConfigValue.EMPTY_STRING,
    "GAMBLE_RESPONSIBLY_URL" to ForcedConfigValue.EMPTY_STRING,
    "GAMBLE_RESPONSIBLY_TITLES" to ForcedConfigValue.EMPTY_LIST,
)

private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val STRIP_HELPER_NAME = "morpheHevalStrip"
private const val AGE_VERIFIED_HELPER_NAME = "morpheHevalAgeVerified"

internal val HIDE_BETTING = HevalFeature(
    id = "flashscore.hide_betting",
    calm = true,
    name = "Hide betting content",
    description = "Hides odds and betting offers.",
    category = FlashscoreControlsCategory.BETTING,
    // The odds keys are read once when the app builds its config, and the lists are built from them.
    restartRequired = true,
)

/** The remote-config keys this feature forces, all behind the switch. */
private val BETTING_GATES: Map<String, String> = FORCED_KEYS.keys.associateWith { HIDE_BETTING.id }

/**
 * Adds (once) a private static `(ArrayList)ArrayList` helper to [classDef]: a new empty ArrayList
 * while the switch is on, the argument unchanged while it is off. It has its own registers, so the
 * constructors that call it need no free local.
 */
private fun MutableClass.addStripHelper(): MethodReference {
    val reference = ImmutableMethodReference(type, STRIP_HELPER_NAME, listOf(ARRAY_LIST), ARRAY_LIST)
    if (methods.any { it.name == STRIP_HELPER_NAME }) return reference
    val helper = ImmutableMethod(
        type, STRIP_HELPER_NAME, listOf(ImmutableMethodParameter(ARRAY_LIST, null, null)), ARRAY_LIST,
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(2),
    ).toMutable()
    helper.addInstructionsChecked(0, "return-object p0")
    helper.addHevalGate(HIDE_BETTING.id) { v ->
        "new-instance $v, $ARRAY_LIST\ninvoke-direct {$v}, $ARRAY_LIST-><init>()V\nreturn-object $v"
    }
    methods.add(helper)
    return reference
}

/**
 * Passes every list parameter of this (ArrayList, ...) constructor through the class's strip helper
 * first: with the switch on the original code sees empty lists, off it sees the real ones. A
 * parameter register may be above v15: the call is `/range` and `move-result-object` takes 8 bits.
 */
private fun MutableMethod.emptyArrayListParameters(helper: MethodReference) {
    val smali = parameterTypes.indices.joinToString("\n") { i ->
        "invoke-static/range {p${i + 1} .. p${i + 1}}, $helper\nmove-result-object p${i + 1}"
    }
    addInstructionsChecked(0, smali)
}

@Suppress("unused")
val hideBettingContentPatch = flashscoreControls.featurePatch(
    HIDE_BETTING,
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    default = false,
) {
    // The paid "Hide betting content" setting is dead code (its prefs are never written and the
    // toggle has no click handler), so this drives the app's own remote-config odds kill switch
    // instead: the odds-off UI is a state the app already supports for geo blocks and minors.
    // The "revive" bookmaker banners in AdvertZone are left to Disable ads.
    // Every site below is behind the Patch settings switch flashscore.hide_betting (restart
    // required: the config is read once per process); with it off the stock values run.
    run {
        // ── 1. Remote config: answer the betting keys with the "odds off" values ───────────
        //
        //  The config value class's get() goes through a helper that answers these keys (see
        //  forceRemoteConfigValues; Disable ads chains its own helper the same way). In 26.10.2
        //  and 26.11.4 no forced key is read through an R8-inlined holder get() (checked by
        //  FlashscoreSmokeTest). ODDS_ENABLE is the master switch: without it the patch does
        //  nothing useful.
        forceRemoteConfigValues(
            patchName = "Hide betting content",
            helperName = BETTING_HELPER_NAME,
            forced = FORCED_KEYS,
            required = setOf(ODDS_ENABLE),
            gates = BETTING_GATES,
        )

        // ── 2. Sponsored strip: never carries any bookmaker item ───────────────────────────
        val sponsoredConstructors = SponsoredStripToStringFingerprint.classDef.methods.filter {
            it.name == "<init>" && it.implementation != null && it.parameterTypes.isNotEmpty() &&
                it.parameterTypes.all { type -> type.toString() == ARRAY_LIST }
        }
        if (sponsoredConstructors.isEmpty()) {
            throw PatchException("SponsoredStripWidgetDTO has no ArrayList-only constructor")
        }
        val sponsoredHelper = mutableClassDefBy(SponsoredStripToStringFingerprint.classDef.type).addStripHelper()
        sponsoredConstructors.forEach { it.emptyArrayListParameters(sponsoredHelper) }

        // ── 3. Bonus strip: no bonuses (26.10.2: summary and odds bonuses) ─────────────────
        val bonusConstructors = BonusStripToStringFingerprint.classDef.methods.filter {
            it.name == "<init>" && it.implementation != null && it.parameterTypes.isNotEmpty() &&
                it.parameterTypes.all { type -> type.toString() == ARRAY_LIST }
        }
        if (bonusConstructors.isEmpty()) {
            throw PatchException("BonusStripWidgetDTO has no ArrayList-only constructor")
        }
        val bonusHelper = mutableClassDefBy(BonusStripToStringFingerprint.classDef.type).addStripHelper()
        bonusConstructors.forEach { it.emptyArrayListParameters(bonusHelper) }

        // ── 4. League pages: no ODDS tab ───────────────────────────────────────────────────
        //
        //  The header model's constructor runs its tab set through a new static helper that
        //  copies it without the constant named ODDS. The tab bar, and the summary's
        //  hasStandaloneOddsTab, are derived from that set.
        val headerModel = LeagueHeaderModelToStringFingerprint.classDef
        val headerConstructors = headerModel.methods.filter {
            it.name == "<init>" && it.implementation != null &&
                it.parameterTypes.count { type -> type.toString() == SET } == 1
        }
        if (headerConstructors.isEmpty()) {
            throw PatchException("${headerModel.type} has no constructor with a single tab Set")
        }

        // v0 = result, v1 = iterator, v2 = element, v3 = scratch, v4 = "ODDS", p0 (v5) = tabs.
        headerModel.methods.add(
            ImmutableMethod(
                headerModel.type,
                TABS_HELPER_NAME,
                listOf(ImmutableMethodParameter(SET, null, null)),
                SET,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                null,
                null,
                MutableMethodImplementation(6),
            ).toMutable().apply {
                // Added last (see the end of this block): while the switch is off the helper
                // returns the stock tab set.
                addInstructionsWithLabelsChecked(
                    0,
                    """
                        if-nez p0, :copy
                        return-object p0
                        :copy
                        new-instance v0, Ljava/util/LinkedHashSet;
                        invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V
                        invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
                        move-result-object v1
                        const-string v4, "$ODDS_TAB"
                        :next
                        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
                        move-result v2
                        if-eqz v2, :done
                        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                        move-result-object v2
                        instance-of v3, v2, Ljava/lang/Enum;
                        if-eqz v3, :keep
                        move-object v3, v2
                        check-cast v3, Ljava/lang/Enum;
                        invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;
                        move-result-object v3
                        invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v3
                        if-nez v3, :next
                        :keep
                        invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
                        goto :next
                        :done
                        return-object v0
                    """.trimIndent(),
                )
                // Off: hand the tab set back untouched (v0 is free at entry; p0 is the set).
                addHevalStockPath(HIDE_BETTING.id) { _ -> "return-object p0" }
            },
        )

        headerConstructors.forEach { constructor ->
            // The constructor has 13 parameters, so the set's register may be beyond the 4-bit
            // range of a plain invoke. p0 is `this`; long/double parameters take two registers.
            val parameters = constructor.parameterTypes.map { it.toString() }
            val setIndex = parameters.indexOf(SET)
            val tabs = "p${1 + parameters.take(setIndex).sumOf { if (it == "J" || it == "D") 2L else 1L }}"
            constructor.addInstructionsChecked(
                0,
                """
                    invoke-static/range {$tabs .. $tabs}, ${headerModel.type}->$TABS_HELPER_NAME($SET)$SET
                    move-result-object $tabs
                """.trimIndent(),
            )
        }

        // ── 5. League summary: no Winner Odds (outright odds) block ────────────────────────
        //
        //  The summary params' isAgeVerified (the boolean the toString prints after
        //  ", isAgeVerified=") only decides whether the outright odds widget is created. The
        //  constructor passes the value through a (Z)Z helper right before every store of that field;
        //  the helper answers false while the switch is on and the argument unchanged while it is
        //  off, so the widget stays Hidden only while the switch is on and no free register is
        //  needed at the stores. Age verification itself is not touched.
        val summaryParams = LeagueSummaryParamsToStringFingerprint.classDef
        val toStringInsns = LeagueSummaryParamsToStringFingerprint.method.implementation!!.instructions.toList()
        val labelIndex = toStringInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ", isAgeVerified="
        }
        val ageVerifiedField = toStringInsns.drop(labelIndex + 1)
            .firstOrNull { it.opcode == Opcode.IGET_BOOLEAN }
            ?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?.takeIf { it.definingClass == summaryParams.type }
            ?: throw PatchException("${summaryParams.type}.toString() prints no isAgeVerified field")

        var forcedStores = 0
        val ageHelper = mutableClassDefBy(summaryParams.type).addHevalValueHelper(
            HIDE_BETTING.id, AGE_VERIFIED_HELPER_NAME, "Z",
        ) { v -> "const/4 $v, 0x0\nreturn $v" }
        summaryParams.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { constructor ->
            val stores = constructor.implementation!!.instructions.withIndex().filter { (_, insn) ->
                insn.opcode == Opcode.IPUT_BOOLEAN && (insn as ReferenceInstruction).reference == ageVerifiedField
            }.map { (index, insn) -> index to (insn as OneRegisterInstruction).registerA }
            // Back to front, so the earlier indices stay valid.
            stores.reversed().forEach { (index, register) ->
                constructor.filterThroughHevalHelper(index, register, ageHelper)
            }
            forcedStores += stores.size
        }
        if (forcedStores == 0) {
            throw PatchException("No ${summaryParams.type} constructor stores ${ageVerifiedField.name}")
        }
    }
}
