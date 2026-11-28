package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.overlay.SubtitleStyleMetrics;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.SharedPreferences;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CaptionSizeRangeTest {
    @Test public void incompatibleLegacySpUnitsAreNeverReadAsGlyphSizes() {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            SharedPreferences prefs=activity.getSharedPreferences("ai_caption_translator",0);
            prefs.edit().putFloat("caption_text_size",13f)
                    .putString("caption_text_size_tenths","226").apply();
            assertEquals(2,AiCaptionConfig.displayStyle(activity).captionSizeTier);
            assertEquals(2,AiCaptionConfig.displayStyle(activity).captionSizeTier);
            assertFalse(prefs.contains("caption_glyph_height_ratio_bps"));
            AiCaptionConfig.saveCaptionSizeTier(activity,3);
            assertEquals(3,AiCaptionConfig.displayStyle(activity).captionSizeTier);
            assertEquals("226",prefs.getString("caption_text_size_tenths",""));
        } finally { activity.finish(); }
    }

    @Test public void savedTierIsClampedAndNewKeyWinsOverOldContinuousRatio() {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            SharedPreferences prefs=activity.getSharedPreferences("ai_caption_translator",0);
            AiCaptionConfig.saveCaptionSizeTier(activity,-1);
            assertEquals(0,AiCaptionConfig.displayStyle(activity).captionSizeTier);
            AiCaptionConfig.saveCaptionSizeTier(activity,999);
            assertEquals(4,AiCaptionConfig.displayStyle(activity).captionSizeTier);
            AiCaptionConfig.saveCaptionSizeTier(activity,3);
            prefs.edit().putInt("caption_glyph_height_ratio_bps",203).apply();
            assertEquals(3,AiCaptionConfig.displayStyle(activity).captionSizeTier);
            assertEquals(3,prefs.getInt("caption_size_tier",-1));
            // An incompatible legacy type must also remain unread once the new key exists.
            prefs.edit().putString("caption_glyph_height_ratio_bps","obsolete").apply();
            assertEquals(3,AiCaptionConfig.displayStyle(activity).captionSizeTier);
        } finally { activity.finish(); }
    }

    @Test public void continuousScreenRatioMigratesOnceToNearestDetailTier() {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            SharedPreferences prefs=activity.getSharedPreferences("ai_caption_translator",0);
            // 203 bps formerly meant 25.6592px, so the old default moves to the smallest tier.
            int[] bps={-1,203,288,289,330,331,373,374,419,420,999};
            int[] expected={0,0,0,1,1,2,2,3,3,4,4};
            for(int i=0;i<bps.length;i++) {
                prefs.edit().remove("caption_size_tier")
                        .putInt("caption_glyph_height_ratio_bps",bps[i]).apply();
                assertEquals("old ratio "+bps[i],expected[i],AiCaptionConfig.displayStyle(activity).captionSizeTier);
                assertEquals(expected[i],prefs.getInt("caption_size_tier",-1));
                prefs.edit().putInt("caption_glyph_height_ratio_bps",999).apply();
                assertEquals("migration must not run twice",expected[i],AiCaptionConfig.displayStyle(activity).captionSizeTier);
            }
        } finally { activity.finish(); }
    }

    @Test public void nearestTierIncludesBothSidesOfEveryBoundaryAndClampsEndpoints() {
        assertEquals(0,SubtitleStyleMetrics.nearestTierForDetailGlyphHeight(-100));
        assertEquals(4,SubtitleStyleMetrics.nearestTierForDetailGlyphHeight(1000));
        for(int tier=0;tier<4;tier++) {
            float midpoint=(SubtitleStyleMetrics.detailGlyphHeightPx(tier)
                    +SubtitleStyleMetrics.detailGlyphHeightPx(tier+1))/2f;
            assertEquals(tier,SubtitleStyleMetrics.nearestTierForDetailGlyphHeight(midpoint-.001f));
            assertEquals(tier,SubtitleStyleMetrics.nearestTierForDetailGlyphHeight(midpoint));
            assertEquals(tier+1,SubtitleStyleMetrics.nearestTierForDetailGlyphHeight(midpoint+.001f));
        }
    }
}
