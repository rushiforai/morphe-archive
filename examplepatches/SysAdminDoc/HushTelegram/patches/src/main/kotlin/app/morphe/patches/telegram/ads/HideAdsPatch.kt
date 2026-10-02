/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide ads"

private const val ADS = "$EXTENSION_PACKAGE/ads/Ads;"

/** The request for a channel's sponsored messages. TL classes keep their names in every build. */
internal const val GET_SPONSORED_MESSAGES = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getSponsoredMessages;"

internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"

/**
 * The messages controller's `getSponsoredMessages(long)`: answers a chat's cached sponsored
 * messages, and asks the server for them when it has none. Found by what it builds and answers,
 * both kept names, rather than by its own name.
 */
internal object GetSponsoredMessagesFingerprint : Fingerprint(
    definingClass = MESSAGES_CONTROLLER,
    returnType = "Lorg/telegram/messenger/MessagesController\$SponsoredMessagesInfo;",
    parameters = listOf("J"),
    filters = listOf(newInstance(GET_SPONSORED_MESSAGES)),
)

/** `VideoAds.load()`: the video player's own sponsored messages request. */
internal object VideoAdsLoadFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/video/VideoAds;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(newInstance(GET_SPONSORED_MESSAGES)),
)

/** Global search's request for the sponsored accounts it puts above the results. */
internal const val GET_SPONSORED_PEERS = "Lorg/telegram/tgnet/TLRPC\$TL_contacts_getSponsoredPeers;"

/**
 * Global search's `(int, String)` query method. For a query of four or more characters it asks
 * for sponsored accounts, unless you have Premium and turned ads off. Its class is renamed in every
 * build, so it's found by the request it builds.
 */
internal object SearchSponsoredPeersFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;"),
    filters = listOf(newInstance(GET_SPONSORED_PEERS)),
)

/**
 * Keeps Telegram from asking for sponsored messages.
 *
 * Each request asks the extension first, and while the switch is on none of them goes out: a
 * channel answers as one with no sponsored messages, the video player as one with no ad, and
 * global search takes the way past its request that Telegram keeps for Premium users with ads
 * turned off. With nothing fetched, nothing is drawn, marked as seen or reported as clicked. The
 * places stand alone, so a build that moved one still has the others covered and the patch log
 * names the one it went without. Each successful hook also sets its own build flag, so settings
 * and diagnostic reports show which targets remain covered.
 *
 * Found by reading 12.10.6 (2026-09-30): both channel and player methods build
 * `TL_messages_getSponsoredMessages`, and nothing else in the app does. Search ads followed on
 * 2026-10-01, after a signed-in phone showed an Ad row above the results for "news" and "music"
 * and Telegram's own request log showed `contacts.getSponsoredPeers` and then
 * `messages.viewSponsoredMessage` going out for it.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the sponsored messages in channels, the sponsored accounts in search and the ads in " +
        "Telegram's video player. Telegram never asks for them, so none are counted as seen.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideAds")
        requireStatusMethod("channelAds")
        requireStatusMethod("videoAds")
        requireStatusMethod("searchAds")

        handleTargets(PATCH, "sponsored message requests", AdRequest.entries) { request ->
            when (request) {
                AdRequest.CHANNEL -> GetSponsoredMessagesFingerprint.methodOrNull.let { method ->
                    if (method == null) "no method of the messages controller builds $GET_SPONSORED_MESSAGES for a chat"
                    else {
                        method.returnEarlyWhen(PATCH, "$ADS->skipSponsoredMessages()Z", "const/4 v0, 0x0\nreturn-object v0")
                        enableCapability("channelAds")
                        null
                    }
                }
                AdRequest.VIDEO -> VideoAdsLoadFingerprint.methodOrNull.let { method ->
                    if (method == null) "VideoAds has no load() that builds $GET_SPONSORED_MESSAGES"
                    else {
                        method.returnEarlyWhen(PATCH, "$ADS->skipVideoAds()Z", "return-void")
                        enableCapability("videoAds")
                        null
                    }
                }
                AdRequest.SEARCH -> SearchSponsoredPeersFingerprint.methodOrNull.let { method ->
                    if (method == null) "no search method builds $GET_SPONSORED_PEERS"
                    else method.skipSearchAdsWhen("$ADS->skipSearchAds()Z").also { missing ->
                        if (missing == null) enableCapability("searchAds")
                    }
                }
            }
        }

        enableStatus("hideAds")
    }
}

/** The places Telegram asks for sponsored messages. */
private enum class AdRequest { CHANNEL, VIDEO, SEARCH }

/**
 * Puts [hook] in front of the `new-instance` of `contacts.getSponsoredPeers`. Telegram only
 * branches to that instruction: right above it sits the `goto` a Premium user with ads turned off
 * takes past the request. On true the hook jumps to that `goto`, so search skips the request
 * exactly as Telegram does for them. The code goes in under the instruction's own label, so both
 * branches that led to the request now reach the hook first.
 *
 * @return why the method couldn't be hooked, or null once it has been
 */
private fun MutableMethod.skipSearchAdsWhen(hook: String): String? {
    val request = indexOfFirstInstruction {
        opcode == Opcode.NEW_INSTANCE && (this as ReferenceInstruction).reference.toString() == GET_SPONSORED_PEERS
    }
    if (request < 1) return "search builds $GET_SPONSORED_PEERS first thing, with no way past it"
    val send = indexOfFirstInstruction(request) {
        opcode == Opcode.INVOKE_VIRTUAL &&
            ((this as ReferenceInstruction).reference as? MethodReference)?.let {
                it.definingClass == "Lorg/telegram/tgnet/ConnectionsManager;" && it.name == "sendRequest"
            } == true
    }
    val skip = request - 1
    val flow = ControlFlow.of(this)
    val past = if (getInstruction(skip).opcode in GOTOS) flow.normal[skip].singleOrNull() else null
    if (send < 0 || past == null || past <= send) {
        return "search builds $GET_SPONSORED_PEERS without Telegram's own way past the request just above it"
    }
    val answer = freeLocalsAt(PATCH, request, 1, targets = listOf(skip), highest = 255).single()
    addInstructionsAtControlFlowLabel(
        request,
        """
            invoke-static {}, $hook
            move-result v$answer
            if-nez v$answer, :hush_skip
        """,
        ExternalLabel("hush_skip", getInstruction(skip)),
    )
    return null
}

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
