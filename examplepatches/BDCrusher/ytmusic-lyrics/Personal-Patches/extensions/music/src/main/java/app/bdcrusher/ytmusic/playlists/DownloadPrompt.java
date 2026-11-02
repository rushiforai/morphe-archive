/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.app.*;
import android.content.*;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.function.Consumer;
import app.morphe.extension.music.patches.downloads.LocalDownloadManager;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.theme.ThemeUtils;

/** A themed bottom sheet using platform controls, with honest audio-format size estimates. */
public final class DownloadPrompt {
    private static final Set<String> open=new HashSet<>();
    private DownloadPrompt(){}
    public static SharedPreferences preferences(Context c){return c.getSharedPreferences("bdcrusher_audio_downloads",Context.MODE_PRIVATE);}
    public static AudioQuality.Tier selected(Context c){return AudioQuality.Tier.parse(preferences(c).getString("quality","HIGH"));}
    private static int dp(Context c,int n){return Math.round(n*c.getResources().getDisplayMetrics().density);}
    public static void song(String id){
        Activity a=Utils.getActivity();if(a==null||a.isFinishing()||a.isDestroyed()){Utils.showToastShort("Open YouTube Music to choose download quality");return;}
        SharedPreferences prefs=preferences(a);if(prefs.getBoolean("remember",false)){LocalDownloadManager.enqueueBatch(id,selected(a));return;}
        if(!open.add(id))return;
        show(a,"Download audio",null,tier->LocalDownloadManager.enqueueBatch(id,tier),id);
    }
    public static void playlist(Activity a,String id,String title,Runnable start){
        if(a==null||a.isFinishing()||a.isDestroyed())return;
        if(preferences(a).getBoolean("remember",false)){start.run();return;}
        if(!open.add("playlist:"+id))return;
        show(a,"Download playlist",title,tier->start.run(),"playlist:"+id);
    }
    private static void show(Activity a,String title,String playlist,Consumer<AudioQuality.Tier> start,String key){
        Dialog dialog=new Dialog(a);LinearLayout body=new LinearLayout(a);body.setOrientation(LinearLayout.VERTICAL);int pad=dp(a,24);body.setPadding(pad,dp(a,18),pad,pad);
        int foreground=ThemeUtils.getAppForegroundColor();GradientDrawable background=new GradientDrawable();background.setColor(ThemeUtils.getAppBackgroundColor());background.setCornerRadii(new float[]{pad,pad,pad,pad,0,0,0,0});body.setBackground(background);
        TextView heading=new TextView(a);heading.setText(title);heading.setTextSize(22);heading.setTextColor(foreground);body.addView(heading);
        TextView detail=new TextView(a);detail.setText(playlist==null?"Opus audio · artwork saved alongside audio":"Opus audio · "+playlist+"\nSize is calculated from available formats as playlist entries resolve.");detail.setTextColor(foreground);detail.setPadding(0,dp(a,12),0,dp(a,12));body.addView(detail);
        RadioGroup group=new RadioGroup(a);body.addView(group);Map<AudioQuality.Tier,RadioButton> choices=new EnumMap<>(AudioQuality.Tier.class);
        AudioQuality.Tier initial=selected(a);
        for(AudioQuality.Tier tier:AudioQuality.Tier.values()){RadioButton row=new RadioButton(a);row.setId(View.generateViewId());row.setText(tier.label+" · Opus"+(playlist==null?" — checking size…":""));row.setTextColor(foreground);row.setMinHeight(dp(a,56));choices.put(tier,row);group.addView(row);if(tier==initial)row.setChecked(true);}
        CheckBox remember=new CheckBox(a);remember.setText("Remember my settings");remember.setTextColor(foreground);remember.setMinHeight(dp(a,56));body.addView(remember);
        LinearLayout buttons=new LinearLayout(a);Button cancel=new Button(a),download=new Button(a);cancel.setText("Cancel");download.setText("Download");cancel.setAllCaps(false);download.setAllCaps(false);buttons.addView(cancel,new LinearLayout.LayoutParams(0,-2,1));buttons.addView(download,new LinearLayout.LayoutParams(0,-2,1));body.addView(buttons);
        cancel.setOnClickListener(v->dialog.dismiss());download.setEnabled(false);
        download.setOnClickListener(v->{AudioQuality.Tier tier=initial;for(var choice:choices.entrySet())if(choice.getValue().isChecked())tier=choice.getKey();preferences(a).edit().putString("quality",tier.name()).putBoolean("remember",remember.isChecked()).apply();dialog.dismiss();start.accept(tier);});
        java.util.concurrent.atomic.AtomicReference<java.util.concurrent.Future<?>> pending=new java.util.concurrent.atomic.AtomicReference<>();
        java.util.concurrent.atomic.AtomicBoolean closed=new java.util.concurrent.atomic.AtomicBoolean();
        Runnable cleanup=()->{closed.set(true);open.remove(key);java.util.concurrent.Future<?> task=pending.getAndSet(null);if(task!=null)task.cancel(true);};
        ScrollView scroll=new ScrollView(a);scroll.setFillViewport(false);scroll.addView(body);dialog.setContentView(scroll);dialog.setOnDismissListener(d->cleanup.run());
        Window window=dialog.getWindow();if(window!=null){window.setBackgroundDrawableResource(android.R.color.transparent);window.setGravity(Gravity.BOTTOM);window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);window.setDimAmount(.45f);}
        if(window!=null)window.getDecorView().addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View view){}public void onViewDetachedFromWindow(View view){cleanup.run();view.removeOnAttachStateChangeListener(this);}});
        body.setOnApplyWindowInsetsListener((view,insets)->{int left,right,bottom;if(android.os.Build.VERSION.SDK_INT>=30){android.graphics.Insets navigation=insets.getInsets(WindowInsets.Type.navigationBars());left=navigation.left;right=navigation.right;bottom=navigation.bottom;}else{left=insets.getStableInsetLeft();right=insets.getStableInsetRight();bottom=insets.getStableInsetBottom();}body.setPadding(pad+left,dp(a,18),pad+right,pad+bottom);return insets;});
        dialog.show();app.bdcrusher.ytmusic.common.PersonalRuntime.dialog(dialog);if(window!=null)window.setLayout(-1,-2);body.requestApplyInsets();
        if(playlist!=null)pending.set(PlaylistRuntime.preview(key.substring("playlist:".length()),result->{if(closed.get()||!dialog.isShowing())return;detail.setText(result.count()+" songs · Opus audio with artwork\nEstimated from playlist lengths and a returned Opus stream; actual sizes vary."+(result.unknown()>0?"\n"+result.unknown()+" lengths unavailable.":""));for(var entry:choices.entrySet()){var format=AudioQuality.select(result.sample(),entry.getKey());long rate=format==null?0:format.getAverageBitrate()>0?format.getAverageBitrate():format.getBitrate();long bytes=rate>0&&result.seconds()>0?rate*result.seconds()/8:-1;entry.getValue().setText(entry.getKey().label+" · Opus — "+(bytes>0?"~"+android.text.format.Formatter.formatShortFileSize(a,bytes)+(result.unknown()>0?"+":""):"size unavailable"));}download.setEnabled(result.count()>0);},message->{if(!closed.get()&&dialog.isShowing()){detail.setText(message);download.setEnabled(true);}}));
        if(playlist==null)pending.set(Utils.submitOnBackgroundThread(()->{try{LocalDownloadManager.AudioOptions options=LocalDownloadManager.options(key);a.runOnUiThread(()->{
            if(closed.get()||!dialog.isShowing())return;boolean available=false;
            for(var entry:choices.entrySet()){var format=AudioQuality.select(options.formats(),entry.getKey());RadioButton row=entry.getValue();row.setEnabled(format!=null);long bytes=AudioQuality.estimate(format,options.seconds());row.setText(entry.getKey().label+" · Opus"+(format==null?" — unavailable":bytes>0?" — ~"+android.text.format.Formatter.formatShortFileSize(a,bytes):" — size unavailable"));available|=format!=null;}
            download.setEnabled(available);if(!available)detail.setText("No downloadable Opus stream is currently available. No other codec will be substituted.");
        });}catch(Exception error){a.runOnUiThread(()->{if(!closed.get()&&dialog.isShowing())detail.setText("Unable to check audio formats. Close and try again; no download started.");});}return null;}));
    }
}
