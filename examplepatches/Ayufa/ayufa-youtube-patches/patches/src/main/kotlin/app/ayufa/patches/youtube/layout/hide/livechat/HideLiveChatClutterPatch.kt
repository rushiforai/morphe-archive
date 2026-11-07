package app.ayufa.patches.youtube.layout.hide.livechat

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ayufa.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE_MODERN
import app.ayufa.patches.youtube.shared.declareAyufaSettingsSwitches

private const val EXTENSION_CLASS = "Lapp/ayufa/extension/youtube/LiveChatClutterHider;"

private const val KEY_HIDE_PINNED_BANNER = "ayufa_hide_live_chat_pinned_banner"
private const val KEY_HIDE_POLL = "ayufa_hide_live_chat_poll"

private val hidePinnedBannerOption = booleanOption(
    key = "hideLiveChatPinnedBanner",
    default = true,
    title = "Hide pinned message banner",
    description = "Hides the pinned comment (banner) shown above the live chat."
)

private val hidePollsOption = booleanOption(
    key = "hideLiveChatPolls",
    default = true,
    title = "Hide live chat polls",
    description = "Hides poll (questionnaire) cards shown in the live chat."
)

/**
 * Declares the features as switches on the dedicated "Ayufa patch
 * settings" screen in Morphe settings. See [declareAyufaSettingsSwitches].
 */
private val hideLiveChatClutterSettingsPatch = resourcePatch {
    execute {
        declareAyufaSettingsSwitches(
            keys = listOf(KEY_HIDE_PINNED_BANNER, KEY_HIDE_POLL),
            enStrings = mapOf(
                "${KEY_HIDE_PINNED_BANNER}_title" to "Hide pinned message banner",
                "${KEY_HIDE_PINNED_BANNER}_summary" to
                    "Hides the pinned comment shown above the live chat. " +
                    "Takes effect the next time a chat is opened.",
                "${KEY_HIDE_POLL}_title" to "Hide live chat polls",
                "${KEY_HIDE_POLL}_summary" to
                    "Hides poll cards shown in the live chat. " +
                    "Takes effect the next time a chat is opened."
            ),
            jaStrings = mapOf(
                "${KEY_HIDE_PINNED_BANNER}_title" to "固定メッセージ（バナー）を隠す",
                "${KEY_HIDE_PINNED_BANNER}_summary" to
                    "ライブチャットの上に表示される固定コメントを非表示にします。" +
                    "次にチャットを開いたときから反映されます。",
                "${KEY_HIDE_POLL}_title" to "アンケートを隠す",
                "${KEY_HIDE_POLL}_summary" to
                    "ライブチャットに表示されるアンケートカードを非表示にします。" +
                    "次にチャットを開いたときから反映されます。"
            )
        )
    }
}

@Suppress("unused")
val hideLiveChatClutterPatch = bytecodePatch(
    name = "Hide live chat clutter",
    description = "Hides the pinned message banner and poll cards in live chat. " +
        "Each can be toggled in Morphe settings (Ayufa patch settings) without re-patching. " +
        "For YouTube 21.30.216.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MODERN)

    dependsOn(hideLiveChatClutterSettingsPatch)

    extendWith("extensions/youtube.mpe")

    hidePinnedBannerOption()
    hidePollsOption()

    execute {
        val hidePinnedBanner by hidePinnedBannerOption
        val hidePolls by hidePollsOption

        var hookCount = 0

        if (hidePinnedBanner == true) {
            // Hook the end of the banner presenter constructor. The extension
            // receives the live chat root view and keeps the banner container
            // inside it hidden for the whole chat session.
            // matchAll throws when nothing matches; treat that as zero hooks.
            val matches = runCatching { LiveChatBannerPresenterFingerprint.matchAll() }
                .getOrDefault(emptyList())
            for (match in matches) {
                val register = match.method.viewParameterRegister() ?: continue
                match.method.insertBeforeReturn(
                    invokeStaticCall(register, "$EXTENSION_CLASS->onBannerRootView(Landroid/view/View;)V")
                )
                hookCount++
            }
        }

        if (hidePolls == true) {
            // The fingerprint matches a poll presenter getter. Hook the
            // constructors of every matched presenter's class. The extension
            // receives the live chat root view and hides only the poll
            // container inside it.
            val hookedClasses = mutableSetOf<String>()
            val matches = runCatching { LiveChatPollPresenterFingerprint.matchAll() }
                .getOrDefault(emptyList())
            for (match in matches) {
                val classDef = match.classDef
                if (!hookedClasses.add(classDef.type)) {
                    continue
                }
                for (method in classDef.methods) {
                    if (method.name == "<init>") {
                        val register = method.viewParameterRegister() ?: continue
                        method.insertBeforeReturn(
                            invokeStaticCall(register, "$EXTENSION_CLASS->onPollRootView(Landroid/view/View;)V")
                        )
                        hookCount++
                    }
                }
            }
        }

        if (hookCount == 0) {
            throw PatchException(
                "Hide live chat clutter: no target was found. " +
                    "This patch was verified only for YouTube 21.30.216."
            )
        }
    }
}

/**
 * Inserts the given instruction right before the method's final return
 * instruction.
 */
private fun MutableMethod.insertBeforeReturn(instruction: String) {
    val index = implementation?.instructions?.size?.minus(1)
        ?: throw PatchException("Method has no instructions: $this")
    addInstruction(index, instruction)
}

/**
 * Builds an invoke-static instruction passing a single parameter register.
 * Always uses the /range form: in methods with many local registers, even
 * a low p-register maps to a v-register above v15, which the plain form
 * cannot encode.
 */
private fun invokeStaticCall(register: Int, methodDescriptor: String): String =
    "invoke-static/range { p$register .. p$register }, $methodDescriptor"

/**
 * Returns the parameter register (pN) of this method's
 * `android.view.View` parameter, or null if it has none.
 * Register p0 is `this`; long/double parameters take two registers.
 */
private fun MutableMethod.viewParameterRegister(): Int? {
    var register = 1
    for (type in parameterTypes) {
        if (type == "Landroid/view/View;") {
            return register
        }
        register += if (type == "J" || type == "D") 2 else 1
    }
    return null
}
