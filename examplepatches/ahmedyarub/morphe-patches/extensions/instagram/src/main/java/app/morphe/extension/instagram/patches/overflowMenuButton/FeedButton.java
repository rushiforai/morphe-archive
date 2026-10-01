/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/


package app.morphe.extension.instagram.patches.overflowMenuButton;

import android.content.Context;
import android.view.View;

import app.morphe.extension.shared.Logger;

import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.entity.Entity;
import app.morphe.extension.instagram.patches.overflowMenuButton.reels.AddReelButton;

public class FeedButton {

    /*
     * The feed sheet, added to the same way the reel sheet is.
     *
     * The row goes in through the sheet builder the reel menu uses, which takes a label, an icon
     * and a listener outright. This bundle used to also add an option to the menu's option list:
     * 446 dropped that one at render time, and 449 draws it, so the feed showed download twice.
     *
     * The builder is reached from a method whose frame is almost all parameters, above the range
     * a four bit register field can name, so each value arrives in its own call.
     */
    private static Object stashedFeedSheet;
    private static Object stashedFeedMedia;
    private static Object stashedFeedExtra;
    private static Object stashedFeedHolder;

    public static void stashFeedSheet(Object value) { stashedFeedSheet = value; }

    public static void stashFeedMedia(Object value) { stashedFeedMedia = value; }

    public static void stashFeedExtra(Object value) { stashedFeedExtra = value; }

    public static void stashFeedHolder(Object value) { stashedFeedHolder = value; }

    /** Fragment field on the sheet owner, for a themed context. Rewritten by the patch. */
    private static String feedFragmentFieldName() { return "fieldName"; }

    /** The carousel index field. Rewritten by the patch. */
    private static String feedCurrentMediaFieldName() { return "fieldName"; }

    /**
     * A context for the sheet, from whatever the call site had to hand.
     *
     * The feed builds this sheet from more than one place: some pass a view, others an object
     * holding the fragment. Both are accepted so a single hook body serves every site.
     */
    private static Context contextFrom(Object source) {
        try {
            if (source == null) return null;
            if (source instanceof View) return ((View) source).getContext();

            Object fragment = new Entity().getField(source, feedFragmentFieldName());
            if (fragment == null) return null;
            // getMethod, not the extension's reflection helper: requireContext is declared on
            // Fragment and the field holds a subclass, so a declared-method lookup misses it.
            return (Context) fragment.getClass().getMethod("requireContext").invoke(fragment);
        } catch (Exception e) {
            Logger.printException(() -> "Could not resolve a context for the feed sheet", e);
            return null;
        }
    }

    public static void addFeedMenuDownloadRow() {
        // Taken and cleared up front: the stash holds the sheet, the post and a view or fragment,
        // which would otherwise stay reachable from these statics after the sheet is gone, and a
        // call site that stashes no carousel index would read the previous post's.
        Object sheet = stashedFeedSheet;
        Object media = stashedFeedMedia;
        Object extra = stashedFeedExtra;
        Object holder = stashedFeedHolder;
        stashedFeedSheet = null;
        stashedFeedMedia = null;
        stashedFeedExtra = null;
        stashedFeedHolder = null;

        try {
            if (!Pref.enableDownload() || !AddReelButton.claimSheet(sheet)) return;

            Entity entity = new Entity();
            Context context = contextFrom(holder);
            if (context == null) return;

            int currentMediaIndex = 0;
            if (extra != null) {
                Object index = entity.getField(extra, feedCurrentMediaFieldName());
                if (index instanceof Integer) currentMediaIndex = (Integer) index;
            }

            AddReelButton.addDownloadButton(context, sheet, media, currentMediaIndex);
        } catch (Exception e) {
            Logger.printException(() -> "Error at addFeedMenuDownloadRow", e);
        }
    }
}
