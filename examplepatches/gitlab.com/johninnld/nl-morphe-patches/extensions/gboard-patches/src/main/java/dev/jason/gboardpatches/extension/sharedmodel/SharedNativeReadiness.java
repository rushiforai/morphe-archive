package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.*;

/** Projects authenticated host readiness into the original writing-module provisioning prerequisite. */
public final class SharedNativeReadiness {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Claim CLAIM=new Claim();
    private static Signal signal;
    private SharedNativeReadiness(){}
    public static int provisioningBlocked(){
        Context context=GboardSharedWritingRuntime.context();
        return !GboardSharedWritingRuntime.selected(context)?-1:SharedModelClient.isReadyCached()?0:1;
    }
    static void sync(){MAIN.post(()->{
        boolean ready=provisioningBlocked()==0;
        if(!ready&&!CLAIM.supplied)return;
        try{if(signal==null)signal=new NativeSignal();CLAIM.update(ready,signal);}
        catch(ReflectiveOperationException failure){SharedModelClient.noteFailure("NATIVE_READINESS_UNAVAILABLE");}
    });}
    interface Signal {
        boolean provisioned()throws ReflectiveOperationException;
        boolean stockProvisioned()throws ReflectiveOperationException;
        void provision()throws ReflectiveOperationException;
        void revoke()throws ReflectiveOperationException;
    }
    static final class Claim {
        boolean supplied;
        void update(boolean ready,Signal signal)throws ReflectiveOperationException{
            if(ready){if(!signal.provisioned()){supplied=true;signal.provision();}}
            else if(supplied){supplied=false;if(!signal.stockProvisioned())signal.revoke();}
        }
    }
    private static final class NativeSignal implements Signal {
        final Object ever,current;final Method has,add,remove;
        NativeSignal()throws ReflectiveOperationException{
            ClassLoader loader=SharedNativeReadiness.class.getClassLoader();
            Class<?> tags=Class.forName("aicd",true,loader),tag=Class.forName("ahdw",false,loader),center=Class.forName("aheb",true,loader);
            Field h=tags.getDeclaredField("h"),g=tags.getDeclaredField("g");h.setAccessible(true);g.setAccessible(true);ever=h.get(null);current=g.get(null);
            has=center.getDeclaredMethod("f",tag);add=center.getDeclaredMethod("g",tag);remove=center.getDeclaredMethod("h",tag);has.setAccessible(true);add.setAccessible(true);remove.setAccessible(true);
        }
        public boolean provisioned()throws ReflectiveOperationException{return (Boolean)has.invoke(null,ever);}
        public boolean stockProvisioned()throws ReflectiveOperationException{return (Boolean)has.invoke(null,current);}
        public void provision()throws ReflectiveOperationException{add.invoke(null,ever);}
        public void revoke()throws ReflectiveOperationException{remove.invoke(null,ever);}
    }
}
