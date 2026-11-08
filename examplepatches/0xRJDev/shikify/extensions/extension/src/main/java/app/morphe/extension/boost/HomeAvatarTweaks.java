package app.morphe.extension.boost;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Outline;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.LruCache;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewOutlineProvider;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Locale;
import java.util.WeakHashMap;

/** Small owned avatar copies survive Glide resource release and native title-row recreation. */
public final class HomeAvatarTweaks {
    private static final String HOME="_load_front_page_this_is_not_a_subreddit";
    private static final WeakHashMap<View,Header> HEADERS=new WeakHashMap<>();
    private static final WeakHashMap<View,Navigation> NAVIGATION=new WeakHashMap<>();
    private static final WeakHashMap<View,NavigationHost> NAVIGATION_HOSTS=new WeakHashMap<>();
    private static final LruCache<String,Entry> CACHE=new LruCache<>(12);
    private static boolean installed;
    private HomeAvatarTweaks() { }
    public static void install(Object object){
        if(installed || !(object instanceof Application))return;installed=true;
        ((Application)object).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
            @Override public void onActivityResumed(Activity activity){onResume(activity);}
            @Override public void onActivityCreated(Activity activity,Bundle state){}
            @Override public void onActivityPaused(Activity activity){NavigationHost host=NAVIGATION_HOSTS.get(activity.getWindow().getDecorView());if(host!=null)host.stop();}
            @Override public void onActivityDestroyed(Activity activity){
                NavigationHost host=NAVIGATION_HOSTS.remove(activity.getWindow().getDecorView());
                if(host!=null)host.stop();
                for(Header header:new ArrayList<>(HEADERS.values())){
                    View row=header.row.get();
                    if(row!=null && CommentsChromeTweaks.activity(row.getContext())==activity)header.onViewDetachedFromWindow(row);
                }
            }
            @Override public void onActivityStarted(Activity activity){}
            @Override public void onActivityStopped(Activity activity){}
            @Override public void onActivitySaveInstanceState(Activity activity,Bundle state){}
        });
    }
    static void onResume(Activity activity){
        String name=activity.getClass().getName();
        if(!SurfaceAppearanceTweaks.chromeActivity(name))return;
        View root=activity.getWindow().getDecorView();int id=root.getResources().getIdentifier("action_bar_title","id",activity.getPackageName());View title=id==0 ? null:root.findViewById(id);
        navigation(root);
        NavigationHost host=NAVIGATION_HOSTS.get(root);if(host==null){host=new NavigationHost(root);NAVIGATION_HOSTS.put(root,host);}host.start();
        if(title!=null && title.getParent() instanceof RelativeLayout && ((View)title.getParent()).getParent() instanceof RelativeLayout){
            Object model=CommentsChromeTweaks.field(activity,"O");
            if(model!=null)onTitleBind(model,((View)title.getParent()).getParent());
        }
        for(Header header:new ArrayList<>(HEADERS.values())){
            View row=header.row.get();
            if(row!=null && row.isAttachedToWindow() && CommentsChromeTweaks.activity(row.getContext())==activity)header.update();
        }
    }
    static void navigation(View root){
        int id=root.getResources().getIdentifier("item_profile","id",root.getContext().getPackageName());View item=id==0 ? null:root.findViewById(id);
        if(!(item instanceof ViewGroup))return;
        Navigation navigation=NAVIGATION.get(item);
        if(navigation==null){
            ImageView icon=icon(item);
            if(icon==null || !(icon.getParent() instanceof ViewGroup))return;
            navigation=new Navigation(item,icon);
            NAVIGATION.put(item,navigation);
        }
        navigation.header.update();
    }
    private static final class NavigationHost implements ViewTreeObserver.OnGlobalLayoutListener {
        final WeakReference<View> root;final int profileId;WeakReference<ViewTreeObserver> observer;
        NavigationHost(View root){this.root=new WeakReference<>(root);profileId=root.getResources().getIdentifier("item_profile","id",root.getContext().getPackageName());}
        void start(){
            stop();
            View view=root.get();
            if(view==null || profileId==0)return;
            ViewTreeObserver tree=view.getViewTreeObserver();
            tree.addOnGlobalLayoutListener(this);
            observer=new WeakReference<>(tree);
            onGlobalLayout();
        }
        void stop(){ViewTreeObserver tree=observer==null ? null:observer.get();if(tree!=null && tree.isAlive())tree.removeOnGlobalLayoutListener(this);observer=null;}
        @Override public void onGlobalLayout(){
            View view=root.get();
            if(view==null)return;
            View item=view.findViewById(profileId);
            if(!(item instanceof ViewGroup))return;
            Navigation nav=NAVIGATION.get(item);
            if(nav==null)navigation(view);
            else if(!TextUtils.equals(nav.header.username,currentUser(view.getContext())))nav.header.update();
        }
    }
    private static ImageView icon(View view){
        if(view instanceof ImageView)return (ImageView)view;
        if(view instanceof ViewGroup){
            ViewGroup group=(ViewGroup)view;
            for(int index=0;index<group.getChildCount();index++){
                ImageView image=icon(group.getChildAt(index));
                if(image!=null)return image;
            }
        }
        return null;
    }
    /** Keep the native menu item, selection indicator, badge and click listener intact. */
    private static final class Navigation implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener,View.OnLayoutChangeListener {
        final WeakReference<ImageView> nativeIcon;final WeakReference<View> item;
        final Header header;final int profileId;WeakReference<ViewTreeObserver> observer;
        Navigation(View item,ImageView icon){
            this.item=new WeakReference<>(item);
            profileId=item.getId();
            nativeIcon=new WeakReference<>(icon);
            RelativeLayout photo=new RelativeLayout(icon.getContext());
            photo.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            photo.setClickable(false);
            photo.setFocusable(false);
            ViewGroup host=(ViewGroup)icon.getParent();
            host.getOverlay().add(photo);
            header=new Header(photo,null);
            header.home=true;
            HEADERS.put(photo,header);
            item.addOnAttachStateChangeListener(this);
            icon.addOnLayoutChangeListener(this);
            attach();
            icon.setVisibility(View.INVISIBLE);
            position();
        }
        void attach(){
            View view=item.get();
            if(view==null)return;
            ViewTreeObserver tree=view.getViewTreeObserver(),old=observer==null ? null:observer.get();
            if(old==tree)return;
            if(old!=null && old.isAlive())old.removeOnPreDrawListener(this);
            tree.addOnPreDrawListener(this);
            observer=new WeakReference<>(tree);
        }
        void position(){
            ImageView icon=nativeIcon.get();
            View photo=header.row.get();
            if(icon==null || photo==null)return;
            if(photo.isLayoutRequested() || photo.getLeft()!=icon.getLeft() || photo.getTop()!=icon.getTop() || photo.getRight()!=icon.getRight() || photo.getBottom()!=icon.getBottom()){
                photo.measure(View.MeasureSpec.makeMeasureSpec(icon.getWidth(),View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(icon.getHeight(),View.MeasureSpec.EXACTLY));
                photo.layout(icon.getLeft(),icon.getTop(),icon.getRight(),icon.getBottom());
            }
            if(photo.getTranslationX()!=icon.getTranslationX())photo.setTranslationX(icon.getTranslationX());
            if(photo.getTranslationY()!=icon.getTranslationY())photo.setTranslationY(icon.getTranslationY());
        }
        @Override public void onLayoutChange(View view,int left,int top,int right,int bottom,int oldLeft,int oldTop,int oldRight,int oldBottom){position();}
        @Override public boolean onPreDraw(){
            ImageView icon=nativeIcon.get();
            View view=item.get(),photo=header.row.get();
            boolean account=view!=null && view.getId()==profileId;
            int visibility=account ? View.INVISIBLE:View.VISIBLE;
            if(icon!=null && icon.getVisibility()!=visibility)icon.setVisibility(visibility);
            if(photo!=null && photo.getVisibility()!=(account ? View.VISIBLE:View.GONE))photo.setVisibility(account ? View.VISIBLE:View.GONE);
            position();
            return true;
        }
        @Override public void onViewAttachedToWindow(View view){attach();header.update();}
        @Override public void onViewDetachedFromWindow(View view){
            ViewTreeObserver tree=observer==null ? null:observer.get();
            if(tree!=null && tree.isAlive())tree.removeOnPreDrawListener(this);
            observer=null;
        }
    }
    public static void onTitleBind(Object subscription,Object root) {
        if(!(root instanceof RelativeLayout))return;RelativeLayout row=(RelativeLayout)root;
        String name=string(subscription,"a");boolean multi=Boolean.TRUE.equals(CommentsChromeTweaks.field(subscription,"b"));
        boolean home=HOME.equals(name) && !multi;
        boolean community=!multi && !TextUtils.isEmpty(name) && !name.startsWith("_") && !name.equals("all") && !name.equals("popular") && !name.equals("random") && !name.equals("randnsfw") && !name.startsWith("u/");
        Header header=HEADERS.get(row);if(header==null && !home && !community)return;
        if(header==null){if(row.getChildCount()!=1 || !(row.getChildAt(0) instanceof RelativeLayout))return;header=new Header(row,(RelativeLayout)row.getChildAt(0));HEADERS.put(row,header);}
        header.home=home;header.community=community;header.subscription=new WeakReference<>(subscription);header.update();
    }
    static String string(Object value,String name){Object result=CommentsChromeTweaks.field(value,name);return result instanceof String ? (String)result:"";}
    static Object reddit(Context context)throws ReflectiveOperationException{return Class.forName("pd2",false,context.getClassLoader()).getField("r").get(null);}
    static String currentUser(Context context){try{return string(CommentsChromeTweaks.field(reddit(context),"a"),"name");}catch(ReflectiveOperationException | RuntimeException ignored){return "";}}
    static String clean(Context context,String url){
        if(TextUtils.isEmpty(url))return "";
        try{
            Object result=Class.forName("a03",true,context.getClassLoader()).getMethod("a",String.class).invoke(null,url);
            return result instanceof String ? ((String)result).trim():"";
        }catch(ReflectiveOperationException | RuntimeException ignored){
            return url.replace("&amp;","&").trim();
        }
    }
    static String accountUrl(Context context,String username){
        try{Object profile=CommentsChromeTweaks.field(reddit(context),"j");if(profile==null)return "";
            Object name=profile.getClass().getMethod("data",String.class).invoke(profile,"name");
            if(name instanceof String && !TextUtils.isEmpty((String)name) && !username.equalsIgnoreCase((String)name))return "";
            Object subreddit=profile.getClass().getMethod("getSubreddit").invoke(profile);if(subreddit==null)return "";
            Object icon=subreddit.getClass().getMethod("getIconImage").invoke(subreddit);return icon instanceof String ? clean(context,(String)icon):"";
        }catch(ReflectiveOperationException | RuntimeException ignored){return "";}
    }
    static Object manager(Context context)throws ReflectiveOperationException{
        Context app=context.getApplicationContext();Object retriever=Class.forName("com.bumptech.glide.a",true,context.getClassLoader()).getMethod("b",Context.class).invoke(null,app);
        return retriever.getClass().getMethod("c",Context.class).invoke(retriever,app);
    }
    static final class Entry {final String url;final Bitmap bitmap;Entry(String url,Bitmap bitmap){this.url=url;this.bitmap=bitmap;}}
    private static final class Header implements View.OnAttachStateChangeListener,SharedPreferences.OnSharedPreferenceChangeListener {
        final WeakReference<RelativeLayout> row,labels;final WeakReference<AvatarImage> image;
        final SharedPreferences preferences;final int originalStart,originalLeft,originalRight;
        WeakReference<Object> subscription;
        String username="",url="",identity="";boolean home,community,listening,pending;
        Object requestManager;
        int placeholderBackground,placeholderForeground;boolean placeholderReady,placeholderHome;
        Header(RelativeLayout root,RelativeLayout text){
            row=new WeakReference<>(root);
            labels=new WeakReference<>(text);
            RelativeLayout.LayoutParams original=text==null ? new RelativeLayout.LayoutParams(0,0):(RelativeLayout.LayoutParams)text.getLayoutParams();
            originalStart=original.getMarginStart();
            originalLeft=original.leftMargin;
            originalRight=original.rightMargin;
            AvatarImage avatar=new AvatarImage(root.getContext());
            avatar.setId(View.generateViewId());
            RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(text==null ? -1:dp(root,32),text==null ? -1:dp(root,32));
            if(text!=null){
                p.addRule(RelativeLayout.ALIGN_PARENT_START);
                p.addRule(RelativeLayout.CENTER_VERTICAL);
                p.setMarginStart(dp(root,5));
            }
            avatar.setScaleType(ImageView.ScaleType.CENTER_CROP);
            avatar.setOutlineProvider(new ViewOutlineProvider(){@Override public void getOutline(View view,Outline outline){outline.setOval(0,0,view.getWidth(),view.getHeight());}});
            avatar.setClipToOutline(true);
            avatar.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            avatar.setClickable(false);
            avatar.setFocusable(false);
            avatar.setVisibility(View.GONE);
            root.addView(avatar,0,p);
            image=new WeakReference<>(avatar);
            preferences=root.getContext().getSharedPreferences("com.rubenmayayo.reddit.AVATARS",Context.MODE_PRIVATE);root.addOnAttachStateChangeListener(this);
        }
        void cancel(AvatarImage avatar){
            pending=false;
            if(requestManager!=null)try{
                requestManager.getClass().getMethod("o",View.class).invoke(requestManager,avatar);
            }catch(ReflectiveOperationException | RuntimeException ignored){
            }
            requestManager=null;
        }
        void update(){
            RelativeLayout root=row.get(),text=labels.get();AvatarImage avatar=image.get();if(root==null || avatar==null)return;
            Object model=subscription==null ? null:subscription.get();String user=home ? currentUser(root.getContext()):community ? string(model,"a"):"";boolean visible=!TextUtils.isEmpty(user);
            int visibility=visible || text==null ? View.VISIBLE:View.GONE;if(avatar.getVisibility()!=visibility)avatar.setVisibility(visibility);
            if(text!=null){
                RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)text.getLayoutParams();
                int start=originalStart+(visible ? dp(root,44):0);
                if(p.getMarginStart()!=start){
                    p.leftMargin=originalLeft;
                    p.rightMargin=originalRight;
                    p.setMarginStart(start);
                    text.setLayoutParams(p);
                }
            }
            String key=visible ? (home ? "user:":"sub:")+user.toLowerCase(Locale.ROOT):"";
            String next=home && visible ? accountUrl(root.getContext(),user):community ? clean(root.getContext(),string(model,"C")):"";
            if(home && visible && TextUtils.isEmpty(next))next=clean(root.getContext(),preferences.getString(user,""));
            boolean changed=!TextUtils.equals(key,identity);if(changed){cancel(avatar);avatar.retained=null;identity=key;}
            username=user;Entry entry=CACHE.get(key);if(TextUtils.isEmpty(next) && entry!=null)next=entry.url;
            boolean newUrl=!TextUtils.equals(next,url);if(newUrl){cancel(avatar);url=next;}
            avatar.identity=key;avatar.url=url;
            if(entry!=null && TextUtils.equals(entry.url,url))avatar.show(entry.bitmap);
            placeholder(avatar);
            if(root.isAttachedToWindow() && !listening){preferences.registerOnSharedPreferenceChangeListener(this);listening=true;}
            if(!visible || TextUtils.isEmpty(url) || pending || (entry!=null && TextUtils.equals(entry.url,url)))return;
            try{requestManager=manager(root.getContext());requestManager.getClass().getMethod("o",View.class).invoke(requestManager,avatar);
                Object request=requestManager.getClass().getMethod("v",String.class).invoke(requestManager,url);
                request=request.getClass().getMethod("Z").invoke(request);
                request=request.getClass().getMethod("e0",int.class,int.class).invoke(request,dp(root,32),dp(root,32));
                Class<?> listener=Class.forName("gg2",true,root.getContext().getClassLoader());WeakReference<Header> weak=new WeakReference<>(this);String requestedIdentity=identity,requestedUrl=url;
                Object callback=Proxy.newProxyInstance(listener.getClassLoader(),new Class<?>[]{listener},(proxy,method,args)->{Header header=weak.get();if(method.getDeclaringClass()==Object.class){if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);if(method.getName().equals("equals"))return proxy==args[0];return "Shikify avatar listener";}if(header!=null && requestedIdentity.equals(header.identity) && requestedUrl.equals(header.url)){header.pending=false;if(method.getName().equals("a") && args!=null && args.length==1){AvatarImage image=header.image.get();if(image!=null)image.acceptResource(args[0]);}}return null;});
                request=request.getClass().getMethod("J",listener).invoke(request,callback);pending=true;request.getClass().getMethod("P",ImageView.class).invoke(request,avatar);
            }catch(ReflectiveOperationException | RuntimeException error){pending=false;}
        }
        void placeholder(AvatarImage avatar){
            // Toolbar overlays may expose light palette roles in a dark Activity.
            Context context=avatar.getContext();Activity activity=CommentsChromeTweaks.activity(context);if(activity!=null)context=activity;
            int background=SurfaceAppearanceTweaks.role(context,false),foreground=SurfaceAppearanceTweaks.foreground(context,false);
            if(!placeholderReady || placeholderBackground!=background || placeholderForeground!=foreground || placeholderHome!=home){
                placeholderReady=true;placeholderBackground=background;placeholderForeground=foreground;placeholderHome=home;
                GradientDrawable shape=new GradientDrawable();shape.setShape(GradientDrawable.OVAL);shape.setColor(background);avatar.setBackground(shape);
                int id=avatar.getResources().getIdentifier(home ? "ic_person_18dp":"ic_subreddit_80dp","drawable",avatar.getContext().getPackageName());
                if(id!=0){Drawable glyph=avatar.getContext().getDrawable(id).mutate();glyph.setTint(foreground);avatar.fallback=new android.graphics.drawable.InsetDrawable(glyph,dp(avatar,6));}
            }
            avatar.setImageDrawable(null);
        }
        @Override public void onViewAttachedToWindow(View view){if(!listening){preferences.registerOnSharedPreferenceChangeListener(this);listening=true;}update();}
        @Override public void onViewDetachedFromWindow(View view){
            if(listening){
                preferences.unregisterOnSharedPreferenceChangeListener(this);
                listening=false;
            }
            AvatarImage avatar=image.get();
            if(avatar!=null)cancel(avatar);
        }
        @Override public void onSharedPreferenceChanged(SharedPreferences prefs,String key){if(key==null || TextUtils.equals(key,username))update();}
    }
    private static final class AvatarImage extends ImageView {
        Drawable fallback,retained;String identity="",url="";Bitmap owned;
        AvatarImage(Context context){super(context);}
        void show(Bitmap bitmap){
            if(owned==bitmap && retained!=null){
                super.setImageDrawable(retained);
                return;
            }
            owned=bitmap;
            retained=new AvatarDrawable(getResources(),bitmap);
            super.setImageDrawable(retained);
        }
        // Other enabled toolbar patches tint every ImageView. Photos must retain
        // their pixels while ordinary toolbar icons keep native colour handling.
        @Override public void setColorFilter(android.graphics.ColorFilter filter){super.setColorFilter((android.graphics.ColorFilter)null);}
        @Override public void setImageTintList(android.content.res.ColorStateList tint){super.setImageTintList(null);}
        @Override public void setImageDrawable(Drawable value){super.setImageDrawable(retained!=null ? retained:fallback);}
        void acceptResource(Object resource){
            Drawable value=resource instanceof Bitmap ? new BitmapDrawable(getResources(),(Bitmap)resource):resource instanceof Drawable ? (Drawable)resource:null;
            if(value instanceof BitmapDrawable || value instanceof android.graphics.drawable.Animatable){
                try{int size=dp(this,32);Bitmap copy=Bitmap.createBitmap(size,size,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(copy);
                    if(value instanceof BitmapDrawable){
                        Bitmap source=((BitmapDrawable)value).getBitmap();
                        Bitmap software=android.os.Build.VERSION.SDK_INT>=26 && source.getConfig()==Bitmap.Config.HARDWARE ? source.copy(Bitmap.Config.ARGB_8888,false):source;
                        canvas.drawBitmap(software,null,new android.graphics.Rect(0,0,size,size),new android.graphics.Paint(3));
                        if(software!=source)software.recycle();
                    }
                    else{android.graphics.Rect old=new android.graphics.Rect(value.getBounds());value.setBounds(0,0,size,size);value.draw(canvas);value.setBounds(old);}
                    if(!TextUtils.isEmpty(identity))CACHE.put(identity,new Entry(url,copy));show(copy);return;
                }catch(RuntimeException ignored){}
            }
        }
    }
    private static final class AvatarDrawable extends BitmapDrawable {
        AvatarDrawable(android.content.res.Resources resources,Bitmap bitmap){super(resources,bitmap);}
        @Override public void setTint(int color){}
        @Override public void setTintList(android.content.res.ColorStateList tint){}
        @Override public void setColorFilter(android.graphics.ColorFilter filter){}
    }
    static void compactAvatar(View title,boolean visible){
        for(View parent=title;parent!=null;parent=parent.getParent() instanceof View ? (View)parent.getParent():null){
            Header header=HEADERS.get(parent);
            if(header!=null){
                AvatarImage image=header.image.get();
                if(image!=null && header.community){
                    float alpha=visible ? 1:0;
                    if(image.getAlpha()!=alpha)image.setAlpha(alpha);
                }
                return;
            }
        }
    }
    private static int dp(View view,int value){return Math.round(value*view.getResources().getDisplayMetrics().density);}
}
