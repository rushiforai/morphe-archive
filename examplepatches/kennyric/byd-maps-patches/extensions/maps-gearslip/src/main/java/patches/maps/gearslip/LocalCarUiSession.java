package patches.maps.gearslip;

import android.content.Intent;
import java.util.function.Consumer;
import java.util.function.BiConsumer;

/** Routes legacy native activity requests into the authenticated, current CAL session. */
final class LocalCarUiSession {
    private static Object owner;
    private static Consumer<Intent> launch;
    private static BiConsumer<CharSequence,Integer> toast;
    static synchronized void attach(Object token,Consumer<Intent> handler,BiConsumer<CharSequence,Integer> toastHandler){owner=token;launch=handler;toast=toastHandler;}
    static synchronized void detach(Object token){if(owner==token){owner=null;launch=null;toast=null;}}
    static synchronized Object owner(){return owner;}
    static void toast(Object token,CharSequence text,int duration){BiConsumer<CharSequence,Integer> handler;synchronized(LocalCarUiSession.class){handler=token!=null&&token==owner?toast:null;}if(handler!=null)handler.accept(text,duration);}
    static void launch(Object token,Intent intent){
        Consumer<Intent> handler;
        synchronized(LocalCarUiSession.class){handler=token!=null&&token==owner?launch:null;}
        if(handler==null)return; // A retired native decor cannot navigate its replacement.
        handler.accept(new Intent(intent));
    }
}
