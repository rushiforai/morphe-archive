package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Selection;
import android.text.Spannable;
import android.view.*;
import android.widget.*;
import dev.jason.gboardpatches.extension.ocr.GboardOcrSettings;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.concurrent.*;

/** One explicit native shutter capture, then local OCR and selectable text with the native Insert action. */
public final class SharedCameraOcr {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService WORK=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Gboard-local-image");t.setDaemon(true);return t;});
    private static WeakReference<Object> peer=new WeakReference<>(null);
    private static State active;
    private static Pick picking;
    private static final class Pick {final EditorSnapshot.Handoff editor;final long expires=android.os.SystemClock.uptimeMillis()+120000;Bitmap image;byte[] encoded;boolean reopening;Pick(EditorSnapshot.Handoff e){editor=e;}}
    private static final class State {
        final Object peer;final EditorSnapshot snapshot;volatile boolean cancelled;boolean started;Bitmap image;Future<?> work;TextView text;
        State(Object p,EditorSnapshot s){peer=p;snapshot=s;}
    }
    private SharedCameraOcr(){}
    /** A late asynchronous native camera callback must not replace an image/result already chosen locally. */
    public static boolean keepLocalResult(Object owner){State state=active;return state!=null && state.peer==owner && !state.cancelled;}
    public static boolean selected(Context context){return GboardSharedWritingRuntime.selected(context)||GboardOcrSettings.sharedImageOcr(context);}
    public static void bind(Object owner){
        if(owner==null)return;
        try{
            Context context=(Context)field(owner,"b");if(!selected(context))return;
            peer=new WeakReference<>(owner);
            TextView pick=(TextView)field(owner,"f");pick.setVisibility(View.VISIBLE);pick.setText("Choose an image");pick.setContentDescription("Choose an image for Local AI text scanning");
            pick.setEnabled(true);pick.setOnClickListener(v->choose(context));
            ImageButton shutter=(ImageButton)field(owner,"h");shutter.setEnabled(true);shutter.setOnClickListener(v->capture(owner));
            SharedWritingDiagnostics.event("ocr.controls bound");
            if(picking!=null)deliverChosen(picking);
        }catch(ReflectiveOperationException failure){SharedModelClient.noteFailure("NATIVE_OCR_UNAVAILABLE");}
    }
    public static void clear(Object owner){if(active!=null && active.peer==owner){State old=active;active=null;synchronized(old){old.cancelled=true;if(old.work!=null)old.work.cancel(true);if(!old.started && old.image!=null && !old.image.isRecycled())old.image.recycle();}}if(peer.get()==owner)peer.clear();}
    public static boolean capture(Object owner){
        if(owner==null)return false;
        SharedWritingDiagnostics.event("ocr.shutter clicked");
        try{
            Context context=(Context)field(owner,"b");if(!selected(context))return false;
            EditorSnapshot snapshot=GboardSharedWritingRuntime.captureEditor();if(snapshot==null){message(context,"Text scanning is unavailable in this private or changed editor.");return true;}
            Bitmap bitmap=captureNativePreview(owner);
            if(bitmap==null)message(context,"Wait until the camera preview is visible, then try again.");
            else recognize(owner,bitmap,snapshot);
        }catch(Exception failure){Context context=GboardSharedWritingRuntime.context();if(context!=null)message(context,"Could not capture this camera frame. Try Choose an image.");}
        return true;
    }
    /** Match CameraX PreviewView's stock shutter conversion, including its viewport transform. */
    private static Bitmap captureNativePreview(Object owner)throws ReflectiveOperationException{
        Object preview=field(owner,"c");
        Object implementation=field(preview,"a");
        if(implementation==null)return null;
        Bitmap source=(Bitmap)invoke(implementation,"a");
        if(source==null)return null;
        Bitmap aligned=null;
        boolean returnedSource=false;
        try{
            Object transformation=field(implementation,"c");
            if(!Boolean.TRUE.equals(invoke(transformation,"e"))){returnedSource=true;return source;}
            FrameLayout container=(FrameLayout)field(implementation,"b");
            if(container.getWidth()<=0 || container.getHeight()<=0 || container.getWidth()*(long)container.getHeight()>8000000L){return null;}
            android.util.Size size=new android.util.Size(container.getWidth(),container.getHeight());
            android.graphics.Matrix correction=(android.graphics.Matrix)invoke(transformation,"c");
            android.graphics.RectF viewport=(android.graphics.RectF)invoke(transformation,"d",new Class<?>[]{android.util.Size.class,int.class},size,container.getLayoutDirection());
            android.util.Size bufferSize=(android.util.Size)field(transformation,"a");
            aligned=Bitmap.createBitmap(size.getWidth(),size.getHeight(),source.getConfig()==null?Bitmap.Config.ARGB_8888:source.getConfig());
            android.graphics.Matrix matrix=new android.graphics.Matrix();
            matrix.postConcat(correction);
            matrix.postScale(viewport.width()/bufferSize.getWidth(),viewport.height()/bufferSize.getHeight());
            matrix.postTranslate(viewport.left,viewport.top);
            new android.graphics.Canvas(aligned).drawBitmap(source,matrix,new android.graphics.Paint(7));
            Bitmap result=aligned;aligned=null;return result;
        }finally{
            if(!returnedSource && !source.isRecycled())source.recycle();
            if(aligned!=null && !aligned.isRecycled())aligned.recycle();
        }
    }
    private static void choose(Context context){
        SharedWritingDiagnostics.event("ocr.picker clicked");
        if(picking!=null){message(context,"An image choice is already in progress.");return;}
        EditorSnapshot snapshot=GboardSharedWritingRuntime.captureEditor();if(snapshot==null){message(context,"This editor cannot receive recognised text.");return;}
        Pick request=new Pick(snapshot.handoff());picking=request;
        SharedImageInputActivity.chooseImage(context,choice->{
            Bitmap bitmap=choice==null?null:choice.bitmap;
            if(picking!=request){if(bitmap!=null)bitmap.recycle();return;}
            if(bitmap==null){picking=null;return;}
            request.image=bitmap;request.encoded=choice.encoded;resumeChosen(request,context,100);
        });
        MAIN.postDelayed(()->{if(picking==request && android.os.SystemClock.uptimeMillis()>=request.expires)discardChosen(request);},120000);
    }
    private static void resumeChosen(Pick request,Context context,int remaining){
        if(picking!=request)return;
        if(remaining==0 || android.os.SystemClock.uptimeMillis()>request.expires){discardChosen(request);message(context,"The original editor changed or did not return. Choose the image again in the intended field.");return;}
        // requestShowSelf restores normal typing, not the OCR keyboard. Wait for the original live
        // editor before dispatching the stock OCR transition; never adopt the picker's editor.
        if(request.editor.resumeForPreview()!=null && NativeEditBridge.readyForTransition(GboardSharedWritingRuntime.currentService())){
            Object owner=peer.get();
            if(owner!=null && shown(owner))deliverChosen(request);
            else if(!request.reopening){
                request.reopening=true;
                try{NativeEditBridge.activateOcr(GboardSharedWritingRuntime.currentService());}
                catch(ReflectiveOperationException unavailable){discardChosen(request);message(context,"Could not reopen Scan Text. Please try again.");return;}
            }
        }
        if(picking==request)MAIN.postDelayed(()->resumeChosen(request,context,remaining-1),100);
    }
    private static void discardChosen(Pick request){if(picking==request)picking=null;if(request.image!=null){if(!request.image.isRecycled())request.image.recycle();request.image=null;}request.encoded=null;}
    private static void deliverChosen(Pick request){
        if(picking!=request || request.image==null)return;
        Object owner=peer.get();if(owner==null || !shown(owner) || !NativeEditBridge.readyForTransition(GboardSharedWritingRuntime.currentService()))return;
        EditorSnapshot snapshot=request.editor.resumeForPreview();
        if(android.os.SystemClock.uptimeMillis()>request.expires || snapshot==null)return;
        SharedWritingDiagnostics.event("ocr.picker delivered-visible");Bitmap bitmap=request.image;byte[] encoded=request.encoded;request.image=null;request.encoded=null;picking=null;recognize(owner,bitmap,snapshot,encoded);
    }
    private static void recognize(Object owner,Bitmap image,EditorSnapshot snapshot){recognize(owner,image,snapshot,null);}
    private static void recognize(Object owner,Bitmap image,EditorSnapshot snapshot,byte[] encoded){
        State state=null;
        try{
            clear(owner);peer=new WeakReference<>(owner);markCaptured(owner);state=new State(owner,snapshot);state.image=image;active=state;
            SharedWritingDiagnostics.event("ocr.image captured");
            Object camera=field(owner,"r");if(camera!=null)invoke(camera,"c");
            ((View)field(owner,"f")).setVisibility(View.GONE);((View)field(owner,"h")).setVisibility(View.GONE);
            ((View)field(owner,"g")).setVisibility(View.GONE);((View)field(owner,"C")).setVisibility(View.GONE);
            View retry=(View)field(owner,"d");retry.setVisibility(View.VISIBLE);retry.setOnClickListener(v->{clear(owner);try{invoke(owner,"d");}catch(Exception ignored){}});
            FrameLayout frame=(FrameLayout)field(owner,"l");frame.removeAllViews();frame.setVisibility(View.VISIBLE);
            View insertPanel=(View)field(owner,"C");Drawable backdrop=insertPanel.getBackground();if(backdrop!=null && backdrop.getConstantState()!=null)frame.setBackground(backdrop.getConstantState().newDrawable(frame.getResources(),frame.getContext().getTheme()).mutate());
            TextView style=(TextView)field(owner,"B");TextView text=SharedKeyboardSurface.styledText(style,"Reading text on your device…");text.setSingleLine(false);text.setEllipsize(null);text.setMaxLines(Integer.MAX_VALUE);text.setGravity(Gravity.TOP|Gravity.START);text.setTextIsSelectable(true);
            int gap=((TextView)field(owner,"f")).getPaddingLeft();int bottom=Math.max(insertPanel.getHeight(),insertPanel.getLayoutParams().height)+Math.max(((View)field(owner,"g")).getHeight(),((View)field(owner,"g")).getLayoutParams().height);text.setPadding(Math.max(gap,style.getPaddingLeft()),style.getPaddingTop(),Math.max(gap,style.getPaddingRight()),Math.max(0,bottom));
            ScrollView scroll=new ScrollView(frame.getContext());scroll.setFillViewport(true);scroll.addView(text,new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));frame.addView(scroll,new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT));state.text=text;restoreResultControls(owner);
            State current=state;Context context=frame.getContext();
            state.work=WORK.submit(()->{try{synchronized(current){if(current.cancelled)return;current.started=true;}String result=SharedOcrRuntime.recognize(context,image,encoded);MAIN.post(()->complete(current,result));}catch(Exception failure){MAIN.post(()->showFailure(current,failure));}finally{if(!image.isRecycled())image.recycle();}});
        }catch(Exception failure){if(!image.isRecycled())image.recycle();if(state!=null)state.cancelled=true;SharedModelClient.noteFailure("NATIVE_OCR_UNAVAILABLE");}
    }
    private static void showFailure(State state,Exception failure){
        if(!valid(state))return;
        String code=SharedLocalAiState.failureCode(failure);SharedModelClient.noteFailure(code);
        state.text.setText(failureMessage(code));restoreResultControls(state.peer);
        try{
            TextView setup=(TextView)field(state.peer,"f");setup.setText("Model setup");setup.setContentDescription("Open Local Model Host status and setup");setup.setVisibility(View.VISIBLE);
            setup.setOnClickListener(v->SharedLocalAiSettingsFeature.openProvider(setup.getContext()));
        }catch(ReflectiveOperationException unavailable){message(state.text.getContext(),failureMessage(code));}
    }
    static String failureMessage(String code){
        if("OCR_FAILED".equals(code)||"REQUEST_FAILED".equals(code))return "Could not read this image. Try a clearer crop or check Model setup.";
        return SharedLocalAiState.failureMessage(code)+"\n\nNo text was inserted. Open Model setup, then capture or choose the image again when ready.";
    }
    private static void complete(State state,String result){
        if(!valid(state)){if(active==state&&!state.cancelled&&shown(state.peer))state.text.setText("The editor changed. Capture again in the intended field.");return;}
        restoreResultControls(state.peer);
        if(result==null||result.trim().isEmpty()){state.text.setText("No text was found. Try a clearer crop.");return;}
        try{
            state.text.setText(result,TextView.BufferType.SPANNABLE);
            invoke(state.peer,"j",new Class<?>[]{String.class},result);
            ((FrameLayout)field(state.peer,"l")).setVisibility(View.VISIBLE);
            TextView all=(TextView)field(state.peer,"g");all.setVisibility(View.VISIBLE);all.bringToFront();((View)field(state.peer,"C")).bringToFront();all.setOnClickListener(v->Selection.setSelection((Spannable)state.text.getText(),0,state.text.length()));
            ((View)field(state.peer,"A")).setOnClickListener(v->{if(!valid(state)){message(state.text.getContext(),"The editor changed. Nothing was inserted.");return;}String selected=selection(result,state.text.getSelectionStart(),state.text.getSelectionEnd());try{invoke(state.peer,"b",new Class<?>[]{String.class},selected);invoke(state.peer,"i");}catch(Exception failure){message(state.text.getContext(),"Could not insert recognised text.");}});
        }catch(Exception failure){state.text.setText("Could not open the text insertion controls.");}
    }
    /** Keep the original camera navigation above the local full-size result layer. */
    static void restoreResultControls(Object owner){
        try{for(String name:new String[]{"d","z"}){View control=(View)field(owner,name);control.animate().cancel();control.setVisibility(View.VISIBLE);control.setAlpha(1f);control.setEnabled(true);control.bringToFront();if(control.getParent() instanceof View)((View)control.getParent()).bringToFront();}}
        catch(ReflectiveOperationException unavailable){SharedModelClient.noteFailure("NATIVE_OCR_UNAVAILABLE");}
    }
    static String selection(String text,int start,int end){if(start==-1&&end==-1)return text;if(start<0||end<0||start>text.length()||end>text.length())return "";return start==end?text:text.substring(Math.min(start,end),Math.max(start,end));}
    /** Native restartCamera rejects preview state2; local capture must enter captured state3 too. */
    static void markCaptured(Object owner)throws ReflectiveOperationException{Field state=owner.getClass().getDeclaredField("x");state.setAccessible(true);state.setInt(owner,3);}
    private static boolean valid(State state){return active==state&&!state.cancelled&&shown(state.peer)&&state.snapshot.isCurrent(GboardSharedWritingRuntime.currentRevision());}
    static boolean shown(Object owner){try{View preview=(View)field(owner,"c");return Boolean.TRUE.equals(field(owner,"u"))&&preview.isAttachedToWindow()&&preview.isShown();}catch(Exception unavailable){return false;}}

    private static Object field(Object owner,String name)throws ReflectiveOperationException{Class<?> type=owner.getClass();while(type!=null){try{Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(owner);}catch(NoSuchFieldException missing){type=type.getSuperclass();}}throw new NoSuchFieldException(name);}
    private static Object invoke(Object owner,String name)throws ReflectiveOperationException{return invoke(owner,name,new Class<?>[0]);}
    private static Object invoke(Object owner,String name,Class<?>[] types,Object...args)throws ReflectiveOperationException{Class<?> type=owner.getClass();while(type!=null){try{Method m=type.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(owner,args);}catch(NoSuchMethodException missing){type=type.getSuperclass();}}throw new NoSuchMethodException(name);}
    private static void message(Context context,String text){if(context!=null)MAIN.post(()->Toast.makeText(context,text,Toast.LENGTH_LONG).show());}
}
