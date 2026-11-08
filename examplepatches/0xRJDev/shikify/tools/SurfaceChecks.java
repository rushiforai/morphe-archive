import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

/** Native launch themes/layouts and rendered opaque dimming. No installed app data. */
public final class SurfaceChecks {
    static int checks;static Context context;static ClassLoader loader;
    static final Map<String,String> values=new HashMap<>();
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object field(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static Object call(Object object,String name,Object... args)throws Exception{for(Method method:object.getClass().getDeclaredMethods())if(method.getName().equals(name) && method.getParameterCount()==args.length){method.setAccessible(true);return method.invoke(object,args);}throw new NoSuchMethodException(name);}
    public static final class CaptureWindow extends RuntimeUiChecks.FakeWindow {
        int status=Color.RED,navigation=Color.BLUE,blurCalls;
        Drawable background;
        CaptureWindow(Context context){super(context);}
        @Override public void setStatusBarColor(int color){status=color;}
        @Override public int getStatusBarColor(){return status;}
        @Override public void setNavigationBarColor(int color){navigation=color;}
        @Override public int getNavigationBarColor(){return navigation;}
        @Override public void setBackgroundDrawable(Drawable value){background=value;}
        @Override public void setBackgroundBlurRadius(int radius){blurCalls++;}
    }
    public static final class ScreenActivity extends RuntimeUiChecks.FakeActivity {
        public View appBarLayout,toolbar,collapsingToolbarLayout,protectionLayout,bottomBar;
        ScreenActivity(Context base)throws Exception{super(base);window=new CaptureWindow(base);}
        @Override public Object getSystemService(String name){return getBaseContext().getSystemService(name);}
    }
    static Object screen(ScreenActivity activity,boolean media)throws Exception{
        Class<?> type=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks$Screen",true,loader);Constructor<?> ctor=type.getDeclaredConstructor(Activity.class,boolean.class);ctor.setAccessible(true);return ctor.newInstance(activity,media);
    }
    static FrameLayout content(ScreenActivity activity){FrameLayout content=new FrameLayout(context);content.setId(android.R.id.content);((CaptureWindow)activity.window).decor.addView(content,new FrameLayout.LayoutParams(-1,-1));return content;}
    static void run(String[] args)throws Exception {
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();Context base=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);
        SharedPreferences prefs=(SharedPreferences)Proxy.newProxyInstance(loader,new Class<?>[]{SharedPreferences.class},(p,m,a)->{
            if(m.getName().equals("getBoolean") && values.containsKey(a[0]))return Boolean.parseBoolean(values.get(a[0]));if(m.getName().equals("getString"))return values.getOrDefault((String)a[0],(String)a[1]);if(m.getName().equals("getAll"))return new HashMap<>(values);if(m.getName().equals("contains"))return values.containsKey(a[0]);if(a!=null && a.length==2)return a[1];return null;
        });
        context=new ContextWrapper(base){@Override public SharedPreferences getSharedPreferences(String name,int mode){return prefs;}
            @Override public Object getSystemService(String name){if(name.equals("captioning") || name.equals("autofill") || name.equals("content_capture"))return null;
                if(name.equals(Context.LAYOUT_INFLATER_SERVICE))return android.view.LayoutInflater.from(getBaseContext()).cloneInContext(this);
                return super.getSystemService(name);}};
        for(String array:new String[]{"shikify_surface_treatment_titles","shikify_surface_treatment_values","shikify_dim_opacity_titles","shikify_dim_opacity_values"}){
            int id=context.getResources().getIdentifier(array,"array",context.getPackageName());check(id!=0 && context.getResources().getStringArray(id).length>=2,"Native dimming array exists: "+array);
        }
        for(String name:new String[]{"pref_appearance","pref_appearance_v2"}){
            android.content.res.XmlResourceParser parser=context.getResources().getXml(context.getResources().getIdentifier(name,"xml",context.getPackageName()));int found=0;boolean blur=false;
            while(parser.next()!=org.xmlpull.v1.XmlPullParser.END_DOCUMENT)if(parser.getEventType()==org.xmlpull.v1.XmlPullParser.START_TAG && "ListPreference".equals(parser.getName())){
                String key=parser.getAttributeValue("http://schemas.android.com/apk/res/android","key");if(key!=null && key.startsWith("shikify_")){found++;blur|=key.contains("blur") || key.equals("shikify_surface_style");}
            }
            parser.close();check(found==0 && !blur,"Appearance leaves Shikify controls in the dedicated settings pages: "+name);
            parser=context.getResources().getXml(context.getResources().getIdentifier(name,"xml",context.getPackageName()));int toggles=0;
            while(parser.next()!=org.xmlpull.v1.XmlPullParser.END_DOCUMENT)if(parser.getEventType()==org.xmlpull.v1.XmlPullParser.START_TAG && "CheckBoxPreference".equals(parser.getName()) && "shikify_feed_pill_blur".equals(parser.getAttributeValue("http://schemas.android.com/apk/res/android","key"))){check("true".equals(parser.getAttributeValue("http://schemas.android.com/apk/res/android","defaultValue")),"Feed blur toggle defaults on: "+name);toggles++;}
            parser.close();check(toggles==0,"Appearance has no duplicate Shikify glass toggle: "+name);
        }
        // ActivityRecord uses launch ActivityInfo, not a later runtime setTheme.
        android.content.pm.PackageInfo archive=context.getPackageManager().getPackageArchiveInfo(args[0],android.content.pm.PackageManager.GET_ACTIVITIES);
        int tested=0;
        for(android.content.pm.ActivityInfo info:archive.activities){String shortName=info.name.substring(info.name.lastIndexOf('.')+1);
            if(!java.util.List.of("MediaImageActivity","MediaVideoActivity","GalleryImgurActivity","GalleryCommentsActivity","GalleryXkcdActivity","GalleryRedditActivity","GalleryDeviantActivity").contains(shortName))continue;
            android.content.res.Resources.Theme theme=context.getResources().newTheme();theme.applyStyle(info.getThemeResource(),true);
            android.content.res.TypedArray attrs=theme.obtainStyledAttributes(new int[]{android.R.attr.windowIsTranslucent,android.R.attr.windowIsFloating});
            check(attrs.getBoolean(0,false) && !attrs.getBoolean(1,false),shortName+": actual media launch theme is translucent without floating-dialog sizing");attrs.recycle();tested++;
        }
        check(tested==7,"All seven single-image/video/gallery manifest themes were checked");
        Class<?> tweaks=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks",true,loader);
        for(boolean night:new boolean[]{true,false}){
            Context themed=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],night);
            // Deliberately invert system night: app-selected palette owns chrome contrast.
            themed.getResources().getConfiguration().uiMode=night ? 0x10:0x20;
            boolean actual=(Boolean)callStatic(tweaks,"dark",themed);check(actual==night,"App-selected "+(night ? "dark":"light")+" palette wins over system night mode");
            int color=(Integer)callStatic(tweaks,"role",themed,false),text=(Integer)callStatic(tweaks,"foreground",themed,false);
            check(Math.abs(brightness(color)-brightness(text))>140,"Wallpaper surface and text have clear contrast in "+(night ? "dark":"light")+" mode");
        }
        ScreenActivity activity=new ScreenActivity(context);CaptureWindow window=(CaptureWindow)activity.window;FrameLayout content=content(activity);
        ViewGroupParts parts=new ViewGroupParts(context,activity,content);DownloadControlsChecks.context=context;DownloadControlsChecks.measure(window.decor);
        // Stale 1.12 preferences must not resurrect transparent/frosted surfaces.
        values.put("shikify_surface_style","frosted");values.put("shikify_surface_opacity","20");Object screen=screen(activity,false);call(screen,"resume");
        check(field(screen,"appliedStyle").equals("dimmed") && (Integer)field(screen,"appliedOpacity")==70,"Old frost/transparent settings do not override the new dimmed default");
        check(window.status==Color.TRANSPARENT && window.navigation==Color.TRANSPARENT,"Both system bars use the app-owned dimmed inset surfaces");
        check(((Drawable)field(screen,"status")) instanceof ColorDrawable && Color.alpha(((ColorDrawable)field(screen,"status")).getColor())==0,"Status overlay stays transparent");
        check(((Drawable)field(screen,"status")).getBounds().isEmpty(),"No opaque status-bar rectangle covers app content");
        check((window.decor.getSystemUiVisibility()&View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)==0,"Dark app uses light system-bar icons");
        check(parts.nav.getBackground() instanceof android.graphics.drawable.GradientDrawable && parts.nav.getClipToOutline(),"Home navigation uses a clipped rounded pill surface");
        android.view.ViewGroup.MarginLayoutParams pillMargins=(android.view.ViewGroup.MarginLayoutParams)parts.nav.getLayoutParams();
        check(pillMargins.leftMargin>0 && pillMargins.rightMargin==pillMargins.leftMargin && pillMargins.bottomMargin>0,"Home pill floats clear of the screen sides and bottom");
        Drawable pillBackground=parts.nav.getBackground();call(screen,"updateBounds");check(parts.nav.getBackground()==pillBackground,"Stable navigation layout reuses its pill drawable");
        check(parts.toolbar.getBackground().getClass().getName().endsWith("HeaderGradient$Slice"),"Top toolbar uses a transparent gradient without backdrop blur");
        for(int i=0;i<parts.toolbar.getChildCount();i++)if(parts.toolbar.getChildAt(i) instanceof android.widget.TextView)check(brightness(((android.widget.TextView)parts.toolbar.getChildAt(i)).getCurrentTextColor())>150,"Comments header title/subtitle stay readable against the dark surface");
        call(screen,"pause");check(field(screen,"observer")==null && !(Boolean)field(screen,"active"),"Paused screen removes its single layout observer");call(screen,"dispose");
        // The unused GONE WebView cannot initialize its provider under isolated shell attribution.
        StyleChecks.omitWebView=true;StyleChecks.omitProgressSpinner=true;
        for(String layout:new String[]{"activity_media_image","activity_media_video","activity_album"}){
            StyleChecks.context=context;View nativeRoot=StyleChecks.inflate(layout);ScreenActivity viewer=new ScreenActivity(context);FrameLayout host=content(viewer);host.addView(nativeRoot,new FrameLayout.LayoutParams(-1,-1));
            viewer.toolbar=StyleChecks.find(nativeRoot,layout.equals("activity_album") ? "my_awesome_toolbar":"toolbar");viewer.bottomBar=StyleChecks.find(nativeRoot,"bottom_bar");
            Drawable nativeControlsBackground=viewer.bottomBar==null ? null:viewer.bottomBar.getBackground();
            Object viewerScreen=screen(viewer,true);call(viewerScreen,"resume");if(layout.equals("activity_media_video"))check(viewer.bottomBar.getBackground()==nativeControlsBackground && !viewer.bottomBar.getClipToOutline(),"Video retains its native rectangular gradient instead of a rounded playback panel");CaptureWindow mediaWindow=(CaptureWindow)viewer.window;
            check(nativeRoot.getBackground()==null && mediaWindow.background.getOpacity()==PixelFormat.TRANSLUCENT,layout+": native black root removed and window mask remains translucent");
            check(mediaWindow.blurCalls==0,layout+": no window blur requested");
            Object backdrop=mediaWindow.background;
            Drawable drawable=(Drawable)backdrop;drawable.setBounds(0,0,256,256);Bitmap render=Bitmap.createBitmap(256,256,Bitmap.Config.ARGB_8888);drawable.draw(new Canvas(render));
            check(Color.alpha(render.getPixel(40,40))>120 && Color.alpha(render.getPixel(40,40))<240,layout+": dim mask leaves the actual Activity visible underneath");
            values.put("shikify_surface_treatment","solid");call(viewerScreen,"apply");render.eraseColor(Color.MAGENTA);drawable.draw(new Canvas(render));check(render.getPixel(40,40)==(Integer)field(backdrop,"color"),layout+": Solid suppresses screenshot backdrop");values.remove("shikify_surface_treatment");if(layout.equals("activity_media_video"))check(viewer.bottomBar.getBackground()==nativeControlsBackground,"Changing media dimming does not reintroduce a rounded playback panel");
            call(viewerScreen,"dispose");check(java.util.Arrays.stream(backdrop.getClass().getDeclaredFields()).noneMatch(f->f.getType()==Bitmap.class),layout+": viewer retains no screenshot bitmap");render.recycle();
        }
        StyleChecks.context=context;View page=StyleChecks.inflate("fragment_image_model");
        check(page.getBackground() instanceof ColorDrawable && Color.alpha(((ColorDrawable)page.getBackground()).getColor())==0,"Late-inflated gallery page XML cannot restore the black backdrop");
        blurChecks(args);
        for(String layout:new String[]{"activity_subreddit","activity_comments"})headerChecks(layout);
        for(String layout:new String[]{"activity_subreddit_collapsing_left","activity_subreddit_collapsing_center"}){
            View expanded=StyleChecks.inflate(layout);DownloadControlsChecks.context=context;DownloadControlsChecks.measure(expanded);View header=StyleChecks.find(expanded,"header_content"),toolbar=StyleChecks.find(expanded,"toolbar");
            check(((android.view.ViewGroup.MarginLayoutParams)header.getLayoutParams()).topMargin==0,layout+": banner returns beneath the transparent expanded toolbar");
            check(header.getTop()==toolbar.getTop(),layout+": expanded banner and toolbar share the top edge");
            verifyCollapse(expanded,layout);
        }
        unifiedChecks(args);
        Class<?> backdropType=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks$Backdrop",true,loader);Constructor<?> make=backdropType.getDeclaredConstructor(int.class,int.class);make.setAccessible(true);Drawable preview=(Drawable)make.newInstance(0xff20282a,70);
        Bitmap pattern=Bitmap.createBitmap(256,128,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(pattern);canvas.drawColor(Color.LTGRAY);android.graphics.Paint paint=new android.graphics.Paint();paint.setColor(Color.CYAN);canvas.drawRect(0,0,128,128,paint);pattern.recycle();preview.setBounds(0,0,256,128);Bitmap image=Bitmap.createBitmap(256,128,Bitmap.Config.ARGB_8888);preview.draw(new Canvas(image));
        if(args.length>2)try(java.io.OutputStream out=new java.io.FileOutputStream(args[2]+"/surface-dim-preview.png")){image.compress(Bitmap.CompressFormat.PNG,100,out);}image.recycle();call(preview,"release");
        verifyReplyAndCorner(args);
        System.out.println("SURFACE CHECKS PASSED: "+checks);System.exit(0);
    }
    static void unifiedChecks(String[] args)throws Exception {
        // Shell app_process has no app attribution for DeviceConfig. Disable smart
        // selection in this isolated process only; retain actual selectable widgets.
        Class<?> constants=Class.forName("android.view.textclassifier.TextClassificationConstants");Field memo=constants.getDeclaredField("sMemoizedValuesInitialized");memo.setAccessible(true);memo.setBoolean(null,true);
        // Inflate its actual child XML/widgets without the enclosing view's Firebase
        // remote-config startup; application services do not run in this harness.
        StyleChecks.omitProfileServices=true;
        Class<?> surfaces=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks",true,loader),chrome=Class.forName("app.morphe.extension.boost.UnifiedChromeTweaks",true,loader);
        for(String name:new String[]{"UserActivity","SearchGenericActivity","GoToGenericActivity"}){
            String owner=name.equals("UserActivity") ? "com.rubenmayayo.reddit.ui.profile.":"com.rubenmayayo.reddit.ui.search.";Activity activity=(Activity)Class.forName(owner+name,true,loader).getConstructor().newInstance();Field base=ContextWrapper.class.getDeclaredField("mBase");base.setAccessible(true);base.set(activity,context);CaptureWindow window=new CaptureWindow(context);DownloadControlsChecks.set(activity,"mWindow",window);FrameLayout content=new FrameLayout(context);content.setId(android.R.id.content);window.decor.addView(content,new FrameLayout.LayoutParams(-1,-1));View page=StyleChecks.inflate(name.equals("UserActivity") ? "activity_user":"activity_search_generic");content.addView(page,new FrameLayout.LayoutParams(-1,-1));DownloadControlsChecks.context=context;DownloadControlsChecks.measure(window.decor);
            View input=StyleChecks.find(page,"toolbar_search");int ime=input instanceof android.widget.EditText ? ((android.widget.EditText)input).getImeOptions():0;android.view.View.OnClickListener click=v->{};if(input!=null)input.setOnClickListener(click);
            Object screen=callStatic(surfaces,"attach",activity);check(screen!=null,name+": native screen participates in shared chrome");call(screen,"resume");for(int pass=0;pass<2;pass++){DownloadControlsChecks.measure(window.decor);call(screen,"onGlobalLayout");}
            check(StyleChecks.find(page,"toolbar").getBackground().getClass().getName().endsWith("HeaderGradient$Slice"),name+": native toolbar uses the common gradient");
            Object unified=field(screen,"unifiedChrome");check(unified!=null,name+": native search/profile controller is installed");
            if(input instanceof android.widget.EditText){android.widget.EditText edit=(android.widget.EditText)input;check(edit.getBackground() instanceof android.graphics.drawable.GradientDrawable && edit.getMinHeight()>=Math.round(48*context.getResources().getDisplayMetrics().density),name+": search entry is a 48dp themed pill");check(edit.getImeOptions()==ime && edit.hasOnClickListeners(),name+": native IME options and callbacks remain");Drawable stable=edit.getBackground();call(unified,"update");check(edit.getBackground()==stable,name+": repeated layouts reuse the search surface");
                ViewGroup list=(ViewGroup)StyleChecks.find(page,"recyclerview");Class<?> rv=Class.forName("androidx.recyclerview.widget.RecyclerView",true,loader),manager=Class.forName("androidx.recyclerview.widget.RecyclerView$m",true,loader);Object linear=Class.forName("androidx.recyclerview.widget.LinearLayoutManager",true,loader).getConstructor().newInstance();rv.getMethod("setLayoutManager",manager).invoke(list,linear);View row=StyleChecks.inflate("item_search_option");int[] hits={0};row.setOnClickListener(v->hits[0]++);list.addView(row);call(unified,"update");check(row.getBackground() instanceof android.graphics.drawable.GradientDrawable && row.getClipToOutline(),name+": native destination rows receive rounded themed cards");row.performClick();check(hits[0]==1,name+": destination row retains its original action");
            }else{View tabs=StyleChecks.find(page,"tabs");check(tabs.getBackground() instanceof android.graphics.drawable.GradientDrawable && ((android.view.ViewGroup.MarginLayoutParams)tabs.getLayoutParams()).leftMargin>0,"Profile tabs use an inset rounded surface");ImageView banner=(ImageView)StyleChecks.find(page,"user_info_banner");int fallback=context.getResources().getIdentifier("trianglespattern75","drawable",context.getPackageName());banner.setImageResource(fallback);call(unified,"update");check(banner.getDrawable()==null,"Profile stock geometric banner fallback becomes a wallpaper-toned surface");Bitmap photo=Bitmap.createBitmap(8,8,Bitmap.Config.ARGB_8888);photo.eraseColor(Color.MAGENTA);banner.setImageDrawable(new android.graphics.drawable.BitmapDrawable(context.getResources(),photo));Drawable real=banner.getDrawable();call(unified,"update");check(banner.getDrawable()==real,"Real profile banner images are preserved");}
            call(screen,"dispose");
        }
        View row=StyleChecks.inflate("row_comment_title");row.setLayoutParams(new FrameLayout.LayoutParams(-1,-2));StyleChecks.Holder holder=StyleChecks.comment(row);int[] clicks={0};row.setOnClickListener(v->clicks[0]++);chrome.getMethod("onProfileCommentBound",Object.class).invoke(null,holder);check(row.getClipToOutline() && row.getBackground() instanceof android.graphics.drawable.GradientDrawable,"Profile comments use the shared rounded card surface");check(holder.authorTv.getParent()==holder.scoreTv.getParent() && holder.timeTv.getParent()==holder.authorTv.getParent() && holder.scoreTv.getText().toString().contains("points"),"Profile comments receive the same compact author/points/time metadata");Drawable stable=row.getBackground();holder.scoreTv.setText("7");chrome.getMethod("onProfileCommentBound",Object.class).invoke(null,holder);row.performClick();check(row.getBackground()==stable && holder.scoreTv.getText().toString().equals("7 points") && clicks[0]==1,"Profile comment recycling updates score and preserves card/action identity");
        for(String layout:new String[]{"activity_media_image","activity_media_video","activity_album"}){View body=StyleChecks.inflate(layout);int children=((ViewGroup)body).getChildCount();ScreenActivity activity=new ScreenActivity(context);FrameLayout content=content(activity);content.addView(body,new FrameLayout.LayoutParams(-1,-1));content.setPadding(7,80,9,23);body.setPadding(3,80,5,11);Object screen=screen(activity,true);call(screen,"resume");check(body.findViewWithTag("app.shikify.media.top.gradient")==null && ((ViewGroup)body).getChildCount()==children,layout+": transparent viewer top adds no gradient or extra child");check(content.getPaddingTop()==0 && body.getPaddingTop()==0 && content.getPaddingBottom()==23 && content.getPaddingLeft()==7,layout+": image extends behind status while bottom/side insets remain");content.setPadding(7,80,9,23);call(screen,"onPreDraw");check(content.getPaddingTop()==0,layout+": delayed safe-area top padding cannot restore a solid status strip");View toolbar=StyleChecks.find(body,layout.equals("activity_album") ? "my_awesome_toolbar":"toolbar");toolbar.setBackgroundColor(Color.BLACK);call(screen,"onPreDraw");check(toolbar.getBackground()==null,layout+": native toolbar cannot restore its old gradient or solid background");View decor=((CaptureWindow)activity.window).decor;decor.setSystemUiVisibility(decor.getSystemUiVisibility()|View.SYSTEM_UI_FLAG_FULLSCREEN);call(screen,"onPreDraw");check(body.findViewWithTag("app.shikify.media.top.gradient")==null,layout+": fullscreen remains clear of decorative shading");call(screen,"dispose");check(((ViewGroup)body).getChildCount()==children,layout+": disposal preserves all native viewer children");}
    }
    static float origin(View view){float value=view.getPaddingTop();while(view!=null){value+=view.getTop()+view.getTranslationY();view=view.getParent() instanceof View ? (View)view.getParent():null;if(view!=null)value-=view.getScrollY();}return value;}
    static void headerChecks(String layout)throws Exception {
        StyleChecks.context=context;View nativeRoot=StyleChecks.inflate(layout);ScreenActivity activity=new ScreenActivity(context);CaptureWindow window=(CaptureWindow)activity.window;content(activity).addView(nativeRoot,new FrameLayout.LayoutParams(-1,-1));
        android.view.ViewGroup frame=(android.view.ViewGroup)StyleChecks.find(nativeRoot,"fragment_container");frame.addView(StyleChecks.inflate(layout.equals("activity_comments") ? "fragment_comments":"fragment_submission_list"),new FrameLayout.LayoutParams(-1,-1));
        activity.appBarLayout=StyleChecks.find(nativeRoot,"appbar");activity.toolbar=StyleChecks.find(nativeRoot,"toolbar");activity.protectionLayout=nativeRoot;
        DownloadControlsChecks.measure(window.decor);View list=StyleChecks.find(frame,"recyclerview");int oldPadding=list.getPaddingTop();float before=origin(list);
        View legacy=new View(context);legacy.setTag("MORPHE_BOOST_COMMENTS_SYSTEM_BAR_SURFACE_V1");legacy.setBackgroundColor(Color.WHITE);window.decor.addView(legacy,new FrameLayout.LayoutParams(-1,40));
        Object screen=screen(activity,false);call(screen,"resume");for(int pass=0;pass<3;pass++){DownloadControlsChecks.measure(window.decor);call(screen,"onGlobalLayout");}
        Object header=field(screen,"headerGradient");check(header!=null && (Boolean)field(header,"enabled"),layout+": native scrolling content uses the gradient header");
        check(Math.abs(origin(list)-before)<2,layout+": native overlap preserves initial first-row position");check(list.getPaddingTop()==oldPadding+activity.appBarLayout.getMeasuredHeight(),layout+": header inset is applied exactly once");
        Object shade=field(header,"shade");call(header,"position",40);check(field(header,"shade")==shade,layout+": toolbar and status reuse one gradient without a capture");
        check(activity.toolbar.getBackground().getClass().getName().endsWith("HeaderGradient$Slice"),layout+": native toolbar controls retain a separate gradient background");
        Drawable gradient=(Drawable)shade;android.graphics.Rect oldBounds=new android.graphics.Rect(gradient.getBounds());gradient.setBounds(0,0,100,200);Bitmap pixels=Bitmap.createBitmap(100,200,Bitmap.Config.ARGB_8888);gradient.draw(new Canvas(pixels));check(Color.alpha(pixels.getPixel(50,1))>230 && Color.alpha(pixels.getPixel(50,120))>220 && Color.alpha(pixels.getPixel(50,199))<5,layout+": stronger gradient holds contrast through the toolbar then fades to transparent");pixels.recycle();gradient.setBounds(oldBounds);
        View strip=StyleChecks.find(nativeRoot,"progress_smooth");if(strip!=null){float offset=strip.getTranslationY();check(offset>=activity.toolbar.getHeight(),layout+": loading strip is placed below the toolbar");for(int i=0;i<40;i++)call(header,"position",40);check(Math.abs(strip.getTranslationY()-offset)<.5f,layout+": repeated frames do not accumulate loading-strip offsets");}
        View swipe=StyleChecks.find(frame,"swipe_refresh_layout");View circle=(View)field(swipe,"N");check(circle.getTranslationY()>=activity.toolbar.getHeight(),layout+": native refresh indicator clears the toolbar while retaining gesture offsets");
        legacy.setVisibility(View.VISIBLE);window.status=Color.WHITE;call(screen,"onPreDraw");check(legacy.getVisibility()==View.GONE && window.status==Color.TRANSPARENT,layout+": late external opaque status strip is suppressed");
        values.put("shikify_feed_pill_blur","false");call(screen,"apply");DownloadControlsChecks.measure(window.decor);check((Boolean)field(header,"enabled") && activity.toolbar.getBackground().getClass().getName().endsWith("HeaderGradient$Slice"),layout+": gradient remains independent of the glass-pill toggle");
        values.remove("shikify_feed_pill_blur");call(screen,"apply");for(int pass=0;pass<2;pass++){DownloadControlsChecks.measure(window.decor);call(screen,"onGlobalLayout");}check(list.getPaddingTop()==oldPadding+activity.appBarLayout.getMeasuredHeight(),layout+": preference changes do not accumulate content padding");
        call(screen,"dispose");check(list.getPaddingTop()==oldPadding && circle.getTranslationY()==0,layout+": disposal restores native padding and refresh position");
    }
    static void verifyCollapse(View root,String layout)throws Exception {
        Class<?> nativeType=Class.forName("com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditActivity",true,loader);Activity activity=(Activity)nativeType.getConstructor().newInstance();java.lang.reflect.Field base=ContextWrapper.class.getDeclaredField("mBase");base.setAccessible(true);base.set(activity,context);
        CaptureWindow window=new CaptureWindow(context);DownloadControlsChecks.set(activity,"mWindow",window);FrameLayout content=new FrameLayout(context);content.setId(android.R.id.content);window.decor.addView(content,new FrameLayout.LayoutParams(-1,-1));content.addView(root,new FrameLayout.LayoutParams(-1,-1));
        View bar=StyleChecks.find(root,"appbar"),toolbar=StyleChecks.find(root,"toolbar"),collapse=StyleChecks.find(root,"collapsing_toolbar"),title=StyleChecks.find(root,"action_bar_title"),banner=StyleChecks.find(root,"header_content");
        ((android.widget.TextView)StyleChecks.find(root,"subreddit_title")).setText("Overwatch");View subscribers=StyleChecks.find(root,"sidebar_subscribers_textview"),description=StyleChecks.find(root,"public_description");subscribers.setVisibility(View.VISIBLE);((android.widget.TextView)subscribers).setText("6,217,810 members · 0 online");description.setVisibility(View.VISIBLE);((android.widget.TextView)description).setText("Subreddit for all things Overwatch and the Overwatch Universe, the team-based shooter from Blizzard Entertainment.");
        android.view.ViewGroup frame=(android.view.ViewGroup)StyleChecks.find(root,"fragment_container");frame.addView(StyleChecks.inflate("fragment_submission_list"),new FrameLayout.LayoutParams(-1,-1));DownloadControlsChecks.context=context;DownloadControlsChecks.measure(window.decor);View list=StyleChecks.find(frame,"recyclerview");float firstRow=origin(list);int nativePadding=list.getPaddingTop(),bannerTop=banner.getTop();
        DownloadControlsChecks.set(activity,"appBarLayout",bar);DownloadControlsChecks.set(activity,"toolbar",toolbar);DownloadControlsChecks.set(activity,"collapsingToolbarLayout",collapse);DownloadControlsChecks.set(activity,"protectionLayout",root);
        Object community=Class.forName("com.rubenmayayo.reddit.models.reddit.SubscriptionViewModel",true,loader).getConstructor(String.class).newInstance("Metroid");View titleRow=(View)((View)title.getParent()).getParent();Class<?> avatars=Class.forName("app.morphe.extension.boost.HomeAvatarTweaks",true,loader);avatars.getMethod("onTitleBind",Object.class,Object.class).invoke(null,community,titleRow);
        android.widget.ImageView icon=HomeAvatarChecks.avatar((android.widget.RelativeLayout)titleRow);
        Class<?> listener=Class.forName("com.google.android.material.appbar.AppBarLayout$g",true,loader);int[] nativeCalls={0};Object sentinel=Proxy.newProxyInstance(loader,new Class<?>[]{listener},(proxy,method,args)->{if(method.getName().equals("equals"))return proxy==args[0];if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);if(method.getName().equals("toString"))return "native sentinel";nativeCalls[0]++;return null;});bar.getClass().getMethod("a",listener).invoke(bar,sentinel);
        Class<?> screenType=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks$Screen",true,loader);Constructor<?> constructor=screenType.getDeclaredConstructor(Activity.class,boolean.class);constructor.setAccessible(true);nativeType.getDeclaredField("F0").setBoolean(activity,false);Object screen=constructor.newInstance(activity,false);call(screen,"resume");
        Object headerGradient=field(screen,"headerGradient");Drawable shade=(Drawable)field(headerGradient,"shade");check(toolbar.getBackground().getClass().getName().endsWith("HeaderGradient$Slice") && shade.getAlpha()==255 && icon.getAlpha()==0,layout+": expanded banner keeps a protective gradient and hidden compact icon");
        Object scrim=collapse.getClass().getMethod("getContentScrim").invoke(collapse);check(scrim instanceof ColorDrawable && Color.alpha(((ColorDrawable)scrim).getColor())==0,layout+": native content scrim cannot become opaque before the compact title");
        java.lang.reflect.Field flag=nativeType.getDeclaredField("F0");flag.setAccessible(true);flag.setBoolean(activity,true);bar.getClass().getMethod("e",int.class).invoke(bar,-200);
        call(screen,"onPreDraw");check(toolbar.getBackground().getClass().getName().endsWith("HeaderGradient$Slice") && shade.getAlpha()==255 && icon.getAlpha()==1,layout+": compact title restores the gradient and shows its native community avatar");
        Drawable stable=toolbar.getBackground();for(int i=0;i<100;i++)bar.getClass().getMethod("e",int.class).invoke(bar,-200-i);
        check(toolbar.getBackground()==stable,layout+": offset callbacks reuse one background drawable without layout churn");
        flag.setBoolean(activity,false);bar.getClass().getMethod("e",int.class).invoke(bar,0);call(screen,"onPreDraw");check(toolbar.getBackground().getClass().getName().endsWith("HeaderGradient$Slice") && shade.getAlpha()==255 && icon.getAlpha()==0,layout+": scrolling back retains gradient contrast without revealing the compact avatar");
        call(screen,"pause");java.util.List<?> callbacks=(java.util.List<?>)field(bar,"C");check(callbacks.size()==1 && callbacks.contains(sentinel),layout+": pause removes only Shikify's offset listener");
        call(screen,"resume");call(screen,"resume");callbacks=(java.util.List<?>)field(bar,"C");check(callbacks.size()==2 && nativeCalls[0]>0,layout+": resume neither duplicates listeners nor replaces native callbacks");
        for(int pass=0;pass<3;pass++){DownloadControlsChecks.measure(window.decor);call(screen,"onGlobalLayout");}Object gradient=field(screen,"headerGradient");check((Boolean)field(gradient,"enabled"),layout+": expanded subreddit supports the gradient with native content");
        check(list.getPaddingTop()==nativePadding+bar.getMeasuredHeight() && Math.abs(origin(list)-firstRow)<2,layout+": overlap compensation preserves the expanded first-post position");
        check(origin(list)>=origin(description)+description.getHeight()+Math.round(12*context.getResources().getDisplayMetrics().density),layout+": a two-line community description clears the posts with a visible gap");
        Object behavior=field(((View)frame.getParent()).getLayoutParams(),"a");check(behavior.getClass().getName().equals("com.google.android.material.search.SearchBar$ScrollingViewBehavior"),layout+": native overlap behavior lets posts pass behind the compact gradient");
        check(banner.getTop()==bannerTop && bannerTop==0 && StyleChecks.find(root,"banner").getTop()==0,layout+": full-width banner fills the top without a toolbar-sized blank area");
        bar.getClass().getMethod("e",int.class).invoke(bar,-100);check(banner.getTop()==bannerTop,layout+": community metadata no longer receives a separate parallax offset over posts");
        flag.setBoolean(activity,true);call(screen,"onPreDraw");check(list.getPaddingTop()==nativePadding+bar.getMeasuredHeight() && toolbar.getBackground()==stable && shade.getAlpha()==255,layout+": compact transition keeps one layout and restores the gradient");
        call(gradient,"update",80);DownloadControlsChecks.measure(window.decor);check(((android.view.ViewGroup.MarginLayoutParams)banner.getLayoutParams()).topMargin==80 && banner.getTop()==80,layout+": real status inset moves the artwork below system icons");
        call(gradient,"update",80);DownloadControlsChecks.measure(window.decor);check(banner.getTop()==80,layout+": repeated status-inset application does not accumulate banner spacing");call(screen,"dispose");check(((android.view.ViewGroup.MarginLayoutParams)banner.getLayoutParams()).topMargin==0,layout+": disposal restores the original banner margin");
    }
    static boolean bannerGradient(Drawable background){if(!(background instanceof android.graphics.drawable.GradientDrawable))return false;int[] colors=((android.graphics.drawable.GradientDrawable)background).getColors();return colors!=null && colors.length==2 && Color.alpha(colors[0])>0 && Color.alpha(colors[1])==0;}
    static final class Stripes extends View {
        boolean changed,testDirty=true;
        final android.graphics.Paint paint=new android.graphics.Paint();
        Stripes(Context context){super(context);}
        @Override public void getLocationInWindow(int[] position){position[0]=getLeft();position[1]=getTop();}
        @Override public boolean isDirty(){return testDirty;}
        @Override protected void onDraw(Canvas canvas){testDirty=false;canvas.drawColor(Color.WHITE);for(int left=0;left<getWidth();left+=4){paint.setColor(changed ? (left%8==0 ? Color.GREEN:Color.YELLOW):(left%8==0 ? Color.RED:Color.BLUE));canvas.drawRect(left,120,left+4,getHeight(),paint);}}
    }
    static Bitmap gpuRender(View root)throws Exception {
        android.media.ImageReader reader=android.media.ImageReader.newInstance(400,300,PixelFormat.RGBA_8888,2,android.hardware.HardwareBuffer.USAGE_GPU_SAMPLED_IMAGE|android.hardware.HardwareBuffer.USAGE_GPU_COLOR_OUTPUT);
        android.graphics.HardwareRenderer renderer=new android.graphics.HardwareRenderer();android.graphics.RenderNode frame=new android.graphics.RenderNode("blur-check");android.media.Image image=null;
        try{
            frame.setPosition(0,0,400,300);Canvas canvas=frame.beginRecording();root.draw(canvas);frame.endRecording();renderer.setSurface(reader.getSurface());renderer.setContentRoot(frame);renderer.createRenderRequest().setWaitForPresent(true).syncAndDraw();
            for(int attempt=0;attempt<20 && image==null;attempt++){image=reader.acquireLatestImage();if(image==null)Thread.sleep(5);}
            if(image==null)throw new AssertionError("GPU renderer produced no image");android.hardware.HardwareBuffer buffer=image.getHardwareBuffer();
            Bitmap hardware=Bitmap.wrapHardwareBuffer(buffer,android.graphics.ColorSpace.get(android.graphics.ColorSpace.Named.SRGB));Bitmap result=hardware.copy(Bitmap.Config.ARGB_8888,false);hardware.recycle();buffer.close();return result;
        }finally{if(image!=null)image.close();renderer.destroy();reader.close();frame.discardDisplayList();}
    }
    static void blurChecks(String[] args)throws Exception {
        FrameLayout root=new FrameLayout(context);Stripes source=new Stripes(context);root.addView(source,new FrameLayout.LayoutParams(-1,-1));
        FrameLayout bar=new FrameLayout(context){@Override public void getLocationInWindow(int[] position){position[0]=getLeft();position[1]=getTop();}};FrameLayout.LayoutParams position=new FrameLayout.LayoutParams(352,64);position.leftMargin=24;position.topMargin=200;root.addView(bar,position);
        View icon=new View(context){final android.graphics.Paint paint=new android.graphics.Paint();@Override protected void onDraw(Canvas canvas){paint.setColor(Color.WHITE);canvas.drawRect(12,12,20,20,paint);}};bar.addView(icon,new FrameLayout.LayoutParams(-1,-1));
        root.measure(View.MeasureSpec.makeMeasureSpec(400,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.EXACTLY));root.layout(0,0,400,300);
        Class<?> type=Class.forName("app.morphe.extension.boost.FeedPillBlur",true,loader);Constructor<?> constructor=type.getDeclaredConstructor(View.class,View.class,int.class);constructor.setAccessible(true);Drawable blur=(Drawable)constructor.newInstance(source,bar,Color.BLACK);bar.setBackground(blur);call(blur,"start");
        call(blur,"onPreDraw");Bitmap first=gpuRender(root);int sample=first.getPixel(160,232);
        check(Color.red(sample)>20 && Color.red(sample)<235 && Color.blue(sample)>20,"GPU blur mixes backdrop stripes beneath the feed pill");
        check(first.getPixel(40,216)==Color.WHITE && first.getPixel(40,211)!=Color.WHITE,"Foreground navigation glyph stays sharp above the blurred backdrop");
        check(first.getPixel(4,230)==Color.BLUE,"Pixels outside the pill retain their original unblurred content");
        int recordings=(Integer)field(blur,"recordings");call(blur,"onPreDraw");Thread.sleep(35);gpuRender(root).recycle();check((Integer)field(blur,"recordings")==recordings,"An unchanged blur frame reuses the recorded backdrop");
        android.graphics.RenderNode recorded=(android.graphics.RenderNode)field(blur,"node");check(recorded.getWidth()<400 && recorded.getHeight()<300,"GPU capture is bounded to a downscaled pill region");
        source.changed=true;source.testDirty=true;source.invalidate();call(blur,"onPreDraw");Thread.sleep(35);Bitmap second=gpuRender(root);
        check(Color.green(second.getPixel(160,232))>110 && (Integer)field(blur,"recordings")>recordings,"Changing feed content refreshes the GPU backdrop");
        check(field(blur,"refraction")!=null,"Android 13+ glass shader compiles on the device GPU");
        int centre=second.getPixel(160,232),edge=second.getPixel(180,201);check(edge!=centre,"Glass rim responds to background detail independently of the frosted centre");
        check(first.getPixel(180,201)!=edge,"Changing the backdrop changes the glass edge colour");
        android.graphics.RuntimeShader shader=(android.graphics.RuntimeShader)field(field(blur,"refraction"),"shader");shader.setFloatUniform("bend",0);
        ((android.graphics.RenderNode)field(blur,"edgeNode")).setRenderEffect(android.graphics.RenderEffect.createRuntimeShaderEffect(shader,"image"));
        Bitmap flat=gpuRender(root);int refractedPixels=0;for(int row=200;row<264;row++)for(int column=24;column<376;column++)if(flat.getPixel(column,row)!=second.getPixel(column,row))refractedPixels++;
        check(refractedPixels>20,"Refractive edge changes actual backdrop pixels compared with a zero-bend shader");flat.recycle();
        if(args.length>2)try(java.io.OutputStream output=new java.io.FileOutputStream(args[2]+"/feed-blur-preview.png")){second.compress(Bitmap.CompressFormat.PNG,100,output);}
        first.recycle();second.recycle();Bitmap beforeFreeze=gpuRender(root);int cached=beforeFreeze.getPixel(160,232);beforeFreeze.recycle();int freezeRecords=(Integer)field(blur,"recordings");call(blur,"freeze");source.changed=!source.changed;source.testDirty=true;source.invalidate();call(blur,"onPreDraw");Bitmap frozen=gpuRender(root);
        check(!(Boolean)field(blur,"running") && (Boolean)field(blur,"frozen") && (Integer)field(blur,"recordings")==freezeRecords,"Fading glass freezes its last GPU frame without capture observers or rerecording");
        check(frozen.getPixel(160,232)==cached,"Frozen glass remains rendered after the source changes instead of disappearing");frozen.recycle();call(blur,"start");gpuRender(root).recycle();check((Boolean)field(blur,"running") && !(Boolean)field(blur,"frozen") && (Integer)field(blur,"recordings")>freezeRecords,"Returning to the feed resumes fresh blur capture");call(blur,"stop");check(!(Boolean)call(field(blur,"node"),"hasDisplayList") && !(Boolean)call(field(blur,"capture"),"hasDisplayList") && !(Boolean)call(field(blur,"edgeNode"),"hasDisplayList"),"Pausing glass discards source, blur and refractive display lists");
        ScreenActivity feed=new ScreenActivity(context);FrameLayout host=content(feed);FrameLayout feedContent=new FrameLayout(context);feedContent.setId(context.getResources().getIdentifier("fragment_container","id",context.getPackageName()));host.addView(feedContent,new FrameLayout.LayoutParams(-1,-1));ViewGroupParts parts=new ViewGroupParts(context,feed,host);parts.nav.setAlpha(.73f);DownloadControlsChecks.measure(feed.window.getDecorView());Object screen=screen(feed,false);call(screen,"resume");Object installed=field(screen,"feedBlur");
        check(installed!=null && parts.nav.getBackground()==installed,"Feed screen installs blur as navigation background only");
        call(screen,"pause");check(!(Boolean)field(installed,"running") && parts.nav.getAlpha()==0,"Feed pause hides the complete pill and removes its blur observer");
        call(screen,"resume");check(field(screen,"feedBlur")==installed && (Boolean)field(installed,"running") && parts.nav.getAlpha()==.73f,"Feed resume reuses blur and restores the native pill alpha");
        values.put("shikify_feed_pill_blur","false");call(screen,"apply");check(parts.nav.getBackground() instanceof android.graphics.drawable.GradientDrawable && !(Boolean)field(installed,"running"),"Disabling feed blur restores the solid pill and stops recording");
        values.remove("shikify_feed_pill_blur");call(screen,"apply");check(parts.nav.getBackground()==installed && (Boolean)field(installed,"running"),"Re-enabling feed blur reuses its controller");call(screen,"dispose");
    }
    static void verifyReplyAndCorner(String[] args)throws Exception {
        Class<?> account=Class.forName("pd2",true,loader);java.lang.reflect.Field singleton=account.getDeclaredField("r");singleton.setAccessible(true);singleton.set(null,StyleChecks.allocate(account));
        View root=StyleChecks.inflate("activity_reply");Class<?> type=Class.forName("com.rubenmayayo.reddit.ui.compose.ReplyActivity",true,loader);Activity activity=(Activity)type.getConstructor().newInstance();java.lang.reflect.Field base=ContextWrapper.class.getDeclaredField("mBase");base.setAccessible(true);base.set(activity,context);
        Class<?> style=Class.forName("app.morphe.extension.boost.UnifiedChromeTweaks$Screen",true,loader);Constructor<?> ctor=style.getDeclaredConstructor(Activity.class,View.class);ctor.setAccessible(true);Object controller=ctor.newInstance(activity,root);
        android.widget.EditText edit=(android.widget.EditText)StyleChecks.find(root,"edit");edit.setText("Draft text remains intact");edit.setSelection(6);View quote=StyleChecks.find(root,"parent_container"),format=StyleChecks.find(root,"formatting_bar");quote.setVisibility(View.VISIBLE);View parentBody=StyleChecks.find(root,"parent_body");parentBody.getClass().getMethod("setTextHtml",String.class).invoke(parentBody,"Quoted parent comment");
        call(controller,"update");
        check(quote.getBackground() instanceof android.graphics.drawable.GradientDrawable && format.getBackground() instanceof android.graphics.drawable.GradientDrawable,"Fullscreen reply quote and formatting controls use rounded tonal surfaces");
        check(edit.getText().toString().equals("Draft text remains intact") && edit.getSelectionStart()==6,"Reply styling preserves draft and cursor position");
        Drawable stable=quote.getBackground();call(controller,"update");check(quote.getBackground()==stable,"Repeated editor layouts reuse styled quote surface");
        ViewGroup outer=new FrameLayout(context);View content=new Stripes(context);content.setId(context.getResources().getIdentifier("recyclerview","id",context.getPackageName()));outer.addView(content,new FrameLayout.LayoutParams(-1,-1));View menu=StyleChecks.inflate("fab_comments");outer.addView(menu,new FrameLayout.LayoutParams(-2,-2,android.view.Gravity.BOTTOM|android.view.Gravity.RIGHT));View button=(View)field(menu,"z");boolean clickable=button.hasOnClickListeners();outer.measure(View.MeasureSpec.makeMeasureSpec(400,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.EXACTLY));outer.layout(0,0,400,300);
        Class<?> cornerType=Class.forName("app.morphe.extension.boost.UnifiedChromeTweaks$Corner",true,loader);Constructor<?> cornerCtor=cornerType.getDeclaredConstructor(View.class,View.class,View.class,boolean.class);cornerCtor.setAccessible(true);Object corner=cornerCtor.newInstance(outer,menu,button,true);call(corner,"start");
        Object shape=button.getClass().getMethod("getShapeAppearanceModel").invoke(button);Object size=field(shape,"e");float fraction=size.getClass().getField("a").getFloat(size);
        check(Math.abs(fraction-.5f)<.001 && button.hasOnClickListeners()==clickable && clickable,"Native plus keeps its menu action and uses relative half-width circle corners");
        check(field(corner,"blur")!=null && menu.getBackground().getClass().getName().endsWith("CircleGlass"),"Comment plus reuses shared glass behind the original native control");
        Bitmap preview=gpuRender(outer);preview.recycle();check((Integer)field(field(corner,"blur"),"recordings")>0,"Circular comment glass records its backdrop on the Android GPU");
        call(corner,"stop");check(!(Boolean)field(field(corner,"blur"),"running"),"Pausing the corner stops glass observation");call(corner,"dispose");
        Object solid=cornerCtor.newInstance(outer,menu,button,false);check(field(solid,"blur")==null,"Disabling glass retains a native circular tonal button");call(solid,"dispose");
    }
    static int brightness(int color){return (Color.red(color)*299+Color.green(color)*587+Color.blue(color)*114)/1000;}
    static Object callStatic(Class<?> type,String name,Object... args)throws Exception{for(Method method:type.getDeclaredMethods())if(method.getName().equals(name)&&method.getParameterCount()==args.length){method.setAccessible(true);return method.invoke(null,args);}throw new NoSuchMethodException(name);}
    static final class ViewGroupParts {
        final FrameLayout nav;final android.view.ViewGroup toolbar;
        ViewGroupParts(Context context,ScreenActivity activity,FrameLayout content)throws Exception{
            FrameLayout bar=new FrameLayout(context);toolbar=(android.view.ViewGroup)Class.forName("androidx.appcompat.widget.Toolbar",true,loader).getConstructor(Context.class,android.util.AttributeSet.class).newInstance(context,null);toolbar.getClass().getMethod("setTitle",CharSequence.class).invoke(toolbar,"r/retroid");toolbar.getClass().getMethod("setSubtitle",CharSequence.class).invoke(toolbar,"Wind Waker");bar.addView(toolbar,new FrameLayout.LayoutParams(-1,150));content.addView(bar,new FrameLayout.LayoutParams(-1,150));activity.appBarLayout=bar;activity.toolbar=toolbar;
            nav=new FrameLayout(context);nav.setId(context.getResources().getIdentifier("bottom_navigation_view","id",context.getPackageName()));content.addView(nav,new FrameLayout.LayoutParams(-1,120,android.view.Gravity.BOTTOM));
        }
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
