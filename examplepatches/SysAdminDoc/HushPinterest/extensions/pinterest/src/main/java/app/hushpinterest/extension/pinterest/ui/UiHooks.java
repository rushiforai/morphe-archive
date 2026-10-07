/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.view.View;

import java.lang.reflect.Field;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.ads.ModelFields;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;

/** Runtime decisions for the specific UI paths matched by the patch bundle. */
public final class UiHooks {
    private UiHooks() {}

    static boolean enabled(String family, BooleanSetting setting) {
        HookStatus.invoked(family);
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(family, "switch read", failure);
            return false;
        }
    }

    public static boolean hideScreenshotShare() {
        return enabled(FamilyNames.HIDE_SCREENSHOT_SHARE, Settings.HIDE_SCREENSHOT_SHARE);
    }

    public static boolean quietEmailReminder() {
        return enabled(FamilyNames.QUIET_EMAIL_REMINDER, Settings.QUIET_EMAIL_REMINDER);
    }

    /** The toast class a test stands in for the save toasts patching names. */
    static volatile Class<?> saveToastForTests;

    /** True drops a save confirmation or follow suggestion before Pinterest's toast container builds it. */
    public static boolean hideSaveToast(Object toast) {
        if (!enabled(FamilyNames.HIDE_SAVE_TOASTS, Settings.HIDE_SAVE_TOASTS) || !saveToast(toast)) return false;
        HookStatus.counted(FamilyNames.HIDE_SAVE_TOASTS, "save toast hidden");
        return true;
    }

    private static boolean saveToast(Object toast) {
        Class<?> forced = saveToastForTests;
        return forced != null ? forced.isInstance(toast) : isSaveToast(toast);
    }

    /** Answers false here. Patching writes instance checks for the save toast models found in that build. */
    public static boolean isSaveToast(Object toast) {
        return false;
    }

    /** True has Pinterest's image model answer its original rendition first, where it has one. */
    public static boolean originalImages() {
        return enabled(FamilyNames.ORIGINAL_IMAGES, Settings.ORIGINAL_IMAGES);
    }

    /**
     * The images key that asks Pinterest's API for a pin's original. Its collage requests name the
     * original originals, but a pin request with that key fails and the home feed doesn't load
     * (S25, 2026-10-06), so pins ask for orig. An originals entry Pinterest sent anyway still counts.
     */
    static final String ORIGINAL = "orig", ORIGINALS = "originals";

    /** Adds the original to the image sizes Pinterest asks its API to send with each pin. */
    public static void imageSizes(Set<String> sizes) {
        if (sizes == null || !originalImages()) return;
        try {
            sizes.add(ORIGINAL);
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.ORIGINAL_IMAGES, "image sizes", failure);
        }
    }

    /**
     * The pin's original image in place of the large one its closeup shows. Pinterest's large image
     * stays when the switch is off, or when no original arrived as the same kind of image model
     * with its dimensions and a Pinterest media address.
     */
    public static Object closeupImage(Object pin, Object large) {
        if (pin == null || large == null || !originalImages()) return large;
        try {
            Object images = ModelFields.read(ModelFields.of(pin.getClass()), pin, "images");
            if (!(images instanceof Map<?, ?>)) return large;
            Object original = ((Map<?, ?>) images).get(ORIGINAL);
            if (original == null) original = ((Map<?, ?>) images).get(ORIGINALS);
            if (original == null || original.getClass() != large.getClass()) return large;
            Map<String, Field> fields = ModelFields.of(original.getClass());
            if (!dimension(ModelFields.read(fields, original, "width")) || !dimension(ModelFields.read(fields, original, "height"))
                    || !mediaAddress(ModelFields.read(fields, original, "url"))) return large;
            HookStatus.counted(FamilyNames.ORIGINAL_IMAGES, "closeup original shown");
            return original;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.ORIGINAL_IMAGES, "closeup image", failure);
            return large;
        }
    }

    /**
     * Pinterest's closeup reads both dimensions as doubles and reads a missing one as zero, which
     * would size the image wrong. It also steps down to a smaller size for an image past the
     * screen's texture limit, so an original wider or taller than 8192 keeps the large image.
     */
    private static boolean dimension(Object value) {
        if (!(value instanceof Number)) return false;
        double number = ((Number) value).doubleValue();
        return number >= 1 && number <= 8192;
    }

    private static boolean mediaAddress(Object value) {
        if (!(value instanceof String)) return false;
        try {
            URI uri = new URI((String) value);
            String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
            return "https".equalsIgnoreCase(uri.getScheme()) && uri.getRawUserInfo() == null
                    && (host.equals("pinimg.com") || host.endsWith(".pinimg.com"));
        } catch (URISyntaxException malformed) {
            return false;
        }
    }

    public static boolean disableUpdateNag() {
        return enabled(FamilyNames.DISABLE_UPDATE_NAG, Settings.DISABLE_UPDATE_NAG);
    }

    public static int searchHistoryVisibility(int requested) {
        return enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY) ? View.GONE : requested;
    }

    public static int searchHistoryMeasureSpec(int requested) {
        return enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY)
                ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : requested;
    }

    public static int commentsVisibility(int requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS) ? View.GONE : requested;
    }

    public static int commentsMeasureSpec(int requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS)
                ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : requested;
    }

    public static boolean commentsVisible(boolean requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS) ? false : requested;
    }

    /**
     * The topic rows HushPinterest hid, so it brings back only its own. Held weakly: a row Pinterest
     * lets go of leaves with it.
     */
    private static final Set<View> HIDDEN_TOPIC_ROWS = Collections.synchronizedSet(
            Collections.newSetFromMap(new WeakHashMap<>()));

    public static boolean hideTopicSuggestions() {
        return enabled(FamilyNames.HIDE_TOPIC_SUGGESTIONS, Settings.HIDE_TOPIC_SUGGESTIONS);
    }

    /**
     * Pinterest is binding its "Ideas you might love" row of topic bubbles. With the switch on the
     * row goes GONE and joins the hidden rows, whose measure then answers zero. Off or paused, a
     * row HushPinterest hid comes back. A row Pinterest made GONE itself is left as it is.
     */
    public static void topicSuggestions(Object section) {
        if (!(section instanceof View)) return;
        View row = (View) section;
        try {
            if (hideTopicSuggestions()) {
                if (row.getVisibility() != View.GONE) {
                    HIDDEN_TOPIC_ROWS.add(row);
                    row.setVisibility(View.GONE);
                }
                if (HIDDEN_TOPIC_ROWS.contains(row)) HookStatus.counted(FamilyNames.HIDE_TOPIC_SUGGESTIONS, "topic row hidden");
            } else if (HIDDEN_TOPIC_ROWS.remove(row)) {
                row.setVisibility(View.VISIBLE);
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_TOPIC_SUGGESTIONS, "topic row", failure);
        }
    }

    /**
     * The topic row sits straight in Pinterest's grid, a RecyclerView, and that lays out a GONE
     * child at its measured size, a blank gap. A row HushPinterest hid measures zero instead. Once
     * the switch is off or Pause is on, the row measures as Pinterest asks and is shown again after
     * this layout pass, rather than waiting for Pinterest to bind it again. A row whose switch is
     * back on by then stays hidden.
     */
    public static int topicSuggestionsMeasureSpec(View row, int requested) {
        if (row == null || !HIDDEN_TOPIC_ROWS.contains(row)) return requested;
        if (topicRowsStayHidden()) return View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY);
        Utils.runOnMainThread(() -> {
            if (!topicRowsStayHidden() && HIDDEN_TOPIC_ROWS.remove(row)) row.setVisibility(View.VISIBLE);
        });
        return requested;
    }

    /**
     * The switch read again for a measure, which Pinterest runs far more often than a bind, so it
     * isn't counted as another call.
     */
    private static boolean topicRowsStayHidden() {
        try {
            return Utils.settingsReady() && Settings.HIDE_TOPIC_SUGGESTIONS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TOPIC_SUGGESTIONS, "switch read", failure);
            return false;
        }
    }
}
