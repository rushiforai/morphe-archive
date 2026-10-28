package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.widget.*;

public final class VideoViewerSettings {
    static final String HOLD_SPEED="videoHoldDoubleSpeed",TAP_CONTROLS="videoTapControls",CHMATE_GESTURES="videoChmateGestures",
            X_GIF_AUTOPLAY="xMp4GifAutoplay",INLINE_GIF="inlineGifAutoplay",
            INLINE_LIMIT="inlineGifLimit",INLINE_MB="inlineGifMaxMb",
            MEDIA_SWIPE="mediaSwipeNavigation",GIF_AUTOPLAY="gifAutoplay",GIF_NATIVE="gifUseNativeViewer",
            VIDEO_NATIVE="videoUseNativeViewer",THREAD_MEDIA="mediaSwipeWholeThread",LETTERBOX_TOUCH="videoLetterboxTouch";
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
    static int inlineLimit(Context context){return Math.max(1,Math.min(8,prefs(context).getInt(INLINE_LIMIT,2)));}
    static int inlineMaxMb(Context context){return Math.max(1,Math.min(64,prefs(context).getInt(INLINE_MB,8)));}
    static boolean xGif(String url) {
        try {
            java.net.URI uri=java.net.URI.create(url);
            return "video.twimg.com".equalsIgnoreCase(uri.getHost()) && uri.getUserInfo()==null
                    && uri.getPath()!=null && uri.getPath().startsWith("/tweet_video/")
                    && uri.getPath().toLowerCase(java.util.Locale.ROOT).endsWith(".mp4");
        } catch (RuntimeException invalid) { return false; }
    }
    static boolean autoplay(Context context,String url) {
        return prefs(context).getBoolean(xGif(url)?X_GIF_AUTOPLAY:"videoAutoplay",true);
    }
    static boolean nativeGif(Context context){return prefs(context).getBoolean(GIF_NATIVE,false);}
    static boolean nativeVideo(Context context){return prefs(context).getBoolean(VIDEO_NATIVE,false);}
    static void addSettingsButton(LinearLayout layout, Activity activity) {
        Button button = new Button(activity);
        button.setText("画像・GIF・動画ビューアの操作設定");
        button.setEnabled(VideoViewerActivity.installed(activity));
        button.setOnClickListener(v -> show(activity));
        layout.addView(button);
    }
    static void show(Activity activity) {
        SharedPreferences prefs = prefs(activity);
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * activity.getResources().getDisplayMetrics().density);
        body.setPadding(pad, pad, pad, pad);
        cornerSetting(body, activity, "戻るボタンの位置", ViewerCornerControls.BACK, 1);
        cornerSetting(body, activity, "︙メニューの位置", ViewerCornerControls.MORE, 0);
        Switch brightness = toggle(body, activity, "左半分の上下スワイプで明るさ調整", prefs.getBoolean("videoSwipeBrightness", false));
        Switch volume = toggle(body, activity, "右半分の上下スワイプで音量調整", prefs.getBoolean("videoSwipeVolume", false));
        Switch autoplay = toggle(body, activity, "動画を開いたら自動再生する", prefs.getBoolean("videoAutoplay", true));
        Switch nativeGif=toggle(body,activity,"GIFをHaiagaru専用ビューアで開かない",nativeGif(activity));
        Switch nativeVideo=toggle(body,activity,"動画をHaiagaru専用ビューアで開かない",nativeVideo(activity));
        Switch threadMedia=toggle(body,activity,"サムネイルからスレ全体の画像・GIF・動画へ左右移動",prefs.getBoolean(THREAD_MEDIA,false));
        Switch xGifAutoplay=toggle(body,activity,"X MP4 GIFを自動再生する（開いた後）",prefs.getBoolean(X_GIF_AUTOPLAY,true));
        Switch inlineGif=toggle(body,activity,"GIFを開かずにスレ内で自動再生する（X MP4 GIFも対象）",prefs.getBoolean(INLINE_GIF,false));
        TextView inlineHelp=new TextView(activity);inlineHelp.setText("スレ内再生は画面に見えているレスが対象です。同時再生数と通常GIFの取得サイズ上限は下の項目で変更できます。通常のGIFリンクとX投稿のGIFが対象です。通信量・電池消費が増えます。画面外や他のアプリへ移動すると停止します。");body.addView(inlineHelp);
        numberSetting(body,activity,"スレ内GIFの同時再生数（1〜8件）",INLINE_LIMIT,inlineLimit(activity),1,8);
        numberSetting(body,activity,"スレ内の通常GIFのファイルサイズ上限（1〜64MiB）",INLINE_MB,inlineMaxMb(activity),1,64);
        Switch gifAutoplay=toggle(body,activity,"GIFを開いたら自動再生する",prefs.getBoolean(GIF_AUTOPLAY,true));
        Switch holdSpeed=toggle(body,activity,"動画の長押し中は2倍速で再生する",prefs.getBoolean(HOLD_SPEED,true));
        Switch tapControls=toggle(body,activity,"動画のタップで再生バーを表示・非表示",prefs.getBoolean(TAP_CONTROLS,true));
        Switch nativeGestures=toggle(body,activity,"動画ビューアでChMateのジェスチャーを使う",prefs.getBoolean(CHMATE_GESTURES,true));
        Switch mediaSwipe=toggle(body,activity,"左右スワイプで同じレスの画像・GIF・動画へ移動",prefs.getBoolean(MEDIA_SWIPE,true));
        Switch letterbox=toggle(body,activity,"動画の上下・左右の余白でもタッチ操作する",prefs.getBoolean(LETTERBOX_TOUCH,true));
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
        note.setText("専用ビューアで開かない設定は、GIF・動画をそれぞれChMate標準の動作に戻します。YouTubeも動画側の設定に従います。スレ全体への左右移動は読み込み済みレスのメディアが対象で、同じレス内への左右移動より優先します。変更は次に開くメディアから反映します。長押し2倍速や再生バーなどは専用ビューアに適用します。上下操作をオンにした側ではChMateの縦ジェスチャーより優先します。"
                + "明るさはこの画面内だけ、音量は端末のメディア音量を変更します。"
                + "YouTubeは公式Webプレーヤーの操作を使います。広告・地域制限・埋め込み制限などは回避しません。");
        body.addView(note);
        ScrollView scroll = new ScrollView(activity); scroll.addView(body);
        LiveSettings live=new LiveSettings(prefs,()->body.invalidate());
        live.toggle(brightness,"videoSwipeBrightness");live.toggle(volume,"videoSwipeVolume");
        live.toggle(autoplay,"videoAutoplay");
        live.toggle(nativeGif,GIF_NATIVE);live.toggle(nativeVideo,VIDEO_NATIVE);live.toggle(threadMedia,THREAD_MEDIA);
        live.toggle(xGifAutoplay,X_GIF_AUTOPLAY);live.toggle(inlineGif,INLINE_GIF);
        live.toggle(gifAutoplay,GIF_AUTOPLAY);live.toggle(holdSpeed,HOLD_SPEED);live.toggle(tapControls,TAP_CONTROLS);
        live.toggle(nativeGestures,CHMATE_GESTURES);live.toggle(mediaSwipe,MEDIA_SWIPE);
        live.toggle(letterbox,LETTERBOX_TOUCH);
        live.toggle(doubleTap,"videoDoubleTapSeek");live.toggle(youtube,"videoYoutubeEnabled");
        final int[] previous={seconds.getSelectedItemPosition()};
        seconds.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){
            public void onItemSelected(android.widget.AdapterView<?> parent,android.view.View view,int position,long id){
                if(previous[0]==position)return;previous[0]=position;
                prefs.edit().putInt("videoDoubleTapSeconds",values[position]).apply();
            }
            public void onNothingSelected(android.widget.AdapterView<?> parent){}
        });
        new HaiagaruDialog.Builder(activity).setTitle("ビューアの操作設定").setView(scroll)
                .setNegativeButton("戻る",null).show();
    }
    private static void numberSetting(LinearLayout body, Activity activity,String label,String key,int initial,int min,int max){
        TextView title=new TextView(activity);title.setText(label);body.addView(title);
        EditText input=new EditText(activity);input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);input.setSingleLine(true);input.setText(String.valueOf(initial));body.addView(input);
        input.addTextChangedListener(new android.text.TextWatcher(){
            public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            public void onTextChanged(CharSequence s,int start,int before,int count){try{int value=Integer.parseInt(s.toString());if(value<min||value>max){input.setError(min+"〜"+max+"で指定してください");return;}input.setError(null);prefs(activity).edit().putInt(key,value).apply();}catch(NumberFormatException invalid){input.setError("数値を入力してください");}}
            public void afterTextChanged(android.text.Editable text){}
        });
    }
    private static void cornerSetting(LinearLayout body, Activity activity, String label, String key, int fallback){
        TextView title=new TextView(activity);title.setText(label);body.addView(title);
        Spinner choice=new Spinner(activity);
        choice.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_spinner_dropdown_item,new String[]{"右上","左上","右下","左下"}));
        int value=prefs(activity).getInt(key,fallback);choice.setSelection(value>=0&&value<4?value:fallback);
        choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onItemSelected(AdapterView<?> parent,android.view.View view,int position,long id){prefs(activity).edit().putInt(key,position).apply();}
            public void onNothingSelected(AdapterView<?> parent){}
        });body.addView(choice);
    }
    private static Switch toggle(LinearLayout body, Context context, String title, boolean checked) {
        Switch view = new LiveSettings.Toggle(context); view.setText(title); view.setChecked(checked); body.addView(view); return view;
    }
}
