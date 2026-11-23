package app.noam.patches.chesscom.discord

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val CALLBACK_ACTIVITY = "app.noam.extension.chesscom.discord.DiscordCallbackActivity"
private const val CLIENT_ID_META_DATA = "morphe_discord_client_id"

/**
 * The bundle's own Discord application. The patch writes the id into the callback activity and the
 * extension reads it back from there, so the id is written down once.
 *
 * It has to be an application with the Social SDK enabled: its mobile redirect is
 * "discord-<id>:/authorize/callback", and only such an application may ask for
 * sdk.social_layer_presence, the scope that lets an OAuth token set the activity.
 */
private const val DISCORD_CLIENT_ID = "1573433416093794486"

private val discordRedirectResourcePatch = patch(
    description = "Adds the screen Discord's browser login comes back to.",
) {
    execute {
        if (DISCORD_CLIENT_ID.isEmpty()) return@execute

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")
            val exists = document.getElementsByTagName("activity").let { activities ->
                (0 until activities.length).any {
                    (activities.item(it) as Element).getAttributeNS(ANDROID_NAMESPACE, "name") ==
                        CALLBACK_ACTIVITY
                }
            }
            if (exists) return@use

            application.appendChild(
                document.createElement("activity").apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:name", CALLBACK_ACTIVITY)
                    // Discord's browser login has to reach this screen from outside the app.
                    setAttributeNS(ANDROID_NAMESPACE, "android:exported", "true")
                    setAttributeNS(ANDROID_NAMESPACE, "android:noHistory", "true")
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:theme",
                        "@android:style/Theme.Translucent.NoTitleBar",
                    )
                    appendChild(
                        document.createElement("intent-filter").apply {
                            appendChild(
                                document.createElement("action").apply {
                                    setAttributeNS(
                                        ANDROID_NAMESPACE,
                                        "android:name",
                                        "android.intent.action.VIEW",
                                    )
                                },
                            )
                            appendChild(
                                document.createElement("category").apply {
                                    setAttributeNS(
                                        ANDROID_NAMESPACE,
                                        "android:name",
                                        "android.intent.category.DEFAULT",
                                    )
                                },
                            )
                            appendChild(
                                document.createElement("category").apply {
                                    setAttributeNS(
                                        ANDROID_NAMESPACE,
                                        "android:name",
                                        "android.intent.category.BROWSABLE",
                                    )
                                },
                            )
                            appendChild(
                                document.createElement("data").apply {
                                    setAttributeNS(
                                        ANDROID_NAMESPACE,
                                        "android:scheme",
                                        "discord-$DISCORD_CLIENT_ID",
                                    )
                                },
                            )
                        },
                    )
                    appendChild(
                        document.createElement("meta-data").apply {
                            setAttributeNS(ANDROID_NAMESPACE, "android:name", CLIENT_ID_META_DATA)
                            setAttributeNS(ANDROID_NAMESPACE, "android:value", DISCORD_CLIENT_ID)
                        },
                    )
                },
            )
        }
    }
}

/**
 * Discord Rich Presence: the activity comes from the phone alone. Discord's own OAuth page connects
 * the account in the browser, and the extension keeps a gateway session with the token it gets.
 */
@Suppress("unused")
val discordRpcPatch = bytecodePatch(
    name = "Discord Rich Presence",
    description = "Shows what you are doing on chess.com in Discord, from this phone alone: a game, " +
        "a review or a puzzle, and how long you have been on. The account is connected once in " +
        "Discord's own browser page, so no password and no computer are involved. Discord shows the " +
        "activity under this bundle's Discord application name and keeps the status picked in the " +
        "settings while the phone is connected. Runs by default and can be switched off in Quwi's " +
        "Patches. Connecting a Discord account does not work with root mounting.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, discordRedirectResourcePatch)

    execute {
        markFeaturePatched("discordPatched")
    }
}
