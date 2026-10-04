package io.github.bakwudo.uyu.extension.danmaku;

import android.content.res.Configuration;
import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import android.graphics.Rect;

import java.util.WeakHashMap;

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

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, Integer> ORIGINAL_WIDTHS = new WeakHashMap<>();
    private static final WeakHashMap<View, Float> ORIGINAL_ALPHAS = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> SCHEDULED = new WeakHashMap<>();
    private static final long[] RETRIES_MS = {0L, 400L, 900L, 1800L, 3500L, 6000L};

    private LandscapeChatPatch() {
    }

    /** Apply the landscape chat controls after Twitch has finished building the theatre view. */
    public static void onActivityStarted(Activity activity) {
        if (activity == null) return;
        synchronized (SCHEDULED) {
            if (SCHEDULED.containsKey(activity)) return;
            SCHEDULED.put(activity, Boolean.TRUE);
        }
        for (long delay : RETRIES_MS) {
            MAIN.postDelayed(() -> {
                try { applyLandscapeControls(activity); }
                catch (Throwable ex) { Utils.logError("Landscape chat adjustment failed", ex); }
            }, delay);
        }
        MAIN.postDelayed(() -> {
            synchronized (SCHEDULED) { SCHEDULED.remove(activity); }
        }, RETRIES_MS[RETRIES_MS.length - 1] + 500L);
    }

    private static void applyLandscapeControls(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        View root = activity.getWindow().getDecorView();
        if (root == null) return;
        boolean landscape = root.getResources().getConfiguration().orientation
                == Configuration.ORIENTATION_LANDSCAPE;
        if (!landscape || (!Settings.LANDSCAPE_CHAT_SIZE_ENABLED.get()
                && !Settings.LANDSCAPE_CHAT_OPACITY_ENABLED.get())) {
            restoreLandscapeControls();
            return;
        }
        View chat = findChatPanel(root);
        if (chat == null) return;

        if (!ORIGINAL_WIDTHS.containsKey(chat)) {
            ViewGroup.LayoutParams lp = chat.getLayoutParams();
            if (lp != null) ORIGINAL_WIDTHS.put(chat, lp.width);
            ORIGINAL_ALPHAS.put(chat, chat.getAlpha());
        }

        if (Settings.LANDSCAPE_CHAT_SIZE_ENABLED.get()) {
            ViewGroup.LayoutParams lp = chat.getLayoutParams();
            if (lp != null && root.getWidth() > 0) {
                lp.width = Math.max(1, Math.round(root.getWidth()
                        * Settings.LANDSCAPE_CHAT_SIZE.get() / 100f));
                if (lp instanceof android.widget.LinearLayout.LayoutParams) {
                    ((android.widget.LinearLayout.LayoutParams) lp).weight = 0f;
                }
                chat.setLayoutParams(lp);
            }
        }
        if (Settings.LANDSCAPE_CHAT_OPACITY_ENABLED.get()) {
            chat.setAlpha(Math.max(0f, Math.min(1f,
                    Settings.LANDSCAPE_CHAT_OPACITY.get() / 100f)));
        }
    }

    private static void restoreLandscapeControls() {
        synchronized (ORIGINAL_WIDTHS) {
            for (View chat : ORIGINAL_WIDTHS.keySet()) {
                try {
                    Integer width = ORIGINAL_WIDTHS.get(chat);
                    ViewGroup.LayoutParams lp = chat.getLayoutParams();
                    if (width != null && lp != null) {
                        lp.width = width;
                        chat.setLayoutParams(lp);
                    }
                    Float alpha = ORIGINAL_ALPHAS.get(chat);
                    if (alpha != null) chat.setAlpha(alpha);
                } catch (Throwable ignored) {}
            }
            ORIGINAL_WIDTHS.clear();
            ORIGINAL_ALPHAS.clear();
        }
    }

    private static View findChatPanel(View root) {
        if (!(root instanceof ViewGroup) || root.getWidth() <= 0 || root.getHeight() <= 0) return null;
        Candidate best = new Candidate();
        collectCandidates((ViewGroup) root, root.getWidth(), root.getHeight(), best);
        return best.view;
    }

    private static void collectCandidates(ViewGroup group, int rootWidth, int rootHeight,
                                          Candidate best) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) continue;
            if (child instanceof ViewGroup) {
                Rect r = new Rect();
                child.getGlobalVisibleRect(r);
                if (r.width() >= rootWidth * 0.15f && r.width() <= rootWidth * 0.75f
                        && r.height() >= rootHeight * 0.35f
                        && r.right >= rootWidth * 0.80f
                        && containsChatSignal(child, 0)) {
                    float score = (r.right / (float) rootWidth) * 4f
                            + r.width() / (float) rootWidth
                            + r.height() / (float) rootHeight;
                    if (score > best.score) {
                        best.score = score;
                        best.view = child;
                    }
                }
                collectCandidates((ViewGroup) child, rootWidth, rootHeight, best);
            }
        }
    }

    private static boolean containsChatSignal(View view, int depth) {
        if (view == null || depth > 12) return false;
        String className = view.getClass().getName().toLowerCase(java.util.Locale.ROOT);
        if (className.contains("chat")) return true;
        if (containsChatWord(view.getContentDescription())) return true;
        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            if (containsChatWord(tv.getText()) || containsChatWord(tv.getHint())) return true;
        }
        if (view instanceof EditText && containsChatWord(((EditText) view).getHint())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (containsChatSignal(group.getChildAt(i), depth + 1)) return true;
            }
        }
        return false;
    }

    private static boolean containsChatWord(CharSequence value) {
        if (value == null) return false;
        String text = value.toString().toLowerCase(java.util.Locale.ROOT);
        return text.contains("send a message") || text.contains("send message")
                || text.equals("chat") || text.contains("chat message")
                || text.contains("chat input");
    }

    private static final class Candidate {
        View view;
        float score = -Float.MAX_VALUE;
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
