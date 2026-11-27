package nl.johninnl.gboard;

import android.content.Context;
import java.lang.reflect.Method;

/** Decouples the recognizer extension from the public SDK carried by the shared settings extension. */
final class SharedSpeechHook {
    private static final String CONTROLLER="dev.jason.gboardpatches.extension.sharedmodel.SharedSpeechController";
    private static Class<?> controller()throws Exception{return Class.forName(CONTROLLER);}
    static boolean ready(Context context){try{return Boolean.TRUE.equals(controller().getMethod("ready",Context.class).invoke(null,context));}catch(Exception failure){return false;}}
    static String summary(Context context){try{return String.valueOf(controller().getMethod("summary",Context.class).invoke(null,context));}catch(Exception failure){return "Install or update Local Model Host to use shared speech.";}}
    static void settings(Context context){try{controller().getMethod("openSettings",Context.class).invoke(null,context);}catch(Exception failure){android.widget.Toast.makeText(context,"Install or update Local Model Host first.",android.widget.Toast.LENGTH_LONG).show();}}
    static Session open(Context context, boolean nativeDictation) throws Exception {
        java.util.function.BooleanSupplier contactConsent = () -> nativeDictation
            && ParakeetStore.contactNamesEnabled(context);
        return new Session(controller().getMethod("open", Context.class, java.util.function.BooleanSupplier.class)
            .invoke(null, context, contactConsent));
    }
    static final class Session implements AutoCloseable {
        private final Object remote;
        Session(Object remote){this.remote=remote;}
        float compute(float[] window)throws Exception{return ((Number)remote.getClass().getMethod("probability",float[].class).invoke(remote,(Object)window)).floatValue();}
        String transcribe(float[] samples,int count,boolean end)throws Exception{return (String)remote.getClass().getMethod("transcribe",float[].class,int.class,boolean.class).invoke(remote,samples,count,end);}
        void reset(){try{remote.getClass().getMethod("reset").invoke(remote);}catch(Exception ignored){}}
        void release(){try{remote.getClass().getMethod("releaseVad").invoke(remote);}catch(Exception ignored){}}
        @Override public void close(){try{remote.getClass().getMethod("close").invoke(remote);}catch(Exception ignored){}}
    }
}
