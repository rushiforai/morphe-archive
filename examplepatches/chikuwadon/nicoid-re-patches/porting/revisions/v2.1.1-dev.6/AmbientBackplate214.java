package e.e.a;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Bitmap;
import android.graphics.drawable.GradientDrawable;
import android.content.res.ColorStateList;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * v2.1.0 ambient base: draw sampled video-edge colour INSIDE the native detail
 * page's background layer, never in an Android ViewOverlay above UI text.
 * This does not depend on installPageGlow finding a specific tab's details view.
 * Text, icons and thumbnails keep their original draw order and opacity.
 */
public final class AmbientBackplate214 {
    private static final String TAG="nicoid-ambient-bg";
    private static final WeakHashMap<View, Entry> ADAPTED=new WeakHashMap<>();
    private static final WeakHashMap<Object, Long> SCANS=new WeakHashMap<>();
    private static final int LIMIT=1200;
    private AmbientBackplate214() { }

    private static final class Entry {
        final WeakReference<Object> layer;
        final Drawable original;
        final LayerDrawable installed;
        final AmbientInk ink;
        final int l,t,r,b;
        Entry(Object layer,View view,Drawable original,LayerDrawable installed,AmbientInk ink) {
            this.layer=new WeakReference<>(layer);this.original=original;
            this.installed=installed;this.ink=ink;
            l=view.getPaddingLeft();t=view.getPaddingTop();r=view.getPaddingRight();b=view.getPaddingBottom();
        }
    }
    private static class AmbientInk extends Drawable {
        final Paint p=new Paint(Paint.ANTI_ALIAS_FLAG);
        int[] palette=new int[]{Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK};
        int alpha, depth, pageY, videoBottom, width;
        void configure(int[] shades,int strength,int length,int absY,int bottom,int maxWidth){
            for(int n=0;n<4;n++)palette[n]=shades[n];
            alpha=strength;depth=Math.max(1,length);pageY=absY;
            videoBottom=bottom;width=Math.max(1,maxWidth);
            invalidateSelf();
        }
        @Override public void draw(Canvas canvas){
            if(alpha<=0||depth<=0)return;
            Rect b=getBounds();if(b.isEmpty())return;
            // One continuous glow, anchored to the VIDEO edge, across the full page.
            // Avoid DST_IN/ComposeShader: it masks source pixels and previously
            // lit unrelated child backgrounds while leaving opaque cards black.
            float start=Math.max(0f,(pageY-videoBottom)/(float)depth);
            float end=Math.max(0f,(pageY+b.height()-videoBottom)/(float)depth);
            if(start>1f)return;
            float near=1f-Math.min(1f,start);
            float far=1f-Math.min(1f,end);
            // Deliberately non-zero at the bottom: glow does not disappear when
            // the user turns off the separate 'whole screen spread' option.
            int opacity=Math.round(alpha*(0.48f+0.52f*(0.75f*near+0.25f*far)));
            if(opacity<4)return;
            int[] tones=new int[4];
            for(int i=0;i<4;i++)tones[i]=0xff000000|(palette[i]&0x00ffffff);
            Shader tone=new LinearGradient(0,0,b.width(),0,tones,null,Shader.TileMode.CLAMP);
            p.setShader(tone);p.setAlpha(Math.min(145,Math.max(0,opacity)));
            canvas.drawRect(b,p);
            p.setShader(null);p.setAlpha(255);
        }
        @Override public void setAlpha(int a){alpha=a;invalidateSelf();}
        @Override public void setColorFilter(android.graphics.ColorFilter filter){p.setColorFilter(filter);}
        @Override public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
    }
    private static Object member(Object target,String name) throws Exception {
        Field f=target.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(target);
    }
    private static int number(Object target,String name) throws Exception {
        return ((Number)member(target,name)).intValue();
    }
    private static ViewGroup findPager(View view,int depth){
        if(view==null||depth>22)return null;
        if(view instanceof ViewGroup&&"com.sauzask.nicoid.NicoidViewPager".equals(view.getClass().getName()))
            return (ViewGroup)view;
        if(view instanceof ViewGroup){
            ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++){
                ViewGroup result=findPager(group.getChildAt(i),depth+1);
                if(result!=null)return result;
            }
        }
        return null;
    }
    private static void restore(View v,Entry e){
        if(v.getBackground()!=e.installed)return;
        v.setBackground(e.original);
        v.setPadding(e.l,e.t,e.r,e.b);
    }
    public static void clear(Object layer){
        if(layer==null)return;
        SCANS.remove(layer);
        for(Iterator<Map.Entry<View,Entry>> it=ADAPTED.entrySet().iterator();it.hasNext();){
            Map.Entry<View,Entry> entry=it.next();
            if(entry.getValue().layer.get()!=layer)continue;
            View v=entry.getKey();if(v!=null)restore(v,entry.getValue());
            it.remove();
        }
    }
    private static boolean darkBackground(Drawable drawable,View v) {
        if(drawable==null)return false;
        int color=0;
        if(drawable instanceof ColorDrawable)color=((ColorDrawable)drawable).getColor();
        else if(drawable instanceof GradientDrawable){
            ColorStateList fill=((GradientDrawable)drawable).getColor();
            if(fill!=null)color=fill.getColorForState(v.getDrawableState(),fill.getDefaultColor());
            else return sampledDark(drawable,v);
        }else return sampledDark(drawable,v);
        return isDark(color);
    }
    private static boolean sampledDark(Drawable drawable,View v){
        Drawable.ConstantState cs=drawable.getConstantState();
        if(cs==null)return false;
        Bitmap bitmap=null;
        try{
            Drawable copy=cs.newDrawable(v.getResources()).mutate();
            bitmap=Bitmap.createBitmap(7,7,Bitmap.Config.ARGB_8888);
            copy.setBounds(0,0,7,7);copy.draw(new Canvas(bitmap));
            return isDark(bitmap.getPixel(3,3));
        }catch(Exception ex){return false;}
        finally{if(bitmap!=null)bitmap.recycle();}
    }
    private static boolean isDark(int c){
        if(Color.alpha(c)<215)return false;
        int red=Color.red(c),green=Color.green(c),blue=Color.blue(c);
        return Math.max(red,Math.max(green,blue))<118
                &&Math.max(red,Math.max(green,blue))-Math.min(red,Math.min(green,blue))<48;
    }
    private static void scan(Object layer,View v,int[] budget,int depth,boolean root){
        if(v==null||depth>22||budget[0]--<=0||!v.isShown())return;
        if(v instanceof ImageView||v instanceof android.view.SurfaceView
                ||v instanceof android.view.TextureView||v instanceof android.webkit.WebView)return;
        float den=v.getResources().getDisplayMetrics().density;
        // The pager root always receives light. Opaque dark nested panels get
        // their own subtle ink BELOW text, avatars, and icons. Transparent text
        // containers do not receive a second (overbright) copy of the glow.
        if(v.getWidth()>75*den&&v.getHeight()>22*den){
            Drawable background=v.getBackground();
            Entry e=ADAPTED.get(v);
            if(e!=null&&e.installed!=background){ADAPTED.remove(v);e=null;}
            // Live dark cards may use stateful Ripple/Layer drawables; their
            // off-screen default state can appear transparent even when the
            // rendered card is opaque black. A sampled-dark predicate must
            // not exclude these backgrounds. Text and icons remain above
            // this BACKGROUND-layer glow.
            if(e==null && (root || background != null)){
                try {
                    AmbientInk ink=new AmbientInk();
                    Drawable first=background==null?new ColorDrawable(Color.TRANSPARENT):background;
                    LayerDrawable installed=new LayerDrawable(new Drawable[]{first,ink});
                    Entry next=new Entry(layer,v,background,installed,ink);
                    v.setBackground(installed);v.setPadding(next.l,next.t,next.r,next.b);
                    ADAPTED.put(v,next);
                }catch(RuntimeException ex){Log.w(TAG,"Could not adapt panel background",ex);}
            }
        }
        if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;
            for(int i=0;i<g.getChildCount()&&budget[0]>0;i++)scan(layer,g.getChildAt(i),budget,depth+1,false);
        }
    }
    public static void update(Object layer,View player,View decor){
        if(layer==null||player==null||decor==null)return;
        try {
            ViewGroup pager=findPager(decor,0);
            if(pager==null||!pager.isShown())return;
            Object glow=member(layer,"glow");
            int[] samples=(int[])member(glow,"colors");
            if(samples==null||samples.length<8)return;
            int alpha=number(glow,"alpha");
            if(alpha<=0)return;
            int spread=number(glow,"spread");
            Rect video=(Rect)member(glow,"video");
            int[] videoLocation=new int[2];player.getLocationOnScreen(videoLocation);
            int videoBottom=videoLocation[1]+video.bottom;
            long now=SystemClock.uptimeMillis();
            Long next=SCANS.get(layer);
            if(next==null||now>=next){
                SCANS.put(layer,now+500);
                int[] remaining={LIMIT};
                for(int i=0;i<pager.getChildCount();i++){
                    View page=pager.getChildAt(i);
                    if(page!=null&&page.isShown())scan(layer,page,remaining,0,true);
                }
            }
            int[] shades={samples[4],samples[5],samples[6],samples[7]};
            int[] pageLocation=new int[2];pager.getLocationOnScreen(pageLocation);
            int fullDepth=Math.max(1,pager.getHeight()+pageLocation[1]-videoBottom);
            int depth=fullDepth;
            // The same video-edge source, with a single overlay per opaque
            // backdrop. Foreground text/icons retain their original opacity.
            int strength=Math.min(122,Math.max(24,Math.round(alpha*0.48f)));
            for(Iterator<Map.Entry<View,Entry>> it=ADAPTED.entrySet().iterator();it.hasNext();){
                Map.Entry<View,Entry> kv=it.next();
                Entry e=kv.getValue();if(e.layer.get()!=layer)continue;
                View v=kv.getKey();
                if(v==null||v.getBackground()!=e.installed){it.remove();continue;}
                if(!v.isShown())continue;
                int[] location=new int[2];v.getLocationOnScreen(location);
                e.ink.setBounds(0,0,v.getWidth(),v.getHeight());
                int itemStrength = v instanceof TextView ? Math.min(70,strength) : strength;
                e.ink.configure(shades,itemStrength,depth,location[1],videoBottom,v.getWidth());
            }
        }catch(Exception e){Log.w(TAG,"Unable to update ambient panel backdrops",e);}
    }
}