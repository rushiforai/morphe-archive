package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import android.view.inputmethod.EditorInfo;
import java.lang.ref.WeakReference;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.atomic.AtomicLong;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsRuntime;

public final class GboardSharedWritingRuntime {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final AtomicLong revision=new AtomicLong();
    private static int composingStart=Integer.MIN_VALUE,composingEnd=Integer.MIN_VALUE;
    private static volatile WeakReference<InputMethodService> service=new WeakReference<>(null);
    private GboardSharedWritingRuntime(){}
    public static boolean selected(Context context){return context!=null && GboardAiWritingToolsSettings.readEnabled(GboardAiWritingToolsSettings.preferences(context)) && GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(GboardAiWritingToolsSettings.readBackendType(GboardAiWritingToolsSettings.preferences(context)));}
    public static InputMethodService currentService(){return service.get();}
    public static long currentRevision(){return revision.get();}
    public static EditorSnapshot captureEditor(){return EditorSnapshot.capture(service.get(),revision.get());}
    public static boolean isCurrent(EditorSnapshot snapshot){return snapshot!=null && snapshot.isCurrent(revision.get());}
    public static Context context(){return GboardAiWritingToolsRuntime.sharedBackendContext();}
    public static void onInputStarting(Object receiver,EditorInfo info){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("input.start service="+(receiver instanceof InputMethodService));SharedWritingActivation.cancel();SharedKeyboardSurface.clear();NativeEditBridge.invalidate();SharedVoiceEditController.cancel();revision.incrementAndGet();SharedModelClient.cancelRequests();if(receiver instanceof InputMethodService){service=new WeakReference<>((InputMethodService)receiver);Context c=((InputMethodService)receiver).getApplicationContext();SharedInlineSettings.refresh(c);if(selected(c))SharedModelClient.activate(c);}}
    public static void onSelectionUpdated(Object receiver,int oldStart,int oldEnd,int newStart,int newEnd,int candidateStart,int candidateEnd){if(oldStart!=newStart || oldEnd!=newEnd || composingStart!=candidateStart || composingEnd!=candidateEnd){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("input.selection changed="+(oldStart!=newStart||oldEnd!=newEnd)+" composing="+(composingStart!=candidateStart||composingEnd!=candidateEnd));revision.incrementAndGet();SharedModelClient.cancelRequests();}composingStart=candidateStart;composingEnd=candidateEnd;SharedCompletionController.changed();}
    public static void onInputHidden(Object receiver){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("input.hidden revision="+revision.get());SharedWritingActivation.cancel();SharedKeyboardSurface.clear();NativeEditBridge.invalidate();SharedCompletionController.reset();SharedVoiceEditController.cancel();revision.incrementAndGet();SharedModelClient.releaseSession();service.clear();}
    /** A hidden window can be shown for the same editor without another onStartInput callback. */
    public static void onInputShown(Object receiver){if(receiver instanceof InputMethodService && service.get()!=receiver){InputMethodService ime=(InputMethodService)receiver;onInputStarting(ime,ime.getCurrentInputEditorInfo());SharedWritingDiagnostics.event("input.shown restored-service");}}
    public static CompletableFuture<String> request(Context context,String operation,String text,String instruction){
        CompletableFuture<String> result=new CompletableFuture<>();
        result.whenComplete((value,error)->{if(error!=null && !result.isCancelled())SharedModelClient.noteFailure(SharedLocalAiState.failureCode(error));});
        long requestedRevision=revision.get();
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("request.queued operation="+operation+" revision="+requestedRevision);
        MAIN.post(()->{
            if(result.isCancelled())return;
            if(!selected(context)){result.completeExceptionally(new IllegalStateException("SHARED_BACKEND_NOT_SELECTED"));return;}
            if(requestedRevision!=revision.get()){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("request.cancel before-capture revision-changed");result.cancel(false);return;}
            EditorSnapshot snapshot=EditorSnapshot.capture(service.get(),requestedRevision);
            if(snapshot==null){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("request.reject editor-unavailable");result.completeExceptionally(new IllegalStateException("EDITOR_UNAVAILABLE"));return;}
            if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("request.submit operation="+operation+" revision="+requestedRevision);
            CompletableFuture<String> pending=SharedModelClient.request(context,operation,text,instruction);
            result.whenComplete((value,error)->{if(result.isCancelled())pending.cancel(false);});
            pending.whenComplete((value,error)->MAIN.post(()->{if(result.isDone())return;if(error instanceof java.util.concurrent.CancellationException || !snapshot.isCurrent(revision.get())){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("request.cancel result-stale-or-cancelled");result.cancel(false);return;}if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event(error==null?"request.terminal ok":"request.terminal error="+error.getClass().getSimpleName());if(error!=null)result.completeExceptionally(error);else result.complete(value);}));
        });
        return result;
    }
}
