/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.Nullable;

import java.lang.reflect.Field;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.ads.ModelFields;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
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

    public static boolean hideAssistant() {
        return enabled(FamilyNames.HIDE_ASSISTANT, Settings.HIDE_ASSISTANT);
    }

    public static boolean quietEmailReminder() {
        return enabled(FamilyNames.QUIET_EMAIL_REMINDER, Settings.QUIET_EMAIL_REMINDER);
    }

    /**
     * The Inbox is about to add its Updates section to the page. True leaves it out, and with it
     * the request that fills it. Off or paused, Updates load as they always did.
     */
    public static boolean hideInboxUpdates() {
        return enabled(FamilyNames.HIDE_INBOX_UPDATES, Settings.HIDE_INBOX_UPDATES);
    }

    /**
     * A pin's answer to whether it shows the "See more like this?" bubble, on its way out of the
     * pin. With Hide Home suggestions on, the answer is no; otherwise it's the pin's own, null
     * included. Never throws.
     */
    public static Boolean feedbackFlyout(Boolean shown) {
        return enabled(FamilyNames.FILTER_FEED, Settings.HIDE_HOME_SUGGESTIONS) ? Boolean.FALSE : shown;
    }

    /**
     * Pinterest has built a "Got a minute?" survey invite and is about to post it. True hands the
     * invite Maybe later's dismissal instead, so Pinterest marks it dismissed the way it would if
     * you'd tapped that, and it never shows. Off or paused, the invite shows as it always did.
     */
    public static boolean hideSurveyPrompts() {
        if (!enabled(FamilyNames.HIDE_SURVEY_PROMPTS, Settings.HIDE_SURVEY_PROMPTS)) return false;
        HookStatus.counted(FamilyNames.HIDE_SURVEY_PROMPTS, "survey invite declined");
        return true;
    }

    /**
     * Pinterest is about to open an advertiser sponsored poll, a survey of its own kind that pops up
     * rather than sitting in the feed. True skips it before anything is built, the way Pinterest
     * skips one when a poll is already open. Off or paused, the poll opens as it always did.
     */
    public static boolean hideSponsoredPolls() {
        if (!enabled(FamilyNames.HIDE_SURVEY_PROMPTS, Settings.HIDE_SURVEY_PROMPTS)) return false;
        HookStatus.counted(FamilyNames.HIDE_SURVEY_PROMPTS, "sponsored poll skipped");
        return true;
    }

    /** The close button on Pinterest's pop-up banner, a resource name it keeps. */
    static final String BANNER_DISMISS = "bannerOverlay_dismiss_icon_button";

    /**
     * Pinterest has finished putting up a pop-up banner over the feed, such as "Shop recommended
     * merchants", the education container's banner it hands over before anything is drawn. With
     * Hide pop-up banners on, the banner's own X is clicked, so Pinterest closes it and marks it
     * dismissed the way it does when you tap that. A banner whose X has no listener is hidden
     * instead. Null, already hidden, off or paused, the banner is left as it is. Never throws.
     */
    public static void popupBanner(View banner) {
        if (!enabled(FamilyNames.HIDE_POPUP_BANNERS, Settings.HIDE_POPUP_BANNERS)) return;
        if (banner == null || banner.getVisibility() != View.VISIBLE) return;
        try {
            int id = banner.getResources().getIdentifier(BANNER_DISMISS, "id", banner.getContext().getPackageName());
            View dismiss = id == 0 ? null : banner.findViewById(id);
            if (dismiss != null && dismiss.performClick()) {
                HookStatus.counted(FamilyNames.HIDE_POPUP_BANNERS, "pop-up banner dismissed");
                return;
            }
            banner.setVisibility(View.GONE);
            HookStatus.counted(FamilyNames.HIDE_POPUP_BANNERS, "pop-up banner hidden without its X");
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_POPUP_BANNERS, "pop-up banner", failure);
        }
    }

    /**
     * A pin page is about to add its related pins grid, or the refined list that stands in for it.
     * True leaves that list out of the page, so it never loads. Off or paused, the grid shows as it
     * always did.
     */
    public static boolean hideRelatedPins() {
        if (!enabled(FamilyNames.HIDE_RELATED_PINS, Settings.HIDE_RELATED_PINS)) return false;
        HookStatus.counted(FamilyNames.HIDE_RELATED_PINS, "related pins left out");
        return true;
    }

    /**
     * A pin page is about to wait for its related pins grid to load, showing gray placeholder tiles
     * until it does. With Hide related pins on, the grid was never added and would never load, so
     * true tells the page there's nothing to wait for. Off or paused, the page waits as usual.
     * Never throws.
     */
    public static boolean relatedPinsLoading() {
        if (!enabled(FamilyNames.HIDE_RELATED_PINS, Settings.HIDE_RELATED_PINS)) return false;
        HookStatus.counted(FamilyNames.HIDE_RELATED_PINS, "related pins loading skipped");
        return true;
    }

    /**
     * A pin's creator row has been drawn, handed over by its avatar. With Hide creator name on pins
     * on, everything next to the avatar in its row goes: the name and its badges. The row keeps its
     * own click, so the avatar still opens the profile. Null, off or paused, the row stays as it is.
     * Never throws.
     */
    public static void creatorName(View avatar) {
        if (!enabled(FamilyNames.HIDE_CREATOR_NAME, Settings.HIDE_CREATOR_NAME)) return;
        if (avatar == null || !(avatar.getParent() instanceof ViewGroup)) return;
        try {
            ViewGroup row = (ViewGroup) avatar.getParent();
            boolean hid = false;
            for (int i = 0; i < row.getChildCount(); i++) {
                View child = row.getChildAt(i);
                if (child == avatar || child.getVisibility() == View.GONE) continue;
                child.setVisibility(View.GONE);
                hid = true;
            }
            if (hid) HookStatus.counted(FamilyNames.HIDE_CREATOR_NAME, "creator name hidden");
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_CREATOR_NAME, "creator row", failure);
        }
    }

    /**
     * Pinterest is making the player for the chime it plays when a pin is saved, and {@code sound}
     * is that chime. With Custom save sound on and a file picked, the player plays the file instead.
     * Off, paused, with nothing picked, or with a file that no longer opens, Pinterest gets the
     * player for its own chime, made the way it makes it.
     */
    public static MediaPlayer saveSound(Context context, int sound) {
        MediaPlayer picked = pickedSaveSound(context);
        return picked != null ? picked : MediaPlayer.create(context, sound);
    }

    /** A player for the picked sound while Custom save sound is on, or null for Pinterest's own. */
    @Nullable
    static MediaPlayer pickedSaveSound(Context context) {
        if (context == null || !enabled(FamilyNames.CUSTOM_SAVE_SOUND, Settings.CUSTOM_SAVE_SOUND)) return null;
        Uri picked = SaveSound.picked();
        if (picked == null) return null;
        try {
            MediaPlayer player = MediaPlayer.create(context, picked);
            if (player != null) {
                HookStatus.counted(FamilyNames.CUSTOM_SAVE_SOUND, "picked sound played");
                return player;
            }
            HookStatus.counted(FamilyNames.CUSTOM_SAVE_SOUND, "picked sound didn't open, Pinterest's played");
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.CUSTOM_SAVE_SOUND, "picked sound", failure);
        }
        return null;
    }

    /** The toast class a test stands in for the save toasts patching names. */
    static volatile Class<?> saveToastForTests;

    /** The toast class a test stands in for the ones patching names as showing a text they were handed. */
    static volatile Class<?> messageToastForTests;

    /** True drops a save confirmation or follow suggestion before Pinterest's toast container builds it. */
    public static boolean hideSaveToast(Object toast) {
        boolean on = enabled(FamilyNames.HIDE_SAVE_TOASTS, Settings.HIDE_SAVE_TOASTS);
        boolean hide = on && saveToast(toast);
        // With Debug logging on, every toast that reaches the container is named with what became
        // of it. A save toast that still shows then either prints as shown, which names a model
        // patching didn't know, or prints nothing, which means Pinterest showed it some other way.
        Logger.printDebug(() -> "Toast " + (toast == null ? "null" : toast.getClass().getName())
                + (hide ? " hidden" : on ? " shown" : " shown, switch off or paused"));
        if (!hide) return false;
        HookStatus.counted(FamilyNames.HIDE_SAVE_TOASTS, "save toast hidden");
        return true;
    }

    private static boolean saveToast(Object toast) {
        Class<?> forced = saveToastForTests;
        if (forced != null) return forced.isInstance(toast);
        try {
            return isSaveToast(toast) || isSaveTextToast(toast)
                    || messageToast(toast) && SaveToastTexts.holdsSave(toast, Utils.getActivity(), Utils.getContext());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SAVE_TOASTS, "toast model", failure);
            return false;
        }
    }

    private static boolean messageToast(Object toast) {
        Class<?> forced = messageToastForTests;
        return forced != null ? forced.isInstance(toast) : isMessageToast(toast);
    }

    /** Answers false here. Patching writes instance checks for the save toast models found in that build. */
    public static boolean isSaveToast(Object toast) {
        return false;
    }

    /**
     * Answers false here. Patching writes checks for the toast models that show whatever text an
     * object they hold builds, true when that object is one that builds a save confirmation.
     */
    public static boolean isSaveTextToast(Object toast) {
        return false;
    }

    /**
     * Answers false here. Patching writes instance checks for the toast models that show a text
     * they were handed and that a screen that saves pins builds. The same models carry "Moved Pin"
     * and "Section created", so one of them is a save toast only when its text reads as a save.
     */
    public static boolean isMessageToast(Object toast) {
        return false;
    }

    /**
     * Stands in for Toast.makeText in the screens that save a pin. Pinterest confirms some saves
     * with an Android toast instead of its own: from the board picker while it counts a browser
     * tab it opened as still open, for a pin saved from another app's share sheet, and for a save
     * to a board section outside its home screen. None of those reach the toast container. With
     * the switch on, a save confirmation comes back as a toast that never shows. Any other text,
     * and every text while the switch is off or HushPinterest is paused, is the toast Android makes.
     */
    public static Toast androidToast(Context context, CharSequence text, int duration) {
        if (hideAndroidToast(context, text)) return new QuietToast(context);
        return Toast.makeText(context, text, duration);
    }

    /** The same for a toast made from a text's resource id. */
    public static Toast androidToast(Context context, int text, int duration) {
        if (hideAndroidToast(context, resourceText(context, text))) return new QuietToast(context);
        return Toast.makeText(context, text, duration);
    }

    private static boolean hideAndroidToast(Context context, CharSequence text) {
        boolean on = enabled(FamilyNames.HIDE_SAVE_TOASTS, Settings.HIDE_SAVE_TOASTS);
        boolean hide = on && context != null && saveText(context, text);
        // The line for a toast that never reaches the container. The text stays out of the log: it
        // can hold a board's name.
        Logger.printDebug(() -> "Android toast from a save screen"
                + (hide ? " hidden" : on ? " shown" : " shown, switch off or paused"));
        if (!hide) return false;
        HookStatus.counted(FamilyNames.HIDE_SAVE_TOASTS, "save toast hidden");
        return true;
    }

    private static boolean saveText(Context context, CharSequence text) {
        try {
            return SaveToastTexts.matches(text, context, Utils.getActivity(), Utils.getContext());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SAVE_TOASTS, "toast text", failure);
            return false;
        }
    }

    private static CharSequence resourceText(Context context, int text) {
        try {
            return context.getText(text);
        } catch (RuntimeException missing) {
            return null;
        }
    }

    /** What Pinterest gets back in place of a save confirmation: a toast whose show() does nothing. */
    private static final class QuietToast extends Toast {
        QuietToast(Context context) {
            super(context);
        }

        @Override public void show() {
        }
    }

    /**
     * Stands in for the Save to sheet's add of the board Pinterest suggests for the pin, which goes
     * under your own boards. The cell goes into the list unless the switch is on, so off or paused
     * the sheet keeps it. The add runs outside any catch, so nothing here can drop the cell by failing.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void suggestedBoard(Collection cells, Object board) {
        if (enabled(FamilyNames.HIDE_SUGGESTED_BOARDS, Settings.HIDE_SUGGESTED_BOARDS)) {
            HookStatus.counted(FamilyNames.HIDE_SUGGESTED_BOARDS, "suggested board hidden");
            return;
        }
        cells.add(board);
    }

    /** All the way up, in the percent of the screen the Save to sheet opens at. */
    static final int FULL_SHEET = 100;

    /**
     * The Save to sheet's opening height, in percent of the screen. Pinterest opens it part way up
     * for anything under 100. While the switch is on it opens all the way, and otherwise, or paused,
     * at the height Pinterest gave.
     */
    public static int saveSheetHeight(int percent) {
        if (!enabled(FamilyNames.EXPAND_BOARD_LIST, Settings.EXPAND_BOARD_LIST) || percent >= FULL_SHEET) return percent;
        HookStatus.counted(FamilyNames.EXPAND_BOARD_LIST, "sheet opened all the way");
        return FULL_SHEET;
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

    /** The typing-screen rows HushPinterest hid, held weakly like {@link #HIDDEN_TOPIC_ROWS}. */
    private static final Set<View> HIDDEN_RECENT_ROWS = Collections.synchronizedSet(
            Collections.newSetFromMap(new WeakHashMap<>()));

    /**
     * Pinterest is binding a row of the screen tapping the search bar opens. The same row shows a
     * recent search or a suggestion for typed text, and Pinterest gives only a recent search the
     * button that clears it, which is what {@code recent} says. With the switch on a recent search
     * goes GONE and joins the hidden rows. A row bound again as a suggestion, or bound with the switch
     * off or paused, comes back if HushPinterest hid it.
     */
    public static void recentSearchRow(View row, boolean recent) {
        if (row == null) return;
        try {
            boolean hide = enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY) && recent;
            hideRow(HIDDEN_RECENT_ROWS, row, hide);
            if (hide && HIDDEN_RECENT_ROWS.contains(row)) HookStatus.counted(FamilyNames.HIDE_SEARCH_HISTORY, "recent search row hidden");
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_SEARCH_HISTORY, "recent search row", failure);
        }
    }

    /** A hidden typing-screen row measures zero, the same way {@link #topicSuggestionsMeasureSpec} folds a topic row. */
    public static int recentSearchRowMeasureSpec(View row, int requested) {
        return foldedMeasure(HIDDEN_RECENT_ROWS, FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY, row, requested);
    }

    /** The Shop the look section under a pin (#6), its own closeup module, folds under Hide shopping. */
    public static int closeupShoppingVisibility(int requested) {
        return enabled(FamilyNames.HIDE_SHOPPING, Settings.HIDE_SHOPPING) ? View.GONE : requested;
    }

    public static int closeupShoppingMeasureSpec(int requested) {
        return enabled(FamilyNames.HIDE_SHOPPING, Settings.HIDE_SHOPPING)
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
     * The comment previews and comment photos under a pin. Hide comments folds them with the rest
     * of the module, and Hide comment previews folds only them, so the module's title, comment
     * box and button to all comments stay. Off or paused, Pinterest's own value goes through.
     */
    public static int commentPreviewsVisibility(int requested) {
        return previewsHidden() ? View.GONE : requested;
    }

    public static int commentPreviewsMeasureSpec(int requested) {
        return previewsHidden() ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : requested;
    }

    private static boolean previewsHidden() {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS)
                || enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENT_PREVIEWS);
    }

    /**
     * The row of suggested replies by the comment box. It has its own switch in the Hide comments
     * family, so neither switch turns the other on. Pinterest 14.41.0 never sets the row's
     * visibility, so the zero measure is what folds it and its scroller.
     */
    public static int suggestedRepliesVisibility(int requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_SUGGESTED_REPLIES) ? View.GONE : requested;
    }

    public static int suggestedRepliesMeasureSpec(int requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_SUGGESTED_REPLIES)
                ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : requested;
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
            boolean hide = hideTopicSuggestions();
            hideRow(HIDDEN_TOPIC_ROWS, row, hide);
            if (hide && HIDDEN_TOPIC_ROWS.contains(row)) HookStatus.counted(FamilyNames.HIDE_TOPIC_SUGGESTIONS, "topic row hidden");
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_TOPIC_SUGGESTIONS, "topic row", failure);
        }
    }

    /**
     * The topic row sits straight in Pinterest's grid, a RecyclerView, and that lays out a GONE
     * child at its measured size, a blank gap. A row HushPinterest hid measures zero instead.
     */
    public static int topicSuggestionsMeasureSpec(View row, int requested) {
        return foldedMeasure(HIDDEN_TOPIC_ROWS, FamilyNames.HIDE_TOPIC_SUGGESTIONS, Settings.HIDE_TOPIC_SUGGESTIONS, row, requested);
    }

    /**
     * Hides a row being bound and adds it to {@code hidden}, or gives back a row HushPinterest hid.
     * A row Pinterest made GONE itself is left as it is.
     */
    private static void hideRow(Set<View> hidden, View row, boolean hide) {
        if (hide) {
            if (row.getVisibility() != View.GONE) {
                hidden.add(row);
                row.setVisibility(View.GONE);
            }
        } else if (hidden.remove(row)) {
            row.setVisibility(View.VISIBLE);
        }
    }

    /**
     * A row in {@code hidden} measures zero. Once the switch is off or Pause is on, the row measures
     * as Pinterest asks and is shown again after this layout pass, rather than waiting for Pinterest
     * to bind it again. A row whose switch is back on by then stays hidden.
     */
    private static int foldedMeasure(Set<View> hidden, String family, BooleanSetting setting, View row, int requested) {
        if (row == null || !hidden.contains(row)) return requested;
        if (rowsStayHidden(family, setting)) return View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY);
        Utils.runOnMainThread(() -> {
            if (!rowsStayHidden(family, setting) && hidden.remove(row)) row.setVisibility(View.VISIBLE);
        });
        return requested;
    }

    /**
     * The switch read again for a measure, which Pinterest runs far more often than a bind, so it
     * isn't counted as another call.
     */
    private static boolean rowsStayHidden(String family, BooleanSetting setting) {
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(family, "switch read", failure);
            return false;
        }
    }
}
