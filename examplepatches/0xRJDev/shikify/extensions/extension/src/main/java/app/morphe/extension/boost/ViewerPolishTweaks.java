package app.morphe.extension.boost;

import java.lang.reflect.Method;

/** Retain old hook entry points without changing native zoom behaviour. */
public final class ViewerPolishTweaks {
    private static Method settleMethod;
    private ViewerPolishTweaks() { }
    public static void onActivityResume(Object activity) { }
    public static void onResume(Object fragment) { }
    /**
     * Replaces ViewDragHelper.settleCapturedViewAt in SwipeBackLayout's release callback.
     * A non-zero target means the gesture passed the dismiss threshold. Boost would then
     * animate the page off-screen for up to 600ms and only finish on the idle callback.
     * Returning false leaves the helper idle, so that callback cannot finish a second time.
     */
    public static boolean settle(Object layout,Object helper,int left,int top) {
        if((left!=0 || top!=0) && finish(helper))return false;
        try {
            if(settleMethod==null)settleMethod=helper.getClass().getMethod("s",int.class,int.class);
            return (Boolean)settleMethod.invoke(helper,left,top);
        }catch(ReflectiveOperationException | RuntimeException error){
            return false;
        }
    }
    private static boolean finish(Object helper) {
        // ViewDragHelper.s is SwipeBackLayout$e; its a is the screen's own finish listener.
        Object listener=CommentsChromeTweaks.field(CommentsChromeTweaks.field(helper,"s"),"a");
        if(listener==null)return false;
        try {listener.getClass().getMethod("a").invoke(listener);return true;}
        catch(ReflectiveOperationException | RuntimeException error){return false;}
    }
}
