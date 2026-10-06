package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.*;
import android.view.*;
import android.widget.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import static org.junit.Assert.*;

/** Actual native Android view rasterization in an isolated fixture, not a YouTube/device screenshot. */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsPolish113Test {
    /** The localized source line the landscape preview renders; also the catalog lookup key. */
    static final String PREVIEW_SAMPLE="字幕要自然。";
    @Test public void landscapePreviewFillsAvailableWidthAndKeepsVideoAndGlyphScale(){
        float reference=SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX;
        assertEquals(2736f,reference,0);
        for(float width:new float[]{320,360,420,800,1600}){
            float frame=SubtitleStylePreview.frameWidth(width);
            assertEquals(width,frame,.001f);
            assertEquals(width*9f/16f,SubtitleStylePreview.stageHeight(width),.001f);
            for(int tier=0;tier<CaptionFontSize.COUNT;tier++){
                float landscape=SubtitleStyleMetrics.previewGlyphHeightPx(tier,frame);
                assertEquals(CaptionFontSize.fullScreenGlyphHeightPx(tier)/2736f*frame,landscape,.001f);
            }
        }
    }
    private int countViews(View view,Class<?> type){
        int count=type.isInstance(view)?1:0;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)count+=countViews(group.getChildAt(i),type);}
        return count;
    }
    @Test public void previewContainsOneStaticLandscapeCanvasWithoutAnOrientationControl(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            SubtitleStylePreview preference=new SubtitleStylePreview(activity);
            View root=preference.onCreateView(new FrameLayout(activity));
            SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)root.findViewWithTag("ai_style_preview_canvas");
            assertEquals(1,countViews(root,SubtitleStylePreview.Preview.class));
            assertEquals(0,countViews(root,Button.class));
            assertFalse(preference.isSelectable());assertFalse(preview.isClickable());assertFalse(preview.isFocusable());
            assertFalse(preview.performClick());
            assertEquals(CaptionStrings.settings(activity,"preview"),preview.getContentDescription());
            for(int width:new int[]{320,420,960}){
                preview.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                assertEquals(width,preview.getMeasuredWidth());
                assertEquals(Math.round(width*9f/16f),preview.getMeasuredHeight());
            }
        } finally { activity.finish(); }
    }
    private void heading(LinearLayout root,String title){TextView label=new TextView(root.getContext());label.setText(title);CaptionSettingsStyle.caption(label);label.setTextSize(14);label.setPadding(20,20,20,6);root.addView(label);}
    private View row(android.preference.Preference preference,LinearLayout root){View row=preference.getView(null,new ListView(root.getContext()));root.addView(row,new LinearLayout.LayoutParams(-1,-2));return row;}
    private float assertTierRail(View root,int selected){
        DeepSeekSliderPreference.SizeTierSeekBar slider=(DeepSeekSliderPreference.SizeTierSeekBar)root.findViewWithTag("ai_size_tier_slider");
        LinearLayout names=(LinearLayout)root.findViewWithTag("ai_size_tier_names");
        assertNotNull(slider);assertNotNull(names);assertEquals(4,slider.getMax());assertEquals(selected,slider.getProgress());
        assertEquals(5,names.getChildCount());
        // N24: each tier name is centred on its own tick, so the label row carries no rail inset.
        assertEquals(0,names.getPaddingLeft());assertEquals(0,names.getPaddingRight());
        assertFalse("tier names may overflow their equal cells to sit on their ticks",names.getClipChildren());
        String[] keys={"size_tier_xs","size_tier_s","size_tier_standard","size_tier_l","size_tier_xl"};
        String current=CaptionStrings.settings(root.getContext(),keys[selected]);
        assertTrue(slider.getContentDescription().toString().contains(current));
        assertTrue(names.getContentDescription().toString().contains(current));
        float tolerance=1f;
        // N25: one geometry, now with the row's label inset on both rails. railStart/railEnd are the
        // drawn rail endpoints AND the two extreme thumb centres; every tier divides that same travel, so
        // the end ticks, the end thumb centres and the visible rail ends are still the same coordinates.
        // The inset is what lets the two end labels stay centred on their ticks inside the row.
        int inset=slider.railInsetPx();
        assertEquals("the row must reserve room for the end labels",slider.railInsetPx(),inset);
        assertEquals("rail must start at the padded frame edge plus the label inset",
                slider.getPaddingLeft()+inset,slider.railStart(),0f);
        assertEquals("rail must end at the padded frame edge minus the label inset",
                slider.getWidth()-slider.getPaddingRight()-inset,slider.railEnd(),0f);
        assertEquals("first tier sits on the rail start",slider.railStart(),slider.tickCenterX(0),0f);
        assertEquals("last tier sits on the rail end",slider.railEnd(),slider.tickCenterX(4),0f);
        for(int tier=0;tier<5;tier++){
            assertEquals("tier "+tier+" tick must equal its thumb centre",
                    slider.thumbCenterX(tier/4f),slider.tickCenterX(tier),0f);
        }
        Bitmap rail=Bitmap.createBitmap(slider.getWidth(),slider.getHeight(),Bitmap.Config.ARGB_8888);
        Canvas railCanvas=new Canvas(rail);
        android.graphics.drawable.Drawable thumb=slider.getThumb(),track=slider.getProgressDrawable();
        slider.setThumb(null);slider.setProgressDrawable(null);
        DeepSeekSliderPreference.RailBar.RAIL_BANDS_HIDDEN=true;
        rail.eraseColor(Color.TRANSPARENT);slider.draw(railCanvas);
        float tickRadius=CaptionSettingsStyle.dp(root.getContext(),3);
        // The tick ink spans the rail span grown by the tick radius on both sides, which proves the first
        // and last ticks are centred exactly on the two rail endpoints rather than inset from them.
        assertEquals("first tick centre must sit on the rail start",slider.railStart()-tickRadius,railStartInk(rail,slider.centerY()),1f);
        assertEquals("last tick centre must sit on the rail end",slider.railEnd()+tickRadius-1,railEndInk(rail,slider.centerY()),1f);
        // The tick ink has to be inside the row as well: that is the whole point of the inset.
        assertTrue("tick ink must stay inside the row",railStartInk(rail,slider.centerY())>=0);
        DeepSeekSliderPreference.RailBar.RAIL_BANDS_HIDDEN=false;
        int y=Math.round(slider.getPaddingTop()+(slider.getHeight()-slider.getPaddingTop()-slider.getPaddingBottom())/2f);
        int previousRight=-1;float maxAlignmentError=0;
        for(int tier=0;tier<5;tier++){
            TextView label=(TextView)names.getChildAt(tier);
            assertEquals(CaptionStrings.settings(root.getContext(),keys[tier]),label.getText().toString());
            assertFalse(label.getText().toString().contains("px"));
            int expected=tier==selected?CaptionSettingsStyle.primary(root.getContext()):CaptionSettingsStyle.secondary(root.getContext());
            assertEquals(expected,label.getCurrentTextColor());assertEquals(tier==selected,label.getTypeface().isBold());
            // N25: each label gets the width its own translation needs and is placed on its own tick, so
            // the five are no longer equal cells; what has to hold is that they are inside the row, in
            // order, and clear of each other.
            assertTrue("tier "+tier+" label must start inside the row",label.getLeft()>=0);
            assertTrue("tier "+tier+" label must end inside the row",label.getRight()<=names.getWidth());
            assertTrue("tier "+tier+" label must not overlap its neighbour("+label.getLeft()
                            +" < "+previousRight+")",label.getLeft()>=previousRight);
            previousRight=label.getRight();
            float labelCenter=names.getLeft()+label.getLeft()+label.getWidth()/2f;
            assertEquals("tier label center must align with its tick",slider.getLeft()+slider.tickCenterX(tier),labelCenter,tolerance);
            maxAlignmentError=Math.max(maxAlignmentError,Math.abs(slider.getLeft()+slider.tickCenterX(tier)-labelCenter));
            int tickColor=tier==selected?CaptionSettingsStyle.primary(root.getContext()):CaptionSettingsStyle.sliderUnfilled(root.getContext());
            assertEquals("native tick raster must use the rail color",tickColor,rail.getPixel(Math.round(slider.tickCenterX(tier)),y));
        }
        slider.setThumb(thumb);slider.setThumbOffset(thumb==null?0:thumb.getIntrinsicWidth()/2);slider.setProgressDrawable(track);
        rail.recycle();
        return maxAlignmentError;
    }
    private float railStartInk(Bitmap bitmap,int row){for(int x=0;x<bitmap.getWidth();x++)if(Color.alpha(bitmap.getPixel(x,row))!=0)return x;return -1;}
    private float railEndInk(Bitmap bitmap,int row){for(int x=bitmap.getWidth()-1;x>=0;x--)if(Color.alpha(bitmap.getPixel(x,row))!=0)return x;return -1;}
    @Test @Config(qualifiers="ar-rSA-w420dp-h900dp") public void tierRailAlignsNativeThumbAndLocalizedNamesInRtl(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try{
            DeepSeekConfig.saveCaptionSizeTier(activity,2);
            DeepSeekSliderPreference preference=new DeepSeekSliderPreference(activity);preference.setKey(DeepSeekSliderPreference.KEY_TEXT_SIZE);preference.setTitle(CaptionStrings.settings(activity,"size"));
            View root=preference.onCreateView(new FrameLayout(activity));root.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
            SeekBar slider=(SeekBar)root.findViewWithTag("ai_size_tier_slider");
            root.measure(View.MeasureSpec.makeMeasureSpec(420,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));root.layout(0,0,420,root.getMeasuredHeight());
            for(int tier=0;tier<5;tier++){
                slider.setProgress(tier);Shadows.shadowOf(slider).getOnSeekBarChangeListener().onProgressChanged(slider,tier,true);assertTierRail(root,tier);
            }
        }finally{activity.finish();}
    }
    @Test @Config(qualifiers="zh-rCN-w420dp-h900dp") public void tierRailRendersFiveAlignedLocalizedNamesAndUpdatesAccessibility(){
        for(boolean dark:new boolean[]{false,true}){
            Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
            activity.setTheme(dark?android.R.style.Theme_Material_NoActionBar:android.R.style.Theme_Material_Light_NoActionBar);
            try{
                DeepSeekConfig.saveCaptionSizeTier(activity,2);
                DeepSeekSliderPreference preference=new DeepSeekSliderPreference(activity);preference.setKey(DeepSeekSliderPreference.KEY_TEXT_SIZE);preference.setTitle(CaptionStrings.settings(activity,"size"));
                View root=preference.onCreateView(new FrameLayout(activity));
                SeekBar slider=(SeekBar)root.findViewWithTag("ai_size_tier_slider");
                for(int width:new int[]{320,420,960}){
                    root.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));root.layout(0,0,width,root.getMeasuredHeight());
                    for(int tier=0;tier<5;tier++){
                        slider.setProgress(tier);Shadows.shadowOf(slider).getOnSeekBarChangeListener().onProgressChanged(slider,tier,true);
                        assertTierRail(root,tier);
                        assertEquals("drag previews without persisting",2,DeepSeekConfig.displayStyle(activity).captionSizeTier);
                    }
                }
            }finally{activity.finish();}
        }
    }
    @Test @Config(qualifiers="zh-rCN-w420dp-h900dp") public void renderNativeLightAndDarkSettingsFixtures()throws Exception{
        JSONArray fixtureRecord=new JSONArray();
        for(int tier:new int[]{0,CaptionFontSize.DEFAULT_TIER,4}) for(boolean dark:new boolean[]{false,true}){
            String tierName=new String[]{"xs","s","standard","l","xl"}[tier];
            Activity activity=Robolectric.buildActivity(Activity.class).setup().get();activity.setTheme(dark?android.R.style.Theme_Material_NoActionBar:android.R.style.Theme_Material_Light_NoActionBar);
            DeepSeekConfig.saveCaptionSizeTier(activity,tier);
            LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(dark?0xff0f0f0f:Color.WHITE);root.setLayoutParams(new FrameLayout.LayoutParams(420,-2));
            TextView top=new TextView(activity);top.setText("AI 字幕翻译");CaptionSettingsStyle.title(top);top.setTextSize(22);top.setPadding(20,20,20,20);root.addView(top);
            DeepSeekEnabledPreference enabled=new DeepSeekEnabledPreference(activity);enabled.setTitle("启用 AI 字幕翻译");row(enabled,root);
            heading(root,"API 配置");DeepSeekTextPreference url=new DeepSeekTextPreference(activity);url.setKey(DeepSeekTextPreference.KEY_BASE_URL);url.setTitle("API 地址");url.setSummary("兼容接口地址，停止输入后自动保存");View urlRow=row(url,root);
            assertTrue(CaptionEditorIds.editorIn(urlRow).getMinimumHeight()>=CaptionSettingsStyle.dp(activity,48));
            ApiKeyPreference key=new ApiKeyPreference(activity);key.setKey(DeepSeekTextPreference.KEY_API_KEY);key.setTitle("API Key");row(key,root);
            DeepSeekModelPreference model=new DeepSeekModelPreference(activity);model.setKey(DeepSeekModelPreference.KEY_MODEL);model.setTitle("模型");row(model,root);
            heading(root,"字幕样式");SubtitleStylePreview pref=new SubtitleStylePreview(activity);View previewRow=row(pref,root);SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)previewRow.findViewWithTag("ai_style_preview_canvas");
            for(String field:new String[]{DeepSeekSliderPreference.KEY_TEXT_SIZE,DeepSeekSliderPreference.KEY_OPACITY}){DeepSeekSliderPreference slider=new DeepSeekSliderPreference(activity);slider.setKey(field);slider.setTitle(field.equals(DeepSeekSliderPreference.KEY_TEXT_SIZE)?CaptionStrings.settings(activity,"size"):"背景不透明度");slider.setSummary(field.equals(DeepSeekSliderPreference.KEY_TEXT_SIZE)?String.format(CaptionStrings.settings(activity,"size_tier_hint"),CaptionStrings.settings(activity,"size_tier_"+tierName),pixels(activity,tier,false),pixels(activity,tier,true)):"0% 为透明，100% 为不透明；松手保存");row(slider,root);}
            heading(root,"缓存与诊断");row(new DeepSeekDiagnosticsPreference(activity),root);
            root.measure(View.MeasureSpec.makeMeasureSpec(420,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));root.layout(0,0,420,root.getMeasuredHeight());
            Bitmap bitmap=Bitmap.createBitmap(420,root.getHeight(),Bitmap.Config.ARGB_8888);root.draw(new Canvas(bitmap));
            float alignmentError=assertTierRail(root,tier);
            SeekBar size=(SeekBar)root.findViewWithTag("ai_size_tier_slider"),opacity=(SeekBar)root.findViewWithTag("ai_opacity_slider");
            DeepSeekSliderPreference.RailBar sizeRail=(DeepSeekSliderPreference.RailBar)size,opacityRail=(DeepSeekSliderPreference.RailBar)opacity;
            DeepSeekSliderPreference.SizeTierSeekBar sizeTiers=(DeepSeekSliderPreference.SizeTierSeekBar)size;
            assertEquals(size.getWidth(),opacity.getWidth());assertEquals(size.getLeft(),opacity.getLeft());
            assertEquals(size.getPaddingLeft(),opacity.getPaddingLeft());assertEquals(size.getPaddingRight(),opacity.getPaddingRight());
            assertEquals(size.getThumbOffset(),opacity.getThumbOffset());
            assertEquals(size.getThumb().getIntrinsicWidth(),opacity.getThumb().getIntrinsicWidth());
            assertEquals(size.getProgressTintList(),opacity.getProgressTintList());
            assertEquals(size.getProgressBackgroundTintList(),opacity.getProgressBackgroundTintList());
            assertEquals(size.getThumbTintList(),opacity.getThumbTintList());
            int railLengthPx=Math.round(sizeRail.railEnd()-sizeRail.railStart());
            assertEquals("both rails must be the same length",railLengthPx,Math.round(opacityRail.railEnd()-opacityRail.railStart()));
            assertEquals("first tick must sit on the rail start",0f,sizeTiers.tickCenterX(0)-sizeRail.railStart(),0f);
            assertEquals("last tick must sit on the rail end",0f,sizeTiers.tickCenterX(4)-sizeRail.railEnd(),0f);
            System.out.println("N24_TIER_RAIL theme="+(dark?"dark":"light")+" tier="+tier+" rail_length_px="+railLengthPx
                    +" rail_length_delta_px="+(railLengthPx-Math.round(opacityRail.railEnd()-opacityRail.railStart()))
                    +" first_tick_vs_rail_start_px=0 last_tick_vs_rail_end_px=0 max_label_tick_error_px="+alignmentError);
            assertTrue(root.getHeight()>500);assertEquals(previewRow.getWidth()-previewRow.getPaddingLeft()-previewRow.getPaddingRight(),preview.getWidth());assertEquals(Math.round(preview.getWidth()*9f/16f),preview.getHeight());
            float previewWidth=preview.getWidth();
            float fullScreenGlyph=CaptionFontSize.fullScreenGlyphHeightPx(tier);
            float previewGlyph=SubtitleStyleMetrics.previewGlyphHeightPx(tier,previewWidth);
            assertEquals(fullScreenGlyph/SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX,previewGlyph/previewWidth,.0001f);
            fixtureRecord.put(new JSONObject().put("file","settings-"+(dark?"dark":"light")+"-"+tierName+"-landscape.png")
                    .put("theme",dark?"dark":"light").put("size_tier",tier).put("tier_name",tierName)
                    .put("preview_width_px",previewWidth).put("preview_height_px",preview.getHeight())
                    .put("reference_full_screen_width_px",SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX)
                    .put("detail_glyph_px",Double.parseDouble(pixels(activity,tier,false)))
                    .put("full_screen_glyph_px",Double.parseDouble(pixels(activity,tier,true)))
                    .put("preview_glyph_px",Double.parseDouble(String.format(java.util.Locale.ROOT,"%.2f",previewGlyph)))
                    .put("preview_scale",Double.parseDouble(String.format(java.util.Locale.ROOT,"%.6f",previewWidth/SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX))));
            String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");if(output!=null){File file=new File(output,"settings-"+(dark?"dark":"light")+"-"+tierName+"-landscape.png");file.getParentFile().mkdirs();try(FileOutputStream out=new FileOutputStream(file)){assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,out));}
                if(!dark&&tier==CaptionFontSize.DEFAULT_TIER){try(FileOutputStream out=new FileOutputStream(new File(output,"settings-size-tiers.png"))){assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,out));}}
            }
            activity.finish();
        }
        String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");
        if(output!=null){File file=new File(output,"preview-measurements.json");file.getParentFile().mkdirs();
            try(FileOutputStream out=new FileOutputStream(file)){out.write(new JSONObject().put("fixtures",fixtureRecord).toString(2).getBytes(StandardCharsets.UTF_8));}}
    }
    private static String pixels(Activity activity,int tier,boolean fullScreen){
        float value=fullScreen?CaptionFontSize.fullScreenGlyphHeightPx(tier):CaptionFontSize.detailGlyphHeightPx(tier);
        return value==Math.round(value)?Integer.toString(Math.round(value)):String.format(java.util.Locale.ROOT,"%.1f",value);
    }
    /**
     * The preview must render a real sentence, not the short label that this very source string is mapped
     * to in the catalog. The localized value may therefore legitimately be the label, so the layout
     * properties are asserted on the raw source line with localization switched off for the fixture.
     */
    /**
     * The preview renders the catalog's localized sample for whatever interface language is active. The
     * per-locale coverage lives in {@code N25PreviewSampleTest}; this case locks the wiring: the drawn
     * string is the catalog value for the reference budget, never a label and never a truncated line.
     */
    @Test @Config(qualifiers="en") public void previewSampleIsALongNaturalLineThatFitsTheLandscapeFrame(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try{
            String source=SubtitleStylePreview.sample(activity);
            assertEquals(CaptionStrings.settings(activity,SubtitleStylePreview.SAMPLE_KEY),source);
            assertTrue("the sample must be a complete sentence",source.trim().length()>1);
            float budget=SubtitleStylePreview.sampleTextWidthPx(activity,
                    SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX);
            for(int tier=0;tier<CaptionFontSize.COUNT;tier++){
                TextView label=SubtitleStylePreview.sampleLabel(activity,source,tier,70,
                        SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX,
                        SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX);
                assertEquals("the sample must never be truncated",source,label.getText().toString());
                // getLineCount() is clamped to maxLines; the layout holds the real row count.
                assertNotNull("the sample must be laid out",label.getLayout());
                assertEquals("the sample must fit the one line budget",
                        1,label.getLayout().getLineCount());
                assertTrue("the complete advance must fit the reference budget",
                        label.getPaint().measureText(source)<=budget);
            }
        }finally{activity.finish();}
    }
    @Test public void previewHitsGlyphTargetsWithoutDensityOrFontScaleAssumptions(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        android.util.DisplayMetrics metrics=activity.getResources().getDisplayMetrics();
        float originalDensity=metrics.density,originalScaledDensity=metrics.scaledDensity;
        try {
            float reference=SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX;
            for(int tier=0;tier<CaptionFontSize.COUNT;tier++){
                metrics.density=1f;metrics.scaledDensity=1f;
                TextView baseline=SubtitleStylePreview.sampleLabel(activity,PREVIEW_SAMPLE,
                        tier,70,reference,reference);
                float actual=SubtitleStyleMetrics.measuredGlyphHeightPx(baseline.getPaint());
                float target=CaptionFontSize.fullScreenGlyphHeightPx(tier);
                assertEquals(target,actual,1.5f);
                for(float previewWidth:new float[]{320,420,800}){
                    float scale=previewWidth/reference;
                    assertEquals(SubtitleStyleMetrics.previewGlyphHeightPx(tier,previewWidth),actual*scale,1.5f*scale);
                }
                metrics.density=3.25f;metrics.scaledDensity=5.75f;
                TextView changed=SubtitleStylePreview.sampleLabel(activity,PREVIEW_SAMPLE,
                        tier,70,reference,reference);
                assertEquals(baseline.getTextSize(),changed.getTextSize(),.001f);
                assertEquals(actual,SubtitleStyleMetrics.measuredGlyphHeightPx(changed.getPaint()),.001f);
            }
        } finally {
            metrics.density=originalDensity;metrics.scaledDensity=originalScaledDensity;
            activity.finish();
        }
    }
    private Bitmap renderPreview(SubtitleStylePreview.Preview preview){
        preview.measure(View.MeasureSpec.makeMeasureSpec(960,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        preview.layout(0,0,preview.getMeasuredWidth(),preview.getMeasuredHeight());
        Bitmap bitmap=Bitmap.createBitmap(preview.getWidth(),preview.getHeight(),Bitmap.Config.ARGB_8888);preview.draw(new Canvas(bitmap));return bitmap;
    }
    private float backgroundCenterY(Bitmap bitmap){
        int top=bitmap.getHeight(),bottom=-1;
        for(int y=0;y<bitmap.getHeight();y++)for(int x=0;x<bitmap.getWidth();x++)if(bitmap.getPixel(x,y)==Color.BLACK){top=Math.min(top,y);bottom=Math.max(bottom,y);}
        assertTrue("Opaque subtitle background must be rendered",bottom>=top);return (top+bottom)/2f;
    }
    @Test public void landscapePreviewUsesLandscapeCaptionPosition(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        float landscape=DeepSeekConfig.captionPositionY(activity,true),shorts=DeepSeekConfig.shortsPosition(activity);
        try {
            SubtitleStylePreview.Preview preview=new SubtitleStylePreview.Preview(activity);preview.opacity=100;preview.sizeTier=2;
            DeepSeekConfig.saveCaptionPosition(activity,true,.30f);DeepSeekConfig.saveShortsPosition(activity,.85f);
            Bitmap upper=renderPreview(preview);
            assertEquals(upper.getHeight()*.30f,backgroundCenterY(upper),2f);
            DeepSeekConfig.saveShortsPosition(activity,.10f);
            assertTrue("Shorts position must not affect the landscape preview",upper.sameAs(renderPreview(preview)));
            DeepSeekConfig.saveCaptionPosition(activity,true,.70f);
            Bitmap lower=renderPreview(preview);
            assertEquals(lower.getHeight()*.70f,backgroundCenterY(lower),2f);
        } finally {
            DeepSeekConfig.saveCaptionPosition(activity,true,landscape);DeepSeekConfig.saveShortsPosition(activity,shorts);activity.finish();
        }
    }
}
