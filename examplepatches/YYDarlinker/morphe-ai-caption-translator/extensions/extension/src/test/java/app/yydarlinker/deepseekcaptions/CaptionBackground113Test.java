package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.*;
import android.text.Layout;
import android.view.View;
import android.widget.TextView;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE, sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionBackground113Test {
    private TextView text(Activity activity, String value, int width) {
        TextView view=new TextView(activity); view.setLayoutParams(new android.widget.FrameLayout.LayoutParams(width,-2));
        view.setTextSize(28);view.setPadding(12,6,12,6);view.setGravity(android.view.Gravity.CENTER);
        view.setIncludeFontPadding(false);view.setMaxLines(2);
        view.setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED);
        view.setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE);
        view.setText(value);measure(view,width);return view;
    }
    private void measure(TextView view,int width){
        view.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        view.layout(0,0,view.getMeasuredWidth(),view.getMeasuredHeight());
    }
    private CaptionTextBackground background(TextView view){
        CaptionTextBackground bg=new CaptionTextBackground(view,70,5);view.setBackground(bg);
        bg.setBounds(0,0,view.getWidth(),view.getHeight());return bg;
    }
    @Test public void balancedTwoLinesDoNotPaintTheEntireLayoutWidth() {
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        TextView view=text(a,"还有很多其他因素，对手机屏幕跌落时\n是否会碎裂有着同等甚至更大的影响。",1700);
        CaptionTextBackground bg=background(view);Layout layout=view.getLayout();
        assertEquals(2,layout.getLineCount());RectF box=bg.textBounds();
        float widest=Math.max(layout.getLineMax(0),layout.getLineMax(1));
        assertTrue(box.width()>0);assertEquals(widest+24,box.width(),1f);
        assertTrue(box.width()<view.getWidth());assertEquals(850,box.centerX(),1f);
        assertSame(layout,view.getLayout());assertEquals(1700,view.getWidth());
        a.finish();
    }
    @Test public void backgroundDrawAndElevationUseSameTightBox() {
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        TextView view=text(a,"first line\nsecond line",1000);CaptionTextBackground bg=background(view);
        final RectF drawn=new RectF();final int[] alpha={-1};
        Canvas canvas=new Canvas(){@Override public void drawRoundRect(RectF box,float rx,float ry,Paint paint){drawn.set(box);alpha[0]=paint.getAlpha();}};
        bg.draw(canvas);assertEquals(bg.textBounds(),drawn);assertEquals(SubtitleStyleMetrics.alpha(70),alpha[0]);
        Outline outline=new Outline();bg.getOutline(outline);Rect shadow=new Rect();assertTrue(outline.getRect(shadow));
        assertEquals((int)Math.floor(drawn.left),shadow.left);assertEquals((int)Math.ceil(drawn.right),shadow.right);
        bg.setAlpha(40);bg.draw(canvas);assertEquals(40,alpha[0]);a.finish();
    }
    @Test public void noLayoutDoesNotFlashAFullWidthBackground() {
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        CaptionTextBackground bg=new CaptionTextBackground(new TextView(a),70,5);bg.setBounds(0,0,1700,100);
        assertTrue(bg.textBounds().isEmpty());Outline outline=new Outline();bg.getOutline(outline);assertTrue(outline.isEmpty());a.finish();
    }
    @Test public void asymmetricPaddingAndScrollingStayInsideDrawable() {
        Rect area=new Rect(10,0,1010,100);
        RectF box=CaptionTextBackground.contentBounds(area,300,600,12,20,5);
        assertEquals(new RectF(305,0,637,100),box);
        assertEquals(new RectF(10,0,1010,100),CaptionTextBackground.contentBounds(area,-30,2000,12,20,0));
        assertTrue(CaptionTextBackground.contentBounds(area,Float.NaN,100,12,20,0).isEmpty());
        assertTrue(CaptionTextBackground.contentBounds(area,100,100,12,20,0).isEmpty());
    }
    @Test public void changingTextAndOrientationUsesLatestLineExtents() {
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        TextView view=text(a,"A longer complete line\nA second complete line",1200);CaptionTextBackground bg=background(view);
        float oldWidth=bg.textBounds().width();float size=view.getTextSize();
        view.setText("Short");measure(view,1200);bg.setBounds(0,0,1200,view.getHeight());
        assertTrue(bg.textBounds().width()<oldWidth);
        measure(view,600);bg.setBounds(0,0,600,view.getHeight());RectF box=bg.textBounds();
        assertEquals(300,box.centerX(),1f);assertEquals(size,view.getTextSize(),0f);assertEquals("Short",view.getText().toString());a.finish();
    }
    @Test public void overlayInstallsContentBoundedBackground() throws Exception {
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();TextView view=text(a,"字幕示例",600);
        java.lang.reflect.Method method=CaptionOverlay.class.getDeclaredMethod("applyBackground",TextView.class,Activity.class,int.class);
        method.setAccessible(true);method.invoke(null,view,a,70);
        assertTrue(view.getBackground() instanceof CaptionTextBackground);a.finish();
    }
    @Test public void startupUsesSameNormalAndRepairLimitsAsLaterPlayback() {
        for(int normal=0;normal<=5;normal++) {
            assertEquals(Math.max(1,normal),StartupCaptionPolicy.targetLimit(false,normal));
            assertEquals(StartupCaptionPolicy.targetLimit(true,normal),StartupCaptionPolicy.targetLimit(false,normal));
        }
        assertEquals(1,StartupCaptionPolicy.targetLimit(false,ContextualUnitCorePolicy.requestUnitLimit(true,4)));
        assertEquals(4,StartupCaptionPolicy.targetLimit(false,ContextualUnitCorePolicy.requestUnitLimit(false,4)));
    }
    @Test public void renderActualBalancedBackgroundComparison() throws Exception {
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        TextView view=text(a,"还有很多其他因素，对手机屏幕跌落时是否会碎裂有着同等甚至更大的影响。",1700);
        view.setTextSize(56);view.setTextColor(Color.WHITE);measure(view,1700);
        assertEquals(2,view.getLayout().getLineCount());
        String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");
        for(boolean tight:new boolean[]{false,true}){
            if(tight)background(view);else{android.graphics.drawable.GradientDrawable old=new android.graphics.drawable.GradientDrawable();old.setColor(Color.argb(179,0,0,0));old.setCornerRadius(5);view.setBackground(old);}
            measure(view,1700);Bitmap bitmap=Bitmap.createBitmap(1700,view.getHeight(),Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(bitmap);canvas.drawColor(0xff7a858a);view.draw(canvas);
            if(output!=null){java.io.File file=new java.io.File(output,tight?"caption-background-after.png":"caption-background-before.png");file.getParentFile().mkdirs();try(java.io.FileOutputStream stream=new java.io.FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,stream);}}
        }
        a.finish();
    }
}
