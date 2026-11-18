package app.afterglow.extension.menus;

import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

/** Distinguishes the expandable post body from its separate native Read-more label. */
public final class LongPressPostTools {
    private static final ReferenceQueue<Object> COLLECTED=new ReferenceQueue<>();
    private static final Map<Input,Boolean> BODY_INPUTS=new HashMap<>();
    private static final class Input extends WeakReference<Object> {
        final int hash;
        Input(Object value,boolean registered){super(value,registered?COLLECTED:null);hash=System.identityHashCode(value);}
        @Override public int hashCode(){return hash;}
        @Override public boolean equals(Object other){return this==other||other instanceof Input&&get()!=null&&get()==((Input)other).get();}
    }
    private LongPressPostTools(){}
    public static void bodyInput(Object input){
        if(!InstalledTweaks.has("long-press-tools")||input==null)return;
        synchronized(BODY_INPUTS){clean();if(BODY_INPUTS.size()>=1024)BODY_INPUTS.clear();BODY_INPUTS.put(new Input(input,true),Boolean.TRUE);}
    }
    public static void onNativeText(Object component,CharSequence text){
        if(!InstalledTweaks.has("long-press-tools")||!(component instanceof LongPressPostComponent)||text==null)return;
        try{
            LongPressPostComponent nativeText=(LongPressPostComponent)component;
            Object input=nativeText.afterglow_postTextInput();boolean body;
            synchronized(BODY_INPUTS){clean();body=input!=null&&BODY_INPUTS.containsKey(new Input(input,false));}
            Object context=nativeText.afterglow_postTextContext();
            LongPressMountedText.observeSource(component,context,text,body);
            if(body)LongPressCaptureTools.onPostText(context,text);
        }catch(Exception error){DebugLog.write("long-press","Observe post unavailable: "+error.getClass().getSimpleName());}
    }
    private static void clean(){Input stale;while((stale=(Input)COLLECTED.poll())!=null)BODY_INPUTS.remove(stale);}
}
