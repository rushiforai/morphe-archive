/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.music.patches.lyrics.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.style.ForegroundColorSpan;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

import java.util.Collections;
import java.util.List;

import app.morphe.extension.music.patches.lyrics.Lyrics;
import app.morphe.extension.music.patches.lyrics.LyricsLine;
import app.morphe.extension.music.patches.lyrics.Word;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class LyricsTranslationRenderingTest {
    private static final String TRANSLATION = "Take it to the dance hall";
    private static final int BLOCK_WIDTH = 900;
    private static final int EXPECTED_ACTIVE_ALPHA = 204;
    private static final int EXPECTED_STOCK_IDLE_ALPHA = 170;

    private Context context;
    private int foreground = Color.WHITE;
    private int secondary = 0xFFAAAAAA;

    @Before
    @SuppressWarnings("deprecation")
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "9.40.51";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);

        Resources base = app.getResources();
        Resources palette = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String packageName) {
                return switch (name) {
                    case "ytm_text_color_primary" -> 1;
                    case "ytm_text_color_secondary" -> 2;
                    case "ytm_text_color_secondary_translucent" -> 3;
                    default -> super.getIdentifier(name, type, packageName);
                };
            }

            @Override
            public int getColor(int id) {
                return switch (id) {
                    case 1 -> foreground;
                    case 2 -> secondary;
                    case 3 -> 0xAAFFFFFF;
                    default -> super.getColor(id);
                };
            }
        };
        context = new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return palette;
            }
        };
        Utils.setContext(context);
        LyricsColors.invalidate();
        Settings.LYRICS_RUBY.save(false);
        Settings.LYRICS_SWAP_TRANS_ROMA.save(false);
    }

    @Test
    public void translatedChorusFollowsEachOriginalBeforeDuringAndAfterItsOwnWindow() {
        for (boolean splitBackground : new boolean[]{false, true}) {
            for (boolean wordSync : new boolean[]{false, true}) {
                Settings.LYRICS_SPLIT_BACKGROUND.save(splitBackground);
                Settings.LYRICS_WORD_SYNC.save(wordSync);
                Fixture fixture = new Fixture(LyricsPanelView.OnlyMode.NONE, false);
                fixture.assertRenderedAt(999, -1, EXPECTED_STOCK_IDLE_ALPHA);
                fixture.assertRenderedAt(1_800, 0, EXPECTED_STOCK_IDLE_ALPHA);
                fixture.assertRenderedAt(3_000, 1, EXPECTED_STOCK_IDLE_ALPHA);
                fixture.assertRenderedAt(4_200, 2, EXPECTED_STOCK_IDLE_ALPHA);
                fixture.assertRenderedAt(4_650, -1, EXPECTED_STOCK_IDLE_ALPHA);
                fixture.bind(1);
                fixture.assertRenderedAt(3_000, 1, EXPECTED_STOCK_IDLE_ALPHA);
            }
        }
    }

    @Test
    public void translationWithInlineSyllableReadingsUsesTheSameWindowAndOpacity() {
        Settings.LYRICS_WORD_SYNC.save(true);
        Settings.LYRICS_SPLIT_BACKGROUND.save(false);
        Fixture fixture = new Fixture(LyricsPanelView.OnlyMode.NONE, true);
        assertTrue(fixture.row(0).showSyllableRomanization);
        fixture.assertRenderedAt(1_800, 0, EXPECTED_STOCK_IDLE_ALPHA);
        fixture.assertRenderedAt(3_000, 1, EXPECTED_STOCK_IDLE_ALPHA);
        fixture.assertRenderedAt(4_650, -1, EXPECTED_STOCK_IDLE_ALPHA);
        fixture.assertRenderedAt(1_800, 0, EXPECTED_STOCK_IDLE_ALPHA);
    }

    @Test
    public void adjacentReadingKeepsItsOwnRevealAndTranslationKeepsTranslucentLightThemeAlpha() {
        foreground = Color.BLACK;
        secondary = 0x66333333;
        LyricsColors.invalidate();
        Settings.LYRICS_WORD_SYNC.save(false);
        Settings.LYRICS_SPLIT_BACKGROUND.save(false);
        Fixture fixture = new Fixture(LyricsPanelView.OnlyMode.NONE, true);
        LyricsLineView row = fixture.row(0);
        assertTrue(row.romaStart >= 0);
        row.romaReveal = 0f;

        fixture.assertRenderedAt(999, -1, 0x66);
        fixture.assertRenderedAt(1_800, 0, 0x66);
        Bitmap rendered = draw(row);
        try {
            Layout layout = row.getLayout();
            int readingLine = layout.getLineForOffset(row.romaStart);
            int ink = peakInk(rendered, layout.getLineTop(readingLine), layout.getLineBottom(readingLine));
            assertEquals(0, Color.alpha(ink));
        } finally {
            rendered.recycle();
        }
    }

    @Test
    public void translationOnlyKeepsTheMainLineEmphasis() {
        Settings.LYRICS_SPLIT_BACKGROUND.save(false);
        for (boolean wordSync : new boolean[]{false, true}) {
            Settings.LYRICS_WORD_SYNC.save(wordSync);
            Fixture fixture = new Fixture(LyricsPanelView.OnlyMode.TRANS, false);
            fixture.assertRenderedAt(1_800, 0, 89);
            fixture.assertRenderedAt(3_000, 1, 89);
            fixture.assertRenderedAt(4_650, -1, 89);
        }
    }

    private static LyricsLine echo(long start, boolean withReading) {
        String first = withReading ? "歌う" : "Toma, toma";
        String second = withReading ? "ね" : "no bailão";
        return new LyricsLine(start, 4_650, first + " " + second, List.of(
                new Word(start, start + 500, first, withReading ? "utau" : null, true),
                new Word(start + 500, start + 1_000, second, withReading ? "ne" : null, false)));
    }

    /** Binds real composed lyric text and drives the panel's playback update without a player or network. */
    private final class Fixture {
        private final LyricsPanelView panel = new LyricsPanelView(context);
        private final List<TextView> views = ReflectionHelpers.getField(panel, "lineViews");
        private final List<List<LyricsSpanBuilder.WordTiming>> spans = ReflectionHelpers.getField(panel,
                "lineWordSpans");
        private final List<Integer> originalStarts = ReflectionHelpers.getField(panel, "lineOriginalStarts");
        private final List<ForegroundColorSpan> unsung = ReflectionHelpers.getField(panel, "lineUnsungSpans");
        private final List<String> translations = Collections.nCopies(3, TRANSLATION);
        private final Lyrics lyrics;
        private final LyricsPanelView.OnlyMode mode;
        private final boolean withReading;

        Fixture(LyricsPanelView.OnlyMode mode, boolean withReading) {
            this.mode = mode;
            this.withReading = withReading;
            List<LyricsLine> lines = List.of(
                    echo(1_000, withReading), echo(2_200, withReading), echo(3_400, withReading));
            lyrics = new Lyrics(lines, "Test", true, null, null, null, null, null, null, null);
            boolean[] grouped = {false, true, true};
            ReflectionHelpers.setField(panel, "echoWindows", LyricsEchoTiming.buildWindows(lines, grouped));
            for (int index = 0; index < lines.size(); index++) {
                LyricsLineView view = new LyricsLineView(context);
                view.setLayoutParams(new ViewGroup.LayoutParams(BLOCK_WIDTH, ViewGroup.LayoutParams.WRAP_CONTENT));
                view.setSecondary(grouped[index]);
                view.setParentLineIndex(0);
                view.setIncludeFontPadding(false);
                view.setTextSize(TypedValue.COMPLEX_UNIT_PX, 48);
                view.setTypeface(Typeface.DEFAULT_BOLD);
                if (grouped[index]) {
                    view.animateSecondaryExpansion(true, true);
                }
                views.add(view);
                spans.add(List.of());
                originalStarts.add(0);
                unsung.add(null);
                bind(index);
            }
        }

        void bind(int index) {
            LyricsLineView view = row(index);
            boolean only = mode != LyricsPanelView.OnlyMode.NONE;
            List<LyricsSpanBuilder.WordTiming> timings = LyricsSpanBuilder.computeWordTimings(lyrics.lines(),
                    index, only);
            LyricsSpanBuilder.BuildResult result = LyricsSpanBuilder.buildLineText(lyrics.lines().get(index),
                    timings, index, withReading, null, translations, mode, view.getPaint(), false);
            LyricsSpanBuilder.PresentedLine presentation = LyricsSpanBuilder.present(result,
                    LyricsViewSupport.wordSpansFor(result, only, timings));
            result = presentation.display();
            view.setText(result.text());
            view.setTranslationBounds(result.transStart(), result.transEnd());
            boolean perWordReading = result.readingSpans() != null && !result.readingSpans().isEmpty();
            view.setRomanizationBounds(result.romaStart(), result.romaEnd(),
                    perWordReading, result.showSyllableRomanization());
            view.setSmallRunHoldsWords(result.smallRunHoldsWords());
            spans.set(index, presentation.words());
            originalStarts.set(index, presentation.originalStart());
            unsung.set(index, result.unsungSpan());
        }

        LyricsLineView row(int index) {
            return (LyricsLineView) views.get(index);
        }

        void assertRenderedAt(long position, int activeIndex, int idleAlpha) {
            // The repeat group is open; its lead selection must not decide which individual text lights.
            ReflectionHelpers.callInstanceMethod(panel, "updateVocalLines",
                    ClassParameter.from(long.class, position), ClassParameter.from(Lyrics.class, lyrics),
                    ClassParameter.from(int.class, 0),
                    ClassParameter.from(boolean.class, Settings.LYRICS_WORD_SYNC.get()));

            for (int index = 0; index < views.size(); index++) {
                LyricsLineView view = row(index);
                boolean active = index == activeIndex;
                String detail = "Row " + index + " at " + position + " ms";
                assertEquals(detail, active, view.activeLine);
                assertEquals(view.isSecondary() && Settings.LYRICS_SPLIT_BACKGROUND.get() ? 0.8f : 1f,
                        view.getAlpha(), 0.001f);

                Bitmap bitmap = draw(view);
                try {
                    int translationTop;
                    if (view.showSyllableRomanization) {
                        Object layout = ReflectionHelpers.getField(view, "syllableCache");
                        assertNotNull("The inline layout must be used", layout);
                        translationTop = ReflectionHelpers.getField(layout, "transTopY");
                    } else {
                        Layout layout = view.getLayout();
                        translationTop = layout.getLineTop(layout.getLineForOffset(view.transStart));
                    }
                    int ink = peakInk(bitmap, translationTop, view.getHeight());
                    int translationAlpha = Color.alpha(ink);
                    if (active && mode == LyricsPanelView.OnlyMode.TRANS) {
                        // Karaoke may paint the bright main-line layer over its unsung base.
                        assertTrue(detail + " translation alpha " + translationAlpha,
                                translationAlpha >= Math.round(255f * view.lineAlpha) - 2);
                    } else {
                        int expected = Math.round((active ? EXPECTED_ACTIVE_ALPHA : idleAlpha) * view.lineAlpha);
                        assertEquals(detail + " translation alpha", expected, translationAlpha, 2);
                    }
                    int translationTint = view.showSyllableRomanization && !active ? secondary : foreground;
                    assertEquals(detail + " translation tint", Color.red(translationTint), Color.red(ink), 2);

                    if (mode != LyricsPanelView.OnlyMode.TRANS && !view.showSyllableRomanization) {
                        int originalInk = peakInk(bitmap, 0, view.getLayout().getLineBottom(0));
                        int original = Color.alpha(originalInk);
                        assertTrue(detail + " original alpha " + original, active ? original > 155 : original < 95);
                    }
                } finally {
                    bitmap.recycle();
                }
            }
        }
    }

    private static Bitmap draw(LyricsLineView view) {
        view.measure(View.MeasureSpec.makeMeasureSpec(BLOCK_WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
        Bitmap bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
        view.draw(new Canvas(bitmap));
        return bitmap;
    }

    private static int peakInk(Bitmap bitmap, int top, int bottom) {
        int peak = Color.TRANSPARENT;
        int width = bitmap.getWidth();
        int[] pixels = new int[width * (bottom - top)];
        bitmap.getPixels(pixels, 0, width, 0, top, width, bottom - top);
        for (int pixel : pixels) {
            if (Color.alpha(pixel) > Color.alpha(peak)) {
                peak = pixel;
            }
        }
        return peak;
    }
}
