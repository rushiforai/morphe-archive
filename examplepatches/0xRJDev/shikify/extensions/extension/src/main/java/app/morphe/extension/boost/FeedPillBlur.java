package app.morphe.extension.boost;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.Paint;
import android.graphics.LinearGradient;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;

final class FeedPillBlur extends Drawable implements ViewTreeObserver.OnPreDrawListener,ViewTreeObserver.OnGlobalLayoutListener {
    private final WeakReference<View> source,bar;
    private WeakReference<ViewTreeObserver> observer;
    private final RenderNode node=new RenderNode("Shikify feed pill backdrop");
    private final RenderNode capture=new RenderNode("Shikify glass source"),edgeNode=new RenderNode("Shikify refractive rim");
    private final Path clip=new Path();
    private final int[] sourceLocation=new int[2],barLocation=new int[2];
    private final float padding,radius;
    private final int baseColor;
    private final boolean includeWindow,screenSpace;
    private final int minimumTint,blurScale;
    private final float density;
    private final RenderEffect blurEffect;
    private GlassRefraction refraction;
    private boolean effectDirty=true;
    private boolean header,bottomContour;
    private int headerOffset,headerHeight;
    private final Paint frost=new Paint(),rim=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final android.graphics.RectF rimBounds=new android.graphics.RectF();
    private Drawable windowBackground;
    private int windowOpacity=-1;
    private boolean dirty=true,recording,running,frozen;
    private long lastRecord;
    private float translation=Float.NaN;
    private int alpha=255;
    int recordings;
    private int frameInterval=16,glassTint=40;
    /** The capture is half size; the blurred copy is this much smaller again. */
    private int reduction=2;
    private final Paint grain=new Paint();
    private static android.graphics.Bitmap grainTile;
    private static final int RIM_DELAY=120,RIM_FADE=160;

    FeedPillBlur(View source,View bar,int baseColor){
        this(source,bar,baseColor,false);
    }
    FeedPillBlur(View source,View bar,int baseColor,boolean includeWindow){
        this(source,bar,baseColor,includeWindow,40,false,0,1);
    }
    /**
     * @param cornerDp corner radius of the glass shape; pills use 40dp (fully rounded).
     * @param screenSpace map source and target through screen coordinates, for a target in
     *        another window (popup menus) whose window origin differs from the source's.
     * @param minimumTint lower bound for the frost tint percentage, for text-bearing surfaces.
     */
    FeedPillBlur(View source,View bar,int baseColor,boolean includeWindow,float cornerDp,boolean screenSpace,int minimumTint,int blurScale){
        this.source=new WeakReference<>(source);this.bar=new WeakReference<>(bar);this.baseColor=baseColor;this.includeWindow=includeWindow;
        this.screenSpace=screenSpace;this.minimumTint=minimumTint;this.blurScale=Math.max(1,blurScale);
        density=bar.getResources().getDisplayMetrics().density;padding=48*density;radius=cornerDp*density;
        blurEffect=RenderEffect.createBlurEffect(3.5f*density,3.5f*density,Shader.TileMode.CLAMP);node.setRenderEffect(blurEffect);
        grain.setShader(new android.graphics.BitmapShader(grainTile(),Shader.TileMode.REPEAT,Shader.TileMode.REPEAT));
        frost.setColor((0x66<<24)|(baseColor&0xffffff));rim.setStyle(Paint.Style.STROKE);rim.setStrokeWidth(density);
        if(android.os.Build.VERSION.SDK_INT>=33)try{refraction=new GlassRefraction();}catch(RuntimeException error){}
    }
    /** Faint noise breaks up the banding a small blur shows on dark surfaces. */
    private static android.graphics.Bitmap grainTile(){
        if(grainTile==null){
            int size=64;int[] pixels=new int[size*size];java.util.Random random=new java.util.Random(7);
            for(int index=0;index<pixels.length;index++)pixels[index]=(random.nextInt(11)<<24)|(random.nextBoolean() ? 0xffffff:0);
            grainTile=android.graphics.Bitmap.createBitmap(pixels,size,size,android.graphics.Bitmap.Config.ARGB_8888);
        }
        return grainTile;
    }
    void start(){
        stop();
        View view=bar.get();
        if(view==null)return;
        glassTint=Math.max(minimumTint,SurfaceSettingsActivity.number(view.getContext(),"glass_tint",40,0,80));
        int amount=SurfaceSettingsActivity.number(view.getContext(),"blur_amount",7,0,25)*blurScale;
        frameInterval=SurfaceSettingsActivity.number(view.getContext(),"blur_interval",16,8,100);
        // Very light blurs would show the smaller copy's pixels, so they stay at capture size.
        reduction=amount>=3 ? 2:1;
        float strength=amount*density/reduction;
        node.setRenderEffect(amount==0 ? null:RenderEffect.createBlurEffect(strength,strength,Shader.TileMode.CLAMP));
        running=true;
        dirty=true;
        ViewTreeObserver tree=view.getViewTreeObserver();tree.addOnPreDrawListener(this);tree.addOnGlobalLayoutListener(this);observer=new WeakReference<>(tree);invalidateSelf();
    }
    void header(int offset,int height,boolean contour){
        if(!header || headerOffset!=offset || headerHeight!=height || bottomContour!=contour){
            header=true;
            headerOffset=offset;
            headerHeight=height;
            bottomContour=contour;
            onBoundsChange(getBounds());
            invalidateSelf();
        }
    }
    /** Retain the last GPU frame while the owning Activity is not resumed. */
    void freeze(){
        running=false;
        frozen=true;
        ViewTreeObserver tree=observer==null ? null:observer.get();
        if(tree!=null && tree.isAlive()){
            tree.removeOnPreDrawListener(this);
            tree.removeOnGlobalLayoutListener(this);
        }
        observer=null;
    }
    void stop(){
        frozen=false;
        running=false;
        ViewTreeObserver tree=observer==null ? null:observer.get();
        if(tree!=null && tree.isAlive()){
            tree.removeOnPreDrawListener(this);
            tree.removeOnGlobalLayoutListener(this);
        }
        observer=null;
        node.discardDisplayList();
        capture.discardDisplayList();
        edgeNode.discardDisplayList();
        windowBackground=null;
        windowOpacity=-1;
        dirty=true;
    }
    @Override public void onGlobalLayout(){dirty=true;invalidateSelf();}
    @Override public boolean onPreDraw(){
        View content=source.get(),view=bar.get();if(!running || content==null || view==null)return true;
        if(view.getVisibility()!=View.VISIBLE || view.getHeight()>0 && view.getTranslationY()>=view.getHeight()){dirty=true;return true;}
        if(includeWindow){
            Drawable background=content.getRootView().getBackground();
            int opacity=background instanceof SurfaceAppearanceTweaks.Backdrop ? ((SurfaceAppearanceTweaks.Backdrop)background).opacity:0;
            if(background!=windowBackground || opacity!=windowOpacity){windowBackground=background;windowOpacity=opacity;dirty=true;invalidateSelf();}}
        if(content.isDirty() || content.hasTransientState() || translation!=view.getTranslationY()){dirty=true;translation=view.getTranslationY();invalidateSelf();}return true;
    }
    @Override protected void onBoundsChange(android.graphics.Rect bounds){
        clip.reset();
        if(header)clip.addRect(bounds.left,bounds.top,bounds.right,bounds.bottom,Path.Direction.CW);
        else clip.addRoundRect(bounds.left,bounds.top,bounds.right,bounds.bottom,Math.min(radius,bounds.height()/2f),Math.min(radius,bounds.height()/2f),Path.Direction.CW);
        dirty=true;
        effectDirty=true;
        rimBounds.set(bounds);
        rimBounds.inset(density/2,density/2);
        if(!bounds.isEmpty())rim.setShader(new LinearGradient(bounds.left,bounds.top,bounds.right,bounds.bottom,0x36ffffff,0x1c000000,Shader.TileMode.CLAMP));
    }
    @Override public void getOutline(Outline outline){if(header)outline.setRect(getBounds());else outline.setRoundRect(getBounds(),Math.min(radius,getBounds().height()/2f));outline.setAlpha(0);}
    @Override public void draw(Canvas canvas){
        if(recording || (!running && !frozen) || !canvas.isHardwareAccelerated() || getBounds().isEmpty())return;
        View content=source.get(),view=bar.get();if(content==null || view==null || content.getWidth()==0 || content.getHeight()==0)return;
        if(effectDirty){
            if(android.os.Build.VERSION.SDK_INT>=33 && refraction!=null)edgeNode.setRenderEffect(header ? refraction.effect(getBounds().width(),getBounds().height(),padding,density,baseColor,0,headerHeight,headerOffset,0.6f):refraction.effect(getBounds().width(),getBounds().height(),padding,density,baseColor,Math.min(radius,getBounds().height()/2f)/2,getBounds().height(),0,0.4f));
            effectDirty=false;
        }
        long now=SystemClock.uptimeMillis();
        // A stopped window loses this display list, and predictive Back shows it before resume.
        if((frozen && !node.hasDisplayList()) || running && dirty && (!node.hasDisplayList() || now-lastRecord>=frameInterval)){
            int width=(int)Math.ceil((getBounds().width()+padding*2)/2f),height=(int)Math.ceil((getBounds().height()+padding*2)/2f);
            capture.setPosition(0,0,width,height);
            node.setPosition(0,0,(int)Math.ceil(width/(float)reduction),(int)Math.ceil(height/(float)reduction));
            edgeNode.setPosition(0,0,width,height);
            if(screenSpace){
                content.getLocationOnScreen(sourceLocation);
                view.getLocationOnScreen(barLocation);
                barLocation[0]+=getBounds().left;
                barLocation[1]+=getBounds().top;
            }
            else{content.getLocationInWindow(sourceLocation);view.getLocationInWindow(barLocation);}
            RecordingCanvas layer=capture.beginRecording();recording=true;boolean success=false;
            try{
                layer.drawColor(baseColor);layer.scale(0.5f,0.5f);
                layer.translate(padding-barLocation[0],padding-barLocation[1]);
                // Views outside this clip are quick-rejected, so a capture costs a few rows, not the list.
                layer.clipRect(barLocation[0]-padding,barLocation[1]-padding,barLocation[0]+getBounds().width()+padding,barLocation[1]+getBounds().height()+padding);
                if(includeWindow){Drawable background=content.getRootView().getBackground();if(background!=null && background!=this)background.draw(layer);}
                layer.translate(sourceLocation[0],sourceLocation[1]);
                content.draw(layer);dirty=false;lastRecord=now;recordings++;success=true;
            }catch(RuntimeException error){dirty=false;}
            finally{capture.endRecording();recording=false;if(!success){capture.discardDisplayList();node.discardDisplayList();edgeNode.discardDisplayList();}}
            if(success){
                RecordingCanvas centre=node.beginRecording();
                centre.scale(1f/reduction,1f/reduction);
                centre.drawRenderNode(capture);
                node.endRecording();
                if(refraction!=null){
                    RecordingCanvas edge=edgeNode.beginRecording();
                    edge.drawRenderNode(capture);
                    edgeNode.endRecording();
                }
            }
        }else if(running && dirty)view.postInvalidateDelayed(Math.max(1,frameInterval-(now-lastRecord)));
        if(node.hasDisplayList()){
            int saved=canvas.save();
            canvas.clipPath(clip);
            int transform=canvas.save();
            canvas.translate(getBounds().left-padding,getBounds().top-padding);
            canvas.scale(2*reduction,2*reduction);
            node.setAlpha(alpha/255f);
            canvas.drawRenderNode(node);
            canvas.restoreToCount(transform);
            frost.setAlpha(Math.round((header ? 153:glassTint*2.55f)*alpha/255f));canvas.drawPath(clip,frost);
            grain.setAlpha(alpha);canvas.drawPath(clip,grain);
            // The rim shader reruns whenever the capture changes, so it rests during motion and fades back.
            long still=now-lastRecord;
            if(refraction!=null && running && still<RIM_DELAY)view.postInvalidateDelayed(RIM_DELAY-still+1);
            if(refraction!=null && edgeNode.hasDisplayList() && still>=RIM_DELAY){
                int edgeTransform=canvas.save();
                canvas.translate(getBounds().left-padding,getBounds().top-padding);
                canvas.scale(2,2);
                edgeNode.setAlpha(alpha/255f*Math.min(1,(still-RIM_DELAY)/(float)RIM_FADE));
                if(running && still<RIM_DELAY+RIM_FADE)view.postInvalidateOnAnimation();
                canvas.drawRenderNode(edgeNode);
                canvas.restoreToCount(edgeTransform);
            }
            rim.setAlpha(alpha);
            if(!header)canvas.drawRoundRect(rimBounds,Math.min(radius,getBounds().height()/2f),Math.min(radius,getBounds().height()/2f),rim);
            else if(bottomContour){
                rim.setShader(null);
                rim.setColor((Math.round(40*alpha/255f)<<24)|0xffffff);
                canvas.drawLine(rimBounds.left,rimBounds.bottom,rimBounds.right,rimBounds.bottom,rim);
            }
            canvas.restoreToCount(saved);
        }
    }
    @Override public void setAlpha(int alpha){this.alpha=alpha;invalidateSelf();}
    @Override public int getAlpha(){return alpha;}
    @Override public void setColorFilter(ColorFilter filter){}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
