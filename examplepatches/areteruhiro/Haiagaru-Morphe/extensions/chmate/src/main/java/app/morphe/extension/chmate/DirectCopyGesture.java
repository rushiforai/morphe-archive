package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.Toast;

/** The toolbar and native gesture assignment switch the same persisted copy mode. */
final class DirectCopyGesture {
    static final String GESTURE="haiagaruGestureDirectCopy";
    static final String KEY="directBodySelection";
    static final int TOOLBAR_ACTION=0x7e000004;
    static boolean gesture(View view){
        if(view==null)return false;
        Context context=view.getContext();
        while(context instanceof ContextWrapper&&!(context instanceof Activity)){
            Context next=((ContextWrapper)context).getBaseContext();if(next==context)break;context=next;
        }
        return context instanceof Activity&&toggle((Activity)context);
    }
    static boolean toggle(Activity activity){
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return false;
        SharedPreferences prefs=FeatureSwitches.prefs(activity);
        boolean enabled=!prefs.getBoolean(KEY,false);
        prefs.edit().putBoolean(KEY,enabled).apply();
        EmojiFontFallback.refreshVisibleRows();
        View button=activity.getWindow().getDecorView().findViewById(TOOLBAR_ACTION);
        if(button!=null){button.setActivated(enabled);button.setSelected(enabled);
            button.setContentDescription("長押しコピー: "+(enabled?"ON":"OFF"));}
        Toast.makeText(activity,enabled?"長押しコピー: ON（本文を長押しして範囲選択）"
            :"長押しコピー: OFF（従来のレスメニュー）",Toast.LENGTH_SHORT).show();
        return true;
    }
    private DirectCopyGesture(){}
}
