import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Native toolbar/action-menu views with local counting listeners; never downloads a file. */
public final class DownloadControlsChecks {
    public static final class CountedRoot extends FrameLayout {
        int locationReads,insetReads;
        CountedRoot(Context context){super(context);}
        @Override public void getLocationOnScreen(int[] location){locationReads++;super.getLocationOnScreen(location);}
        @Override public android.view.WindowInsets getRootWindowInsets(){insetReads++;return super.getRootWindowInsets();}
    }
    static int checks;
    static Context context;
    static ClassLoader loader;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static void set(Object object,String name,Object value)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field f=type.getDeclaredField(name);f.setAccessible(true);f.set(object,value);return;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static int px(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
    static void measure(View view){view.measure(View.MeasureSpec.makeMeasureSpec(px(380),View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(px(760),View.MeasureSpec.EXACTLY));view.layout(0,0,view.getMeasuredWidth(),view.getMeasuredHeight());}
    static boolean descendant(View view,ViewGroup parent){for(android.view.ViewParent next=view.getParent();next!=null;next=next.getParent())if(next==parent)return true;return false;}
    static void run(String[] args)throws Exception {
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();context=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);
        Class<?> tweaks=Class.forName("app.morphe.extension.boost.GalleryBottomActionsTweaks",true,loader);
        Class<?> toolbarType=Class.forName("androidx.appcompat.widget.Toolbar",true,loader);
        Method find=tweaks.getMethod("findActionAnchor",View.class,int.class);
        for(String name:new String[]{"MediaImageActivity","MediaVideoActivity","GalleryRedditActivity"}){
            Class<?> type=Class.forName("com.rubenmayayo.reddit.ui.activities."+name,true,loader);Activity activity=(Activity)type.getConstructor().newInstance();
            Field base=ContextWrapper.class.getDeclaredField("mBase");base.setAccessible(true);base.set(activity,context);
            RuntimeUiChecks.FakeWindow window=new RuntimeUiChecks.FakeWindow(context);set(activity,"mWindow",window);
            CountedRoot content=new CountedRoot(context);content.setId(android.R.id.content);window.decor.addView(content,new FrameLayout.LayoutParams(-1,-1));
            ViewGroup toolbar=(ViewGroup)toolbarType.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(context,null);
            toolbarType.getMethod("setTitle",CharSequence.class).invoke(toolbar,"5/5");content.addView(toolbar,new FrameLayout.LayoutParams(-1,px(56),Gravity.TOP));set(activity,"toolbar",toolbar);
            LinearLayout bottom=new LinearLayout(context);bottom.setOrientation(LinearLayout.VERTICAL);
            TextView playback=new TextView(context);playback.setId(context.getResources().getIdentifier("media_title","id",context.getPackageName()));playback.setText("Native playback / title");bottom.addView(playback,new LinearLayout.LayoutParams(-1,px(56)));
            content.addView(bottom,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));if(!name.startsWith("Gallery"))set(activity,"bottomBar",bottom);
            Menu menu=(Menu)toolbarType.getMethod("getMenu").invoke(toolbar);int download=context.getResources().getIdentifier("action_download","id",context.getPackageName());
            int[] clicks={0};MenuItem item=menu.add(0,download,0,"Download");item.setIcon(android.R.drawable.stat_sys_download);item.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);item.setOnMenuItemClickListener(selected->{clicks[0]++;return true;});
            measure(window.decor);View original=toolbar.findViewById(download);check(original!=null,name+": native toolbar initially contains the download action");
            if(name.equals("MediaImageActivity") || name.startsWith("Gallery")){
                boolean gallery=name.startsWith("Gallery");
                int[] otherClicks={0};
                for(String action:gallery ? new String[]{"action_fit","action_share","action_grid"}:new String[]{"action_fit","action_share"}){
                    int actionId=context.getResources().getIdentifier(action,"id",context.getPackageName());
                    menu.add(0,actionId,0,action).setOnMenuItemClickListener(selected->{otherClicks[0]++;return true;});
                }
                String imageHook=gallery ? "onGalleryCreate":"onImageResume";
                tweaks.getMethod(imageHook,Object.class).invoke(null,activity);content.getViewTreeObserver().dispatchOnPreDraw();measure(window.decor);
                LinearLayout bubble=(LinearLayout)content.findViewWithTag("app.shiki.boost.gallery.actions."+(gallery ? "gallery":"image"));
                check(bubble!=null && bubble.getChildCount()==(gallery ? 4:3),"Image/gallery has only the requested floating controls");
                check(bubble.getBackground().getClass().getName().endsWith("FeedPillBlur"),"Image/gallery uses the shared GPU glass backdrop");
                android.graphics.drawable.Drawable glass=bubble.getBackground();SurfaceChecks.callStatic(tweaks,"glassSurfaces",content,false,true);check(!(Boolean)SurfaceChecks.field(glass,"running"),"Media pause stops glass recording");SurfaceChecks.callStatic(tweaks,"glassSurfaces",content,true,true);check((Boolean)SurfaceChecks.field(glass,"running") && bubble.getBackground()==glass,"Media resume reuses its glass backdrop");
                check(toolbar.getVisibility()==View.GONE && (gallery || bottom.getVisibility()==View.GONE),"Image/gallery hides the top toolbar and full caption/vote footer");
                check(bubble.getWidth()<content.getWidth() && bubble.getLeft()>0,"Image controls float in a compact centred bubble");
                int locationReads=content.locationReads,insetReads=content.insetReads;android.graphics.drawable.Drawable stableBackground=bubble.getBackground();
                for(int frame=0;frame<120;frame++)content.getViewTreeObserver().dispatchOnPreDraw();
                check(content.locationReads==locationReads && content.insetReads==insetReads && bubble.getBackground()==stableBackground,"120 image/gallery draw callbacks reuse geometry and surface without inset/location reads");
                for(int index=0;index<bubble.getChildCount();index++){View button=bubble.getChildAt(index);check(button.getWidth()>=px(48) && button.getHeight()>=px(48),"Image bubble retains accessible button bounds");button.performClick();}
                check(clicks[0]==1 && otherClicks[0]==(gallery ? 3:2),"Fit, share, download and optional grid dispatch their native menu callbacks once");
                if(gallery){int children=content.getChildCount();tweaks.getMethod(imageHook,Object.class).invoke(null,activity);check(children==content.getChildCount(),"Gallery does not duplicate its compact pill");continue;}
                android.widget.ImageView photo=new android.widget.ImageView(context);photo.setId(context.getResources().getIdentifier("image_photoview","id",context.getPackageName()));content.addView(photo,new FrameLayout.LayoutParams(100,100));
                menu.findItem(context.getResources().getIdentifier("action_fit","id",context.getPackageName())).setVisible(false);content.getViewTreeObserver().dispatchOnPreDraw();
                bubble.getChildAt(0).performClick();check(photo.getScaleType()==android.widget.ImageView.ScaleType.CENTER_CROP,"Non-HD image fit action expands to fill");
                bubble.getChildAt(0).performClick();check(photo.getScaleType()==android.widget.ImageView.ScaleType.FIT_CENTER,"Non-HD image fit action restores full-image fitting");
                int childCount=content.getChildCount();tweaks.getMethod("onImageResume",Object.class).invoke(null,activity);check(content.getChildCount()==childCount,"Image resume does not duplicate the bubble");
                if(args.length>2)StyleChecks.save(content,args[2]+"/download-controls-preview.png");
                continue;
            }
            LinearLayout controller=new LinearLayout(context);controller.setId(context.getResources().getIdentifier("media_controller","id",context.getPackageName()));bottom.addView(controller,new LinearLayout.LayoutParams(-1,px(48)));
            String hook="onVideoResume";
            tweaks.getMethod(hook,Object.class).invoke(null,activity);content.getViewTreeObserver().dispatchOnPreDraw();measure(window.decor);
            View moved=(View)find.invoke(null,toolbar,download);
            check(moved==original && toolbar.findViewById(download)==null,name+": the exact native action view moves out of the top toolbar");
            ViewGroup videoPill=(ViewGroup)content.findViewWithTag("app.shiki.boost.gallery.actions.video");
            check(videoPill.getBackground().getClass().getName().endsWith("FeedPillBlur"),"Video uses the shared GPU glass backdrop");
            check(descendant(moved,videoPill) && controller.getParent()==bottom,name+": native playback stays in its original container outside the action pill");
            check(bottom.getVisibility()!=View.GONE && toolbar.getVisibility()==View.GONE,"Video keeps the native playback container and hides the top toolbar");
            int locationReads=content.locationReads,insetReads=content.insetReads;for(int frame=0;frame<120;frame++)content.getViewTreeObserver().dispatchOnPreDraw();
            check(content.locationReads==locationReads && content.insetReads==insetReads,"120 video draw callbacks perform no repeated inset/location reads");
            check(moved.getTop()>=0 && moved.getWidth()>0 && moved.getHeight()>0,name+": relocated native action retains measurable touch bounds");
            moved.performClick();check(clicks[0]==1,name+": clicking the relocated action invokes its native menu listener once");
            check(toolbarType.getMethod("getTitle").invoke(toolbar).equals("5/5"),name+": the top counter/title remains intact");
            check(find.invoke(null,toolbar,download)==moved,name+": video/GIF popup lookup resolves the relocated anchor");
            int children=content.getChildCount();tweaks.getMethod(hook,Object.class).invoke(null,activity);content.getViewTreeObserver().dispatchOnPreDraw();measure(window.decor);
            check(content.getChildCount()==children && find.invoke(null,toolbar,download)==moved,name+": resuming does not duplicate bottom controls");
            if(name.startsWith("Gallery")){
                View panel=content.findViewWithTag("app.shiki.boost.gallery.actions");toolbar.setAlpha(0.4f);content.getViewTreeObserver().dispatchOnPreDraw();check(Math.abs(panel.getAlpha()-0.4f)<0.001f,"Gallery panel follows native toolbar fade");
                toolbar.setVisibility(View.GONE);content.getViewTreeObserver().dispatchOnPreDraw();check(panel.getVisibility()!=View.VISIBLE,"Gallery panel follows native toolbar hiding");toolbar.setVisibility(View.VISIBLE);toolbar.setAlpha(1f);content.getViewTreeObserver().dispatchOnPreDraw();
            }
            if(args.length>2 && name.equals("MediaImageActivity"))StyleChecks.save(content,args[2]+"/download-controls-preview.png");
        }
        check(find.invoke(null,new View(context),12345)==null,"An absent action anchor preserves the native null result");
        StyleChecks.context=new ContextWrapper(context){@Override public Object getSystemService(String name){if(name.equals("captioning") || name.equals("autofill") || name.equals("content_capture"))return null;if(name.equals(Context.LAYOUT_INFLATER_SERVICE))return android.view.LayoutInflater.from(getBaseContext()).cloneInContext(this);return super.getSystemService(name);}};
        StyleChecks.omitWebView=true;StyleChecks.omitProgressSpinner=true;
        View video=StyleChecks.inflate("activity_media_video");View player=StyleChecks.find(video,"video_view");
        check(player.getClass().getMethod("getVideoSurfaceView").invoke(player) instanceof android.view.SurfaceView,"Viewer uses Boost’s native SurfaceView rendering for streaming video");
        check((Integer)player.getClass().getMethod("getResizeMode").invoke(player)==0,"Viewer retains Boost’s default aspect-fit mode");
        Activity nativeVideo=(Activity)Class.forName("com.rubenmayayo.reddit.ui.activities.MediaVideoActivity",true,loader).getConstructor().newInstance();
        Field nativeBase=ContextWrapper.class.getDeclaredField("mBase");nativeBase.setAccessible(true);nativeBase.set(nativeVideo,StyleChecks.context);
        RuntimeUiChecks.FakeWindow nativeWindow=new RuntimeUiChecks.FakeWindow(StyleChecks.context);set(nativeVideo,"mWindow",nativeWindow);
        FrameLayout nativeContent=new FrameLayout(StyleChecks.context);nativeContent.setId(android.R.id.content);nativeWindow.decor.addView(nativeContent,new FrameLayout.LayoutParams(-1,-1));nativeContent.addView(video,new FrameLayout.LayoutParams(-1,-1));
        View nativeToolbar=StyleChecks.find(video,"toolbar"),nativeBottom=StyleChecks.find(video,"bottom_bar"),nativeController=StyleChecks.find(video,"media_controller");set(nativeVideo,"toolbar",nativeToolbar);set(nativeVideo,"bottomBar",nativeBottom);
        tweaks.getMethod("onVideoResume",Object.class).invoke(null,nativeVideo);nativeContent.getViewTreeObserver().dispatchOnPreDraw();measure(nativeWindow.decor);
        ViewGroup nativePill=(ViewGroup)nativeContent.findViewWithTag("app.shiki.boost.gallery.actions.video");
        check(nativeController.getParent()==nativeBottom,"Real PlayerControlView retains its native parent");
        check(!descendant(nativeController,nativePill) && nativePill.getLayoutParams().width==-2,"Playback remains outside a compact wrap-content action pill");
        check(((android.widget.ImageButton)nativePill.getChildAt(0)).getContentDescription().equals("Share video"),"Video pill exposes sharing without replacing native playback controls");
        View volume=StyleChecks.find(nativeController,"volume_button");check(volume.getVisibility()==View.GONE,"Native volume visibility is not forced on by the pill");
        for(String control:new String[]{"exo_play","exo_progress","exo_position","exo_duration","speed_button"}){View target=StyleChecks.find(nativeController,control);check(target!=null && target.getWidth()>0 && target.getHeight()>0,"Native player retains measured "+control);}
        check(nativeToolbar.getVisibility()==View.GONE && nativeBottom.getVisibility()!=View.GONE,"Real video layout retains native playback and removes top chrome");
        System.out.println("DOWNLOAD CONTROLS CHECKS PASSED: "+checks);System.exit(0);
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
