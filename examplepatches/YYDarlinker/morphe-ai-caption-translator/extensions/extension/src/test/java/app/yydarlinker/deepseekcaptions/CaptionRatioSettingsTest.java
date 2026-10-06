package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
@GraphicsMode(GraphicsMode.Mode.LEGACY)
public class CaptionRatioSettingsTest {
    @Test public void fiveTierSliderShowsReferenceDetailPixelsAndSavesOnlyOnRelease(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        DisplayMetrics metrics=activity.getResources().getDisplayMetrics();
        int originalWidth=metrics.widthPixels,originalHeight=metrics.heightPixels;
        try {
            for(int[] dimensions:new int[][]{{1264,2736},{2736,1264},{1080,2400},{2400,1080}}){
                metrics.widthPixels=dimensions[0];metrics.heightPixels=dimensions[1];
                DeepSeekConfig.saveCaptionSizeTier(activity,2);
                SubtitleStylePreview style=new SubtitleStylePreview(activity);
                View previewRoot=style.onCreateView(new FrameLayout(activity));
                SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)
                        previewRoot.findViewWithTag("ai_style_preview_canvas");
                DeepSeekSliderPreference preference=new DeepSeekSliderPreference(activity);
                preference.setKey(DeepSeekSliderPreference.KEY_TEXT_SIZE);
                preference.setTitle(CaptionStrings.settings(activity,"size"));
                LinearLayout root=(LinearLayout)preference.onCreateView(new FrameLayout(activity));
                SeekBar slider=(SeekBar)root.getChildAt(1);
                TextView summary=(TextView)root.getChildAt(3);
                assertEquals(4,slider.getMax());assertEquals(2,slider.getProgress());
                // N24: the size row no longer repeats the value beside the title; the tier line carries it.
                assertEquals("size heading must contain only the title",1,((LinearLayout)root.getChildAt(0)).getChildCount());
                SeekBar.OnSeekBarChangeListener listener=Shadows.shadowOf(slider).getOnSeekBarChangeListener();
                String[] labels={"34 px","39 px","44.5 px","50 px","56 px"};
                String[] names={"size_tier_xs","size_tier_s","size_tier_standard","size_tier_l","size_tier_xl"};
                String[] full={"42.4","48.6","55.5","62.4","69.8"};
                for(int tier=0;tier<5;tier++) {
                    slider.setProgress(tier);
                    listener.onProgressChanged(slider,tier,true);
                    assertEquals(String.format(java.util.Locale.ROOT,
                            CaptionStrings.settings(activity,"size_tier_hint"),
                            CaptionStrings.settings(activity,names[tier]),labels[tier].replace(" px",""),full[tier]),
                            summary.getText().toString());
                    assertEquals(tier,preview.sizeTier);
                    assertEquals("drag only previews",2,DeepSeekConfig.displayStyle(activity).captionSizeTier);
                }
                listener.onStopTrackingTouch(slider);
                assertEquals(4,DeepSeekConfig.displayStyle(activity).captionSizeTier);
                assertEquals(4,activity.getSharedPreferences("deepseek_caption_translator",0)
                        .getInt("caption_size_tier",-1));
            }
        } finally {
            metrics.widthPixels=originalWidth;metrics.heightPixels=originalHeight;
            activity.finish();
        }
    }

    @Test public void opacityRowKeepsItsLiveHeaderValue(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            DeepSeekConfig.saveBackgroundOpacity(activity,70);
            DeepSeekSliderPreference preference=new DeepSeekSliderPreference(activity);
            preference.setKey(DeepSeekSliderPreference.KEY_OPACITY);
            preference.setTitle(CaptionStrings.settings(activity,"opacity"));
            LinearLayout root=(LinearLayout)preference.onCreateView(new FrameLayout(activity));
            LinearLayout heading=(LinearLayout)root.getChildAt(0);
            assertEquals("the opacity row keeps the percentage beside its title",2,heading.getChildCount());
            TextView value=(TextView)heading.getChildAt(1);
            assertEquals("70%",value.getText().toString());
            SeekBar slider=(SeekBar)root.getChildAt(1);
            SeekBar.OnSeekBarChangeListener listener=Shadows.shadowOf(slider).getOnSeekBarChangeListener();
            slider.setProgress(25);listener.onProgressChanged(slider,25,true);
            assertEquals("25%",value.getText().toString());
            assertEquals("dragging only previews",70,DeepSeekConfig.displayStyle(activity).backgroundOpacity);
            listener.onStopTrackingTouch(slider);
            assertEquals(25,activity.getSharedPreferences("deepseek_caption_translator",0)
                    .getInt("background_opacity",-1));
        } finally { activity.finish(); }
    }

    @Test public void tierDescriptionsUseOnlyLocalizedTierAndBothReferencePixelSizes(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            for(String key:new String[]{"size_tier_xs","size_tier_s","size_tier_standard","size_tier_l","size_tier_xl"}) {
                String name=CaptionStrings.settings(activity,key);
                assertFalse(name.isEmpty());assertFalse(name.startsWith("size_tier_"));
            }
            String summary=String.format(CaptionStrings.settings(activity,"size_tier_hint"),
                    CaptionStrings.settings(activity,"size_tier_standard"),"44.5","55.5");
            assertTrue(summary,summary.contains("44.5"));
            assertTrue(summary,summary.contains("55.5"));
            assertTrue(summary,summary.contains("px"));
            assertFalse(summary,summary.contains("%"));
            assertFalse(summary,summary.contains("sp"));
        } finally { activity.finish(); }
    }
}
