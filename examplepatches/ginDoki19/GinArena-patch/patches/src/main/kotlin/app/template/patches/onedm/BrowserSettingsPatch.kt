package app.template.patches.onedm

import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_ONEDM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.MethodUtil

private fun FieldReference.toSmali() = "$definingClass->$name:$type"

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Instruction.stringValueOrNull(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    return getReference<StringReference>()?.string
}

private fun Instruction.methodReferenceOrNull(): MethodReference? = getReference()

private fun MethodReference.hasParameters(vararg expected: String): Boolean =
    parameterTypes.map { it.toString() } == expected.toList()

private fun Method.settingsIntField(key: String): FieldReference {
    val methodInstructions = instructions.toList()

    for (keyIndex in methodInstructions.indices) {
        if (methodInstructions[keyIndex].stringValueOrNull() != key) continue

        val igetEnd = minOf(methodInstructions.size, keyIndex + 8)
        for (igetIndex in keyIndex + 1 until igetEnd) {
            val iget = methodInstructions[igetIndex]
            if (iget.opcode != Opcode.IGET) continue

            val field = iget.getReference<FieldReference>() ?: continue
            if (field.definingClass != definingClass || field.type != "I") continue

            val invokeEnd = minOf(methodInstructions.size, igetIndex + 4)
            val hasIntGetter = (igetIndex + 1 until invokeEnd).any { invokeIndex ->
                val reference = methodInstructions[invokeIndex].methodReferenceOrNull()
                    ?: return@any false
                reference.hasParameters("Ljava/lang/String;", "I") && reference.returnType == "I"
            }
            if (!hasIntGetter) continue

            val iputEnd = minOf(methodInstructions.size, igetIndex + 8)
            val hasMatchingPut = (igetIndex + 1 until iputEnd).any { iputIndex ->
                val iput = methodInstructions[iputIndex]
                if (iput.opcode != Opcode.IPUT) return@any false
                val putField = iput.getReference<FieldReference>() ?: return@any false
                putField.toSmali() == field.toSmali()
            }
            if (hasMatchingPut) return field
        }
    }

    throw PatchException("Could not find the settings fallback field for key \"$key\" in $this")
}

private fun MutableMethod.replaceSuggestionFallback(suggestionEnumName: String) {
    val methodInstructions = instructions.toList()
    val fallbackMatches = methodInstructions.withIndex().filter { (_, instruction) ->
        instruction.stringValueOrNull() == "SUGGESTION_GOOGLE"
    }
    if (fallbackMatches.size != 1) {
        throw PatchException(
            "Expected one SUGGESTION_GOOGLE fallback in $this, found ${fallbackMatches.size}"
        )
    }

    val (fallbackIndex, fallbackInstruction) = fallbackMatches.single()
    val fallbackRegister = (fallbackInstruction as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("Suggestion fallback is not a one-register instruction in $this")

    addInstructions(
        fallbackIndex + 1,
        "const-string v$fallbackRegister, \"$suggestionEnumName\""
    )
}

private val SEARCH_ENGINE_VALUES: Map<String, String> = linkedMapOf(
    "Brave" to "brave",
    "Google" to "google",
    "DuckDuckGo" to "duckduckgo",
    "DuckDuckGo Lite" to "duckduckgo-lite",
    "Bing" to "bing",
    "StartPage" to "startpage",
    "StartPage Mobile" to "startpage-mobile",
    "Yahoo" to "yahoo",
    "Yahoo Japan" to "yahoo-japan",
    "Yandex" to "yandex",
    "Yandex (Russian)" to "yandex-russian",
    "Baidu" to "baidu",
    "AOL" to "aol"
)

private val SEARCH_ENGINE_IDS: Map<String, Int> = mapOf(
    "google" to 1,
    "bing" to 3,
    "yahoo" to 4,
    "startpage" to 5,
    "startpage-mobile" to 6,
    "duckduckgo" to 7,
    "duckduckgo-lite" to 8,
    "baidu" to 9,
    "yandex-russian" to 10,
    "yahoo-japan" to 11,
    "aol" to 12,
    "brave" to 13,
    "yandex" to 14
)

private val SEARCH_SUGGESTION_VALUES: Map<String, String> = linkedMapOf(
    "Match search engine" to "match",
    "Brave" to "brave",
    "Google" to "google",
    "DuckDuckGo" to "duckduckgo",
    "Baidu" to "baidu",
    "Yahoo" to "yahoo",
    "Yahoo Japan" to "yahoo-japan",
    "AOL" to "aol",
    "None" to "none"
)

private val SEARCH_SUGGESTION_ENUMS: Map<String, String> = mapOf(
    "google" to "SUGGESTION_GOOGLE",
    "duckduckgo" to "SUGGESTION_DUCK",
    "baidu" to "SUGGESTION_BAIDU",
    "yahoo" to "SUGGESTION_YAHOO",
    "yahoo-japan" to "SUGGESTION_YAHOO_JAPAN",
    "aol" to "SUGGESTION_AOL",
    "brave" to "SUGGESTION_BRAVE",
    "none" to "SUGGESTION_NONE"
)

private val REVERSE_IMAGE_VALUES: Map<String, String> = linkedMapOf(
    "Google" to "google",
    "Bing" to "bing",
    "Yandex" to "yandex",
    "SauceNAO" to "saucenao",
    "Sogou" to "sogou",
    "TinEye" to "tineye"
)

private val REVERSE_IMAGE_IDS: Map<String, Int> = mapOf(
    "google" to 0,
    "bing" to 1,
    "yandex" to 2,
    "saucenao" to 3,
    "sogou" to 4,
    "tineye" to 5
)

private fun suggestionEnumFor(searchEngine: String, searchSuggestions: String): String {
    if (searchSuggestions != "match") {
        return SEARCH_SUGGESTION_ENUMS[searchSuggestions]
            ?: throw PatchException("Unsupported search suggestions option: $searchSuggestions")
    }

    return when (searchEngine) {
        "google" -> "SUGGESTION_GOOGLE"
        "duckduckgo", "duckduckgo-lite" -> "SUGGESTION_DUCK"
        "baidu" -> "SUGGESTION_BAIDU"
        "yahoo" -> "SUGGESTION_YAHOO"
        "yahoo-japan" -> "SUGGESTION_YAHOO_JAPAN"
        "aol" -> "SUGGESTION_AOL"
        "brave" -> "SUGGESTION_BRAVE"
        else -> "SUGGESTION_NONE"
    }
}

private fun constIntInstruction(register: Int, value: Int): String {
    val opcode = if (register < 256) "const/16" else "const"
    return "$opcode v$register, 0x${value.toString(16)}"
}

@Suppress("unused")
val presetBrowserSettingsPatch = bytecodePatch(
    name = "Preset browser settings",
    description = "Sets fresh-install browser fallbacks for normal and incognito modes: Brave search, matching suggestions, and Google search by image by default. Saved or imported choices are preserved and can be changed later in 1DM.",
    default = false
) {
    compatibleWith(COMPATIBILITY_ONEDM)

    val searchEngineOption = stringOption(
        key = "searchEngine",
        default = "brave",
        values = SEARCH_ENGINE_VALUES,
        title = "Search engine",
        description = "Fresh-install fallback for normal and incognito browsing. Saved or imported choices are not overwritten.",
        required = true,
        validator = { it == null || it in SEARCH_ENGINE_VALUES.values }
    )

    val searchSuggestionsOption = stringOption(
        key = "searchSuggestions",
        default = "match",
        values = SEARCH_SUGGESTION_VALUES,
        title = "Search suggestions",
        description = "Fresh-install fallback for normal and incognito browsing. Match uses the selected provider when 1DM supports it, otherwise None.",
        required = true,
        validator = { it == null || it in SEARCH_SUGGESTION_VALUES.values }
    )

    val reverseImageSearchOption = stringOption(
        key = "reverseImageSearch",
        default = "google",
        values = REVERSE_IMAGE_VALUES,
        title = "Search by image",
        description = "Fresh-install fallback for normal and incognito browsing. Brave and DuckDuckGo are not supported by 1DM for reverse image search.",
        required = true,
        validator = { it == null || it in REVERSE_IMAGE_VALUES.values }
    )

    execute {
        val searchEngine = searchEngineOption.value ?: "brave"
        val searchSuggestions = searchSuggestionsOption.value ?: "match"
        val reverseImageSearch = reverseImageSearchOption.value ?: "google"

        val searchEngineId = SEARCH_ENGINE_IDS[searchEngine]
            ?: throw PatchException("Unsupported search engine option: $searchEngine")
        val reverseImageId = REVERSE_IMAGE_IDS[reverseImageSearch]
            ?: throw PatchException("Unsupported search by image option: $reverseImageSearch")
        val suggestionEnumName = suggestionEnumFor(searchEngine, searchSuggestions)

        val loaderMatch = BrowserSettingsLoaderFingerprint.matchAll(1..1).first()
        val importLoaderMatch = BrowserSettingsImportLoaderFingerprint.matchAll(1..1).first()

        val loader = loaderMatch.originalMethod
        val importLoader = importLoaderMatch.originalMethod
        if (importLoader.definingClass != loader.definingClass) {
            throw PatchException(
                "Settings loaders are in different classes: ${loader.definingClass} and ${importLoader.definingClass}"
            )
        }

        val searchField = loader.settingsIntField("search").toSmali()
        val incognitoSearchField = loader.settingsIntField("search_inc").toSmali()
        val reverseImageField = loader.settingsIntField("rv_img_srch").toSmali()
        val incognitoReverseImageField = loader.settingsIntField("rv_img_srch_inc").toSmali()

        val constructorOriginal = loaderMatch.originalClassDef.methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == listOf(CONTEXT)
        } ?: throw PatchException("Could not find the settings constructor in ${loader.definingClass}")

        val loaderInvokeIndex = constructorOriginal.instructions
            .toList()
            .indexOfLast { instruction ->
                val reference = instruction.methodReferenceOrNull() ?: return@indexOfLast false
                MethodUtil.methodSignaturesMatch(loader, reference)
            }
        if (loaderInvokeIndex < 0) {
            throw PatchException("Could not find the settings loader call in $constructorOriginal")
        }

        loaderMatch.method.replaceSuggestionFallback(suggestionEnumName)
        importLoaderMatch.method.replaceSuggestionFallback(suggestionEnumName)

        val constructor = loaderMatch.classDef.methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == listOf(CONTEXT)
        } ?: throw PatchException("Could not find the mutable settings constructor")

        val contextRegister = constructor.p0Register + 1
        val tempRegister = constructor.findFreeRegister(
            loaderInvokeIndex,
            constructor.p0Register,
            contextRegister
        )
        if (tempRegister > 15 || constructor.p0Register > 15) {
            throw PatchException("Settings constructor has no 4-bit register available for iput")
        }

        constructor.addInstructionsAtControlFlowLabel(
            loaderInvokeIndex,
            """
                ${constIntInstruction(tempRegister, searchEngineId)}
                iput v$tempRegister, p0, $searchField
                iput v$tempRegister, p0, $incognitoSearchField
                ${constIntInstruction(tempRegister, reverseImageId)}
                iput v$tempRegister, p0, $reverseImageField
                iput v$tempRegister, p0, $incognitoReverseImageField
            """
        )
    }
}

private data class PromptShownState(
    val listenerClass: String,
    val key: String,
    val shownField: String,
    val getSettingsMethod: String,
    val staticContextField: String,
    val getSettingsStoreMethod: String,
    val setBooleanMethod: String
)

private data class PromptShowSite(
    val state: PromptShownState,
    val insertIndex: Int,
    val builderRegister: Int
)

private fun Match.promptShownState(key: String): PromptShownState {
    val methodInstructions = originalMethod.instructions.toList()

    val shownField = methodInstructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.IPUT_BOOLEAN) return@firstNotNullOfOrNull null
        val field = instruction.getReference<FieldReference>()
            ?: return@firstNotNullOfOrNull null
        if (field.type != "Z") return@firstNotNullOfOrNull null
        field
    } ?: throw PatchException("Could not find the shown field for prompt key \"$key\"")

    val getSettingsMethod = methodInstructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
        val reference = instruction.methodReferenceOrNull()
            ?: return@firstNotNullOfOrNull null
        if (!reference.hasParameters(CONTEXT) || reference.returnType != shownField.definingClass) {
            return@firstNotNullOfOrNull null
        }
        reference
    } ?: throw PatchException("Could not find the settings getter for prompt key \"$key\"")

    val keyIndex = methodInstructions.indexOfFirst { it.stringValueOrNull() == key }
    if (keyIndex < 0) throw PatchException("Could not find prompt key \"$key\" in $originalMethod")

    val setBooleanMethod = methodInstructions.drop(keyIndex + 1).firstNotNullOfOrNull { instruction ->
        val reference = instruction.methodReferenceOrNull()
            ?: return@firstNotNullOfOrNull null
        if (!reference.hasParameters("Ljava/lang/String;", "Z") || reference.returnType != "Z") {
            return@firstNotNullOfOrNull null
        }
        reference
    } ?: throw PatchException("Could not find the boolean settings writer for prompt key \"$key\"")

    val getSettingsStoreMethod = methodInstructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
        val reference = instruction.methodReferenceOrNull()
            ?: return@firstNotNullOfOrNull null
        if (!reference.hasParameters(CONTEXT) || reference.returnType != setBooleanMethod.definingClass) {
            return@firstNotNullOfOrNull null
        }
        reference
    } ?: throw PatchException("Could not find the settings-store getter for prompt key \"$key\"")

    val staticContextField = methodInstructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
        val field = instruction.getReference<FieldReference>()
            ?: return@firstNotNullOfOrNull null
        if (field.definingClass != getSettingsStoreMethod.definingClass || field.type != CONTEXT) {
            return@firstNotNullOfOrNull null
        }
        field
    } ?: throw PatchException("Could not find the static app context for prompt key \"$key\"")

    return PromptShownState(
        listenerClass = originalClassDef.type,
        key = key,
        shownField = shownField.toSmali(),
        getSettingsMethod = getSettingsMethod.toSmali(),
        staticContextField = staticContextField.toSmali(),
        getSettingsStoreMethod = getSettingsStoreMethod.toSmali(),
        setBooleanMethod = setBooleanMethod.toSmali()
    )
}

private fun Method.promptShowSite(state: PromptShownState): PromptShowSite {
    val methodInstructions = instructions.toList()
    val listenerIndex = methodInstructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.NEW_INSTANCE &&
            instruction.getReference<TypeReference>()?.type == state.listenerClass
    }
    if (listenerIndex < 0) {
        throw PatchException("Could not find ${state.listenerClass} construction in $this")
    }

    val searchEnd = minOf(methodInstructions.size, listenerIndex + 80)
    for (showIndex in listenerIndex + 1 until searchEnd) {
        val showInstruction = methodInstructions[showIndex]
        val reference = showInstruction.methodReferenceOrNull() ?: continue
        if (reference.name != "show" || reference.parameterTypes.isNotEmpty()) continue

        val builderRegister = when (showInstruction) {
            is FiveRegisterInstruction -> showInstruction.registerC
            is RegisterRangeInstruction -> showInstruction.startRegister
            else -> throw PatchException("Unsupported dialog show instruction in $this")
        }

        var insertIndex = showIndex + 1
        if (insertIndex < methodInstructions.size &&
            methodInstructions[insertIndex].opcode in setOf(
                Opcode.MOVE_RESULT,
                Opcode.MOVE_RESULT_WIDE,
                Opcode.MOVE_RESULT_OBJECT
            )
        ) {
            insertIndex++
        }

        return PromptShowSite(state, insertIndex, builderRegister)
    }

    throw PatchException("Could not find the dialog show call for ${state.listenerClass} in $this")
}

private fun MutableMethod.injectPromptShownRecord(site: PromptShowSite) {
    val registers = getFreeRegisterProvider(
        site.insertIndex,
        3,
        p0Register,
        site.builderRegister
    )
    val booleanRegister = registers.getFreeRegister4Bit()
    val objectRegister = registers.getFreeRegister4Bit()
    val keyRegister = registers.getFreeRegister4Bit()
    val state = site.state

    // Uses the static application Context field directly so it does not depend on p0 remaining
    // untouched across builder chains (e.g., showDefaultBrowserCheckoutDialog overwrites p0).
    addInstructions(
        site.insertIndex,
        """
            const/4 v$booleanRegister, 0x1
            sget-object v$objectRegister, ${state.staticContextField}
            invoke-static {v$objectRegister}, ${state.getSettingsMethod}
            move-result-object v$objectRegister
            iput-boolean v$booleanRegister, v$objectRegister, ${state.shownField}
            sget-object v$objectRegister, ${state.staticContextField}
            invoke-static {v$objectRegister}, ${state.getSettingsStoreMethod}
            move-result-object v$objectRegister
            const-string v$keyRegister, "${state.key}"
            invoke-virtual {v$objectRegister, v$keyRegister, v$booleanRegister}, ${state.setBooleanMethod}
        """
    )
}

@Suppress("unused")
val browserSetupPromptsOnlyOncePatch = bytecodePatch(
    name = "Browser setup prompts only once",
    description = "Shows the default-browser, accessibility, shortcut-menu-strip, and adblocker setup prompts once, recording each as shown as soon as it appears so closing the browser before dismissing cannot make it repeat.",
    default = false
) {
    compatibleWith(COMPATIBILITY_ONEDM)

    execute {
        val defaultBrowserState = DefaultBrowserPromptDismissFingerprint
            .matchAll(1..1)
            .first()
            .promptShownState("cdbs_shown")
        val accessibilityState = AccessibilityPromptDismissFingerprint
            .matchAll(1..1)
            .first()
            .promptShownState("cas_shown")
        val shortcutStripState = ShortcutMenuStripPromptDismissFingerprint
            .matchAll(1..1)
            .first()
            .promptShownState("csmss_shown")
        val adblockerState = AdblockerPromptDismissFingerprint
            .matchAll(1..1)
            .first()
            .promptShownState("cabs_shown_n")

        // 1. Default-browser checkout dialog (`cdbs_shown`) in showDefaultBrowserCheckoutDialog.
        val defaultPromptMatch = BrowserActivityShowDefaultBrowserPromptFingerprint
            .matchAll(1..1)
            .first()
        val defaultPromptSite = defaultPromptMatch.originalMethod.promptShowSite(defaultBrowserState)
        defaultPromptMatch.method.injectPromptShownRecord(defaultPromptSite)

        // 2. Accessibility (`cas_shown`), shortcut strip (`csmss_shown`), and adblocker (`cabs_shown_n`)
        //    in BrowserActivity.onCreate (patched from highest index to lowest).
        val onCreateMatch = BrowserActivityOnCreateSetupPromptsFingerprint
            .matchAll(1..1)
            .first()
        val originalOnCreate = onCreateMatch.originalMethod
        val showSites = listOf(accessibilityState, shortcutStripState, adblockerState)
            .map { state -> originalOnCreate.promptShowSite(state) }
            .sortedByDescending { it.insertIndex }

        val onCreate = onCreateMatch.method
        showSites.forEach { site ->
            onCreate.injectPromptShownRecord(site)
        }
    }
}
