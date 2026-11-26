/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.extension.music.patches.utils;

import android.graphics.Color;
import android.graphics.Typeface;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.URLSpan;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE)
public class MusicLightThemeElementsTest {
    private static final String SHELF = "music_speed_dial_shelf.eml-js-fe|27cb8c57bfa90fa6|CellType|";
    private static final String TILE = "music_speed_dial_item.eml-fe|25ac56eecf77073|CellType|";
    private static final String TITLE = "ContainerType|ContainerType|ContainerType|TextType|";

    @Before
    public void enableLight() {
        setStartupTheme(MusicLightTheme.VALUE);
    }

    @After
    public void resetTheme() {
        setStartupTheme(null);
    }

    @Test
    public void speedDialTitleReplacesOnlyTheStockForeground() {
        SpannableString stock = new SpannableString("Liked Music");
        ForegroundColorSpan stockForeground = new ForegroundColorSpan(Color.WHITE);
        StyleSpan bold = new StyleSpan(Typeface.BOLD);
        stock.setSpan(stockForeground, 0, stock.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        stock.setSpan(bold, 0, 5, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);

        Spanned title = (Spanned) style(SHELF + TILE + TITLE, stock);
        assertEquals(stock.toString(), title.toString());
        ForegroundColorSpan[] colors = title.getSpans(0, title.length(), ForegroundColorSpan.class);
        assertEquals(1, colors.length);
        assertEquals(MusicLightTheme.FOREGROUND, colors[0].getForegroundColor());
        assertEquals(0, title.getSpanStart(colors[0]));
        assertEquals(title.length(), title.getSpanEnd(colors[0]));
        assertEquals(5, title.getSpanEnd(bold));
        assertEquals(Spanned.SPAN_INCLUSIVE_EXCLUSIVE, title.getSpanFlags(bold));
        assertEquals(0, stock.getSpanStart(stockForeground));
    }

    @Test
    public void speedDialMatchesPlainTitlesAcrossHashesButLeavesOtherNodesAlone() {
        String text = "Track title";
        String titlePath = SHELF + TILE + TITLE;
        Spanned title = (Spanned) style(titlePath, text);
        assertEquals(MusicLightTheme.FOREGROUND,
                title.getSpans(0, title.length(), ForegroundColorSpan.class)[0].getForegroundColor());
        assertSame(text, style(SHELF + "music_shelf_header.eml-fe|abc|CellType|TextType|", text));
        assertSame(text, style(SHELF + TILE + "ContainerType|ContainerType|ContainerType|ImageType|", text));
        assertSame(text, style("other_shelf.eml-fe|abc|CellType|" + TILE + TITLE, text));

        setStartupTheme("dark");
        assertSame(text, style(titlePath, text));
    }

    @Test
    public void onlyTheCommentsFooterGetsLightFillsAndHint() {
        FrameLayout wrapper = new FrameLayout(RuntimeEnvironment.getApplication());
        View presenter = new View(wrapper.getContext());
        View other = new View(wrapper.getContext());
        wrapper.addView(presenter);
        wrapper.addView(other);

        String hint = "Share your thoughts…";
        int band = 0xFF212121;
        int pill = 0xFF363636;
        int logo = 0xFF002040;
        MusicLightTheme.markCommentComposer(wrapper, "music-comment-panel");
        assertEquals(MusicLightTheme.SURFACE, MusicLightTheme.styleCommentComposerFill(presenter, band));
        assertEquals(MusicLightTheme.CONTROL_SURFACE, MusicLightTheme.styleCommentComposerFill(presenter, pill));
        assertEquals(logo, MusicLightTheme.styleCommentComposerFill(presenter, logo));
        assertEquals(0x80212121, MusicLightTheme.styleCommentComposerFill(presenter, 0x80212121));
        assertEquals(pill, MusicLightTheme.styleCommentComposerFill(other, pill));
        assertSame(hint, MusicLightTheme.styleElementsText(null, other, hint));
        Spanned styledHint = (Spanned) MusicLightTheme.styleElementsText(null, presenter, hint);
        assertEquals(hint, styledHint.toString());
        assertEquals(0xFF41464C,
                styledHint.getSpans(0, hint.length(), ForegroundColorSpan.class)[0].getForegroundColor());

        MusicLightTheme.markCommentComposer(wrapper, "other-panel");
        assertEquals(pill, MusicLightTheme.styleCommentComposerFill(presenter, pill));
        assertSame(hint, MusicLightTheme.styleElementsText(null, presenter, hint));
    }

    @Test
    public void expandedCommentEditorKeepsDisclosureLinksReadableAndClickable() {
        FrameLayout wrapper = new FrameLayout(RuntimeEnvironment.getApplication());
        View editor = new View(wrapper.getContext());
        wrapper.addView(editor);
        MusicLightTheme.markExpandedCommentComposer(wrapper);

        assertEquals(MusicLightTheme.SURFACE, MusicLightTheme.styleCommentComposerFill(editor, 0xFF212121));
        assertEquals(MusicLightTheme.CONTROL_SURFACE, MusicLightTheme.styleCommentComposerFill(editor, 0x1AFFFFFF));
        assertEquals(Color.RED, MusicLightTheme.styleCommentComposerFill(editor, Color.RED));

        SpannableString disclosure = new SpannableString("Read these terms");
        URLSpan link = new URLSpan("https://example.org/terms");
        int flags = Spanned.SPAN_EXCLUSIVE_INCLUSIVE;
        disclosure.setSpan(link, 11, 16, flags);
        disclosure.setSpan(new ForegroundColorSpan(0xFF3EA6FF), 11, 16, flags);
        assertSame(disclosure, MusicLightTheme.styleElementsText(null, wrapper, disclosure));

        Spanned result = (Spanned) MusicLightTheme.styleElementsText(null, editor, disclosure);
        assertSame(link, result.getSpans(11, 16, URLSpan.class)[0]);
        ForegroundColorSpan foreground = result.getSpans(11, 16, ForegroundColorSpan.class)[0];
        assertEquals(0xFF065FD4, foreground.getForegroundColor());
        assertEquals(11, result.getSpanStart(foreground));
        assertEquals(16, result.getSpanEnd(foreground));
        assertEquals(flags, result.getSpanFlags(foreground));

        setStartupTheme("modern_youtube");
        assertSame(disclosure, MusicLightTheme.styleElementsText(null, editor, disclosure));
        assertEquals(0xFF212121, MusicLightTheme.styleCommentComposerFill(editor, 0xFF212121));
    }

    private static CharSequence style(String path, CharSequence text) {
        return MusicLightTheme.styleElementsText(new StringBuilder(path), null, text);
    }

    private static void setStartupTheme(String value) {
        ReflectionHelpers.setStaticField(MusicLightTheme.class, "startupTheme", value);
    }
}
