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

/** One continuous status/toolbar scrim: a gradient, or on Android 12+ an optional fading blur. */
final class HeaderGradient {
    private final WeakReference<View> root,bar,tools;
    private final WeakReference<Activity> owner;
    private final WeakReference<View> banner;
    private final boolean profile,strict,settings;
    private WeakReference<View> source=new WeakReference<>(null),scrolling=new WeakReference<>(null),statusView=new WeakReference<>(null),progress=new WeakReference<>(null);
    private final WeakHashMap<View,Circle> circles=new WeakHashMap<>();
    private final WeakHashMap<ViewGroup,Padding> paddings=new WeakHashMap<>();
    private final WeakHashMap<ViewGroup,boolean[]> clips=new WeakHashMap<>();
    /** Views beside the bar that clip to their own outline while their parent lets the bar draw below itself. */
    private final WeakHashMap<View,Object[]> outlines=new WeakHashMap<>();
    private final ArrayList<ViewGroup> lists=new ArrayList<>();
    private final int[] location=new int[2],parentLocation=new int[2];
    private String originalBehavior;
    private int originalMargin;
    private Integer bannerMargin;
    private float originalZ,progressTranslation;
    private final Shade shade;
    private final Slice toolbarSlice=new Slice(),statusSlice=new Slice();
    boolean enabled;
    private long lastSignature;
    private WeakReference<View> list=new WeakReference<>(null);
    private static final int CIRCLE_TAG=0x7f5f0004;
    private final boolean glassButtons;
    /** Each toolbar icon sits in a frosted glass circle that blurs what scrolls behind it. */
    private void circleIcons(View toolbar){
        if(!(toolbar instanceof ViewGroup))return;
        View source=list();if(source==null)return;
        ViewGroup bar=(ViewGroup)toolbar;
        // Keep the last circle clear of the screen edge.
        if(bar.getTag(CIRCLE_TAG)==null){
            bar.setTag(CIRCLE_TAG,Boolean.TRUE);
            int edge=Math.round(8*bar.getResources().getDisplayMetrics().density);
            bar.setPaddingRelative(bar.getPaddingStart(),bar.getPaddingTop(),bar.getPaddingEnd()+edge,bar.getPaddingBottom());
        }
        for(int index=0;index<bar.getChildCount();index++){
            View child=bar.getChildAt(index);
            if(child instanceof android.widget.ImageButton)circle(child,source);
            else if(child.getClass().getName().endsWith("ActionMenuView") && child instanceof ViewGroup){
                ViewGroup menu=(ViewGroup)child;
                for(int item=0;item<menu.getChildCount();item++)circle(menu.getChildAt(item),source);
            }
        }
    }
    @android.annotation.TargetApi(31)
    private static void circle(View icon,View source){
        if(icon.getVisibility()!=View.VISIBLE || icon.getTag(CIRCLE_TAG)!=null)return;
        android.content.Context context=icon.getContext();
        float density=context.getResources().getDisplayMetrics().density;int size=Math.round(CIRCLE_DP*density);
        // Narrow icons such as the overflow get a full-width touch area so their circle fits.
        if(icon.getMinimumWidth()<Math.round(48*density)){icon.setMinimumWidth(Math.round(48*density));icon.requestLayout();return;}
        if(icon.getWidth()<size || icon.getHeight()<size)return;
        icon.setTag(CIRCLE_TAG,Boolean.TRUE);
        // The overflow button has uneven side padding, which pushes its dots off the circle's centre.
        if(icon.getPaddingLeft()!=icon.getPaddingRight()){int side=Math.min(icon.getPaddingLeft(),icon.getPaddingRight());icon.setPadding(side,icon.getPaddingTop(),side,icon.getPaddingBottom());}
        FeedPillBlur glass=new FeedPillBlur(source,icon,SurfaceAppearanceTweaks.role(context,false),false,CIRCLE_DP/2f,true,0,1);
        Drawable frame=new Centred(glass,size);
        int ripple=MaterialYouTweaks.color(context,"colorControlHighlight",android.R.attr.colorControlHighlight);
        icon.setBackground(new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf(ripple),frame,new Dot(0xffffffff,size/2f)));
        glass.start();
    }
    /** Circle size in dp, leaving a clear gap between neighbouring icons. */
    private static final int CIRCLE_DP=40;
    /** Keeps the glass a centred square whenever its button is resized, so it never stretches into an oval. */
    @android.annotation.TargetApi(31)
    private static final class Centred extends android.graphics.drawable.DrawableWrapper {
        final int size;
        Centred(Drawable glass,int size){super(glass);this.size=size;}
        @Override protected void onBoundsChange(android.graphics.Rect b){
            Drawable glass=getDrawable();if(glass==null)return;
            int side=Math.min(size,Math.min(b.width(),b.height()));
            int left=b.left+(b.width()-side)/2,top=b.top+(b.height()-side)/2;
            glass.setBounds(left,top,left+side,top+side);
        }
    }
    /** A fixed-size circle, centred, never larger than the view. */
    private static final class Dot extends Drawable {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final float radius;
        Dot(int color,float radius){paint.setColor(color);this.radius=radius;}
        @Override public void draw(Canvas canvas){android.graphics.Rect b=getBounds();canvas.drawCircle(b.exactCenterX(),b.exactCenterY(),Math.min(radius,Math.min(b.width(),b.height())/2f),paint);}
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    /** The RecyclerView that scrolls under the header; its wrappers never move themselves. */
    private View list(){
        View found=list.get();
        if(found!=null && found.isAttachedToWindow())return found;
        View start=scrolling.get();if(start==null)start=source.get();
        found=start==null ? null:findRecycler(start);
        if(found==null)found=start;
        list=new WeakReference<>(found);
        return found;
    }
    private static View findRecycler(View view){
        if(view.getVisibility()==View.VISIBLE && recycler(view))return view;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int index=0;index<group.getChildCount();index++){View found=findRecycler(group.getChildAt(index));if(found!=null)return found;}}
        return null;
    }
    /** Changes when the content under the header scrolls or its first rows change. */
    private long contentSignature(){
        View list=list();
        if(!(list instanceof ViewGroup))return list==null ? 0:list.getScrollY();
        ViewGroup group=(ViewGroup)list;long signature=group.getChildCount();
        for(int index=0;index<Math.min(3,group.getChildCount());index++){
            View child=group.getChildAt(index);
            signature=signature*31+System.identityHashCode(child);signature=signature*31+child.getTop();signature=signature*31+child.getHeight();
        }
        return signature*31+group.getScrollY();
    }

    HeaderGradient(Activity owner,View root,View bar,View tools){
        this.owner=new WeakReference<>(owner);
        this.root=new WeakReference<>(root);
        this.bar=new WeakReference<>(bar);
        this.tools=new WeakReference<>(tools);
        banner=new WeakReference<>(SurfaceAppearanceTweaks.find(root,"header_content"));
        profile=SurfaceAppearanceTweaks.find(root,"user_info_view")!=null;
        strict=owner!=null && SurfaceAppearanceTweaks.extendedChrome(owner.getClass().getName());settings=owner!=null && owner.getClass().getName().endsWith(".SettingsActivityCompat");
        android.content.Context context=owner==null ? tools.getContext():owner;
        int role=SurfaceAppearanceTweaks.role(context,false);
        glassButtons=android.os.Build.VERSION.SDK_INT>=31 && SurfaceSettingsActivity.enabled(context,"header_glass_buttons",false);
        shade=android.os.Build.VERSION.SDK_INT>=31 && SurfaceSettingsActivity.enabled(context,"header_blur",false)
            ? new BlurShade(role,context.getResources().getDisplayMetrics().density):new Shade(role);
    }
    private static final class Circle {final WeakReference<View> icon;final float base;Circle(View view){icon=new WeakReference<>(view);base=view.getTranslationY();}}
    private static final class Padding {final int top;final boolean clip;Padding(ViewGroup view){top=view.getPaddingTop();clip=view.getClipToPadding();}}
    private static class Shade extends Drawable {
        final Paint paint=new Paint();int color;
        Shade(int color){this.color=color&0xffffff;}
        @Override protected void onBoundsChange(android.graphics.Rect bounds){
            if(!bounds.isEmpty())paint.setShader(new LinearGradient(0,0,0,bounds.height(),new int[]{0xf5000000|color,0xe6000000|color,color},new float[]{0,.72f,1},Shader.TileMode.CLAMP));
        }
        @Override public void draw(Canvas canvas){canvas.drawRect(getBounds(),paint);}
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        /** Called when the content under the header may have moved. */
        void contentChanged(){}
        @Override public int getAlpha(){return paint.getAlpha();}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    /**
     * Blurs what scrolls under the header and fades the blur out towards its bottom edge, with a
     * light tint so the title stays readable. The capture is redrawn only when the content moves.
     */
    @android.annotation.TargetApi(31)
    private static final class BlurShade extends Shade {
        private static final int SCALE=3;
        // Progressive blur: each layer is stronger and fades out higher up, so the blur eases off
        // towards the bottom edge. Radii in dp, and where each layer has faded out completely.
        // The blur reaches EXTRA_DP below the top bar and fades out there, so the bar itself stays fully frosted
        // and there is no line where the blur stops. Each layer is opaque until its start and gone by its end.
        private static final float[] RADII={3,7,13,22},STARTS={.78f,.6f,.35f,.15f},ENDS={1f,.9f,.7f,.5f};
        static final int EXTRA_DP=16;
        final android.graphics.RenderNode capture=new android.graphics.RenderNode("ShikifyHeaderCapture");
        final android.graphics.RenderNode[] layers=new android.graphics.RenderNode[RADII.length];
        final Paint[] masks=new Paint[RADII.length];
        final Paint tintPaint=new Paint();
        final int[] location=new int[2];
        WeakReference<View> content=new WeakReference<>(null);
        boolean dirty=true,recording;
        BlurShade(int color,float density){
            super(color);
            for(int index=0;index<RADII.length;index++){
                float radius=RADII[index]*density/SCALE;
                layers[index]=new android.graphics.RenderNode("ShikifyHeaderBlur"+index);
                layers[index].setRenderEffect(android.graphics.RenderEffect.createBlurEffect(radius,radius,Shader.TileMode.CLAMP));
                masks[index]=new Paint();masks[index].setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
            }
        }
        @Override protected void onBoundsChange(android.graphics.Rect bounds){
            if(bounds.isEmpty())return;
            for(int index=0;index<RADII.length;index++){
                float end=ENDS[index],start=STARTS[index];
                masks[index].setShader(new LinearGradient(0,bounds.top,0,bounds.bottom,new int[]{0xff000000,0xff000000,0x00000000,0x00000000},new float[]{0,start,end,1},Shader.TileMode.CLAMP));
            }
            tintPaint.setShader(new LinearGradient(0,bounds.top,0,bounds.bottom,new int[]{0x66000000|color,0x40000000|color,0x26000000|color,0x00000000|color},new float[]{0,.6f,.78f,1},Shader.TileMode.CLAMP));
            dirty=true;
        }
        @Override void contentChanged(){dirty=true;invalidateSelf();}
        @Override public void draw(Canvas canvas){
            if(recording)return;
            View view=content.get();android.graphics.Rect bounds=getBounds();
            if(view==null || view.getWidth()==0 || bounds.isEmpty() || !canvas.isHardwareAccelerated()){super.draw(canvas);return;}
            if(dirty || !layers[0].hasDisplayList()){
                int width=Math.max(1,(int)Math.ceil(bounds.width()/(float)SCALE)),height=Math.max(1,(int)Math.ceil(bounds.height()/(float)SCALE));
                capture.setPosition(0,0,width,height);for(android.graphics.RenderNode layer:layers)layer.setPosition(0,0,width,height);
                android.graphics.RecordingCanvas layer=capture.beginRecording();recording=true;boolean success=false;
                try{
                    layer.drawColor(0xff000000|color);layer.scale(1f/SCALE,1f/SCALE);
                    layer.clipRect(0,0,bounds.width(),bounds.height());
                    view.getLocationInWindow(location);layer.translate(location[0]-bounds.left,location[1]-bounds.top);
                    view.draw(layer);success=true;
                }catch(RuntimeException ignored){
                }finally{capture.endRecording();recording=false;}
                if(!success){super.draw(canvas);return;}
                for(android.graphics.RenderNode node:layers){android.graphics.RecordingCanvas blur=node.beginRecording();blur.drawRenderNode(capture);node.endRecording();}
                dirty=false;
            }
            for(int index=0;index<layers.length;index++){
                float end=bounds.top+bounds.height()*ENDS[index];
                int saved=canvas.saveLayer(bounds.left,bounds.top,bounds.right,end,null);
                int transform=canvas.save();canvas.translate(bounds.left,bounds.top);canvas.scale(SCALE,SCALE);canvas.drawRenderNode(layers[index]);canvas.restoreToCount(transform);
                canvas.drawRect(bounds.left,bounds.top,bounds.right,end,masks[index]);
                canvas.restoreToCount(saved);
            }
            canvas.drawRect(bounds,tintPaint);
        }
    }
    private final class Slice extends Drawable {
        int x,y,extra;
        @Override public void draw(Canvas canvas){int saved=canvas.save();android.graphics.Rect bounds=getBounds();canvas.clipRect(bounds.left,bounds.top,bounds.right,bounds.bottom+extra);canvas.translate(-x,-y);shade.draw(canvas);canvas.restoreToCount(saved);}
        @Override public void setAlpha(int alpha){shade.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private void collect(View view){
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass()){String name=type.getName();
            if(name.equals("androidx.recyclerview.widget.RecyclerView") || name.equals("com.rubenmayayo.reddit.ui.customviews.EmptyStateView")){lists.add((ViewGroup)view);if(name.endsWith("EmptyStateView"))UnifiedChromeTweaks.emptyState((ViewGroup)view);return;}
            if(name.equals("androidx.swiperefreshlayout.widget.SwipeRefreshLayout") && !circles.containsKey(view)){
                Object icon=CommentsChromeTweaks.field(view,"M");
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
        if(type.contains("search.SearchBar"))behavior.getClass().getField("A").setBoolean(behavior,true);
        params.getClass().getMethod("b",Class.forName("androidx.coordinatorlayout.widget.CoordinatorLayout$c",false,loader)).invoke(params,behavior);view.requestLayout();
    }
    /** The status bar shade sits above the window content, including an open drawer. */
    void statusAlpha(float alpha){View surface=statusView.get();if(surface!=null && Math.abs(surface.getAlpha()-alpha)>.01f)surface.setAlpha(alpha);}
    /** The status shade sits above an open drawer, so it stops at the drawer's edge instead of fading out. */
    private int statusEdge=-1;
    private final android.graphics.drawable.ColorDrawable statusScrim=new android.graphics.drawable.ColorDrawable(SCRIM);
    /** DrawerLayout's default scrim; the shade sits above it, so it is dimmed by the same amount. */
    private static final int SCRIM=0x99000000;
    void statusEdge(int edge,float open){
        View surface=statusView.get();if(surface==null || edge==statusEdge)return;
        statusEdge=edge;
        if(surface.getAlpha()!=1)surface.setAlpha(1);
        if(surface.getForeground()!=statusScrim)surface.setForeground(statusScrim);
        statusScrim.setAlpha(Math.round(Math.max(0,Math.min(1,open))*255));
        surface.setClipBounds(edge<=0 ? null:new android.graphics.Rect(edge,0,surface.getWidth(),surface.getHeight()));
    }
    /** Blends a small amount of the given colour into the header surface. */
    void tint(int color){
        // A community colour turns the blur into a flat band, and some people prefer no tint at all.
        View view=tools.get();
        if(shade instanceof BlurShade || view==null || !SurfaceSettingsActivity.enabled(view.getContext(),"subreddit_colours"))return;
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
            // Search screens keep their list in an unnamed container under the app bar.
            Activity activity=owner.get();
            if(content==null && activity!=null && activity.getClass().getName().startsWith("com.rubenmayayo.reddit.ui.search.")){
                View list=SurfaceAppearanceTweaks.find(decor,"recyclerview"),container=list==null ? null:scrolling(list);
                if(container!=null){content=container;source=new WeakReference<>(content);}
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
        if(shade instanceof BlurShade)((BlurShade)shade).content=new WeakReference<>(content);
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
        int bottom=location[1]+toolbar.getHeight(),extra=shade instanceof BlurShade ? Math.round(BlurShade.EXTRA_DP*toolbar.getResources().getDisplayMetrics().density):0,height=Math.max(statusHeight,bottom)+extra;
        if(extra>0){
            // Let the bar draw the blur's fade below itself.
            toolbarSlice.extra=extra;
            View appbar=bar.get();boolean inside=false;View path=toolbar;
            for(android.view.ViewParent up=toolbar.getParent();up instanceof View;up=up.getParent())if(up==appbar){inside=true;break;}
            for(android.view.ViewParent parent=toolbar.getParent();parent instanceof ViewGroup && parent!=decor;path=(View)parent,parent=parent.getParent()){
                ViewGroup group=(ViewGroup)parent;
                if(!clips.containsKey(group))clips.put(group,new boolean[]{group.getClipChildren(),group.getClipToPadding()});
                if(group.getClipChildren())group.setClipChildren(false);
                // A parent that stops clipping also stops clipping the bar's siblings, such as the search
                // screen's collapsed filters, which slide up behind the bar. Clip those to themselves instead.
                if(inside){
                    for(int index=0;index<group.getChildCount();index++){
                        View sibling=group.getChildAt(index);
                        if(sibling==path || outlines.containsKey(sibling))continue;
                        outlines.put(sibling,new Object[]{sibling.getOutlineProvider(),sibling.getClipToOutline()});
                        sibling.setOutlineProvider(android.view.ViewOutlineProvider.BOUNDS);sibling.setClipToOutline(true);
                    }
                    if(group==appbar)inside=false;
                }
            }
        }
        boolean changed=toolbarSlice.x!=location[0] || toolbarSlice.y!=location[1] || shade.getBounds().width()!=decor.getWidth() || shade.getBounds().height()!=height;
        toolbarSlice.x=location[0];
        toolbarSlice.y=location[1];
        shade.setBounds(0,0,decor.getWidth(),height);
        if(changed){
            toolbarSlice.invalidateSelf();
            statusSlice.invalidateSelf();
        }
        if(glassButtons)circleIcons(toolbar);
        if(shade instanceof BlurShade){
            // Capture the scrolling list itself: some screens' containers do not hold it.
            BlurShade blur=(BlurShade)shade;View list=list();
            if(list!=null && blur.content.get()!=list)blur.content=new WeakReference<>(list);
            long signature=contentSignature();
            if(changed || signature!=lastSignature){
                lastSignature=signature;
                shade.contentChanged();toolbarSlice.invalidateSelf();statusSlice.invalidateSelf();
            }
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
        if(strip!=null && child!=null && !(strip.getBackground() instanceof MaterialLoadingDrawable)){
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
            if(parked(swipe,icon))icon.setVisibility(View.INVISIBLE);
        }
    }
    /**
     * The refresh circle normally rests out of sight above the list. The header shift brings that
     * spot on screen, so a circle left behind by an interrupted animation stays visible. Pulling
     * or refreshing makes it visible again.
     */
    private static boolean parked(View swipe,View icon){
        if(icon.getVisibility()!=View.VISIBLE || Boolean.TRUE.equals(CommentsChromeTweaks.field(swipe,"c")))return false;
        android.view.animation.Animation animation=icon.getAnimation();
        if(animation!=null && !animation.hasEnded())return false;
        Object rest=CommentsChromeTweaks.field(swipe,"P");
        return rest instanceof Integer && icon.getTop()<=(Integer)rest;
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
        for(java.util.Map.Entry<View,Object[]> entry:outlines.entrySet()){
            entry.getKey().setOutlineProvider((android.view.ViewOutlineProvider)entry.getValue()[0]);
            entry.getKey().setClipToOutline((Boolean)entry.getValue()[1]);
        }
        outlines.clear();
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
