package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.inputmethodservice.InputMethodService;

/** Keep the original jarvis access point; its availability follows the selected provider. */
public final class SharedNativeWritingEntry {
    private SharedNativeWritingEntry() {}
    public static int state(Object provider,int original){
        Context context=GboardSharedWritingRuntime.context();
        if(provider==null || !GboardSharedWritingRuntime.selected(context)){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.state shared=false original="+original);return original;}
        InputMethodService ime=GboardSharedWritingRuntime.currentService();
        boolean nativePolicy=false;
        try{Class<?> owner=Class.forName("ppq",false,provider.getClass().getClassLoader());nativePolicy=true;for(String name:new String[]{"p","h","e"}){java.lang.reflect.Field field=owner.getDeclaredField(name);field.setAccessible(true);nativePolicy&=field.getBoolean(provider);}}
        catch(ReflectiveOperationException unavailable){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.state reflection="+unavailable.getClass().getSimpleName());return original;}
        boolean ready=SharedModelClient.isReadyCached(),allowed=nativePolicy && ime!=null && EditorSnapshot.allowed(ime.getCurrentInputEditorInfo());
        int resolved=resolve(original,true,ready,allowed);
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.state original="+original+" resolved="+resolved+" ready="+ready+" nativePolicy="+nativePolicy+" service="+(ime!=null)+" allowed="+allowed);
        return resolved;
    }
    public static boolean open(){
        Context context=GboardSharedWritingRuntime.context();if(!GboardSharedWritingRuntime.selected(context)){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.open shared=false");return false;}
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.open ready="+SharedModelClient.isReadyCached()+" revision="+GboardSharedWritingRuntime.currentRevision());
        if(!SharedModelClient.isReadyCached()){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.route setup");SharedModelSetupActivity.open(context);return true;}
        EditorSnapshot snapshot=GboardSharedWritingRuntime.captureEditor();
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.open snapshot="+(snapshot!=null)+" empty="+(snapshot!=null&&snapshot.isEmpty()));
        if(snapshot!=null && snapshot.isEmpty()){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.route screen-reply");SharedScreenContext.reply(context,true,snapshot);return true;}
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("entry.route stock-writing");
        return false;
    }
    static int resolve(int original,boolean selected,boolean ready,boolean editorAllowed){
        if(!selected || original==3)return original;
        return ready && editorAllowed?2:4;
    }
}
