package app.zonghome.extension;

import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

public final class ChipStyling {
    private ChipStyling() {}
    private static final WeakHashMap<View, Page> PAGES = new WeakHashMap<>();
    private static final WeakHashMap<TextView, Appearance> CHIPS = new WeakHashMap<>();
    private static boolean isChip(View view) {
        String name=ViewNames.name(view);
        return name.equals("btn_monthly") || name.equals("btn_weekly") || name.equals("btn_daily");
    }
    public static boolean ownsBackground(android.graphics.drawable.Drawable drawable) { return drawable instanceof ChipBackground; }
    public static void selected(boolean selected, View view) {
        if(view!=null && isChip(view))view.setSelected(selected);
    }
    public static void style(TextView view) {
        Appearance appearance=CHIPS.get(view);
        if(appearance==null) { appearance=new Appearance(view); CHIPS.put(view,appearance); }
        ColorStateList incoming=view.getBackgroundTintList();
        if(incoming!=null) {
            int color=incoming.getDefaultColor();
            view.setSelected(color==0xffacd58e || color==CharcoalTheme.ACCENT || color==appearance.accent || color==0xff8ac22a || color==0xffe40077 || color==0xffed0181);
            view.setBackgroundTintList(null);
        }
        if(view.getBackground()!=appearance.background)view.setBackground(appearance.background);
        if(view.getTextColors()!=appearance.text)view.setTextColor(appearance.text);
        appearance.background.setState(view.getDrawableState());
        if(view.getLayoutParams() instanceof android.view.ViewGroup.MarginLayoutParams) {
            android.view.ViewGroup.MarginLayoutParams margins=(android.view.ViewGroup.MarginLayoutParams)view.getLayoutParams();
            int gap=Math.round(4*view.getResources().getDisplayMetrics().density);
            if(margins.getMarginStart()!=gap || margins.getMarginEnd()!=gap){margins.setMarginStart(gap);margins.setMarginEnd(gap);view.setLayoutParams(margins);}
        }
    }
    public static void attach(View root) {
        if(root==null || PAGES.containsKey(root))return;
        Page page=new Page(root);PAGES.put(root,page);
        root.addOnAttachStateChangeListener(page);
        page.attach(root);
    }
    public static void refreshVisiblePages() {
        for(Page page:PAGES.values()) {
            View root=page.root.get();
            if(root!=null && root.isShown())stylePage(root);
        }
    }
    private static void stylePage(View root) {
        View row=ViewNames.find(root,"view_validity");
        if(row!=null) {
            int height=Math.round(40*row.getResources().getDisplayMetrics().density*Math.max(1f,row.getResources().getConfiguration().fontScale));
            android.view.ViewGroup.LayoutParams params=row.getLayoutParams();
            if(params!=null && params.height!=height){params.height=height;row.setLayoutParams(params);}
            if(row.getMinimumHeight()!=height)row.setMinimumHeight(height);
            if(!(row.getBackground() instanceof android.graphics.drawable.ColorDrawable) || ((android.graphics.drawable.ColorDrawable)row.getBackground()).getColor()!=0)row.setBackgroundColor(0);
        }
        for(String name:new String[]{"btn_monthly","btn_weekly","btn_daily"}) {
            View view=ViewNames.find(root,name);
            if(view instanceof TextView)style((TextView)view);
        }
    }
    private static final class Appearance {
        final int accent;
        final ChipBackground background;
        final ColorStateList text;
        Appearance(View view) {
            accent=CharcoalTheme.tabIndicatorColor(view,CharcoalTheme.ACCENT);
            background=new ChipBackground(view.getResources().getDisplayMetrics().density,accent);
            text=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_selected},{}},
                new int[]{CharcoalTheme.MUTED,CharcoalTheme.ON_ACCENT,CharcoalTheme.TEXT});
        }
    }
    private static final class ChipBackground extends GradientDrawable {
        final float density;
        final int accent;
        boolean selected;
        ChipBackground(float density,int accent) { this.density=density;this.accent=accent;update(false); }
        void update(boolean value) {
            selected=value;
            setColor(value?accent:CharcoalTheme.RAISED);
            setCornerRadius((value?6:1000)*density);
        }
        @Override public boolean isStateful(){return true;}
        @Override protected boolean onStateChange(int[] states) {
            boolean value=false;
            for(int state:states)if(state==android.R.attr.state_selected)value=true;
            if(value==selected)return false;
            update(value);return true;
        }
    }
    private static final class Page implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<View> root;
        ViewTreeObserver observer;
        boolean shown;
        Page(View view){root=new WeakReference<>(view);}
        void attach(View view) {
            if(observer!=null && observer.isAlive())observer.removeOnPreDrawListener(this);
            observer=view.getViewTreeObserver();observer.removeOnPreDrawListener(this);observer.addOnPreDrawListener(this);
        }
        @Override public boolean onPreDraw() {
            View view=root.get();boolean visible=view!=null && view.isShown();
            if(visible)stylePage(view);
            shown=visible;return true;
        }
        @Override public void onViewAttachedToWindow(View view){shown=false;attach(view);}
        @Override public void onViewDetachedFromWindow(View view){
            if(observer!=null && observer.isAlive())observer.removeOnPreDrawListener(this);
            observer=null;shown=false;
        }
    }
}
