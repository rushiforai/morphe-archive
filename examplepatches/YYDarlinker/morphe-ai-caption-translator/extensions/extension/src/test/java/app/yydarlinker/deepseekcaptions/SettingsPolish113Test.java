package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.*;
import android.view.*;
import android.widget.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import java.io.*;
import static org.junit.Assert.*;

/** Actual native Android view rasterization in an isolated fixture, not a YouTube/device screenshot. */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsPolish113Test {
    @Test public void portraitIsLargerButLayoutShiftIsBounded(){
        for(float width:new float[]{320,360,420,800})for(float height:new float[]{400,800}){
            float wide=SubtitleStylePreview.stageHeight(width,height,1,false),tall=SubtitleStylePreview.stageHeight(width,height,1,true);
            assertTrue(tall>=wide);assertTrue(tall-wide<=64);assertTrue(tall<=height*.60f+1);
        }
        assertTrue(SubtitleStylePreview.stageHeight(360,800,1,true)>360*9f/16f*1.35f);
    }
    private void heading(LinearLayout root,String title){TextView label=new TextView(root.getContext());label.setText(title);CaptionSettingsStyle.caption(label);label.setTextSize(14);label.setPadding(20,20,20,6);root.addView(label);}
    private View row(android.preference.Preference preference,LinearLayout root){View row=preference.getView(null,new ListView(root.getContext()));root.addView(row,new LinearLayout.LayoutParams(-1,-2));return row;}
    @Test public void renderNativeLightAndDarkSettingsFixtures()throws Exception{
        for(boolean dark:new boolean[]{false,true})for(boolean portrait:new boolean[]{false,true}){
            Activity activity=Robolectric.buildActivity(Activity.class).setup().get();activity.setTheme(dark?android.R.style.Theme_Material_NoActionBar:android.R.style.Theme_Material_Light_NoActionBar);
            LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(dark?0xff0f0f0f:Color.WHITE);root.setLayoutParams(new FrameLayout.LayoutParams(420,-2));
            TextView top=new TextView(activity);top.setText("AI 字幕翻译");CaptionSettingsStyle.title(top);top.setTextSize(22);top.setPadding(20,20,20,20);root.addView(top);
            DeepSeekEnabledPreference enabled=new DeepSeekEnabledPreference(activity);enabled.setTitle("启用 AI 字幕翻译");row(enabled,root);
            heading(root,"API 配置");DeepSeekTextPreference url=new DeepSeekTextPreference(activity);url.setKey(DeepSeekTextPreference.KEY_BASE_URL);url.setTitle("API 地址");url.setSummary("兼容接口地址，停止输入后自动保存");View urlRow=row(url,root);
            assertTrue(((EditText)urlRow.findViewById(android.R.id.edit)).getMinimumHeight()>=CaptionSettingsStyle.dp(activity,48));
            ApiKeyPreference key=new ApiKeyPreference(activity);key.setKey(DeepSeekTextPreference.KEY_API_KEY);key.setTitle("API Key");row(key,root);
            DeepSeekModelPreference model=new DeepSeekModelPreference(activity);model.setKey(DeepSeekModelPreference.KEY_MODEL);model.setTitle("模型");row(model,root);
            heading(root,"字幕样式");SubtitleStylePreview pref=new SubtitleStylePreview(activity);View previewRow=row(pref,root);SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)previewRow.findViewWithTag("ai_style_preview_canvas");if(portrait)preview.performClick();
            for(String field:new String[]{DeepSeekSliderPreference.KEY_TEXT_SIZE,DeepSeekSliderPreference.KEY_OPACITY}){DeepSeekSliderPreference slider=new DeepSeekSliderPreference(activity);slider.setKey(field);slider.setTitle(field.equals(DeepSeekSliderPreference.KEY_TEXT_SIZE)?"字幕大小":"背景不透明度");slider.setSummary(field.equals(DeepSeekSliderPreference.KEY_TEXT_SIZE)?"相对字号 12–22，随画面比例缩放":"0% 为透明，100% 为不透明；松手保存");row(slider,root);}
            heading(root,"缓存与诊断");row(new DeepSeekDiagnosticsPreference(activity),root);
            root.measure(View.MeasureSpec.makeMeasureSpec(420,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));root.layout(0,0,420,root.getMeasuredHeight());
            Bitmap bitmap=Bitmap.createBitmap(420,root.getHeight(),Bitmap.Config.ARGB_8888);root.draw(new Canvas(bitmap));
            assertTrue(root.getHeight()>500);assertEquals(portrait,preview.portrait);
            String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");if(output!=null){File file=new File(output,"settings-"+(dark?"dark":"light")+"-"+(portrait?"portrait":"landscape")+".png");file.getParentFile().mkdirs();try(FileOutputStream out=new FileOutputStream(file)){assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,out));}}
            activity.finish();
        }
    }
}
