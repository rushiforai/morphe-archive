package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.widget.*;

public final class VideoViewerSettings {
    private VideoViewerSettings() { }
    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config", 0);
    }
    static int skipSeconds(Context context) {
        int value = prefs(context).getInt("videoDoubleTapSeconds", 10);
        return value == 5 || value == 15 || value == 30 || value == 60 ? value : 10;
    }
    static boolean youtubeEnabled(Context context) {
        return prefs(context).getBoolean("videoYoutubeEnabled", true);
    }
    static void addSettingsButton(LinearLayout layout, Activity activity) {
        Button button = new Button(activity);
        button.setText("動画ビューアの操作・YouTube設定");
        button.setEnabled(VideoViewerActivity.installed(activity));
        button.setOnClickListener(v -> show(activity));
        layout.addView(button);
    }
    static void show(Activity activity) {
        SharedPreferences prefs = prefs(activity);
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * activity.getResources().getDisplayMetrics().density);
        body.setPadding(pad, pad, pad, pad);
        Switch brightness = toggle(body, activity, "左半分の上下スワイプで明るさ調整", prefs.getBoolean("videoSwipeBrightness", false));
        Switch volume = toggle(body, activity, "右半分の上下スワイプで音量調整", prefs.getBoolean("videoSwipeVolume", false));
        Switch autoplay = toggle(body, activity, "動画を開いたら自動再生する", prefs.getBoolean("videoAutoplay", true));
        Switch doubleTap = toggle(body, activity, "左ダブルタップで巻き戻し／右ダブルタップで早送り", prefs.getBoolean("videoDoubleTapSeek", false));
        TextView label = new TextView(activity); label.setText("戻る／進む・ダブルタップで移動する秒数"); body.addView(label);
        Spinner seconds = new Spinner(activity);
        String[] labels = {"5秒", "10秒", "15秒", "30秒", "60秒"};
        int[] values = {5, 10, 15, 30, 60};
        seconds.setAdapter(new ArrayAdapter<>(activity, android.R.layout.simple_spinner_dropdown_item, labels));
        for (int i = 0; i < values.length; i++) if (values[i] == skipSeconds(activity)) seconds.setSelection(i);
        body.addView(seconds);
        Switch youtube = toggle(body, activity, "YouTubeをアプリ内の公式プレーヤーで開く", youtubeEnabled(activity));
        TextView note = new TextView(activity);
        note.setText("操作設定は通常の動画専用ビューアが対象です。上下操作をオンにした側ではChMateの縦ジェスチャーより優先します。"
                + "明るさはこの画面内だけ、音量は端末のメディア音量を変更します。"
                + "YouTubeは公式Webプレーヤーの操作を使います。広告・地域制限・埋め込み制限などは回避しません。");
        body.addView(note);
        ScrollView scroll = new ScrollView(activity); scroll.addView(body);
        LiveSettings live=new LiveSettings(prefs,()->body.invalidate());
        live.toggle(brightness,"videoSwipeBrightness");live.toggle(volume,"videoSwipeVolume");
        live.toggle(autoplay,"videoAutoplay");
        live.toggle(doubleTap,"videoDoubleTapSeek");live.toggle(youtube,"videoYoutubeEnabled");
        final int[] previous={seconds.getSelectedItemPosition()};
        seconds.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){
            public void onItemSelected(android.widget.AdapterView<?> parent,android.view.View view,int position,long id){
                if(previous[0]==position)return;previous[0]=position;
                prefs.edit().putInt("videoDoubleTapSeconds",values[position]).apply();
            }
            public void onNothingSelected(android.widget.AdapterView<?> parent){}
        });
        new HaiagaruDialog.Builder(activity).setTitle("動画ビューアの操作設定").setView(scroll)
                .setNegativeButton("戻る",null).show();
    }
    private static Switch toggle(LinearLayout body, Context context, String title, boolean checked) {
        Switch view = new LiveSettings.Toggle(context); view.setText(title); view.setChecked(checked); body.addView(view); return view;
    }
}
