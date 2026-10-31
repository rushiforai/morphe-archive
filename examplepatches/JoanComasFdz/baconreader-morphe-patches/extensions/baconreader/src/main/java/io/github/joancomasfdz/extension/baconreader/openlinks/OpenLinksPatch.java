// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.openlinks;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.net.Uri;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.joancomasfdz.extension.baconreader.settings.Settings;
import app.morphe.extension.shared.Logger;

/**
 * <p>
 * Android 12+ does not let an app enable its own links (reddit.com only verifies the official app),
 * so this shows whether they are enabled and opens the system "Open by default" screen.
 */
@SuppressWarnings("unused")
public final class OpenLinksPatch {
    private static final long PROMPT_DELAY_MS = 1500;
    /** After another dialog closes, so the prompt does not pop up in the same instant. */
    private static final long FOCUS_DELAY_MS = 600;

    /** The prompt currently on screen, so a second resume does not open another one. */
    private static WeakReference<Dialog> showing = new WeakReference<>(null);

    private OpenLinksPatch() {
    }

    /** Links that open in the app and all links the app declares, or null when unknown (before Android 12). */
    public static int[] status(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return null;
        try {
            DomainVerificationManager manager = context.getSystemService(DomainVerificationManager.class);
            DomainVerificationUserState state = manager.getDomainVerificationUserState(context.getPackageName());
            if (state == null) return null;
            int enabled = 0;
            int total = 0;
            for (Map.Entry<String, Integer> host : state.getHostToStateMap().entrySet()) {
                // The app also declares non-Reddit links (google.com) that other apps own.
                if (!isRedditHost(host.getKey())) continue;
                total++;
                if (state.isLinkHandlingAllowed() && host.getValue() != DomainVerificationUserState.DOMAIN_STATE_NONE) {
                    enabled++;
                }
            }
            return new int[]{enabled, total};
        } catch (Exception t) {
            Logger.printInfo(() -> "Could not read link state", t);
            return null;
        }
    }

    static boolean isRedditHost(String host) {
        if (host == null) return false;
        String h = host.toLowerCase(java.util.Locale.ROOT);
        if (h.startsWith("*.")) h = h.substring(2);
        return h.equals("redd.it") || h.endsWith(".redd.it")
                || h.equals("reddit.com") || h.endsWith(".reddit.com")
                || h.equals("reddit.app.link") || h.endsWith(".redditmail.com") || h.equals("redditmail.com");
    }

    static String summary(int[] status) {
        if (status == null) return str("revanced_open_links_summary_unknown");
        if (status[1] > 0 && status[0] == status[1]) return str("revanced_open_links_summary_on", status[1]);
        if (status[0] == 0) return str("revanced_open_links_summary_off");
        return str("revanced_open_links_summary_partly", status[0], status[1]);
    }

    /** Opens the system "Open by default" screen of this app (App info before Android 12). */
    public static void openSettings(Context context) {
        Uri uri = Uri.parse("package:" + context.getPackageName());
        Intent intent = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                ? new Intent(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS, uri)
                : new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, uri);
        try {
            context.startActivity(intent);
        } catch (Throwable t) {
            try {
                context.startActivity(new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, uri));
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Injected at the start of MainActivity.onResume. While no Reddit link opens in the app,
     * asks whether to set them up, until the user answers once.
     */
    public static void onMainResume(final Activity activity) {
        try {
            if (Settings.OPEN_LINKS_PROMPT_SHOWN.get()) return;
            // After the app's own startup work (dialogs, consent, recreation) has settled.
            activity.getWindow().getDecorView().postDelayed(new Runnable() {
                @Override
                public void run() {
                    maybePrompt(activity);
                }
            }, PROMPT_DELAY_MS);
        } catch (Exception t) {
            Logger.printInfo(() -> "Could not schedule the links prompt", t);
        }
    }

    private static void maybePrompt(final Activity activity) {
        try {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            Dialog current = showing.get();
            if (current != null && current.isShowing()) return;
            if (Settings.OPEN_LINKS_PROMPT_SHOWN.get()) return;
            if (!activity.hasWindowFocus()) {
                // A permission request or the app's own dialog is on top: try again once it is closed.
                Logger.printDebug(() -> "Links prompt postponed: something else is on screen");
                waitForFocus(activity);
                return;
            }
            int[] status = status(activity);
            Logger.printDebug(() -> "Links status: " + (status == null ? "unknown" : status[0] + "/" + status[1]));
            if (status == null || status[1] == 0 || status[0] > 0) return;

            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle(str("revanced_open_links_prompt_title"))
                    .setMessage(str("revanced_open_links_prompt_message"))
                    .setPositiveButton(str("revanced_open_links_prompt_set_up"), new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            answered(activity);
                            openSettings(activity);
                        }
                    })
                    .setNegativeButton(str("revanced_open_links_prompt_not_now"), new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            answered(activity);
                        }
                    })
                    .setOnCancelListener(new DialogInterface.OnCancelListener() {
                        @Override
                        public void onCancel(DialogInterface dialog) {
                            answered(activity);
                        }
                    })
                    .create();
            dialog.show();
            showing = new WeakReference<Dialog>(dialog);
        } catch (Exception t) {
            Logger.printInfo(() -> "Could not show the links prompt", t);
        }
    }

    /** Activities already waiting for their window to get focus back. */
    private static final Map<Activity, Boolean> WAITING = new WeakHashMap<>();

    private static void waitForFocus(final Activity activity) {
        if (WAITING.containsKey(activity)) return;
        WAITING.put(activity, Boolean.TRUE);
        final ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
        observer.addOnWindowFocusChangeListener(new ViewTreeObserver.OnWindowFocusChangeListener() {
            @Override
            public void onWindowFocusChanged(boolean hasFocus) {
                if (!hasFocus) return;
                WAITING.remove(activity);
                final ViewTreeObserver.OnWindowFocusChangeListener self = this;
                final View decor = activity.getWindow().getDecorView();
                decor.post(new Runnable() {
                    @Override
                    public void run() {
                        decor.getViewTreeObserver().removeOnWindowFocusChangeListener(self);
                    }
                });
                decor.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        maybePrompt(activity);
                    }
                }, FOCUS_DELAY_MS);
            }
        });
    }

    /** Only a real answer (button or back) stops the prompt; a dialog lost with its activity asks again. */
    private static void answered(Context context) {
        Settings.OPEN_LINKS_PROMPT_SHOWN.save(true);
    }
}
