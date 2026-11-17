package app.morphe.extension.boost;

import android.animation.ValueAnimator;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.provider.Settings;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;
import android.widget.ProgressBar;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.RecyclerView$l;
import androidx.recyclerview.widget.RecyclerView$x;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

/** Retains native gesture/refresh state, animations, callbacks, measurement and insets. */
public final class MaterialLoadingTweaks {
    private static final WeakHashMap<Object,Refresh> REFRESH=new WeakHashMap<>();
    private static final WeakHashMap<View,Wheel> WHEELS=new WeakHashMap<>();
    private static final WeakHashMap<View,PageFooter> PAGE_FOOTERS=new WeakHashMap<>();
    private static final int PAGE_SPACE_DP=80;
    private static final int PAGE_GAP_DP=16;
    private static final int PAGE_INDICATOR_DP=48;
    private MaterialLoadingTweaks() { }
    public static void onProgressCreated(Object instance) {
        View view = (View) instance;
        view.setBackground(new MaterialLoadingDrawable(view.getContext()));
        view.setVisibility(View.GONE);
        int label = view.getResources().getIdentifier("m3_loading_indicator_content_description",
                "string", view.getContext().getPackageName());
        view.setContentDescription(view.getContext().getString(label));
        view.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host,
                    AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(ProgressBar.class.getName());
            }
        });
    }
    public static void startProgress(Object instance) {
        View view = (View) instance;
        View parent = view.getParent() instanceof View ? (View) view.getParent() : view;
        int refreshId = view.getResources().getIdentifier("swipe_refresh_layout", "id",
                view.getContext().getPackageName());
        View refresh = parent.findViewById(refreshId);
        if (refresh != null && Boolean.TRUE.equals(CommentsChromeTweaks.field(refresh, "c"))) {
            stopProgress(instance);
            return;
        }
        View list = SurfaceAppearanceTweaks.find(parent, "recyclerview");
        if (list instanceof RecyclerView && ((RecyclerView) list).getChildCount() > 0) {
            PageFooter footer = PAGE_FOOTERS.get(view);
            if (footer == null || footer.list.get() != list) {
                if (footer != null) footer.dispose();
                footer = new PageFooter(view, (RecyclerView) list);
                PAGE_FOOTERS.put(view, footer);
            } else {
                footer.reactivate();
            }
            ((Animatable) view.getBackground()).stop();
            view.setVisibility(View.GONE);
        } else {
            PageFooter footer = PAGE_FOOTERS.get(view);
            if (footer != null) footer.dispose();
            view.setTranslationY(0);
            view.setVisibility(View.VISIBLE);
            view.getBackground().setVisible(view.isAttachedToWindow() && view.isShown()
                    && view.getWindowVisibility() == View.VISIBLE, false);
            ((Animatable) view.getBackground()).start();
        }
    }
    public static void stopProgress(Object instance) {
        View view = (View) instance;
        PageFooter footer = PAGE_FOOTERS.get(view);
        if (footer != null) footer.dispose();
        ((Animatable) view.getBackground()).stop();
        view.setVisibility(View.GONE);
    }
    /**
     * An empty screen keeps the indicator centred. When posts are already showing, more are loading
     * below them, so the indicator moves to the bottom, clear of the floating navigation bar.
     */
    private static final class PageFooter extends RecyclerView$l {
        final WeakReference<RecyclerView> list;
        final WeakReference<View> owner;
        final MaterialLoadingIndicator indicator;
        final int size;
        final int gap;
        final float legacyScale;
        boolean active = true;
        boolean attached;
        PageFooter(View view, RecyclerView recycler) {
            list = new WeakReference<>(recycler);
            owner = new WeakReference<>(view);
            indicator = new MaterialLoadingIndicator(MaterialYouTweaks.color(view.getContext(),
                    "colorPrimary", android.R.attr.colorAccent));
            legacyScale = legacyScale(view.getContext());
            size = Math.round(PAGE_INDICATOR_DP * view.getResources().getDisplayMetrics().density);
            gap = Math.round(PAGE_GAP_DP * view.getResources().getDisplayMetrics().density);
            if (recycler.P()) recycler.post(this::attach);
            else attach();
            recycler.announceForAccessibility(view.getContentDescription());
        }
        int navigationOverlap(RecyclerView recycler) {
            int[] location = new int[2];
            recycler.getLocationInWindow(location);
            int listBottom = location[1] + recycler.getHeight();
            View root = recycler.getRootView();
            root.getLocationInWindow(location);
            android.view.WindowInsets insets = root.getRootWindowInsets();
            int bottomInset = insets == null ? 0 : insets.getSystemWindowInsetBottom();
            int safeBottom = location[1] + root.getHeight() - bottomInset;
            int navigationTop = restingTop(
                    SurfaceAppearanceTweaks.find(root, "bottom_navigation_view"), location);
            navigationTop = Math.min(navigationTop, restingTop(
                    SurfaceAppearanceTweaks.find(root, "bottom_navigation"), location));
            return Math.max(0, Math.min(listBottom, safeBottom) - navigationTop);
        }
        int restingTop(View view, int[] location) {
            if (view == null || !view.isShown() || view.getHeight() <= 0) return Integer.MAX_VALUE;
            view.getLocationInWindow(location);
            if (location[1] <= 0) return Integer.MAX_VALUE;
            return Math.round(location[1] - view.getTranslationY());
        }
        void reactivate() {
            active = true;
            invalidateDecorations();
        }
        void invalidateDecorations() {
            RecyclerView recycler = list.get();
            if (recycler == null || !active) return;
            if (recycler.P()) { recycler.post(this::invalidateDecorations); return; }
            recycler.O();
        }
        void attach() {
            RecyclerView recycler = list.get();
            if (recycler == null || !active || attached) return;
            if (recycler.P()) { recycler.post(this::attach); return; }
            recycler.g(this);
            attached = true;
        }
        private int lastPosition(RecyclerView recycler) {
            return recycler.getAdapter() == null ? -1 : recycler.getAdapter().getItemCount() - 1;
        }
        @Override public void e(Rect offsets, View child, RecyclerView recycler, RecyclerView$x state) {
            int last = lastPosition(recycler);
            if (active && last >= 0 && RecyclerView.J(child) == last)
                offsets.bottom = Math.round(PAGE_SPACE_DP * recycler.getResources().getDisplayMetrics().density)
                        + navigationOverlap(recycler);
        }
        @Override public void g(Canvas canvas, RecyclerView recycler) {
            if (!active) return;
            int last = lastPosition(recycler);
            if (last < 0) return;
            for (int index = 0; index < recycler.getChildCount(); index++) {
                View child = recycler.getChildAt(index);
                if (RecyclerView.J(child) != last) continue;
                int top = Math.round(child.getBottom() + child.getTranslationY()) + gap;
                if (top >= recycler.getHeight() - recycler.getPaddingBottom() || top + size <= 0) return;
                float motionScale = scale(recycler.getContext(), legacyScale);
                indicator.draw(canvas, recycler.getWidth() / 2f, top + size / 2f, size, 255, true, 1,
                        motionScale, System.nanoTime());
                if (motionScale > 0 && recycler.isAttachedToWindow() && recycler.isShown() &&
                        recycler.getWindowVisibility() == View.VISIBLE) recycler.postInvalidateOnAnimation();
                return;
            }
        }
        void dispose() {
            active = false;
            indicator.reset();
            RecyclerView recycler = list.get();
            if (recycler == null) return;
            if (recycler.P()) recycler.post(this::remove);
            else remove();
        }
        void remove() {
            RecyclerView recycler = list.get();
            if (recycler == null || active) return;
            if (recycler.P()) { recycler.post(this::remove); return; }
            if (attached) recycler.a0(this);
            attached = false;
            View view = owner.get();
            if (view != null && PAGE_FOOTERS.get(view) == this) PAGE_FOOTERS.remove(view);
        }
    }
    public static void onDialogShown(Object instance) {
        if (!(instance instanceof Dialog)) {
            return;
        }
        Dialog dialog = (Dialog) instance;
        View view = dialog.findViewById(android.R.id.progress);
        if (!(view instanceof ProgressBar)) {
            return;
        }
        ProgressBar bar = (ProgressBar) view;
        Drawable drawable = bar.getIndeterminateDrawable();
        if (bar.isIndeterminate() && drawable != null && drawable.getClass().getName().equals(
                "me.zhanghai.android.materialprogressbar.IndeterminateCircularProgressDrawable")) {
            bar.setIndeterminateDrawable(new MaterialLoadingDrawable(bar.getContext()));
        }
    }
    public static void onRefreshCreated(Object owner) {
        if(!(owner instanceof View))return;
        try {
            Object icon=CommentsChromeTweaks.field(owner,"M"),drawable=CommentsChromeTweaks.field(owner,"S");
            if(!(icon instanceof ImageView) || !(drawable instanceof Drawable))return;
            Refresh state=new Refresh((View)owner,(ImageView)icon);
            REFRESH.put(drawable,state);state.theme();
        }catch(ReflectiveOperationException | RuntimeException ignored) { }
    }
    public static void onPull(Object owner,float distance) {
        Object drawable=CommentsChromeTweaks.field(owner,"S");Refresh state=REFRESH.get(drawable);
        if(state==null)return;
        try {float threshold=state.threshold.getFloat(owner),before=state.progress;state.progress=Math.max(0,Math.min(1,distance/Math.max(1,threshold)));if(before<1 && state.progress>=1 && owner instanceof View)Haptics.tick((View)owner);}
        catch(IllegalAccessException ignored) { }
    }
    public static void onRefreshStopped(Object drawable) {
        Refresh state=REFRESH.get(drawable);if(state!=null){state.indicator.reset();state.progress=0;}
    }
    public static boolean drawRefresh(Object object,Canvas canvas) {
        Refresh state=REFRESH.get(object);if(state==null || !(object instanceof Drawable))return false;
        View owner=state.owner.get();ImageView icon=state.icon.get();if(owner==null || icon==null)return false;
        try {
            Drawable drawable=(Drawable)object;Rect bounds=drawable.getBounds();
            boolean loading=state.refreshing.getBoolean(owner) || ((Animatable)drawable).isRunning();
            state.theme();
            // Native CircularProgressDrawable owns the frame driver. No second timer,
            // overlay, pre-draw scan or refresh listener is installed.
            state.indicator.draw(canvas,bounds.exactCenterX(),bounds.exactCenterY(),Math.min(bounds.width(),bounds.height()),
                drawable.getAlpha(),loading,state.progress,scale(icon.getContext(),state.legacyScale),System.nanoTime());
            return true;
        }catch(IllegalAccessException ignored) {return false;}
    }
    public static boolean drawWheel(Object object,Canvas canvas) {
        if(!(object instanceof View))return false;View view=(View)object;
        Wheel state=WHEELS.get(view);
        if(state==null) {
            try {state=new Wheel(view);WHEELS.put(view,state);}
            catch(ReflectiveOperationException | RuntimeException ignored){return false;}
        }
        try {
            if(!state.spinning.getBoolean(view)){state.indicator.reset();return false;}
            float size=Math.min(view.getWidth()-view.getPaddingLeft()-view.getPaddingRight(),view.getHeight()-view.getPaddingTop()-view.getPaddingBottom());
            size=Math.min(size,48*view.getResources().getDisplayMetrics().density);
            float scale=scale(view.getContext(),state.legacyScale);
            state.indicator.draw(canvas,view.getPaddingLeft()+(view.getWidth()-view.getPaddingLeft()-view.getPaddingRight())/2f,
                view.getPaddingTop()+(view.getHeight()-view.getPaddingTop()-view.getPaddingBottom())/2f,size,255,true,1,scale,System.nanoTime());
            if(scale>0 && view.isAttachedToWindow() && view.isShown() && view.getWindowVisibility()==View.VISIBLE)view.postInvalidateOnAnimation();
            return true;
        }catch(IllegalAccessException ignored){return false;}
    }
    private static Field mapped(Class<?> type,String name) throws NoSuchFieldException {
        for(Class<?> current=type;current!=null;current=current.getSuperclass()) {
            try {Field field=current.getDeclaredField(name);field.setAccessible(true);return field;}
            catch(NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static float legacyScale(Context context) {
        if(Build.VERSION.SDK_INT>=33)return 1;
        try{return Math.max(0,Settings.Global.getFloat(context.getContentResolver(),Settings.Global.ANIMATOR_DURATION_SCALE,1));}
        catch(RuntimeException ignored){return 1;}
    }
    private static float scale(Context context,float fallback) {
        return Build.VERSION.SDK_INT>=33 ? ValueAnimator.getDurationScale():fallback;
    }
    private static final class Refresh {
        final WeakReference<View> owner;
        final WeakReference<ImageView> icon;
        final Field refreshing,threshold;
        final MaterialLoadingIndicator indicator;
        final int container;
        final float legacyScale;
        Drawable background;
        float progress;
        Refresh(View view,ImageView image) throws ReflectiveOperationException {
            owner=new WeakReference<>(view);icon=new WeakReference<>(image);
            refreshing=mapped(view.getClass(),"c");threshold=mapped(view.getClass(),"y");
            container=MaterialYouTweaks.color(view.getContext(),"colorPrimaryContainer",android.R.attr.colorBackground);
            indicator=new MaterialLoadingIndicator(MaterialYouTweaks.color(view.getContext(),"colorOnPrimaryContainer",android.R.attr.colorAccent));
            legacyScale=legacyScale(view.getContext());
        }
        void theme() {
            ImageView view=icon.get();if(view==null)return;
            // Boost changes the original circle colour while configuring its theme.
            // Colour only the existing ShapeDrawable; retain its alpha/elevation.
            Drawable current=view.getBackground();
            if(current instanceof android.graphics.drawable.ShapeDrawable) {
                android.graphics.Paint paint=((android.graphics.drawable.ShapeDrawable)current).getPaint();
                if((paint.getColor()&0xffffff)!=(container&0xffffff)){int alpha=paint.getAlpha();paint.setColor(container);paint.setAlpha(alpha);current.invalidateSelf();}
            } else if(background!=current) {view.setBackgroundColor(container);}
            background=view.getBackground();
        }
    }
    private static final class Wheel {
        final Field spinning;
        final MaterialLoadingIndicator indicator;
        final float legacyScale;
        Wheel(View view) throws ReflectiveOperationException {
            spinning=mapped(view.getClass(),"O");
            indicator=new MaterialLoadingIndicator(MaterialYouTweaks.color(view.getContext(),"colorPrimary",android.R.attr.colorAccent));
            legacyScale=legacyScale(view.getContext());
        }
    }
}
