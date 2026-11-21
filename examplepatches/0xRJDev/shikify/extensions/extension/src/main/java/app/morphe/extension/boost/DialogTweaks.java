package app.morphe.extension.boost;

import android.app.Dialog;
import android.content.Context;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;

/** Boost's option menus float like the bottom bar; other dialogs stay centred. */
public final class DialogTweaks {
    private DialogTweaks() { }
    public static void onShow(Object instance) {
        if(!(instance instanceof Dialog))return;
        try {
            Dialog dialog=(Dialog)instance;Window window=dialog.getWindow();if(window==null)return;
            Context context=dialog.getContext();
            if(Build.VERSION.SDK_INT>=31 && !SurfaceSettingsActivity.enabled(context,"dialog_blur"))window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            View menuView=find(window.getDecorView());
            if(menuView!=null)ShareHold.attach(dialog,menuView);
            if(menuView!=null && Build.VERSION.SDK_INT>=31 && SurfaceSettingsActivity.enabled(context,"glass_menus",true))glass(window,context);
            if(!SurfaceSettingsActivity.enabled(context,"material_dialogs") || menuView==null)return;
            float density=context.getResources().getDisplayMetrics().density;int margin=Math.round(12*density);
            WindowManager.LayoutParams params=window.getAttributes();
            params.width=Math.min(context.getResources().getDisplayMetrics().widthPixels-margin*2,Math.round(640*density));
            params.height=WindowManager.LayoutParams.WRAP_CONTENT;
            params.gravity=Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL;params.y=margin;
            int animation=context.getResources().getIdentifier("Animation.Material3.BottomSheetDialog","style",context.getPackageName());
            if(animation!=0)params.windowAnimations=animation;
            window.setAttributes(params);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }catch(RuntimeException error){}
    }
    /**
     * Glass menus: instead of blurring the whole screen behind a post or comment menu, the menu
     * itself is a frosted bubble. Android blurs only what's behind the window, clipped to its shape.
     */
    @android.annotation.TargetApi(31)
    private static void glass(Window window,Context context) {
        window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
        window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0));
        View content=window.getDecorView().findViewById(android.R.id.content);
        if(!(content instanceof ViewGroup) || ((ViewGroup)content).getChildCount()==0)return;
        View host=((ViewGroup)content).getChildAt(0);
        android.app.Activity activity=CommentsChromeTweaks.activity(context);
        if(activity==null || activity.getWindow()==null)return;
        // The same frosted glass as the pills and popup menus, sampling the screen behind the menu.
        FeedPillBlur glass=new FeedPillBlur(activity.getWindow().getDecorView(),host,SurfaceAppearanceTweaks.role(context,true),false,28,true,72,2);
        host.setBackground(glass);
        host.setClipToOutline(true);
        glass.start();
        host.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            @Override public void onViewAttachedToWindow(View view){glass.start();}
            @Override public void onViewDetachedFromWindow(View view){glass.stop();}
        });
    }
    static View find(View view) {
        if(view.getClass().getName().endsWith(".menu.MenuView"))return view;
        if(!(view instanceof ViewGroup))return null;
        ViewGroup group=(ViewGroup)view;
        for(int index=0;index<group.getChildCount();index++){View found=find(group.getChildAt(index));if(found!=null)return found;}
        return null;
    }
}
