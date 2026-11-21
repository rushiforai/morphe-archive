/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20
 */

package app.morphe.extension.youtube.patches.feed;

import static app.morphe.extension.youtube.patches.feed.FeedViewCountPatch.attachOriginalViewCount;
import static app.morphe.extension.youtube.patches.feed.FeedViewCountPatch.attachedViewCount;
import static app.morphe.extension.youtube.patches.feed.FeedViewCountPatch.transformSubtitle;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ImageSpan;
import android.text.style.TtsSpan;
import android.text.style.URLSpan;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Set;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class FeedSubtitleTest {
    // Template chains from the classic and modern Litho traces. Runtime hashes must not matter.
    private static final String CLASSIC = "video_lockup_with_attachment.eml-fe|8c9f32865b8d364|CellType|"
            + "video_lockup.eml-fe|86c8cb72784a2b69|ContainerType|video_lockup_metadata.eml-fe|8fbea84891063607|"
            + "ContainerType|ContainerType|lockup_metadata.eml-fe|50c579a9d8b40392|"
            + "ContainerType|ContainerType|ContainerType|ContainerType|ContainerType|TextType|";
    private static final String HEADER = "lockup.eml-fe|8c3f407b04ae7a1f|CellType|ContainerType|ContainerType|"
            + "lockup_metadata_ue.eml-fe|737eb9112e8e9f54|ContainerType|";
    private static final String MODERN = HEADER + "ContainerType|content_metadata.eml-fe|a144fbab0751cd44|"
            + "ContainerType|ContainerType|ContainerType|TextType|";
    private static final String LEARNED_CLASSIC = "video_lockup_with_attachment.eml-fe|video_lockup.eml-fe|"
            + "video_lockup_metadata.eml-fe|lockup_metadata.eml-fe";
    private static final String FULL = "Channel 24 · 4.7M views · 2 days ago";

    @Test
    public void bothFlagsAreIndependentOnClassicAndModernCards() {
        for (String path : new String[]{CLASSIC, MODERN}) {
            SpannableString text = new SpannableString(FULL);
            assertSame(text, hide(path, text, false, false));
            assertEquals("Channel 24 · 2 days ago", hide(path, text, true, false).toString());
            assertEquals("Channel 24 · 4.7M views", hide(path, text, false, true).toString());
            assertEquals("Channel 24", hide(path, text, true, true).toString());
            assertEquals(FULL, text.toString());
        }
    }

    @Test
    public void absoluteDatesAndRelativeDatesKeepTheirExactTextWhenViewsAreHidden() {
        for (String date : new String[]{"Nov 11, 2024", "11 November 2024", "2024-11-11", "yesterday"}) {
            String text = "Channel\u00a0•\u00a01,234 views\u202f•\u202f" + date;
            assertEquals("Channel\u202f•\u202f" + date, hide(CLASSIC, text, true, false).toString());
            assertEquals("Channel\u00a0•\u00a01,234 views", hide(CLASSIC, text, false, true).toString());
        }
    }

    @Test
    public void splitModernRowsCanBeEditedWithoutAnUnrelatedSiblingRow() {
        assertEquals("", hide(MODERN, "4.7M views", true, false).toString());
        assertEquals("", hide(MODERN, "2 days ago", false, true).toString());
        assertEquals("Channel", hide(MODERN, "Channel · 2 days ago", false, true).toString());
        assertEquals("Channel", hide(MODERN, "Channel · 4.7M views", true, false).toString());
        assertEquals("2 days ago", hide(MODERN, "4.7M views · 2 days ago", true, false).toString());
        assertEquals("4.7M views", hide(MODERN, "4.7M views · 2 days ago", false, true).toString());

        SpannableString unlabeled = new SpannableString("  4.7M");
        icon(unlabeled, 0);
        assertEquals("", hide(MODERN, unlabeled, true, false).toString());
        assertSame(unlabeled, hide(MODERN, unlabeled, false, true));
    }

    @Test
    public void channelLinkTalkbackSpanAndDirectionalWrapSurviveEditing() {
        String channel = "القناة ٢٤";
        String original = "\u2067" + channel + " · \u2066١٢٣\u2069 مشاهدة · قبل ٣ أيام\u2069";
        SpannableString text = new SpannableString(original);
        URLSpan link = new URLSpan("https://www.youtube.com/@example");
        TtsSpan pronunciation = new TtsSpan.TextBuilder(channel).build();
        setSpan(text, link, 1, channel.length() + 1);
        setSpan(text, pronunciation, 1, channel.length() + 1);

        Spanned viewsHidden = (Spanned) hide(CLASSIC, text, true, false);
        assertEquals("\u2067" + channel + " · قبل ٣ أيام\u2069", viewsHidden.toString());
        assertEquals(1, viewsHidden.getSpanStart(link));
        assertEquals(channel.length() + 1, viewsHidden.getSpanEnd(link));
        assertSame(pronunciation, viewsHidden.getSpans(0, viewsHidden.length(), TtsSpan.class)[0]);

        assertEquals("\u2067" + channel + " · \u2066١٢٣\u2069 مشاهدة\u2069",
                hide(CLASSIC, text, false, true).toString());
        assertEquals("\u2067" + channel + "\u2069", hide(CLASSIC, text, true, true).toString());
    }

    @Test
    public void nativeIconRunsKeepTheVerificationBadgeAndExactlyOneSeparator() {
        SpannableString text = new SpannableString("Channel     4.7M   2 days ago");
        ImageSpan verification = icon(text, 7);
        ImageSpan firstSeparator = icon(text, 9);
        ImageSpan play = icon(text, 11);
        ImageSpan secondSeparator = icon(text, 17);

        Spanned viewsHidden = (Spanned) hide(MODERN, text, true, false);
        assertEquals("Channel    2 days ago", viewsHidden.toString());
        assertEquals(7, viewsHidden.getSpanStart(verification));
        assertEquals(-1, viewsHidden.getSpanStart(firstSeparator));
        assertEquals(-1, viewsHidden.getSpanStart(play));
        assertEquals(9, viewsHidden.getSpanStart(secondSeparator));

        Spanned ageHidden = (Spanned) hide(MODERN, text, false, true);
        assertEquals("Channel     4.7M", ageHidden.toString());
        assertEquals(11, ageHidden.getSpanStart(play));
        assertEquals(-1, ageHidden.getSpanStart(secondSeparator));

        Spanned bothHidden = (Spanned) hide(MODERN, text, true, true);
        assertEquals("Channel ", bothHidden.toString());
        assertEquals(7, bothHidden.getSpanStart(verification));
        assertEquals(1, bothHidden.getSpans(0, bothHidden.length(), ImageSpan.class).length);
    }

    @Test
    public void badgeStillLearnsNormallyAndOwnsItsCountWhenBothFieldsAreHidden() {
        SpannableString text = attachOriginalViewCount(new SpannableString(FULL));
        String count = "4.7\u00a0M";
        assertEquals(count, attachedViewCount(text));

        CharSequence unlearned = transformSubtitle(CLASSIC, text, true, false, false, Set.of());
        assertEquals(FULL, unlearned.toString());
        assertEquals(count, attachedViewCount(unlearned));

        CharSequence learned = transformSubtitle(CLASSIC, text, true, false, false, Set.of(LEARNED_CLASSIC));
        assertEquals("Channel 24 · 2 days ago", learned.toString());
        assertEquals(count, attachedViewCount(learned));

        CharSequence ageHidden = transformSubtitle(CLASSIC, text, true, false, true, Set.of());
        assertEquals("Channel 24 · 4.7M views", ageHidden.toString());
        assertEquals(count, attachedViewCount(ageHidden));

        CharSequence ageHiddenWithBadge = transformSubtitle(CLASSIC, text, true, false, true,
                Set.of(LEARNED_CLASSIC));
        assertEquals("Channel 24", ageHiddenWithBadge.toString());
        assertEquals(count, attachedViewCount(ageHiddenWithBadge));

        CharSequence viewsHidden = transformSubtitle(CLASSIC, text, true, true, false, Set.of());
        assertEquals("Channel 24 · 2 days ago", viewsHidden.toString());
        assertEquals(count, attachedViewCount(viewsHidden));

        CharSequence hidden = transformSubtitle(CLASSIC, text, true, true, true, Set.of());
        assertEquals("Channel 24", hidden.toString());
        assertEquals(count, attachedViewCount(hidden));
        assertSame(hidden, transformSubtitle(CLASSIC, hidden, true, true, true, Set.of()));
        assertNull(attachedViewCount(hide(CLASSIC, new SpannableString(FULL), true, true)));

        CharSequence emptyRow = transformSubtitle(MODERN, "4.7M views · 2 days ago", true, true, true, Set.of());
        assertEquals("\u200b", emptyRow.toString());
        assertEquals(count, attachedViewCount(emptyRow));
    }

    @Test
    public void otherSurfacesAndAmbiguousRolesStayUnchanged() {
        SpannableString text = new SpannableString(FULL);
        for (String path : new String[]{null, HEADER + "TextType|", HEADER,
                "page_header.eml-fe|c0|ContainerType|content_metadata.eml-fe|c1|TextType|",
                "horizontal_shelf.eml-fe|c2|" + MODERN,
                MODERN.replace("TextType|", "badge.eml-fe|c3|ContainerType|TextType|"),
                CLASSIC.replace("TextType|", "video_lockup_attachments.eml-fe|c4|TextType|")}) {
            assertSame(text, hide(path, text, true, true));
        }
        for (String content : new String[]{"Channel · 4.7M · 2 days ago", "Channel · 26 episodes · Nov 11, 2024",
                "Channel · 24 watching", "Channel · 24 watching · Scheduled for Nov 11, 2024",
                "Channel · 2 days ago · 4.7M views · description", "Channel · 4.7M views ·", "· 2 days ago"}) {
            assertSame(content, hide(MODERN, content, true, true));
        }

        String splitDirection = "\u2067Channel · 123 views\u2069 · 2 days ago";
        assertSame(splitDirection, hide(CLASSIC, splitDirection, true, true));
        // A clickable range crossing the requested edit must not be truncated or reassigned.
        setSpan(text, new URLSpan("https://www.youtube.com/@example"), 0, 20);
        assertSame(text, hide(CLASSIC, text, true, false));
    }

    private static CharSequence hide(String path, CharSequence text, boolean views, boolean age) {
        return transformSubtitle(path, text, false, views, age, Set.of());
    }

    private static void setSpan(SpannableString text, Object span, int start, int end) {
        text.setSpan(span, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    private static ImageSpan icon(SpannableString text, int start) {
        ColorDrawable drawable = new ColorDrawable(Color.WHITE);
        drawable.setBounds(0, 0, 4, 4);
        ImageSpan span = new ImageSpan(drawable);
        setSpan(text, span, start, start + 1);
        return span;
    }
}
