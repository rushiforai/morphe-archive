package app.morphe.extension.chmate;

import android.app.Activity;import android.content.*;import android.os.Bundle;import android.widget.*;import java.io.*;

/** Download preparation only; playback remains in the user's external app. */
public final class ExternalVideoPlaybackActivity extends Activity {
    private volatile boolean cancelled;private Thread worker;private TextView status;private Button retry;
    @Override public void onCreate(Bundle state){super.onCreate(state);
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);int pad=(int)(24*getResources().getDisplayMetrics().density);body.setPadding(pad,pad,pad,pad);
        status=new TextView(this);status.setText("外部プレイヤー用に動画を一時取得しています…\n最大128MB・60秒。再生は端末の動画アプリで行います。");body.addView(status);
        retry=new Button(this);retry.setText("再試行");retry.setVisibility(android.view.View.GONE);retry.setOnClickListener(v->load());body.addView(retry);
        Button close=new Button(this);close.setText("キャンセル");close.setOnClickListener(v->finish());body.addView(close);setContentView(body);load();
    }
    private void load(){
        String address=getIntent().getDataString();if(!ExternalVideoCache.eligible(address)){finish();return;}
        retry.setVisibility(android.view.View.GONE);status.setText("外部プレイヤー用に動画を一時取得しています…\n最大128MB・60秒。再生は端末の動画アプリで行います。");
        worker=new Thread(()->{try{
            File file=ExternalVideoCache.download(this,address,()->cancelled||Thread.currentThread().isInterrupted());
            VideoFrameThumbnail.requestLocal(address,file);
            runOnUiThread(()->{if(cancelled||isFinishing())return;try{startActivity(ExternalVideoCache.playback(this,file));finish();}
                catch(ActivityNotFoundException unavailable){status.setText("再生できる動画アプリが見つかりません。");retry.setVisibility(android.view.View.VISIBLE);}});
        }catch(IOException|RuntimeException error){runOnUiThread(()->{if(cancelled||isFinishing())return;status.setText("動画を一時取得できませんでした。接続先の確認画面、通信状態、容量を確認してください（上限128MB・60秒）。");retry.setVisibility(android.view.View.VISIBLE);});}},"HaiagaruExternalVideo");worker.start();
    }
    @Override public void onDestroy(){cancelled=true;if(worker!=null)worker.interrupt();super.onDestroy();}
}
