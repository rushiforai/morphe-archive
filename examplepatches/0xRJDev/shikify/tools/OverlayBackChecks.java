import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.window.BackEvent;
import android.window.OnBackAnimationCallback;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;

/** Actual compiled callback/Back guard and native layouts. All Back actions are local counters. */
public final class OverlayBackChecks {
    static int checks;static Context context;static ClassLoader loader;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object field(Object object,String name)throws Exception{return SurfaceChecks.field(object,name);}
    static Object call(Object object,String name,Object... args)throws Exception{return SurfaceChecks.call(object,name,args);}
    static void set(Object object,String name,Object value)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field f=type.getDeclaredField(name);f.setAccessible(true);f.set(object,value);return;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    public static final class Dispatcher implements OnBackInvokedDispatcher {
        OnBackInvokedCallback callback;int adds,removes;
        @Override public void registerOnBackInvokedCallback(int priority,OnBackInvokedCallback value){check(priority==PRIORITY_DEFAULT,"Overlay uses default Back priority so IME keeps precedence");check(callback==null,"Back guard registers one callback at a time");callback=value;adds++;}
        @Override public void unregisterOnBackInvokedCallback(OnBackInvokedCallback value){check(callback==value,"Back guard removes the exact registered callback");callback=null;removes++;}
    }
    public static final class OverlayActivity extends RuntimeUiChecks.FakeActivity {
        final Dispatcher dispatcher=new Dispatcher();int backs,closes,pending;public View mediaController;
        OverlayActivity(Context context)throws Exception{super(context);}
        @Override public OnBackInvokedDispatcher getOnBackInvokedDispatcher(){return dispatcher;}
        @Override public void onBackPressed(){backs++;}
        @Override public void overrideActivityTransition(int type,int enter,int exit){check(type==Activity.OVERRIDE_TRANSITION_CLOSE && enter==0 && exit==0,"Commit suppresses a second whole-window exit transition");closes++;}
        @Override public void overridePendingTransition(int enter,int exit){check(enter==0 && exit==0,"Native legacy exit override remains suppressed after cleanup");pending++;}
    }
    static Object screen(OverlayActivity activity)throws Exception{
        Class<?> type=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks$Screen",true,loader);Constructor<?> ctor=type.getDeclaredConstructor(Activity.class,boolean.class);ctor.setAccessible(true);Object screen=ctor.newInstance(activity,true);
        Class<?> surfaces=Class.forName("app.morphe.extension.boost.SurfaceAppearanceTweaks",true,loader);Field f=surfaces.getDeclaredField("SCREENS");f.setAccessible(true);((Map)f.get(null)).put(activity,screen);return screen;
    }
    static Object guard(OverlayActivity activity)throws Exception{
        Class<?> type=Class.forName("app.morphe.extension.boost.PredictiveBackTweaks$Api33$Guard",true,loader);Constructor<?> ctor=type.getDeclaredConstructor(Activity.class);ctor.setAccessible(true);Object guard=ctor.newInstance(activity);set(guard,"handler","di0");set(guard,"usesDrawer",false);return guard;
    }
    static void end(Object callback)throws Exception{ValueAnimator animator=(ValueAnimator)field(callback,"animator");if(animator!=null)animator.end();}
    static int pixel(Drawable drawable,int x,int y){Bitmap image=Bitmap.createBitmap(256,256,Bitmap.Config.ARGB_8888);drawable.draw(new Canvas(image));int value=image.getPixel(x,y);image.recycle();return value;}
    static void run(String[] args)throws Exception {
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();Context base=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);
        SharedPreferences prefs=(SharedPreferences)Proxy.newProxyInstance(loader,new Class<?>[]{SharedPreferences.class},(p,m,a)->{if(m.getName().equals("getString"))return a[1];if(m.getName().equals("getAll"))return java.util.Collections.emptyMap();if(a!=null && a.length==2)return a[1];return null;});
        context=new ContextWrapper(base){@Override public SharedPreferences getSharedPreferences(String name,int mode){return prefs;}@Override public Object getSystemService(String name){if(name.equals("captioning"))return null;if(name.equals(Context.LAYOUT_INFLATER_SERVICE))return android.view.LayoutInflater.from(getBaseContext()).cloneInContext(this);return super.getSystemService(name);}};
        StyleChecks.context=context;StyleChecks.omitWebView=true;StyleChecks.omitProgressSpinner=true;
        for(String layout:new String[]{"activity_media_image","activity_media_video","activity_album"}){
            OverlayActivity activity=new OverlayActivity(context);FrameLayout decor=(FrameLayout)activity.getWindow().getDecorView();FrameLayout content=new FrameLayout(context);content.setId(android.R.id.content);decor.addView(content,new FrameLayout.LayoutParams(-1,-1));
            View root=StyleChecks.inflate(layout);content.addView(root,new FrameLayout.LayoutParams(-1,-1));Object screen=screen(activity);call(screen,"resume");DownloadControlsChecks.context=context;DownloadControlsChecks.measure(decor);
            Drawable backdrop=(Drawable)field(screen,"backdrop");backdrop.setBounds(0,0,256,256);Paint p=new Paint();
            content.setTranslationX(3);content.setTranslationY(4);content.setScaleX(0.99f);content.setScaleY(0.97f);content.setAlpha(0.8f);
            Object guard=guard(activity);
            call(guard,"attach");OnBackAnimationCallback callback=(OnBackAnimationCallback)activity.dispatcher.callback;check(callback!=null,layout+": captured dimmed media selects the overlay Back callback");
            int initial=pixel(backdrop,40,40),footer=pixel(backdrop,40,240);android.graphics.Rect bounds=new android.graphics.Rect(backdrop.getBounds());
            callback.onBackStarted(new BackEvent(0,100,0,BackEvent.EDGE_LEFT));callback.onBackProgressed(new BackEvent(100,110,0.55f,BackEvent.EDGE_LEFT));
            check(content.getTranslationX()>3 && content.getScaleX()<0.99f && content.getAlpha()<0.8f,layout+": image and controls follow Back progress together");
            check(decor.getTranslationX()==0 && decor.getScaleX()==1 && backdrop.getBounds().equals(bounds),layout+": window and page backdrop stay stationary with no recapture");
            check(Color.alpha(pixel(backdrop,40,40))<Color.alpha(initial),layout+": stationary page brightens as the dim scrim recedes");
            check(Color.alpha(pixel(backdrop,40,240))<Color.alpha(footer),layout+": source footer is gradually restored without permanently masking the screenshot");
            check(activity.backs==0 && activity.closes==0,layout+": gesture preview performs no native Back or finish action");
            if(layout.equals("activity_media_image") && args.length>2){
                Bitmap preview=Bitmap.createBitmap(256,256,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(preview);backdrop.draw(canvas);p.setColor(0xffd04c65);canvas.save();canvas.translate(256*0.14f*0.55f,0);canvas.scale(1-0.08f*0.55f,1-0.08f*0.55f,128,128);p.setAlpha(115);canvas.drawRect(50,70,206,186,p);canvas.restore();try(java.io.OutputStream out=new java.io.FileOutputStream(args[2]+"/media-overlay-progress.png")){preview.compress(Bitmap.CompressFormat.PNG,100,out);}preview.recycle();
            }
            callback.onBackCancelled();end(callback);
            check(content.getTranslationX()==3 && content.getTranslationY()==4 && content.getScaleX()==0.99f && content.getScaleY()==0.97f && content.getAlpha()==0.8f,layout+": cancellation restores exact native transforms and alpha");
            check(pixel(backdrop,40,40)==initial && pixel(backdrop,40,240)==footer && activity.backs==0,layout+": cancellation restores dimming and footer mask without navigation");
            callback.onBackStarted(new BackEvent(250,100,0,BackEvent.EDGE_RIGHT));callback.onBackProgressed(new BackEvent(150,100,0.4f,BackEvent.EDGE_RIGHT));check(content.getTranslationX()<3,layout+": right-edge gesture moves the overlay in the matching direction");
            call(screen,"pause");call(guard,"detach");check(content.getTranslationX()==3 && content.getAlpha()==0.8f && activity.dispatcher.callback==null,layout+": pause cancels progress and releases dispatcher ownership");
            callback.onBackProgressed(new BackEvent(100,100,0.8f,BackEvent.EDGE_LEFT));callback.onBackInvoked();check(content.getTranslationX()==3 && activity.backs==0,layout+": stale progress/commit after pause cannot alter views or navigate");
            call(screen,"resume");call(guard,"attach");callback=(OnBackAnimationCallback)activity.dispatcher.callback;
            // Legacy controller state must take precedence over overlay dismissal.
            callback.onBackStarted(new BackEvent(0,100,0,BackEvent.EDGE_LEFT));callback.onBackProgressed(new BackEvent(80,100,0.5f,BackEvent.EDGE_LEFT));
            PredictiveBackChecks.UniversalMediaController controls=new PredictiveBackChecks.UniversalMediaController(context);activity.mediaController=controls;call(guard,"update");check(activity.dispatcher.callback==guard && content.getTranslationX()==3 && content.getAlpha()==0.8f,layout+": native media controls take Back ownership and reset any overlay preview");controls.z=false;call(guard,"update");check(activity.dispatcher.callback==callback,layout+": overlay callback returns when native controls release Back");
            callback.onBackStarted(new BackEvent(0,100,0,BackEvent.EDGE_LEFT));callback.onBackProgressed(new BackEvent(70,100,0.3f,BackEvent.EDGE_LEFT));callback.onBackInvoked();end(callback);callback.onBackInvoked();
            check(activity.backs==1 && activity.closes==1 && activity.pending==1,layout+": completed gesture dispatches the original Back exactly once");
            check(content.getAlpha()==0 && (Float)field(backdrop,"exitProgress")==1,layout+": commit finishes with only the original stationary page visible");
            call(guard,"detach");call(screen,"dispose");check(java.util.Arrays.stream(backdrop.getClass().getDeclaredFields()).noneMatch(f->f.getType()==Bitmap.class),layout+": no screenshot is retained after dismissal");
        }
        System.out.println("OVERLAY BACK CHECKS PASSED: "+checks);System.exit(0);
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
