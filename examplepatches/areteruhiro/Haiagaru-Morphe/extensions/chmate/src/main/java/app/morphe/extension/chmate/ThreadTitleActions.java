package app.morphe.extension.chmate;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import java.lang.reflect.Field;

/** Extends the native title dialog before its view is attached; native actions stay intact. */
public final class ThreadTitleActions {
    private static java.lang.ref.WeakReference<Object> pending=new java.lang.ref.WeakReference<>(null);
    public static View wrap(Object fragment,View original){
        if(original==null)return null;
        try{
            Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return original;
            String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
            if(!"0.8.10.191 dev".equals(version)){
                // Material's ModalBottomSheet creates a separate Dialog window.
                // Decorating this Fragment's ComposeView would put controls behind it.
                pending=new java.lang.ref.WeakReference<>(fragment);return original;
            }
            return content(fragment,a,original,true);
        }catch(Exception error){android.util.Log.w("Haiagaru","Thread title actions unavailable",error);return original;}
    }
    public static void decorateDialog(android.app.Dialog dialog){
        Object fragment=pending.get();if(fragment==null||dialog.getWindow()==null)return;
        try{
            if(!(Boolean)fragment.getClass().getMethod("isAdded").invoke(fragment)
                    ||fragment.getClass().getMethod("getView").invoke(fragment)==null){pending.clear();return;}
            Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return;
            android.view.ViewGroup root=dialog.getWindow().findViewById(android.R.id.content);
            if(root==null||root.getChildCount()!=1)return;
            View original=root.getChildAt(0);
            // onStart runs before WindowManager attaches the dialog: moving the
            // still-detached ComposeView does not dispose a live composition.
            if(original.isAttachedToWindow())return;
            android.view.ViewGroup.LayoutParams params=original.getLayoutParams();
            root.removeView(original);
            View wrapped;
            try{wrapped=content(fragment,a,original,false);}catch(Exception error){root.addView(original,params);throw error;}
            root.addView(wrapped,params);pending.clear();
        }catch(Exception error){android.util.Log.w("Haiagaru","Thread title dialog actions unavailable",error);}
    }
    private static View content(Object fragment,Activity a,View original,boolean old)throws Exception{
            String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
            Bundle args=(Bundle)fragment.getClass().getMethod("getArguments").invoke(fragment);if(args==null)return original;
            Object info=args.get("threadUrl");
            if(info==null){Object packed=args.get("args");if(packed!=null)for(Field f:packed.getClass().getDeclaredFields())if(f.getType().getName().equals("jp.syoboi.a2chMate.client.BBSUrlInfo")){f.setAccessible(true);info=f.get(packed);break;}}
            if(info==null)return original;
            boolean middle="0.8.10.226 dev".equals(version);
            String server=(String)NativeFields.find(info.getClass(),old?"i":middle?"g":"f").get(info);
            String board=(String)NativeFields.find(info.getClass(),old?"b":middle?"f":"g").get(info);
            Object id=NativeFields.find(info.getClass(),middle?"c":"e").get(info);
            ThreadWatchRules.Target t=ThreadWatchRules.fromParts(server,board,id);
            LinearLayout box=new LinearLayout(a);box.setOrientation(LinearLayout.VERTICAL);
            // 226/242 render a full-window Compose bottom sheet, rather than a
            // window-sized dialog. Keep extra actions beneath that sheet's content.
            box.addView(original,old?new LinearLayout.LayoutParams(-1,-2):new LinearLayout.LayoutParams(-1,0,1));
            LinearLayout controls=new LinearLayout(a);controls.setOrientation(LinearLayout.VERTICAL);
            LinearLayout actions=new LinearLayout(a);
            android.util.TypedValue background=new android.util.TypedValue();
            int panelColor=(a.getResources().getConfiguration().uiMode&android.content.res.Configuration.UI_MODE_NIGHT_MASK)==android.content.res.Configuration.UI_MODE_NIGHT_YES?0xff202020:0xfffafafa;
            if(a.getTheme().resolveAttribute(android.R.attr.colorBackground,background,true))panelColor=background.data|0xff000000;
            // The checkbox lies outside Material's sheet Surface. Paint the complete
            // control area so the thread behind the transparent dialog cannot show through.
            controls.setBackgroundColor(panelColor);
            if(!old)controls.setOnApplyWindowInsetsListener((v,insets)->{
                int bottom=android.os.Build.VERSION.SDK_INT>=30?insets.getInsets(android.view.WindowInsets.Type.systemBars()).bottom:insets.getSystemWindowInsetBottom();
                v.setPadding(0,0,0,bottom);return insets;
            });
            android.widget.CheckBox refresh=RefreshTargets.control(a,info);
            if(refresh!=null)controls.addView(refresh,new LinearLayout.LayoutParams(-1,-2));
            if(t!=null){
            Button watch=new Button(a);watch.setAllCaps(false);watch.setText("このスレの新着通知");actions.addView(watch,new LinearLayout.LayoutParams(0,-2,1));
            watch.setOnClickListener(v->ThreadWatch.show(a,t));
            if(ReadingAuth.eligible(t.url)){
                Button auth=new Button(a);auth.setText("エッヂの閲覧認証");auth.setAllCaps(false);actions.addView(auth,new LinearLayout.LayoutParams(0,-2,1));
                auth.setOnClickListener(v->ReadingAuth.open(a,t.url));
            }
            }
            controls.addView(actions,new LinearLayout.LayoutParams(-1,-2));
            box.addView(controls,new LinearLayout.LayoutParams(-1,-2));
            return box;
    }
    private ThreadTitleActions(){}
}
