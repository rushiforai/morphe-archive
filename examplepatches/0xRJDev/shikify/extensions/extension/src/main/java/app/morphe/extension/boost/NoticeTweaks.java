package app.morphe.extension.boost;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Shows Boost's toasts as Material 3 notices above the bottom bar while the app is in front. */
public final class NoticeTweaks {
    private static final WeakHashMap<Toast,CharSequence> TEXT=new WeakHashMap<>();
    private static WeakReference<View> current=new WeakReference<>(null);
    private NoticeTweaks() { }
    public static Toast make(Context context,CharSequence text,int duration) {
        Toast toast=Toast.makeText(context,text,duration);
        synchronized(TEXT){TEXT.put(toast,text);}
        return toast;
    }
    public static Toast make(Context context,int text,int duration) {
        return make(context,context.getResources().getText(text),duration);
    }
    /** A background app, or a toast built some other way, keeps the system toast. */
    public static void show(Toast toast) {
        CharSequence text;
        synchronized(TEXT){text=TEXT.remove(toast);}
        Activity activity=SurfaceAppearanceTweaks.current();
        if(TextUtils.isEmpty(text) || activity==null || activity.isFinishing() || !SurfaceSettingsActivity.enabled(activity,"material_notices")){toast.show();return;}
        CharSequence message=text;boolean extended=toast.getDuration()==Toast.LENGTH_LONG;
        Runnable notice=()->{if(!post(activity,message,extended))toast.show();};
        if(Looper.myLooper()==Looper.getMainLooper())notice.run();else activity.runOnUiThread(notice);
    }
    private static boolean post(Activity activity,CharSequence text,boolean extended) {
        View content=activity.findViewById(android.R.id.content);
        if(!(content instanceof FrameLayout))return false;
        FrameLayout root=(FrameLayout)content;
        View previous=current.get();
        if(previous!=null && previous.getParent() instanceof ViewGroup)((ViewGroup)previous.getParent()).removeView(previous);
        float density=root.getResources().getDisplayMetrics().density;
        TextView view=new TextView(activity);
        view.setText(text);view.setTextSize(14);view.setMaxLines(3);view.setEllipsize(TextUtils.TruncateAt.END);
        view.setTextColor(MaterialYouTweaks.color(activity,"colorOnSurfaceInverse",android.R.attr.textColorPrimaryInverse));
        view.setBackground(SurfaceAppearanceTweaks.pillBackground(activity,MaterialYouTweaks.color(activity,"colorSurfaceInverse",android.R.attr.colorForeground),16));
        view.setPadding(Math.round(16*density),Math.round(14*density),Math.round(16*density),Math.round(14*density));
        view.setElevation(6*density);
        FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM);
        params.leftMargin=params.rightMargin=Math.round(16*density);
        params.bottomMargin=clearance(activity,root,density);
        root.addView(view,params);current=new WeakReference<>(view);
        view.setAlpha(0);view.setTranslationY(8*density);
        view.animate().alpha(1).translationY(0).setDuration(200).setInterpolator(Motion.EMPHASIZED).start();
        view.postDelayed(()->view.animate().alpha(0).setDuration(150).withEndAction(()->{if(view.getParent() instanceof ViewGroup)((ViewGroup)view.getParent()).removeView(view);}).start(),extended ? 3500:2000);
        return true;
    }
    /** Sits above the floating bottom bar when one is showing, otherwise above the system bar. */
    private static int clearance(Activity activity,View root,float density) {
        int gap=Math.round(12*density);
        View nav=SurfaceAppearanceTweaks.find(activity.getWindow().getDecorView(),"bottom_navigation_view");
        if(nav!=null && nav.isShown() && nav.getTop()>0)return root.getHeight()-nav.getTop()+gap;
        android.view.WindowInsets insets=root.getRootWindowInsets();
        return gap+(insets==null ? 0:insets.getSystemWindowInsetBottom());
    }
}
