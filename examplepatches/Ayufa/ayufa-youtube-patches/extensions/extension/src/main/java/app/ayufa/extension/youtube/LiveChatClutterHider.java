/*
 * Copyright 2026 Ayufa.
 * Part of Ayufa Patches (GPL-3.0).
 */

package app.ayufa.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

/**
 * Hides clutter shown in the live chat: the pinned message banner and
 * poll cards.
 *
 * <p>The "Hide live chat clutter" patch calls the two entry points here at
 * the end of the banner / poll presenter constructors (YouTube 21.30.216).
 * Both presenters are created with the live chat root view, so each entry
 * point locates its own container inside that root and hides only that
 * container. Hiding the root itself would hide the whole chat, so the
 * root is never touched.
 *
 * <p>Each feature can be toggled in Morphe settings, on the dedicated
 * "Ayufa patch settings" screen.
 * The toggles are declared by the patch as add-on preferences and stored
 * by the Morphe settings UI in the "morphe_prefs" shared preferences,
 * which is read here on every call. If the settings were never opened,
 * both features default to on. A toggle change takes effect the next
 * time a chat is opened.
 *
 * <p>Presenters re-show their containers when new content arrives (a
 * message gets pinned, a poll starts), so a global layout listener
 * re-applies GONE after every layout pass in which a hidden container
 * became visible again. The listener removes itself once the feature
 * has been turned off in the settings.
 */
@SuppressWarnings("unused")
public final class LiveChatClutterHider {

    private static final String MORPHE_PREFS_NAME = "morphe_prefs";
    private static final String KEY_HIDE_PINNED_BANNER = "ayufa_hide_live_chat_pinned_banner";
    private static final String KEY_HIDE_POLL = "ayufa_hide_live_chat_poll";

    private LiveChatClutterHider() {
    }

    /**
     * Injection point. Called with the live chat root view that the banner
     * presenter was created with.
     */
    public static void onBannerRootView(View chatRoot) {
        try {
            if (chatRoot == null || !isEnabled(chatRoot.getContext(), KEY_HIDE_PINNED_BANNER)) {
                return;
            }
            View banner = findByIdName(chatRoot, "live_chat_banner");
            if (banner == null) {
                return;
            }
            keepHidden(banner, KEY_HIDE_PINNED_BANNER);
            // Also hide the dedicated wrapper container so no empty strip
            // is left above the chat.
            ViewParent parent = banner.getParent();
            if (parent instanceof View) {
                View parentView = (View) parent;
                if (parentView.getId() == idForName(chatRoot, "live_chat_banner_container")
                        && parentView != chatRoot) {
                    keepHidden(parentView, KEY_HIDE_PINNED_BANNER);
                }
            }
        } catch (Throwable ignored) {
            // Never break the chat because of this feature.
        }
    }

    /**
     * Injection point. Called with the live chat root view that a poll
     * presenter was created with. The poll container lives inside that
     * root; only the container is hidden, never the root itself.
     */
    public static void onPollRootView(View chatRoot) {
        try {
            if (chatRoot == null || !isEnabled(chatRoot.getContext(), KEY_HIDE_POLL)) {
                return;
            }
            View poll = findByIdName(chatRoot, "live_chat_poll");
            if (poll == null || poll == chatRoot) {
                return;
            }
            keepHidden(poll, KEY_HIDE_POLL);
            // Also hide the dedicated wrapper container so no empty strip
            // is left in the chat.
            ViewParent parent = poll.getParent();
            if (parent instanceof View) {
                View parentView = (View) parent;
                if (parentView.getId() == idForName(chatRoot, "live_chat_poll_container")
                        && parentView != chatRoot) {
                    keepHidden(parentView, KEY_HIDE_POLL);
                }
            }
        } catch (Throwable ignored) {
            // Never break the chat because of this feature.
        }
    }

    private static boolean isEnabled(Context context, String key) {
        try {
            if (context == null) {
                return true;
            }
            SharedPreferences prefs =
                    context.getSharedPreferences(MORPHE_PREFS_NAME, Context.MODE_PRIVATE);
            return prefs.getBoolean(key, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static int idForName(View root, String name) {
        return root.getResources().getIdentifier(
                name, "id", root.getContext().getPackageName());
    }

    private static View findByIdName(View root, String name) {
        int id = idForName(root, name);
        if (id == 0) {
            return null;
        }
        return root.findViewById(id);
    }

    /**
     * Hides the view now and re-hides it whenever a later layout pass
     * makes it visible again, until the feature is turned off in the
     * Morphe settings.
     */
    private static void keepHidden(final View view, final String settingKey) {
        view.setVisibility(View.GONE);
        view.getViewTreeObserver().addOnGlobalLayoutListener(
                new ViewTreeObserver.OnGlobalLayoutListener() {
                    @Override
                    public void onGlobalLayout() {
                        if (!isEnabled(view.getContext(), settingKey)) {
                            // Turned off in the settings. Stop enforcing;
                            // the app manages the view from here on.
                            view.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                            return;
                        }
                        if (view.getVisibility() != View.GONE) {
                            view.setVisibility(View.GONE);
                        }
                    }
                });
    }
}
