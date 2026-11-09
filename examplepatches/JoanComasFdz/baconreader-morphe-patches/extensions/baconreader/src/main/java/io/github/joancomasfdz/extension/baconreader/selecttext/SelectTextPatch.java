// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.selecttext;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.BackgroundColorSpan;
import android.text.style.ClickableSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ScrollView;
import android.widget.TextView;

import com.onelouder.baconreader.controlbar.ControlBar;
import com.onelouder.baconreader.controlbar.ControlBarButton;
import com.onelouder.baconreader.parser.RedditSpanner;
import com.onelouder.baconreader.reddit.Link;
import com.onelouder.baconreader.reddit.Message;
import com.onelouder.baconreader.reddit.ThingData;
import com.onelouder.baconreader.utils.StringUtils;
import com.onelouder.baconreader.utils.ThemeHelper;
import com.onelouder.baconreader.utils.Utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.tables.TableSpan;

/**
 * Shows the text of a post or comment in a dialog where any part of it can be selected. BaconReader's text views take a
 * tap and a long press for the list (showing the action bar), and "Copy" copies the whole text as markdown.
 */
@SuppressWarnings("unused")
public final class SelectTextPatch {
    /** The id the patch adds for the item of the post menu. */
    private static final String MENU_ITEM = "baconreader_patches_select_text";

    /** The id the patch adds for the dialog's text. */
    private static final String SELECTED_TEXT = "baconreader_patches_selected_text";

    /**
     * The app's spoiler: over a box (a BackgroundColorSpan) of the same range, it paints its text the box's color
     * until tapped.
     */
    private static final String SPOILER_SPAN = "com.onelouder.baconreader.parser.SpoilerClickableSpan";

    private SelectTextPatch() {
    }

    /**
     * Injected in PostControlBar.updateButtons, the action bar of a comment (and of a post in the list), right after it
     * adds "Copy": adds "Select text" after it, in the same menu.
     */
    public static void addButton(ControlBar bar, Activity activity, ThingData thing) {
        if (bar == null || activity == null || thing == null) return;
        try {
            ControlBarButton button = bar.setButton(str("revanced_select_text"));
            int icon = ResourceUtils.getIdentifier(ResourceType.ATTR, "ic_controlbar_copy");
            if (icon != 0) button.setImage(ThemeHelper.getResourceId(icon));
            button.setOnClickListener(view -> show(activity, thing));
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not add Select text to the action bar", ex);
        }
    }

    /**
     * Injected in ControlbarBase.drawBar right after it inflates the ⋮ menu of a post: adds "Select text" right after
     * "Copy". Menu items without an order show in the order they were added, so the items after "Copy" are added again
     * after it.
     */
    public static void addMenuItem(Object popupMenu) {
        if (popupMenu == null) return;
        try {
            Menu menu = (Menu) popupMenu.getClass().getMethod("getMenu").invoke(popupMenu);
            int id = id(MENU_ITEM);
            if (menu == null || id == 0 || menu.findItem(id) != null) return;
            int copy = id("action_copy");
            List<MenuItem> moved = new ArrayList<>();
            boolean afterCopy = false;
            for (int i = 0; i < menu.size(); i++) {
                MenuItem item = menu.getItem(i);
                if (afterCopy) moved.add(item);
                if (item.getItemId() == copy) afterCopy = true;
            }
            for (MenuItem item : moved) menu.removeItem(item.getItemId());
            menu.add(Menu.NONE, id, Menu.NONE, str("revanced_select_text"));
            for (MenuItem item : moved) {
                menu.add(item.getGroupId(), item.getItemId(), Menu.NONE, item.getTitle())
                        .setVisible(item.isVisible());
            }
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not add Select text to the post menu", ex);
        }
    }

    /**
     * Injected first in ControlbarBase.onAction with the id of the tapped item of a post's ⋮ menu: shows the post's text
     * when it's "Select text". Returns whether it was.
     */
    public static boolean onPostAction(int itemId, Activity activity, Link link) {
        if (activity == null || itemId == 0 || itemId != id(MENU_ITEM)) return false;
        if (link != null) show(activity, link);
        return true;
    }

    /**
     * Shows the text of a post (its title, then its text) or of a comment as the app draws it, in a dialog where it can
     * be selected. Its spoilers show, and its links open with a tap.
     */
    private static void show(Activity activity, ThingData thing) {
        try {
            CharSequence text = text(thing);
            if (text == null) return;
            AlertDialog.Builder builder = Utils.getAlertBuilder(activity);
            Context context = builder.getContext();
            int padding = dp(context, 24);
            TextView view = new TextView(context);
            view.setId(id(SELECTED_TEXT));
            view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            ThemeHelper.applyFontSize(view);
            int linkColor = ResourceUtils.getIdentifier(ResourceType.ATTR, "linkColor");
            if (linkColor != 0) view.setLinkTextColor(ThemeHelper.getData(linkColor));
            view.setPadding(padding, padding, padding, 0);
            view.setTextIsSelectable(true);
            // After setTextIsSelectable, which sets its own: a tap opens a link, and a long press still selects.
            view.setMovementMethod(LinkMovementMethod.getInstance());
            view.setText(text, TextView.BufferType.SPANNABLE);
            ScrollView scroll = new ScrollView(context);
            scroll.addView(view);
            builder.setView(scroll)
                    .setPositiveButton(str("revanced_select_text_close"), null)
                    .create()
                    .show();
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the text to select", ex);
        }
    }

    private static CharSequence text(ThingData thing) {
        if (thing instanceof Message) {
            Message message = (Message) thing;
            CharSequence body = body(message.body_html, message.subreddit);
            return body != null ? body : message.body;
        }
        if (!(thing instanceof Link)) return null;
        Link link = (Link) thing;
        SpannableStringBuilder text = new SpannableStringBuilder();
        if (link.title != null && !link.title.isEmpty()) {
            // Reddit's titles escape &, < and >, which the app's title unescapes too.
            String title = StringUtils.unescapeHtml3(link.title);
            text.append(title != null ? title : link.title, new StyleSpan(Typeface.BOLD),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        CharSequence body = body(link.selftext_html, link.subreddit);
        if (body != null && body.length() > 0) {
            if (text.length() > 0) text.append("\n\n");
            text.append(body);
        }
        return text.length() > 0 ? text : null;
    }

    /** Reddit's HTML of a post or comment, drawn by the app's own spanner, the same as on screen. */
    private static CharSequence body(String html, String subreddit) {
        if (html == null || html.isEmpty()) return null;
        CharSequence spannable = new RedditSpanner(html, subreddit).getSpannable();
        if (spannable == null) return null;
        SpannableStringBuilder text = new SpannableStringBuilder(spannable);
        // A table of "Show tables" is drawn over a single character, sized for the comment list: its cells, as text,
        // can be selected and copied instead.
        TableSpan[] tables = text.getSpans(0, text.length(), TableSpan.class);
        Arrays.sort(tables, (a, b) -> Integer.compare(text.getSpanStart(b), text.getSpanStart(a)));
        for (TableSpan table : tables) {
            int start = text.getSpanStart(table);
            int end = text.getSpanEnd(table);
            text.removeSpan(table);
            text.replace(start, end, table.toString());
        }
        // Spoilers show as plain text, without their box: the text is shown to be selected. A link inside one opens
        // with the first tap, which the spoiler took.
        for (ClickableSpan spoiler : text.getSpans(0, text.length(), ClickableSpan.class)) {
            if (!SPOILER_SPAN.equals(spoiler.getClass().getName())) continue;
            int spoilerStart = text.getSpanStart(spoiler);
            int spoilerEnd = text.getSpanEnd(spoiler);
            text.removeSpan(spoiler);
            for (BackgroundColorSpan box : text.getSpans(spoilerStart, spoilerEnd, BackgroundColorSpan.class)) {
                if (text.getSpanStart(box) == spoilerStart && text.getSpanEnd(box) == spoilerEnd) text.removeSpan(box);
            }
        }
        int start = 0;
        int end = text.length();
        while (start < end && Character.isWhitespace(text.charAt(start))) start++;
        while (end > start && Character.isWhitespace(text.charAt(end - 1))) end--;
        return text.subSequence(start, end);
    }

    private static int id(String name) {
        return ResourceUtils.getIdentifier(ResourceType.ID, name);
    }

    private static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density);
    }
}
