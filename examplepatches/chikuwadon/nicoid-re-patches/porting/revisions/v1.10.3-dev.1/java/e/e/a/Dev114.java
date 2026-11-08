package e.e.a;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/** Unified unlimited-comment preference, resource guard and effective limit. */
public final class Dev114 {
    public static final int UNLIMITED = -1;
    private Dev114() {}

    private static String tr(Context c,String ja,String en) {
        return c.getResources().getConfiguration().locale.getLanguage().equals("ja") ? ja : en;
    }
    private static String label(Context c,int limit) {
        if(limit==0)return tr(c,"標準（追加取得なし）","Standard (no extra requests)");
        if(limit==UNLIMITED)return tr(c,"無制限","Unlimited");
        return limit+tr(c,"件"," comments");
    }
    private static int toProgress(int limit) {
        return limit==UNLIMITED?21:Math.max(0,Math.min(20,limit/500));
    }
    private static int fromProgress(int p) {
        return p>=21?UNLIMITED:p*500;
    }
    public static int effectiveLimit(int original) {
        if(original==UNLIMITED) return Integer.MAX_VALUE;
        return original>0?Math.min(10000,original):0;
    }
    /** Stop safely before an out-of-memory failure, retaining comments already obtained. */
    public static boolean memoryAvailable() {
        Runtime vm=Runtime.getRuntime();
        long free=vm.maxMemory()-vm.totalMemory()+vm.freeMemory();
        return free>32L*1024*1024;
    }
    public static void installSettings(PreferenceActivity activity) {
        Preference option=activity.findPreference("comment_fetch_limit");
        if(option==null)return;
        SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(activity);
        int current=prefs.getInt("comment_fetch_limit",0);
        option.setSummary(label(activity,current)+" - "+tr(activity,
            "次回の再生から反映。無制限でもサーバー・メモリ制限により停止します",
            "Applies on next playback. Unlimited stops on server/resource limits."));
        option.setOnPreferenceClickListener(v->{
            LinearLayout content=new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int pad=Math.round(activity.getResources().getDisplayMetrics().density*24);
            content.setPadding(pad,pad,pad,pad);
            TextView value=new TextView(activity);
            value.setTextSize(16);
            value.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
            content.addView(value,new LinearLayout.LayoutParams(-1,-2));
            SeekBar slider=new SeekBar(activity);
            slider.setMax(21);
            slider.setProgress(toProgress(prefs.getInt("comment_fetch_limit",0)));
            content.addView(slider,new LinearLayout.LayoutParams(-1,-2));
            value.setText(label(activity,fromProgress(slider.getProgress())));
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
                public void onProgressChanged(SeekBar seekBar,int progress,boolean fromUser) {
                    value.setText(label(activity,fromProgress(progress)));
                }
                public void onStartTrackingTouch(SeekBar seekBar){}
                public void onStopTrackingTouch(SeekBar seekBar){}
            });
            AlertDialog dialog=new AlertDialog.Builder(activity)
                .setTitle(tr(activity,"コメント取得数","Comments to load"))
                .setView(content)
                .setPositiveButton(tr(activity,"OK","OK"),(d,w)->{
                    int selected=fromProgress(slider.getProgress());
                    prefs.edit().putInt("comment_fetch_limit",selected).apply();
                    option.setSummary(label(activity,selected)+" - "+tr(activity,
                        "次回の再生から反映。無制限でもサーバー・メモリ制限により停止します",
                        "Applies on next playback. Unlimited stops on server/resource limits."));
                })
                .setNegativeButton(tr(activity,"キャンセル","Cancel"),null).create();
            dialog.show();
            return true;
        });
    }
}
