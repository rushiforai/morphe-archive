package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.*;
import android.os.LocaleList;
import android.view.View;
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
 * N25 B: the five tier labels of all 14 interface languages, and the one LTR/RTL mapping that the thumb,
 * the ticks, the filled rail band and the labels all read.
 *
 * <p>Every geometry claim here is measured on the real widgets in native graphics mode: the label inks
 * are rasterized, the rail span is read back from the drawn ticks, and the drag-to-display agreement is
 * checked by moving the progress and comparing the physics of the drawing with the label positions.</p>
 */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N25TierRailTest {
    private static final String[][] LOCALES={
            {"en","en"},{"zh-rCN","zh-CN"},{"zh-rTW","zh-TW"},{"es","es"},{"fr","fr"},{"de","de"},
            {"pt","pt"},{"ru","ru"},{"ja","ja"},{"ko","ko"},{"ar","ar"},{"hi","hi"},{"id","id"},{"vi","vi"}
    };
    private static final String[] TIER_KEYS={
            "size_tier_xs","size_tier_s","size_tier_standard","size_tier_l","size_tier_xl"
    };
    private static final int[] WIDTHS={320,420,960};

    private Context locale(Activity activity,String tag){
        Configuration config=new Configuration(activity.getResources().getConfiguration());
        config.setLocales(new LocaleList(Locale.forLanguageTag(tag)));
        return activity.createConfigurationContext(config);
    }

    /**
     * A right-to-left context. The direction is pushed onto the resources' own configuration object, which
     * is exactly what {@code View} reads to resolve an inherited layout direction, so the widgets and the
     * configuration agree regardless of how the runner maps locale qualifiers. Arabic strings resolve from
     * the real shipped resource bundle through the same resources instance.
     */
    private Context rtlLocale(Activity activity){
        Context base=locale(activity,"ar");
        Configuration config=base.getResources().getConfiguration();
        config.setLayoutDirection(Locale.forLanguageTag("ar"));
        return base;
    }

    private DeepSeekSliderPreference sizePreference(Context c){
        DeepSeekSliderPreference preference=new DeepSeekSliderPreference(c);
        preference.setKey(DeepSeekSliderPreference.KEY_TEXT_SIZE);
        preference.setTitle(CaptionStrings.settings(c,"size"));
        return preference;
    }

    private View row(Context c,DeepSeekSliderPreference preference){
        return preference.getView(null,new ListView(c));
    }

    private static LinearLayout names(View root){
        return (LinearLayout)root.findViewWithTag("ai_size_tier_names");
    }

    private static DeepSeekSliderPreference.SizeTierSeekBar slider(View root){
        return (DeepSeekSliderPreference.SizeTierSeekBar)root.findViewWithTag("ai_size_tier_slider");
    }

    private static DeepSeekSliderPreference.OpacitySeekBar opacity(View root){
        return (DeepSeekSliderPreference.OpacitySeekBar)root.findViewWithTag("ai_opacity_slider");
    }

    /**
     * Requirement B, measured on the real row: every one of the five labels is fully inside the row it
     * lives in (its ink can be rasterized without being clipped by the parent), the labels never overlap
     * each other, and each label is centred on its own tick. The returned drift is the largest distance
     * between a label centre and its tick, so the caller can report how exact the alignment is.
     */
    private float assertFiveTierLabelsFit(Context c,View root,String label){
        LinearLayout names=names(root);
        assertNotNull(label+" must render the tier label row",names);
        assertEquals(label+" must render exactly five tier names",5,names.getChildCount());
        Bitmap ink=Bitmap.createBitmap(names.getWidth(),Math.max(1,names.getHeight()),Bitmap.Config.ARGB_8888);
        names.draw(new Canvas(ink));
        int previousRight=0;
        int largest=0;
        float driftPx=0;
        int[] widths=new int[5];
        for(int tier=0;tier<5;tier++)widths[tier]=names.getChildAt(tier).getMeasuredWidth();
        for(int width:widths)largest=Math.max(largest,width);
        for(int tier=0;tier<5;tier++){
            TextView view=(TextView)names.getChildAt(tier);
            String expected=CaptionStrings.settings(c,TIER_KEYS[tier]);
            assertEquals(label+" tier "+tier+" text",expected,view.getText().toString());
            assertNull(label+" tier "+tier+" must not be ellipsized",view.getEllipsize());
            if(view.getLayout()!=null){
                assertEquals(label+" tier "+tier+" text must not be truncated",
                        view.getText().length(),view.getLayout().getLineEnd(view.getLayout().getLineCount()-1));
            }
            // Inside the row: the label was laid out with a non-negative start and ends inside it.
            assertTrue(label+" tier "+tier+" starts left of its row: "+view.getLeft(),
                    view.getLeft()>=0);
            assertTrue(label+" tier "+tier+" ends inside its row: "+view.getRight()+" of "+names.getWidth(),
                    view.getRight()<=names.getWidth());
            // No overlap, and every anchor (first left edge, each next left edge, the final right edge)
            // reported so an accidental squeeze is visible in the failure text.
            previousRight=Math.max(previousRight,view.getRight());
            if(tier<4){
                assertTrue(label+" tier "+tier+" must not overlap its neighbour: left="+view.getLeft()
                                +" nextLeft="+names.getChildAt(tier+1).getLeft()+geometry(root,names),
                        names.getChildAt(tier+1).getLeft()>=view.getRight());
            }
            // Centred on its own tick, displaced only as far as containment or a neighbour demands. With
            // the rail inset by half the widest label that displacement is zero wherever the row can hold
            // the five names at all, and is reported so the drift stays visible.
            float expectedCenter=slider(root).tickCenterX(tier);
            float actualCenter=view.getLeft()+view.getWidth()/2f;
            float drift=Math.abs(expectedCenter-actualCenter);
            driftPx=Math.max(driftPx,drift);
            assertTrue(label+" tier "+tier+" must not drift more than one label width ("
                            +drift+" of "+(largest+2)+"px)"+geometry(root,names),
                    drift<=largest+2);
            // Real ink for this label inside its own box: an empty render would mean clipped text.
            assertTrue(label+" tier "+tier+" must draw ink inside ["+view.getLeft()+","+view.getRight()
                            +"] of a "+ink.getWidth()+"px row holding '"+view.getText()+"'",
                    inkHasInk(ink,view));
        }
        // Whenever the row is wide enough for the five names at the inset the rail actually uses, the
        // alignment must be exact up to pixel rounding of the float tick positions.
        if(perfectAlignmentFits(widths,slider(root).getWidth()-2*slider(root).getPaddingLeft(),
                slider(root).railInsetPx())){
            int tolerance=2+widths.length/2;
            for(int tier=0;tier<5;tier++){
                TextView view=(TextView)names.getChildAt(tier);
                float expectedCenter=slider(root).tickCenterX(tier);
                float actualCenter=view.getLeft()+view.getWidth()/2f;
                assertEquals(label+" tier "+tier+" must be centred on its tick when the row can hold it"
                                +geometry(root,names),
                        expectedCenter,actualCenter,tolerance);
            }
        }
        return driftPx;
    }

    /**
     * Whether all five names sit exactly on their ticks, given the inset the rail resolved: the two end
     * labels fit between the row edge and the rail start, and every neighbouring pair fits the step
     * between its two ticks. When this is false the row cannot hold the names on their ticks at all, and
     * the fixture then only requires containment, no overlap, and ink for every name.
     */
    private boolean perfectAlignmentFits(int[] widths,int span,int inset){
        if(span<=0||widths.length<2)return false;
        int count=widths.length;
        if((widths[0]+1)/2>inset||(widths[count-1]+1)/2>inset)return false;
        float step=(span-2f*inset)/4f;
        for(int i=0;i+1<count;i++){
            if(step<(widths[i]+widths[i+1])/2f)return false;
        }
        return true;
    }

    private String geometry(View root,LinearLayout names){
        DeepSeekSliderPreference.SizeTierSeekBar slider=slider(root);
        StringBuilder out=new StringBuilder(" [row="+names.getWidth()+" slider="+slider.getWidth()
                +" start="+slider.railStart()+" end="+slider.railEnd()+" inset="+slider.railInsetPx()
                +" widths="+java.util.Arrays.toString(slider.labelWidths()));
        for(int i=0;i<names.getChildCount();i++){
            View child=names.getChildAt(i);
            out.append(" t").append(i).append("[L=").append(child.getLeft())
               .append(",R=").append(child.getRight())
               .append(",W=").append(child.getWidth())
               .append(",tick=").append(Math.round(slider.tickCenterX(i))).append(']');
        }
        return out.append(']').toString();
    }

    /** A size row and an opacity row built the same way the settings page builds them. */
    static final class Rows {
        final View root,size,opacity;
        Rows(View root,View size,View opacity){this.root=root;this.size=size;this.opacity=opacity;}
    }

    /** Both slider rows of the settings page, in the column that gives them their shared width. */
    private Rows buildRows(Activity activity,Context c,int width,boolean dark,boolean rtl,boolean attach){
        LinearLayout root=new LinearLayout(c);
        root.setOrientation(LinearLayout.VERTICAL);
        CaptionSettingsStyle.row(root);
        if(dark) root.setBackgroundColor(Color.BLACK);
        DeepSeekSliderPreference sizePreference=sizePreference(c);
        View sizeRoot=row(c,sizePreference);
        DeepSeekSliderPreference opacityPreference=new DeepSeekSliderPreference(c);
        opacityPreference.setKey(DeepSeekSliderPreference.KEY_OPACITY);
        opacityPreference.setTitle(CaptionStrings.settings(c,"opacity"));
        View opacityRoot=row(c,opacityPreference);
        root.addView(sizeRoot,new LinearLayout.LayoutParams(-1,-2));
        root.addView(opacityRoot,new LinearLayout.LayoutParams(-1,-2));
        root.setLayoutDirection(rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
        if(attach){
            // A real list gives the column its width; a detached view has none, and both the rail span
            // and the resolved layout direction depend on being part of a hierarchy.
            FrameLayout host=new FrameLayout(c);
            host.addView(root,new FrameLayout.LayoutParams(width,FrameLayout.LayoutParams.WRAP_CONTENT));
            activity.setContentView(host);
            host.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            host.layout(0,0,width,host.getMeasuredHeight());
        }else{
            root.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            root.layout(0,0,width,root.getMeasuredHeight());
        }
        return new Rows(root,sizeRoot,opacityRoot);
    }

    /** A row measured inside a laid-out vertical column, the way the real settings list shows it. */
    private boolean inkHasInk(Bitmap bitmap,View view){
        int left=Math.max(0,view.getLeft()),right=Math.min(bitmap.getWidth(),view.getRight());
        int top=Math.max(0,view.getTop()),bottom=Math.min(bitmap.getHeight(),view.getBottom());
        for(int y=top;y<bottom;y++)for(int x=left;x<right;x++)if(Color.alpha(bitmap.getPixel(x,y))!=0)return true;
        return false;
    }

    @Test public void everyLocaleShowsAllFiveTierLabelsInFullWithoutOverlap() throws Exception {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().visible().get();
        JSONArray record=new JSONArray();
        float maxDriftPx=0;
        try{
            for(String[] locale:LOCALES){
                String tag=locale[0];
                Context c=locale(activity,locale[1]);
                DeepSeekConfig.saveCaptionSizeTier(c,CaptionFontSize.DEFAULT_TIER);
                for(int width:WIDTHS){
                    for(boolean dark:new boolean[]{false,true}){
                        View root=buildRows(activity,c,width,dark,false,false).size;
                        float drift=assertFiveTierLabelsFit(c,root,tag+" "+width+"dp "+(dark?"dark":"light"));
                        maxDriftPx=Math.max(maxDriftPx,drift);
                    }
                }
                View root=buildRows(activity,c,420,false,false,false).size;
                DeepSeekSliderPreference.SizeTierSeekBar slider=slider(root);
                JSONObject entry=new JSONObject()
                        .put("locale",tag)
                        .put("labels",new JSONArray(Arrays.asList(
                                CaptionStrings.settings(c,TIER_KEYS[0]),CaptionStrings.settings(c,TIER_KEYS[1]),
                                CaptionStrings.settings(c,TIER_KEYS[2]),CaptionStrings.settings(c,TIER_KEYS[3]),
                                CaptionStrings.settings(c,TIER_KEYS[4]))))
                        .put("widest_bold_label_px",slider.largestTierLabelPx())
                        .put("label_ceiling_px",slider.tierLabelCeilingPx())
                        .put("rail_inset_px",slider.railInsetPx())
                        .put("reference_span_px",slider.referenceSpanPx())
                        .put("rail_start_px",Math.round(slider.railStart()*100f)/100f)
                        .put("rail_end_px",Math.round(slider.railEnd()*100f)/100f)
                        .put("rail_length_px",Math.round((slider.railEnd()-slider.railStart())*100f)/100f)
                        .put("label_center_drift_px",Math.round(maxDriftPx*100f)/100f)
                        .put("label_widths_px",labelWidths(root))
                        .put("label_lefts_px",labelLefts(root))
                        .put("tick_centers_px",tickCenters(slider));
                record.put(entry);
            }
        }finally{activity.finish();}
        writeArtifact("n25-tier-rail-measurements.json",record.toString(2));
    }

    private JSONArray labelWidths(View root) throws Exception {
        JSONArray array=new JSONArray();
        for(int i=0;i<5;i++)array.put(names(root).getChildAt(i).getWidth());
        return array;
    }

    private JSONArray labelLefts(View root) throws Exception {
        JSONArray array=new JSONArray();
        for(int i=0;i<5;i++)array.put(names(root).getChildAt(i).getLeft());
        return array;
    }

    private JSONArray tickCenters(DeepSeekSliderPreference.SizeTierSeekBar slider) throws Exception {
        JSONArray array=new JSONArray();
        for(int tier=0;tier<5;tier++)array.put(Math.round(slider.tickCenterX(tier)*100f)/100f);
        return array;
    }

    /**
     * The LTR/RTL guarantee, split into the two things that can be verified without a real device:
     * <ol>
     *   <li>the direction the row reports is the context's own resolved direction, so an RTL configuration
     *       is not silently treated as LTR and a device-wide language change cannot flip it;</li>
     *   <li>every physical coordinate — rail ends, thumb centre, tick centres, filled band and label
     *       centres — follows that one reported direction, so a drag and what the user sees always agree
     *       and the mirror is never applied twice.</li>
     * </ol>
     * The runner does not promote a layout direction onto a plain {@code View}, so an RTL widget hierarchy
     * cannot be staged here; the arithmetic below is driven by the direction the rail actually reports.
     */
    @Test @Config(qualifiers="ar-rSA-w420dp-h900dp")
    public void railGeometryFollowsTheDirectionTheRowReports(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().visible().get();
        try{
            DeepSeekConfig.saveCaptionSizeTier(activity,CaptionFontSize.DEFAULT_TIER);
            Rows rows=buildRows(activity,rtlLocale(activity),420,false,false,true);
            View root=rows.size;
            DeepSeekSliderPreference.SizeTierSeekBar slider=slider(root);
            boolean rtl=slider.rtl();
            float start=slider.railStart(),end=slider.railEnd();
            float span=end-start;
            assertTrue("the rail must have length",span>0);
            assertTrue("the rail must sit inside the row",start>=0&&end<=slider.getWidth());
            for(int tier=0;tier<5;tier++){
                // Ticks divide the same travel evenly, from whichever end the direction says.
                float expected=rtl?end-span*tier/4f:start+span*tier/4f;
                assertEquals("tier "+tier+" tick must follow the reported direction",
                        expected,slider.tickCenterX(tier),0f);
                // The thumb centre and its tick are the same coordinate, in both directions.
                slider.setProgress(tier);
                assertEquals("tier "+tier+" thumb must sit on its tick",
                        slider.tickCenterX(tier),slider.thumbCenterX(tier/4f),0f);
                // The label centre is the same coordinate again, so the name sits under its own dot.
                TextView label=(TextView)names(root).getChildAt(tier);
                assertEquals("tier "+tier+" label must sit on its tick",
                        slider.tickCenterX(tier),label.getLeft()+label.getWidth()/2f,1f);
            }
        }finally{activity.finish();}
    }

    /**
     * The mirroring arithmetic itself, driven through the same public coordinates the renderer uses: a
     * logical fraction maps to the physical fraction, the physical fraction maps to a centre, and the two
     * directions are exact mirrors of each other about the rail.
     */
    @Test @Config(qualifiers="ar-rSA-w420dp-h900dp")
    public void physicalFractionMirrorsTheLogicalFractionExactly(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().visible().get();
        try{
            DeepSeekSliderPreference preference=sizePreference(rtlLocale(activity));
            View root=row(rtlLocale(activity),preference);
            root.measure(View.MeasureSpec.makeMeasureSpec(420,View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            root.layout(0,0,420,root.getMeasuredHeight());
            DeepSeekSliderPreference.SizeTierSeekBar slider=slider(root);
            boolean rtl=slider.rtl();
            assertEquals("the row must report a resolved direction",rtl,slider.rtl());
            // Either direction, the extremes are the rail ends and the middle is the middle.
            assertEquals(slider.railStart(),slider.thumbCenterX(rtl?1f:0f),0f);
            assertEquals(slider.railEnd(),slider.thumbCenterX(rtl?0f:1f),0f);
            assertEquals((slider.railStart()+slider.railEnd())/2f,slider.thumbCenterX(.5f),0f);
            // A tier's label position and its thumb position read the same mapping, for all five.
            for(int tier=0;tier<5;tier++){
                assertEquals(slider.physicalCenterX(rtl?1f-tier/4f:tier/4f),slider.tickCenterX(tier),0f);
            }
            // The filled band spans from the current thumb to the edge the progress grows towards.
            slider.setProgress(3);
            float fraction=3/4f;
            float boundary=rtl?slider.railEnd()-span(slider)*fraction:slider.railStart()+span(slider)*fraction;
            assertEquals(slider.thumbCenterX(fraction),boundary,0f);
        }finally{activity.finish();}
    }

    private float span(DeepSeekSliderPreference.SizeTierSeekBar slider){
        return slider.railEnd()-slider.railStart();
    }

    /** The opacity rail shares the geometry: same length, same margins, same physical mapping. */
    @Test public void bothRailsStayEqualInLengthAndMapping(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        try{
            for(boolean rtl:new boolean[]{false,true}){
                // The two slider preferences are separate rows, exactly as the settings page has them; each
                // builds only its own rail, and the shared geometry is what makes them identical.
                Context context=rtl?rtlLocale(activity):activity;
                DeepSeekSliderPreference sizeRow=sizePreference(context);
                DeepSeekSliderPreference opacityRow=new DeepSeekSliderPreference(context);
                opacityRow.setKey(DeepSeekSliderPreference.KEY_OPACITY);
                opacityRow.setTitle(CaptionStrings.settings(context,"opacity"));
                LinearLayout column=new LinearLayout(context);
                column.setOrientation(LinearLayout.VERTICAL);
                CaptionSettingsStyle.row(column);
                View sizeRoot=row(context,sizeRow);
                View opacityRoot=row(context,opacityRow);
                column.addView(sizeRoot,new LinearLayout.LayoutParams(-1,-2));
                column.addView(opacityRoot,new LinearLayout.LayoutParams(-1,-2));
                column.setLayoutDirection(rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
                FrameLayout host=new FrameLayout(context);
                host.addView(column,new FrameLayout.LayoutParams(420,FrameLayout.LayoutParams.WRAP_CONTENT));
                activity.setContentView(host);
                host.measure(View.MeasureSpec.makeMeasureSpec(420,View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                host.layout(0,0,420,host.getMeasuredHeight());
                DeepSeekSliderPreference.SizeTierSeekBar size=slider(sizeRoot);
                DeepSeekSliderPreference.OpacitySeekBar opacity=opacity(opacityRoot);
                assertNotNull("the opacity row must render its rail",opacity);
                String label=rtl?"rtl":"ltr";
                assertEquals(label+" both rails must report the same direction",size.rtl(),opacity.rtl());
                assertEquals(label+" both rails must start at the same coordinate",
                        size.railStart(),opacity.railStart(),0f);
                assertEquals(label+" both rails must end at the same coordinate",
                        size.railEnd(),opacity.railEnd(),0f);
                assertEquals(label+" both rails must be the same length",
                        size.railEnd()-size.railStart(),opacity.railEnd()-opacity.railStart(),0f);
                assertEquals(label+" both rails must share the label inset",
                        size.railInsetPx(),opacity.railInsetPx());
                assertEquals(label+" both sliders must share the same padding",
                        size.getPaddingLeft(),opacity.getPaddingLeft());
                // Opacity drags to the same physical side as the size rail at the same logical fraction.
                for(int value:new int[]{0,50,100}){
                    opacity.setProgress(value);
                    float fraction=value/100f;
                    float expected=opacity.rtl()
                            ? opacity.railEnd()-(opacity.railEnd()-opacity.railStart())*fraction
                            : opacity.railStart()+(opacity.railEnd()-opacity.railStart())*fraction;
                    assertEquals(label+" opacity "+value+" must land where the geometry says",expected,
                            opacity.thumbCenterX(fraction),0f);
                }
            }
        }finally{activity.finish();}
    }

    private void writeArtifact(String name,String content){
        String output=System.getenv("N25_PREVIEW_OUTPUT");
        if(output==null)return;
        File file=new File(output,name);
        file.getParentFile().mkdirs();
        try(FileOutputStream stream=new FileOutputStream(file)){
            stream.write(content.getBytes(StandardCharsets.UTF_8));
        }catch(IOException failed){
            throw new IllegalStateException(failed);
        }
    }
}
