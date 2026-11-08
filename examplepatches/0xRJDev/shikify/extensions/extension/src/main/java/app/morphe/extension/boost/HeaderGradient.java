package app.morphe.extension.boost;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** One continuous status/toolbar scrim. No backdrop capture, blur or refraction. */
final class HeaderGradient {
    private final WeakReference<View> root,bar,tools;
    private final WeakReference<Activity> owner;
    private final WeakReference<View> banner;
    private final boolean profile,strict,settings;
    private WeakReference<View> source=new WeakReference<>(null),scrolling=new WeakReference<>(null),statusView=new WeakReference<>(null),progress=new WeakReference<>(null);
    private final WeakHashMap<View,Circle> circles=new WeakHashMap<>();
    private final WeakHashMap<ViewGroup,Padding> paddings=new WeakHashMap<>();
    private final WeakHashMap<ViewGroup,boolean[]> clips=new WeakHashMap<>();
    private final ArrayList<ViewGroup> lists=new ArrayList<>();
    private final int[] location=new int[2],parentLocation=new int[2];
    private String originalBehavior;
    private int originalMargin;
    private Integer bannerMargin;
    private float originalZ,progressTranslation;
    private final Shade shade;
    private final Slice toolbarSlice=new Slice(),statusSlice=new Slice();
    boolean enabled;

    HeaderGradient(Activity owner,View root,View bar,View tools){
        this.owner=new WeakReference<>(owner);
        this.root=new WeakReference<>(root);
        this.bar=new WeakReference<>(bar);
        this.tools=new WeakReference<>(tools);
        banner=new WeakReference<>(SurfaceAppearanceTweaks.find(root,"header_content"));
        profile=SurfaceAppearanceTweaks.find(root,"user_info_view")!=null;
        strict=owner!=null && SurfaceAppearanceTweaks.extendedChrome(owner.getClass().getName());settings=owner!=null && owner.getClass().getName().endsWith(".SettingsActivityCompat");
        shade=new Shade(SurfaceAppearanceTweaks.role(owner==null ? tools.getContext():owner,false));
    }
    private static final class Circle {final WeakReference<View> icon;final float base;Circle(View view){icon=new WeakReference<>(view);base=view.getTranslationY();}}
    private static final class Padding {final int top;final boolean clip;Padding(ViewGroup view){top=view.getPaddingTop();clip=view.getClipToPadding();}}
    private static final class Shade extends Drawable {
        final Paint paint=new Paint();int color;
        Shade(int color){this.color=color&0xffffff;}
        @Override protected void onBoundsChange(android.graphics.Rect bounds){
            if(!bounds.isEmpty())paint.setShader(new LinearGradient(0,0,0,bounds.height(),new int[]{0xf5000000|color,0xe6000000|color,color},new float[]{0,.72f,1},Shader.TileMode.CLAMP));
        }
        @Override public void draw(Canvas canvas){canvas.drawRect(getBounds(),paint);}
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        @Override public int getAlpha(){return paint.getAlpha();}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private final class Slice extends Drawable {
        int x,y;
        @Override public void draw(Canvas canvas){int saved=canvas.save();canvas.clipRect(getBounds());canvas.translate(-x,-y);shade.draw(canvas);canvas.restoreToCount(saved);}
        @Override public void setAlpha(int alpha){shade.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private void collect(View view){
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass()){String name=type.getName();
            if(name.equals("androidx.recyclerview.widget.RecyclerView") || name.equals("com.rubenmayayo.reddit.ui.customviews.EmptyStateView")){lists.add((ViewGroup)view);if(name.endsWith("EmptyStateView"))UnifiedChromeTweaks.emptyState((ViewGroup)view);return;}
            if(name.equals("androidx.swiperefreshlayout.widget.SwipeRefreshLayout") && !circles.containsKey(view)){
                Object icon=CommentsChromeTweaks.field(view,"N");
                if(icon instanceof View)circles.put(view,new Circle((View)icon));
            }
        }
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int index=0;index<group.getChildCount();index++)collect(group.getChildAt(index));}
    }
    /** RecyclerView keeps its scroll anchor when padding changes, leaving row 0 under the header. */
    private static boolean recycler(View view){
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("androidx.recyclerview.widget.RecyclerView"))return true;
        return false;
    }
    /** Only a list can inset its own content; forms, articles and web pages would hide under the header. */
    private static boolean overlaps(View view){
        if(view instanceof android.widget.ScrollView || view instanceof android.webkit.WebView)return false;
        if(recycler(view))return true;
        if(view.getClass().getName().endsWith("NestedScrollView") || !(view instanceof ViewGroup))return false;
        ViewGroup group=(ViewGroup)view;for(int index=0;index<group.getChildCount();index++)if(overlaps(group.getChildAt(index)))return true;
        return false;
    }
    private View scrolling(View source){
        for(View current=source;current!=null;current=current.getParent() instanceof View ? (View)current.getParent():null){
            Object behavior=CommentsChromeTweaks.field(current.getLayoutParams(),"a");
            if(behavior!=null && (behavior.getClass().getName().equals("com.google.android.material.appbar.AppBarLayout$ScrollingViewBehavior") || behavior.getClass().getName().equals("com.google.android.material.search.SearchBar$ScrollingViewBehavior")))return current;
        }
        return null;
    }
    private void behavior(View view,String type)throws ReflectiveOperationException {
        Object params=view.getLayoutParams();ClassLoader loader=view.getContext().getClassLoader();Object behavior=Class.forName(type,true,loader).getConstructor().newInstance();
        if(type.contains("search.SearchBar"))behavior.getClass().getField("B").setBoolean(behavior,true);
        params.getClass().getMethod("b",Class.forName("androidx.coordinatorlayout.widget.CoordinatorLayout$c",false,loader)).invoke(params,behavior);view.requestLayout();
    }
    /** The status bar shade sits above the window content, including an open drawer. */
    void statusAlpha(float alpha){View surface=statusView.get();if(surface!=null && Math.abs(surface.getAlpha()-alpha)>.01f)surface.setAlpha(alpha);}
    /** Blends a small amount of the given colour into the header surface. */
    void tint(int color){
        int base=shade.color,red=mix(android.graphics.Color.red(base),android.graphics.Color.red(color)),green=mix(android.graphics.Color.green(base),android.graphics.Color.green(color)),blue=mix(android.graphics.Color.blue(base),android.graphics.Color.blue(color));
        shade.color=(red<<16)|(green<<8)|blue;shade.onBoundsChange(shade.getBounds());toolbarSlice.invalidateSelf();statusSlice.invalidateSelf();
    }
    private static int mix(int base,int color){return Math.round(base+(color-base)*.14f);}
    void update(int statusHeight){
        View decor=root.get(),appbar=bar.get(),toolbar=tools.get();if(decor==null || appbar==null || toolbar==null || toolbar.getHeight()==0)return;
        View content=source.get();
        if(content==null){
            for(String name:new String[]{"fragment_container","container"}){
                View candidate=SurfaceAppearanceTweaks.find(decor,name);
                if(candidate!=null && scrolling(candidate)!=null){
                    content=candidate;
                    source=new WeakReference<>(content);
                    break;
                }
            }
        }
        if(content!=null){View child=scrolling.get();if(child==null){child=strict && (settings || !overlaps(content)) ? null:scrolling(content);if(child!=null){
            if(!profile)try{
                Object current=CommentsChromeTweaks.field(child.getLayoutParams(),"a");
                originalBehavior=current.getClass().getName();
                originalMargin=((ViewGroup.MarginLayoutParams)child.getLayoutParams()).topMargin;
                originalZ=appbar.getTranslationZ();
                behavior(child,"com.google.android.material.search.SearchBar$ScrollingViewBehavior");
            }catch(ReflectiveOperationException | RuntimeException error){
                return;
            }
            scrolling=new WeakReference<>(child);
        }}
            if(!profile && child!=null){
                ((View)child.getParent()).getLocationInWindow(parentLocation);
                int extra=Math.max(0,parentLocation[1]);
                ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)child.getLayoutParams();
                if(params.topMargin!=originalMargin-extra){
                    params.topMargin=originalMargin-extra;
                    child.setLayoutParams(params);
                }
                lists.clear();
                collect(content);
                int inset=appbar.getMeasuredHeight()+extra;
                for(ViewGroup list:lists){
                    Padding old=paddings.get(list);
                    if(old==null){
                        old=new Padding(list);
                        paddings.put(list,old);
                    }
                    int top=old.top+inset;
                    if(list.getPaddingTop()!=top){
                        int shift=top-list.getPaddingTop();
                        boolean atStart=shift>0 && recycler(list) && list.getChildCount()>0 && !list.canScrollVertically(-1);
                        list.setPadding(list.getPaddingLeft(),top,list.getPaddingRight(),list.getPaddingBottom());
                        if(atStart)list.scrollBy(0,-shift);
                    }
                    list.setClipToPadding(false);
                }
                lists.clear();
                for(View ancestor=content;ancestor!=null;ancestor=ancestor.getParent() instanceof View ? (View)ancestor.getParent():null){
                    if(ancestor instanceof ViewGroup){
                        ViewGroup group=(ViewGroup)ancestor;
                        if(!clips.containsKey(group))clips.put(group,new boolean[]{group.getClipChildren(),group.getClipToPadding()});
                        group.setClipChildren(false);
                        group.setClipToPadding(false);
                    }
                    if(ancestor==decor)break;
                }
                appbar.setTranslationZ(Math.max(originalZ,8*toolbar.getResources().getDisplayMetrics().density));
            }
            if(child!=null && progress.get()==null){
                View strip=SurfaceAppearanceTweaks.find(child,"progress_smooth");
                if(strip!=null){
                    progress=new WeakReference<>(strip);
                    progressTranslation=strip.getTranslationY();
                }
            }
            if(profile || child==null){lists.clear();collect(content);lists.clear();}
        }
        appbar.setBackground(null);
        View collapse=SurfaceAppearanceTweaks.find(decor,"collapsing_toolbar");
        if(collapse!=null){
            collapse.setBackground(null);
            clearScrim(collapse,"getContentScrim","setContentScrimColor");
            clearScrim(collapse,"getStatusBarScrim","setStatusBarScrimColor");
        }
        View oldGradient=SurfaceAppearanceTweaks.find(decor,"toolbar_gradient");
        if(oldGradient!=null)oldGradient.setBackground(null);
        View header=banner.get();
        if(header!=null && header.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
            ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)header.getLayoutParams();
            if(bannerMargin==null)bannerMargin=params.topMargin;
            if(params.topMargin!=bannerMargin+statusHeight){
                params.topMargin=bannerMargin+statusHeight;
                header.setLayoutParams(params);
            }
        }
        enabled=true;position(statusHeight);
    }
    void position(int statusHeight){
        if(!enabled)return;View decor=root.get(),toolbar=tools.get();if(decor==null || toolbar==null)return;
        if(shade.getAlpha()!=255){shade.setAlpha(255);toolbarSlice.invalidateSelf();statusSlice.invalidateSelf();}
        View surface=statusView.get();
        if(surface==null && decor instanceof FrameLayout){
            surface=new View(toolbar.getContext());
            surface.setTag("app.shikify.header.status");
            surface.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            surface.setTranslationZ(1000);
            ((FrameLayout)decor).addView(surface,new FrameLayout.LayoutParams(-1,statusHeight,android.view.Gravity.TOP));
            surface.setBackground(statusSlice);
            statusView=new WeakReference<>(surface);
        }
        if(toolbar.getBackground()!=toolbarSlice)toolbar.setBackground(toolbarSlice);
        if(surface!=null){
            surface.setVisibility(View.VISIBLE);
            if(surface.getLayoutParams().height!=statusHeight){
                ViewGroup.LayoutParams params=surface.getLayoutParams();
                params.height=statusHeight;
                surface.setLayoutParams(params);
            }
        }
        toolbar.getLocationInWindow(location);
        int bottom=location[1]+toolbar.getHeight(),height=Math.max(statusHeight,bottom);
        boolean changed=toolbarSlice.x!=location[0] || toolbarSlice.y!=location[1] || shade.getBounds().width()!=decor.getWidth() || shade.getBounds().height()!=height;
        toolbarSlice.x=location[0];
        toolbarSlice.y=location[1];
        shade.setBounds(0,0,decor.getWidth(),height);
        if(changed){
            toolbarSlice.invalidateSelf();
            statusSlice.invalidateSelf();
        }
        View child=scrolling.get(),strip=progress.get(),appbar=bar.get();
        int contentTop=bottom;
        if(appbar!=null){
            appbar.getLocationInWindow(parentLocation);
            contentTop=Math.max(contentTop,parentLocation[1]+appbar.getHeight());
        }
        if(child!=null){
            child.getLocationInWindow(parentLocation);
            contentTop=Math.max(contentTop,parentLocation[1]);
        }
        if(strip!=null && child!=null){
            child.getLocationInWindow(parentLocation);
            float top=relativeTop(strip,child);
            if(!Float.isNaN(top)){
                float translation=contentTop-parentLocation[1]-top;
                if(Math.abs(strip.getTranslationY()-translation)>.5f)strip.setTranslationY(translation);
            }
        }
        for(java.util.Map.Entry<View,Circle> entry:circles.entrySet()){
            View swipe=entry.getKey(),icon=entry.getValue().icon.get();
            if(swipe==null || icon==null)continue;
            swipe.getLocationInWindow(parentLocation);
            float translation=entry.getValue().base+Math.max(0,contentTop-parentLocation[1]);
            if(Math.abs(icon.getTranslationY()-translation)>.5f)icon.setTranslationY(translation);
        }
    }
    private static void clearScrim(View view,String getter,String setter){
        try{
            Object drawable=view.getClass().getMethod(getter).invoke(view);
            if(drawable==null || drawable instanceof android.graphics.drawable.ColorDrawable && ((android.graphics.drawable.ColorDrawable)drawable).getColor()==0)return;
            view.getClass().getMethod(setter,int.class).invoke(view,0);
        }catch(ReflectiveOperationException ignored){
        }
    }
    private static float relativeTop(View view,View ancestor){
        float top=view.getTop();
        View parent=view.getParent() instanceof View ? (View)view.getParent():null;
        while(parent!=null && parent!=ancestor){
            top+=parent.getTop()+parent.getTranslationY()-parent.getScrollY();
            parent=parent.getParent() instanceof View ? (View)parent.getParent():null;
        }
        return parent==ancestor ? top-ancestor.getScrollY():Float.NaN;
    }
    void dispose(){
        enabled=false;
        View header=banner.get();
        if(header!=null && bannerMargin!=null && header.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
            ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)header.getLayoutParams();
            params.topMargin=bannerMargin;
            header.setLayoutParams(params);
        }
        View child=scrolling.get(),appbar=bar.get();
        if(child!=null && originalBehavior!=null)try{
            behavior(child,originalBehavior);
            ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)child.getLayoutParams();
            params.topMargin=originalMargin;
            child.setLayoutParams(params);
            if(appbar!=null)appbar.setTranslationZ(originalZ);
        }catch(ReflectiveOperationException | RuntimeException error){
        }
        for(java.util.Map.Entry<ViewGroup,Padding> entry:paddings.entrySet()){
            ViewGroup list=entry.getKey();
            Padding old=entry.getValue();
            list.setPadding(list.getPaddingLeft(),old.top,list.getPaddingRight(),list.getPaddingBottom());
            list.setClipToPadding(old.clip);
        }
        paddings.clear();
        for(java.util.Map.Entry<ViewGroup,boolean[]> entry:clips.entrySet()){
            entry.getKey().setClipChildren(entry.getValue()[0]);
            entry.getKey().setClipToPadding(entry.getValue()[1]);
        }
        clips.clear();
        lists.clear();
        View strip=progress.get();
        if(strip!=null)strip.setTranslationY(progressTranslation);
        for(Circle entry:circles.values()){
            View icon=entry.icon.get();
            if(icon!=null)icon.setTranslationY(entry.base);
        }
        circles.clear();
        View surface=statusView.get();
        if(surface!=null && surface.getParent() instanceof ViewGroup)((ViewGroup)surface.getParent()).removeView(surface);
    }
}
