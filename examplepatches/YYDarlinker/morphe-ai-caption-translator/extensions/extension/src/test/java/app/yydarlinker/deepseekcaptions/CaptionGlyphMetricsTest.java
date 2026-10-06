package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.graphics.Paint;
import android.graphics.Typeface;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionGlyphMetricsTest {
    @Test public void currentFontCalibrationHitsBothPixelAnchorsWithoutChangingPaint() {
        for (Typeface font : new Typeface[]{Typeface.DEFAULT,Typeface.SERIF,Typeface.MONOSPACE}) {
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setTypeface(font);paint.setTextSize(37);
            for (float target : new float[]{34f,39f,44.5f,50f,56f,55.5f,69.8427f}) {
                float size = SubtitleStyleMetrics.textSizePxForGlyphHeight(paint,target);
                assertEquals(37,paint.getTextSize(),.001f);
                Paint rendered = new Paint(paint);rendered.setTextSize(size);
                assertEquals(target,SubtitleStyleMetrics.measuredGlyphHeightPx(rendered),.5f);
                assertTrue(SubtitleStyleMetrics.fontMetricsHeightPx(rendered)>0);
            }
        }
    }

    @Test public void fiveTiersHaveMeasuredBilibiliAnchorsAndPortableScreenRatios() {
        float[] detail = {34f,39f,44.5f,50f,56f};
        assertEquals(5,CaptionFontSize.COUNT);
        assertEquals(2,CaptionFontSize.DEFAULT_TIER);
        for (int tier=0;tier<detail.length;tier++) {
            float full=detail[tier]*55.5f/44.5f;
            assertEquals(detail[tier],CaptionFontSize.detailGlyphHeightPx(tier),.0001f);
            assertEquals(full,CaptionFontSize.fullScreenGlyphHeightPx(tier),.0001f);
            assertEquals(detail[tier]/1264f,CaptionFontSize.detailRatio(tier),.000001f);
            assertEquals(full/2736f,CaptionFontSize.fullScreenRatio(tier),.000001f);
            for (float scale:new float[]{.5f,1f,1.25f,2f}) {
                float renderedDetail=SubtitleStyleMetrics.targetGlyphHeightPx(tier,1264*scale,false);
                float renderedFull=SubtitleStyleMetrics.targetGlyphHeightPx(tier,2736*scale,true);
                assertEquals(detail[tier]*scale,renderedDetail,.0001f);
                assertEquals(full*scale,renderedFull,.0001f);
                assertEquals(55.5f/44.5f,renderedFull/renderedDetail,.00001f);
            }
        }
    }

    @Test public void contractionHasNoAbsoluteSizeFloorAndPreviewUsesFullscreenReference() {
        assertEquals(44.5f,SubtitleStyleMetrics.targetGlyphHeightPx(2,1264,false),.0001f);
        assertEquals(55.5f,SubtitleStyleMetrics.targetGlyphHeightPx(2,2736,true),.0001f);
        assertEquals(55.5f,SubtitleStyleMetrics.renderedGlyphHeightPx(2,2736,true,2188.8f,2736),.0001f);
        assertEquals(11.1f,SubtitleStyleMetrics.renderedGlyphHeightPx(2,2736,true,547.2f,2736),.0001f);
        assertEquals(55.5f/2736f*420,SubtitleStyleMetrics.previewGlyphHeightPx(2,420),.0001f);
    }
}
