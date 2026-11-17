import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;

/** Exercises candidate native refresh methods with a local counting callback only. */
public final class MaterialLoadingChecks {
    private static final class ProgressDialogFixture extends android.app.Dialog {
        android.widget.ProgressBar progress;

        ProgressDialogFixture(Context context) {
            super(context);
        }

        @Override
        @SuppressWarnings("unchecked")
        public <T extends View> T findViewById(int id) {
            return (T) progress;
        }
    }

    static int checks;
    static ClassLoader loader;
    static Context context;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object field(Object object,String name)throws Exception{for(Class<?> t=object.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);return f.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static void put(Object object,String name,Object value)throws Exception {for(Class<?> t=object.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);f.set(object,value);return;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static int hash(Bitmap image){int hash=1;for(int y=0;y<image.getHeight();y++)for(int x=0;x<image.getWidth();x++)hash=hash*31+image.getPixel(x,y);return hash;}
    public static final class Wheel extends View {
        public boolean O=true,attached=true,shown=true;
        int requests,windowVisibility=VISIBLE;
        public Wheel(Context context){super(context);}
        @Override public boolean isAttachedToWindow(){return attached;}
        @Override public boolean isShown(){return shown;}
        @Override public int getWindowVisibility(){return windowVisibility;}
        @Override public void postInvalidateOnAnimation(){requests++;}
    }
    public static void main(String[] args){try{runAll(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
    static Object staticField(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
    static void runAll(String[] args)throws Exception {
        // Initialize and instantiate actual native refresh layout.
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();
        context=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);
        Class<?> tweaks=Class.forName("app.morphe.extension.boost.MaterialLoadingTweaks",true,loader);
        Class<?> type=Class.forName("androidx.swiperefreshlayout.widget.SwipeRefreshLayout",true,loader);
        ViewGroup refresh=(ViewGroup)type.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(context,null);
        refresh.addView(new FrameLayout(context),new ViewGroup.LayoutParams(-1,-1));
        refresh.measure(View.MeasureSpec.makeMeasureSpec(400,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(700,View.MeasureSpec.EXACTLY));refresh.layout(0,0,400,700);
        ImageView icon=(ImageView)field(refresh,"N");Drawable drawable=(Drawable)field(refresh,"T");drawable.setBounds(0,0,96,96);
        check(icon.getDrawable()==drawable,"Refresh keeps the original circle, Drawable and animation callbacks");
        Class<?> roles=Class.forName("app.morphe.extension.boost.MaterialYouTweaks",true,loader);Method role=roles.getMethod("color",Context.class,String.class,int.class);
        int container=(Integer)role.invoke(null,context,"colorPrimaryContainer",android.R.attr.colorBackground);
        check((((ShapeDrawable)icon.getBackground()).getPaint().getColor()&0xffffff)==(container&0xffffff),"Refresh circle uses the wallpaper primary-container role");
        Map<?,?> states=(Map<?,?>)staticField(tweaks,"REFRESH");Object state=states.get(drawable);
        check(state!=null,"Native constructor installs a drawing controller for its exact Drawable");
        int[] calls={0};Class<?> listener=Class.forName("androidx.swiperefreshlayout.widget.SwipeRefreshLayout$f",true,loader);
        Object local=Proxy.newProxyInstance(loader,new Class<?>[]{listener},(p,m,a)->{if(m.getName().equals("a"))calls[0]++;return null;});
        type.getMethod("setOnRefreshListener",listener).invoke(refresh,local);
        float threshold=(Float)field(refresh,"z");
        Method pull=type.getMethod("d",float.class),release=type.getMethod("c",float.class);
        Bitmap image=Bitmap.createBitmap(96,96,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(image);
        pull.invoke(refresh,threshold*0.25f);check(Math.abs((Float)field(state,"progress")-0.25f)<0.001f,"Native pull hook tracks the complete pull distance");
        drawable.draw(canvas);int first=hash(image);image.eraseColor(0);
        pull.invoke(refresh,threshold*0.9f);drawable.draw(canvas);check(first!=hash(image),"Pull distance visibly morphs the rendered shape");
        check(calls[0]==0 && !(Boolean)field(refresh,"c"),"Pulling alone does not invoke refresh");
        release.invoke(refresh,threshold*0.9f);check(calls[0]==0 && !(Boolean)field(refresh,"c"),"A short released pull cancels without invoking refresh");
        type.getMethod("f").invoke(refresh);check(icon.getVisibility()==View.GONE && (Float)field(state,"progress")==0,"Native reset hides the circle and resets Material progress");
        pull.invoke(refresh,threshold*1.2f);release.invoke(refresh,threshold*1.2f);check((Boolean)field(refresh,"c"),"Threshold release retains Boost's native refreshing state");
        Animation.AnimationListener end=(Animation.AnimationListener)field(refresh,"d0");end.onAnimationEnd(null);
        check(calls[0]==1 && ((Animatable)drawable).isRunning(),"A completed native gesture invokes the local refresh callback exactly once");
        image.eraseColor(0);drawable.draw(canvas);Object renderer=field(state,"indicator");check((Boolean)field(renderer,"wasLoading"),"The native running state switches to expressive indeterminate drawing");
        check(icon.getDrawable()==drawable && field(refresh,"b")==local,"Material drawing retains the exact native image and refresh listener");
        type.getMethod("setRefreshing",boolean.class).invoke(refresh,false);end.onAnimationEnd(null);
        check(!((Animatable)drawable).isRunning() && icon.getVisibility()==View.GONE && !(Boolean)field(renderer,"wasLoading"),"Completion stops the native animator and resets Material rendering");
        type.getMethod("setRefreshing",boolean.class).invoke(refresh,true);end.onAnimationEnd(null);check(calls[0]==1,"Programmatic loading never invokes the user refresh callback");
        type.getMethod("f").invoke(refresh);put(refresh,"c",false);
        ShapeDrawable bg=(ShapeDrawable)icon.getBackground();bg.getPaint().setColor(Color.WHITE);bg.setAlpha(76);bg.getPaint().setAlpha(100);drawable.setAlpha(76);image.eraseColor(0);drawable.draw(canvas);
        check(bg.getAlpha()==76 && bg.getPaint().getAlpha()==100 && (bg.getPaint().getColor()&0xffffff)==(container&0xffffff),"Retheming a native colour override preserves the circle's gesture fade alpha");
        check(drawable.getAlpha()==76,"Material drawing retains native drawable alpha");
        drawable.setAlpha(255);type.getMethod("f").invoke(refresh);
        int maps=states.size();for(int i=0;i<100;i++){pull.invoke(refresh,threshold*0.5f);image.eraseColor(0);drawable.draw(canvas);}
        check(states.size()==maps && states.get(drawable)==state && field(state,"indicator")==renderer,"100 pull frames reuse one controller, renderer and shape cache");
        type.getMethod("setEnabled",boolean.class).invoke(refresh,false);check(!refresh.isEnabled() && icon.getVisibility()==View.GONE,"Disabling refresh preserves native reset and visibility behaviour");
        Drawable unrelated=(Drawable)Class.forName("rs",true,loader).getConstructor(Context.class).newInstance(context);unrelated.setBounds(0,0,96,96);unrelated.draw(canvas);
        check(!(Boolean)tweaks.getMethod("drawRefresh",Object.class,Canvas.class).invoke(null,unrelated,canvas),"An unrelated native drawable keeps its original drawing implementation");
        // Exercise lifecycle scheduling without installing a window or changing device settings.
        Wheel wheel=new Wheel(context);wheel.layout(0,0,96,96);Method drawWheel=tweaks.getMethod("drawWheel",Object.class,Canvas.class);
        check((Boolean)drawWheel.invoke(null,wheel,canvas) && wheel.requests==1,"An attached visible loading wheel schedules one next display frame");
        wheel.shown=false;drawWheel.invoke(null,wheel,canvas);check(wheel.requests==1,"A hidden wheel does not schedule animation frames");
        wheel.shown=true;wheel.attached=false;drawWheel.invoke(null,wheel,canvas);check(wheel.requests==1,"A detached wheel does not schedule animation frames");
        wheel.attached=true;wheel.windowVisibility=View.GONE;drawWheel.invoke(null,wheel,canvas);check(wheel.requests==1,"An inactive window does not schedule wheel animation frames");
        wheel.O=false;check(!(Boolean)drawWheel.invoke(null,wheel,canvas),"Determinate progress retains Boost's original wheel drawing and values");
        // Deterministic pixel checks on the renderer, independent of actual frame timing.
        Class<?> core=renderer.getClass();Method render=core.getMethod("draw",Canvas.class,float.class,float.class,float.class,int.class,boolean.class,float.class,float.class,long.class);
        int ink=Color.rgb(110,180,230);Object r=core.getConstructor(int.class).newInstance(ink);long now=1000000000L;
        Bitmap atlas=Bitmap.createBitmap(7*96,3*96,Bitmap.Config.ARGB_8888);Canvas strip=new Canvas(atlas);
        for(int i=0;i<7;i++){
            image.eraseColor(0);render.invoke(r,canvas,48f,48f,72f,255,false,i/6f,1f,now);int count=0;boolean outside=false;
            for(int y=0;y<96;y++)for(int x=0;x<96;x++)if(Color.alpha(image.getPixel(x,y))>0){if(image.getPixel(x,y)==ink)count++;if(x<12 || y<12 || x>=84 || y>=84)outside=true;}
            check(count>100 && !outside,"Pull shape "+i+" is visible in its theme colour and contained within its bounds");strip.drawBitmap(image,i*96,0,null);
        }
        core.getMethod("reset").invoke(r);int previous=0,changes=0;
        for(int i=0;i<300;i++){
            image.eraseColor(0);render.invoke(r,canvas,48f,48f,72f,255,true,1f,1f,now+i*16666667L);int h=hash(image);if(i>0 && h!=previous)changes++;previous=h;
            if(i%40==0 && i/40<7)strip.drawBitmap(image,(i/40)*96,96,null);
        }
        check(changes>250,"Indeterminate rendering morphs continuously across native-style frame callbacks");
        int stable=0;for(int i=0;i<7;i++){image.eraseColor(0);render.invoke(r,canvas,48f,48f,72f,255,true,1f,0f,now+i*1000000000L);int h=hash(image);if(i==0)stable=h;else if(h!=stable)throw new AssertionError("Reduced-motion image changed");strip.drawBitmap(image,i*96,192,null);}
        check(stable!=0,"Disabled animations retain one visible, stationary Material shape");
        image.eraseColor(0);render.invoke(r,canvas,48f,48f,72f,0,true,1f,1f,now);boolean clear=true;for(int y=0;y<96;y++)for(int x=0;x<96;x++)if(image.getPixel(x,y)!=0)clear=false;
        check(clear,"Zero native alpha draws no indicator pixels");
        checkGeometry();
        checkCircularProgress(args[0], canvas, image);
        if(args.length>2)try(java.io.OutputStream out=new java.io.FileOutputStream(args[2]+"/material-loading-preview.png")){atlas.compress(Bitmap.CompressFormat.PNG,100,out);}
        image.recycle();atlas.recycle();System.out.println("MATERIAL LOADING CHECKS PASSED: "+checks);System.exit(0);
    }

    static void checkGeometry() throws Exception {
        Class<?> shapes = Class.forName("app.morphe.extension.boost.MaterialLoadingShapes", true, loader);
        Method decode = shapes.getDeclaredMethod("decodeMorphs");
        decode.setAccessible(true);
        float[][] morphs = (float[][]) decode.invoke(null);
        check(morphs.length == 8, "The renderer contains seven indeterminate morphs and the pull morph");
        for (int shape = 0; shape < morphs.length; shape++) {
            float[] coordinates = morphs[shape];
            for (float coordinate : coordinates) {
                if (Float.isNaN(coordinate) || Float.isInfinite(coordinate) || Math.abs(coordinate) > 1.1f) {
                    throw new AssertionError("Invalid morph control coordinate");
                }
            }
            int count = coordinates.length / 16;
            for (int cubic = 0; cubic < count; cubic++) {
                for (int endpoint = 0; endpoint < 2; endpoint++) {
                    for (int axis = 0; axis < 2; axis++) {
                        float end = coordinates[cubic * 16 + 12 + axis * 2 + endpoint];
                        float start = coordinates[((cubic + 1) % count) * 16 + axis * 2 + endpoint];
                        if (Math.abs(end - start) > 0.000001f) {
                            throw new AssertionError("Open cubic contour at morph endpoint");
                        }
                    }
                }
            }
            check(true, "Morph " + shape + " has finite bounded controls and closed contours at both endpoints");
        }
    }

    static void checkCircularProgress(String apk, Canvas canvas, Bitmap image) throws Exception {
        for (boolean dark : new boolean[] { false, true }) {
            Context themed = StyleChecks.candidateContext(RuntimeUiChecks.context, apk, dark);
            int resource = themed.getResources().getIdentifier("shikify_loading_indicator", "drawable", themed.getPackageName());
            Drawable drawable = themed.getDrawable(resource);
            check(drawable.getClass().getName().equals("app.morphe.extension.boost.MaterialLoadingDrawable"),
                    "The circular progress drawable inflates from patched resources in " + (dark ? "dark" : "light"));
            drawable.setBounds(0, 0, image.getWidth(), image.getHeight());
            image.eraseColor(0);
            drawable.draw(canvas);
            int stationary = hash(image);
            check(stationary != 0 && drawable.getIntrinsicWidth() == Math.round(48 * themed.getResources().getDisplayMetrics().density),
                    "The circular progress drawable has a visible 48dp intrinsic size");
            android.widget.ProgressBar bar = new android.widget.ProgressBar(themed);
            bar.setIndeterminateDrawable(drawable);
            check(bar.getIndeterminateDrawable() == drawable, "Framework ProgressBar retains the expressive drawable");
            drawable.setVisible(true, false);
            Animatable animation = (Animatable) drawable;
            animation.start();
            check(animation.isRunning(), "A visible circular loader starts its frame animator");
            Object animator = field(drawable, "animator");
            Method seek = animator.getClass().getMethod("setCurrentPlayTime", long.class);
            drawable.draw(canvas);
            seek.invoke(animator, 325L);
            image.eraseColor(0);
            drawable.draw(canvas);
            check(hash(image) != stationary, "Circular ProgressBar frames morph through the shared renderer");
            drawable.setVisible(false, false);
            check(!animation.isRunning(), "Hiding the circular drawable stops its frame animator");
            animation.start();
            check(!animation.isRunning(), "A hidden circular drawable starts no animator");
            drawable.setVisible(true, false);
            animation.start();
            check(animation.isRunning(), "Showing the circular loader permits animation to restart");
            animation.stop();
            check(!animation.isRunning(), "Stopping circular loading cancels its animator");
            Method durationScale = android.animation.ValueAnimator.class.getDeclaredMethod("setDurationScale", float.class);
            durationScale.setAccessible(true);
            try {
                durationScale.invoke(null, 0f);
                animation.start();
                image.eraseColor(0);
                drawable.draw(canvas);
                int disabled = hash(image);
                seek.invoke(animator, 975L);
                image.eraseColor(0);
                drawable.draw(canvas);
                check(hash(image) == disabled, "Disabled animator scale retains a stationary circular loading shape");
            } finally {
                animation.stop();
                durationScale.invoke(null, 1f);
            }
            drawable.setAlpha(0);
            image.eraseColor(0);
            drawable.draw(canvas);
            boolean transparent = true;
            for (int y = 0; y < image.getHeight(); y++) {
                for (int x = 0; x < image.getWidth(); x++) {
                    transparent &= image.getPixel(x, y) == 0;
                }
            }
            check(transparent, "Circular ProgressBar drawing retains native alpha");
            StyleChecks.context = themed;
            View page = StyleChecks.inflate("progressbar");
            Animatable pageAnimation = (Animatable) page.getBackground();
            check(pageAnimation.getClass().getName().equals("app.morphe.extension.boost.MaterialLoadingDrawable"),
                    "The native page loader constructor replaces its linear background");
            check(page.getVisibility() == View.GONE && !pageAnimation.isRunning(),
                    "An idle page loader occupies no layout space and schedules no animation");
            page.getClass().getMethod("a").invoke(page);
            check(page.getVisibility() == View.VISIBLE && !pageAnimation.isRunning(),
                    "Starting detached page loading defers animation until attachment");
            page.onVisibilityAggregated(true);
            check(pageAnimation.isRunning(), "An attached visible page loader starts its expressive animation");
            page.onVisibilityAggregated(false);
            check(!pageAnimation.isRunning(), "Hiding a page stops its expressive animation");
            page.onVisibilityAggregated(true);
            check(pageAnimation.isRunning(), "A visible page resumes an ongoing loading animation");
            page.getClass().getMethod("b").invoke(page);
            check(page.getVisibility() == View.GONE && !pageAnimation.isRunning(),
                    "Page completion hides the loader and cancels its animator");
            check(!((Animatable) field(page, "c")).isRunning(),
                    "Expressive page loading never starts the replaced linear animator");
            FrameLayout pageRoot = new FrameLayout(themed);
            View refresh = (View) Class.forName("androidx.swiperefreshlayout.widget.SwipeRefreshLayout", true, loader)
                    .getConstructor(Context.class, android.util.AttributeSet.class).newInstance(themed, null);
            refresh.setId(themed.getResources().getIdentifier("swipe_refresh_layout", "id", themed.getPackageName()));
            pageRoot.addView(refresh);
            pageRoot.addView(page);
            put(refresh, "c", true);
            page.getClass().getMethod("a").invoke(page);
            check(page.getVisibility() == View.GONE && !pageAnimation.isRunning(),
                    "Pull-to-refresh does not add a second page loading indicator");
            put(refresh, "c", false);
            page.getClass().getMethod("a").invoke(page);
            check(page.getVisibility() == View.VISIBLE,
                    "Page loading without a refresh gesture keeps its expressive indicator");
            page.getClass().getMethod("b").invoke(page);
            ProgressDialogFixture dialog = (ProgressDialogFixture) StyleChecks.allocate(ProgressDialogFixture.class);
            android.widget.ProgressBar dialogBar = new android.widget.ProgressBar(themed);
            dialogBar.setId(android.R.id.progress);
            Drawable circular = (Drawable) Class.forName(
                    "me.zhanghai.android.materialprogressbar.IndeterminateCircularProgressDrawable", true, loader)
                    .getConstructor(Context.class).newInstance(themed);
            dialogBar.setIndeterminateDrawable(circular);
            dialogBar.setIndeterminate(true);
            dialog.progress = dialogBar;
            Method shown = Class.forName("app.morphe.extension.boost.MaterialLoadingTweaks", true, loader)
                    .getMethod("onDialogShown", Object.class);
            shown.invoke(null, dialog);
            Drawable replacement = dialogBar.getIndeterminateDrawable();
            check(replacement.getClass().getName().equals("app.morphe.extension.boost.MaterialLoadingDrawable"),
                    "Circular progress dialogs use the expressive drawable after native setup");
            shown.invoke(null, dialog);
            check(dialogBar.getIndeterminateDrawable() == replacement,
                    "Showing a circular progress dialog again retains its expressive drawable");
            Drawable horizontal = (Drawable) Class.forName(
                    "me.zhanghai.android.materialprogressbar.IndeterminateHorizontalProgressDrawable", true, loader)
                    .getConstructor(Context.class).newInstance(themed);
            dialogBar.setIndeterminateDrawable(horizontal);
            shown.invoke(null, dialog);
            check(dialogBar.getIndeterminateDrawable() == horizontal,
                    "Horizontal progress dialogs retain their native drawable");
        }
    }
}
