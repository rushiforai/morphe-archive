import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

/** Isolated Home-only/account-state checks. Uses a memory-only avatar preference store;
 * no logged-in app process, account database, private preferences or remote URLs are touched. */
public final class HomeAvatarChecks {
    static int checks;
    static final class TestApp extends android.app.Application {
        ActivityLifecycleCallbacks lifecycle;int registrations;
        @Override public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks value){lifecycle=value;registrations++;}
    }
    static TestApp app;
    static ClassLoader loader;
    static Context context;
    static Map<String,String> urls=new HashMap<>();
    static java.util.Set<SharedPreferences.OnSharedPreferenceChangeListener> listeners=new java.util.HashSet<>();
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object field(Object object,String name)throws Exception{for(Class<?> t=object.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);return f.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static Object staticField(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
    static void setUser(Object reddit,String name)throws Exception {
        Class<?> user=Class.forName("com.rubenmayayo.reddit.aa.User",true,loader);Object value=name==null ? null:StyleChecks.allocate(user);
        if(value!=null)user.getField("name").set(value,name);
        Class.forName("ld2",true,loader).getField("a").set(reddit,value);
    }
    static void accept(ImageView image,Drawable drawable)throws Exception {Method method=image.getClass().getDeclaredMethod("acceptResource",Object.class);method.setAccessible(true);method.invoke(image,drawable);}
    static ImageView avatar(RelativeLayout row){for(int i=0;i<row.getChildCount();i++)if(row.getChildAt(i) instanceof ImageView)return (ImageView)row.getChildAt(i);return null;}
    static void measure(View view,int width) {
        view.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));view.layout(0,0,view.getMeasuredWidth(),view.getMeasuredHeight());
    }
    static void run(String[] args)throws Exception {
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();
        Context theme=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);
        SharedPreferences prefs=(SharedPreferences)Proxy.newProxyInstance(loader,new Class<?>[]{SharedPreferences.class},(p,m,a)->{
            switch(m.getName()) {
                case "getString":return urls.getOrDefault((String)a[0],(String)a[1]);
                case "registerOnSharedPreferenceChangeListener":listeners.add((SharedPreferences.OnSharedPreferenceChangeListener)a[0]);return null;
                case "unregisterOnSharedPreferenceChangeListener":listeners.remove(a[0]);return null;
                case "getAll":return new HashMap<>(urls);
                case "contains":return urls.containsKey(a[0]);
                default:return null;
            }
        });
        TestApp application=new TestApp();app=application;
        java.io.File privateCache=new java.io.File(args[1],"avatar-test-cache");privateCache.mkdirs();
        context=new ContextWrapper(theme){
            @Override public SharedPreferences getSharedPreferences(String name,int mode){return prefs;}
            @Override public Context getApplicationContext(){return application;}
            @Override public java.io.File getCacheDir(){return privateCache;}
        };
        Method attach=ContextWrapper.class.getDeclaredMethod("attachBaseContext",Context.class);attach.setAccessible(true);attach.invoke(application,context);
        StyleChecks.context=context;
        Class<?> patches=Class.forName("app.morphe.extension.boost.HomeAvatarTweaks",true,loader);Method bind=patches.getMethod("onTitleBind",Object.class,Object.class);
        patches.getMethod("install",Object.class).invoke(null,application);patches.getMethod("install",Object.class).invoke(null,application);
        check(application.registrations==1 && application.lifecycle!=null,"Avatar lifecycle observer installs once independently of surface styling");
        Class<?> model=Class.forName("com.rubenmayayo.reddit.models.reddit.SubscriptionViewModel",true,loader);
        Object home=model.getMethod("c").invoke(null),community=model.getConstructor(String.class).newInstance("technology"),namedHome=model.getConstructor(String.class).newInstance("Home");
        Class<?> redditType=Class.forName("pd2",true,loader);Object reddit=StyleChecks.allocate(redditType);redditType.getField("r").set(null,reddit);
        setUser(reddit,"LocalTestAccount");
        RelativeLayout untouched=(RelativeLayout)StyleChecks.inflate("spinner_subscription_toolbar");
        bind.invoke(null,community,untouched);check(avatar(untouched)!=null && avatar(untouched).getVisibility()==View.VISIBLE,"A community title receives its own compact subreddit icon");
        bind.invoke(null,namedHome,untouched);check(avatar(untouched)!=null && field(((Map<?,?>)staticField(patches,"HEADERS")).get(untouched),"home").equals(false),"A subreddit literally named Home uses community identity, not the account avatar");
        RelativeLayout row=(RelativeLayout)StyleChecks.inflate("spinner_subscription_toolbar"),labels=(RelativeLayout)row.getChildAt(0);
        TextView title=(TextView)StyleChecks.find(row,"action_bar_title"),sort=(TextView)StyleChecks.find(row,"action_bar_subtitle");
        title.setText("Home");sort.setText("Hot");Object tag=new Object();row.setTag(tag);int[] clicks={0};row.setOnClickListener(v->clicks[0]++);
        bind.invoke(null,home,row);ImageView image=avatar(row);
        check(image!=null && image.getVisibility()==View.VISIBLE,"Signed-in Home adds one visible account avatar");
        check(row.getTag()==tag && title.getText().toString().equals("Home") && sort.getText().toString().equals("Hot"),"Native spinner tag, title and sort text remain intact");
        check(!image.isClickable() && !image.isFocusable() && image.getImportantForAccessibility()==View.IMPORTANT_FOR_ACCESSIBILITY_NO,"Decorative avatar retains the native spinner's touch and accessibility handling");
        check(image.getScaleType()==ImageView.ScaleType.CENTER_CROP && image.getClipToOutline(),"Avatar uses a circular crop without distorting the source image");
        measure(row,Math.round(240*context.getResources().getDisplayMetrics().density));
        check(image.getRight()<labels.getLeft() && image.getHeight()==Math.round(32*context.getResources().getDisplayMetrics().density),"Avatar occupies 32dp to the left of both Home and its sort subtitle");
        row.performClick();check(clicks[0]==1,"Native title click target still invokes its original handler once");
        Object header=((Map<?,?>)staticField(patches,"HEADERS")).get(row);
        check(field(header,"username").equals("LocalTestAccount") && image.getDrawable()!=null,"Missing cached avatar uses Boost's own account placeholder");
        int count=row.getChildCount();Drawable stableBackground=image.getBackground(),stableGlyph=image.getDrawable();for(int i=0;i<100;i++)bind.invoke(null,home,row);
        check(image.getBackground()==stableBackground && image.getDrawable()==stableGlyph,"Unchanged native title binds reuse placeholder drawables without background/layout churn");
        check(row.getChildCount()==count && ((Map<?,?>)staticField(patches,"HEADERS")).get(row)==header,"100 title rebindings reuse the same avatar and controller");
        bind.invoke(null,community,row);check(image.getVisibility()==View.VISIBLE && ((RelativeLayout.LayoutParams)labels.getLayoutParams()).getMarginStart()>0,"Switching to a community keeps a separate icon beside its title");
        bind.invoke(null,home,row);setUser(reddit,"AnotherLocalAccount");bind.invoke(null,home,row);check(field(header,"username").equals("AnotherLocalAccount"),"Switching accounts follows the current native account identity");
        setUser(reddit,null);bind.invoke(null,home,row);check(image.getVisibility()==View.GONE,"Anonymous Home does not retain the previous account's avatar");
        setUser(reddit,"LocalTestAccount");bind.invoke(null,home,row);
        View.OnAttachStateChangeListener lifecycle=(View.OnAttachStateChangeListener)header;lifecycle.onViewAttachedToWindow(row);
        check(listeners.size()==1,"Attached Home listens for native avatar-cache updates");lifecycle.onViewAttachedToWindow(row);check(listeners.size()==1,"Repeated attachment does not duplicate preference listeners");
        lifecycle.onViewDetachedFromWindow(row);check(listeners.isEmpty(),"Detachment releases the avatar-cache listener");
        // Reuse Boost's real Glide manager with an in-memory data URI only.
        // Reflection success is checked separately from the asynchronous final image.
        Class<?> glide=Class.forName("gh0",true,loader),manager=Class.forName("r41",true,loader),request=Class.forName("q41",true,loader);
        check(glide.getMethod("i",View.class).getReturnType()==manager && manager.getMethod("v",String.class).getReturnType()==request,"Avatar image-loader entry points resolve against the actual Boost APK");
        check(manager.getMethod("o",View.class).getReturnType()==void.class && request.getMethod("Z").getReturnType()==request && request.getMethod("e0",int.class,int.class).getReturnType()==request && request.getMethod("P",ImageView.class)!=null,"Native cancellation, crop, requested size and image target APIs resolve");
        // A self-contained local data URI exercises native Glide's actual request path.
        Bitmap tiny=Bitmap.createBitmap(2,2,Bitmap.Config.ARGB_8888);tiny.eraseColor(Color.CYAN);
        java.io.ByteArrayOutputStream bytes=new java.io.ByteArrayOutputStream();tiny.compress(Bitmap.CompressFormat.PNG,100,bytes);tiny.recycle();
        urls.put("LocalTestAccount","data:image/png;base64,"+android.util.Base64.encodeToString(bytes.toByteArray(),android.util.Base64.NO_WRAP));
        Object actualManager=glide.getMethod("i",View.class).invoke(null,image);
        actualManager.getClass().getMethod("o",View.class).invoke(actualManager,image);
        bind.invoke(null,home,row);
        int glideTag=context.getResources().getIdentifier("glide_custom_view_target_tag","id",context.getPackageName());
        check(image.getTag(glideTag)!=null,"A locally cached avatar starts an actual native Glide request on the avatar view");
        urls.clear();bind.invoke(null,home,row);check(image.getTag(glideTag)==null,"Clearing a cached avatar cancels the old request before setting its placeholder");
        // Synthetic cached picture for layout preview; no network access or installed-app data.
        Bitmap picture=Bitmap.createBitmap(64,64,Bitmap.Config.ARGB_8888);Canvas pic=new Canvas(picture);pic.drawColor(Color.rgb(95,145,180));android.graphics.Paint paint=new android.graphics.Paint(3);paint.setColor(Color.rgb(220,235,250));pic.drawCircle(32,25,12,paint);pic.drawOval(10,38,54,80,paint);accept(image,new BitmapDrawable(context.getResources(),picture));
        Drawable loaded=image.getDrawable();image.setImageDrawable(new android.graphics.drawable.ColorDrawable(Color.WHITE));
        check(image.getDrawable()==loaded,"A nonnull white Glide placeholder cannot replace the loaded avatar");
        android.graphics.drawable.GradientDrawable whiteShape=new android.graphics.drawable.GradientDrawable();whiteShape.setColor(Color.WHITE);image.setImageDrawable(whiteShape);
        check(image.getDrawable()==loaded,"A white shape placeholder cannot replace the loaded avatar");
        image.setImageDrawable(null);check(image.getDrawable()==loaded,"Lifecycle clears retain the same account's loaded avatar");
        bind.invoke(null,home,row);check(image.getDrawable()==loaded,"Unchanged Home bind retains the loaded avatar");
        setUser(reddit,"AnotherLocalAccount");bind.invoke(null,home,row);check(image.getDrawable()!=loaded,"Account switch clears the previous account's retained photo");
        setUser(reddit,"LocalTestAccount");bind.invoke(null,home,row);accept(image,new BitmapDrawable(context.getResources(),picture));
        measure(row,Math.round(240*context.getResources().getDisplayMetrics().density));
        Outline outline=new Outline();image.getOutlineProvider().getOutline(image,outline);check(!outline.isEmpty(),"Rounded avatar supplies a valid circular clipping outline");
        if(args.length>2)StyleChecks.save(row,args[2]+"/home-avatar-preview.png");
        row.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);measure(row,Math.round(240*context.getResources().getDisplayMetrics().density));
        check(image.getLeft()>=labels.getRight(),"RTL places the avatar at the logical start without overlapping the labels");
        title.setTextSize(26);sort.setTextSize(22);row.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);measure(row,Math.round(240*context.getResources().getDisplayMetrics().density));
        check(sort.getTop()+sort.getBaseline()>title.getTop()+title.getBaseline() && sort.getBottom()<=labels.getHeight() && labels.getLeft()>image.getRight(),"Larger title fonts retain two readable lines beside the avatar");
        asyncProfileChecks(args,patches,bind,reddit,home,model);
        android.os.Looper.loop();
    }
    static void navigationChecks(Class<?> patches,Object reddit)throws Exception {
        View root=StyleChecks.inflate("activity_subreddit");View nav=StyleChecks.find(root,"bottom_navigation_view");nav.setVisibility(View.VISIBLE);
        View item=StyleChecks.find(nav,"item_profile");int[] clicks={0};item.setOnClickListener(v->clicks[0]++);Object tag=new Object();item.setTag(tag);CharSequence description=item.getContentDescription();DownloadControlsChecks.context=context;DownloadControlsChecks.measure(root);
        int originalWidth=item.getWidth();
        Method bind=patches.getDeclaredMethod("navigation",View.class);bind.setAccessible(true);bind.invoke(null,root);Object controller=((Map<?,?>)staticField(patches,"NAVIGATION")).get(item);check(controller!=null,"Native account menu item gains one avatar controller");
        Object header=field(controller,"header");ImageView image=(ImageView)((java.lang.ref.WeakReference<?>)field(header,"image")).get(),nativeIcon=(ImageView)((java.lang.ref.WeakReference<?>)field(controller,"nativeIcon")).get();
        DownloadControlsChecks.measure(root);((android.view.ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();check(image.getClipToOutline() && image.getWidth()==nativeIcon.getWidth() && image.getHeight()==nativeIcon.getHeight(),"Pill avatar uses the native icon bounds and circular crop");
        View photo=(View)((java.lang.ref.WeakReference<?>)field(header,"row")).get();check(photo.getLeft()==nativeIcon.getLeft() && photo.getTop()==nativeIcon.getTop() && item.getWidth()==originalWidth && ((ViewGroup)nativeIcon.getParent()).getChildCount()==1,"Overlay avatar shares the exact native icon position without adding horizontal layout width");
        check(field(image,"owned")!=null,"Pill immediately reuses the loaded account bitmap without another network load");
        Drawable picture=image.getDrawable();image.setColorFilter(Color.WHITE);image.setImageTintList(android.content.res.ColorStateList.valueOf(Color.WHITE));image.getDrawable().setTint(Color.WHITE);check(image.getDrawable()==picture && image.getColorFilter()==null && image.getImageTintList()==null,"Pill photo rejects recursive white navigation tint");
        nativeIcon.setVisibility(View.VISIBLE);((android.view.ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();check(nativeIcon.getVisibility()==View.INVISIBLE,"A native icon refresh cannot reveal the person glyph behind the avatar");
        item.performClick();check(clicks[0]==1 && item.getTag()==tag && java.util.Objects.equals(description,item.getContentDescription()),"Account item retains its native click, tag and accessibility label");
        int children=((ViewGroup)nativeIcon.getParent()).getChildCount();for(int i=0;i<50;i++)bind.invoke(null,root);check(((ViewGroup)nativeIcon.getParent()).getChildCount()==children && ((Map<?,?>)staticField(patches,"NAVIGATION")).get(item)==controller,"Repeated navigation updates reuse one avatar and controller");
        Class<?> hostType=Class.forName("app.morphe.extension.boost.HomeAvatarTweaks$NavigationHost",true,loader);java.lang.reflect.Constructor<?> make=hostType.getDeclaredConstructor(View.class);make.setAccessible(true);Object host=make.newInstance(root);SurfaceChecks.call(host,"start");
        setUser(reddit,"DifferentNavigationAccount");((android.view.ViewTreeObserver.OnGlobalLayoutListener)host).onGlobalLayout();check(image.getDrawable()!=picture && field(header,"username").equals("DifferentNavigationAccount"),"Layout-only account switch clears the old pill photo without a resume or title rebind");setUser(reddit,null);bind.invoke(null,root);check(image.getVisibility()==View.VISIBLE && image.getDrawable()!=null,"Anonymous pill retains a themed account fallback");setUser(reddit,"FirstLaunchAccount");bind.invoke(null,root);
        android.view.Menu menu=(android.view.Menu)nav.getClass().getMethod("getMenu").invoke(nav);menu.clear();int menuId=context.getResources().getIdentifier("bottom_navigation_menu","menu",context.getPackageName());new android.view.MenuInflater(context).inflate(menuId,menu);((android.view.ViewTreeObserver.OnGlobalLayoutListener)host).onGlobalLayout();View replacement=StyleChecks.find(nav,"item_profile");check(((Map<?,?>)staticField(patches,"NAVIGATION")).get(replacement)!=null,"Late native menu recreation also receives the cached avatar");
        for(Map.Entry<?,?> entry:((Map<?,?>)staticField(patches,"NAVIGATION")).entrySet()){View nativeItem=(View)entry.getKey();if(nativeItem.getRootView()!=root)continue;Object binding=entry.getValue();((android.view.ViewTreeObserver.OnPreDrawListener)binding).onPreDraw();View overlay=(View)((java.lang.ref.WeakReference<?>)field(field(binding,"header"),"row")).get();check((overlay.getVisibility()==View.VISIBLE)==(nativeItem==replacement),"Recycled navigation views show the photo only on the account item");}
        SurfaceChecks.call(host,"stop");check(field(host,"observer")==null,"Stopped navigation host removes its global layout listener");
        View.OnAttachStateChangeListener lifecycle=(View.OnAttachStateChangeListener)controller;lifecycle.onViewDetachedFromWindow(item);check(field(controller,"observer")==null,"Detached account pill releases its pre-draw observer");
    }
    static void asyncProfileChecks(String[] args,Class<?> patches,Method bind,Object reddit,Object home,Class<?> model)throws Exception {
        Object cache=staticField(patches,"CACHE");cache.getClass().getMethod("evictAll").invoke(cache);urls.clear();setUser(reddit,"FirstLaunchAccount");
        Bitmap original=Bitmap.createBitmap(8,8,Bitmap.Config.ARGB_8888);original.eraseColor(Color.CYAN);java.io.ByteArrayOutputStream bytes=new java.io.ByteArrayOutputStream();original.compress(Bitmap.CompressFormat.PNG,100,bytes);original.recycle();String uri="data:image/png;base64,"+android.util.Base64.encodeToString(bytes.toByteArray(),android.util.Base64.NO_WRAP);
        Class<?> mapper=Class.forName("com.fasterxml.jackson.databind.ObjectMapper",true,loader),node=Class.forName("com.fasterxml.jackson.databind.JsonNode",true,loader);Object json=mapper.getMethod("readTree",String.class).invoke(mapper.getConstructor().newInstance(),"{\"name\":\"FirstLaunchAccount\",\"subreddit\":{\"icon_img\":\""+uri+"\"}}");
        Object profile=Class.forName("net.dean.jraw.models.LoggedInAccount",true,loader).getConstructor(node).newInstance(json);Field profileField=Class.forName("pd2",true,loader).getField("j");profileField.set(reddit,profile);
        Method url=patches.getDeclaredMethod("accountUrl",Context.class,String.class);url.setAccessible(true);check(uri.equals(url.invoke(null,context,"FirstLaunchAccount")),"Cold launch reads the native loaded account profile without an avatar preference or feed refresh");check(url.invoke(null,context,"DifferentAccount").equals(""),"Late profile from another account cannot supply the current avatar");
        RelativeLayout first=(RelativeLayout)StyleChecks.inflate("spinner_subscription_toolbar");bind.invoke(null,home,first);ImageView image=avatar(first);Object header=((Map<?,?>)staticField(patches,"HEADERS")).get(first);
        check(field(header,"url").equals(uri) && field(header,"pending").equals(true),"First-launch profile starts a real native asynchronous Glide load");
        android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());long deadline=android.os.SystemClock.uptimeMillis()+8000;
        handler.post(new Runnable(){public void run(){try{
            Bitmap owned=(Bitmap)field(image,"owned");if(owned==null){if(android.os.SystemClock.uptimeMillis()>deadline)throw new AssertionError("Native asynchronous avatar did not decode");handler.postDelayed(this,25);return;}
            check(owned.getPixel(owned.getWidth()/2,owned.getHeight()/2)==Color.CYAN && !((Boolean)field(header,"pending")),"Actual native Glide asynchronously decodes and displays the account image without refreshing");
            try{Class<?> insets=Class.forName("app.morphe.extension.boost.utils.BoostSystemBarInsetsFix",true,loader);Method tint=insets.getDeclaredMethod("tintToolbarTree",View.class,int.class);tint.setAccessible(true);
                measure(first,Math.round(240*context.getResources().getDisplayMetrics().density));tint.invoke(null,first,Color.WHITE);
                Bitmap rendered=Bitmap.createBitmap(image.getWidth(),image.getHeight(),Bitmap.Config.ARGB_8888);image.draw(new Canvas(rendered));int center=rendered.getPixel(rendered.getWidth()/2,rendered.getHeight()/2);rendered.recycle();
                System.out.println("MIXED AVATAR PIXEL after actual toolbar tint: "+Integer.toHexString(center));
                check(center==Color.CYAN,"Other-source recursive toolbar tint preserves the actual rendered account photo");
            }catch(ClassNotFoundException absent){System.out.println("INFO: other-source toolbar tint absent from original-only fixture");}
            measure(first,Math.round(240*context.getResources().getDisplayMetrics().density));
            image.setColorFilter(Color.WHITE,android.graphics.PorterDuff.Mode.SRC_IN);image.setImageTintList(android.content.res.ColorStateList.valueOf(Color.WHITE));image.getDrawable().setTint(Color.WHITE);image.getDrawable().setColorFilter(new android.graphics.PorterDuffColorFilter(Color.WHITE,android.graphics.PorterDuff.Mode.SRC_IN));
            Bitmap pixels=Bitmap.createBitmap(image.getWidth(),image.getHeight(),Bitmap.Config.ARGB_8888);image.draw(new Canvas(pixels));check(pixels.getPixel(pixels.getWidth()/2,pixels.getHeight()/2)==Color.CYAN,"Avatar pixels resist ImageView and direct drawable icon tints");pixels.recycle();
            Object manager=Class.forName("app.morphe.extension.boost.HomeAvatarTweaks",true,loader).getDeclaredMethod("manager",Context.class);((Method)manager).setAccessible(true);Object requests=((Method)manager).invoke(null,context);requests.getClass().getMethod("o",View.class).invoke(requests,image);
            check(((BitmapDrawable)image.getDrawable()).getBitmap()==owned && owned.getPixel(owned.getWidth()/2,owned.getHeight()/2)==Color.CYAN,"Native Glide clear releases its resource while the owned avatar stays intact");
            RelativeLayout replacement=(RelativeLayout)StyleChecks.inflate("spinner_subscription_toolbar");bind.invoke(null,home,replacement);ImageView restored=avatar(replacement);check(((BitmapDrawable)restored.getDrawable()).getBitmap()==owned,"Recreated title row immediately restores the cached owned image after navigating away");
            Class<?> activityType=Class.forName("com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditActivity",true,loader);android.app.Activity activity=(android.app.Activity)activityType.getConstructor().newInstance();Field base=ContextWrapper.class.getDeclaredField("mBase");base.setAccessible(true);base.set(activity,context);
            RuntimeUiChecks.FakeWindow window=new RuntimeUiChecks.FakeWindow(context);DownloadControlsChecks.set(activity,"mWindow",window);DownloadControlsChecks.set(activity,"O",home);window.decor.addView(replacement,new android.widget.FrameLayout.LayoutParams(-1,-2));
            app.lifecycle.onActivityResumed(activity);check(((BitmapDrawable)restored.getDrawable()).getBitmap()==owned,"Real native Activity resume restores a recreated toolbar without manual refresh");
            View.OnAttachStateChangeListener lifecycle=(View.OnAttachStateChangeListener)header;lifecycle.onViewDetachedFromWindow(first);lifecycle.onViewAttachedToWindow(first);check(((BitmapDrawable)image.getDrawable()).getBitmap()==owned,"Detach/reattach keeps the avatar without a feed refresh");
            Bitmap nativeBitmap=Bitmap.createBitmap(4,4,Bitmap.Config.ARGB_8888);nativeBitmap.eraseColor(Color.MAGENTA);accept(image,new BitmapDrawable(context.getResources(),nativeBitmap));Bitmap protectedCopy=((BitmapDrawable)image.getDrawable()).getBitmap();nativeBitmap.eraseColor(Color.WHITE);nativeBitmap.recycle();check(protectedCopy.getPixel(0,0)==Color.MAGENTA && !protectedCopy.isRecycled(),"Avatar owns a copy: recycled/reused Glide bitmap cannot turn it white");
            Object community=model.getConstructor(String.class).newInstance("Metroid");model.getField("C").set(community,uri);RelativeLayout communityRow=(RelativeLayout)StyleChecks.inflate("spinner_subscription_toolbar");bind.invoke(null,community,communityRow);Object communityHeader=((Map<?,?>)staticField(patches,"HEADERS")).get(communityRow);check(field(communityHeader,"url").equals(uri) && field(communityHeader,"identity").equals("sub:metroid"),"Compact subreddit title loads the native community icon with a separate cache identity");
            Bitmap white=Bitmap.createBitmap(2,2,Bitmap.Config.ARGB_8888);white.eraseColor(Color.WHITE);image.setImageDrawable(new BitmapDrawable(context.getResources(),white));check(((BitmapDrawable)image.getDrawable()).getBitmap()==protectedCopy,"A white bitmap loading placeholder is ignored without a successful resource callback");white.recycle();
            String cleaned="https://example.invalid/avatar.png?a=1&b=2";Method clean=patches.getDeclaredMethod("clean",Context.class,String.class);clean.setAccessible(true);check(clean.invoke(null,context,"https://example.invalid/avatar.png?a=1&amp;b=2").equals(cleaned),"Avatar URLs use the native HTML-unescape path");
            navigationChecks(patches,reddit);
            Class.forName("pd2",true,loader).getField("r").set(null,null);System.out.println("HOME AVATAR CHECKS PASSED: "+checks);System.exit(0);
        }catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}});
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
