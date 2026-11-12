package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.*;
import java.lang.ref.WeakReference;

/** Source errors remain readable even when the native network toast is truncated. */
final class SiteReadFailureUi {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static WeakReference<AlertDialog> shown=new WeakReference<>(null);
    private static String previous="";private static long previousAt;
    static void show(Exception error){
        if(!(error instanceof BakusaiAccessError))return;
        BakusaiAccessError source=(BakusaiAccessError)error;
        MAIN.post(()->showOnMain(source,0,null));
    }
    private static void showOnMain(BakusaiAccessError source,int attempt,Activity original){
            Activity activity=Haiagaru.toolbarActivity(null);
            if(activity==null||activity.isFinishing()||activity.isDestroyed()||original!=null&&original!=activity)return;
            if(!activity.hasWindowFocus()){
                if(attempt<8)MAIN.postDelayed(()->showOnMain(source,attempt+1,activity),250);
                return;
            }
            long now=SystemClock.elapsedRealtime();AlertDialog dialog=shown.get();
            if(dialog!=null&&dialog.isShowing()||source.sourceCode.equals(previous)&&now-previousAt<5000)return;
            previous=source.sourceCode;previousAt=now;
            AlertDialog next=new AlertDialog.Builder(activity)
                    .setTitle("爆サイ接続エラー："+source.displayCode())
                    .setMessage("しばらくしてアクセスし直してください。\n\n元サイトのエラー番号："+source.sourceCode)
                    .setPositiveButton("閉じる",null).create();
            next.setOnDismissListener(ignored->{if(shown.get()==next)shown.clear();});
            next.show();shown=new WeakReference<>(next);
    }
    private SiteReadFailureUi(){}
}
