package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.CompletableFuture;

/** Enter the existing Gboard writing keyboard before presenting actions that need its apply/undo handler. */
public final class SharedWritingActivation {
    interface Entry { boolean available(); void open() throws Exception; }
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static CompletableFuture<Void> pending;
    private static Runnable readyCheck;
    private SharedWritingActivation() {}

    static void ensure(Context context,EditorSnapshot snapshot,Runnable onReady) {
        InputMethodService ime=GboardSharedWritingRuntime.currentService();
        if(ime==null || snapshot==null){SharedTextActions.failure(context,"EDITOR_UNAVAILABLE");return;}
        CompletableFuture<Void> result=start(snapshot,new Entry(){
            public boolean available(){if(ime.getWindow()!=null && ime.getWindow().getWindow()!=null)SharedKeyboardSurface.bindVisible(ime.getWindow().getWindow().getDecorView());return NativeEditBridge.available() && SharedKeyboardSurface.available();}
            public void open()throws Exception{NativeEditBridge.activate(ime);}
        });
        whenReady(context,snapshot,result,onReady);
    }
    static void whenReady(Context context,EditorSnapshot snapshot,CompletableFuture<Void> result,Runnable onReady) {
        result.whenComplete((ignored,error)->MAIN.post(()->{
            if(result.isCancelled() || !GboardSharedWritingRuntime.isCurrent(snapshot))return;
            if(error!=null)SharedTextActions.failure(context,"NATIVE_WRITING_ACTIVATION_FAILED");
            else onReady.run();
        }));
    }
    static CompletableFuture<Void> start(EditorSnapshot snapshot,Entry entry) {
        cancel();
        CompletableFuture<Void> result=new CompletableFuture<>();
        if(snapshot==null){result.completeExceptionally(new IllegalStateException("EDITOR_UNAVAILABLE"));return result;}
        if(!GboardSharedWritingRuntime.isCurrent(snapshot)){result.cancel(false);return result;}
        if(entry.available()){result.complete(null);return result;}
        pending=result;
        readyCheck=()->{
            if(result.isDone())return;
            if(!GboardSharedWritingRuntime.isCurrent(snapshot)){result.cancel(false);return;}
            if(entry.available())result.complete(null);
            else MAIN.postDelayed(()->{if(pending==result && !result.isDone())nativeReady();},50);
        };
        Runnable timeout=()->{if(!result.isDone())result.completeExceptionally(new IllegalStateException("NATIVE_WRITING_ACTIVATION_FAILED"));};
        result.whenComplete((value,error)->{MAIN.removeCallbacks(timeout);if(pending==result){pending=null;readyCheck=null;}});
        MAIN.postDelayed(timeout,3000);
        try{entry.open();nativeReady();}catch(Exception failure){result.completeExceptionally(new IllegalStateException("NATIVE_WRITING_ACTIVATION_FAILED"));}
        return result;
    }
    /** Called only by the validated native JarvisExtension onActivate hook. */
    public static void nativeReady(){Runnable check=readyCheck;if(check!=null){MAIN.removeCallbacks(check);MAIN.post(check);}}
    public static void cancel(){CompletableFuture<Void> old=pending;pending=null;readyCheck=null;if(old!=null)old.cancel(false);}
}
