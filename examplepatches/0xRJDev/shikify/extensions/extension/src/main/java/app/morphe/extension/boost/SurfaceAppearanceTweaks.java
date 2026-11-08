package app.morphe.extension.boost;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.WeakHashMap;

/** Translucent native media windows with a compositor-backed underlying page.
 * No screenshot backdrop, cross-window blur or replacement input targets. */
public final class SurfaceAppearanceTweaks {
    static final String STYLE="shikify_surface_treatment",OPACITY="shikify_dim_opacity";
    private static boolean installed;
    private static WeakReference<Activity> resumed=new WeakReference<>(null);
    static Activity current(){return resumed.get();}
    static java.lang.ref.WeakReference<Activity> settingsThemeOwner=new java.lang.ref.WeakReference<>(null);
    private static final WeakHashMap<Activity,Screen> SCREENS=new WeakHashMap<>();
    private SurfaceAppearanceTweaks() { }
    static Drawable pillBackground(Context context,int color,int radiusDp){
        android.graphics.drawable.GradientDrawable shape=new android.graphics.drawable.GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(radiusDp*context.getResources().getDisplayMetrics().density);
        return shape;
    }
    /** Compatibility hook: Boost owns the media theme again. */
    public static void onThemeReady(Object instance) { }
    public static void styleMediaControls(View panel){
        if(installed){if(String.valueOf(panel.getTag()).endsWith(".video"))panel.setBackground(null);
            else panel.setBackground(mediaPanel(panel.getContext(),role(panel.getContext(),true)));}
    }
    static Drawable mediaPanel(Context context,int color){
        android.graphics.drawable.GradientDrawable background=new android.graphics.drawable.GradientDrawable();
        float radius=24*context.getResources().getDisplayMetrics().density;
        background.setColor(color);background.setCornerRadii(new float[]{radius,radius,radius,radius,0,0,0,0});return background;
    }
    public static void styleMediaFragment(Object fragment) { }
    public static void install(Object instance) {
        if(installed || !(instance instanceof Application))return;
        installed=true;((Application)instance).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
            @Override public void onActivityCreated(Activity activity,Bundle state){attach(activity);}
            @Override public void onActivityResumed(Activity activity){
                resumed=new WeakReference<>(activity);
                Screen screen=attach(activity);
                if(screen!=null)screen.resume();
                else if(media(activity)){
                    GalleryBottomActionsTweaks.onGridResume(activity);
                    GalleryBottomActionsTweaks.glassSurfaces(activity.getWindow().getDecorView(),true,SurfaceSettingsActivity.enabled(activity,"feed_pill_blur"));
                }
            }
            @Override public void onActivityPaused(Activity activity){
                if(resumed.get()==activity)resumed.clear();
                if(!(activity instanceof SurfaceSettingsActivity) && !media(activity)){
                    settingsThemeOwner=new java.lang.ref.WeakReference<>(activity);
                    SurfaceSettingsActivity.prefs(activity).edit().putBoolean("shikify_settings_dark",dark(activity)).apply();
                }
                Screen screen=SCREENS.get(activity);
                if(screen!=null)screen.pause();
                else if(media(activity))GalleryBottomActionsTweaks.glassSurfaces(activity.getWindow().getDecorView(),false,false);
            }
            @Override public void onActivityDestroyed(Activity activity){Screen screen=SCREENS.remove(activity);if(screen!=null)screen.dispose();}
            @Override public void onActivityStarted(Activity activity) { }
            @Override public void onActivityStopped(Activity activity) { }
            @Override public void onActivitySaveInstanceState(Activity activity,Bundle state) { }
        });
    }
    static boolean gallery(Object object){
        for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("com.rubenmayayo.reddit.ui.activities.GalleryActivity"))return true;
        return false;
    }
    static boolean media(Activity activity){
        String name=activity.getClass().getName();
        return name.equals("com.rubenmayayo.reddit.ui.activities.MediaImageActivity") || name.equals("com.rubenmayayo.reddit.ui.activities.MediaVideoActivity") || name.equals(GalleryBottomActionsTweaks.GRID) || gallery(activity);
    }
    static Screen attach(Activity activity) {
        String name=activity.getClass().getName();boolean media=media(activity);
        if(media || !chromeActivity(name))return null;
        Screen screen=SCREENS.get(activity);if(screen==null){screen=new Screen(activity,media);SCREENS.put(activity,screen);}return screen;
    }
    static boolean chromeActivity(String name){
        return name.equals("com.rubenmayayo.reddit.ui.submissions.subreddit.MainActivity") || name.equals("com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditActivity") || name.equals("com.rubenmayayo.reddit.ui.comments.CommentsActivity") || extraChrome(name);
    }
    static boolean extraChrome(String name){
        return name.equals("com.rubenmayayo.reddit.ui.messages.MessagesActivity") || name.equals("com.rubenmayayo.reddit.ui.messages.thread.ThreadActivity") || name.equals("com.rubenmayayo.reddit.ui.compose.ReplyActivity") || name.equals("com.rubenmayayo.reddit.ui.profile.UserActivity") || name.equals("com.rubenmayayo.reddit.ui.search.SearchGenericActivity") || name.equals("com.rubenmayayo.reddit.ui.search.GoToGenericActivity") || name.equals("com.rubenmayayo.reddit.ui.search.PickSubredditActivity") || name.equals("com.rubenmayayo.reddit.ui.search.MultiPickSubredditActivity") || name.equals("com.rubenmayayo.reddit.ui.subscriptions.SubscriptionsActivity") || name.equals("com.rubenmayayo.reddit.ui.submissions.search.SearchSubmissionsActivity") || extendedChrome(name);
    }
    /** Standard toolbar screens. Their content is not always a list, so see HeaderGradient.overlaps. */
    private static final java.util.Set<String> EXTENDED=new java.util.HashSet<>(java.util.Arrays.asList(
        "SidebarActivity","WikiActivity","MultiredditActivity","ModerationActivity","SubmitActivity","SubmitGenericActivity",
        "SubmitCrosspostActivity","ManageDraftsActivity","ManageUploadsActivity","ImportantUsersActivity","AppIconActivity",
        "BackupActivity","FolderActivity","FolderSAFActivity","SearchSubredditActivity","SettingsSearchActivity",
        "SavedSortsActivity","SavedViewsActivity","LicensesActivity","WebViewActivity","SettingsActivityCompat"));
    static boolean extendedChrome(String name){return EXTENDED.contains(name.substring(name.lastIndexOf('.')+1));}
    /** The existing Back guard owns registration, so native drawers/controllers and IME
     * keep priority. Return Object to keep API34 classes isolated on older Android. */
    static void stopOverlayBack(Object callback){if(Build.VERSION.SDK_INT>=34 && callback instanceof SurfaceMediaBack)((SurfaceMediaBack)callback).pause();}
    static Object overlayBack(Activity activity){
        // Opaque native media windows use the platform transition; no content animator.
        return null;
    }
    static View find(View root,String name){int id=Ids.view(root,name);return id==0 ? null:root.findViewById(id);}
    static View view(Object object,String field){Object result=CommentsChromeTweaks.field(object,field);return result instanceof View ? (View)result:null;}
    static int number(SharedPreferences prefs,String key,int fallback,int min,int max){
        try{
            return Math.max(min,Math.min(max,Integer.parseInt(prefs.getString(key,String.valueOf(fallback)))));
        }catch(RuntimeException ignored){
            return fallback;
        }
    }
    static boolean dark(Context context){
        int color=MaterialYouTweaks.color(context,"ContentBackground",android.R.attr.colorBackground);
        return Color.red(color)*299+Color.green(color)*587+Color.blue(color)*114<128000;
    }
    static int role(Context context,boolean media){
        boolean night=media || dark(context);
        if(Build.VERSION.SDK_INT>=31){
            int token=context.getResources().getIdentifier("m3_sys_color_dynamic_"+(night ? "dark":"light")+"_surface_container_low","color",context.getPackageName());
            if(token!=0)return context.getColor(token);
        }
        return media ? Color.rgb(28,29,31):MaterialYouTweaks.color(context,"ContentBackground",android.R.attr.colorBackground);
    }
    static int foreground(Context context,boolean media){
        boolean night=media || dark(context);int token=context.getResources().getIdentifier("m3_sys_color_dynamic_"+(night ? "dark":"light")+"_on_surface","color",context.getPackageName());
        return Build.VERSION.SDK_INT>=31 && token!=0 ? context.getColor(token):night ? 0xffe5e5e5:0xff202020;
    }
    static int tint(int color,int percent){return (Math.round(255*percent/100f)<<24)|(color&0xffffff);}
    static void toolbar(View bar,int text){
        if(bar instanceof androidx.appcompat.widget.Toolbar){
            androidx.appcompat.widget.Toolbar toolbar=(androidx.appcompat.widget.Toolbar)bar;
            toolbar.setTitleTextColor(text);
            toolbar.setSubtitleTextColor(tint(text,80));
            Drawable arrow=toolbar.getNavigationIcon();
            if(arrow!=null)arrow.mutate().setTint(text);
            Drawable overflow=toolbar.getOverflowIcon();
            if(overflow!=null)overflow.mutate().setTint(text);
        }
    }
    static final class Screen implements ViewTreeObserver.OnGlobalLayoutListener,ViewTreeObserver.OnPreDrawListener {
        final WeakReference<Activity> owner;
        final WeakReference<View> decor;
        final SharedPreferences preferences;
        final boolean media;
        final ArrayList<Layer> layers=new ArrayList<>();
        WeakReference<ViewTreeObserver> observer;
        WeakReference<View> appBar,bottom,protection,toolbar;
        Drawable status,navigation;
        Backdrop backdrop;
        Object back,collapseListener;
        java.lang.reflect.Field compactFlag;
        WeakReference<View> headerContent,compactTitle;
        ColorDrawable titleSurface;
        Drawable expandedSurface;
        Drawable nativePlaybackBackground;
        boolean nativePlayback;
        Drawable feedPill;
        FeedPillBlur feedBlur;
        HeaderGradient headerGradient;
        UnifiedChromeTweaks.Screen unifiedChrome;
        UnifiedChromeTweaks.MediaTop mediaTop;
        UnifiedChromeTweaks.Corner corner;
        UnifiedChromeTweaks.Drawer drawer;
        FeedPillBlur arrowBlur;
        boolean arrowsStyled;
        int iconAttempts;
        WeakReference<View> legacyStatus;
        int statusHeight;
        boolean feedBlurEnabled;
        int titleColor;
        String appliedStyle;
        int appliedOpacity=-1;
        boolean active,prepared,disposed,tinted;
        int tintAttempts;
        Screen(Activity activity,boolean media){
            owner=new WeakReference<>(activity);
            decor=new WeakReference<>(activity.getWindow().getDecorView());
            preferences=PreferenceManager.getDefaultSharedPreferences(activity);
            this.media=media;
        }
        void resume(){
            View root=decor.get();
            if(root==null)return;
            pause();
            active=true;
            if(Build.VERSION.SDK_INT>=34 && back!=null)((SurfaceMediaBack)back).resume();
            ViewTreeObserver tree=root.getViewTreeObserver();
            tree.addOnGlobalLayoutListener(this);
            tree.addOnPreDrawListener(this);
            observer=new WeakReference<>(tree);
            appliedStyle=null;
            iconAttempts=0;
            apply();
            if(Build.VERSION.SDK_INT>=31 && arrowBlur!=null && feedBlurEnabled)arrowBlur.start();
            watchCollapse();
        }
        void pause(){
            active=false;
            if(corner!=null)corner.freeze();
            if(media && decor.get()!=null)GalleryBottomActionsTweaks.glassSurfaces(decor.get(),false,false);
            if(!media && Build.VERSION.SDK_INT>=31 && feedBlur!=null)feedBlur.freeze();
            if(Build.VERSION.SDK_INT>=31 && arrowBlur!=null)arrowBlur.freeze();
            unwatchCollapse();
            if(Build.VERSION.SDK_INT>=34 && back!=null)((SurfaceMediaBack)back).pause();
            ViewTreeObserver tree=observer==null ? null:observer.get();
            if(tree!=null && tree.isAlive()){
                tree.removeOnGlobalLayoutListener(this);
                tree.removeOnPreDrawListener(this);
            }
            observer=null;
        }
        void dispose(){
            disposed=true;
            pause();
            if(Build.VERSION.SDK_INT>=31 && feedBlur!=null)feedBlur.stop();
            if(Build.VERSION.SDK_INT>=31 && arrowBlur!=null)arrowBlur.stop();
            if(corner!=null)corner.dispose();
            if(headerGradient!=null)headerGradient.dispose();
            if(mediaTop!=null)mediaTop.dispose();
            View root=decor.get();
            if(root!=null){
                if(status!=null)root.getOverlay().remove(status);
                if(navigation!=null)root.getOverlay().remove(navigation);
            }
            if(backdrop!=null)backdrop.release();
            layers.clear();
        }
        void add(View target){if(target!=null)for(Layer layer:layers){if(layer.view.get()==target)return;}if(target!=null)layers.add(new Layer(target));}
        void prepare(Activity activity,View root){
            if(prepared)return;
            View bar=view(activity,"appBarLayout");if(bar==null)bar=find(root,"appbar");appBar=new WeakReference<>(bar);
            View tools=view(activity,"toolbar");if(tools==null)tools=find(root,"toolbar");toolbar=new WeakReference<>(tools);
            View nav=media ? view(activity,"bottomBar"):find(root,"bottom_navigation_view");if(nav==null)nav=find(root,media ? "bottom_bar":"bottom_navigation");bottom=new WeakReference<>(nav);
            nativePlayback=media && nav!=null && find(nav,"media_controller")!=null;if(nativePlayback){nativePlaybackBackground=nav.getBackground();nav.setClipToOutline(false);}
            View guard=view(activity,"protectionLayout");if(guard==null)guard=find(root,"list_protection");protection=new WeakReference<>(guard);
            if(media){View content=root.findViewById(android.R.id.content);if(content instanceof ViewGroup && ((ViewGroup)content).getChildCount()>0)add(((ViewGroup)content).getChildAt(0));
                for(String id:new String[]{"container","main_content","view_pager","pager","swipe_layout"})add(find(root,id));
                // ExoPlayer's shutter is a separate opaque black layer behind video.
                View player=find(root,"video_view");
                if(player!=null)try{
                    player.getClass().getMethod("setShutterBackgroundColor",int.class).invoke(player,Color.TRANSPARENT);
                }catch(ReflectiveOperationException ignored){
                }
            }else{add(bar);add(view(activity,"collapsingToolbarLayout"));}
            View header=find(root,"header_content");
            if(!media && header!=null && activity.getClass().getName().equals("com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditActivity"))try{
                compactFlag=activity.getClass().getDeclaredField("F0");compactFlag.setAccessible(true);headerContent=new WeakReference<>(header);
            }catch(ReflectiveOperationException ignored){}
            if(extraChrome(activity.getClass().getName()))unifiedChrome=new UnifiedChromeTweaks.Screen(activity,root);
            add(tools);add(nav);prepared=true;
        }
        void apply(){
            Activity activity=owner.get();View root=decor.get();if(activity==null || root==null)return;prepare(activity,root);
            String style=preferences.getString(STYLE,"dimmed");if(!"solid".equals(style))style="dimmed";
            int opacity=number(preferences,OPACITY,70,55,90);
            boolean enableBlur=preferences.getBoolean("shikify_feed_pill_blur",true);
            if(style.equals(appliedStyle) && opacity==appliedOpacity && feedBlurEnabled==enableBlur)return;
            appliedStyle=style;
            appliedOpacity=opacity;
            if(corner!=null){
                corner.dispose();
                corner=null;
            }
            feedBlurEnabled=enableBlur;
            boolean solid="solid".equals(style);int color=role(activity,media),text=foreground(activity,media);Window window=activity.getWindow();
            window.setStatusBarColor(Color.TRANSPARENT);window.setNavigationBarColor(Color.TRANSPARENT);
            if(media){
                if(Build.VERSION.SDK_INT>=30)window.setDecorFitsSystemWindows(false);
                else root.setSystemUiVisibility(root.getSystemUiVisibility()|View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
            }
            if(Build.VERSION.SDK_INT>=29){window.setStatusBarContrastEnforced(false);window.setNavigationBarContrastEnforced(false);}
            // Decide icon appearance from the app's ContentBackground, never the system's day/night mode.
            int flags=root.getSystemUiVisibility(),light=View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            root.setSystemUiVisibility(media || dark(activity) ? flags&~light:flags|light);
            if(Build.VERSION.SDK_INT>=30 && window.getInsetsController()!=null)window.getInsetsController().setSystemBarsAppearance(media || dark(activity) ? 0:24,24);
            View guard=protection.get();
            if(guard!=null)try{
                guard.getClass().getMethod("setProtections",java.util.List.class).invoke(guard,Collections.emptyList());
            }catch(ReflectiveOperationException ignored){
            }
            if(media){
                if(backdrop==null)backdrop=new Backdrop(color,opacity);backdrop.opacity=solid ? 100:opacity;
                window.setBackgroundDrawable(backdrop);
                for(Layer layer:layers){
                    View target=layer.view.get();
                    if(target==null)continue;
                    target.setBackground(target==bottom.get() ? (nativePlayback ? nativePlaybackBackground:mediaPanel(activity,color)):null);
                }

            }else{
                // An opaque base prevents light launch-window colours leaking into transparent insets.
                window.setBackgroundDrawable(new ColorDrawable(color));
                for(Layer layer:layers){View target=layer.view.get();if(target==null)continue;
                    target.setBackground(target==toolbar.get() || target==bottom.get() ? new ColorDrawable(color):null);}
                View collapse=view(activity,"collapsingToolbarLayout");
                if(collapse!=null)try{
                    collapse.getClass().getMethod("setContentScrimColor",int.class).invoke(collapse,compactFlag==null ? color:Color.TRANSPARENT);
                    collapse.getClass().getMethod("setStatusBarScrimColor",int.class).invoke(collapse,Color.TRANSPARENT);
                }catch(ReflectiveOperationException ignored){
                }
                View nav=bottom.get();
                if(nav!=null){
                    nav.setElevation(0);
                    try{
                        nav.getClass().getMethod("setDefaultBackgroundColor",int.class).invoke(nav,color);
                    }catch(ReflectiveOperationException ignored){
                    }
                }
            }
            toolbar(toolbar.get(),text);
            if(status!=null)root.getOverlay().remove(status);if(navigation!=null)root.getOverlay().remove(navigation);
            status=new ColorDrawable(Color.TRANSPARENT);navigation=new ColorDrawable(color);
            root.getOverlay().add(status);root.getOverlay().add(navigation);titleColor=color;updateBounds();updateCompact();
            if(media)GalleryBottomActionsTweaks.glassSurfaces(root,active,feedBlurEnabled);
        }
        void watchCollapse(){
            View bar=appBar==null ? null:appBar.get();if(compactFlag==null || bar==null || collapseListener!=null)return;
            try{Class<?> listener=Class.forName("com.google.android.material.appbar.AppBarLayout$g",false,bar.getContext().getClassLoader());WeakReference<Screen> weak=new WeakReference<>(this);
                collapseListener=java.lang.reflect.Proxy.newProxyInstance(listener.getClassLoader(),new Class<?>[]{listener},(proxy,method,args)->{
                    if(method.getDeclaringClass()==Object.class){
                        if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                        if(method.getName().equals("equals"))return proxy==args[0];
                        return "Shikify collapsed title";
                    }
                    Screen screen=weak.get();
                    if(screen!=null && screen.active){
                        screen.updateCompact();
                        if(args!=null && args.length==2 && args[1] instanceof Integer)screen.fadeHeader((Integer)args[1]);
                    }
                    return null;
                });bar.getClass().getMethod("a",listener).invoke(bar,collapseListener);
            }catch(ReflectiveOperationException | RuntimeException ignored){collapseListener=null;}
            updateCompact();
        }
        void fadeHeader(int offset){
            View bar=appBar==null ? null:appBar.get(),tools=toolbar==null ? null:toolbar.get(),header=headerContent==null ? null:headerContent.get();if(bar==null || tools==null || header==null)return;
            float progress=Math.min(1,-offset/(float)Math.max(1,bar.getHeight()-tools.getHeight()-statusHeight)),alpha=1-Math.min(1,progress*1.25f);
            if(Math.abs(header.getAlpha()-alpha)>.01f)header.setAlpha(alpha);
        }
        /** The header takes a hint of the community icon once it has loaded. */
        private void tintHeader(){
            if(++tintAttempts>240){tinted=true;return;}
            View root=decor.get(),icon=root==null ? null:find(root,"avatar");if(!(icon instanceof android.widget.ImageView))return;
            Drawable image=((android.widget.ImageView)icon).getDrawable();if(!(image instanceof android.graphics.drawable.BitmapDrawable))return;
            tinted=true;
            try{
                Bitmap source=((android.graphics.drawable.BitmapDrawable)image).getBitmap();
                if(Build.VERSION.SDK_INT>=26 && source.getConfig()==Bitmap.Config.HARDWARE)source=source.copy(Bitmap.Config.ARGB_8888,false);
                int average=Bitmap.createScaledBitmap(source,1,1,true).getPixel(0,0);
                float[] hsv=new float[3];Color.colorToHSV(average,hsv);if(hsv[1]>=.15f)headerGradient.tint(average);
            }catch(RuntimeException error){}
        }
        void unwatchCollapse(){
            View bar=appBar==null ? null:appBar.get();
            if(bar!=null && collapseListener!=null){
                Object listeners=CommentsChromeTweaks.field(bar,"C");
                if(listeners instanceof java.util.List)((java.util.List<?>)listeners).remove(collapseListener);
            }
            collapseListener=null;
        }
        void updateCompact(){
            if(compactFlag==null)return;
            Activity activity=owner.get();
            View tools=toolbar==null ? null:toolbar.get(),header=headerContent==null ? null:headerContent.get();
            if(activity==null || tools==null)return;
            try{boolean compact=header==null || header.getVisibility()!=View.VISIBLE || compactFlag.getBoolean(activity);int color=compact ? titleColor:Color.TRANSPARENT;
                if(titleSurface==null)titleSurface=new ColorDrawable(color);else if(titleSurface.getColor()!=color)titleSurface.setColor(color);
                if(expandedSurface==null)expandedSurface=new android.graphics.drawable.GradientDrawable(
                    android.graphics.drawable.GradientDrawable.Orientation.TOP_BOTTOM,new int[]{0x66000000,Color.TRANSPARENT});
                Drawable background=compact ? titleSurface:expandedSurface;
                if((headerGradient==null || !headerGradient.enabled) && tools.getBackground()!=background)tools.setBackground(background);
                View root=decor.get(),title=compactTitle==null ? null:compactTitle.get();
                if(root!=null && (title==null || title.getRootView()!=root)){
                    title=find(root,"action_bar_title");
                    compactTitle=new WeakReference<>(title);
                }
                if(title!=null)HomeAvatarTweaks.compactAvatar(title,compact);
            }catch(IllegalAccessException ignored){}
        }
        /** Bottom bar destinations sit one container below the bar. */
        private void pressNavigation(View nav){
            if(!(nav instanceof ViewGroup) || ((ViewGroup)nav).getChildCount()==0 || !(((ViewGroup)nav).getChildAt(0) instanceof ViewGroup))return;
            ViewGroup items=(ViewGroup)((ViewGroup)nav).getChildAt(0);
            for(int index=0;index<items.getChildCount();index++)if(items.getChildAt(index).isClickable()){Motion.press(items.getChildAt(index),0.92f);Haptics.tap(items.getChildAt(index));}
            iconStates(nav);
        }
        /** Active tabs fill in, as Material 3 asks. Other patches may set these icons, so this runs
         * after them, and the attempt limit means two patches can never keep replacing each other. */
        private void iconStates(View nav){
            if(iconAttempts>=4)return;
            try{
                Object menu=nav.getClass().getMethod("getMenu").invoke(nav);
                if(!(menu instanceof android.view.Menu))return;
                android.content.Context context=nav.getContext();boolean changed=false;
                for(String[] pair:new String[][]{{"item_home","shikify_nav_home"},{"item_inbox","shikify_nav_inbox"}}){
                    android.view.MenuItem item=((android.view.Menu)menu).findItem(Ids.view(nav,pair[0]));
                    if(item==null || item.getIcon() instanceof android.graphics.drawable.StateListDrawable)continue;
                    int icon=context.getResources().getIdentifier(pair[1],"drawable",context.getPackageName());
                    if(icon!=0){item.setIcon(icon);changed=true;}
                }
                if(changed)iconAttempts++;
            }catch(ReflectiveOperationException | RuntimeException error){iconAttempts=4;}
        }
        /** Comment navigation floats over the thread like the bottom bar. */
        private void arrowPill(View root,int bottomInset){
            View arrows=find(root,"comments_navigation_arrows");if(arrows==null)return;
            Context context=arrows.getContext();
            if(!arrowsStyled){
                arrowsStyled=true;arrows.setElevation(0);arrows.setClipToOutline(true);
                int tint=MaterialYouTweaks.color(context,"colorOnSurface",android.R.attr.textColorPrimary);
                tintButtons(arrows,android.content.res.ColorStateList.valueOf(tint));
            }
            if(Build.VERSION.SDK_INT>=31 && active && feedBlurEnabled){
                View content=find(root,"fragment_container");
                if(content!=null){
                    if(arrowBlur==null)arrowBlur=new FeedPillBlur(content,arrows,role(context,false));
                    if(arrows.getBackground()!=arrowBlur){arrows.setBackground(arrowBlur);arrowBlur.start();}
                }
            }else if(arrows.getBackground()==null || arrows.getBackground()==arrowBlur){
                if(Build.VERSION.SDK_INT>=31 && arrowBlur!=null)arrowBlur.stop();
                arrows.setBackground(pillBackground(context,MaterialYouTweaks.color(context,"colorSurfaceContainerHigh",android.R.attr.colorBackground),32));
            }
            if(arrows.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)arrows.getLayoutParams();int below=Math.round(16*context.getResources().getDisplayMetrics().density)+bottomInset;
                if(params.bottomMargin!=below){params.bottomMargin=below;arrows.setLayoutParams(params);}
            }
        }
        private void tintButtons(View view,android.content.res.ColorStateList tint){
            if(view instanceof android.widget.ImageButton){((android.widget.ImageButton)view).setImageTintList(tint);Haptics.tap(view);}
            else if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int index=0;index<group.getChildCount();index++)tintButtons(group.getChildAt(index),tint);}
        }
        void updateBounds(){
            View root=decor.get();
            if(root==null || status==null)return;
            WindowInsets insets=root.getRootWindowInsets();
            int top=0,bottom=0;
            if(insets!=null){
                if(Build.VERSION.SDK_INT>=30){
                    android.graphics.Insets bars=insets.getInsets(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());
                    top=bars.top;
                    bottom=bars.bottom;
                }else{
                    top=insets.getSystemWindowInsetTop();
                    bottom=insets.getSystemWindowInsetBottom();
                }
            }
            if(!media){
                View nav=this.bottom==null ? null:this.bottom.get();
                if(nav==null || nav.getParent()==null){
                    View next=find(root,"bottom_navigation_view");
                    if(next==null)next=find(root,"bottom_navigation");
                    if(next!=null && next!=nav){
                        if(Build.VERSION.SDK_INT>=31 && feedBlur!=null)feedBlur.stop();
                        feedBlur=null;
                        nav=next;
                        this.bottom=new WeakReference<>(nav);
                        add(nav);
                        nav.setElevation(0);
                    }
                }
                if(nav!=null){
                    float density=root.getResources().getDisplayMetrics().density;int horizontal=Math.round(16*density),gap=Math.round(12*density);
                    if(feedPill==null)feedPill=pillBackground(root.getContext(),MaterialYouTweaks.color(root.getContext(),"colorSurfaceContainerHigh",android.R.attr.colorBackground),40);
                    if(Build.VERSION.SDK_INT>=31 && active && feedBlurEnabled){
                        View content=find(root,"fragment_container");
                        if(content==null)content=find(root,"container");
                        if(content==null)content=find(root,"recyclerview");
                        if(content!=null){
                            if(feedBlur==null)feedBlur=new FeedPillBlur(content,nav,role(root.getContext(),false));
                            if(nav.getBackground()!=feedBlur){
                                nav.setBackground(feedBlur);
                                feedBlur.start();
                            }
                        }
                    }
                    if(Build.VERSION.SDK_INT<31 || feedBlur==null || !feedBlurEnabled){
                        if(Build.VERSION.SDK_INT>=31 && feedBlur!=null)feedBlur.stop();
                        if(nav.getBackground()!=feedPill)nav.setBackground(feedPill);
                    }
                    nav.setClipToOutline(true);
                    if(nav.getPaddingBottom()!=0)nav.setPaddingRelative(nav.getPaddingStart(),nav.getPaddingTop(),nav.getPaddingEnd(),0);pressNavigation(nav);
                    if(nav.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                        ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)nav.getLayoutParams();
                        int safeLeft=0,safeRight=0;
                        if(insets!=null){
                            safeLeft=insets.getSystemWindowInsetLeft();
                            safeRight=insets.getSystemWindowInsetRight();
                        }
                        int left=horizontal+safeLeft,right=horizontal+safeRight,below=gap+bottom;
                        if(params.leftMargin!=left || params.rightMargin!=right || params.bottomMargin!=below){
                            params.leftMargin=left;
                            params.rightMargin=right;
                            params.setMarginStart(left);
                            params.setMarginEnd(right);
                            params.bottomMargin=below;
                            nav.setLayoutParams(params);
                        }
                    }
                }
            }
            if(!media)arrowPill(root,bottom);
            if(unifiedChrome!=null)unifiedChrome.update();
            if(!media && drawer==null){
                View host=find(root,"material_drawer_layout");
                // The layout has an empty end panel too, so take the one holding the menu.
                if(host instanceof ViewGroup){
                    ViewGroup panels=(ViewGroup)host;
                    int slider=Ids.view(root,"material_drawer_slider_layout"),list=Ids.view(root,"material_drawer_recycler_view");
                    for(int index=0;index<panels.getChildCount();index++){
                        View panel=panels.getChildAt(index);
                        if(panel.getId()==slider && panel.findViewById(list)!=null && SurfaceSettingsActivity.enabled(panel.getContext(),"side_panel")){drawer=new UnifiedChromeTweaks.Drawer(panel);break;}
                    }
                }
            }
            if(!media && corner==null){
                View menu=find(root,"menu");
                Object button=CommentsChromeTweaks.field(menu,"z");
                if(menu!=null && menu.getClass().getName().equals("com.rubenmayayo.reddit.ui.customviews.fab.FloatingActionMenu") && button instanceof View)corner=new UnifiedChromeTweaks.Corner(root,menu,(View)button,feedBlurEnabled);
            }
            if(active && corner!=null)corner.start();
            Activity activity=owner.get();if(activity!=null && media){if(mediaTop==null)mediaTop=new UnifiedChromeTweaks.MediaTop(root);mediaTop.update();top=0;bottom=0;}
            statusHeight=top;
            View legacy=legacyStatus==null ? null:legacyStatus.get();
            if(legacy==null || legacy.getParent()==null)legacy=root.findViewWithTag("MORPHE_BOOST_COMMENTS_SYSTEM_BAR_SURFACE_V1");
            if(legacy!=null){
                legacyStatus=new WeakReference<>(legacy);
                if(legacy.getVisibility()!=View.GONE)legacy.setVisibility(View.GONE);
            }
            if(!media){
                View bar=appBar==null ? null:appBar.get(),tools=toolbar==null ? null:toolbar.get();
                if(headerGradient==null && bar!=null && tools!=null)headerGradient=new HeaderGradient(activity,root,bar,tools);
                if(active && headerGradient!=null)headerGradient.update(top);
            }
            status.setBounds(0,0,0,0);navigation.setBounds(0,root.getHeight()-bottom,root.getWidth(),root.getHeight());}
        @Override public void onGlobalLayout(){updateBounds();updateCompact();}
        @Override public boolean onPreDraw(){
            Activity activity=owner.get();if(activity!=null && activity.getWindow().getStatusBarColor()!=Color.TRANSPARENT)activity.getWindow().setStatusBarColor(Color.TRANSPARENT);
            View legacy=legacyStatus==null ? null:legacyStatus.get();if(legacy!=null && legacy.getVisibility()!=View.GONE)legacy.setVisibility(View.GONE);
            View guard=protection==null ? null:protection.get();
            if(guard!=null && guard.getClass().getName().equals("androidx.core.view.insets.ProtectionLayout")){
                Object entries=CommentsChromeTweaks.field(guard,"a");
                if(entries instanceof java.util.Collection && !((java.util.Collection<?>)entries).isEmpty())try{
                    guard.getClass().getMethod("setProtections",java.util.List.class).invoke(guard,Collections.emptyList());
                }catch(ReflectiveOperationException ignored){
                }
            }
            if(active && headerGradient!=null && headerGradient.enabled)headerGradient.position(statusHeight);
            if(active && mediaTop!=null)mediaTop.update();
            if(active && unifiedChrome!=null)unifiedChrome.frame();if(active && drawer!=null){drawer.update();if(headerGradient!=null)headerGradient.statusAlpha(1-drawer.open());}
            if(active && !tinted && compactFlag!=null && headerGradient!=null)tintHeader();
            return true;
        }
    }
    static final class Layer {final WeakReference<View> view;Layer(View view){this.view=new WeakReference<>(view);}}
    /** Window compositor supplies the real underlying Activity. Only draw a dim mask. */
    static final class Backdrop extends Drawable {
        final int color;int opacity;float exitProgress;final Paint paint=new Paint();
        Backdrop(int color,int opacity){this.color=color|0xff000000;this.opacity=opacity;}
        void release(){}
        @Override public void draw(Canvas canvas){paint.setColor(tint(color,Math.round(opacity*(1-exitProgress))));canvas.drawRect(getBounds(),paint);}
        @Override public int getOpacity(){return opacity==100 && exitProgress==0 ? PixelFormat.OPAQUE:PixelFormat.TRANSLUCENT;}
        @Override public void setAlpha(int alpha){} @Override public void setColorFilter(ColorFilter filter){}
    }
}
