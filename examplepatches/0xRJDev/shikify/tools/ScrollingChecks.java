import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ImageSpan;
import android.text.style.ReplacementSpan;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

/** Synthetic render/measurement benchmark using the actual compiled runtime. No app navigation. */
public class ScrollingChecks {
    public static class MutableMetrics extends android.text.style.MetricAffectingSpan {
        float scale=1;
        @Override public void updateDrawState(TextPaint paint){paint.setTextScaleX(scale);}
        @Override public void updateMeasureState(TextPaint paint){paint.setTextScaleX(scale);}
    }
    static int checks;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object get(Object target,String name)throws Exception{Field f=target.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(target);}
    static void run(String[] args)throws Exception{
        ClassLoader loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();
        Context context=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);
        Class<?> pillClass=Class.forName("app.morphe.extension.boost.MaterialYouTweaks$Pill",true,loader);
        Constructor<?> constructor=pillClass.getDeclaredConstructor(int.class,int.class,int.class);constructor.setAccessible(true);
        ReplacementSpan pill=(ReplacementSpan)constructor.newInstance(Color.DKGRAY,Color.WHITE,6);
        TextPaint paint=new TextPaint(Paint.ANTI_ALIAS_FLAG);paint.setTextSize(24);
        SpannableString text=new SpannableString("E Flair text");
        ColorDrawable emoji=new ColorDrawable(Color.GREEN);emoji.setBounds(0,0,20,20);
        text.setSpan(new ImageSpan(emoji),0,1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(pill,0,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        int width=pill.getSize(paint,text,0,text.length(),new Paint.FontMetricsInt());
        Bitmap bitmap=Bitmap.createBitmap(width+16,64,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(bitmap);
        for(int i=0;i<30;i++)pill.draw(canvas,text,0,text.length(),0,0,40,60,paint);
        long start=android.os.SystemClock.elapsedRealtimeNanos();
        for(int i=0;i<400;i++)pill.draw(canvas,text,0,text.length(),0,0,40,60,paint);
        long elapsed=android.os.SystemClock.elapsedRealtimeNanos()-start;
        System.out.println("FLAIR DRAW: "+(elapsed/400/1000)+" us per callback (isolated software helper; not in-app FPS)");
        int green=0;for(int y=0;y<bitmap.getHeight();y++)for(int x=0;x<bitmap.getWidth();x++)if(bitmap.getPixel(x,y)==Color.GREEN)green++;
        check(green>0,"Repeated flair draws retain native image spans");
        boolean caching;
        try{pillClass.getDeclaredField("cachedLayout");caching=true;}catch(NoSuchFieldException oldVersion){caching=false;}
        if(caching){
            Object cached=get(pill,"cachedLayout");
            for(int i=0;i<120;i++)pill.draw(canvas,text,0,text.length(),0,0,40,60,paint);
            check(get(pill,"cachedLayout")==cached,"120 steady flair draws reuse their measured text layout");
            for(int i=0;i<120;i++)pill.getSize(paint,text,0,text.length(),null);
            check(get(pill,"cachedLayout")==cached,"Repeated Android span measurements reuse stable flair layout too");
            android.text.style.StyleSpan style=new android.text.style.StyleSpan(Typeface.BOLD);
            text.setSpan(style,2,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);pill.getSize(paint,text,0,text.length(),null);
            check(get(pill,"cachedLayout")!=cached,"Adding a metric span to existing text invalidates cached shaping");
            cached=get(pill,"cachedLayout");text.removeSpan(style);pill.getSize(paint,text,0,text.length(),null);
            check(get(pill,"cachedLayout")!=cached,"Removing a metric span invalidates cached shaping");
            cached=get(pill,"cachedLayout");
            paint.setTextSize(30);pill.draw(canvas,text,0,text.length(),0,0,40,60,paint);
            check(get(pill,"cachedLayout")!=cached,"Changing font metrics rebuilds the flair layout");
            cached=get(pill,"cachedLayout");paint.setTypeface(Typeface.MONOSPACE);pill.draw(canvas,text,0,text.length(),0,0,40,60,paint);
            check(get(pill,"cachedLayout")!=cached,"Typeface changes invalidate the cached flair layout");
            cached=get(pill,"cachedLayout");emoji.setBounds(0,0,32,24);pill.getSize(paint,text,0,text.length(),new Paint.FontMetricsInt());
            check(get(pill,"cachedLayout")!=cached,"A measurement refreshes rich-span geometry for loaded/resized emoji");
            cached=get(pill,"cachedLayout");SpannableString replacement=new SpannableString("New flair");pill.draw(canvas,replacement,0,replacement.length(),0,0,40,60,paint);
            check(get(pill,"cachedLayout")!=cached,"New text rebuilds the flair layout");
            SpannableString wrapped=new SpannableString("E Wrapped");
            android.text.style.CharacterStyle wrapper=android.text.style.CharacterStyle.wrap(new ImageSpan(emoji));
            wrapped.setSpan(wrapper,0,1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);pill.getSize(paint,wrapped,0,wrapped.length(),null);
            cached=get(pill,"cachedLayout");emoji.setBounds(0,0,40,28);pill.getSize(paint,wrapped,0,wrapped.length(),null);
            check(get(pill,"cachedLayout")!=cached,"Wrapped image spans still invalidate when their drawable bounds change");
            MutableMetrics mutable=new MutableMetrics();wrapped.setSpan(mutable,2,wrapped.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);pill.getSize(paint,wrapped,0,wrapped.length(),null);
            cached=get(pill,"cachedLayout");mutable.scale=2;pill.getSize(paint,wrapped,0,wrapped.length(),null);
            check(get(pill,"cachedLayout")!=cached,"Unknown custom metric spans retain fresh shaping when their state changes");
            android.text.SpannableStringBuilder edited=new android.text.SpannableStringBuilder("ABC");pill.getSize(paint,edited,0,3,null);
            cached=get(pill,"cachedLayout");edited.replace(0,3,"DEF");pill.getSize(paint,edited,0,3,null);
            check(get(pill,"cachedLayout")!=cached,"In-place text edits invalidate the cache even when length stays unchanged");
        }else System.out.println("BASELINE: no flair layout cache in this APK");
        StyleChecks.context=context;
        android.view.View root=StyleChecks.inflate("row_comment_indent_avatar");StyleChecks.Holder holder=StyleChecks.comment(root);
        Class<?> layouts=Class.forName("app.morphe.extension.boost.CommentLayoutTweaks",true,loader);
        layouts.getMethod("bind",Object.class).invoke(null,holder);
        Field rowsField=layouts.getDeclaredField("ROWS");rowsField.setAccessible(true);
        android.view.ViewTreeObserver.OnPreDrawListener controller=(android.view.ViewTreeObserver.OnPreDrawListener)((java.util.Map<?,?>)rowsField.get(null)).get(root);
        controller.onPreDraw();StyleChecks.measure(root,900);controller.onPreDraw();StyleChecks.measure(root,900);
        android.view.ViewGroup header=(android.view.ViewGroup)holder.authorTv.getParent();
        Object positions=get(header,"positions");Object firstPosition=((java.util.List<?>)positions).get(0);
        for(int i=0;i<120;i++){header.requestLayout();StyleChecks.measure(root,900-(i%2));controller.onPreDraw();}
        if(caching)check(((java.util.List<?>)get(header,"positions")).get(0)==firstPosition,"Header measurement reuses its position buffers across 120 different-width layouts");
        holder.scoreTv.setText("123");controller.onPreDraw();
        check(holder.scoreTv.getText().toString().equals("123 points"),"Cached row-view lookup still follows native score updates");
        check(controller.onPreDraw(),"Unchanged cached comment row settles without requesting layout");
        bitmap.recycle();
        System.out.println("SCROLLING CHECKS PASSED: "+checks);System.exit(0);
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
