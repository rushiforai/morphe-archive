package app.template.patches.flashscore.misc.betting

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.flashscore.shared.ForcedConfigValue
import app.template.patches.flashscore.shared.forceRemoteConfigValues
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

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
)

private const val ARRAY_LIST = "Ljava/util/ArrayList;"

/** Replaces every list parameter of this (ArrayList, ...) constructor with a new empty ArrayList. */
private fun MutableMethod.replaceArrayListParameters() {
    val smali = parameterTypes.indices.joinToString("\n") { i ->
        """
            new-instance p${i + 1}, $ARRAY_LIST
            invoke-direct/range {p${i + 1} .. p${i + 1}}, $ARRAY_LIST-><init>()V
        """.trimIndent()
    }
    addInstructionsChecked(0, smali)
}

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    // The paid "Hide betting content" setting is dead code (its prefs are never written and the
    // toggle has no click handler), so this drives the app's own remote-config odds kill switch
    // instead: the odds-off UI is a state the app already supports for geo blocks and minors.
    // The "revive" bookmaker banners in AdvertZone are left to Disable ads.
    execute {
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
        )

        // ── 2. Sponsored strip: never carries any bookmaker item ───────────────────────────
        val sponsoredConstructors = SponsoredStripToStringFingerprint.classDef.methods.filter {
            it.name == "<init>" && it.implementation != null && it.parameterTypes.isNotEmpty() &&
                it.parameterTypes.all { type -> type.toString() == ARRAY_LIST }
        }
        if (sponsoredConstructors.isEmpty()) {
            throw PatchException("SponsoredStripWidgetDTO has no ArrayList-only constructor")
        }
        sponsoredConstructors.forEach { it.replaceArrayListParameters() }

        // ── 3. Bonus strip: no bonuses (26.10.2: summary and odds bonuses) ─────────────────
        val bonusConstructors = BonusStripToStringFingerprint.classDef.methods.filter {
            it.name == "<init>" && it.implementation != null && it.parameterTypes.isNotEmpty() &&
                it.parameterTypes.all { type -> type.toString() == ARRAY_LIST }
        }
        if (bonusConstructors.isEmpty()) {
            throw PatchException("BonusStripWidgetDTO has no ArrayList-only constructor")
        }
        bonusConstructors.forEach { it.replaceArrayListParameters() }

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
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(6),
            ).toMutable().apply {
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
        //  constructor loads false right before every store of that field, so the widget stays
        //  Hidden. Age verification itself is not touched.
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
        summaryParams.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { constructor ->
            val stores = constructor.implementation!!.instructions.withIndex().filter { (_, insn) ->
                insn.opcode == Opcode.IPUT_BOOLEAN && (insn as ReferenceInstruction).reference == ageVerifiedField
            }.map { (index, insn) -> index to (insn as OneRegisterInstruction).registerA }
            // Back to front, so the earlier indices stay valid.
            stores.reversed().forEach { (index, register) ->
                constructor.addInstructionsChecked(index, "${if (register < 16) "const/4" else "const/16"} v$register, 0x0")
            }
            forcedStores += stores.size
        }
        if (forcedStores == 0) {
            throw PatchException("No ${summaryParams.type} constructor stores ${ageVerifiedField.name}")
        }
    }
}
