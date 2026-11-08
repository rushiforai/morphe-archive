package app.morphe.extension.boost;

import android.app.Activity;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Enhance the existing image targets; never replace Boost's image loader or click listener. */
public final class MediaPreviewTweaks {
    private static final WeakHashMap<ImageView, Controller> CONTROLLERS = new WeakHashMap<>();
    private MediaPreviewTweaks() { }
    public static void bindComment(Object holder) {
        attach(holder, "mediaPreviewIv", "c0", CommentsChromeTweaks.inlineMediaEnabled());
    }
    public static void bindPost(Object holder) {
        if (!CommentsChromeTweaks.mediaPeekEnabled()) return;
        attach(holder, "previewImageview", "b0", false);
        attach(holder, "thumbnailIv", "b0", false);
    }
    private static void attach(Object holder, String field, String modelField, boolean inline) {
        if (!inline && !CommentsChromeTweaks.mediaPeekEnabled()) return;
        Object value = CommentsChromeTweaks.field(holder, field);
        if (!(value instanceof ImageView)) return;
        ImageView image = (ImageView)value;
        Controller controller = CONTROLLERS.get(image);
        if (controller == null) {
            controller = new Controller(image, holder, modelField, inline);
            CONTROLLERS.put(image, controller);
            image.setOnTouchListener(controller);
            image.addOnAttachStateChangeListener(controller);
        }
        controller.rebind();
    }
    private static final class Controller implements View.OnTouchListener, View.OnAttachStateChangeListener, Runnable {
        final WeakReference<ImageView> source;
        final WeakReference<Object> holder;
        final String modelField;
        final boolean inline;
        final GestureDetector taps;
        WeakReference<Object> model;
        WeakReference<ViewGroup> overlayParent;
        FrameLayout overlay;
        Drawable preview;
        boolean pending, holding, expanded;
        int originalHeight;
        ImageView.ScaleType originalScale;
        float downX, downY;
        Controller(ImageView view, Object owner, String field, boolean allowInline) {
            source = new WeakReference<>(view); holder = new WeakReference<>(owner);
            modelField = field; inline = allowInline;
            android.content.Context context = view.getContext().getApplicationContext();
            if (context == null) context = view.getContext();
            taps = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
                @Override public boolean onDown(MotionEvent event) { return true; }
                @Override public boolean onSingleTapConfirmed(MotionEvent event) {
                    ImageView image = source.get();
                    if (image != null && current()) image.performClick();
                    return true;
                }
                @Override public boolean onDoubleTap(MotionEvent event) {
                    ImageView image = source.get();
                    if (image != null && current()) { cancelPending(); toggle(image); }
                    return true;
                }
            });
            taps.setIsLongpressEnabled(false);
        }
        boolean current() {
            return model != null && model.get() != null &&
                CommentsChromeTweaks.field(holder.get(), modelField) == model.get();
        }
        void rebind() {
            cancel();
            ImageView image = source.get();
            if (image != null) restore(image);
            model = new WeakReference<>(CommentsChromeTweaks.field(holder.get(), modelField));
        }
        @Override public boolean onTouch(View view, MotionEvent event) {
            ImageView image = source.get();
            if (image == null) return false;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                // Preserve the detector's first tap while a second DOWN is arriving.
                if (holding || !current()) cancel(); else cancelPending();
                model = new WeakReference<>(CommentsChromeTweaks.field(holder.get(), modelField));
                downX=event.getRawX(); downY=event.getRawY();
                if (CommentsChromeTweaks.mediaPeekEnabled() && current()) {
                    pending=true; image.postDelayed(this, ViewConfiguration.getLongPressTimeout());
                }
            }
            if (event.getPointerCount()!=1 || action == MotionEvent.ACTION_POINTER_DOWN) {
                boolean consume=holding || inline; cancel(); return consume;
            }
            if (action == MotionEvent.ACTION_MOVE && !holding) {
                float slop=ViewConfiguration.get(image.getContext()).getScaledTouchSlop();
                if (Math.hypot(event.getRawX()-downX,event.getRawY()-downY)>slop) cancelPending();
            }
            if (!current()) { boolean consume=holding || inline; cancel(); return consume; }
            if (holding) {
                if (action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL) cancel();
                return true;
            }
            if (action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL) cancelPending();
            if (inline) { taps.onTouchEvent(event); return true; }
            return false; // Original click/scroll dispatch remains intact for ordinary post images.
        }
        @Override public void run() {
            try { showPeek(); }
            catch (RuntimeException | LinkageError error) {
                cancel();
            }
        }
        private void showPeek() {
            ImageView image=source.get();
            if (!pending || image==null || !current() || !image.isAttachedToWindow() || !image.isShown()) return;
            pending=false;
            Drawable drawable=image.getDrawable();
            Drawable.ConstantState state=drawable==null ? null : drawable.getConstantState();
            if (state==null || (!(drawable instanceof BitmapDrawable) && !(drawable instanceof Animatable)) ||
                    drawable instanceof ColorDrawable || drawable.getIntrinsicWidth()<=1 || drawable.getIntrinsicHeight()<=1)
                return;
            Activity activity=CommentsChromeTweaks.activity(image.getContext());
            if (activity==null || activity.isFinishing() || !(activity.getWindow().getDecorView() instanceof ViewGroup)) return;
            ViewGroup parent=(ViewGroup)activity.getWindow().getDecorView();
            FrameLayout panel=new FrameLayout(image.getContext());
            android.content.SharedPreferences surfaces=android.preference.PreferenceManager.getDefaultSharedPreferences(image.getContext());
            panel.setBackgroundColor(SurfaceAppearanceTweaks.tint(SurfaceAppearanceTweaks.role(image.getContext(),true),
                "solid".equals(surfaces.getString(SurfaceAppearanceTweaks.STYLE,"dimmed")) ? 100:SurfaceAppearanceTweaks.number(surfaces,SurfaceAppearanceTweaks.OPACITY,70,55,90)));
            int pad=Math.round(24*image.getResources().getDisplayMetrics().density);
            panel.setPadding(pad,pad*3,pad,pad*3);
            panel.setClickable(false); panel.setFocusable(false);
            ImageView target=new ImageView(image.getContext());
            target.setScaleType(ImageView.ScaleType.FIT_CENTER);
            preview=state.newDrawable(image.getResources()).mutate();
            target.setImageDrawable(preview);
            panel.addView(target,new FrameLayout.LayoutParams(-1,-1));
            TextView hint=new TextView(image.getContext()); hint.setText("Release to close");
            hint.setTextColor(0xFFFFFFFF); hint.setGravity(Gravity.CENTER);
            panel.addView(hint,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));
            overlay=panel; overlayParent=new WeakReference<>(parent);
            panel.measure(View.MeasureSpec.makeMeasureSpec(parent.getWidth(),View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(parent.getHeight(),View.MeasureSpec.EXACTLY));
            panel.layout(0,0,parent.getWidth(),parent.getHeight());
            // ViewGroupOverlay is visual-only: do not disturb the native child hierarchy or input.
            parent.getOverlay().add(panel);
            holding=true;
            cancelTap(image);
            if (preview instanceof Animatable) ((Animatable)preview).start();
            image.performHapticFeedback(android.view.HapticFeedbackConstants.LONG_PRESS);
            if (image.getParent()!=null) image.getParent().requestDisallowInterceptTouchEvent(true);
        }
        void cancelTap(ImageView image) {
            long now=android.os.SystemClock.uptimeMillis();
            MotionEvent event=MotionEvent.obtain(now,now,MotionEvent.ACTION_CANCEL,0,0,0);
            try { taps.onTouchEvent(event); image.onTouchEvent(event); }
            finally { event.recycle(); }
        }
        void cancelPending() {
            pending=false;
            ImageView image=source.get(); if (image!=null) image.removeCallbacks(this);
        }
        void cancel() {
            cancelPending();
            ImageView image=source.get(); if (image!=null) cancelTap(image);
            if (preview instanceof Animatable) ((Animatable)preview).stop();
            ViewGroup parent=overlayParent==null ? null : overlayParent.get();
            if (parent!=null && overlay!=null) parent.getOverlay().remove(overlay);
            if (image!=null && holding && image.getParent()!=null)
                image.getParent().requestDisallowInterceptTouchEvent(false);
            preview=null; overlay=null; overlayParent=null; holding=false;
        }
        void toggle(ImageView image) {
            if (!inline || !(image.getLayoutParams() instanceof ViewGroup.LayoutParams)) return;
            if (expanded) { restore(image); return; }
            Drawable drawable=image.getDrawable();
            if (drawable==null) return;
            Activity activity=CommentsChromeTweaks.activity(image.getContext());
            if (activity==null) return;
            int width=image.getWidth();
            int maximum=Math.round(activity.getWindow().getDecorView().getHeight()*0.75f);
            if (width<=0 || maximum<=0) return;
            originalHeight=image.getLayoutParams().height; originalScale=image.getScaleType();
            int natural=drawable.getIntrinsicWidth()>0
                ? Math.round((float)width*drawable.getIntrinsicHeight()/drawable.getIntrinsicWidth()) : maximum;
            image.getLayoutParams().height=Math.min(maximum,Math.max(image.getHeight(),natural));
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            expanded=true; image.requestLayout();
        }
        void restore(ImageView image) {
            if (!expanded) return;
            image.getLayoutParams().height=originalHeight;
            image.setScaleType(originalScale); image.requestLayout(); expanded=false;
        }
        @Override public void onViewAttachedToWindow(View view) { }
        @Override public void onViewDetachedFromWindow(View view) { cancel(); restore((ImageView)view); }
    }
}
