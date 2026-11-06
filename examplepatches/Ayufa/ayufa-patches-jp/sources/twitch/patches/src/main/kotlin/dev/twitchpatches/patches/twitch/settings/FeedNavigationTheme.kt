package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

private object StoriesFeedBundleFingerprint : Fingerprint(
    name = "createBundle",
    strings = listOf(
        string("DiscoveryFeedPage"),
        string("ShowStoriesShelf"),
    ),
)

private object StoriesFeedDestinationFingerprint : Fingerprint(
    classFingerprint = StoriesFeedBundleFingerprint,
    name = "shouldForceDarkMode",
    parameters = emptyList(),
    returnType = "Z",
)

internal fun BytecodePatchContext.restoreFeedNavigationTheme() {
    restoreNativeFeedTheme()
    val host = "Ltv/twitch/android/feature/discovery/feed/rn/bridge/TwitchRNHostNavigationModule;"
    val chrome = mutableClassDefBy(host).methods.filter {
        it.name == "setFeedChromeDark" && it.isInstance(listOf("Z"), "V") &&
            it.references().filterIsInstance<MethodReference>().any { call ->
                call.definingClass == "Landroid/app/Activity;" && call.name == "runOnUiThread" &&
                    call.parameterTypes == listOf("Ljava/lang/Runnable;") && call.returnType == "V"
            }
    }.uniqueHook("feed native chrome theme")
    chrome.addInstruction(0, "const/4 p1, 0x0")
    val navResolver = classDefByOrNull($$"Ltv/twitch/android/feature/discovery/feed/rn/feed/DiscoveryFeedRNFragment$NavResolver;")
        ?: error($$"Feed theme: DiscoveryFeedRNFragment$NavResolver not found.")
    val navPolicy = navResolver.methods.filter {
        it.name == "shouldForceDarkMode" && it.isInstance(emptyList(), "Z")
    }.uniqueHook("feed theme navigation policy")
    val storiesPolicy = StoriesFeedDestinationFingerprint.originalMethod
    val destinations = listOf(navPolicy, storiesPolicy)
    destinations.forEach { original ->
        val code = original.code()
        val returns = code.withIndex().filter { it.value.opcode == Opcode.RETURN }
        require(returns.isNotEmpty()) { "Feed theme: navigation result missing." }
        val method = mutableClassDefBy(original.definingClass).methods.single { it.reference == original.reference }
        returns.forEach { (index, instruction) ->
            val constant = code.getOrNull(index - 1)
            require(constant?.opcode == Opcode.CONST_4 && (constant as? WideLiteralInstruction)?.wideLiteral == 1L &&
                (constant as? OneRegisterInstruction)?.registerA == (instruction as OneRegisterInstruction).registerA) {
                "Feed theme: forced-dark result contract changed."
            }
            method.replaceInstruction(index - 1, "const/4 v${instruction.registerA}, 0x0")
        }
    }
}
