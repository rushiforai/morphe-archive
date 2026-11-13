package app.morphe.extension.pinedrama.captions;

import static org.junit.Assert.*;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionToolsTest {
    public static final class CaptionActivity extends android.app.Activity {
        @Override public void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }
    public static final class Video { public String aid; Video(String id) { aid = id; } }
    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        // Start from a fresh process's state rather than from whatever ran before in this fork.
        CaptionTools.resetForTests();
        CaptionStyle.resetLookupsForTests();
        Settings.CAPTION_TEXT_SIZE.save(0);
        Settings.CAPTION_BACKGROUND.save("default");
        Settings.CAPTION_FONT_WEIGHT.save("default");
        Settings.CAPTION_BOTTOM_OFFSET.save(0);
        Settings.CAPTION_LANDSCAPE_OFFSET.save(0);
        Settings.CAPTION_CLEAR_DISPLAY_OFFSET.save(0);
        Settings.KEEP_CAPTIONS_CLEAR_DISPLAY.save(false);
        CaptionTools.onVideoChanged(null);
    }
    @After public void tearDown() {
        CaptionTools.resetForTests();
    }
    @Test public void bothCaptionRenderersResizeAndRestoreWithoutChangingSourceLayout() {
        TextPaint paint = new TextPaint();
        paint.setTextSize(16);
        Layout original = new StaticLayout("A longer caption that wraps at the chosen width", paint, 180, Layout.Alignment.ALIGN_CENTER, 1, 0, true);
        assertSame(original, CaptionStyle.layout(original));
        Settings.CAPTION_TEXT_SIZE.save(32);
        Layout styled = CaptionStyle.layout(original);
        assertTrue(styled.getHeight() > original.getHeight());
        assertEquals(16, original.getPaint().getTextSize(), 0);
        assertEquals(original.getText(), styled.getText());
        // The two ids are obfuscated names in the real APK and only it can resolve them, so
        // the fixture says what they stand for here rather than repeating this build's numbers.
        int textId = View.generateViewId();
        int backgroundId = View.generateViewId();
        CaptionStyle.resolveForTests("47.7.3:bz9", textId);
        CaptionStyle.resolveForTests("47.7.3:bz5", backgroundId);
        FrameLayout root = new FrameLayout(Utils.getContext());
        TextView text = new TextView(Utils.getContext());
        text.setId(textId);
        text.setTextSize(16);
        float originalSize = text.getTextSize();
        FrameLayout background = new FrameLayout(Utils.getContext());
        background.setId(backgroundId);
        background.setBackgroundColor(Color.BLUE);
        root.addView(background);
        background.addView(text);
        Settings.CAPTION_BACKGROUND.save("black");
        CaptionStyle.apply(root);
        assertTrue(text.getTextSize() > originalSize);
        // A strip with no shape of its own still gets PineDrama's rounded corners.
        GradientDrawable painted = (GradientDrawable) background.getBackground();
        assertEquals(Color.BLACK, painted.getColor().getDefaultColor());
        assertEquals(dp(4), painted.getCornerRadius(), 0.01f);
        Settings.CAPTION_TEXT_SIZE.save(0);
        Settings.CAPTION_BACKGROUND.save("default");
        CaptionStyle.apply(root);
        assertEquals(originalSize, text.getTextSize(), 0);
        assertEquals(Color.BLUE, ((ColorDrawable) background.getBackground()).getColor());
        assertSame(original, CaptionStyle.layout(original));
    }
    /**
     * #158: TikTok's caption strip is a rounded rectangle, and a Dark or Black background put a
     * plain color in its place, so the strip came out with square corners. The chosen color now
     * fills a copy of PineDrama's own shape, and PineDrama's shape itself is left as it was.
     */
    @Test public void chosenCaptionBackgroundKeepsTikToksRoundedCorners() {
        int textId = View.generateViewId();
        int backgroundId = View.generateViewId();
        CaptionStyle.resolveForTests("47.7.3:bz9", textId);
        CaptionStyle.resolveForTests("47.7.3:bz5", backgroundId);
        FrameLayout root = new FrameLayout(Utils.getContext());
        FrameLayout strip = new FrameLayout(Utils.getContext());
        strip.setId(backgroundId);
        TextView text = new TextView(Utils.getContext());
        text.setId(textId);
        strip.addView(text);
        root.addView(strip);
        // TikTok's strip on 47.1.4: a solid shape with 4 dp corners.
        GradientDrawable tiktok = new GradientDrawable();
        tiktok.setColor(0xCC4D4D4D);
        tiktok.setCornerRadius(dp(4));
        strip.setBackground(tiktok);

        for (String choice : new String[]{"dark", "black"}) {
            Settings.CAPTION_BACKGROUND.save(choice);
            CaptionStyle.apply(root);
            assertTrue(choice + " drew a square strip", strip.getBackground() instanceof GradientDrawable);
            GradientDrawable painted = (GradientDrawable) strip.getBackground();
            assertNotSame(choice + " recolored PineDrama's shared shape", tiktok, painted);
            assertEquals(choice, CaptionStyle.backgroundColor(), painted.getColor().getDefaultColor());
            assertEquals(choice, dp(4), painted.getCornerRadius(), 0.01f);
        }
        assertEquals("PineDrama's own shape changed color", 0xCC4D4D4D, tiktok.getColor().getDefaultColor());

        // PineDrama sets its own background again on the next render; the chosen one goes back on.
        GradientDrawable again = new GradientDrawable();
        again.setColor(0xCC4D4D4D);
        again.setCornerRadius(dp(4));
        strip.setBackground(again);
        CaptionStyle.apply(root);
        assertEquals(Color.BLACK, ((GradientDrawable) strip.getBackground()).getColor().getDefaultColor());

        Settings.CAPTION_BACKGROUND.save("default");
        CaptionStyle.apply(root);
        GradientDrawable restored = (GradientDrawable) strip.getBackground();
        assertEquals(0xCC4D4D4D, restored.getColor().getDefaultColor());
        assertEquals(dp(4), restored.getCornerRadius(), 0.01f);
    }
    /**
     * #158 again: on a reporter's phone the Black strip came out with corners far rounder than
     * PineDrama's own captions, from a copied shape rounder than 4 dp. The painted copy keeps
     * PineDrama's 4 dp, and the native shape keeps its own corners for when the choice goes back.
     */
    @Test public void chosenCaptionBackgroundUsesTikToksCornersWhateverShapeItCopies() {
        int textId = View.generateViewId();
        int backgroundId = View.generateViewId();
        CaptionStyle.resolveForTests("47.7.3:bz9", textId);
        CaptionStyle.resolveForTests("47.7.3:bz5", backgroundId);
        FrameLayout root = new FrameLayout(Utils.getContext());
        FrameLayout strip = new FrameLayout(Utils.getContext());
        strip.setId(backgroundId);
        TextView text = new TextView(Utils.getContext());
        text.setId(textId);
        strip.addView(text);
        root.addView(strip);
        GradientDrawable round = new GradientDrawable();
        round.setColor(0xCC4D4D4D);
        round.setCornerRadius(dp(16));
        strip.setBackground(round);

        Settings.CAPTION_BACKGROUND.save("black");
        CaptionStyle.apply(root);
        GradientDrawable painted = (GradientDrawable) strip.getBackground();
        assertNotSame(round, painted);
        assertEquals(dp(4), painted.getCornerRadius(), 0.01f);
        assertEquals("PineDrama's own shape lost its corners", dp(16), round.getCornerRadius(), 0.01f);

        Settings.CAPTION_BACKGROUND.save("default");
        CaptionStyle.apply(root);
        assertEquals(dp(16), ((GradientDrawable) strip.getBackground()).getCornerRadius(), 0.01f);
    }
    private static float dp(float value) {
        return value * Utils.getContext().getResources().getDisplayMetrics().density;
    }
    /**
     * TikTok draws spoken captions bold, and #158 asked for them at normal weight. Caption
     * boldness (#206) redraws the cue at the chosen weight on its own, at TikTok's size, and
     * PineDrama's own paint keeps its bold.
     */
    @Test public void captionBoldnessDrawsTheChosenWeightAtTikToksSize() {
        TextPaint paint = new TextPaint();
        paint.setTextSize(16);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setFakeBoldText(true);
        Layout original = new StaticLayout("I think about leaving sometimes.", paint, 600,
                Layout.Alignment.ALIGN_CENTER, 1, 0, true);
        assertSame(original, CaptionStyle.layout(original));
        try {
            for (int weight : new int[] {300, 400, 800}) {
                Settings.CAPTION_FONT_WEIGHT.save(String.valueOf(weight));
                Layout styled = CaptionStyle.layout(original);
                assertNotSame(original, styled);
                assertEquals(original.getText(), styled.getText());
                assertEquals("PineDrama's size changed", 16, styled.getPaint().getTextSize(), 0);
                assertFalse(styled.getPaint().isFakeBoldText());
                assertEquals(weight, styled.getPaint().getTypeface().getWeight());
                assertTrue(styled.getPaint().getFontVariationSettings(),
                        styled.getPaint().getFontVariationSettings().startsWith("'wght' " + weight + ", 'opsz' "));
            }
            assertTrue("PineDrama's own paint lost its bold", original.getPaint().isFakeBoldText());
            assertTrue(original.getPaint().getTypeface().isBold());
        } finally {
            Settings.CAPTION_FONT_WEIGHT.save("default");
        }
        assertSame(original, CaptionStyle.layout(original));
    }

    /** A weight the picker can't have written, from a hand-edited backup say, is PineDrama's own. */
    @Test public void aWeightThePickerCantWriteIsTikToksOwn() {
        try {
            for (String value : new String[] {"default", "bold", "", "50", "950", "-400"}) {
                Settings.CAPTION_FONT_WEIGHT.save(value);
                assertEquals(value, 0, CaptionStyle.fontWeight());
            }
            Settings.CAPTION_FONT_WEIGHT.save(" 600 ");
            assertEquals(600, CaptionStyle.fontWeight());
        } finally {
            Settings.CAPTION_FONT_WEIGHT.save("default");
        }
    }

    /**
     * #206: Caption height lifts the caption's container by a translation, on top of whatever
     * translation PineDrama gave it, and gives all of it back when the height goes to 0, so the
     * caption is exactly where PineDrama had it. A group cuts a child off at its own edge when the
     * group's parent clips, so the one that stops clipping is the parent of the wrapper the
     * caption pokes out of (the wrapper's own clip moves with the caption), and the padded wrapper
     * stops clipping at its padding. The page has room above the wrapper, so the window keeps
     * clipping.
     */
    @Test public void captionHeightLiftsTheContainerAndGivesTikToksPlacementBack() {
        FrameLayout window = new FrameLayout(Utils.getContext());
        FrameLayout page = new FrameLayout(Utils.getContext());
        FrameLayout wrapper = new FrameLayout(Utils.getContext());
        FrameLayout root = new FrameLayout(Utils.getContext());
        window.addView(page);
        page.addView(wrapper);
        wrapper.addView(root);
        wrapper.setPadding(0, 8, 0, 0);
        page.layout(0, 0, 1080, 2000);
        wrapper.layout(0, 1000, 1080, 1208);
        root.layout(0, 8, 1080, 208);
        root.setTranslationY(-10);
        root.setTranslationZ(2);
        assertTrue(page.getClipChildren() && wrapper.getClipToPadding());

        Settings.CAPTION_BOTTOM_OFFSET.save(50);
        CaptionStyle.apply(root);
        assertEquals(-10 - Math.round(dp(50)), root.getTranslationY(), 0.01f);
        assertEquals(Math.round(dp(50)), CaptionStyle.liftOf(root));
        assertFalse("the wrapper's parent still cuts the lifted caption off", page.getClipChildren());
        assertFalse("the wrapper still clips at its padding", wrapper.getClipToPadding());
        assertTrue("the wrapper's own clip was changed for nothing", wrapper.getClipChildren());
        assertTrue("the window was unclipped with room to spare", window.getClipChildren());
        assertTrue(root.getTranslationZ() > 2);

        // A render repeats without stacking the lift, and PineDrama moving the container itself keeps
        // the lift on top of PineDrama's new spot.
        CaptionStyle.apply(root);
        assertEquals(-10 - Math.round(dp(50)), root.getTranslationY(), 0.01f);
        root.setTranslationY(-20);
        CaptionStyle.apply(root);
        assertEquals(-20 - Math.round(dp(50)), root.getTranslationY(), 0.01f);
        // A new height replaces the old lift rather than adding to it.
        Settings.CAPTION_BOTTOM_OFFSET.save(120);
        CaptionStyle.apply(root);
        assertEquals(-20 - Math.round(dp(120)), root.getTranslationY(), 0.01f);
        assertEquals(Math.round(dp(120)), CaptionStyle.liftOf(root));

        Settings.CAPTION_BOTTOM_OFFSET.save(0);
        CaptionStyle.apply(root);
        assertEquals("PineDrama's own translation didn't come back", -20, root.getTranslationY(), 0.01f);
        assertEquals(2, root.getTranslationZ(), 0.01f);
        assertTrue("the page didn't get its clipping back", page.getClipChildren());
        assertTrue("the wrapper didn't get its padding clip back", wrapper.getClipToPadding());
        assertEquals(0, CaptionStyle.liftOf(root));

        // The landscape height is its own: upright, it moves nothing.
        Settings.CAPTION_LANDSCAPE_OFFSET.save(80);
        CaptionStyle.apply(root);
        assertEquals(-20, root.getTranslationY(), 0.01f);
    }

    /**
     * Sideways, the landscape height is the one that counts for PineDrama's caption, and the upright
     * one moves nothing. The kept Clear display line still answers only to its own row.
     */
    @Test @Config(qualifiers = "land")
    public void sidewaysTheLandscapeHeightLiftsTheCaption() {
        FrameLayout root = new FrameLayout(Utils.getContext());
        Settings.CAPTION_BOTTOM_OFFSET.save(50);
        CaptionStyle.apply(root);
        assertEquals(0, root.getTranslationY(), 0.01f);
        Settings.CAPTION_LANDSCAPE_OFFSET.save(80);
        CaptionStyle.apply(root);
        assertEquals(-Math.round(dp(80)), root.getTranslationY(), 0.01f);
        assertEquals("the landscape height moved the kept line", 0,
                CaptionStyle.heightPx(root, Settings.CAPTION_CLEAR_DISPLAY_OFFSET));
        Settings.CAPTION_CLEAR_DISPLAY_OFFSET.save(40);
        assertEquals(Math.round(dp(40)), CaptionStyle.heightPx(root, Settings.CAPTION_CLEAR_DISPLAY_OFFSET));
        Settings.CAPTION_LANDSCAPE_OFFSET.save(0);
        CaptionStyle.apply(root);
        assertEquals(0, root.getTranslationY(), 0.01f);
    }

    /**
     * A bigger size kept PineDrama's measured width and split words: "conditio" over "ns." at 28 on
     * the S22. The layout grows with the text now, up to four fifths of the screen, and a line too
     * long for that wraps at a space.
     */
    @Test public void aBiggerCaptionWrapsBetweenWordsNotInsideThem() {
        TextPaint paint = new TextPaint();
        paint.setTextSize(16);
        String word = "conditions";
        Layout original = new StaticLayout(word, paint, (int) Math.ceil(Layout.getDesiredWidth(word, paint)),
                Layout.Alignment.ALIGN_CENTER, 1, 0, true);
        Settings.CAPTION_TEXT_SIZE.save(28);
        Layout styled = CaptionStyle.layout(original);
        assertEquals("the word was split across lines", 1, styled.getLineCount());
        int cap = tiktokCap();
        assertTrue("wider than the strip may be: " + styled.getWidth(), styled.getWidth() <= cap);

        // PineDrama lays a long caption out within its strip, so the column it hands over is never
        // wider than the strip may be; half the cap is a column like that.
        String sentence = "the weather conditions stay unsettled through the weekend across the whole region";
        Layout line = new StaticLayout(sentence, paint, cap / 2, Layout.Alignment.ALIGN_CENTER, 1, 0, true);
        assertTrue("the fixture's column holds the sentence on one line", line.getLineCount() > 1);
        Layout wrapped = CaptionStyle.layout(line);
        assertTrue("the sentence stopped wrapping at the new size", wrapped.getLineCount() > 1);
        assertTrue(wrapped.getWidth() <= cap);
        for (int i = 0; i < wrapped.getLineCount() - 1; i++) {
            int end = wrapped.getLineEnd(i);
            assertEquals("line " + i + " broke inside a word", ' ', sentence.charAt(end - 1));
        }
        Settings.CAPTION_TEXT_SIZE.save(0);
        assertSame(original, CaptionStyle.layout(original));
    }

    /**
     * PineDrama's own limit on a caption is the screen less 100 dp (margins, the rail of buttons);
     * four fifths of the screen, the first cap, went past it on the S22 (864 px against about
     * 818), onto the rail (refutation review of ecf26b6c).
     */
    @Test public void aBiggerCaptionStaysWithinTikToksOwnWidth() {
        assertEquals("grows with the text", 200, CaptionStyle.width(100, 40, 80, 700));
        assertEquals("up to PineDrama's limit", 700, CaptionStyle.width(600, 40, 80, 700));
        assertEquals("never narrower than PineDrama's own", 800, CaptionStyle.width(800, 40, 80, 700));
        assertEquals("a smaller size keeps PineDrama's width", 600, CaptionStyle.width(600, 40, 30, 700));

        TextPaint paint = new TextPaint();
        paint.setTextSize(16);
        String sentence = "the weather conditions stay unsettled";
        int cap = tiktokCap();
        Layout original = new StaticLayout(sentence, paint, cap - 20, Layout.Alignment.ALIGN_NORMAL, 1, 0, true);
        Settings.CAPTION_TEXT_SIZE.save(28);
        try {
            Layout styled = CaptionStyle.layout(original);
            assertTrue("past PineDrama's limit: " + styled.getWidth() + " > " + cap, styled.getWidth() <= cap);
            assertTrue("the grown text did not wrap", styled.getLineCount() > 1);
        } finally {
            Settings.CAPTION_TEXT_SIZE.save(0);
        }
    }

    /**
     * PineDrama sizes the caption view to its layout and builds that layout as wide as its longest
     * line, so the strip behind it fits the text. A layout left wider than its text left an empty
     * band beside it, bigger or smaller than PineDrama's size (refutation review of ecf26b6c).
     */
    @Test public void aRestyledCaptionIsAsWideAsItsLongestLine() {
        TextPaint paint = new TextPaint();
        paint.setTextSize(16);
        String cue = "A replay.";
        Layout original = new StaticLayout(cue, paint, tiktokCap(), Layout.Alignment.ALIGN_NORMAL, 1, 0, true);
        try {
            for (int size : new int[] {28, 12}) {
                Settings.CAPTION_TEXT_SIZE.save(size);
                Layout styled = CaptionStyle.layout(original);
                assertEquals("size " + size + " kept an empty edge beside the text",
                        CaptionStyle.longestLine(styled), styled.getWidth());
                assertEquals("size " + size + " changed the line breaks", 1, styled.getLineCount());
            }
        } finally {
            Settings.CAPTION_TEXT_SIZE.save(0);
        }
    }

    private static int tiktokCap() {
        android.util.DisplayMetrics metrics = Utils.getContext().getResources().getDisplayMetrics();
        return metrics.widthPixels - Math.round(android.util.TypedValue.applyDimension(
                android.util.TypedValue.COMPLEX_UNIT_DIP, 100, metrics));
    }

    @Test public void aBuildWithoutTheCaptionIdsSaysSoOnTheHookStatusRow() {
        HookStatus.clear();
        // What a reshuffled resource table looks like from here: the names resolve to nothing.
        CaptionStyle.resolveForTests("47.7.3:bz9", 0);
        CaptionStyle.resolveForTests("47.7.3:bz5", 0);
        Settings.CAPTION_TEXT_SIZE.save(32);
        Settings.CAPTION_BACKGROUND.save("black");

        CaptionStyle.apply(new FrameLayout(Utils.getContext()));

        assertTrue(HookStatus.anyMissing());
        assertEquals(java.util.Arrays.asList("view id '47.7.3:bz9'", "view id '47.7.3:bz5'"),
                HookStatus.missing("captions"));
        assertTrue(String.join(" ", HookStatus.report()).contains("captions"));
        HookStatus.clear();
    }

    /**
     * The other half of the same defect, and the harder one. The names are assigned by a
     * counter, so a reshuffled resource table is likelier to move a name onto a different view
     * than to drop it: findViewById answers null, both caption settings quietly do nothing, and
     * the Hook status row used to say everything was bound.
     */
    @Test public void anIdThatNamesNothingInTheContainerSaysSoOnTheHookStatusRow() {
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
        // The ids resolve, which is what tells this apart from the case above. They just are
        // not the views in this container.
        CaptionStyle.resolveForTests("47.7.3:bz9", View.generateViewId());
        CaptionStyle.resolveForTests("47.7.3:bz5", View.generateViewId());
        Settings.CAPTION_TEXT_SIZE.save(32);
        Settings.CAPTION_BACKGROUND.save("black");

        FrameLayout root = new FrameLayout(Utils.getContext());
        // A container with something in it, which is what a render that rendered looks like.
        root.addView(new TextView(Utils.getContext()));
        for (int render = 0; render < 40; render++) CaptionStyle.apply(root);

        assertTrue("a build where neither caption view is reachable says nothing",
                HookStatus.anyMissing());
        assertEquals(java.util.Arrays.asList(
                        "view caption container#47.7.3:bz9", "view caption container#47.7.3:bz5"),
                HookStatus.missing("captions"));
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
    }

    /**
     * And the reason the naive version of this was written and reverted on the same day. The
     * hook is injected at every return-void in PineDrama's render method, early bail-outs
     * included, and it runs before the check that this renderer is the video on screen, so an
     * empty container is ordinary. HookStatus never forgets a miss, so reporting one would make
     * the row read broken for the rest of the process on a perfectly healthy build.
     */
    @Test public void anEmptyRendererIsNotAMissHoweverManyTimesItArrives() {
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
        CaptionStyle.resolveForTests("47.7.3:bz9", View.generateViewId());
        CaptionStyle.resolveForTests("47.7.3:bz5", View.generateViewId());
        Settings.CAPTION_TEXT_SIZE.save(32);
        Settings.CAPTION_BACKGROUND.save("black");

        FrameLayout empty = new FrameLayout(Utils.getContext());
        for (int render = 0; render < 100; render++) CaptionStyle.apply(empty);

        assertFalse("a hundred empty renders were reported as a broken build",
                HookStatus.anyMissing());
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
    }

    /** And a build where it works stays quiet through the bail-outs between real renders. */
    @Test public void aWorkingBuildIsNotReportedByTheRendersThatRenderNothing() {
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
        int textId = View.generateViewId();
        int backgroundId = View.generateViewId();
        CaptionStyle.resolveForTests("47.7.3:bz9", textId);
        CaptionStyle.resolveForTests("47.7.3:bz5", backgroundId);
        Settings.CAPTION_TEXT_SIZE.save(32);
        Settings.CAPTION_BACKGROUND.save("black");

        FrameLayout root = new FrameLayout(Utils.getContext());
        FrameLayout background = new FrameLayout(Utils.getContext());
        background.setId(backgroundId);
        TextView text = new TextView(Utils.getContext());
        text.setId(textId);
        root.addView(background);
        background.addView(text);

        FrameLayout bailOut = new FrameLayout(Utils.getContext());
        bailOut.addView(new TextView(Utils.getContext()));
        CaptionStyle.apply(root);
        for (int render = 0; render < 50; render++) CaptionStyle.apply(bailOut);

        assertFalse("the renderers that rendered nothing were called a broken build",
                HookStatus.anyMissing());
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
    }

    /**
     * A container holding the caption but not the strip behind it. This is the likeliest shape
     * of the defect the report exists for: the names are assigned by a counter, so a reshuffle
     * moves one of the two more often than it moves both.
     *
     * <p>Finding one of them is what makes the other one's absence worth reporting rather than
     * a bail-out, because it proves this container really is a caption container. Counting the
     * pair as one thing instead, which is what the first version of this did, made exactly this
     * build unreportable: the working name cleared the count on every render and the broken one
     * never reached the threshold, so the caption background setting did nothing while the Hook
     * status row read clean.
     */
    @Test public void oneCaptionViewFoundIsWhatMakesTheOtherOneWorthReporting() {
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
        int textId = View.generateViewId();
        CaptionStyle.resolveForTests("47.7.3:bz9", textId);
        CaptionStyle.resolveForTests("47.7.3:bz5", View.generateViewId());
        Settings.CAPTION_TEXT_SIZE.save(32);
        Settings.CAPTION_BACKGROUND.save("black");

        FrameLayout root = new FrameLayout(Utils.getContext());
        TextView text = new TextView(Utils.getContext());
        text.setId(textId);
        text.setTextSize(16);
        root.addView(text);
        for (int render = 0; render < 20; render++) CaptionStyle.apply(root);

        assertTrue("the caption was never restyled, so this proves nothing",
                text.getTextSize() > 16);
        assertEquals("the half of the build that works was reported as broken, or the half "
                        + "that does not was not reported at all",
                java.util.Collections.singletonList("view caption container#47.7.3:bz5"),
                HookStatus.missing("captions"));
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
    }

    /**
     * And a run of containers that hold somebody else's children before the first real render.
     * The hook fires for renderers that are not the video on screen, so which arrives first is
     * not this code's to choose, and HookStatus never forgets: one report and the row reads
     * broken for the rest of the process while the feature works.
     */
    @Test public void aRunOfForeignContainersBeforeTheFirstRealRenderIsForgivenOnceItArrives() {
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
        int textId = View.generateViewId();
        int backgroundId = View.generateViewId();
        CaptionStyle.resolveForTests("47.7.3:bz9", textId);
        CaptionStyle.resolveForTests("47.7.3:bz5", backgroundId);
        Settings.CAPTION_TEXT_SIZE.save(32);
        Settings.CAPTION_BACKGROUND.save("black");

        FrameLayout foreign = new FrameLayout(Utils.getContext());
        foreign.addView(new TextView(Utils.getContext()));
        for (int render = 0; render < 39; render++) CaptionStyle.apply(foreign);
        assertFalse("thirty-nine strangers were already enough to call the build broken",
                HookStatus.anyMissing());

        FrameLayout real = new FrameLayout(Utils.getContext());
        FrameLayout background = new FrameLayout(Utils.getContext());
        background.setId(backgroundId);
        TextView text = new TextView(Utils.getContext());
        text.setId(textId);
        real.addView(background);
        background.addView(text);
        CaptionStyle.apply(real);

        for (int render = 0; render < 40; render++) CaptionStyle.apply(foreign);
        assertFalse("one good render did not clear what the strangers had counted up",
                HookStatus.anyMissing());
        HookStatus.clear();
        CaptionStyle.resetLookupsForTests();
    }

    private static void lay(View decor) {
        layAt(decor, decor.getResources().getDisplayMetrics().heightPixels);
    }

    private static void layAt(View decor, int height) {
        int width = decor.getResources().getDisplayMetrics().widthPixels;
        decor.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, width, height);
    }

    private static int bottom(View view) {
        int[] at = new int[2];
        view.getLocationInWindow(at);
        return at[1] + view.getHeight();
    }

    private static TextView find(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return (TextView) view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            TextView found = find(((ViewGroup) view).getChildAt(i), text);
            if (found != null) return found;
        }
        return null;
    }
}
