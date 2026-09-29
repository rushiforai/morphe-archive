package io.github.bakwudo.uyu.extension.danmaku;

import android.content.res.Configuration;
import android.view.View;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * Keeps Twitch's landscape chat off and hides its chat mode button, so the stream fills the
 * screen in landscape. Twitch's own saved chat mode is not changed, so turning the setting off
 * brings back the mode the user chose before.
 */
@SuppressWarnings("unused")
public final class LandscapeChatPatch {
    /** Twitch's preference for the landscape chat mode, and its value for no chat. */
    private static final String LANDSCAPE_CHAT_MODE_KEY = "pref_landscape_chat_mode";
    private static final String CHAT_HIDDEN = "Hidden";
    /**
     * Until this is set, Twitch switches a hidden landscape chat to the chat overlay once, to
     * introduce the overlay, and saves that as the user's choice.
     */
    private static final String ONE_CHAT_INTRODUCED_KEY = "pref_onechat_education_dialog_shown";

    private LandscapeChatPatch() {
    }

    /**
     * Injection point: start of Twitch's preference getters for string values.
     *
     * @param key The preference key.
     * @return The value to return instead of the stored one, or null to read it as usual.
     */
    public static String overridePreference(String key) {
        if (!LANDSCAPE_CHAT_MODE_KEY.equals(key)) return null;
        return Settings.DANMAKU_HIDE_LANDSCAPE_CHAT.get() ? CHAT_HIDDEN : null;
    }

    /**
     * Injection point: end of Twitch's preference getter for boolean values.
     *
     * @param key   The preference key.
     * @param value The stored value.
     * @return The value to return.
     */
    public static boolean overrideBooleanPreference(String key, boolean value) {
        if (ONE_CHAT_INTRODUCED_KEY.equals(key) && Settings.DANMAKU_HIDE_LANDSCAPE_CHAT.get()) return true;
        return value;
    }

    /**
     * Injection point: end of the constructor of the theatre's chat view model. When this returns
     * true, the view model is changed to show no chat in landscape: the chat mode is set to
     * hidden, and the flags that open the chat beside the video (chat overlay, chat tray,
     * community highlights, extensions, chat input) are cleared.
     */
    public static boolean isLandscapeChatHidden() {
        return Settings.DANMAKU_HIDE_LANDSCAPE_CHAT.get();
    }

    /**
     * Injection point: after the player's bottom controls are rendered, which sets the chat mode
     * button's visibility.
     *
     * @param bottomControlsViewDelegate The bottom controls' view delegate.
     */
    public static void onBottomControlsRendered(Object bottomControlsViewDelegate) {
        try {
            if (!Settings.DANMAKU_HIDE_LANDSCAPE_CHAT.get()) return;
            View root = ViewDelegates.rootView(bottomControlsViewDelegate);
            if (root == null) return;
            if (root.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) {
                return;
            }
            View button = root.findViewById(Utils.getResourceId(root.getContext(), "chat_mode_button", "id"));
            if (button != null) button.setVisibility(View.GONE);
        } catch (Exception ex) {
            Utils.logError("Failed to hide the chat mode button", ex);
        }
    }
}
