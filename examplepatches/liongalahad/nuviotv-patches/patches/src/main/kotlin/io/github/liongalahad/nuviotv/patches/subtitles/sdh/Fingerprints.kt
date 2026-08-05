package io.github.liongalahad.nuviotv.patches.subtitles.sdh

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val CUE_GROUP = "Landroidx/media3/common/text/CueGroup;"
private const val TEXT_OUTPUT = "Landroidx/media3/exoplayer/text/TextOutput;"

/** Exact 0.8.1-beta settings Composable and its visibility-filter ordinal call. */
internal object SettingsScreenFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(0x7f1108b9),
        literal(0x7f1108ba),
        literal(0x7f1108b7),
        literal(0x7f1108b8),
        methodCall(
            definingClass = "Lkotlin/collections/CollectionsKt;",
            name = "listOf",
            returnType = "Ljava/util/List;"
        ),
        methodCall(name = "ordinal", returnType = "I")
    )
)

/** Essential-layout Experience pane header repurposed as the Morphe preview. */
internal object ExperienceSettingsHeaderFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(0x7f110894), // settings_advanced
        literal(0x7f110550) // experience_mode_switch_to_advanced_header_subtitle
    )
)

/** Both Experience-mode cards rendered inside the native settings pane. */
internal object ExperienceSettingsCardFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        val requiredLiterals = setOf(
            0x7f110544L, 0x7f11054cL, 0x7f11054fL,
            0x7f110551L, 0x7f110552L, 0x7f110553L
        )
        val methodLiterals = method.implementation?.instructions
            ?.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
            ?.toSet()
            .orEmpty()
        "Lkotlin/jvm/functions/Function3;" in classDef.interfaces &&
            methodLiterals.containsAll(requiredLiterals)
    }
)

/** A native Nuvio boolean setting row used to discover the shared switch renderer. */
internal object NativeSettingsSwitchUsageFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        literal(0x7f1109a5), // sub_use_forced_subtitles
        literal(0x7f1109a6) // sub_use_forced_subtitles_desc
    ),
    custom = { _, classDef -> "Lkotlin/jvm/functions/Function3;" in classDef.interfaces }
)

/** Nuvio's CueNormalizingTextOutput Media3 callback. */
internal object CueGroupOutputFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(CUE_GROUP),
    filters = listOf(
        methodCall(
            definingClass = CUE_GROUP,
            name = "<init>",
            parameters = listOf("Ljava/util/List;", "J")
        ),
        methodCall(
            definingClass = TEXT_OUTPUT,
            name = "onCues",
            parameters = listOf(CUE_GROUP),
            returnType = "V"
        )
    ),
    custom = { _, classDef -> TEXT_OUTPUT in classDef.interfaces }
)

internal object LegacyCueOutputFingerprint : Fingerprint(
    classFingerprint = CueGroupOutputFingerprint,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        methodCall(
            definingClass = TEXT_OUTPUT,
            name = "onCues",
            parameters = listOf("Ljava/util/List;"),
            returnType = "V"
        )
    )
)
