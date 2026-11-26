package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.net.TrafficStats;
import android.os.*;
import android.provider.Settings;
import android.widget.*;
import org.json.*;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;

/** Own-UID counters only. No URLs, bodies or special usage-access permission. */
public final class AppTrafficUsage {
    static final String ENABLED="recordAppTraffic";
    private static final ScheduledExecutorService IO=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"Haiagaru-traffic");t.setDaemon(true);return t;});
    private static final Object FEATURE_LOCK=new Object();
    private static final Map<String,Map<String,Long>> FEATURE_PENDING=new HashMap<>();
    private static boolean featureFlushScheduled;
    private static long lastResumeSampleElapsed;
    private static final long RESUME_SAMPLE_MIN_INTERVAL_MS=60_000L;
    private static final long FEATURE_FLUSH_DELAY_SECONDS=2L;
    private static volatile String cachedFeatureDay;
    private static volatile long nextFeatureDayCheckElapsed;
    private static volatile boolean started;
    private static ScheduledFuture<?> samplerTask;
    private static SharedPreferences data(Context c){return c.getSharedPreferences("haiagaru.traffic-usage",0);}
    private static boolean enabled(Context c){return c.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0).getBoolean(ENABLED,false);}
    public static synchronized void start(Context context){
        Context c=context.getApplicationContext();
        if(!enabled(c)){stopSamplerLocked();return;}
        if(samplerTask!=null&&!samplerTask.isCancelled()&&!samplerTask.isDone()){started=true;return;}
        started=true;
        samplerTask=IO.scheduleWithFixedDelay(()->{
            if(!enabled(c)){stopSampler();return;}
            try{sample(c);}catch(RuntimeException ignored){}
        },60,60,TimeUnit.SECONDS);
    }
    public static void sampleSoon(Context c){
        if(c==null)return;
        if(!enabled(c)){stopSampler();return;}
        start(c);
        long now=SystemClock.elapsedRealtime();
        synchronized(FEATURE_LOCK){if(lastResumeSampleElapsed>0&&now-lastResumeSampleElapsed<RESUME_SAMPLE_MIN_INTERVAL_MS)return;lastResumeSampleElapsed=now;}
        IO.execute(()->{try{sample(c.getApplicationContext());}catch(RuntimeException ignored){}});
    }
    static long delta(long before,long now){return before<0||now<before?0:now-before;}
    static InputStream counting(Context context,String category,InputStream source){return context==null||source==null||!enabled(context)?source:new CountingInputStream(context.getApplicationContext(),category,source);}
    static void recordFeatureBytes(Context context,String category,long bytes){
        if(context==null||bytes<=0||!enabled(context))return;
        String day=currentFeatureDay();
        synchronized(FEATURE_LOCK){
            Map<String,Long> row=FEATURE_PENDING.get(day);if(row==null){row=new HashMap<>();FEATURE_PENDING.put(day,row);}
            Long pending=row.get(category);row.put(category,safeAdd(pending==null?0L:pending,bytes));
            if(!featureFlushScheduled){featureFlushScheduled=true;Context app=context.getApplicationContext();IO.schedule(()->flushFeatureBytes(app),FEATURE_FLUSH_DELAY_SECONDS,TimeUnit.SECONDS);}
        }
    }
    private static String currentFeatureDay(){
        long elapsed=SystemClock.elapsedRealtime();String day=cachedFeatureDay;
        if(day!=null&&elapsed<nextFeatureDayCheckElapsed)return day;
        synchronized(FEATURE_LOCK){
            elapsed=SystemClock.elapsedRealtime();
            if(cachedFeatureDay==null||elapsed>=nextFeatureDayCheckElapsed){
                cachedFeatureDay=new SimpleDateFormat("yyyy-MM-dd",Locale.ROOT).format(new Date());
                nextFeatureDayCheckElapsed=elapsed+60_000L;
            }
            return cachedFeatureDay;
        }
    }
    private static long safeAdd(long a,long b){return b>0&&a>Long.MAX_VALUE-b?Long.MAX_VALUE:a+b;}
    private static void flushFeatureBytes(Context context){
        Map<String,Map<String,Long>> batch=new HashMap<>();
        synchronized(FEATURE_LOCK){
            for(Map.Entry<String,Map<String,Long>> day:FEATURE_PENDING.entrySet())batch.put(day.getKey(),new HashMap<>(day.getValue()));
            FEATURE_PENDING.clear();featureFlushScheduled=false;
        }
        if(batch.isEmpty())return;
        try{
            SharedPreferences p=data(context);JSONObject all=new JSONObject(p.getString("features","{}"));
            for(Map.Entry<String,Map<String,Long>> day:batch.entrySet()){
                JSONObject row=all.optJSONObject(day.getKey());if(row==null)row=new JSONObject();
                for(Map.Entry<String,Long> feature:day.getValue().entrySet())row.put(feature.getKey(),safeAdd(row.optLong(feature.getKey()),feature.getValue()));
                all.put(day.getKey(),row);
            }
            prune(all);p.edit().putString("features",all.toString()).apply();
        }catch(Exception ignored){
            synchronized(FEATURE_LOCK){
                for(Map.Entry<String,Map<String,Long>> day:batch.entrySet()){
                    Map<String,Long> row=FEATURE_PENDING.get(day.getKey());if(row==null){row=new HashMap<>();FEATURE_PENDING.put(day.getKey(),row);}
                    for(Map.Entry<String,Long> feature:day.getValue().entrySet()){Long pending=row.get(feature.getKey());row.put(feature.getKey(),safeAdd(pending==null?0L:pending,feature.getValue()));}
                }
                if(!featureFlushScheduled){featureFlushScheduled=true;IO.schedule(()->flushFeatureBytes(context),5,TimeUnit.SECONDS);}
            }
        }
    }
    private static void prune(JSONObject values){
        List<String> keys=new ArrayList<>();Iterator<String> it=values.keys();while(it.hasNext())keys.add(it.next());
        Collections.sort(keys);while(keys.size()>93)values.remove(keys.remove(0));
    }
    private static final class CountingInputStream extends FilterInputStream {
        final Context context;final String category;long count;boolean closed;
        CountingInputStream(Context c,String kind,InputStream input){super(input);context=c;category=kind;}
        @Override public int read()throws IOException{int value=super.read();if(value>=0)count++;return value;}
        @Override public int read(byte[] bytes,int offset,int length)throws IOException{int n=super.read(bytes,offset,length);if(n>0)count+=n;return n;}
        @Override public void close()throws IOException{try{super.close();}finally{if(!closed){closed=true;recordFeatureBytes(context,category,count);}}}
    }
    static synchronized void sample(Context c){
        flushFeatureBytes(c);
        SharedPreferences p=data(c);if(!enabled(c)){if(p.contains("rx")||p.contains("baselineRx"))p.edit().remove("rx").remove("tx").remove("baselineRx").remove("baselineTx").apply();return;}
        int uid=android.os.Process.myUid();long rx=TrafficStats.getUidRxBytes(uid),tx=TrafficStats.getUidTxBytes(uid);
        if(rx<0||tx<0)return;
        int boot;try{boot=Settings.Global.getInt(c.getContentResolver(),"boot_count",-1);}catch(RuntimeException unavailable){boot=-1;}long elapsed=SystemClock.elapsedRealtime();
        long previousElapsed=p.getLong("elapsed",-1);int previousBoot=p.getInt("boot",-1);
        boolean sameBoot=previousElapsed>=0&&elapsed>=previousElapsed;
        if(boot>=0&&previousBoot>=0)sameBoot&=boot==previousBoot;
        long dr=sameBoot?delta(p.getLong("rx",-1),rx):0,dt=sameBoot?delta(p.getLong("tx",-1),tx):0;
        boolean baseline=!sameBoot||!p.contains("baselineRx")||!p.contains("baselineTx");
        String day=new SimpleDateFormat("yyyy-MM-dd",Locale.ROOT).format(new Date());JSONObject days;
        try{days=new JSONObject(p.getString("days","{}"));JSONArray row=days.optJSONArray(day);long oldRx=row==null?0:row.optLong(0),oldTx=row==null?0:row.optLong(1);
            days.put(day,new JSONArray().put(oldRx+dr).put(oldTx+dt));
            prune(days);
            SharedPreferences.Editor save=p.edit().putLong("rx",rx).putLong("tx",tx).putLong("elapsed",elapsed).putInt("boot",boot).putString("days",days.toString());
            if(baseline)save.putLong("baselineRx",rx).putLong("baselineTx",tx);
            save.apply();
        }catch(JSONException ignored){}
    }
    private static synchronized void stopSampler(){stopSamplerLocked();}
    private static void stopSamplerLocked(){
        started=false;
        ScheduledFuture<?> task=samplerTask;
        samplerTask=null;
        if(task!=null)task.cancel(false);
        synchronized(FEATURE_LOCK){lastResumeSampleElapsed=0L;}
    }
    static void addSettings(LinearLayout root,Activity a){
        Switch toggle=new Switch(a);toggle.setText("アプリの通信量を記録する");toggle.setChecked(enabled(a));root.addView(toggle);
        toggle.setOnCheckedChangeListener((v,on)->{Context app=a.getApplicationContext();app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0).edit().putBoolean(ENABLED,on).apply();if(on)start(app);else stopSampler();IO.execute(()->{flushFeatureBytes(app);data(app).edit().remove("rx").remove("tx").remove("baselineRx").remove("baselineTx").apply();if(on)sample(app);});});
        Button button=new Button(a);button.setText("通信量の記録を見る");button.setOnClickListener(v->show(a));root.addView(button);
        TextView help=new TextView(a);help.setText("初期OFF。ONにすると、アプリ全体の受信・送信を日別に最大93日記録します。URLや本文は保存しません。Wi-Fiとモバイルの合算です。記録開始時には、前回の再起動以降にアプリUIDが使った累計を参考値として表示します。別途、一覧画像・リンクカード・動画／GIFサムネイルなどHaiagaru側で取得した本文量を機能別に目安表示します。通信ヘッダーやChMate標準機能の通信は機能別内訳に含まれません。通常は約1分ごとに計測し、画面再開時の追加計測も60秒に1回までに制限します。機能別データはまとめて保存します。日付をまたぐ分は計測日に計上します。再起動やカウンターのリセットをまたぐ通信は分割できません。VPN・共有UIDなどによりAndroid設定値と差が出る場合があります。保存容量とは別です。");root.addView(help);
    }
    public static void show(Activity a){IO.execute(()->{sample(a);String report=report(a);a.runOnUiThread(()->{if(a.isFinishing())return;
        new HaiagaruDialog.Builder(a).setTitle("通信量の記録").setMessage(report).setPositiveButton("閉じる",null)
            .setNeutralButton("記録を消去…",(d,w)->new HaiagaruDialog.Builder(a).setTitle("通信量の記録を消去しますか？")
                .setMessage("通信量の集計だけを消去します。画像・スレ・設定は削除しません。")
                .setNegativeButton("キャンセル",null).setPositiveButton("消去",(x,y)->IO.execute(()->{data(a).edit().clear().apply();sample(a);})).show()).show();});});}
    static String report(Context c){
        String today=new SimpleDateFormat("yyyy-MM-dd",Locale.ROOT).format(new Date()),month=today.substring(0,7);long monthlyRx=0,monthlyTx=0;StringBuilder body=new StringBuilder();Map<String,Long> featureMonth=new TreeMap<>();
        try{JSONObject days=new JSONObject(data(c).getString("days","{}"));List<String> keys=new ArrayList<>();Iterator<String> it=days.keys();while(it.hasNext())keys.add(it.next());Collections.sort(keys,Collections.reverseOrder());
            for(String key:keys){JSONArray row=days.getJSONArray(key);long rx=row.optLong(0),tx=row.optLong(1);if(key.startsWith(month)){monthlyRx+=rx;monthlyTx+=tx;}body.append(key.equals(today)?"今日 ("+key+")":key).append("\n受信 ").append(size(c,rx)).append(" ／ 送信 ").append(size(c,tx)).append("\n\n");}
        }catch(JSONException ignored){}
        long baseRx=data(c).getLong("baselineRx",-1),baseTx=data(c).getLong("baselineTx",-1);
        try{JSONObject all=new JSONObject(data(c).getString("features","{}"));Iterator<String> days=all.keys();while(days.hasNext()){String day=days.next();if(!day.startsWith(month))continue;JSONObject row=all.optJSONObject(day);if(row==null)continue;Iterator<String> names=row.keys();while(names.hasNext()){String name=names.next();Long previous=featureMonth.get(name);featureMonth.put(name,(previous==null?0:previous)+row.optLong(name));}}}catch(JSONException ignored){}
        if(baseRx>=0||baseTx>=0)body.insert(0,"記録開始時点のUID累計（前回再起動以降・参考）\n受信 "+size(c,Math.max(0,baseRx))+" ／ 送信 "+size(c,Math.max(0,baseTx))+"\n\n");
        StringBuilder features=new StringBuilder();long known=0;for(Map.Entry<String,Long> item:featureMonth.entrySet()){known+=item.getValue();features.append(featureLabel(item.getKey())).append(" ").append(size(c,item.getValue())).append("\n");}
        if(features.length()>0)features.append("未分類・ChMate標準通信など ").append(size(c,Math.max(0,monthlyRx+monthlyTx-known))).append("\n");
        return (enabled(c)?"記録ON":"記録OFF")+" ／ Wi-Fi・モバイル合算\n今月（記録分） "+size(c,monthlyRx+monthlyTx)+"\n受信 "+size(c,monthlyRx)+" ／ 送信 "+size(c,monthlyTx)+"\n\n"+(features.length()==0?"機能別内訳はまだありません。":("機能別の受信本文量（今月・目安）\n"+features+"\n"))+(body.length()==0?"記録はまだありません。":body)+"\nAndroidのUIDカウンターで全体を記録します。機能別はHaiagaruが直接読み取った本文量の目安で、通信ヘッダー・ChMate標準機能などは未分類です。記録開始前の用途別内訳は取得できません。";
    }
    private static String featureLabel(String key){switch(key){case "thread_list_images":return "スレ一覧画像・冒頭レス";case "web_cards":return "Webリンクカード";case "imgur_previews":return "Imgurプレビュー";case "video_thumbnails":return "動画サムネイル";case "gif_media":return "GIF取得";case "x_posts":return "X投稿プレビュー";default:return key;}}
    private static String size(Context c,long value){return android.text.format.Formatter.formatFileSize(c,value);}
    private AppTrafficUsage(){}
}
