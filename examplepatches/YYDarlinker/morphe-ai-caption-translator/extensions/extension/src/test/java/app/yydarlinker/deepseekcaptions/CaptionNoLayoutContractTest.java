package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/**
 * The transition path may scale and translate, but must never ask the overlay subtree to measure or
 * lay out. The counting Views below are the same anchor/TextView pair the production method uses;
 * the surface's matrix is the only moving input.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w2736dp-h1264dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionNoLayoutContractTest {
    private static final int SCREEN_WIDTH = 2736;
    private static final int SCREEN_HEIGHT = 1264;

    private Activity activity;

    @Before
    public void resetGlyph() {
        CaptionOverlay.resetGlyphForTests();
    }

    @After
    public void tearDown() {
        if (activity != null) activity.finish();
        CaptionPlayerAuthority.resetForTests();
        CaptionOverlay.layoutGlyphInkPx = 0f;
        CaptionOverlay.resetGlyphForTests();
    }

    static final class CountingAnchor extends FrameLayout {
        int layouts, measures;

        CountingAnchor(Context context) {
            super(context);
        }

        @Override
        public void requestLayout() {
            layouts++;
            super.requestLayout();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            measures++;
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        void reset() {
            layouts = 0;
            measures = 0;
        }
    }

    static final class CountingText extends TextView {
        int layouts, measures;

        CountingText(Context context) {
            super(context);
        }

        @Override
        public void requestLayout() {
            layouts++;
            super.requestLayout();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            measures++;
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        void reset() {
            layouts = 0;
            measures = 0;
        }
    }

    @Test
    public void thirtyAnchorAndSurfaceMatrixChangesDoNotLayoutTheOverlay() {
        CaptionPlayerAuthority.resetForTests();
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        activity.getResources().getDisplayMetrics().widthPixels = SCREEN_WIDTH;
        activity.getResources().getDisplayMetrics().heightPixels = SCREEN_HEIGHT;

        FrameLayout content = new FrameLayout(activity);
        activity.setContentView(content);
        CountingAnchor anchor = new CountingAnchor(activity);
        CountingText text = new CountingText(activity);
        text.setText("字幕尺寸同步测试");
        text.setTextSize(
                TypedValue.COMPLEX_UNIT_PX,
                SubtitleStyleMetrics.textSizePxForGlyphHeight(text.getPaint(), 55.5f));
        anchor.addView(text, new FrameLayout.LayoutParams(1000, 200));
        content.addView(anchor, new FrameLayout.LayoutParams(1000, 200));
        View surface = new View(activity);
        content.addView(surface, new FrameLayout.LayoutParams(2247, 1264));
        content.measure(
                View.MeasureSpec.makeMeasureSpec(SCREEN_WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(SCREEN_HEIGHT, View.MeasureSpec.EXACTLY));
        content.layout(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        // The production render/advance path fills this at layout commit; this test calls the
        // per-frame scale method directly, so seed the same cache here.
        CaptionOverlay.layoutGlyphInkPx =
                SubtitleStyleMetrics.measuredGlyphHeightPx(text.getPaint());

        anchor.reset();
        text.reset();
        for (int i = 0; i < 30; i++) {
            float t = i / 29f;
            float anchorScale = 1f - .08f * t;
            float surfaceScale = 1f - (1f - 9f / 16f) * t;
            anchor.setScaleX(anchorScale);
            anchor.setScaleY(anchorScale);
            anchor.setTranslationX(i);
            anchor.setTranslationY(i * .5f);
            surface.setScaleX(surfaceScale);
            surface.setScaleY(surfaceScale);
            surface.setTranslationX(i);
            CaptionOverlay.applyCommentScale(activity, anchor, surface, text, 2);
        }

        assertEquals("requestLayout must not reach the anchor", 0, anchor.layouts);
        assertEquals("requestLayout must not reach the TextView", 0, text.layouts);
        assertEquals("the anchor must not be measured", 0, anchor.measures);
        assertEquals("the TextView must not be measured", 0, text.measures);
        assertTrue(
                "the loop must actually change the applied scale",
                Math.abs(text.getScaleX() - 1f) > .01f);
    }

    static final class CountingPaint extends TextPaint {
        int boundsCalls;

        @Override
        public void getTextBounds(String text, int start, int end, Rect bounds) {
            boundsCalls++;
            super.getTextBounds(text, start, end, bounds);
        }
    }

    static final class PaintCountingText extends TextView {
        private CountingPaint countingPaint;

        PaintCountingText(Context context) {
            super(context);
        }

        @Override
        public TextPaint getPaint() {
            // TextView's constructor may call getPaint() before this field is initialized.
            if (countingPaint == null) countingPaint = new CountingPaint();
            return countingPaint;
        }

        CountingPaint countingPaint() {
            getPaint();
            return countingPaint;
        }
    }

    @Test
    public void thirtyScaleApplicationsReadTheCachedInkHeightWithoutMeasuringThePaint() {
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        activity.getResources().getDisplayMetrics().widthPixels = SCREEN_WIDTH;
        activity.getResources().getDisplayMetrics().heightPixels = SCREEN_HEIGHT;
        PaintCountingText text = new PaintCountingText(activity);
        text.setText("缓存测试");
        text.layout(0, 0, 1000, 200);
        FrameLayout anchor = new FrameLayout(activity);
        anchor.layout(0, 0, 1000, 200);
        View surface = new View(activity);
        surface.layout(0, 0, 2247, 1264);

        // This is what render()/advancePreparedPage() write at layout commit.
        CaptionOverlay.layoutGlyphInkPx = 55.5f;
        CountingPaint paint = text.countingPaint();
        paint.boundsCalls = 0;
        for (int i = 0; i < 30; i++) {
            float t = i / 29f;
            float anchorScale = 1f - .08f * t;
            float surfaceScale = 1f - (1f - 9f / 16f) * t;
            anchor.setScaleX(anchorScale);
            anchor.setScaleY(anchorScale);
            anchor.setTranslationX(i);
            surface.setScaleX(surfaceScale);
            surface.setScaleY(surfaceScale);
            surface.setTranslationX(i);
            CaptionOverlay.applyCommentScale(activity, anchor, surface, text, 2);
        }

        assertEquals(
                "applyCommentScale must read the cached ink height, not measure the Paint",
                0,
                paint.boundsCalls);
        assertEquals(55.5f, CaptionOverlay.layoutGlyphInkPx, 0f);
    }
}
