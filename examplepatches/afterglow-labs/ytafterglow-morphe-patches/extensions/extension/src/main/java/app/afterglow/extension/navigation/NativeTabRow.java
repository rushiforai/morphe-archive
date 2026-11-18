package app.afterglow.extension.navigation;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;

import app.afterglow.extension.Afterglow;

import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Map;
import java.util.WeakHashMap;

/** Lays out the existing native pivot children; it never replaces their contents or commands. */
final class NativeTabRow extends LinearLayout {
    private final WeakReference<View> pivot;
    private final Map<View,NativeTabPolicy.ContainerHeight> heights=new WeakHashMap<>();
    private NativeTabPolicy.Plan measuredPlan;
    private int rowHeight,bonusHeight,appliedExtra;
    private boolean spaceUpdatePending;

    NativeTabRow(View host) {
        super(host.getContext());pivot=new WeakReference<>(host);
        setOrientation(HORIZONTAL);
    }
    private int dp(int value){return Math.round(value*getResources().getDisplayMetrics().density);}

    /** Native binding can be delayed, so an incomplete mapping retains LinearLayout's own layout. */
    private NativeTabPolicy.Plan usablePlan() {
        View host=pivot.get();if(host==null)return null;
        NativeTabPolicy.Plan plan=NativeTabs.plan(host);
        if(plan==null||!plan.twoRows()||getChildCount()!=plan.ordered.size())return null;
        HashSet<String> seen=new HashSet<>();
        for(int i=0;i<getChildCount();i++) {
            String id=NativeTabs.identifier(getChildAt(i));
            if(!plan.ordered.contains(id)||!seen.add(id))return null;
        }
        return plan;
    }

    @Override protected void onMeasure(int widthSpec,int heightSpec) {
        NativeTabPolicy.Plan plan=usablePlan();
        if(plan==null) {
            measuredPlan=null;adjustSpaceLater(0);super.onMeasure(widthSpec,heightSpec);return;
        }
        View host=pivot.get();
        int width=MeasureSpec.getSize(widthSpec);
        // HorizontalScrollView can supply an UNSPECIFIED child width during its first pass.
        if(width<=0&&host!=null)width=host.getWidth();
        if(width<=0)width=getResources().getDisplayMetrics().widthPixels;
        if(width<=0){measuredPlan=null;super.onMeasure(widthSpec,heightSpec);return;}
        rowHeight=dp(48);bonusHeight=dp(48);
        int contentWidth=Math.max(0,width-getPaddingLeft()-getPaddingRight());
        boolean rtl=getLayoutDirection()==LAYOUT_DIRECTION_RTL;
        for(int i=0;i<getChildCount();i++) {
            View child=getChildAt(i);
            NativeTabPolicy.Frame frame=NativeTabPolicy.frame(plan,NativeTabs.identifier(child),contentWidth,rowHeight,bonusHeight,rtl);
            child.measure(MeasureSpec.makeMeasureSpec(frame.width(),MeasureSpec.EXACTLY),MeasureSpec.makeMeasureSpec(frame.height(),MeasureSpec.EXACTLY));
        }
        measuredPlan=plan;adjustSpaceLater(bonusHeight);
        setMeasuredDimension(width,rowHeight+bonusHeight+getPaddingTop()+getPaddingBottom());
    }

    @Override protected void onLayout(boolean changed,int left,int top,int right,int bottom) {
        NativeTabPolicy.Plan plan=usablePlan();
        if(plan==null||plan!=measuredPlan){super.onLayout(changed,left,top,right,bottom);return;}
        int width=Math.max(0,right-left-getPaddingLeft()-getPaddingRight());
        boolean rtl=getLayoutDirection()==LAYOUT_DIRECTION_RTL;
        for(int i=0;i<getChildCount();i++) {
            View child=getChildAt(i);
            NativeTabPolicy.Frame frame=NativeTabPolicy.frame(plan,NativeTabs.identifier(child),width,rowHeight,bonusHeight,rtl);
            child.layout(getPaddingLeft()+frame.left,getPaddingTop()+frame.top,getPaddingLeft()+frame.right,getPaddingTop()+frame.bottom);
        }
    }

    /** Reserve the bonus row in fixed-height native containers, keeping their original insets. */
    private void adjustSpaceLater(int extra) {
        // YouTube can restore one-row LayoutParams when a mini player closes. Recheck the
        // actual ancestors even when our row membership and requested extra space did not change.
        if(extra==appliedExtra&&!spaceUpdatePending&&containerHeightsCurrent(extra))return;
        appliedExtra=extra;
        if(spaceUpdatePending)return;
        spaceUpdatePending=true;
        post(()->{
            spaceUpdatePending=false;View host=pivot.get();if(host==null)return;
            try {
                adjustHeight(host,appliedExtra);
                View container=bottomContainer(host);
                if(container!=null)adjustHeight(container,appliedExtra);
                host.requestLayout();
            }catch(Throwable error){Afterglow.error("NativeTabs.space",error);}
        });
    }
    private void adjustHeight(View view,int extra) {
        ViewGroup.LayoutParams params=view.getLayoutParams();if(params==null)return;
        NativeTabPolicy.ContainerHeight height=heights.get(view);
        if(height==null){height=new NativeTabPolicy.ContainerHeight(params.height);heights.put(view,height);}
        int desired=height.apply(params.height,extra);
        if(params.height!=desired){params.height=desired;view.setLayoutParams(params);}
    }
    private boolean containerHeightsCurrent(int extra) {
        if(extra==0&&heights.isEmpty())return true;
        View host=pivot.get();if(host==null)return true;
        View container=bottomContainer(host);
        return heightCurrent(host,extra)&&(container==null||heightCurrent(container,extra));
    }
    private boolean heightCurrent(View view,int extra) {
        ViewGroup.LayoutParams params=view.getLayoutParams();if(params==null)return true;
        NativeTabPolicy.ContainerHeight height=heights.get(view);
        return height!=null&&height.current(params.height,extra);
    }
    private View bottomContainer(View host) {
        int containerId=getResources().getIdentifier("bottom_bar_container","id",getContext().getPackageName());
        ViewParent parent=host.getParent();
        for(int depth=0;parent instanceof View&&depth<12;depth++) {
            View view=(View)parent;
            if(containerId!=0&&view.getId()==containerId)return view;
            parent=view.getParent();
        }
        return null;
    }
    private void refresh() {
        View host=pivot.get();if(host==null)return;
        try{NativeTabs.refresh(host);requestLayout();}catch(Throwable error){Afterglow.error("NativeTabs.refreshRow",error);}
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();post(this::refresh);}
    @Override public void onWindowFocusChanged(boolean focused){super.onWindowFocusChanged(focused);if(focused)post(this::refresh);}
}
