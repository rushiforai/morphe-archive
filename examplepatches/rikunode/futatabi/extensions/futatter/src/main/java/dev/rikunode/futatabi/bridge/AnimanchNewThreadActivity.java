package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.nio.charset.Charset;
import java.util.UUID;
import org.json.JSONObject;

/** Private, native category picker. No web exposure or persistent draft storage. */
public final class AnimanchNewThreadActivity extends Activity {
    private static final String EXTRA="draft_id";
    private static Pending pending,active;
    private static final class Pending {
        final String id=UUID.randomUUID().toString();
        final AnimanchNewThreadDraft draft;
        final java.util.concurrent.CompletableFuture<BridgeServer.BridgeResponse> result=new java.util.concurrent.CompletableFuture<>();
        Pending(AnimanchNewThreadDraft draft){this.draft=draft;}
        void cancelUnsent(){
            draft.cancel();
            if(!draft.inFlight())result.complete(StockReply.error("カテゴリ選択を終了しました。未送信です。"));
        }
    }
    // Called on the bridge worker, not the Android UI thread. Keep the original
    // Flutter HTTP request alive until the user-selected draft has a real result.
    static BridgeServer.BridgeResponse open(Context context,AnimanchNewThreadDraft draft){
        final Pending p;
        synchronized(AnimanchNewThreadActivity.class){
            if(pending!=null || active!=null){
                draft.cancel();
                return StockReply.error("カテゴリ選択・投稿画面が開いています。そちらを確認してください。");
            }
            pending=p=new Pending(draft);
        }
        try {
            context.startActivity(new Intent(context,AnimanchNewThreadActivity.class)
                    .putExtra(EXTRA,p.id).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            new Handler(Looper.getMainLooper()).postDelayed(()->{
                synchronized(AnimanchNewThreadActivity.class){
                    if(pending==p){p.cancelUnsent();pending=null;}
                }
            },30_000);
        } catch(RuntimeException ex){
            synchronized(AnimanchNewThreadActivity.class){
                if(pending==p){p.draft.cancel();pending=null;}
            }
            return StockReply.error("カテゴリ選択画面を開けませんでした。未送信です。");
        }
        try {
            return p.result.get(120,java.util.concurrent.TimeUnit.SECONDS);
        } catch(Exception ex) {
            if(ex instanceof InterruptedException)Thread.currentThread().interrupt();
            synchronized(AnimanchNewThreadActivity.class){
                p.draft.cancel();
                if(pending==p)pending=null;
            }
            return StockReply.error("投稿結果の待機を終了しました。再投稿せずカテゴリ画面とスレを確認してください。");
        }
    }
    private Pending claimed;
    private ListView list;
    private TextView status;
    private Button close;
    private boolean submitting;

    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        synchronized(AnimanchNewThreadActivity.class){
            if(pending!=null && active==null && pending.id.equals(getIntent().getStringExtra(EXTRA))){
                claimed=active=pending;pending=null;
            }
        }
        if(claimed==null){finish();return;}
        if(getActionBar()!=null)getActionBar().hide();
        LinearLayout root=new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        if(android.os.Build.VERSION.SDK_INT>=30){
            getWindow().setDecorFitsSystemWindows(false);
            root.setOnApplyWindowInsetsListener((v,insets)->{
                android.graphics.Insets safe=insets.getInsets(android.view.WindowInsets.Type.systemBars()|
                        android.view.WindowInsets.Type.displayCutout());
                v.setPadding(safe.left,safe.top,safe.right,safe.bottom);
                return android.view.WindowInsets.CONSUMED;
            });
        }else root.setFitsSystemWindows(true);
        status=new TextView(this);
        status.setTextSize(18);
        status.setPadding(24,24,24,16);
        status.setText("あにまんのカテゴリを選択\nタップするとスレ立てします。");
        root.addView(status);
        int[] ids=StockReplyRequest.animanchCategoryOrder();
        String[] names=new String[ids.length];
        for(int i=0;i<ids.length;i++)names[i]=StockReplyRequest.animanchCategoryName(ids[i])+(ids[i]==7?"（既定）":"");
        list=new ListView(this);
        list.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,names));
        list.setOnItemClickListener((parent,view,position,itemId)->submit(ids[position]));
        root.addView(list,new LinearLayout.LayoutParams(-1,0,1));
        close=new Button(this);
        close.setText("キャンセル（未送信）");
        close.setOnClickListener(v->finish());
        root.addView(close,new LinearLayout.LayoutParams(-1,-2));
        setContentView(root);
        root.requestApplyInsets();
    }

    private void submit(int id){
        if(submitting || claimed==null)return;
        submitting=true;
        list.setEnabled(false);
        list.setVisibility(View.GONE);
        close.setEnabled(false);
        status.setText(StockReplyRequest.animanchCategoryName(id)+"\nスレ立て送信中…");
        final Pending p=claimed;
        new Thread(()->{
            BridgeServer.BridgeResponse response=p.draft.choose(id);
            p.result.complete(response);
            String message=new String(response.bytes,Charset.forName("Shift_JIS"));
            boolean success=false;
            try{
                JSONObject j=new JSONObject(message);
                success="ok".equals(j.optString("status")) && j.optString("thisno").matches("[1-9][0-9]{12}");
            }catch(Exception ignored){}
            final boolean confirmed=success;
            final String detail=message;
            runOnUiThread(()->{
                if(isFinishing()||isDestroyed()){
                    release(p);
                    return;
                }
                submitting=false;
                if(confirmed){
                    // The same confirmed thisno is returned on the pending stock request.
                    android.widget.Toast.makeText(this,"スレ立てを公開確認しました",android.widget.Toast.LENGTH_SHORT).show();
                    finish();
                    return;
                }
                status.setText(detail+"\n元の画面からむやみに再送しないでください。");
                close.setText("戻る");
                close.setEnabled(true);
            });
        },"futatabi-animanch-create").start();
    }
    private static synchronized void release(Pending p){if(active==p)active=null;}
    @Override public void onBackPressed(){if(!submitting)super.onBackPressed();}
    @Override protected void onDestroy(){
        Pending p=claimed;
        if(p!=null){
            if(!submitting){
                p.cancelUnsent();
                release(p);
            }
        }
        claimed=null;
        super.onDestroy();
    }
}
