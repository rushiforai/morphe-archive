package app.kitan.extension.youtube;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Channel blocker add-on.
 *
 * Registered at runtime by the add-on manager of the base Morphe bundle
 * (the patch adds a call to {@link #register()} to
 * {@code AddOnManager.registerAddOns()}).
 *
 * Features:
 *  - {@link #onFlyoutItemClick(Object)}: when the user taps YouTube's own
 *    "Not interested" / "Don't recommend channel" flyout item, the channel is
 *    persisted to the local blocklist (second tap unblocks).
 *  - {@link ChannelBlockerFilter}: feeds/search components of blocked channels
 *    are filtered out by the base bundle's runtime Litho filter.
 *
 * Host classes of the base bundle are accessed by reflection only, because
 * this bundle cannot compile against the base bundle extension.
 */
@SuppressWarnings("unused")
public final class ChannelBlocker {

    private static final String PREFS_FILE = "kitan_channel_blocker";
    private static final String PREF_BLOCKED_CHANNELS = "blocked_channels";

    private static SharedPreferences prefs;
    private static volatile Set<String> blockedChannels;

    private ChannelBlocker() {
    }

    // region Add-on registration

    /**
     * Called by the add-on manager of the base Morphe bundle, early in the
     * player lifecycle, before feeds are browsed.
     */
    public static void register() {
        if (prefs != null) {
            return;
        }
        Context context = Utils.getContext();
        if (context == null) {
            return;
        }
        prefs = context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE);
        blockedChannels = Collections.synchronizedSet(
                new HashSet<>(prefs.getStringSet(PREF_BLOCKED_CHANNELS, Collections.emptySet())));
        Logger.printDebug(() -> "Channel blocker registered with "
                + blockedChannels.size() + " blocked channels");
    }

    // endregion

    // region Blocklist

    public static boolean isChannelBlocked(String channelId) {
        Set<String> blocked = blockedChannels;
        return blocked != null && channelId != null && blocked.contains(channelId);
    }

    public static boolean blockChannel(String channelId) {
        Set<String> blocked = blockedChannels;
        if (blocked == null || channelId == null || channelId.isEmpty()) {
            return false;
        }
        blocked.add(channelId);
        persist();
        return true;
    }

    public static boolean unblockChannel(String channelId) {
        Set<String> blocked = blockedChannels;
        if (blocked == null || channelId == null) {
            return false;
        }
        boolean removed = blocked.remove(channelId);
        if (removed) {
            persist();
        }
        return removed;
    }

    private static void persist() {
        if (prefs == null) {
            return;
        }
        // SharedPreferences cannot store the live set; hand it a snapshot.
        prefs.edit().putStringSet(PREF_BLOCKED_CHANNELS, new HashSet<>(blockedChannels)).apply();
    }

    // endregion

    /**
     * Snapshot of the blocked channel set for the hot filter path, or null
     * when the add-on is not initialized.
     */
    public static Set<String> blockedChannelsSnapshotForFilter() {
        return blockedChannels;
    }

    // endregion

    // region Flyout menu button

    /**
     * Called from the injected contextual flyout menu click handler.
     *
     * Resolves the channel of the flyout's video and toggles the block.
     * Always returns false, so YouTube's own "Not interested" /
     * "Don't recommend channel" action also runs.
     *
     * @param clickHandlerInstance the click handler instance (unused for now)
     * @return false (never consumes the click)
     */
    public static boolean onFlyoutItemClick(Object clickHandlerInstance) {
        try {
            if (blockedChannels == null) {
                return false; // Add-on not initialized yet (should not happen).
            }

            String channelId = resolveCurrentChannelId();
            if (channelId == null) {
                return false;
            }

            if (isChannelBlocked(channelId)) {
                unblockChannel(channelId);
                showToast("Channel unblocked");
            } else {
                blockChannel(channelId);
                showToast("Channel blocked from search & recommendations");
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "onFlyoutItemClick failure", ex);
        }
        return false;
    }

    /**
     * Resolves the channel id of the current flyout context.
     *
     * Uses the base bundle's flyout channel request when a flyout is open
     * (works for feed items), and falls back to the channel of the currently
     * playing video (player flyout). Both are accessed by reflection, since
     * this bundle cannot compile against the base bundle extension.
     */
    private static String resolveCurrentChannelId() {
        // Preferred: the channel request of the open flyout menu.
        try {
            Class<?> flyoutUtils = Class.forName(
                    "app.morphe.extension.youtube.patches.utils.FlyoutUtils");
            Object request = flyoutUtils.getMethod("getFlyoutChannelIdRequest")
                    .invoke(null);
            if (request != null) {
                Object channelInfo = request.getClass()
                        .getMethod("getChannelInfo").invoke(request);
                String channelId = pairSecond(channelInfo);
                if (channelId != null && !channelId.isEmpty()) {
                    return channelId;
                }
            }
        } catch (Exception ex) {
            // Flyout hooks of the base bundle are not active in this setup.
            Logger.printDebug(() -> "Flyout channel request not available");
        }

        // Fallback: channel of the currently playing video (player flyout).
        String current = callStaticString(
                "app.morphe.extension.youtube.patches.VideoInformation",
                "getChannelId", new Class[0]);
        if (current != null && !current.isEmpty()) {
            return current;
        }
        return null;
    }

    /**
     * Reads the 'second' field of an android.util.Pair.
     */
    private static String pairSecond(Object pair) {
        if (pair == null) {
            return null;
        }
        try {
            Field second = pair.getClass().getField("second");
            Object value = second.get(pair);
            return value instanceof String ? (String) value : null;
        } catch (Exception ex) {
            return null;
        }
    }

    private static String callStaticString(String className, String methodName,
                                           Class<?>[] parameterTypes, Object... args) {
        try {
            Class<?> clazz = Class.forName(className);
            java.lang.reflect.Method method = clazz.getDeclaredMethod(methodName,
                    parameterTypes != null ? parameterTypes : new Class[0]);
            method.setAccessible(true);
            Object result = method.invoke(null, args);
            return result instanceof String ? (String) result : null;
        } catch (Exception ex) {
            // Host class or method not present in this base bundle version.
            return null;
        }
    }

    // endregion

    // region UI helpers

    private static void showToast(String message) {
        Activity activity = Utils.getActivity();
        if (activity != null) {
            activity.runOnUiThread(() ->
                    Toast.makeText(activity, message, Toast.LENGTH_SHORT).show());
        }
    }

    // endregion
}
