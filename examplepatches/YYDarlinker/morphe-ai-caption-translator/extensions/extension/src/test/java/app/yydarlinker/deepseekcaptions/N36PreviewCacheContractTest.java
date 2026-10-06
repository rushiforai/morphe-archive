package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import java.util.List;
import java.util.Locale;
import static org.junit.Assert.*;

/**
 * N36 preview measurement contract.
 *
 * <p>Before N36 every {@code CaptionSettingPreference.getView} called {@code refreshCaptionText},
 * which unconditionally invalidated the preview label. A plain row rebind (scrolling the preview to
 * the top edge and back) therefore re-rasterized the reference-scale sample. The cache key now
 * contains every input the rasterization depends on, so an equal key must reuse the warm label while
 * a real locale / size / width / metric change must still rebuild exactly once.</p>
 */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N36PreviewCacheContractTest {
    private Activity a;
    @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().visible().get();}
    @After public void done(){a.finish();}

    private static final int WIDTH=480;

    private View measure(View row){
        row.measure(View.MeasureSpec.makeMeasureSpec(WIDTH,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(4000,View.MeasureSpec.AT_MOST));
        row.layout(0,0,WIDTH,row.getMeasuredHeight());
        return row;
    }

    private void draw(View row){
        Bitmap bitmap=Bitmap.createBitmap(WIDTH,Math.max(1,row.getHeight()),Bitmap.Config.ARGB_8888);
        row.draw(new Canvas(bitmap));
    }

    private SubtitleStylePreview.Preview canvasOf(View row){
        return (SubtitleStylePreview.Preview)row.findViewWithTag("ai_style_preview_canvas");
    }

    @Test public void ordinaryRebindKeepsWarmMeasurementAndRealChangeRebuildsOnce(){
        SubtitleStylePreview preference=new SubtitleStylePreview(a);
        LinearLayout host=new LinearLayout(a);
        View row=measure(preference.getView(null,host));
        draw(row);
        long warm=SubtitleStylePreview.sampleLayoutCalls;
        assertTrue("the first draw must measure the reference sample",warm>0);
        draw(row);
        assertEquals("a repeated draw of the same key must not re-measure",warm,SubtitleStylePreview.sampleLayoutCalls);
        // Ordinary rebinding of the same preference: same key, same locale, same style.
        for(int i=0;i<4;i++){
            View rebound=measure(preference.getView(row,host));
            draw(rebound);
            row=rebound;
        }
        assertEquals("same-key rebinds must keep the measured label",warm,SubtitleStylePreview.sampleLayoutCalls);
        // A real width change is a real measurement change and must rebuild exactly once.
        SubtitleStylePreview.Preview canvas=canvasOf(row);
        canvas.measure(View.MeasureSpec.makeMeasureSpec(WIDTH+120,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(4000,View.MeasureSpec.AT_MOST));
        canvas.layout(0,0,WIDTH+120,canvas.getMeasuredHeight());
        Bitmap wider=Bitmap.createBitmap(WIDTH+120,Math.max(1,canvas.getHeight()),Bitmap.Config.ARGB_8888);
        canvas.draw(new Canvas(wider));
        assertEquals(warm+1,SubtitleStylePreview.sampleLayoutCalls);
    }

    @Test public void sliderUpdateRebuildsExactlyOnce(){
        SubtitleStylePreview preference=new SubtitleStylePreview(a);
        LinearLayout host=new LinearLayout(a);
        View row=measure(preference.getView(null,host));
        draw(row);
        long warm=SubtitleStylePreview.sampleLayoutCalls;
        SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_TEXT_SIZE,CaptionFontSize.DEFAULT_TIER);
        draw(row);
        long afterSize=SubtitleStylePreview.sampleLayoutCalls;
        assertTrue("a real size change must rebuild",afterSize>warm);
        SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_OPACITY,72);
        draw(row);draw(row);
        assertEquals("the same new key must be measured once",afterSize+1,SubtitleStylePreview.sampleLayoutCalls);
    }

    @Test public void retainedPreviewSurvivesLocaleNeutralRebinding(){
        SubtitleStylePreview preference=new SubtitleStylePreview(a);
        LinearLayout host=new LinearLayout(a);
        View row=measure(preference.getView(null,host));
        draw(row);
        SubtitleStylePreview.Preview first=canvasOf(row);
        View rebound=measure(preference.getView(row,host));
        assertSame("the retained safe row is reused instead of building a new canvas",row,rebound);
        assertSame(first,canvasOf(rebound));
    }

    @Test public void previewKeepsSixteenByNineReferenceGeometry(){
        SubtitleStylePreview.Preview preview=new SubtitleStylePreview.Preview(a);
        preview.measure(View.MeasureSpec.makeMeasureSpec(WIDTH,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(4000,View.MeasureSpec.AT_MOST));
        assertEquals(WIDTH,SubtitleStylePreview.frameWidth(WIDTH),.001f);
        assertEquals(WIDTH*9f/16f,SubtitleStylePreview.stageHeight(WIDTH),.001f);
        assertEquals(2736f,SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX,.001f);
        assertEquals(Math.round(SubtitleStylePreview.stageHeight(WIDTH)),preview.getMeasuredHeight());
    }

    /** Five size tiers and a full localized sample line must still render into the frame. */
    @Test public void everySizeTierStillRendersTheLocalizedSample(){
        String sample=SubtitleStylePreview.sample(a);
        for(int tier=0;tier<CaptionFontSize.COUNT;tier++){
            SubtitleStylePreview.Preview preview=new SubtitleStylePreview.Preview(a);
            preview.opacity=100;preview.sizeTier=tier;
            preview.measure(View.MeasureSpec.makeMeasureSpec(WIDTH,View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(4000,View.MeasureSpec.AT_MOST));
            preview.layout(0,0,preview.getWidth(),preview.getHeight());
            Bitmap bitmap=Bitmap.createBitmap(Math.max(1,preview.getWidth()),Math.max(1,preview.getHeight()),Bitmap.Config.ARGB_8888);
            preview.draw(new Canvas(bitmap));
            assertNotNull("tier "+tier+" must produce a caption box",SubtitleStylePreview.LAST_CAPTION_BOX);
            assertTrue("tier "+tier+" caption box must stay inside the 16:9 frame",
                    SubtitleStylePreview.LAST_CAPTION_BOX.width()>0f);
        }
        assertFalse(sample.isEmpty());
    }

    @Test public void supportedLocalesResolveAnAuthoredSample(){
        assertFalse("the current interface locale must resolve the authored sample",
                SubtitleStylePreview.sample(a).isEmpty());
        assertNotEquals("a missing catalog entry must not leak the raw key",
                SubtitleStylePreview.SAMPLE_KEY,SubtitleStylePreview.sample(a));
        assertEquals(CaptionStrings.settings(a,SubtitleStylePreview.SAMPLE_KEY),SubtitleStylePreview.sample(a));
    }
}
