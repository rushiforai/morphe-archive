package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.util.DisplayMetrics;
import android.view.View;
import java.util.ArrayList;
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
    private TextView textWithValue(View root, String value) {
        ArrayList<View> matches=new ArrayList<>();
        root.findViewsWithText(matches,value,View.FIND_VIEWS_WITH_TEXT);
        for(View match:matches) if(match instanceof TextView && value.contentEquals(((TextView)match).getText()))
            return (TextView)match;
        throw new AssertionError("No text view for: "+value);
    }
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
                preference.setTitle(CaptionStrings.get(activity,"size"));
                LinearLayout root=(LinearLayout)preference.onCreateView(new FrameLayout(activity));
                SeekBar slider=root.findViewWithTag("ai_size_tier_slider");
                TextView summary=textWithValue(root,String.format(java.util.Locale.ROOT,
                        CaptionStrings.get(activity,"size_tier_hint"),
                        CaptionStrings.get(activity,"size_tier_standard"),"44.5","55.5"));
                assertEquals(4,slider.getMax());assertEquals(2,slider.getProgress());
                SeekBar.OnSeekBarChangeListener listener=Shadows.shadowOf(slider).getOnSeekBarChangeListener();
                listener.onStartTrackingTouch(slider);
                String[] labels={"34 px","39 px","44.5 px","50 px","56 px"};
                String[] names={"size_tier_xs","size_tier_s","size_tier_standard","size_tier_l","size_tier_xl"};
                String[] full={"42.4","48.6","55.5","62.4","69.8"};
                for(int tier=0;tier<5;tier++) {
                    slider.setProgress(tier);
                    listener.onProgressChanged(slider,tier,true);
                    assertEquals(String.format(java.util.Locale.ROOT,
                            CaptionStrings.get(activity,"size_tier_hint"),
                            CaptionStrings.get(activity,names[tier]),labels[tier].replace(" px",""),full[tier]),
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
            preference.setTitle(CaptionStrings.get(activity,"opacity"));
            LinearLayout root=(LinearLayout)preference.onCreateView(new FrameLayout(activity));
            TextView value=textWithValue(root,"70%");
            SeekBar slider=root.findViewWithTag("ai_opacity_slider");
            SeekBar.OnSeekBarChangeListener listener=Shadows.shadowOf(slider).getOnSeekBarChangeListener();
            listener.onStartTrackingTouch(slider);
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
                String name=CaptionStrings.get(activity,key);
                assertFalse(name.isEmpty());assertFalse(name.startsWith("size_tier_"));
            }
            String summary=String.format(CaptionStrings.get(activity,"size_tier_hint"),
                    CaptionStrings.get(activity,"size_tier_standard"),"44.5","55.5");
            assertTrue(summary,summary.contains("44.5"));
            assertTrue(summary,summary.contains("55.5"));
            assertTrue(summary,summary.contains("px"));
            assertFalse(summary,summary.contains("%"));
            assertFalse(summary,summary.contains("sp"));
        } finally { activity.finish(); }
    }
}
