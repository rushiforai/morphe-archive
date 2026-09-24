package app.yydarlinker.deepseekcaptions;
import android.app.Activity;
import android.content.Context;
import java.lang.ref.WeakReference;
/** Shared initialization is intentionally free of AI controllers, keys and network requests. */
public final class CaptionAddonSupport {
    private static volatile Context context;
    private static WeakReference<Activity> activity=new WeakReference<>(null);
    public static void initialize(Activity value){if(value==null)return;context=value.getApplicationContext();activity=new WeakReference<>(value);NativeCaptionBridge.initialize(value);}
    static Context context(){return context;}
    static Activity activity(){return activity.get();}
    public static boolean aiInstalled(){return false;} // Bound to selected roots at patch time.
    public static boolean simplifiedInstalled(){return false;}
    public static boolean memoryInstalled(){return false;}
}
