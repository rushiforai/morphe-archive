package app.morphe.patches.youtube.video.yandexvot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val ENHANCED_KEYWORD_FILTER_CLASS =
    "Lapp/morphe/extension/youtube/patches/keywordfilter/EnhancedKeywordContentFilter;"
private const val ENHANCED_KEYWORD_STATS_HELPER_CLASS =
    "Lapp/morphe/extension/youtube/patches/keywordfilter/EnhancedKeywordStatsHelper;"

private const val LITHO_FILTER_PATCH_CLASS =
    "Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;"
private const val FILTER_ARRAY_DESCRIPTOR =
    "[Lapp/morphe/extension/shared/patches/components/Filter;"
private const val COMMENTS_FILTER_CLASS =
    "Lapp/morphe/extension/youtube/patches/components/CommentsFilter;"
private const val LAYOUT_COMPONENTS_FILTER_CLASS =
    "Lapp/morphe/extension/youtube/patches/components/LayoutComponentsFilter;"
private const val BASE_KEYWORD_FILTER_CLASS =
    "Lapp/morphe/extension/youtube/patches/components/KeywordContentFilter;"
private const val KEYWORD_STATS_CATEGORY_CLASS =
    "Lapp/morphe/extension/youtube/settings/preference/KeywordContentStatsPreferenceCategory;"
private const val SOURCE_ENUM_DESCRIPTOR =
    $$"Lapp/morphe/extension/shared/patches/components/BufferPhraseFilter$Source;"
private const val CONTEXT_INTERFACE_DESCRIPTOR =
    "Lapp/morphe/extension/shared/patches/components/ContextInterface;"

private val COMPATIBILITY_YOUTUBE_FILTER = Compatibility(
    packageName = "com.google.android.youtube",
    name = "YouTube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = setOf(
        // Android 13+
        "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
        // Android 7+
        "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
    )
)

private val enhancedKeywordContentFilterBytecodePatch = bytecodePatch {
    extendWith("extensions/youtube.mpe")

    execute {
        Fingerprint(
            definingClass = "Lcom/facebook/litho/ComponentHost;",
            name = "onLayout",
            returnType = "V",
            parameters = listOf("Z", "I", "I", "I", "I")
        ).method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
            returnIndices.forEach { index ->
                addInstruction(
                    index,
                    "invoke-static { p0 }, $ENHANCED_KEYWORD_FILTER_CLASS->onComponentHostLayout(Lcom/facebook/litho/ComponentHost;)V"
                )
            }
        }
    }

    finalize {
        registerAddOn("$ENHANCED_KEYWORD_FILTER_CLASS->registerAddOn()V")

        // 1. Replace stock KeywordContentFilter with EnhancedKeywordContentFilter in LithoFilterPatch
        mutableClassDefByOrNull(LITHO_FILTER_PATCH_CLASS)?.methods
            ?.firstOrNull { it.name == "<clinit>" }
            ?.apply {
                val sputIndex = implementation!!.instructions.indexOfFirst { instruction ->
                    instruction.opcode == Opcode.SPUT_OBJECT &&
                            instruction.getReference<FieldReference>()?.let { ref ->
                                ref.name == "filters" && ref.type == FILTER_ARRAY_DESCRIPTOR
                            } == true
                }
                if (sputIndex >= 0) {
                    val reg = getInstruction<OneRegisterInstruction>(sputIndex).registerA
                    addInstructions(
                        sputIndex,
                        """
                            invoke-static { v$reg }, $ENHANCED_KEYWORD_FILTER_CLASS->installFilter($FILTER_ARRAY_DESCRIPTOR)$FILTER_ARRAY_DESCRIPTOR
                            move-result-object v$reg
                        """.trimIndent()
                    )
                }
            }

        // 2. Hook CommentsFilter.onLithoTextLoaded & CommentsFilter.onCommentsLoaded
        mutableClassDefByOrNull(COMMENTS_FILTER_CLASS)?.let { commentsFilterClass ->
            commentsFilterClass.methods.firstOrNull {
                it.name == "onLithoTextLoaded" &&
                        it.returnType == "Ljava/lang/CharSequence;" &&
                        it.parameters.size == 2
            }?.addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $ENHANCED_KEYWORD_FILTER_CLASS->onLithoTextLoaded(${CONTEXT_INTERFACE_DESCRIPTOR}Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                    move-result-object p1
                """.trimIndent()
            )

            commentsFilterClass.methods.firstOrNull {
                it.name == "onCommentsLoaded" &&
                        it.returnType == "[B" &&
                        it.parameters.size == 1
            }?.addInstructions(
                0,
                """
                    invoke-static { p0 }, $ENHANCED_KEYWORD_FILTER_CLASS->onDescriptionElementLoaded([B)[B
                    move-result-object p0
                """.trimIndent()
            )
        }

        // 3. Hook LayoutComponentsFilter browseId & player timebar callbacks
        mutableClassDefByOrNull(LAYOUT_COMPONENTS_FILTER_CLASS)?.let { layoutFilterClass ->
            layoutFilterClass.methods.firstOrNull {
                it.name == "setBrowseId" && it.parameters.size == 1
            }?.addInstruction(
                0,
                "invoke-static { p0 }, $ENHANCED_KEYWORD_FILTER_CLASS->setBrowseId(Ljava/lang/String;)V"
            )

            layoutFilterClass.methods.firstOrNull {
                it.name == "clearBrowseId" && it.parameters.isEmpty()
            }?.addInstruction(
                0,
                "invoke-static {}, $ENHANCED_KEYWORD_FILTER_CLASS->clearBrowseId()V"
            )

            listOf("hideChaptersTimelineButton", "hideChapterTitle").forEach { methodName ->
                layoutFilterClass.methods.firstOrNull {
                    it.name == methodName &&
                            it.parameters.size == 1 &&
                            it.parameters[0].type == "Landroid/view/View;"
                }?.addInstruction(
                    0,
                    "invoke-static { p0 }, $ENHANCED_KEYWORD_FILTER_CLASS->onPlayerTimeBarViewCreated(Landroid/view/View;)V"
                )
            }
        }

        // 4. Hook KeywordContentStatsPreferenceCategory.buildRows to show the match log row
        mutableClassDefByOrNull(KEYWORD_STATS_CATEGORY_CLASS)?.methods
            ?.firstOrNull { it.name == "buildRows" && it.parameters.isEmpty() }
            ?.addInstruction(
                0,
                "invoke-static { p0 }, $ENHANCED_KEYWORD_STATS_HELPER_CLASS->addMatchLogRow(Landroid/preference/PreferenceCategory;)V"
            )

        // 5. Forward 24h stats methods on base KeywordContentFilter to EnhancedKeywordContentFilter
        mutableClassDefByOrNull(BASE_KEYWORD_FILTER_CLASS)?.let { baseKeywordClass ->
            baseKeywordClass.methods.firstOrNull {
                it.name == "hidesInLast24Hours" && it.parameters.isEmpty()
            }?.addInstructions(
                0,
                """
                    invoke-static {}, $ENHANCED_KEYWORD_FILTER_CLASS->hidesInLast24Hours()I
                    move-result v0
                    return v0
                """.trimIndent()
            )

            baseKeywordClass.methods.firstOrNull {
                it.name == "hidesInLast24Hours" && it.parameters.size == 1
            }?.addInstructions(
                0,
                """
                    invoke-static { p0 }, $ENHANCED_KEYWORD_FILTER_CLASS->hidesInLast24Hours($SOURCE_ENUM_DESCRIPTOR)I
                    move-result v0
                    return v0
                """.trimIndent()
            )

            baseKeywordClass.methods.firstOrNull {
                it.name == "resetHidesTracker" && it.parameters.isEmpty()
            }?.addInstructions(
                0,
                """
                    invoke-static {}, $ENHANCED_KEYWORD_FILTER_CLASS->resetHidesTracker()V
                    return-void
                """.trimIndent()
            )
        }
    }
}

private val enhancedKeywordContentFilterResourcePatch = resourcePatch {
    execute {
        addBundledResources()

        addAddOnPreferences(
            switchPreference("morphe_hide_keyword_content_channel"),
            switchPreference("morphe_hide_keyword_content_check_subtitles", summary = true),
            switchPreference("morphe_hide_keyword_content_use_and_operator", summary = true),
            switchPreference("morphe_hide_keyword_content_use_regex", summary = true),
            switchPreference("morphe_hide_keyword_content_case_sensitive", summary = true),
            switchPreference("morphe_hide_keyword_content_debug", summary = true),
            afterKey = "morphe_hide_keyword_content_subscriptions",
            screenKey = "morphe_hide_keyword_content_screen",
        )

        addAddOnPreferences(
            nonInteractivePreference(
                key = "morphe_hide_keyword_content_about_regex",
                tag = "app.morphe.extension.youtube.settings.preference.HTMLPreference",
            ),
            afterKey = "morphe_hide_keyword_content_about_whole_words",
            screenKey = "morphe_hide_keyword_content_about_category",
        )
    }
}

@Suppress("unused")
val enhancedKeywordContentFilterPatch = bytecodePatch(
    name = "Keyword content filter (Enhanced)",
    description = "Upgrades the Morphe keyword content filter with visible-text protobuf extraction, " +
            "Regex, AND ('&') operator, case-insensitive matching, channel filtering, subtitle keyword scanner, and debug mode.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_FILTER)
    dependsOn(enhancedKeywordContentFilterResourcePatch, enhancedKeywordContentFilterBytecodePatch)
    execute { }
}
