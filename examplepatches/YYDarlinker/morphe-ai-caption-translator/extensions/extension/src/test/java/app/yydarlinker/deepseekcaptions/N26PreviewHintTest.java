package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.LocaleList;
import android.view.*;
import android.widget.*;
import java.util.Locale;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real preview-hint binding and clipping at narrow widths / large system fonts. */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N26PreviewHintTest {
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
    @Test public void previewHintSaysFullScreenInEveryLocaleAndSurvivesNarrowOrLargeText() {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try {
            for(String[] locale:LOCALES) for(int widthDp:new int[]{320,420}) for(float scale:new float[]{1f,1.3f}) {
                Configuration config=new Configuration(activity.getResources().getConfiguration());
                config.setLocales(new LocaleList(Locale.forLanguageTag(locale[1])));config.fontScale=scale;
                Context context=activity.createConfigurationContext(config);
                FrameLayout host=new FrameLayout(context);
                LinearLayout row=(LinearLayout)new SubtitleStylePreview(context).onCreateView(host);
                assertEquals(2,row.getChildCount());TextView hint=(TextView)row.getChildAt(1);
                String where=locale[0]+" @"+widthDp+"dp/"+scale+"x";
                assertEquals(where,locale[2],hint.getText().toString());
                assertNull(where,hint.getEllipsize());assertFalse(where,hint.getMaxLines()==1);
                int width=Math.round(widthDp*context.getResources().getDisplayMetrics().density);
                host.addView(row,new FrameLayout.LayoutParams(width,ViewGroup.LayoutParams.WRAP_CONTENT));
                host.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                host.layout(0,0,host.getMeasuredWidth(),host.getMeasuredHeight());
                android.text.Layout layout=hint.getLayout();assertNotNull(where,layout);
                assertEquals(where+" truncated",hint.length(),layout.getLineEnd(layout.getLineCount()-1));
                assertTrue(where,hint.getHeight()>0&&hint.getBottom()<=row.getHeight());
                assertTrue(where+" overlaps preview",hint.getTop()>=row.getChildAt(0).getBottom());
            }
        } finally { activity.finish(); }
    }
}
