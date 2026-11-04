package semicoloncolonel.mobilestream.patches.washingtonpost.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// WaPo phone 7.18.1. The AI features are switched by server config and by
// fields on each article:
//
//   Ask The Post AI — Search2Config (renamed sbi) carries postAnswersEnabled,
//     read through its only no-argument boolean getter. Forced false.
//   AI summaries — RawSummariesConfig(enabled, realtimeSummary, feedback) and
//     RawRealtimeSummary(enabled, ...) from the app config. Both "enabled"
//     values are forced to Boolean.FALSE in the constructors.
//   Per article — Article2 exposes showSummary, the Summary itself and the
//     Ask The Post question carousel (ATPQuestions). The getters return
//     false / null, as for an article that has none.
//
//   Ask tab — the bottom bar's tab list loses Ask before it is shown.
//
// Nothing else in search or articles is changed.
private const val CONFIG = "Lcom/washingtonpost/android/config/data/datasources/dto/config/"
private const val ARTICLE = "Lcom/wapo/flagship/features/articles2/models/"
private const val ASK_TAB_FILTER = "Lsemicoloncolonel/mobilestream/extension/washingtonpost/AskTabFilter;"

internal object Search2ConfigToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Search2Config(baseUrl=", ", postAnswersEnabled="),
    custom = { _, classDef -> !classDef.type.startsWith(CONFIG) },
)

internal object RawSummariesConfigInitFingerprint : Fingerprint(
    definingClass = "${CONFIG}RawSummariesConfig;",
    name = "<init>",
    parameters = listOf("Ljava/lang/Boolean;", "${CONFIG}RawRealtimeSummary;", "${CONFIG}RawRealtimeFeedback;"),
)

internal object RawRealtimeSummaryInitFingerprint : Fingerprint(
    definingClass = "${CONFIG}RawRealtimeSummary;",
    name = "<init>",
    parameters = listOf("Ljava/lang/Boolean;", "Ljava/lang/String;"),
)

// Article2's showSummary getter is the one that reads field R; the Summary and
// ATPQuestions getters are the only ones returning those types.
internal object ArticleShowSummaryFingerprint : Fingerprint(
    definingClass = "${ARTICLE}Article2;",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val field = (it as? ReferenceInstruction)?.reference as? FieldReference
            field?.definingClass == "${ARTICLE}Article2;" && field.name == "R"
        } == true
    },
)

internal object ArticleSummaryFingerprint : Fingerprint(
    definingClass = "${ARTICLE}Article2;",
    returnType = "${ARTICLE}Summary;",
    parameters = listOf(),
)

// The bottom bar's tabs (Home, Ask, Listen, Watch, Games, Search, Print).
internal object BottomTabsFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("ask", "Ask", "listen", "games", "print"),
)

internal object ArticleAtpQuestionsFingerprint : Fingerprint(
    definingClass = "${ARTICLE}Article2;",
    returnType = "${ARTICLE}ATPQuestions;",
    parameters = listOf(),
)

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off the app's AI features: Ask The Post AI and its tab, AI article summaries, and the Ask " +
        "The Post questions shown on articles. Experimental.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        Search2ConfigToStringFingerprint.classDef.methods
            .first { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.name != "<init>" }
            .addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    return p0
                """.trimIndent(),
            )

        // Both constructors are .locals 0; p1 is the "enabled" Boolean.
        listOf(RawSummariesConfigInitFingerprint, RawRealtimeSummaryInitFingerprint).forEach {
            it.method.addInstructions(0, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
        }

        ArticleShowSummaryFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p0
            """.trimIndent(),
        )
        listOf(ArticleSummaryFingerprint, ArticleAtpQuestionsFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    return-object p0
                """.trimIndent(),
            )
        }

        // The bottom bar's view model is the only class that both checks a
        // tab and takes the list of tabs to show; the list loses Ask.
        val tab = BottomTabsFingerprint.classDef.type
        var barType: String? = null
        classDefForEach { classDef ->
            if (barType != null) return@classDefForEach
            val checksTab = classDef.methods.any {
                it.returnType == "Z" && it.parameterTypes.map(Any::toString) == listOf(tab)
            }
            val takesTabs = classDef.methods.any {
                it.returnType == "V" && it.parameterTypes.map(Any::toString) == listOf("Ljava/util/List;")
            }
            if (checksTab && takesTabs) barType = classDef.type
        }
        val setTabs = mutableClassDefBy(barType ?: throw PatchException("Bottom bar not found")).methods.first {
            it.returnType == "V" && it.parameterTypes.map(Any::toString) == listOf("Ljava/util/List;")
        }
        setTabs.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $ASK_TAB_FILTER->withoutAsk(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
