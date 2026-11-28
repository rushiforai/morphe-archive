package app.sharklatan.youtube.airplay;
import android.app.Activity;
import android.os.*;
import android.view.*;
import android.widget.*;
import android.graphics.drawable.Drawable;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.*;

/** Inserts a separate child in YouTube's horizontal top-control row. */
public final class AirPlayEntry {
    private static final Map<Activity,Boolean> attached=new WeakHashMap<>();
    private static final String TAG="sharklatan.airplay.native.control";
    public static void attach(Activity activity){
        if(attached.containsKey(activity))return;attached.put(activity,true);
        WeakReference<Activity> ref=new WeakReference<>(activity);Handler handler=new Handler(Looper.getMainLooper());
        handler.post(new Runnable(){public void run(){
            Activity host=ref.get();if(host==null||host.isDestroyed())return;
            try{
                View row=host.findViewById(0x7f0b0ef7); // player_additional_view_container, native horizontal row
                if(row instanceof LinearLayout&&((LinearLayout)row).getOrientation()==LinearLayout.HORIZONTAL&&row.findViewWithTag(TAG)==null){
                    LinearLayout parent=(LinearLayout)row;
                    View cast=host.findViewById(0x7f0b0f1d); // player_mdx_entry_point_button
                    ImageView icon;
                    try{icon=(ImageView)host.getClassLoader().loadClass("com.google.android.libraries.youtube.common.ui.TouchImageView").getConstructor(android.content.Context.class).newInstance(host);}
                    catch(ReflectiveOperationException e){icon=new ImageView(host);}
                    icon.setId(View.generateViewId());icon.setTag(TAG);icon.setContentDescription("AirPlay");icon.setClickable(true);icon.setFocusable(true);
                    int size=host.getResources().getDimensionPixelSize(0x7f07041e); // native top-control target dimension
                    int padding=host.getResources().getDimensionPixelSize(0x7f07041d);
                    icon.setPadding(padding,padding,padding,padding);icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
                    if(cast!=null&&cast.getBackground()!=null&&cast.getBackground().getConstantState()!=null)icon.setBackground(cast.getBackground().getConstantState().newDrawable(host.getResources()));
                    try(InputStream in=host.getAssets().open("sharklatan/airplay.png")){icon.setImageDrawable(Drawable.createFromStream(in,"AirPlay"));}
                    int index=0;
                    if(cast!=null){View branch=cast;while(branch.getParent() instanceof View&&branch.getParent()!=parent)branch=(View)branch.getParent();if(branch.getParent()==parent)index=parent.indexOfChild(branch);}
                    parent.addView(icon,index,new LinearLayout.LayoutParams(size,size));
                    icon.setOnClickListener(v->AirPlayActivity.show(host));
                    android.util.Log.i("YouTubeAirPlay","AirPlay inserted into native horizontal controls.");
                }
            }catch(Exception e){android.util.Log.e("YouTubeAirPlay","Native controls integration",e);}
            if(NativeRemote.active)RemoteScreen.refresh(host);else RemoteScreen.ensureRestored(host);
            handler.postDelayed(this,500);
        }});
    }
}
