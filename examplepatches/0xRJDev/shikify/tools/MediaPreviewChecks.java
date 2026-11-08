import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Isolated real-View tests. No image downloads, installed-app navigation or Reddit actions. */
public final class MediaPreviewChecks {
    static int checks;
    static Class<?> runtime;
    static Context context;
    static void check(boolean value,String message) {
        if (!value) throw new AssertionError(message);
        checks++; System.out.println("PASS: "+message);
    }
    public static final class Holder {
        public Object c0=new Object(), b0=new Object();
        public ImageView mediaPreviewIv, previewImageview, thumbnailIv;
    }
    public static final class Image extends ImageView {
        Image(Context context) { super(context); }
        @Override public boolean isAttachedToWindow() { return true; }
        @Override public boolean isShown() { return true; }
    }
    public static final class AnimatedImage extends Drawable implements Animatable {
        boolean running;
        @Override public void draw(Canvas canvas) {
            android.graphics.Paint paint=new android.graphics.Paint(); paint.setColor(0xFFFF3344);
            canvas.drawRect(getBounds(),paint);
        }
        @Override public void setAlpha(int value) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        @Override public int getIntrinsicWidth() { return 60; }
        @Override public int getIntrinsicHeight() { return 120; }
        @Override public void start() { running=true; }
        @Override public void stop() { running=false; }
        @Override public boolean isRunning() { return running; }
        @Override public ConstantState getConstantState() {
            return new ConstantState() {
                @Override public Drawable newDrawable() { return new AnimatedImage(); }
                @Override public int getChangingConfigurations() { return 0; }
            };
        }
    }
    static final class Fixture {
        final RuntimeUiChecks.FakeActivity activity;
        final Image image;
        final Holder holder=new Holder();
        final ViewGroup parent;
        final Object controller;
        final View.OnTouchListener listener;
        final float density;
        int clicks;
        long time=android.os.SystemClock.uptimeMillis();
        Fixture(boolean post) throws Exception {
            activity=new RuntimeUiChecks.FakeActivity(context);
            density=context.getResources().getDisplayMetrics().density;
            parent=(ViewGroup)activity.getWindow().getDecorView();
            image=new Image(activity); image.setImageDrawable(new AnimatedImage());
            image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            image.setOnClickListener(v -> clicks++);
            parent.addView(image,new FrameLayout.LayoutParams(Math.round(200*density),Math.round(100*density)));
            parent.measure(View.MeasureSpec.makeMeasureSpec(Math.round(400*density),View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(Math.round(800*density),View.MeasureSpec.EXACTLY));
            parent.layout(0,0,Math.round(400*density),Math.round(800*density));
            if (post) holder.previewImageview=image; else holder.mediaPreviewIv=image;
            runtime.getMethod(post ? "bindPost" : "bindComment",Object.class).invoke(null,holder);
            Field field=runtime.getDeclaredField("CONTROLLERS"); field.setAccessible(true);
            controller=((java.util.Map<?,?>)field.get(null)).get(image);
            listener=(View.OnTouchListener)controller;
        }
        boolean event(int action,float x,long elapsed) {
            MotionEvent event=MotionEvent.obtain(time,time+elapsed,action,x*density,20*density,0);
            try { return listener.onTouch(image,event); } finally { event.recycle(); }
        }
        void hold() { event(MotionEvent.ACTION_DOWN,20,0); ((Runnable)controller).run(); }
        void rebind() throws Exception { runtime.getMethod("bindComment",Object.class).invoke(null,holder); }
        Object field(String name) throws Exception {
            Field field=controller.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(controller);
        }
    }
    public static void main(String[] args) {
        try { run(args); } catch (Throwable error) { error.printStackTrace(System.out); System.exit(1); }
    }
    static void run(String[] args) throws Exception {
        ClassLoader loader=RuntimeUiChecks.initialize(args); context=RuntimeUiChecks.context;
        runtime=Class.forName("app.morphe.extension.boost.MediaPreviewTweaks",true,loader);
        Class<?> chrome=Class.forName("app.morphe.extension.boost.CommentsChromeTweaks",true,loader);
        check((Boolean)chrome.getMethod("mediaPeekEnabled").invoke(null),"Peek patch enabled independently");
        check((Boolean)chrome.getMethod("inlineMediaEnabled").invoke(null),"Inline expansion patch enabled independently");
        Fixture peek=new Fixture(false); Drawable original=peek.image.getDrawable();
        peek.hold(); AnimatedImage clone=(AnimatedImage)peek.field("preview");
        check(peek.field("overlay")!=null && (Boolean)peek.field("holding"),"Hold shows a preview overlay");
        check(clone!=original && clone.running && !((AnimatedImage)original).running,
            "Animated preview uses an independent drawable without starting/stopping the original");
        View panel=(View)peek.field("overlay");
        android.graphics.Bitmap rendered=android.graphics.Bitmap.createBitmap(panel.getWidth(),panel.getHeight(),
            android.graphics.Bitmap.Config.ARGB_8888);
        panel.draw(new Canvas(rendered));
        check(rendered.getPixel(rendered.getWidth()/2,rendered.getHeight()/2)==0xFFFF3344,
            "Preview drawable actually renders in the centre of the overlay");
        rendered.recycle();
        check(peek.clicks==0 && peek.image.getDrawable()==original,"Holding neither opens the viewer nor replaces the source image");
        peek.event(MotionEvent.ACTION_UP,20,600);
        check(peek.field("overlay")==null && peek.parent.getChildCount()==1 && !clone.running && peek.clicks==0,"Release dismisses preview and stops its animation without a click");
        Fixture cancel=new Fixture(false); cancel.hold(); cancel.event(MotionEvent.ACTION_CANCEL,20,600);
        check(cancel.field("overlay")==null && !(Boolean)cancel.field("holding"),"Touch cancellation removes the overlay");
        Fixture scroll=new Fixture(false); scroll.event(MotionEvent.ACTION_DOWN,20,0);
        scroll.event(MotionEvent.ACTION_MOVE,80,50); ((Runnable)scroll.controller).run();
        check(scroll.field("overlay")==null,"Movement before hold leaves scrolling alone");
        scroll.event(MotionEvent.ACTION_CANCEL,80,100);
        Fixture rebound=new Fixture(false); rebound.hold(); rebound.rebind();
        check(rebound.field("overlay")==null && rebound.clicks==0,"Rebinding closes preview before the row can show a different comment");
        Fixture detached=new Fixture(false); detached.hold();
        ((View.OnAttachStateChangeListener)detached.controller).onViewDetachedFromWindow(detached.image);
        check(detached.field("overlay")==null,"Detaching removes preview and its view references");
        Fixture missing=new Fixture(false); missing.image.setImageDrawable(null); missing.hold();
        check(missing.field("overlay")==null,"Unloaded image does not open an empty preview");
        missing.event(MotionEvent.ACTION_CANCEL,20,600);
        Fixture post=new Fixture(true);
        check(!post.event(MotionEvent.ACTION_DOWN,20,0),"Ordinary post image DOWN stays with Boost");
        check(!post.event(MotionEvent.ACTION_UP,20,40),"Ordinary post image UP stays with Boost");
        post.hold(); check(post.field("overlay")!=null,"Post media also supports hold preview");
        post.event(MotionEvent.ACTION_UP,20,600);
        Fixture inline=new Fixture(false);
        int originalHeight=inline.image.getLayoutParams().height;
        inline.event(MotionEvent.ACTION_DOWN,20,0); inline.event(MotionEvent.ACTION_UP,20,30);
        inline.event(MotionEvent.ACTION_DOWN,20,100); inline.event(MotionEvent.ACTION_UP,20,130);
        check((Boolean)inline.field("expanded") && inline.image.getLayoutParams().height>originalHeight,
            "Real double-tap detector expands the native preview in place");
        check(inline.image.getScaleType()==ImageView.ScaleType.FIT_CENTER && inline.clicks==0,
            "Expanded preview fits the image and does not open a new screen");
        inline.event(MotionEvent.ACTION_DOWN,20,500); inline.event(MotionEvent.ACTION_UP,20,530);
        inline.event(MotionEvent.ACTION_DOWN,20,600); inline.event(MotionEvent.ACTION_UP,20,630);
        check(!(Boolean)inline.field("expanded") && inline.image.getLayoutParams().height==originalHeight && inline.clicks==0,
            "A second double tap collapses inline media without opening the viewer");
        inline.event(MotionEvent.ACTION_DOWN,20,1000); inline.event(MotionEvent.ACTION_UP,20,1030);
        inline.event(MotionEvent.ACTION_DOWN,20,1100); inline.event(MotionEvent.ACTION_UP,20,1130);
        inline.rebind();
        check(!(Boolean)inline.field("expanded") && inline.image.getLayoutParams().height==originalHeight &&
            inline.image.getScaleType()==ImageView.ScaleType.CENTER_CROP,"Rebinding restores original layout and scale type exactly");
        Fixture tap=new Fixture(false); tap.event(MotionEvent.ACTION_DOWN,20,0); tap.event(MotionEvent.ACTION_UP,20,40);
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                check(tap.clicks==1,"Confirmed single tap invokes Boost's original click listener exactly once");
                System.out.println("MEDIA PREVIEW CHECKS PASSED: "+checks); System.exit(0);
            } catch (Throwable error) { error.printStackTrace(System.out); System.exit(1); }
        },600);
        Looper.loop();
    }
}
