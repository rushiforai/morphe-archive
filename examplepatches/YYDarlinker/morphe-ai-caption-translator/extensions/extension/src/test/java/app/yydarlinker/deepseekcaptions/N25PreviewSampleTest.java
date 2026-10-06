package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.*;
import android.os.LocaleList;
import android.view.View;
import android.widget.TextView;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/**
 * N25 C: the one-line landscape sample in every supported interface language.
 *
 * <p>This fixture renders the real {@link SubtitleStylePreview} through the real Android text stack in
 * native graphics mode. It never inspects {@code maxLines} alone: it compares the laid-out line count,
 * the advance of the complete sample, the extent of the last glyph and the rasterized ink of the caption
 * background, and it renders every locale so the frames can be inspected one by one.</p>
 *
 * <p>The preview lays the caption out over the 2736px full-screen reference and then scales the whole
 * frame down exactly once, so the width the sample has to fit is the reference budget — not the preview
 * view's own pixel width.</p>
 */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N25PreviewSampleTest {
    /** The 14 interface languages the patch ships, paired with the BCP 47 tag used to resolve them. */
    private static final String[][] LOCALES={
            {"en","en"},{"zh-rCN","zh-CN"},{"zh-rTW","zh-TW"},{"es","es"},{"fr","fr"},{"de","de"},
            {"pt","pt"},{"ru","ru"},{"ja","ja"},{"ko","ko"},{"ar","ar"},{"hi","hi"},{"id","id"},{"vi","vi"}
    };
    private static final int[] CONTACT_WIDTHS={320,420,960};

    private Context locale(Activity activity,String tag){
        Configuration config=new Configuration(activity.getResources().getConfiguration());
        config.setLocales(new LocaleList(Locale.forLanguageTag(tag)));
        return activity.createConfigurationContext(config);
    }

    private Bitmap render(SubtitleStylePreview.Preview preview,int width){
        preview.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        preview.layout(0,0,preview.getMeasuredWidth(),preview.getMeasuredHeight());
        Bitmap bitmap=Bitmap.createBitmap(preview.getWidth(),preview.getHeight(),Bitmap.Config.ARGB_8888);
        preview.draw(new Canvas(bitmap));
        return bitmap;
    }

    private float referenceBudget(Context c){
        return SubtitleStylePreview.sampleTextWidthPx(c,SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX);
    }

    /**
     * The single source of truth for "the sample shows in full": no ellipsis, no dropped characters, the
     * complete string measured from the first glyph to the last, one laid-out line, and the last glyph
     * still inside the reference width budget. {@code box} is the label box, which adds its own horizontal
     * padding on top of that text run budget.
     */
    private void assertSampleShowsInFull(Context c,String label,String sample,int tier,float budget,float box){
        TextView view=SubtitleStylePreview.sampleLabel(c,sample,tier,70,
                SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX,SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX);
        assertEquals(label+" text was rewritten by the layout",sample,view.getText().toString());
        assertNull(label+" no ellipsis is allowed",view.getEllipsize());
        assertTrue(label+" tier "+tier+": the label box must stay inside the caption frame",
                view.getMeasuredWidth()<=box+0.5f);
        assertNotNull(label+" the sample must be laid out",view.getLayout());
        assertEquals(label+" tier "+tier+": the sample must be a single line",
                1,view.getLayout().getLineCount());
        assertFalse(label+" the line box must hold the complete sample",
                view.getLayout().getLineEnd(0)<sample.length());
        // The advance of the complete string is what has to fit: a clipped tail shows up here.
        float advance=view.getPaint().measureText(sample);
        assertTrue(label+" tier "+tier+": complete advance "+advance+" must fit the "+budget+"px budget",
                advance<=budget);
        float inkRight=view.getLayout().getLineRight(0);
        assertTrue(label+" tier "+tier+": the last glyph must end inside the text run",
                inkRight<=budget+1f);
    }

    @Test public void everyLocaleSampleShowsInFullAtEveryTier() throws Exception {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        JSONArray record=new JSONArray();
        try{
            float reference=SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX;
            for(String[] locale:LOCALES){
                String tag=locale[0];
                Context c=locale(activity,locale[1]);
                String sample=SubtitleStylePreview.sample(c);
                assertFalse(tag+" must resolve a sample through the catalog",sample==null||sample.trim().isEmpty());
                assertNotEquals(tag+" must not fall back to a raw key",SubtitleStylePreview.SAMPLE_KEY,sample);
                // The catalog lookup is the identity: the rendered string is the authored catalog value.
                assertEquals(tag+" must read the settings catalog",
                        CaptionStrings.settings(c,SubtitleStylePreview.SAMPLE_KEY),sample);
                assertTrue(tag+" must be a complete sentence",sample.trim().length()>1);
                float budget=referenceBudget(c);
                float box=budget+2*Math.round(6*c.getResources().getDisplayMetrics().density);
                for(int tier=0;tier<CaptionFontSize.COUNT;tier++){
                    assertSampleShowsInFull(c,tag,sample,tier,budget,box);
                }
                TextView widest=SubtitleStylePreview.sampleLabel(c,sample,CaptionFontSize.COUNT-1,70,reference,reference);
                TextView standard=SubtitleStylePreview.sampleLabel(c,sample,CaptionFontSize.DEFAULT_TIER,70,reference,reference);
                record.put(new JSONObject()
                        .put("locale",tag)
                        .put("sample",sample)
                        .put("reference_width_px",reference)
                        .put("text_budget_px",budget)
                        .put("box_px",box)
                        .put("widest_tier",CaptionFontSize.COUNT-1)
                        .put("widest_glyph_px",Math.round(CaptionFontSize.fullScreenGlyphHeightPx(CaptionFontSize.COUNT-1)*100f)/100f)
                        .put("widest_advance_px",Math.round(widest.getPaint().measureText(sample)*100f)/100f)
                        .put("widest_lines",widest.getLayout().getLineCount())
                        .put("widest_line_right_px",Math.round(widest.getLayout().getLineRight(0)*100f)/100f)
                        .put("widest_headroom_px",Math.round((budget-widest.getPaint().measureText(sample))*100f)/100f)
                        .put("standard_glyph_px",Math.round(CaptionFontSize.fullScreenGlyphHeightPx(CaptionFontSize.DEFAULT_TIER)*100f)/100f)
                        .put("standard_advance_px",Math.round(standard.getPaint().measureText(sample)*100f)/100f)
                        .put("standard_lines",standard.getLayout().getLineCount())
                        .put("code_points",sample.codePointCount(0,sample.length())));
            }
        }finally{activity.finish();}
        writeArtifact("n25-sample-measurements.json",record.toString(2));
    }

    /**
     * The rendered frame, not just the text metrics: the caption background must sit inside the video
     * frame with the whole string on one line, and every locale must produce real ink. Also confirms the
     * three contact-sheet widths keep a 16:9 frame so the frames below are comparable.
     */
    @Test public void renderedFrameKeepsTheCaptionInsideTheVideoAndDrawsTheWholeSample(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try{
            for(String[] locale:LOCALES){
                String tag=locale[0];
                Context c=locale(activity,locale[1]);
                SubtitleStylePreview.Preview preview=new SubtitleStylePreview.Preview(c);
                preview.sizeTier=CaptionFontSize.COUNT-1;preview.opacity=100;
                Bitmap bitmap=render(preview,420);
                RectF box=SubtitleStylePreview.LAST_CAPTION_BOX;
                assertNotNull("the preview must record its caption box",box);
                float scale=preview.getWidth()/SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX;
                float frameWidth=SubtitleStylePreview.frameWidth(preview.getWidth());
                float frameHeight=SubtitleStylePreview.stageHeight(preview.getWidth());
                // The caption is laid out over the 2736px reference and the frame is scaled once, so its
                // on-screen footprint is the reference box times that one scale factor.
                assertTrue(tag+": caption left edge leaves the frame",box.left>=-1f);
                assertTrue(tag+": caption right edge leaves the frame box="+box+" frameWidth="+frameWidth,
                        box.right<=frameWidth+1f);
                assertTrue(tag+": caption bottom leaves the frame",box.bottom<=frameHeight+1f);
                assertTrue(tag+": the caption box must have width",box.width()>0);
                // Ink check: the opaque caption background is the only near-black band in the frame.
                int left=Integer.MAX_VALUE,right=-1;
                for(int y=0;y<bitmap.getHeight();y++)for(int x=0;x<bitmap.getWidth();x++){
                    int pixel=bitmap.getPixel(x,y);
                    if(Color.alpha(pixel)<250)continue;
                    if(Color.red(pixel)>40||Color.green(pixel)>40)continue;
                    left=Math.min(left,x);right=Math.max(right,x);
                }
                assertTrue(tag+": the caption background must be rendered",right>=left);
                // The recorded box is already in frame pixels, so it is compared as-is; the width is
                // measured from the reference-space box times the single scale factor the preview applies.
                assertEquals(tag+": the rendered caption must start at the recorded left edge",
                        box.left,left,2f);
                TextView drawn=SubtitleStylePreview.sampleLabel(c,SubtitleStylePreview.sample(c),
                        CaptionFontSize.COUNT-1,100,SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX,
                        SubtitleStylePreview.LANDSCAPE_REFERENCE_WIDTH_PX);
                assertEquals(tag+": the rendered caption width must match its reference-space box",
                        drawn.getMeasuredWidth()*scale,right-left+1,2f);
                assertTrue(tag+": the rendered caption ink must stay inside the frame",
                        right<=frameWidth+1f&&left>=-1f);
                // Rasterizing the same locale twice must be deterministic.
                SubtitleStylePreview.Preview again=new SubtitleStylePreview.Preview(c);
                again.sizeTier=CaptionFontSize.COUNT-1;again.opacity=100;
                assertTrue(tag+": rendering must be stable",bitmap.sameAs(render(again,420)));
                writeArtifact("frames/preview-sample-"+tag+"-xl.png",bitmap);
            }
            // Contact-sheet widths: the frame stays 16:9 and the caption never leaves it.
            for(int width:CONTACT_WIDTHS){
                SubtitleStylePreview.Preview preview=new SubtitleStylePreview.Preview(activity);
                preview.sizeTier=CaptionFontSize.DEFAULT_TIER;preview.opacity=70;
                preview.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                assertEquals("the preview frame must stay 16:9",Math.round(width*9f/16f),preview.getMeasuredHeight());
            }
        }finally{activity.finish();}
    }

    private void writeArtifact(String name,Object content){
        String output=System.getenv("N25_PREVIEW_OUTPUT");
        if(output==null)return;
        File file=new File(output,name);
        file.getParentFile().mkdirs();
        try{
            if(content instanceof Bitmap){
                try(FileOutputStream stream=new FileOutputStream(file)){
                    assertTrue(((Bitmap)content).compress(Bitmap.CompressFormat.PNG,100,stream));
                }
            }else{
                try(FileOutputStream stream=new FileOutputStream(file)){
                    stream.write(String.valueOf(content).getBytes(StandardCharsets.UTF_8));
                }
            }
        }catch(IOException failed){
            throw new IllegalStateException(failed);
        }
    }
}
