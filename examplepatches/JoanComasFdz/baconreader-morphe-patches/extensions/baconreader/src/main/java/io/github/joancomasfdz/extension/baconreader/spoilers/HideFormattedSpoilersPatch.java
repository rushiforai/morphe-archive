// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.spoilers;

import static app.morphe.extension.shared.StringRef.str;

import android.text.Spannable;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import app.morphe.extension.shared.Logger;

/**
 * Hide formatted spoilers.
 *
 * A link in a spoiler took the tap, which opened it without showing the spoiler: the link is
 * replaced by one that shows the spoiler while it's hidden, and opens the link once it shows.
 *
 * A hidden spoiler is only drawn as a box: accessibility would still read its text. While one is
 * hidden, the view's description is its text with each hidden spoiler read as "spoiler".
 */
@SuppressWarnings("unused")
public final class HideFormattedSpoilersPatch {
    private static final String SPOILER = "com.onelouder.baconreader.parser.SpoilerClickableSpan";
    /** A span priority above the app's, which sets none. */
    private static final int FIRST = 100;

    private HideFormattedSpoilersPatch() {
    }

    /**
     * Injected right after the app sets the text of a comment (CommentHolder.updateView) or a post
     * (DetailLinkFragment.updateSelftext), and after a tap shows or hides a spoiler
     * (SpoilerClickableSpan.onClick).
     */
    public static void describe(View view) {
        if (!(view instanceof TextView)) return;
        TextView textView = (TextView) view;
        try {
            CharSequence current = textView.getText();
            if (current instanceof Spannable) guardLinks((Spannable) current);
            if (!(current instanceof Spanned)) {
                textView.setContentDescription(null);
                return;
            }
            final Spanned text = (Spanned) current;
            List<ClickableSpan> hidden = new ArrayList<>();
            for (ClickableSpan span : text.getSpans(0, text.length(), ClickableSpan.class)) {
                if (span.getClass().getName().equals(SPOILER) && isHidden(span)) hidden.add(span);
            }
            if (hidden.isEmpty()) {
                textView.setContentDescription(null);
                return;
            }
            Collections.sort(hidden, new Comparator<ClickableSpan>() {
                @Override
                public int compare(ClickableSpan a, ClickableSpan b) {
                    return Integer.compare(text.getSpanStart(a), text.getSpanStart(b));
                }
            });
            StringBuilder described = new StringBuilder();
            int at = 0;
            for (ClickableSpan spoiler : hidden) {
                int start = text.getSpanStart(spoiler);
                if (start < at) continue;
                described.append(text, at, start).append(str("revanced_spoiler_hidden"));
                at = text.getSpanEnd(spoiler);
            }
            described.append(text, at, text.length());
            textView.setContentDescription(described.toString());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not describe the hidden spoilers", ex);
        }
    }

    /**
     * Puts each link inside a spoiler behind the spoiler, in the text and in the text the spoiler
     * sets again when tapped.
     */
    private static void guardLinks(Spannable text) throws ReflectiveOperationException {
        for (ClickableSpan spoiler : text.getSpans(0, text.length(), ClickableSpan.class)) {
            if (!spoiler.getClass().getName().equals(SPOILER)) continue;
            guardLinks(text, spoiler);
            Spannable source = sourceOf(spoiler);
            if (source != null && source != text) guardLinks(source, spoiler);
        }
    }

    private static void guardLinks(Spannable text, ClickableSpan spoiler) {
        int start = text.getSpanStart(spoiler);
        int end = text.getSpanEnd(spoiler);
        if (start < 0) return;
        for (ClickableSpan link : text.getSpans(start, end, ClickableSpan.class)) {
            if (link == spoiler || link instanceof SpoilerLink || link.getClass().getName().equals(SPOILER)) continue;
            int linkStart = text.getSpanStart(link);
            int linkEnd = text.getSpanEnd(link);
            if (linkStart < start || linkEnd > end) continue;
            text.removeSpan(link);
            // First among the spans: the app's touch handler takes the first one under the finger.
            text.setSpan(new SpoilerLink(link, spoiler), linkStart, linkEnd,
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE | (FIRST << Spanned.SPAN_PRIORITY_SHIFT));
        }
    }

    /** A link inside a spoiler: a tap shows the spoiler while it's hidden, and opens the link after. */
    private static final class SpoilerLink extends ClickableSpan {
        private final ClickableSpan link;
        private final ClickableSpan spoiler;

        SpoilerLink(ClickableSpan link, ClickableSpan spoiler) {
            this.link = link;
            this.spoiler = spoiler;
        }

        @Override
        public void onClick(View widget) {
            boolean hidden;
            try {
                hidden = isHidden(spoiler);
            } catch (ReflectiveOperationException ex) {
                Logger.printInfo(() -> "Could not tell if the spoiler is hidden", ex);
                hidden = false;
            }
            if (hidden) spoiler.onClick(widget);
            else link.onClick(widget);
        }

        /** Drawn before the spoiler, which then hides the link or shows it in its own colors. */
        @Override
        public void updateDrawState(TextPaint paint) {
            link.updateDrawState(paint);
        }
    }

    /** The text the spoiler sets again on the view when tapped. It is private in BaconReader. */
    private static Spannable sourceOf(Object spoiler) throws ReflectiveOperationException {
        Field field = spoiler.getClass().getDeclaredField("source");
        field.setAccessible(true);
        Object source = field.get(spoiler);
        return source instanceof Spannable ? (Spannable) source : null;
    }

    /**
     * The span's "hideSpoiler" is false while the spoiler is hidden, and flips with each tap. It is
     * private in BaconReader.
     */
    private static boolean isHidden(Object span) throws ReflectiveOperationException {
        Field field = span.getClass().getDeclaredField("hideSpoiler");
        field.setAccessible(true);
        return !field.getBoolean(span);
    }
}
