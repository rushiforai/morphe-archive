package app.morphe.extension.chmate;

import android.app.*;
import android.app.job.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.widget.Toast;
import org.json.JSONObject;
import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

/** Opt-in, device-local subject polling. No server or automatic posting. */
public final class ThreadWatch {
    static final int ACTION=0x7e00000b,JOB=0x48690031;
    private static final String PREFS="haiagaru_thread_watch",CHANNEL="haiagaru_thread_updates";
    private static final Object LOCK=new Object();
    static SharedPreferences prefs(Context c){return c.getSharedPreferences(PREFS,0);}
    static int interval(Context c){return Math.max(1,Math.min(10080,c.getSharedPreferences(PREFS+"_options",0).getInt("minutes",15)));}
    static String intervalLabel(int minutes){
        StringBuilder text=new StringBuilder();
        if(minutes>=1440){text.append(minutes/1440).append("日");minutes%=1440;}
        if(minutes>=60){text.append(minutes/60).append("時間");minutes%=60;}
        if(minutes>0||text.length()==0)text.append(minutes).append("分");
        return text.toString();
    }
    private static void showInterval(Activity a){
        int minutes=interval(a);int[] values={minutes/1440,minutes%1440/60,minutes%60};
        String[] labels={"日","時間","分"};
        android.widget.LinearLayout box=new android.widget.LinearLayout(a);box.setOrientation(android.widget.LinearLayout.VERTICAL);
        android.widget.LinearLayout row=new android.widget.LinearLayout(a);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        android.widget.EditText[] inputs=new android.widget.EditText[3];
        for(int i=0;i<3;i++){
            android.widget.LinearLayout column=new android.widget.LinearLayout(a);column.setOrientation(android.widget.LinearLayout.VERTICAL);
            android.widget.TextView label=new android.widget.TextView(a);label.setText(labels[i]);column.addView(label);
            android.widget.EditText input=new android.widget.EditText(a);inputs[i]=input;input.setSingleLine(true);
            input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);input.setText(String.valueOf(values[i]));input.setSelectAllOnFocus(true);
            input.setContentDescription("確認間隔の"+labels[i]);column.addView(input);
            row.addView(column,new android.widget.LinearLayout.LayoutParams(0,-2,1));
        }
        box.addView(row);
        android.widget.TextView error=new android.widget.TextView(a);error.setText("合計1分〜7日の範囲で整数を入力してください");error.setVisibility(android.view.View.GONE);box.addView(error);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(a).setTitle("新着通知の確認間隔")
            .setMessage("日・時間・分で、合計1分〜7日の範囲を指定できます。使わない欄は0か空欄にしてください。初期値は15分です。登録した全スレに適用します。間隔は目安で、Androidの省電力・実行回数の制限により遅れる場合があります。特に15分未満は設定どおりの頻度にならないことがあります。")
            .setView(box).setNegativeButton("キャンセル",null).setPositiveButton("保存",null).create();
        dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{
            try{
                long total=0;int[] factors={1440,60,1};
                for(int i=0;i<3;i++){
                    String text=inputs[i].getText().toString().trim();long value=text.isEmpty()?0:Long.parseLong(text);
                    if(value<0||value>10080/factors[i])throw new IllegalArgumentException();total+=value*factors[i];
                }
                if(total<1||total>10080)throw new IllegalArgumentException();int saved=(int)total;
                a.getSharedPreferences(PREFS+"_options",0).edit().putInt("minutes",saved).commit();schedule(a);dialog.dismiss();
                Toast.makeText(a,"確認間隔を"+intervalLabel(saved)+"にしました",Toast.LENGTH_SHORT).show();
            }catch(IllegalArgumentException invalid){error.setVisibility(android.view.View.VISIBLE);}
        }));dialog.show();
    }
    static ThreadWatchRules.Target current(Object fragment,Activity a)throws Exception{
        String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
        return ThreadWatchRules.target(NativeThreadContext.url(NativeThreadContext.board(fragment,version),version,0));
    }
    static void show(Object fragment){
        Activity a=Haiagaru.toolbarActivity(fragment);if(a==null||a.isFinishing())return;
        try{
            ThreadWatchRules.Target t=current(fragment,a);if(t==null)throw new IllegalArgumentException();
            show(a,t);
        }catch(Exception error){Toast.makeText(a,"現在のスレを特定できません",Toast.LENGTH_LONG).show();}
    }
    static void show(Activity a,ThreadWatchRules.Target t){
        try{
            boolean registered=prefs(a).contains(t.url);
            new HaiagaruDialog.Builder(a).setTitle("このスレの新着通知")
                .setMessage((registered?"登録済みです。":"登録すると、")+"アプリを閉じていても約"+intervalLabel(interval(a))+"ごとに新着レスを確認します。省電力設定や通信状況により遅れることがあります。初回取得は通知せず、以後のレス数の増加を通知します。")
                .setNeutralButton("確認間隔を変更",(d,w)->showInterval(a))
                .setPositiveButton(registered?"登録を解除":"通知を登録",(d,w)->{
                    synchronized(LOCK){
                        if(registered)prefs(a).edit().remove(t.url).commit();
                        else try{
                            if(prefs(a).getAll().size()>=100){Toast.makeText(a,"登録できるのは100スレまでです",Toast.LENGTH_LONG).show();return;}
                            JSONObject item=new JSONObject().put("count",-1).put("token",UUID.randomUUID().toString());
                            prefs(a).edit().putString(t.url,item.toString()).commit();
                        }catch(Exception error){return;}
                    }
                    ((NotificationManager)a.getSystemService(Context.NOTIFICATION_SERVICE)).cancel(t.url,JOB);
                    schedule(a);
                    if(!registered&&Build.VERSION.SDK_INT>=33&&a.checkSelfPermission("android.permission.POST_NOTIFICATIONS")!=PackageManager.PERMISSION_GRANTED)
                        a.requestPermissions(new String[]{"android.permission.POST_NOTIFICATIONS"},0x4931);
                    else if(!registered&&Build.VERSION.SDK_INT>=24&&!((NotificationManager)a.getSystemService(Context.NOTIFICATION_SERVICE)).areNotificationsEnabled())
                        Toast.makeText(a,"Androidのアプリ設定で通知を許可してください",Toast.LENGTH_LONG).show();
                }).setNegativeButton("閉じる",null).show();
        }catch(Exception error){Toast.makeText(a,"通知設定を開けません",Toast.LENGTH_LONG).show();}
    }
    static void schedule(Context c){
        schedule(c,false);
    }
    /** Re-arm a completed short job; long intervals retain their periodic job. */
    static void completed(Context c){
        if(interval(c)<15)schedule(c,true);
    }
    private static void schedule(Context c,boolean completed){
        synchronized(LOCK){
        JobScheduler jobs=(JobScheduler)c.getSystemService(Context.JOB_SCHEDULER_SERVICE);if(jobs==null)return;
        if(prefs(c).getAll().isEmpty()){jobs.cancel(JOB);return;}
        int minutes=interval(c);long period=minutes*60_000L;boolean periodic=minutes>=15;
        for(JobInfo pending:jobs.getAllPendingJobs())if(pending.getId()==JOB){
            if(pending.isPeriodic()==periodic&&pending.getExtras().getInt("minutes",-1)==minutes
                    &&(periodic||!completed))return;
            break;
        }
        android.os.PersistableBundle extras=new android.os.PersistableBundle();extras.putInt("minutes",minutes);
        JobInfo.Builder job=new JobInfo.Builder(JOB,new ComponentName(c,ThreadWatchService.class))
            .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY).setPersisted(true).setExtras(extras);
        // Periodic jobs are clamped to 15 minutes by Android. Short intervals
        // use one persisted one-shot job, re-armed only after the check finishes.
        if(periodic)job.setPeriodic(period);else job.setMinimumLatency(period);
        jobs.schedule(job.build());
        }
    }
    static void check(Context c,AtomicBoolean stopped){
        Map<String,List<String>> groups=new LinkedHashMap<>();
        for(String key:prefs(c).getAll().keySet()){
            ThreadWatchRules.Target t=ThreadWatchRules.target(key);if(t!=null)groups.computeIfAbsent(t.subject,k->new ArrayList<>()).add(key);
        }
        for(Map.Entry<String,List<String>> group:groups.entrySet()){
            if(stopped.get())return;
            // Capture registration tokens before I/O, so remove/re-add cannot consume an old result.
            Map<String,String> tokens=new HashMap<>();
            synchronized(LOCK){for(String key:group.getValue())try{tokens.put(key,new JSONObject(prefs(c).getString(key,"{}")).optString("token"));}catch(Exception ignored){}}
            try{
                String subject=fetch(group.getKey(),stopped);
                Map<String,Integer> counts=ThreadWatchRules.counts(subject);
                Map<String,String> titles=ThreadWatchRules.titles(subject);
                for(String key:group.getValue()){
                    if(stopped.get())return;
                    ThreadWatchRules.Target t=ThreadWatchRules.target(key);Integer count=counts.get(t.id);if(count==null)continue;
                    String preview="";
                    int known;
                    synchronized(LOCK){known=new JSONObject(prefs(c).getString(key,"{}")).optInt("count",-1);}
                    if(ThreadWatchRules.increase(known,count)>0){
                        try{
                            StringBuilder lines=new StringBuilder();
                            for(Map.Entry<Integer,String> body:ThreadWatchRules.bodies(fetch(t.dat,stopped),known,count).entrySet()){
                                String text=notificationText(body.getValue(),300);
                                if(text.isEmpty())continue;
                                if(lines.length()>0)lines.append('\n');
                                lines.append(">>").append(body.getKey()).append(' ').append(text);
                            }
                            preview=lines.toString();
                        }catch(Exception unavailable){
                            // Count/title notifications still work when DAT access needs authentication.
                            if(stopped.get())return;
                        }
                    }
                    synchronized(LOCK){
                        if(stopped.get())return;
                        JSONObject item=new JSONObject(prefs(c).getString(key,"{}"));
                        if(!tokens.containsKey(key)||!tokens.get(key).equals(item.optString("token"))||!prefs(c).contains(key))continue;
                        int before=item.optInt("count",-1),delta=ThreadWatchRules.increase(before,count);
                        if(delta>0&&!notify(c,t,delta,count,titles.get(t.id),preview))continue;
                        // Keep the high-water mark if the server briefly reports a smaller count.
                        item.put("count",Math.max(before,count));prefs(c).edit().putString(key,item.toString()).commit();
                    }
                }
            }catch(Exception error){android.util.Log.w("Haiagaru","Thread notification check unavailable ("+error.getClass().getSimpleName()+")");}
        }
    }
    private static String fetch(String url,AtomicBoolean stopped)throws Exception{
        HttpURLConnection c=(HttpURLConnection)new URL(url).openConnection();
        c.setConnectTimeout(8000);c.setReadTimeout(8000);c.setInstanceFollowRedirects(false);
        String ua=ViewingUserAgent.selected(url,"GET");if(ua!=null)c.setRequestProperty("User-Agent",ua);
        try{
            String cookie=ReadingAuth.clearance(url);if(cookie!=null)c.setRequestProperty("Cookie",cookie);
            if(c.getResponseCode()!=200)throw new IOException("HTTP");
            try(InputStream in=c.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(stopped.get())throw new InterruptedIOException();if(out.size()+n>4*1024*1024)throw new IOException("Size");out.write(b,0,n);}
                String type=c.getContentType();java.util.regex.Matcher charset=java.util.regex.Pattern.compile("charset\\s*=\\s*[\"']?([^;\\s\"']+)",2).matcher(type==null?"":type);
                return new String(out.toByteArray(),Charset.forName(charset.find()?charset.group(1):url.contains("eddibb.cc/")?"UTF-8":"MS932"));
            }
        }finally{c.disconnect();}
    }
    static String notificationText(String html,int limit){
        if(html==null)return "";
        String plain=android.text.Html.fromHtml(html).toString()
                .replaceAll("[\\s\\p{Cc}]+"," ").trim();
        int end=plain.offsetByCodePoints(0,Math.min(limit,plain.codePointCount(0,plain.length())));
        return plain.substring(0,end)+(end<plain.length()?"…":"");
    }
    private static boolean notify(Context c,ThreadWatchRules.Target t,int delta,int count,String title,String preview){
        NotificationManager manager=(NotificationManager)c.getSystemService(Context.NOTIFICATION_SERVICE);
        if(Build.VERSION.SDK_INT>=33&&c.checkSelfPermission("android.permission.POST_NOTIFICATIONS")!=PackageManager.PERMISSION_GRANTED)return false;
        if(Build.VERSION.SDK_INT>=24&&!manager.areNotificationsEnabled())return false;
        if(Build.VERSION.SDK_INT>=26){manager.createNotificationChannel(new NotificationChannel(CHANNEL,"登録スレの新着",NotificationManager.IMPORTANCE_DEFAULT));if(manager.getNotificationChannel(CHANNEL).getImportance()==0)return false;}
        Intent open=new Intent(Intent.ACTION_VIEW,Uri.parse(t.url+Math.max(1,count-delta+1)))
            .setClassName(c,"jp.syoboi.a2chMate.activity.ResListActivity");
        PendingIntent tap=PendingIntent.getActivity(c,0,open,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder b=Build.VERSION.SDK_INT>=26?new Notification.Builder(c,CHANNEL):new Notification.Builder(c);
        String name=notificationText(title,160);if(name.isEmpty())name=Uri.parse(t.url).getHost()+" / "+t.id;
        String summary="新着 "+delta+"件",body=preview.isEmpty()?summary+"（本文を取得できませんでした）":preview;
        b.setSmallIcon(c.getApplicationInfo().icon).setContentTitle(name)
            .setContentText(body).setSubText(summary).setStyle(new Notification.BigTextStyle().bigText(body))
            .setContentIntent(tap).setAutoCancel(true).setOnlyAlertOnce(true);
        try{
            android.graphics.drawable.Drawable icon=c.getPackageManager().getApplicationIcon(c.getApplicationInfo());
            int size=Math.round(48*c.getResources().getDisplayMetrics().density);
            android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(size,size,android.graphics.Bitmap.Config.ARGB_8888);
            android.graphics.Canvas canvas=new android.graphics.Canvas(bitmap);icon.setBounds(0,0,size,size);icon.draw(canvas);
            b.setLargeIcon(bitmap);
        }catch(RuntimeException ignored){ }
        manager.notify(t.url,JOB,b.build());return true;
    }
    private ThreadWatch(){}
}
