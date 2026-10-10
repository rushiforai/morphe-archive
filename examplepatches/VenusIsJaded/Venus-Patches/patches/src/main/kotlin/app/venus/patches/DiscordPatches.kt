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
        version = "348.10 - Stable",
        versionCode = 348010,
        minSdk = 26,
        description = "Pinned Discord 348.10 bundle; Android device validation still required."
    ))
)

/** Section headings in Morphe's patch list. */
internal const val PLUGINS = "Plugins"
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
                listOf("noTyping", "quickDelete", "noDelete", "jumpToTop", "hiddenChannels", "pastelize", "platformIndicators", "reviewDB", "readAll", "quests")
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
    }
}


internal fun pinPackagedDiscordBundle(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    // Pin JS execution to the inspected packaged bundle, avoiding incompatible OTA cache bundles.
    // 348.10 has two scratch locals; p1 is deliberately replaced with an asset loader.
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

@Suppress("unused")
val venusSettings = bytecodePatch(
    name = "Venus settings",
    description = "Adds a Venus section to Discord's settings, where you can turn each plugin on or off. Needed by every plugin."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(runtimeAssets, packagedDiscordBundle)
}

@Suppress("unused")
val fileSizeOnPicker = rawResourcePatch(
    name = "File size on picker",
    description = "Shows file sizes on photos and videos when you attach them."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { pickerSelected = true }
}

@Suppress("unused")
val copyBios = rawResourcePatch(
    name = "CopyBios",
    description = "Lets you select and copy profile bios. Links still work."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { copyBiosSelected = true }
}

@Suppress("unused")
val dashless = rawResourcePatch(
    name = "Dashless",
    description = "Shows spaces instead of dashes in channel names. Only changes how they look."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { dashlessSelected = true }
}

@Suppress("unused")
val favouriteAnything = rawResourcePatch(
    name = "FavouriteAnything",
    description = "Lets you favourite any image or video from the media viewer."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { favouriteAnythingSelected = true }
}

@Suppress("unused")
val freeNitro = rawResourcePatch(
    name = "FreeNitro",
    description = "Sends emojis and stickers you can't use as image links. These are links, not real Nitro emojis or stickers."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute { freeNitroSelected = true }
}

@Suppress("unused")
val customVoiceMessages = bytecodePatch(
    name = "Custom voice messages",
    description = "Sends an audio file as a real voice message, with Discord's own waveform. Needs Android 10 or newer. Turn it on in Venus settings."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    extendWith("extensions/voice.mpe")
    execute {
        voiceSelected = true
        val fileSize = Fingerprint(
            definingClass = "Lcom/discord/file_manager/FileModule;",
            name = "getSize",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
        ).method
        if ((fileSize.implementation?.registerCount ?: 0) - 3 < 2)
            throw PatchException("File bridge no longer has two safe scratch registers")
        // Existing TurboModule schemas cannot expose arbitrary new ReactMethod functions.
        // Dispatch a private URI prefix through the existing Promise bridge; normal size requests fall through.
        fileSize.addInstructions(0, """
            const-string v0, "venus-voice-v1:"
            invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :venus_original_size
            invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
            move-result-object v0
            invoke-static {p1, p2, v0}, Lapp/venus/extension/VoiceProcessor;->dispatch(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;Landroid/content/Context;)Z
            move-result v1
            if-eqz v1, :venus_original_size
            return-void
            :venus_original_size
            nop
        """)
    }
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
val noTyping = bundledPlugin("noTyping", "No typing", "Hides that you're typing. You still see when others type.")

@Suppress("unused")
val quickDelete = bundledPlugin("quickDelete", "QuickDelete", "Skips the \"are you sure?\" when deleting messages or embeds. Turn it on in Venus settings.")

@Suppress("unused")
val noDelete = bundledPlugin("noDelete", "NoDelete", "Keeps deleted messages visible, outlined in red. You can save them for good and choose how many to keep. Turn it on in Venus settings.")

@Suppress("unused")
val jumpToTop = bundledPlugin("jumpToTop", "JumpToTop", "Adds a button to jump to the first message in a chat.")

@Suppress("unused")
val hiddenChannels = bundledPlugin("hiddenChannels", "Hidden Channels", "Shows channels you can't open, with a lock and when they were created and last used. It can't show their messages. Turn it on in Venus settings.")

@Suppress("unused")
val pastelize = bundledPlugin("pastelize", "Pastelize", "Gives names and mentions without a role color a soft pastel color.")

@Suppress("unused")
val platformIndicators = bundledPlugin("platformIndicators", "PlatformIndicators", "Shows whether people are on desktop, mobile, web, console or VR, on profiles, in lists and in DMs.")

@Suppress("unused")
val reviewDB = bundledPlugin("reviewDB", "ReviewDB", "Read and write reviews of users and servers, using the community ReviewDB service (manti.vendicated.dev). Turn it on in Venus settings.")

@Suppress("unused")
val readAll = bundledPlugin("readAll", "Read All", "Adds a Read all button to the server list, under the Direct Messages button. Choose whether it clears servers, DMs or both.")

internal const val USER_AGENT_INTERCEPTOR = "Lcom/discord/client_info/ClientUserAgent\$DiscordUserAgentInterceptor;"
/** The start of the Windows desktop User-Agent that Quest Completer sends Play and Activity heartbeats with. */
internal const val QUEST_DESKTOP_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/"
/** Instructions [keepDesktopQuestAgent] adds before Discord's own code, counting the nop its label lands on. */
internal const val QUEST_AGENT_GUARD_SIZE = 14

/**
 * Discord's OkHttp interceptor replaces every request's User-Agent with Discord-Android/348010;RNA.
 * A request that already says it's the Windows desktop app passes through untouched; everything else is unchanged.
 * Locals v0-v2 are free: the interceptor has 5 registers and 2 of them are parameters.
 */
internal fun keepDesktopQuestAgent(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("User-Agent interceptor has no code")
    if (method.parameterTypes.map { it.toString() } != listOf("Lokhttp3/Interceptor\$Chain;") ||
        method.returnType != "Lokhttp3/Response;" || implementation.registerCount - 2 < 3)
        throw PatchException("Discord's User-Agent interceptor ABI changed")
    method.addInstructions(0, """
        invoke-interface {p1}, Lokhttp3/Interceptor${'$'}Chain;->i()Lokhttp3/Request;
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
    name = "Quest Completer",
    description = "Completes video, Play and Activity Quests in the background when Discord is open, with no screen or tap. You still claim rewards yourself. Discord may pause Quests on accounts that do this."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings)
    execute {
        additionalSelections += "quests"
        // Play and Activity time only counts when it comes from the desktop app.
        keepDesktopQuestAgent(Fingerprint(
            definingClass = USER_AGENT_INTERCEPTOR,
            name = "intercept",
            returnType = "Lokhttp3/Response;",
            parameters = listOf("Lokhttp3/Interceptor\$Chain;")
        ).method)
    }
}
