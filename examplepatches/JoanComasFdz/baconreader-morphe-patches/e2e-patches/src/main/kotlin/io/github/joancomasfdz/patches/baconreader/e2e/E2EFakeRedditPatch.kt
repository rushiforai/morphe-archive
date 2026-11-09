// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.e2e

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val DEFAULT_BASE_URL = "http://127.0.0.1:5080"

private val REDDIT_ORIGINS = listOf(
    "https://www.reddit.com",
    "https://oauth.reddit.com",
    "https://api.reddit.com",
    "https://ssl.reddit.com",
    "https://reddit.com",
    "https://m.reddit.com",
    "http://www.reddit.com",
    "http://reddit.com",
)

// The app knows a gallery by Reddit's own address, https://www.reddit.com/gallery/<id>, which the fake's gallery posts
// link to as Reddit's do. Moved, "Fix Reddit links" would not take them for Reddit links, as it does on Reddit.
private const val REDDIT_GALLERY = "https://www.reddit.com/gallery"

// www.redditstatic.com: the Snoomoji emotes, whose GIF "Embed comment images" finds from an emote's name.
// i.imgflip.com: the meme templates "Fix meme templates" shows.
private val MEDIA_HOSTS = listOf(
    "i.redd.it",
    "preview.redd.it",
    "v.redd.it",
    "i.imgur.com",
    "i.ytimg.com",
    "pbs.twimg.com",
    "www.redditstatic.com",
    "i.imgflip.com",
)

// Imgur's API, which "Fix Imgur API" calls instead of BaconReader's RapidAPI proxy.
private const val IMGUR_API = "https://api.imgur.com/"

// RedGIFs' API, which BaconReader calls with the temporary tokens "Fix Redgifs API" fetches.
private const val REDGIFS_API = "https://api.redgifs.com/"
private const val REDGIFS_API_HOST = "api.redgifs.com"
private const val REDGIFS_OAUTH_PATH = "/v2/oauth/client"
private const val REDGIFS_PATH = "/_redgifs"

// YouTube's oEmbed endpoint, where "Embed comment images" asks for a video's title. Only this
// address moves: comments and posts link YouTube at its own, which the patches recognize.
private const val YOUTUBE_OEMBED = "https://www.youtube.com/oembed"

// X's embed service and Bluesky's public API, where "Embed comment images" asks for a post. X's
// photos move with the media hosts: the patch asks for a small one only at X's own address.
private const val X_SYNDICATION = "https://cdn.syndication.twimg.com/"
private const val BLUESKY_API = "https://public.api.bsky.app/"

// Each full URL prefix and what it becomes; paths after it are kept.
private fun redditPrefixes(baseUrl: String): List<Pair<String, String>> =
    REDDIT_ORIGINS.map { it to baseUrl } +
        MEDIA_HOSTS.map { "https://$it/" to "$baseUrl/_media/$it/" } +
        ("https://cf-baconreader.onelouder.com/" to "$baseUrl/_onelouder/") +
        (IMGUR_API to "$baseUrl/_imgur/") +
        (REDGIFS_API to "$baseUrl$REDGIFS_PATH/") +
        (YOUTUBE_OEMBED to "$baseUrl/_youtube/oembed") +
        (X_SYNDICATION to "$baseUrl/_x/") +
        (BLUESKY_API to "$baseUrl/_bluesky/")

// Where the fake Reddit serves what v.redd.it serves, and its media.
private const val MOVED_VIDEO_PATH = "/_media/v.redd.it/"
private const val MEDIA_PATH = "/_media/"

// Whether a URL is a v.redd.it video: its host is v.redd.it.
internal object RedditVideoIsValidFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit/RedditVideo;",
    name = "isValid",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

// The URL a video is saved from: the video's URL, made https.
internal object SaveImageGetVideoFilenameFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imageutils/SaveImage;",
    name = "getVideoFilename",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

// Reddit detects automation, rate-limits logins and changes its content, so the e2e tests talk to
// a fake Reddit server in the test process instead, which the phone reaches through
// `adb reverse`. It answers the third-party services the patches fetch from too (Imgur, RedGIFs,
// YouTube, X, Bluesky, Reddit's emotes, Imgflip). Only full URL prefixes move: BaconReader
// recognizes Reddit and Imgur links in posts by bare domains (reddit.com, v.redd.it, imgur.com),
// and those stay.
@Suppress("unused")
val e2eFakeRedditPatch = bytecodePatch(
    name = "E2E fake Reddit",
    description = "Test only: points BaconReader at a fake Reddit server instead of Reddit, " +
        "and starts it logged in when the fake hands it a login.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    val baseUrlOption = stringOption(
        key = "baseUrl",
        default = DEFAULT_BASE_URL,
        title = "Base URL",
        description = "The fake Reddit server's URL, such as $DEFAULT_BASE_URL.",
        required = true,
    )

    // The fake's media come moved like the app's own URLs, over plain HTTP, and two checks assume
    // Reddit's: a post is a Reddit video only by the host v.redd.it, and a video is saved from an
    // https URL.
    execute {
        addLogInAtStart(baseUrlOption.value!!.trimEnd('/'))

        // isValid(url): a URL under <baseUrl>/_media/v.redd.it/ is a Reddit video too. p0 is the URL.
        RedditVideoIsValidFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    if-eqz p0, :app
                    const-string v0, "$MOVED_VIDEO_PATH"
                    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                    move-result v0
                    if-eqz v0, :app
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("app", getInstruction(0)),
            )
        }

        // getVideoFilename(url) ends with: if url starts with "http:", url = url.replace("http:",
        // "https:"). The fake's media skip the replace: the fake answers plain HTTP.
        SaveImageGetVideoFilenameFingerprint.method.apply {
            val all = instructions.toList()
            val https = all.indexOfFirst {
                it.opcode == Opcode.CONST_STRING && it.getReference<StringReference>()?.string == "https:"
            }
            val end = all.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            if (https < 0 || end < https) throw PatchException("getVideoFilename has no \"https:\" before its return")
            val free = getInstruction<OneRegisterInstruction>(https).registerA
            addInstructionsWithLabels(
                https,
                """
                    const-string v$free, "$MEDIA_PATH"
                    invoke-virtual {p0, v$free}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                    move-result v$free
                    if-nez v$free, :keep
                """,
                ExternalLabel("keep", getInstruction(end)),
            )
        }
    }

    // Patches execute in name order, so "Spoof client" (which moves ssl.reddit.com to
    // www.reddit.com) and the extensions merged by later patches come after this one. Finalize
    // blocks run once every patch has executed.
    finalize {
        val baseUrl = baseUrlOption.value!!.trimEnd('/')
        val prefixes = redditPrefixes(baseUrl)

        prefixes.forEach { (old, new) ->
            string(old, StringComparisonType.CONTAINS).matchAllMethodIndicesForEach(false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                val value = getInstruction(index).getReference<StringReference>()!!.string
                if (value.startsWith(REDDIT_GALLERY)) return@matchAllMethodIndicesForEach
                val moved = ImmutableStringReference(value.replace(old, new))
                replaceInstruction(index, BuilderInstruction21c(Opcode.CONST_STRING, register, moved))
            }
        }

        // "Fix Redgifs API" authenticates only requests to RedGIFs' API host, and answers its old
        // OAuth path itself: moved, both checks name the fake's host and path.
        listOf(
            REDGIFS_API_HOST to java.net.URI(baseUrl).host,
            REDGIFS_OAUTH_PATH to REDGIFS_PATH + REDGIFS_OAUTH_PATH,
        ).forEach { (old, new) ->
            string(old, StringComparisonType.EQUALS).matchAllMethodIndicesForEach(false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(index, BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(new)))
            }
        }

        // Constants.REDDIT_DOMAIN and REDDIT_GALLERY_DOMAIN are read at run time, not inlined.
        val classesWithUrlFields = mutableListOf<String>()
        classDefForEach { classDef ->
            val hasUrlField = classDef.staticFields.any { field ->
                val value = (field.initialValue as? StringEncodedValue)?.value
                value != null && prefixes.any { (old, _) -> old in value }
            }
            if (hasUrlField) classesWithUrlFields += classDef.type
        }
        classesWithUrlFields.forEach { type ->
            mutableClassDefBy(type).staticFields.forEach { field ->
                val value = (field.initialValue as? StringEncodedValue)?.value ?: return@forEach
                if (value.startsWith(REDDIT_GALLERY)) return@forEach
                val moved = prefixes.fold(value) { url, (old, new) -> url.replace(old, new) }
                if (moved != value) {
                    field.setInitialValue(MutableStringEncodedValue(ImmutableStringEncodedValue(moved)))
                }
            }
        }
    }
}
