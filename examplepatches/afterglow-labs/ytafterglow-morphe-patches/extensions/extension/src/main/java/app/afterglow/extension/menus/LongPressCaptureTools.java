package app.afterglow.extension.menus;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.Toast;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.ui.LongPressCaptureSheet;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/** Adds the unique image actions without replacing native or original Morphe listeners. */
public final class LongPressCaptureTools {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<View,LongPressCapturePolicy> ROOTS=new WeakHashMap<>();
    private static final long HOLD_MS=300,MAX_PIXELS=8L*1024*1024;
    private static WeakReference<View> gesture=new WeakReference<>(null);
    private static LongPressCapturePolicy policy;
    private static LongPressCapturePolicy.Entry entry;
    private static LongPressMountedText.Selection mountedSelection;
    private static LongPressWindowCapture.Request pendingWindow;
    private static long armedDownTime;
    private static float downX,downY,rawX,rawY;
    private static final int[] location=new int[2],currentLocation=new int[2];
    private static boolean consumed,dispatchingCancel;
    private static final Runnable HOLD=LongPressCaptureTools::held;
    private static final AtomicInteger diagnosticLines=new AtomicInteger(),rootBinds=new AtomicInteger(),bodyObservations=new AtomicInteger();
    private static long diagnosticDown=Long.MIN_VALUE;
    private static int touchLines;
    private LongPressCaptureTools(){}
    private static boolean installed(){return InstalledTweaks.has("long-press-tools");}
    private static boolean enabled(){return installed()&&(AfterglowPrefs.getBool("commentManager")||AfterglowPrefs.getBool("postManager"));}
    private static boolean allowed(LongPressCapturePolicy.Entry value){return installed()&&value!=null&&AfterglowPrefs.getBool(value.isPost?"postManager":"commentManager");}

    /** Native Lwuv.b creates this exact WeakReference for a new element-root binding. */
    public static void bindRoot(View root,Object binding){
        if(!installed()||root==null||binding==null)return;
        synchronized(ROOTS){ROOTS.put(root,new LongPressCapturePolicy(binding));}
        int count=rootBinds.incrementAndGet();
        if(sample(count))diagnostic("Root bound count="+count+" class="+root.getClass().getName());
    }
    public static CharSequence onText(Object context,CharSequence text){
        if(!installed()||!(context instanceof LongPressCaptureContext))return text;
        try{
            LongPressCaptureContext owner=(LongPressCaptureContext)context;View root=owner.afterglow_captureRoot();
            LongPressCapturePolicy found; synchronized(ROOTS){found=ROOTS.get(root);}
            StringBuilder path=owner.afterglow_capturePath();String value=path==null?null:path.toString();
            if(found!=null)found.observe(owner.afterglow_captureBinding(),owner.afterglow_captureIdentifier(),value,text);
            if(DebugLog.shouldWrite("long-press")&&!LongPressCapturePolicy.commentIdentity(value).isEmpty())traceBody("comment",root,owner.afterglow_captureBinding(),found);
        }catch(Exception error){failure("Observe comment",error);}
        return text;
    }
    public static void onPostText(Object context,CharSequence text){
        if(!installed()||!(context instanceof LongPressCaptureContext))return;
        LongPressCaptureContext owner=(LongPressCaptureContext)context;View root=owner.afterglow_captureRoot();
        LongPressCapturePolicy found;synchronized(ROOTS){found=ROOTS.get(root);}
        StringBuilder path=owner.afterglow_capturePath();
        if(found!=null)found.observePost(owner.afterglow_captureBinding(),path==null?null:path.toString(),text);
        if(DebugLog.shouldWrite("long-press"))traceBody("post",root,owner.afterglow_captureBinding(),found);
    }
    public static boolean onTouch(View root,MotionEvent event){
        if(dispatchingCancel||event==null)return false;
        try{
            if(event.getActionMasked()==MotionEvent.ACTION_DOWN&&pendingWindow!=null&&event.getDownTime()!=armedDownTime)cancelWindow();
            if(!enabled()){if(gesture.get()==root)reset();return false;}
            int action=event.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){
                traceTouch(root,event);
                if(AvatarPhotoActions.claimsTouch(root,event)){reset();return false;}
                LongPressCapturePolicy found;synchronized(ROOTS){found=ROOTS.get(root);}
                if(!ready(root))return false;
                List<CharSequence> currentText=mounted(root);
                LongPressMountedText.Selection bound=LongPressMountedText.select(root,currentText);
                LongPressCapturePolicy.Entry selected=bound!=null?bound.entry:found==null?null:found.match(currentText);
                // Keep the outermost proven single-entity host as dispatch descends
                // into its text/toolbar hosts. Every later hold still revalidates it.
                if(bound!=null&&bound.sameIdentity(mountedSelection)&&armedDownTime==event.getDownTime()
                        &&LongPressMountedText.descendantOf(root,gesture.get()))return false;
                if(found==null&&bound==null)return false;
                reset();
                if(!allowed(selected)){
                    DebugLog.write("long-press","Capture hold unavailable; mounted texts="+currentText.size()+", matched="+(selected!=null));
                    return false;
                }
                gesture=new WeakReference<>(root);policy=found;entry=selected;mountedSelection=bound;armedDownTime=event.getDownTime();
                downX=event.getX();downY=event.getY();rawX=event.getRawX();rawY=event.getRawY();root.getLocationOnScreen(location);
                MAIN.postDelayed(HOLD,HOLD_MS);
                DebugLog.write("long-press",selected.isPost?"Post hold armed":"Comment hold armed");return false;
            }
            if(gesture.get()!=root)return false;
            boolean handled=consumed;
            if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){reset(action!=MotionEvent.ACTION_UP);return handled;}
            if(!consumed&&(action==MotionEvent.ACTION_POINTER_DOWN||action==MotionEvent.ACTION_MOVE&&moved(root,event))){reset();return false;}
            return consumed;
        }catch(Exception error){failure("Comment gesture",error);reset();return false;}
    }
    private static boolean sample(int count){return count<=4||(count&(count-1))==0;}
    private static void diagnostic(String message){
        try{if(DebugLog.shouldWrite("long-press")&&diagnosticLines.getAndIncrement()<160)DebugLog.write("long-press",message);}
        catch(Throwable ignored){}
    }
    private static void traceBody(String kind,View root,Object token,LongPressCapturePolicy found){
        int count=bodyObservations.incrementAndGet();if(!sample(count))return;
        diagnostic("Body observed kind="+kind+" count="+count+" root="+(root==null?"none":root.getClass().getName())
                +" registered="+(found!=null)+" token="+(found!=null&&found.bindingMatches(token))
                +" state="+(found==null?0:found.diagnosticState()));
    }
    private static void traceTouch(View root,MotionEvent event){
        try{
            if(!DebugLog.shouldWrite("long-press"))return;
            if(diagnosticDown!=event.getDownTime()){diagnosticDown=event.getDownTime();touchLines=0;}
            if(touchLines++>=12||root==null)return;
            LongPressCapturePolicy found;int ancestors=0;
            synchronized(ROOTS){
                found=ROOTS.get(root);View parent=root;
                for(int depth=0;depth<64;depth++){
                    Object next=parent.getParent();if(!(next instanceof View))break;parent=(View)next;
                    if(ROOTS.containsKey(parent))ancestors++;
                }
            }
            diagnostic("Capture down class="+root.getClass().getName()+" registered="+(found!=null)
                    +" ancestors="+ancestors+" mounted="+mounted(root).size()+" ready="+ready(root)
                    +" state="+(found==null?0:found.diagnosticState()));
        }catch(Throwable ignored){}
    }
    private static boolean ready(View root){return root!=null&&root.isAttachedToWindow()&&root.isShown()&&root.hasWindowFocus()&&root.getWidth()>0&&root.getHeight()>0;}
    private static boolean moved(View root,MotionEvent event){
        float slop=ViewConfiguration.get(root.getContext()).getScaledTouchSlop()/2f;
        return Math.abs(event.getX()-downX)>slop||Math.abs(event.getY()-downY)>slop
                ||Math.abs(event.getRawX()-rawX)>slop||Math.abs(event.getRawY()-rawY)>slop||rootMoved(root);
    }
    private static boolean rootMoved(View root){root.getLocationOnScreen(currentLocation);return Math.abs(location[0]-currentLocation[0])>2||Math.abs(location[1]-currentLocation[1])>2;}
    private static final class CaptureState {
        final WeakReference<View> root;
        final WeakReference<Activity> activity;
        final LongPressCapturePolicy policy;
        final LongPressCapturePolicy.Entry entry;
        final LongPressMountedText.Selection mounted;
        final int x,y,width,height;
        CaptureState(View root,Activity activity){
            this.root=new WeakReference<>(root);this.activity=new WeakReference<>(activity);
            policy=LongPressCaptureTools.policy;entry=LongPressCaptureTools.entry;mounted=mountedSelection;
            int[] position=new int[2];root.getLocationOnScreen(position);x=position[0];y=position[1];width=root.getWidth();height=root.getHeight();
        }
        boolean current(){
            View view=root.get();Activity owner=activity.get();
            if(!allowed(entry)||!ready(view)||owner==null||owner.isFinishing()||owner.isDestroyed()
                    ||activity(view.getContext())!=owner||view.getWidth()!=width||view.getHeight()!=height)return false;
            int[] position=new int[2];view.getLocationOnScreen(position);if(position[0]!=x||position[1]!=y)return false;
            List<CharSequence> text=LongPressCaptureTools.mounted(view);
            if(mounted!=null)return mounted.sameIdentity(LongPressMountedText.select(view,text));
            LongPressCapturePolicy now;synchronized(ROOTS){now=ROOTS.get(view);}
            return now==policy&&now!=null&&now.match(text)==entry;
        }
    }
    private static void held(){
        View root=gesture.get();String phase="validate";
        try{
            if(!allowed(entry)||!ready(root)||rootMoved(root)){reset();return;}
            if(mountedSelection!=null){
                LongPressMountedText.Selection current=LongPressMountedText.select(root,mounted(root));
                if(!mountedSelection.sameIdentity(current)){reset();return;}
            }else{
                LongPressCapturePolicy current;synchronized(ROOTS){current=ROOTS.get(root);}
                if(current!=policy){reset();return;}
                LongPressCapturePolicy.Entry currentEntry=current.match(mounted(root));
                if(currentEntry==null||entry!=currentEntry){reset();return;}
            }
            Activity activity=activity(root.getContext());if(activity==null||activity.isFinishing()||activity.isDestroyed()){reset();return;}
            CaptureState state=new CaptureState(root,activity);
            phase="draw";
            Bitmap capture;
            try{capture=capture(root);}
            catch(RuntimeException error){
                failure("Native software capture",error);
                if(!softwareCaptureFailure(error)){showCaptured(state,null,false);return;}
                if(android.os.Build.VERSION.SDK_INT>=29){
                    Bitmap rendered=null;long started=SystemClock.uptimeMillis();
                    try{
                        rendered=LongPressOffscreenCapture.capture(root,captureBackground(root),state::current);
                    }catch(OutOfMemoryError allocation){
                        failure("Offscreen image allocation",allocation);
                        phase="sheet";showCaptured(state,null,false);return;
                    }catch(Exception|LinkageError offscreen){failure("Offscreen native capture",offscreen);}
                    if(rendered!=null){
                        DebugLog.write("long-press","Full native image captured with hardware renderer; elapsedMs="+(SystemClock.uptimeMillis()-started));
                        phase="sheet";showCaptured(state,rendered,false);return;
                    }
                }
                LongPressWindowCapture.Request request=LongPressWindowCapture.create(activity,root,state::current,
                        (completed,image)->windowCaptured(completed,state,image));
                if(request==null){
                    DebugLog.write("long-press","Full window capture unavailable; text actions retained");
                    showCaptured(state,null,false);return;
                }
                pendingWindow=request;claim(root);request.start();return;
            }catch(OutOfMemoryError allocation){
                failure("Native image allocation",allocation);
                phase="sheet";showCaptured(state,null,false);return;
            }
            phase="sheet";
            showCaptured(state,capture,false);
        }catch(Exception|OutOfMemoryError error){
            failure("Capture native item phase="+phase,error);
            if(root!=null)Toast.makeText(root.getContext(),"Could not capture this item.",Toast.LENGTH_SHORT).show();
            reset();
        }
    }
    private static void windowCaptured(LongPressWindowCapture.Request request,CaptureState state,Bitmap image){
        if(pendingWindow!=request){if(image!=null)image.recycle();return;}
        pendingWindow=null;
        try{showCaptured(state,image,true);}
        catch(Exception|OutOfMemoryError error){
            if(image!=null)image.recycle();failure("Window capture sheet",error);reset();
        }
    }
    private static void showCaptured(CaptureState state,Bitmap image,boolean claimed){
        if(!state.current()){if(image!=null)image.recycle();reset();return;}
        View root=state.root.get();Activity activity=state.activity.get();boolean post=state.entry.isPost;
        Runnable copy=()->copyText(activity,state.entry.text,post);
        Runnable save=image==null?null:()->LongPressImageProvider.save(activity,image);
        Runnable copyImage=image==null?null:()->LongPressImageProvider.copy(activity,image);
        boolean shown=post?LongPressCaptureSheet.showPost(activity,copy,save,copyImage,LongPressPostImageActions.copyAction(activity,root))
                :LongPressCaptureSheet.showComment(activity,copy,save,copyImage);
        if(!shown){if(image!=null)image.recycle();reset();return;}
        DebugLog.write("long-press",post?"Post sheet opened":"Comment sheet opened");
        if(!claimed)claim(root);
    }
    private static void claim(View root){consumed=true;cancelChildren(root);root.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);}
    private static Bitmap capture(View root){
        int width=root.getWidth(),height=root.getHeight();
        if(width<=0||height<=0||width>8192||height>8192||(long)width*height>MAX_PIXELS)throw new IllegalArgumentException("Capture dimensions unavailable");
        Bitmap image=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);
        try{
            Canvas canvas=new Canvas(image);canvas.drawColor(captureBackground(root));root.draw(canvas);return image;
        }catch(RuntimeException|OutOfMemoryError error){image.recycle();throw error;}
    }
    private static int captureBackground(View root){
        TypedValue background=new TypedValue();
        return root.getContext().getTheme().resolveAttribute(android.R.attr.colorBackground,background,true)
                &&background.type>=TypedValue.TYPE_FIRST_COLOR_INT&&background.type<=TypedValue.TYPE_LAST_COLOR_INT?background.data:Color.BLACK;
    }
    private static List<CharSequence> mounted(View root){
        List<CharSequence> texts=new ArrayList<>();List<View> queue=new ArrayList<>();queue.add(root);
        for(int n=0;n<queue.size()&&n<512;n++){
            View view=queue.get(n);if(view.getVisibility()!=View.VISIBLE)continue;
            if(view instanceof LongPressCaptureHost){List<CharSequence> items=((LongPressCaptureHost)view).afterglow_captureTextItems();if(items!=null)texts.addAll(items);}
            if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)queue.add(group.getChildAt(i));}
        }
        // A partial tree cannot establish ownership of a single semantic entity.
        return queue.size()>512?java.util.Collections.emptyList():texts;
    }
    private static void cancelChildren(View root){
        MotionEvent cancel=MotionEvent.obtain(SystemClock.uptimeMillis(),SystemClock.uptimeMillis(),MotionEvent.ACTION_CANCEL,downX,downY,0);
        dispatchingCancel=true;try{root.dispatchTouchEvent(cancel);}finally{dispatchingCancel=false;cancel.recycle();}
    }
    private static void cancelWindow(){if(pendingWindow!=null){pendingWindow.cancel();pendingWindow=null;}}
    private static void reset(){reset(true);}
    private static void reset(boolean cancelCapture){if(cancelCapture)cancelWindow();MAIN.removeCallbacks(HOLD);gesture=new WeakReference<>(null);policy=null;entry=null;mountedSelection=null;consumed=false;}
    private static Activity activity(Context context){for(int i=0;i<12&&context!=null;i++){if(context instanceof Activity)return(Activity)context;if(!(context instanceof ContextWrapper))return null;Context next=((ContextWrapper)context).getBaseContext();if(next==context)return null;context=next;}return null;}
    private static void copyText(Activity activity,String text,boolean post){
        try{ClipboardManager clipboard=(ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE);if(clipboard==null)throw new IllegalStateException("Clipboard unavailable");clipboard.setPrimaryClip(ClipData.newPlainText(post?"Post":"Comment",text));Toast.makeText(activity,"Copied",Toast.LENGTH_SHORT).show();}
        catch(Exception error){failure("Copy native text",error);Toast.makeText(activity,"Could not copy this text.",Toast.LENGTH_SHORT).show();}
    }
    static String failureSummary(Throwable error){
        StringBuilder classes=new StringBuilder();boolean hardwareBitmap=false,runtimeShader=false;
        java.util.IdentityHashMap<Throwable,Boolean> visited=new java.util.IdentityHashMap<>();
        for(int depth=0;error!=null&&depth<8&&!visited.containsKey(error);depth++){
            visited.put(error,Boolean.TRUE);if(classes.length()>0)classes.append('>');
            String name=error.getClass().getName();classes.append(name,0,Math.min(name.length(),128));
            // Only fixed platform signals are emitted. Native wrapper getMessage()
            // can contain component data and is deliberately never evaluated.
            if(error.getClass()==IllegalArgumentException.class){
                String message=error.getMessage();
                hardwareBitmap|="Software rendering doesn't support hardware bitmaps".equals(message);
                runtimeShader|="Software rendering doesn't support RuntimeShader".equals(message);
            }
            StackTraceElement[] frames=error.getStackTrace();
            for(int i=0;i<frames.length&&i<64;i++)if("android.graphics.BaseCanvas".equals(frames[i].getClassName())
                    &&"throwIfHwBitmapInSwMode".equals(frames[i].getMethodName()))hardwareBitmap=true;
            error=error.getCause();
        }
        return "causes="+classes+" softwareHardwareBitmap="+hardwareBitmap+" softwareRuntimeShader="+runtimeShader;
    }
    private static boolean softwareCaptureFailure(Throwable error){
        java.util.IdentityHashMap<Throwable,Boolean> visited=new java.util.IdentityHashMap<>();
        for(int depth=0;error!=null&&depth<8&&!visited.containsKey(error);depth++){
            visited.put(error,Boolean.TRUE);
            if(error.getClass()==IllegalArgumentException.class){
                String message=error.getMessage();
                if("Software rendering doesn't support hardware bitmaps".equals(message)
                        ||"Software rendering doesn't support RuntimeShader".equals(message))return true;
            }
            StackTraceElement[] frames=error.getStackTrace();
            for(int i=0;i<frames.length&&i<64;i++)if("android.graphics.BaseCanvas".equals(frames[i].getClassName())
                    &&"throwIfHwBitmapInSwMode".equals(frames[i].getMethodName()))return true;
            error=error.getCause();
        }
        return false;
    }
    private static void failure(String action,Throwable error){
        try{DebugLog.write("long-press",action+" unavailable: "+failureSummary(error));}
        catch(Throwable ignored){DebugLog.write("long-press",action+" unavailable: "+error.getClass().getSimpleName());}
    }
}
