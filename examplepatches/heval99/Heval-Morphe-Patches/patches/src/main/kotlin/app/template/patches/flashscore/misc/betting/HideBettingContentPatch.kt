package app.template.patches.flashscore.misc.betting

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private const val BETTING_HELPER_NAME = "morpheBettingGet"
private const val TABS_HELPER_NAME = "morpheWithoutOddsTab"

// The league tab-id enum constant for the ODDS tab (its feed id is "OD").
private const val ODDS_TAB = "ODDS"
private const val SET = "Ljava/util/Set;"

// What the helper returns instead of the remote value. The types match each key's parser:
// booleans are "1"/"0" parsed to Boolean, URLs are plain Strings, sport lists are List<Integer>.
private enum class Forced(val smali: String) {
    FALSE("sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"),
    TRUE("sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"),
    EMPTY_STRING("const-string v0, \"\""),
    EMPTY_LIST(
        """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
        """.trimIndent()
    ),
}

// The app's own odds kill switches (used for geo blocks and underage users), by enum constant
// name. Enum names survive R8: Enum.name() is backed by the constructor's string argument.
private const val ODDS_ENABLE = "ODDS_ENABLE"
private val FORCED_KEYS = linkedMapOf(
    ODDS_ENABLE to Forced.FALSE,
    "DETAIL_ODDS_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_COMPARISON_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_AFFILIATE_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_BETSLIP_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_PREMATCH_BUTTON_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_POSTMATCH_BUTTON_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_LIVE_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_LIVE_BET_BUTTON_ENABLE" to Forced.FALSE,
    "DETAIL_ODDS_SUMMARY_REDIRECT_TO_ODDS" to Forced.FALSE,
    "DETAIL_SUMMARY_GAMBLING_TEXT_ENABLED" to Forced.FALSE,
    "DETAIL_BROADCASTING_BOOKMAKERS_DISABLE" to Forced.TRUE,
    "DETAIL_ODDS_SUMMARY_IMAGES_DISABLED" to Forced.TRUE,
    "BONUS_PROMO_GIFT_ICON_URL" to Forced.EMPTY_STRING,
    "LEAGUE_DETAIL_HEADER_STRIP_SPORTS_ENABLED" to Forced.EMPTY_LIST,
)

private val logger = Logger.getLogger("HideBettingContent")

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

/**
 * Resolves the enum constant [name] of [enumType] to its static field by following its
 * `<clinit>`: `const-string vN, NAME` -> `invoke-direct {vI, vN, ...}, <init>` -> `sput-object vI`.
 * Returns `Lenum;->field:Lenum;`, or null when the constant is not there.
 */
private fun BytecodePatchContext.enumConstantField(enumType: String, name: String): String? {
    val clinit = classDefBy(enumType).methods.singleOrNull { it.name == "<clinit>" } ?: return null
    val insns = clinit.implementation?.instructions?.toList() ?: return null

    val nameIndex = insns.indexOfFirst {
        (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((it as ReferenceInstruction).reference as StringReference).string == name
    }
    if (nameIndex < 0) return null
    val nameRegister = (insns[nameIndex] as OneRegisterInstruction).registerA

    // The constructor call that takes this name as its first argument (Enum(String name, ...)).
    var instanceRegister = -1
    var initIndex = -1
    for (i in nameIndex + 1 until insns.size) {
        val insn = insns[i]
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (ref.definingClass != enumType || ref.name != "<init>") continue
        val (thisRegister, firstArgument) = when (insn) {
            is FiveRegisterInstruction -> insn.registerC to insn.registerD
            is RegisterRangeInstruction -> insn.startRegister to insn.startRegister + 1
            else -> continue
        }
        if (firstArgument != nameRegister) continue
        instanceRegister = thisRegister
        initIndex = i
        break
    }
    if (initIndex < 0) return null

    for (i in initIndex + 1 until insns.size) {
        val insn = insns[i]
        if (insn.opcode != Opcode.SPUT_OBJECT) continue
        val field = (insn as ReferenceInstruction).reference as FieldReference
        if ((insn as OneRegisterInstruction).registerA != instanceRegister) continue
        if (field.definingClass != enumType || field.type != enumType) continue
        return "${field.definingClass}->${field.name}:${field.type}"
    }
    return null
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
        //  The value class's get() only returns its holder's get(). A new static helper checks
        //  the key by identity against the resolved enum constants and returns the forced value,
        //  else does exactly what get() did. get() has no spare register (.locals 0), so it calls
        //  the helper and returns its result, rather than testing a "no override" sentinel.
        //  R8 inlines get() at some call sites (holder field + holder get() read directly; in
        //  26.10.2 inside the config factory lambdas and two change listeners). Those reads
        //  bypass the helper; in 26.10.2 none of them is for a forced key (checked by hand).
        //  FlashscoreSmokeTest catches such a read only right after the forced key's instance
        //  is built, so recheck by hand when updating the app.
        val valueConstructor = RemoteConfigValueConstructorFingerprint.method
        val valueClass = RemoteConfigValueConstructorFingerprint.classDef
        val keyType = valueConstructor.parameterTypes.getOrNull(1)?.toString()
            ?: throw PatchException("Remote-config value constructor has no key parameter")
        val keyField = valueClass.fields.singleOrNull {
            it.type == keyType && !AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("${valueClass.type} has no single $keyType key field")

        val get = valueClass.methods.singleOrNull {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
        } ?: throw PatchException("${valueClass.type} has no single ()Object getter")

        // The original body: iget-object holder; invoke holder.get(); move-result; return.
        val original = get.implementation!!.instructions.toList()
        val holderField = (original.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        val holderGet = (original.getOrNull(1) as? ReferenceInstruction)?.reference as? MethodReference
        if (original.size != 4 || original[0].opcode != Opcode.IGET_OBJECT || holderField == null ||
            holderField.definingClass != valueClass.type || holderGet == null ||
            original[1].opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE) ||
            original[2].opcode != Opcode.MOVE_RESULT_OBJECT || original[3].opcode != Opcode.RETURN_OBJECT
        ) {
            throw PatchException("${valueClass.type}.${get.name}() is not the expected holder getter")
        }
        // The helper calls the holder's get() with the holder as its only register.
        if (holderGet.parameterTypes.isNotEmpty()) {
            throw PatchException("${valueClass.type}.${get.name}() calls $holderGet with arguments")
        }
        val invokeHolder = if (original[1].opcode == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"
        val holderGetRef = "${holderGet.definingClass}->${holderGet.name}(" +
            holderGet.parameterTypes.joinToString("") + ")${holderGet.returnType}"

        // ODDS_ENABLE is the master switch: without it the patch does nothing useful.
        val resolved = FORCED_KEYS.mapNotNull { (name, forced) ->
            val field = enumConstantField(keyType, name)
            if (field == null) {
                if (name == ODDS_ENABLE) throw PatchException("$keyType has no $ODDS_ENABLE constant")
                logger.warning("Hide betting content: $keyType has no $name constant, skipping it")
                null
            } else {
                Triple(name, field, forced)
            }
        }

        val groups = resolved.groupBy({ it.third }, { it.second })
        val checks = groups.entries.joinToString("\n") { (forced, fields) ->
            fields.joinToString("\n") { field ->
                """
                    sget-object v1, $field
                    if-eq v0, v1, :forced_${forced.name.lowercase()}
                """.trimIndent()
            }
        }
        val answers = groups.keys.joinToString("\n") { forced ->
            ":forced_${forced.name.lowercase()}\n${forced.smali}\nreturn-object v0"
        }

        // v0 = key, v1 = scratch, p0 (v2) = the value object.
        val helper = ImmutableMethod(
            valueClass.type,
            BETTING_HELPER_NAME,
            listOf(ImmutableMethodParameter(valueClass.type, null, null)),
            "Ljava/lang/Object;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabelsChecked(
                0,
                """
                    iget-object v0, p0, ${valueClass.type}->${keyField.name}:$keyType
                    $checks
                    iget-object v0, p0, ${valueClass.type}->${holderField.name}:${holderField.type}
                    $invokeHolder {v0}, $holderGetRef
                    move-result-object v0
                    return-object v0
                    $answers
                """.trimIndent(),
            )
        }
        valueClass.methods.add(helper)

        get.addInstructionsChecked(
            0,
            """
                invoke-static {p0}, ${valueClass.type}->$BETTING_HELPER_NAME(${valueClass.type})Ljava/lang/Object;
                move-result-object p0
                return-object p0
            """.trimIndent(),
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
