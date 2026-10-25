package app.venus.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.PatchBuilder

private const val INSTANCE = "Lcom/facebook/react/runtime/ReactInstance;"
internal val discord = Compatibility(
    packageName = "com.discord",
    name = "Discord",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x5865F2,
    targets = listOf(AppTarget(
        version = "350.8 - Stable",
        versionCode = 350008,
        minSdk = 26
    ))
)

/** Section headings in Morphe's patch list. */
internal const val PLUGINS = "Features"
internal const val PRIVACY = "Privacy"

/** Groups a patch under a heading in Morphe. A patcher without categories just shows a flat list. */
internal fun PatchBuilder<*>.section(name: String) {
    try { category(name) } catch (_: LinkageError) { }
}

/** The runtime version recorded next to the injected prelude, read from bootstrap.js itself. */
private fun runtimeRevision(source: String): String =
    Regex("""const revision\s*=\s*"([^"]+)"""").find(source)?.groupValues?.get(1)
        ?: throw PatchException("Venus runtime revision missing")

// Reset per run: Manager can reuse a loaded bundle for multiple selections.
private var pickerSelected = false
private var voiceSelected = false
private var copyBiosSelected = false
private var dashlessSelected = false
private var favouriteAnythingSelected = false
private var freeNitroSelected = false
private var questAgentGuarded = false
private val additionalSelections = mutableSetOf<String>()
internal val discordBundleGuard = rawResourcePatch {
    execute { HbcPrivacy.verifyOriginal(get("assets/index.android.bundle")) }
}

private val runtimeAssets = rawResourcePatch {
    dependsOn(discordBundleGuard)
    execute {
        additionalSelections.clear()
        pickerSelected = false
        voiceSelected = false
        copyBiosSelected = false
        dashlessSelected = false
        favouriteAnythingSelected = false
        freeNitroSelected = false
        questAgentGuarded = false
    }
    finalize {
        val bootstrap = object {}.javaClass.getResourceAsStream("/venus/bootstrap.js")
            ?.bufferedReader()?.use { it.readText() }
            ?: throw PatchException("Venus runtime asset missing from bundle")
        val asset = get("assets/venus/bootstrap.js", false)
        asset.parentFile.mkdirs()
        val selected = bootstrap.replace(
            "/*__FEATURES__*/",
            "{picker:$pickerSelected,voice:$voiceSelected,copyBios:$copyBiosSelected," +
                "dashless:$dashlessSelected,favouriteAnything:$favouriteAnythingSelected,freeNitro:$freeNitroSelected," +
                listOf("noTyping", "quickDelete", "noDelete", "jumpToTop", "hiddenChannels", "pastelize", "platformIndicators", "reviewDB", "readAll", "quests", "badges", "systemFont",
                    "systemEmoji", "hideGift", "hideQuestDock", "hideButtons", "gestures", "hideCall", "validUser", "youBarSettings", "splitMessages", "translate", "userNotif", "accountSwitcher", "appIcons", "nitroThemes", "customThemes", "iconPacks", "messageHighlight", "serverInfo", "fixEmbeds", "tenorGifs")
                    .joinToString(",") { "$it:${it in additionalSelections}" } + "}"
        )
        asset.writeText(selected)
        // One main bundle load: the prelude runs inside the existing HBC98 global entry,
        // so RN cannot mark a separate bootstrap bundle ready or flush native calls early.
        val injected = HbcPrelude.inject(get("assets/index.android.bundle"), selected)
        get("assets/venus/injection.json", false).writeText(
            "{\"revision\":\"${runtimeRevision(bootstrap)}\",\"prefixSize\":${injected.prefixSize}," +
                "\"originalCodeSize\":${injected.originalCodeSize},\"codeOffset\":${injected.codeOffset}}"
        )
    }
}

private object BundleLoader : Fingerprint(
    definingClass = INSTANCE,
    name = "loadJSBundle",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/JSBundleLoader;")
)

internal val packagedDiscordBundle = bytecodePatch {
    dependsOn(discordBundleGuard)
    execute {
        val method = BundleLoader.method
        val owner = BundleLoader.originalClassDef
        if (owner.fields.none {
            it.name == "context" && it.type == "Lcom/facebook/react/runtime/BridgelessReactContext;"
        }) throw PatchException("Discord's React Native context ABI changed")
        val loader = Fingerprint(
            definingClass = "Lcom/facebook/react/bridge/JSBundleLoader;",
            name = "createAssetLoader",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z")
        ).originalMethod
        if (loader.returnType != "Lcom/facebook/react/bridge/JSBundleLoader;")
            throw PatchException("Asset loader factory ABI changed")
        pinPackagedDiscordBundle(method)
        skipLaunchOtaChecks(Fingerprint(
            definingClass = BUNDLE_UPDATER,
            name = "checkForUpdate",
            returnType = "Ljava/util/concurrent/Future;",
            parameters = listOf("I", "Lkotlin/jvm/functions/Function0;")
        ).method)
    }
}

internal const val BUNDLE_UPDATER = "Lcom/discord/bundle_updater/BundleUpdater;"
/** Instructions [skipLaunchOtaChecks] adds before Discord's own code, counting the nop its label lands on. */
internal const val OTA_GUARD_SIZE = 4

/**
 * Discord checks for an over-the-air JS bundle every time an activity opens, and after a crash it blocks
 * the first screen until that check (and any download) finishes. Venus always runs the packaged bundle
 * (see [pinPackagedDiscordBundle]), so those bundles were downloaded, unpacked and stored for nothing,
 * using network, disk and CPU while Discord starts. Launch checks pass no callback: they now return no
 * Future, which every caller already handles (Discord does the same while a check is running). A check
 * with a callback, such as the developer "check for update and reload" action, runs unchanged.
 * 5 registers, 3 of them parameters: v0 is free.
 */
internal fun skipLaunchOtaChecks(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("OTA check has no code")
    if (method.definingClass != BUNDLE_UPDATER || method.parameterTypes.map { it.toString() } != listOf("I", "Lkotlin/jvm/functions/Function0;") ||
        method.returnType != "Ljava/util/concurrent/Future;" || implementation.registerCount - 3 < 1)
        throw PatchException("BundleUpdater.checkForUpdate ABI changed")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        if-nez p2, :venus_ota_check
        const/4 v0, 0x0
        return-object v0
        :venus_ota_check
        nop
    """)
}


internal fun pinPackagedDiscordBundle(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    // Pin JS execution to the inspected packaged bundle, avoiding incompatible OTA cache bundles.
    // 350.8 has two scratch locals; p1 is deliberately replaced with an asset loader.
    if ((method.implementation?.registerCount ?: 0) - 2 < 2)
        throw PatchException("Bundle loader no longer has two safe scratch registers")
    method.addInstructions(0, """
        iget-object v0, p0, $INSTANCE->context:Lcom/facebook/react/runtime/BridgelessReactContext;
        const-string v1, "assets://index.android.bundle"
        const/4 p1, 0x0
        invoke-static {v0, v1, p1}, Lcom/facebook/react/bridge/JSBundleLoader;->createAssetLoader(Landroid/content/Context;Ljava/lang/String;Z)Lcom/facebook/react/bridge/JSBundleLoader;
        move-result-object p1
    """)
}

/** Copies every language file from the bundle into the APK's assets/venus/i18n. */
private val i18nAssets = rawResourcePatch {
    execute {
        val index = object {}.javaClass.getResourceAsStream("/venus/i18n/index.txt")?.bufferedReader()?.use { it.readText() }
            ?: throw PatchException("Venus language list missing from bundle")
        val folder = get("assets/venus/i18n", false)
        folder.mkdirs()
        for (code in index.lines().map { it.trim() }.filter { it.isNotEmpty() }) {
            if (!Regex("^[A-Za-z-]{2,10}$").matches(code)) throw PatchException("Bad language code $code")
            val bytes = object {}.javaClass.getResourceAsStream("/venus/i18n/$code.json")?.use { it.readBytes() }
                ?: throw PatchException("Venus language $code missing from bundle")
            java.io.File(folder, "$code.json").writeBytes(bytes)
        }
    }
}

internal const val LANGUAGES = "Lapp/venus/i18n/Languages;"
/** Instructions [languageBridge] adds before Discord's own readAsset code, counting the nop its label lands on. */
internal const val LANGUAGE_BRIDGE_SIZE = 11

/**
 * Venus settings languages: assets/venus/i18n/<code>.json, read through FileModule.readAsset with a private prefix
 * (readAsset(uri, encoding, promise): p1 is the URI, p3 the Promise). Discord's own readAsset calls fall through.
 * Its own method, like the voice and font bridges: each FileModule method gets at most one Venus guard.
 */
internal fun languageBridge(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    if (method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", "Ljava/lang/String;", PROMISE) || method.returnType != "V" ||
        (method.implementation?.registerCount ?: 0) - 4 < 2)
        throw PatchException("FileModule.readAsset ABI changed")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        const-string v0, "venus-i18n-v1:"
        invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :venus_original_asset
        invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
        move-result-object v0
        invoke-static {p1, p3, v0}, $LANGUAGES->dispatch(Ljava/lang/String;${PROMISE}Landroid/content/Context;)Z
        move-result v1
        if-eqz v1, :venus_original_asset
        return-void
        :venus_original_asset
        nop
    """)
}

/** Hidden helper of Venus settings: the language files and the bridge that reads them. */
internal val settingsLanguages = bytecodePatch {
    dependsOn(discordBundleGuard, i18nAssets)
    extendWith("extensions/i18n.mpe")
    execute {
        languageBridge(Fingerprint(
            definingClass = FILE_MODULE,
            name = "readAsset",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", PROMISE)
        ).method)
    }
}

@Suppress("unused")
val venusSettings = bytecodePatch(
    name = "Venus settings",
    description = "Adds Venus to Discord's settings, where you turn each feature on or off, in your language. Needed by every feature."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(runtimeAssets, packagedDiscordBundle, passkeyErrorHint, settingsLanguages)
}



@Suppress("unused")
val fileSizeOnPicker = rawResourcePatch(
    name = "Show file sizes when attaching",
    description = "Photos and videos in the picker show their size."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { pickerSelected = true }
}

@Suppress("unused")
val copyBios = rawResourcePatch(
    name = "Copy profile bios",
    description = "Hold a bio to select and copy it."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { copyBiosSelected = true }
}

@Suppress("unused")
val dashless = rawResourcePatch(
    name = "Spaces in channel names",
    description = "Shows \"general chat\" instead of \"general-chat\"."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { dashlessSelected = true }
}

@Suppress("unused")
val favouriteAnything = rawResourcePatch(
    name = "Favourite any image or video",
    description = "Star any image or video to keep it in your GIF favourites."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { favouriteAnythingSelected = true }
}

@Suppress("unused")
val freeNitro = rawResourcePatch(
    name = "Send Nitro stickers and emojis as links",
    description = "Sends Nitro emojis and stickers as links that show as the image."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { freeNitroSelected = true }
}

@Suppress("unused")
val customVoiceMessages = bytecodePatch(
    name = "Send audio as voice messages",
    description = "Audio files are sent as voice messages. Android 10 or newer."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    extendWith("extensions/voice.mpe")
    execute {
        voiceSelected = true
        voiceBridge(Fingerprint(
            definingClass = FILE_MODULE,
            name = "getSize",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", PROMISE)
        ).method)
    }
}

internal const val FILE_MODULE = "Lcom/discord/file_manager/FileModule;"
internal const val PROMISE = "Lcom/facebook/react/bridge/Promise;"
/** Instructions [voiceBridge] adds before Discord's own getSize code, counting the nop its label lands on. */
internal const val VOICE_BRIDGE_SIZE = 11

/**
 * Existing TurboModule schemas cannot expose arbitrary new ReactMethod functions, so voice messages
 * dispatch a private URI prefix through getSize's Promise; normal size requests fall through.
 *
 * Each Discord method gets at most one Venus prefix. Morphe re-encodes an earlier prefix's branches
 * when a second one is inserted in front of it, and in 1.5.0 that left getSize's branches pointing
 * into the middle of an instruction: Android rejected FileModule and Discord froze on its icon.
 */
internal fun voiceBridge(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    if ((method.implementation?.registerCount ?: 0) - 3 < 2)
        throw PatchException("File bridge no longer has two safe scratch registers")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        const-string v0, "venus-voice-v1:"
        invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :venus_original_size
        invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
        move-result-object v0
        invoke-static {p1, p2, v0}, Lapp/venus/extension/VoiceProcessor;->dispatch(Ljava/lang/String;${PROMISE}Landroid/content/Context;)Z
        move-result v1
        if-eqz v1, :venus_original_size
        return-void
        :venus_original_size
        nop
    """)
}

/** Fails the patch, instead of freezing Discord, if another Venus prefix already sits in this method. */
internal fun requireUnpatched(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, marker: String) {
    val strings = method.implementation?.instructions?.mapNotNull {
        ((it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
            as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
    } ?: emptyList()
    val calls = method.implementation?.instructions?.mapNotNull {
        ((it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
            as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.definingClass
    } ?: emptyList()
    if (strings.any { it.startsWith(marker) } || calls.any { it.startsWith("Lapp/venus/") })
        throw PatchException("${method.definingClass}->${method.name} already has a Venus guard; each method may only get one")
}

// Each feature is its own selectable patch, bundled offline in the Venus runtime.
private fun bundledPlugin(key: String, title: String, summary: String) = rawResourcePatch(
    name = title,
    description = summary
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { additionalSelections += key }
}

@Suppress("unused")
val noTyping = bundledPlugin("noTyping", "Hide typing indicator", "Others won't see when you're typing. You still see when they are.")

@Suppress("unused")
val quickDelete = bundledPlugin("quickDelete", "Skip delete confirmation", "Messages and link previews are removed right away, with no \"Are you sure?\". It can't be undone.")

@Suppress("unused")
val noDelete = bundledPlugin("noDelete", "Keep deleted messages", "Deleted messages stay in chat, outlined in red, and edited messages show what they said before. Can be kept after restarting.")

@Suppress("unused")
val jumpToTop = bundledPlugin("jumpToTop", "Jump to first message", "A button to go straight to the start of a chat, channel or thread.")

@Suppress("unused")
val hiddenChannels = bundledPlugin("hiddenChannels", "Show hidden channels", "Channels you can't open appear with a lock. Only their name and dates show, not messages.")

internal const val REPLY_PREVIEW = "Lcom/discord/chat/presentation/message/MessageViewReplyPreview;"
internal const val REPLY_BINDING = "Lcom/discord/chat/databinding/MessageViewReplyPreviewBinding;"
internal const val BRIDGE_MESSAGE = "Lcom/discord/chat/bridge/Message;"
/** Instructions [pastelReplyText] adds before Discord's own reply text code, counting the nop its label lands on. */
internal const val PASTEL_REPLY_GUARD_SIZE = 17

/**
 * Discord's reply preview paints the quoted text in one theme color, set once when the view is made, and
 * never reads the message's textColor, so Pastelize's "Color message text" never reached replies (#45).
 * Before the reply text is drawn, this sets it to the replied message's textColor, or Discord's own
 * color when there is none: Venus only sends textColor on a reply when it colors it. Recycled previews
 * get their color set each time. 43 registers, 4 of them parameters: v0-v2 are free until Discord's first move.
 */
internal fun pastelReplyText(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("Reply preview text has no code")
    if (method.parameterTypes.map { it.toString() } != listOf("Lcom/discord/chat/bridge/structurabletext/StructurableText;", REPLY_PREVIEW, BRIDGE_MESSAGE, "I") ||
        method.returnType != "Lkotlin/Unit;" || implementation.registerCount - 5 < 3)
        throw PatchException("MessageViewReplyPreview reply text ABI changed")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        move-object/from16 v2, p2
        if-eqz v2, :venus_reply_text
        invoke-virtual {v2}, $BRIDGE_MESSAGE->getTextColor()Ljava/lang/Integer;
        move-result-object v0
        if-nez v0, :venus_reply_color
        invoke-static {}, Lcom/discord/theme/ThemeManagerKt;->getTheme()Lcom/discord/theme/DiscordThemeObject;
        move-result-object v0
        invoke-virtual {v0}, Lcom/discord/theme/DiscordThemeObject;->getInteractiveTextDefault()I
        move-result v0
        goto :venus_reply_set
        :venus_reply_color
        invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
        move-result v0
        :venus_reply_set
        move-object/from16 v1, p1
        iget-object v1, v1, $REPLY_PREVIEW->binding:$REPLY_BINDING
        iget-object v1, v1, $REPLY_BINDING->replyText:Lcom/discord/chat/presentation/message/view/MessageContentView;
        invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V
        :venus_reply_text
        nop
    """)
}

@Suppress("unused")
val pastelize = bytecodePatch(
    name = "Pastel name colors",
    description = "Names without a role color get a soft pastel one."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute {
        additionalSelections += "pastelize"
        pastelReplyText(Fingerprint(
            // The lambda's number changes between builds ($9 in 349.9, $2 in 350.8); its signature is unique.
            definingClass = REPLY_PREVIEW,
            returnType = "Lkotlin/Unit;",
            parameters = listOf("Lcom/discord/chat/bridge/structurabletext/StructurableText;", REPLY_PREVIEW, BRIDGE_MESSAGE, "I")
        ).method)
    }
}

@Suppress("unused")
val platformIndicators = bundledPlugin("platformIndicators", "Show device indicators", "Desktop, mobile, web, console or VR icons next to names, colored by status.")

@Suppress("unused")
val reviewDB = bundledPlugin("reviewDB", "User and server reviews", "Read and write reviews on profiles and servers, from the community ReviewDB service (manti.vendicated.dev).")

@Suppress("unused")
val readAll = bundledPlugin("readAll", "Read all button", "A button under Direct Messages that marks servers, DMs or both as read.")

@Suppress("unused")
val serverInfo = bundledPlugin("serverInfo", "Server info", "Hold a server's icon to see its details, boosts and friends there. Based on ServerInfo by fshin.")

internal const val FONT_MANAGER = "Lcom/facebook/react/common/assets/ReactFontManager;"
internal const val FONT_STYLE = "Lcom/facebook/react/common/assets/ReactFontManager\$TypefaceStyle;"
internal const val SYSTEM_FONT = "Lapp/venus/font/SystemFont;"
/** Instructions [useSystemFont] adds before Discord's own font lookup, counting the nop its label lands on. */
internal const val SYSTEM_FONT_GUARD_SIZE = 9

/**
 * Every Discord text, React Native or native chat, gets its font from this one ReactFontManager method.
 * When Force system font is on, Discord's own families come back as the phone's font; everything else,
 * and every lookup while it's off, runs Discord's code untouched. 6 registers, 4 of them parameters: v0-v1 are free.
 */
internal fun useSystemFont(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("Font lookup has no code")
    if (method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", FONT_STYLE, "Landroid/content/res/AssetManager;") ||
        method.returnType != "Landroid/graphics/Typeface;" || implementation.registerCount - 4 < 2)
        throw PatchException("ReactFontManager.getTypeface ABI changed")
    method.addInstructions(0, """
        sget-boolean v0, $SYSTEM_FONT->enabled:Z
        if-eqz v0, :venus_discord_font
        invoke-virtual {p2}, $FONT_STYLE->getNearestStyle()I
        move-result v0
        invoke-static {p1, v0}, $SYSTEM_FONT->typeface(Ljava/lang/String;I)Landroid/graphics/Typeface;
        move-result-object v0
        if-eqz v0, :venus_discord_font
        return-object v0
        :venus_discord_font
        nop
    """)
}

/** Reads the saved Force system font setting once, right after Application.onCreate's super call. */
internal fun readSystemFontSetting(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val first = method.implementation?.instructions?.firstOrNull()
    val target = (first as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()
    if (first?.opcode != com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER || target != "Landroid/app/Application;->onCreate()V")
        throw PatchException("MainApplication.onCreate no longer starts with super.onCreate()")
    method.addInstructions(1, "invoke-static {p0}, $SYSTEM_FONT->init(Landroid/content/Context;)V")
}

/** Instructions [systemFontBridge] adds before Discord's own fileExists code, counting the nop its label lands on. */
internal const val SYSTEM_FONT_BRIDGE_SIZE = 9

/**
 * Lets Venus settings reopen Discord after the font changes. Uses fileExists, not getSize: voice messages
 * already guard getSize, and a second prefix in one method breaks the first one's branches (see [voiceBridge]).
 * Venus only ever asks fileExists about absolute paths, so the private prefix can't match a real request.
 */
internal fun systemFontBridge(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    if (method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", PROMISE) || method.returnType != "V" ||
        (method.implementation?.registerCount ?: 0) - 3 < 2)
        throw PatchException("FileModule.fileExists ABI changed")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        const-string v0, "venus-font-v1:"
        invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :venus_font_exists
        invoke-static {p1, p2}, $SYSTEM_FONT->dispatch(Ljava/lang/String;$PROMISE)Z
        move-result v1
        if-eqz v1, :venus_font_exists
        return-void
        :venus_font_exists
        nop
    """)
}

@Suppress("unused")
val forceSystemFont = bytecodePatch(
    name = "Use your phone's font",
    description = "Replaces Discord's font (gg sans) with your phone's, everywhere. Android 9 or newer."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    extendWith("extensions/font.mpe")
    execute {
        additionalSelections += "systemFont"
        useSystemFont(Fingerprint(
            definingClass = FONT_MANAGER,
            name = "getTypeface",
            returnType = "Landroid/graphics/Typeface;",
            parameters = listOf("Ljava/lang/String;", FONT_STYLE, "Landroid/content/res/AssetManager;")
        ).method)
        systemFontBridge(Fingerprint(
            definingClass = FILE_MODULE,
            name = "fileExists",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", PROMISE)
        ).method)
        readSystemFontSetting(Fingerprint(
            definingClass = "Lcom/discord/MainApplication;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf()
        ).method)
    }
}

internal const val SURROGATES = "Lcom/discord/emoji/Surrogates;"
internal const val SYSTEM_EMOJI = "Lapp/venus/emoji/SystemEmoji;"
/** Instructions [useSystemEmoji] adds before Discord's own emoji picture lookup, counting the nop its label lands on. */
internal const val SYSTEM_EMOJI_GUARD_SIZE = 7

/**
 * Native chat, reactions and the emoji picker all get a Unicode emoji's picture from this one method,
 * which returns Discord's bundled asset:///emoji-….png. When Force system emojis is on, it returns the
 * phone's drawing instead; an emoji the phone can't draw, and every lookup while it's off, runs Discord's
 * code untouched. 3 registers, 1 of them the parameter: v0-v1 are free.
 */
internal fun useSystemEmoji(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("Emoji picture lookup has no code")
    if (method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;") || method.returnType != "Ljava/lang/String;" ||
        implementation.registerCount - 1 < 2)
        throw PatchException("Surrogates.toAssetUrl ABI changed")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        sget-boolean v0, $SYSTEM_EMOJI->enabled:Z
        if-eqz v0, :venus_discord_emoji
        invoke-static {p0}, $SYSTEM_EMOJI->url(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :venus_discord_emoji
        return-object v0
        :venus_discord_emoji
        nop
    """)
}

/** Instructions [systemEmojiBridge] adds before Discord's own getVideoDimensions code, counting the nop its label lands on. */
internal const val SYSTEM_EMOJI_BRIDGE_SIZE = 7

/**
 * Lets Venus settings reopen Discord after the emoji setting changes. getVideoDimensions only ever rejects on
 * Android ("only supported on iOS") and Discord's JS never calls it, so a request with the private prefix
 * goes to Venus and anything else still gets Discord's own answer. No other Venus guard uses this method.
 */
internal fun systemEmojiBridge(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    if (method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", PROMISE) || method.returnType != "V" ||
        (method.implementation?.registerCount ?: 0) - 3 < 1)
        throw PatchException("FileModule.getVideoDimensions ABI changed")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        const-string v0, "venus-emoji-v1:"
        invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :venus_emoji_dimensions
        invoke-static {p1, p2}, $SYSTEM_EMOJI->dispatch(Ljava/lang/String;$PROMISE)V
        return-void
        :venus_emoji_dimensions
        nop
    """)
}

/** Reads the saved Force system emojis setting once, right after Application.onCreate's super call. */
internal fun readSystemEmojiSetting(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val first = method.implementation?.instructions?.firstOrNull()
    val target = (first as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()
    if (first?.opcode != com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER || target != "Landroid/app/Application;->onCreate()V")
        throw PatchException("MainApplication.onCreate no longer starts with super.onCreate()")
    method.addInstructions(1, "invoke-static {p0}, $SYSTEM_EMOJI->init(Landroid/content/Context;)V")
}

@Suppress("unused")
val forceSystemEmojis = bytecodePatch(
    name = "Use your phone's emojis",
    description = "Your phone's emojis instead of Discord's, in chat, reactions and the emoji picker."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    extendWith("extensions/emoji.mpe")
    execute {
        additionalSelections += "systemEmoji"
        useSystemEmoji(Fingerprint(
            definingClass = SURROGATES,
            name = "toAssetUrl-impl",
            returnType = "Ljava/lang/String;",
            parameters = listOf("Ljava/lang/String;")
        ).method)
        systemEmojiBridge(Fingerprint(
            definingClass = FILE_MODULE,
            name = "getVideoDimensions",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", PROMISE)
        ).method)
        readSystemEmojiSetting(Fingerprint(
            definingClass = "Lcom/discord/MainApplication;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf()
        ).method)
    }
}

@Suppress("unused")
val hideGiftButton = bundledPlugin("hideGift", "Hide the gift button",
    "Removes the Nitro gift button from the message bar.")

@Suppress("unused")
val messageGestures = bundledPlugin("gestures", "Double-tap to reply",
    "Double-tap a message to reply, or your own to edit it. Triple-tap your own to delete it. Based on Geastures+ by kmmiio99o.")

@Suppress("unused")
val hideCallButton = bundledPlugin("hideCall", "Hide the call button",
    "Removes Call from people's profiles. Message fills the space.")

@Suppress("unused")
val hideExtraButtons = bundledPlugin("hideButtons", "Hide extra buttons",
    "Removes the Quests, Shop, Nitro and Apps buttons you don't use. Pick which ones, including Polls and Photos in the attach menu; the rest close up with no gaps.")

@Suppress("unused")
val hideQuestDock = bundledPlugin("hideQuestDock", "Hide the Quests banner",
    "Removes the Quest promotion above your profile bar. Quests still work.")

@Suppress("unused")
val validUser = bundledPlugin("validUser", "Fix unknown mentions",
    "@unknown-user mentions are looked up and show the person's name. Based on ValidUser by fshin, o.oer and kmmiio99o.")

@Suppress("unused")
val youBarSettings = bundledPlugin("youBarSettings", "Venus button on profile bar",
    "A shortcut to Venus settings, next to the notifications bell.")

@Suppress("unused")
val bringBackTenorGifs = bundledPlugin("tenorGifs", "Bring back Tenor GIFs",
    "Tenor GIFs show in Discord's GIF picker again, mixed with Discord's own or on their own. Inspired by BringBackTenor by Livie.")

@Suppress("unused")
val fixLinkPreviews = bundledPlugin("fixEmbeds", "Fix link previews",
    "Links to X, Instagram, TikTok, Reddit and more show the post. Links you send go through an embed service like FxTwitter, without tracking. Inspired by FixEmbed by the ShiggyCord team.")

@Suppress("unused")
val splitLargeMessages = bundledPlugin("splitMessages", "Send long messages",
    "Type past the character limit. Long messages are sent in parts, split between lines or words. Based on SplitLargeMessages by sunnie.")

@Suppress("unused")
val translateMessages = bundledPlugin("translate", "Translate messages",
    "Messages in other languages show in yours. Their text is sent to Google Translate, without your account.")

@Suppress("unused")
val userActivityNotifications = bundledPlugin("userNotif", "User activity notifications",
    "Shows a notice when chosen friends or users change status, start typing or send a message. Based on UserNotif by cywrx and coder.gg.")

@Suppress("unused")
val accountSwitcher = bundledPlugin("accountSwitcher", "Account switcher",
    "Switch between multiple Discord accounts from the You tab, your profile bar or Settings.")

@Suppress("unused")
val unlockAppIcons = bundledPlugin("appIcons", "Unlock app icons",
    "Use any Discord app icon in Settings without Nitro.")

@Suppress("unused")
val unlockNitroThemes = bundledPlugin("nitroThemes", "Unlock Nitro themes",
    "Use Discord's gradient themes in Settings > Appearance without Nitro. Only this phone sees them.")

@Suppress("unused")
val customThemes = bundledPlugin("customThemes", "Custom themes",
    "Install color themes from a link and switch between them. Works with Revenge and Vendetta themes.")

@Suppress("unused")
val iconPacks = bundledPlugin("iconPacks", "Icon packs",
    "Replace Discord's icons with community icon packs or a custom icon pack link. Works with Themes+ icon packs.")

internal const val HIGHLIGHT_DRAWER = "Lcom/discord/chat/presentation/message/decorations/HighlightedMessageDrawer;"
internal const val CHAT_R_DIMEN = "Lcom/discord/chat/R\$dimen;"
/** Instructions [scaleMessageGutterWidth] adds before Discord's own drawHighlight code, counting the nop its label lands on. */
internal const val MESSAGE_GUTTER_GUARD_SIZE = 25

/**
 * Discord's native HighlightedMessageDrawer sets gutterWidth once from R.dimen.message_gutter_width (2dp)
 * in its constructor, and paints the left bar with gutterPaintColor. When Message highlights encodes a width
 * multiplier (2x..8x) in gutterPaintColor's alpha byte (256 - multiplier = 254..248), this guard restores full
 * 0xFF alpha on gutterPaintColor and scales gutterWidth by that multiplier; normal 0xFF colors reset gutterWidth
 * to 1x so toggling or changing thickness updates every row live without restarting Discord (#60).
 * 12 registers, 5 of them parameters (p0..p4 = v7..v11): v0-v2 are free until Discord's first const-string.
 */
internal fun scaleMessageGutterWidth(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("HighlightedMessageDrawer.drawHighlight has no code")
    if (method.definingClass != HIGHLIGHT_DRAWER || method.parameterTypes.map { it.toString() } != listOf("Landroid/graphics/Canvas;", "Landroid/view/View;", "I", "I") ||
        method.returnType != "V" || implementation.registerCount - 5 < 3)
        throw PatchException("HighlightedMessageDrawer.drawHighlight ABI changed")
    if (implementation.instructions.firstOrNull()?.opcode == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT)
        throw PatchException("${method.definingClass}->${method.name} already has a Venus guard; each method may only get one")
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        iget-object v0, p0, $HIGHLIGHT_DRAWER->gutterPaintColor:Ljava/lang/Integer;
        if-eqz v0, :venus_gutter_done
        invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
        move-result v0
        ushr-int/lit8 v1, v0, 0x18
        rsub-int v1, v1, 0x100
        const/4 v2, 0x2
        if-lt v1, v2, :venus_gutter_default
        const/16 v2, 0x8
        if-gt v1, v2, :venus_gutter_default
        const/high16 v2, -0x1000000
        or-int/2addr v0, v2
        invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v0
        iput-object v0, p0, $HIGHLIGHT_DRAWER->gutterPaintColor:Ljava/lang/Integer;
        goto :venus_gutter_scale
        :venus_gutter_default
        const/4 v1, 0x1
        :venus_gutter_scale
        invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
        move-result-object v0
        sget v2, $CHAT_R_DIMEN->message_gutter_width:I
        invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
        move-result v0
        mul-int/2addr v0, v1
        iput v0, p0, $HIGHLIGHT_DRAWER->gutterWidth:I
        :venus_gutter_done
        nop
    """)
}

@Suppress("unused")
val messageHighlights = bytecodePatch(
    name = "Message highlights",
    description = "Pick bar width and colors for replies, mentions and deleted messages."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute {
        additionalSelections += "messageHighlight"
        scaleMessageGutterWidth(Fingerprint(
            definingClass = HIGHLIGHT_DRAWER,
            name = "drawHighlight",
            returnType = "V",
            parameters = listOf("Landroid/graphics/Canvas;", "Landroid/view/View;", "I", "I")
        ).method)
    }
}

internal const val USER_AGENT_INTERCEPTOR = "Lcom/discord/client_info/ClientUserAgent\$DiscordUserAgentInterceptor;"
/** The start of the Windows desktop User-Agent that Quest Completer sends Play and Activity heartbeats with. */
internal const val QUEST_DESKTOP_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/"
/** Instructions [keepDesktopQuestAgent] adds before Discord's own code, counting the nop its label lands on. */
internal const val QUEST_AGENT_GUARD_SIZE = 14

/**
 * Discord's OkHttp interceptor replaces every request's User-Agent with Discord-Android/350008;RNA.
 * A request that already says it's the Windows desktop app passes through untouched; everything else is unchanged.
 * Locals v0-v2 are free: the interceptor has 5 registers and 2 of them are parameters.
 */
internal fun keepDesktopQuestAgent(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("User-Agent interceptor has no code")
    if (method.parameterTypes.map { it.toString() } != listOf("Lokhttp3/Interceptor\$Chain;") ||
        method.returnType != "Lokhttp3/Response;" || implementation.registerCount - 2 < 3)
        throw PatchException("Discord's User-Agent interceptor ABI changed")
    method.addInstructions(0, """
        invoke-interface {p1}, Lokhttp3/Interceptor${'$'}Chain;->h()Lokhttp3/Request;
        move-result-object v0
        const-string v1, "User-Agent"
        invoke-virtual {v0, v1}, Lokhttp3/Request;->a(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v1
        if-eqz v1, :venus_android_agent
        const-string v2, "$QUEST_DESKTOP_AGENT"
        invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :venus_android_agent
        invoke-interface {p1, v0}, Lokhttp3/Interceptor${'$'}Chain;->a(Lokhttp3/Request;)Lokhttp3/Response;
        move-result-object v0
        return-object v0
        :venus_android_agent
        nop
    """)
}

@Suppress("unused")
val questCompleter = bytecodePatch(
    name = "Complete Quests automatically",
    description = "Finishes video, Play and Activity Quests in the background. Discord may pause Quests on accounts that do this."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute {
        additionalSelections += "quests"
        // Play and Activity time only counts when it comes from the desktop app.
        if (!questAgentGuarded) {
            questAgentGuarded = true
            keepDesktopQuestAgent(Fingerprint(
                definingClass = USER_AGENT_INTERCEPTOR,
                name = "intercept",
                returnType = "Lokhttp3/Response;",
                parameters = listOf("Lokhttp3/Interceptor\$Chain;")
            ).method)
        }
    }
}

@Suppress("unused")
val badgeCompleter = bytecodePatch(
    name = "Complete badges automatically",
    description = "Plays real PC games in the background, up to 3 at once, toward your Hours Played and Unique Games Played badges."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute {
        additionalSelections += "badges"
        if (!questAgentGuarded) {
            questAgentGuarded = true
            keepDesktopQuestAgent(Fingerprint(
                definingClass = USER_AGENT_INTERCEPTOR,
                name = "intercept",
                returnType = "Lokhttp3/Response;",
                parameters = listOf("Lokhttp3/Interceptor\$Chain;")
            ).method)
        }
    }
}
