package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.*;
import android.os.LocaleList;
import android.preference.Preference;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/**
 * N26: the two pieces of text this card touches, rendered in every shipped interface language.
 *
 * <p>The preview hint under the style canvas must say the preview is the full-screen one, in the
 * application language, and it must stay complete when the row is narrow or the system font is large:
 * it may wrap, but it may not clip, ellipsize or run into the slider below it. The entry row on the video
 * page must show the localized title and summary the shipped resources carry.
 *
 * <p>Frames are written for the locales the card asks to be inspected by eye; every locale is checked by
 * measurement, so the visual pass is a sample of a fully covered set and not the coverage itself.
 */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N26PreviewHintTest {
    /** locale tag, BCP-47 tag for the configuration context, expected cap_preview_hint. */
    private static final String[][] LOCALES={
            {"en","en","Style preview (full screen)"},
            {"zh-rCN","zh-CN","样式预览（全屏）"},
            {"zh-rTW","zh-TW","樣式預覽（全螢幕）"},
            {"es","es","Vista previa de estilo (pantalla completa)"},
            {"fr","fr","Aperçu du style (plein écran)"},
            {"de","de","Stilvorschau (Vollbild)"},
            {"pt","pt","Prévia do estilo (tela cheia)"},
            {"ru","ru","Предпросмотр стиля (полный экран)"},
            {"ja","ja","スタイルプレビュー（全画面）"},
            {"ko","ko","스타일 미리보기(전체 화면)"},
            {"ar","ar","معاينة النمط (ملء الشاشة)"},
            {"hi","hi","शैली पूर्वावलोकन (पूर्ण स्क्रीन)"},
            {"id","id","Pratinjau gaya (layar penuh)"},
            {"vi","vi","Xem trước kiểu (toàn màn hình)"},
    };
    /** The four locales the card asks to be looked at one by one. */
    private static final Set<String> INSPECTED=new HashSet<>(Arrays.asList("zh-rCN","en","ru","ar"));
    private static final int[] WIDTHS={320,420};
    private static final float[] FONT_SCALES={1f,1.3f};

    private Context locale(Activity activity,String tag){
        Configuration config=new Configuration(activity.getResources().getConfiguration());
        config.setLocales(new LocaleList(Locale.forLanguageTag(tag)));
        return activity.createConfigurationContext(config);
    }

    private static TextView hintOf(LinearLayout root){
        assertEquals("the preview row is the canvas plus the hint",2,root.getChildCount());
        return (TextView)root.getChildAt(1);
    }

    @Test public void previewHintSaysFullScreenInEveryLocaleAndSurvivesNarrowOrLargeText()throws Exception{
        JSONObject record=new JSONObject();
        JSONArray rows=new JSONArray();
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");
        for(String[] entry:LOCALES){
            String tag=entry[0];
            Context c=locale(activity,entry[1]);
            for(int widthDp:WIDTHS)for(float scale:FONT_SCALES){
                Configuration config=new Configuration(c.getResources().getConfiguration());
                config.fontScale=scale;
                Context scaled=c.createConfigurationContext(config);
                SubtitleStylePreview preference=new SubtitleStylePreview(scaled);
                FrameLayout host=new FrameLayout(scaled);
                LinearLayout root=(LinearLayout)preference.onCreateView(host);
                TextView hint=hintOf(root);
                assertEquals(tag+" @"+widthDp+"dp/"+scale+"x: wrong hint text",entry[2],hint.getText().toString());
                assertNull(tag+": the hint must not ellipsize",hint.getEllipsize());
                assertFalse(tag+": the hint must not be single-line-only",hint.getMaxLines()==1);
                float density=scaled.getResources().getDisplayMetrics().density;
                host.addView(root,new FrameLayout.LayoutParams(Math.round(widthDp*density),ViewGroup.LayoutParams.WRAP_CONTENT));
                host.measure(View.MeasureSpec.makeMeasureSpec(Math.round(widthDp*density),View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                host.layout(0,0,host.getMeasuredWidth(),host.getMeasuredHeight());
                android.text.Layout layout=hint.getLayout();
                assertNotNull(tag+": the hint was never laid out",layout);
                // Complete: every character the string has must be on some line of the rendered layout.
                assertEquals(tag+" @"+widthDp+"dp/"+scale+"x: the hint was truncated",
                        hint.getText().length(),layout.getLineEnd(layout.getLineCount()-1));
                assertTrue(tag+" @"+widthDp+"dp/"+scale+"x: the hint has no height",hint.getHeight()>0);
                assertTrue(tag+" @"+widthDp+"dp/"+scale+"x: the hint runs past the row",
                        hint.getBottom()<=root.getHeight());
                // No overlap: the canvas ends at or before the hint starts.
                View canvas=root.getChildAt(0);
                assertTrue(tag+" @"+widthDp+"dp/"+scale+"x: the hint overlaps the canvas",hint.getTop()>=canvas.getBottom());
                if(widthDp==420&&scale==1f){
                    rows.put(new JSONObject().put("locale",tag).put("hint",entry[2])
                            .put("lines",layout.getLineCount()).put("height_px",hint.getHeight())
                            .put("row_height_px",root.getHeight()));
                }
                if(output!=null&&INSPECTED.contains(tag)&&widthDp==320&&scale==1.3f){
                    Bitmap bitmap=Bitmap.createBitmap(host.getWidth(),host.getHeight(),Bitmap.Config.ARGB_8888);
                    host.draw(new Canvas(bitmap));
                    File file=new File(output,"n26-preview-hint-"+tag+"-320dp-large-font.png");
                    file.getParentFile().mkdirs();
                    try(FileOutputStream out=new FileOutputStream(file)){assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,out));}
                }
            }
        }
        record.put("preview_hint",rows);
        record.put("widths_dp",WIDTHS).put("font_scales",FONT_SCALES);
        write(output,"n26-preview-hint-measurements.json",record);
        assertEquals("every shipped locale must be covered",LOCALES.length,rows.length());
        activity.finish();
    }

    @Test public void videoPageEntryRowShowsTheLocalizedTitleAndSummary()throws Exception{
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");
        JSONArray rows=new JSONArray();
        for(String[] entry:LOCALES){
            Context c=locale(activity,entry[1]);
            // Exactly the two strings the shipped screen carries, resolved for this locale.
            String title=c.getResources().getString(
                    c.getResources().getIdentifier("cap_ai_title","string",c.getPackageName()));
            String summary=c.getResources().getString(
                    c.getResources().getIdentifier("cap_autosave","string",c.getPackageName()));
            assertNotNull(entry[0]+": the entry has no localized title",title);
            assertFalse(entry[0]+": the entry title fell back to the raw key",title.startsWith("cap_"));
            assertNotNull(entry[0]+": the entry has no localized summary",summary);
            rows.put(new JSONObject().put("locale",entry[0]).put("title",title).put("summary",summary));
            if(output!=null&&INSPECTED.contains(entry[0])){
                int widthPx=Math.round(420*c.getResources().getDisplayMetrics().density);
                FrameLayout frame=new FrameLayout(c);
                LinearLayout root=new LinearLayout(c);root.setOrientation(LinearLayout.VERTICAL);
                root.setBackgroundColor(Color.WHITE);
                frame.addView(root,new FrameLayout.LayoutParams(widthPx,ViewGroup.LayoutParams.WRAP_CONTENT));
                Preference row=new Preference(c);
                row.setKey("morphe_vot_screen__ai_captions");row.setTitle(title);row.setSummary(summary);
                View view=row.getView(null,root);
                // Robolectric does not push layout direction down to plain views (measured in N25), so the
                // direction is set on the row itself; without it an RTL row rasterizes as if it were LTR.
                boolean rtl=android.text.TextUtils.getLayoutDirectionFromLocale(java.util.Locale.forLanguageTag(entry[1]))
                        ==View.LAYOUT_DIRECTION_RTL;
                view.setLayoutDirection(rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
                root.addView(view,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
                frame.measure(View.MeasureSpec.makeMeasureSpec(widthPx,View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                frame.layout(0,0,frame.getMeasuredWidth(),frame.getMeasuredHeight());
                Bitmap bitmap=Bitmap.createBitmap(frame.getWidth(),frame.getHeight(),Bitmap.Config.ARGB_8888);
                frame.draw(new Canvas(bitmap));
                File file=new File(output,"n26-video-entry-"+entry[0]+".png");
                file.getParentFile().mkdirs();
                try(FileOutputStream out=new FileOutputStream(file)){assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,out));}
            }
        }
        write(output,"n26-video-entry-titles.json",new JSONObject().put("entry",rows));
        assertEquals("every shipped locale must be covered",LOCALES.length,rows.length());
        activity.finish();
    }

    private static void write(String output,String name,JSONObject content)throws Exception{
        if(output==null)return;
        File file=new File(output,name);
        file.getParentFile().mkdirs();
        try(FileOutputStream out=new FileOutputStream(file)){out.write(content.toString(2).getBytes(StandardCharsets.UTF_8));}
    }
}
