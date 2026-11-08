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
            if(!SurfaceSettingsActivity.enabled(context,"material_dialogs") || !menu(window.getDecorView()))return;
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
    private static boolean menu(View view) {
        if(view.getClass().getName().endsWith(".menu.MenuView"))return true;
        if(!(view instanceof ViewGroup))return false;
        ViewGroup group=(ViewGroup)view;
        for(int index=0;index<group.getChildCount();index++)if(menu(group.getChildAt(index)))return true;
        return false;
    }
}
