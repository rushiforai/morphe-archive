package app.kitan.patches.youtube.blockchannel

import app.kitan.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import app.kitan.patches.youtube.addon.registerAddOn
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/kitan/extension/youtube/ChannelBlocker;"

private const val EXTENSION_REGISTER_METHOD =
    "${EXTENSION_CLASS}->register()V"

private const val EXTENSION_FILTER_METHOD =
    "Lapp/kitan/extension/youtube/ChannelBlockerFilter;->isBlockedChannelBuffer([B)Z"

/**
 * Extension class of the base bundle that owns the runtime Litho filter.
 * Its `isFiltered` method is a stable public contract of Morphe Patches.
 */
private const val HOST_LITHO_FILTER_CLASS =
    "Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;"

/**
 * "Block channel" add-on patch.
 *
 * Architecture (no YouTube fingerprints for init/filter — these ride on the
 * stable contracts of the base Morphe bundle):
 *
 *  - Registers as a Morphe add-on via `AddOnManager.registerAddOns()`, so the
 *    extension initializes at runtime when the base bundle is present.
 *  - Injects a channel-blocklist check into the base bundle's runtime Litho
 *    filter (`LithoFilterPatch.isFiltered`), hiding blocked channels from
 *    search results and recommendations using the base bundle's entire
 *    empty-component machinery.
 *  - Hooks the flyout menu click handler: when the user taps YouTube's own
 *    "Not interested" / "Don't recommend channel" item, the channel is also
 *    persisted to the local blocklist (and unblocking is a second tap through
 *    the same menu, or by clearing the blocklist in the extension prefs).
 *
 * Requires the official Morphe patch bundle to be applied together with this
 * bundle (checked at patch time with a clear error message).
 */
@Suppress("unused")
val blockChannelPatch = patch(
    name = "Block channel",
    description = "Adds channel blocking to the video menu. Blocked channels " +
            "are hidden from search results and video recommendations. " +
            "Requires the Morphe official patch bundle."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    execute {
        // Hook the flyout menu item click handler. Tapping "Not interested" or
        // "Don't recommend channel" additionally persists the channel to the
        // blocklist. The call must not consume the click (always return false),
        // so YouTube's own action runs as usual.
        ContextualMenuItemBuilderOnClickFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS;->onFlyoutItemClick(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :continue_click
                return-void
                :continue_click
                nop
            """
        )
    }

    finalize {
        // The base bundle extension is merged while its patches execute,
        // so host class injections can only happen here.
        registerAddOn(EXTENSION_REGISTER_METHOD)

        // Prepend the channel blocklist check to the base bundle's runtime
        // Litho filter. Returning true from the injected call makes the base
        // bundle's empty-component machinery remove the component.
        val lithoFilterClass = mutableClassDefByOrNull(HOST_LITHO_FILTER_CLASS)
            ?: throw PatchException(
                "Could not find LithoFilterPatch of the Morphe extension. " +
                        "This add-on requires the official Morphe patches."
            )
        val isFiltered = lithoFilterClass.methods.firstOrNull { it.name == "isFiltered" }
            ?: throw PatchException(
                "LithoFilterPatch.isFiltered() was not found. " +
                        "The installed Morphe Patches version is not compatible with this add-on."
            )

        isFiltered.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :not_blocked_channel
                invoke-static { p1 }, $EXTENSION_FILTER_METHOD
                move-result v0
                if-eqz v0, :not_blocked_channel
                const/4 v0, 0x1
                return v0
                :not_blocked_channel
                nop
            """
        )
    }
}
