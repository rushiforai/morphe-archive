package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyMetadataBuildTargets
import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyMetadataReadTargets
import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyMetadataTargets
import dev.jason.gboardpatches.patches.gboard.shared.SoftKeyLabelSource
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private val ENGLISH_UPPERCASE_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED,
).owner
private val softKeyMetadataType: String
    get() = GboardVersionBindings.softKeyMetadataType.descriptor

internal val gboardEnglishQwertySoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "在 English QWERTY bind time 注入上滑大寫與下滑小寫 action。",
    feature = GboardSoftKeyFamilyFeature.ENGLISH_QWERTY,
)

internal val GBOARD_ENGLISH_SOFT_KEY_HELPER_NAMES = setOf(
    "jasondevToggleAsciiCase",
    "jasondevToLowerAscii",
    "jasondevResolvePrimaryLabel",
    "jasondevResolvePressPayload",
    "jasondevIsEnglishQwertyKeyId",
    "jasondevPatchIncomingMetadata",
)

/**
 * Installs the helpers for the release the APK declares.
 *
 * Every obfuscated name in the bodies below comes from [targets], so a release only has to supply
 * its own row instead of a second copy of these templates. [GboardSoftKeyMetadataTargets.build] is
 * required because the cache-miss path has to rebuild a `SoftKeyDef`, which is exactly the half a
 * release cannot support from the read side alone.
 */
internal fun MutableClass.installGboardEnglishQwertySoftKeyHelpers(
    targets: GboardSoftKeyMetadataTargets,
) {
    val read = targets.read
    val build = targets.build ?: error(
        "English QWERTY soft-key metadata builder is unresolved for " +
            "${GboardVersionBindings.targetVersion}: ${read.eventType} bind cannot be rebuilt " +
            "without a SoftKeyDef/ActionDef builder pair.",
    )
    addHelperMethodIfMissing(
        name = "jasondevToggleAsciiCase",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = TOGGLE_ASCII_CASE_BODY
    )
    addHelperMethodIfMissing(
        name = "jasondevToLowerAscii",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = TO_LOWER_ASCII_BODY
    )
    addHelperMethodIfMissing(
        name = "jasondevResolvePrimaryLabel",
        parameterTypes = listOf(softKeyMetadataType),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = if (read.label is SoftKeyLabelSource.MetadataList) 6 else 3,
        body = primaryLabelBody(read)
    )
    addHelperMethodIfMissing(
        name = "jasondevResolvePressPayload",
        parameterTypes = listOf(softKeyMetadataType),
        returnType = "Ljava/lang/String;",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 7,
        body = pressPayloadBody(read)
    )
    addHelperMethodIfMissing(
        name = "jasondevIsEnglishQwertyKeyId",
        parameterTypes = listOf("I"),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 2,
        body = IS_ENGLISH_QWERTY_KEY_ID_BODY
    )
    addHelperMethodIfMissing(
        name = "jasondevPatchIncomingMetadata",
        parameterTypes = listOf(softKeyMetadataType),
        returnType = softKeyMetadataType,
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 16,
        body = patchIncomingMetadataBody(read, build)
    )
}

/**
 * `SoftKeyDef` keeps its labels in a metadata list on 18.6.3, so the first non-empty element is the
 * label; on 18.8.0 the label is a field of its own.
 */
private fun primaryLabelBody(read: GboardSoftKeyMetadataReadTargets): String =
    when (val label = read.label) {
        is SoftKeyLabelSource.MetadataList -> """
    if-eqz p0, :cond_none

    iget-object p0, p0, ${read.types.softKeyDef}->${label.field}:${read.types.list}

    if-eqz p0, :cond_none

    ${read.types.listCallOpcode} {p0}, ${read.types.listCall}->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_none

    ${read.types.listCallOpcode} {p0, v1}, ${read.types.listCall}->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_next

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_next

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_next

    return-object v2

    :cond_next
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_none
    const/4 p0, 0x0

    return-object p0
        """.trimIndent()

        is SoftKeyLabelSource.TextField -> """
    if-eqz p0, :cond_none

    iget-object p0, p0, ${read.types.softKeyDef}->${label.field}:Ljava/lang/String;

    if-eqz p0, :cond_none

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_none

    return-object p0

    :cond_none
    const/4 p0, 0x0

    return-object p0
        """.trimIndent()
    }

/**
 * The payload of the press action: the release's lookup gives the `ActionDef`, its parameter list
 * holds the key data, and the key data carries the committed text.
 */
private fun pressPayloadBody(read: GboardSoftKeyMetadataReadTargets): String = """
    if-eqz p0, :cond_none

    sget-object v0, ${read.eventType}->${read.pressEvent}:${read.eventType}

    invoke-virtual {p0, v0}, ${read.types.softKeyDef}->${read.actionLookup.name}(${read.eventType})${read.types.actionDef}

    move-result-object v0

    if-eqz v0, :cond_none

    iget-object v0, v0, ${read.types.actionDef}->${read.actionParamsField}:${read.types.list}

    if-eqz v0, :cond_none

    ${read.types.listCallOpcode} {v0}, ${read.types.listCall}->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_none

    ${read.types.listCallOpcode} {v0, v2}, ${read.types.listCall}->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, ${read.types.keyData}

    if-eqz v3, :cond_next

    iget-object v3, v3, ${read.types.keyData}->${read.actionParamValueField}:Ljava/lang/Object;

    instance-of v4, v3, Ljava/lang/CharSequence;

    if-eqz v4, :cond_next

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_next

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_next

    return-object v3

    :cond_next
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_none
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private fun patchIncomingMetadataBody(
    read: GboardSoftKeyMetadataReadTargets,
    build: GboardSoftKeyMetadataBuildTargets,
): String = """
    if-eqz p1, :cond_return_original

    :try_start_0
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED, "")}

    move-result v0

    if-eqz v0, :cond_return_original_safe

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_PATCHED_METADATA,
        "p1",
    )}

    move-result v0

    if-nez v0, :cond_return_original_safe

    iget v0, p1, ${read.types.softKeyDef}->${read.keyIdField}:I

    invoke-static {v0}, $SOFT_KEY_VIEW_CLASS->jasondevIsEnglishQwertyKeyId(I)Z

    move-result v0

    if-eqz v0, :cond_return_original_safe

    sget-object v0, ${read.eventType}->${read.slideUpEvent}:${read.eventType}

    invoke-virtual {p1, v0}, ${read.types.softKeyDef}->${read.actionLookup.name}(${read.eventType})${read.types.actionDef}

    move-result-object v0

    if-nez v0, :cond_return_original_safe

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_GET_CACHED_PATCHED_METADATA,
        "p1",
    )}

    move-result-object v0

    if-eqz v0, :cond_cache_miss

    check-cast v0, $softKeyMetadataType

    return-object v0

    :cond_cache_miss

    invoke-static {p1}, $SOFT_KEY_VIEW_CLASS->jasondevResolvePrimaryLabel($softKeyMetadataType)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, $SOFT_KEY_VIEW_CLASS->jasondevResolvePressPayload($softKeyMetadataType)Ljava/lang/String;

    move-result-object v2

    if-nez v1, :cond_have_base_label

    move-object v1, v2

    :cond_have_base_label
    invoke-static {v1}, $SOFT_KEY_VIEW_CLASS->jasondevToggleAsciiCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, $SOFT_KEY_VIEW_CLASS->jasondevToLowerAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-nez v3, :cond_check_slide_down

    goto :cond_build_metadata

    :cond_check_slide_down
    if-nez v9, :cond_return_original_safe

    :cond_build_metadata
    new-instance v4, ${build.softKeyBuilder}

    invoke-direct {v4}, ${build.softKeyBuilder}-><init>()V

    invoke-virtual {v4, p1}, ${build.softKeyBuilder}->${build.softKeyBuilderCopy}($softKeyMetadataType)V

    if-eqz v3, :cond_skip_slide_up

    sget-object v0, ${read.eventType}->${read.slideUpEvent}:${read.eventType}

    invoke-virtual {p1, v0}, ${read.types.softKeyDef}->${read.actionLookup.name}(${read.eventType})${read.types.actionDef}

    move-result-object v0

    if-nez v0, :cond_skip_slide_up

    if-eqz v2, :cond_build_slide_up

    invoke-static {v2}, $SOFT_KEY_VIEW_CLASS->jasondevToggleAsciiCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_skip_slide_up

    :cond_build_slide_up
    @SLIDE_UP@

    :cond_skip_slide_up
    if-eqz v9, :cond_skip_slide_down

    @SLIDE_DOWN@

    :cond_skip_slide_down
    invoke-virtual {v4}, ${build.softKeyBuilder}->${build.softKeyBuilderBuild}()$softKeyMetadataType

    move-result-object v0

    check-cast v0, $softKeyMetadataType

    if-eqz v0, :cond_return_original_safe

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_CACHE_PATCHED_METADATA,
        "p1, v0",
    )}

    move-result-object v0

    check-cast v0, $softKeyMetadataType

    if-eqz v0, :cond_return_original_safe

    return-object v0

    :cond_return_original_safe
    return-object p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_return_original
    return-object p1

    :catch_0
    return-object p1
""".trimIndent()
        .replace(
            "@SLIDE_UP@",
            actionBlock(
                read = read,
                build = build,
                softKeyRegister = "v4",
                event = read.slideUpEvent,
                payloadRegister = "v3",
                registers = listOf("v5", "v6", "v7", "v8"),
                skipLabel = "cond_skip_slide_up",
            ),
        )
        .replace(
            "@SLIDE_DOWN@",
            actionBlock(
                read = read,
                build = build,
                softKeyRegister = "v4",
                event = read.slideDownEvent,
                payloadRegister = "v9",
                registers = listOf("v10", "v11", "v12", "v13"),
                skipLabel = "cond_skip_slide_down",
            ),
        )

/**
 * One added action, in the release's builder dialect.
 *
 * 18.6.3 sets a keyword array and then `s(id, Lpuz;->c, text)`; 18.8.0 has no keyword setter, resets
 * the builder and hands the text to `n(id, Lagma;->d, text)`, which stores it as the commit key
 * data. Both take the attribute id from the table so stock's own id is what gets written.
 */
private fun actionBlock(
    read: GboardSoftKeyMetadataReadTargets,
    build: GboardSoftKeyMetadataBuildTargets,
    softKeyRegister: String,
    event: String,
    payloadRegister: String,
    registers: List<String>,
    skipLabel: String,
): String {
    val action = registers[0]
    val scratch = registers[1]
    val array = registers[2]
    val parameter = registers[3]
    val lines = mutableListOf(
        "    new-instance $action, ${build.actionBuilder}",
        "",
        "    invoke-direct {$action}, ${build.actionBuilder}-><init>()V",
    )
    build.actionBuilderReset?.let { reset ->
        lines += ""
        lines += "    invoke-virtual {$action}, ${build.actionBuilder}->$reset()V"
    }
    lines += ""
    lines += "    sget-object $scratch, ${read.eventType}->$event:${read.eventType}"
    lines += ""
    lines += "    iput-object $scratch, $action, " +
        "${build.actionBuilder}->${build.actionBuilderEventField}:${read.eventType}"
    build.actionBuilderSetKeywords?.let { setKeywords ->
        lines += ""
        lines += "    const/4 $scratch, 0x1"
        lines += ""
        lines += "    new-array $array, $scratch, [Ljava/lang/String;"
        lines += ""
        lines += "    const/4 $scratch, 0x0"
        lines += ""
        lines += "    aput-object $payloadRegister, $array, $scratch"
        lines += ""
        lines += "    invoke-virtual {$action, $array}, " +
            "${build.actionBuilder}->$setKeywords([Ljava/lang/String;)V"
    }
    lines += ""
    lines += "    const $array, ${build.commitParameterId}"
    lines += ""
    lines += "    sget-object $parameter, " +
        "${build.commitParameter}->${build.commitParameterField}:${build.commitParameter}"
    lines += ""
    lines += "    invoke-virtual {$action, $array, $parameter, $payloadRegister}, " +
        "${build.actionBuilder}->${build.actionBuilderSetParam}" +
        "(I${build.commitParameter}Ljava/lang/Object;)V"
    lines += ""
    lines += "    invoke-virtual {$action}, " +
        "${build.actionBuilder}->${build.actionBuilderBuild}()${read.types.actionDef}"
    lines += ""
    lines += "    move-result-object $action"
    lines += ""
    lines += "    if-eqz $action, :$skipLabel"
    lines += ""
    lines += "    invoke-virtual {$softKeyRegister, $action}, " +
        "${build.softKeyBuilder}->${build.softKeyBuilderAddAction}(${read.types.actionDef})V"
    return lines.joinToString("\n")
}

private val TOGGLE_ASCII_CASE_BODY = """
    if-eqz p0, :cond_invalid

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_invalid

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_uppercase

    const/16 v1, 0x7a

    if-gt v0, v1, :cond_uppercase

    add-int/lit8 v0, v0, -0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_uppercase
    const/16 v1, 0x41

    if-lt v0, v1, :cond_invalid

    const/16 v1, 0x5a

    if-gt v0, v1, :cond_invalid

    add-int/lit8 v0, v0, 0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_invalid
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

// Always yields the lowercase form, so a down flick overrides whatever case the keyboard is in
// (including the temporary shift that auto-capitalisation puts on the first letter of a field).
private val TO_LOWER_ASCII_BODY = """
    if-eqz p0, :cond_invalid

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_invalid

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x41

    if-lt v0, v1, :cond_check_lower

    const/16 v1, 0x5a

    if-gt v0, v1, :cond_check_lower

    add-int/lit8 v0, v0, 0x20

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_check_lower
    const/16 v1, 0x61

    if-lt v0, v1, :cond_invalid

    const/16 v1, 0x7a

    if-gt v0, v1, :cond_invalid

    return-object p0

    :cond_invalid
    const/4 p0, 0x0

    return-object p0
""".trimIndent()

private val IS_ENGLISH_QWERTY_KEY_ID_BODY = """
    sparse-switch p0, :sswitch_data_0

    const/4 p0, 0x0

    return p0

    :sswitch_0
    const/4 p0, 0x1

    return p0

    :sswitch_data_0
    .sparse-switch
        0x7f0b17f7 -> :sswitch_0
        0x7f0b1806 -> :sswitch_0
        0x7f0b1808 -> :sswitch_0
        0x7f0b180f -> :sswitch_0
        0x7f0b1813 -> :sswitch_0
        0x7f0b1826 -> :sswitch_0
        0x7f0b1828 -> :sswitch_0
        0x7f0b1833 -> :sswitch_0
        0x7f0b1838 -> :sswitch_0
        0x7f0b1849 -> :sswitch_0
        0x7f0b184b -> :sswitch_0
        0x7f0b184f -> :sswitch_0
        0x7f0b1853 -> :sswitch_0
        0x7f0b1857 -> :sswitch_0
        0x7f0b1860 -> :sswitch_0
        0x7f0b1875 -> :sswitch_0
        0x7f0b1877 -> :sswitch_0
        0x7f0b1878 -> :sswitch_0
        0x7f0b187d -> :sswitch_0
        0x7f0b1886 -> :sswitch_0
        0x7f0b1890 -> :sswitch_0
        0x7f0b18a3 -> :sswitch_0
        0x7f0b18a5 -> :sswitch_0
        0x7f0b18a8 -> :sswitch_0
        0x7f0b18a9 -> :sswitch_0
        0x7f0b18ad -> :sswitch_0
        0x7f0b18d4 -> :sswitch_0
        0x7f0b18e4 -> :sswitch_0
        0x7f0b18e9 -> :sswitch_0
        0x7f0b18f7 -> :sswitch_0
        0x7f0b1905 -> :sswitch_0
        0x7f0b191b -> :sswitch_0
        0x7f0b191f -> :sswitch_0
        0x7f0b192e -> :sswitch_0
        0x7f0b1934 -> :sswitch_0
        0x7f0b1945 -> :sswitch_0
        0x7f0b1949 -> :sswitch_0
        0x7f0b1951 -> :sswitch_0
        0x7f0b195e -> :sswitch_0
        0x7f0b1965 -> :sswitch_0
        0x7f0b1971 -> :sswitch_0
        0x7f0b1987 -> :sswitch_0
        0x7f0b198e -> :sswitch_0
        0x7f0b1992 -> :sswitch_0
        0x7f0b199d -> :sswitch_0
        0x7f0b19c5 -> :sswitch_0
        0x7f0b19e6 -> :sswitch_0
        0x7f0b19fb -> :sswitch_0
        0x7f0b19fe -> :sswitch_0
        0x7f0b1a03 -> :sswitch_0
        0x7f0b1a06 -> :sswitch_0
        0x7f0b1a0d -> :sswitch_0
    .end sparse-switch
""".trimIndent()
