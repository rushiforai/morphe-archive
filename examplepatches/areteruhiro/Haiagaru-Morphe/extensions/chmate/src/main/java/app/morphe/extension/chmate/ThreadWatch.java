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
    static final String PREFS="haiagaru_thread_watch";
    private static final String CHANNEL="haiagaru_thread_updates";
    static final Object LOCK=new Object();
    static SharedPreferences prefs(Context c){return c.getSharedPreferences(PREFS,0);}
    static int interval(Context c){return Math.max(1,Math.min(10080,c.getSharedPreferences(PREFS+"_options",0).getInt("minutes",15)));}
    static String intervalLabel(int minutes){
        StringBuilder text=new StringBuilder();
        if(minutes>=1440){text.append(minutes/1440).append("日");minutes%=1440;}
        if(minutes>=60){text.append(minutes/60).append("時間");minutes%=60;}
        if(minutes>0||text.length()==0)text.append(minutes).append("分");
        return text.toString();
    }
    private static void showInterval(Activity a,Runnable onReturn){
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
        }));dialog.setOnDismissListener(d->{if(!a.isFinishing()&&!a.isDestroyed()&&onReturn!=null)onReturn.run();});dialog.show();
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
    private static android.widget.CheckBox option(android.widget.LinearLayout box,Activity a,String label,boolean value){
        android.widget.CheckBox check=new android.widget.CheckBox(a);check.setText(label);check.setChecked(value);box.addView(check);return check;
    }
    static void addSettingsButton(android.widget.LinearLayout box,Activity a){
        android.widget.Button button=new android.widget.Button(a);button.setText("スレの新着通知・書き込み後の自動監視");button.setAllCaps(false);box.addView(button);
        button.setOnClickListener(v->showDefaults(a));
        ThreadWatchManagement.addButton(box,a);
    }
    static void showDefaults(Activity a){
        SharedPreferences p=RefreshTargets.prefs(a);
        android.widget.LinearLayout box=new android.widget.LinearLayout(a);box.setOrientation(1);
        android.widget.CheckBox auto=option(box,a,"書き込み後に自動でスレを監視する",p.getBoolean("watchAfterPosting",false));
        android.widget.CheckBox replies=option(box,a,"新規登録時：自分への返信だけ通知",p.getBoolean("watchAutoRepliesOnly",true));
        android.widget.CheckBox stop=option(box,a,"新規登録時：返信通知後に確認を停止",p.getBoolean("watchAutoStopAfterReply",false));
        int[] duration={ThreadWatchManagement.defaultDuration(a)};ThreadWatchManagement.durationButton(box,a,duration);
        ThreadWatchManagement.addButton(box,a);
        Runnable enabled=()->{replies.setEnabled(auto.isChecked());stop.setEnabled(auto.isChecked());};enabled.run();auto.setOnCheckedChangeListener((v,b)->enabled.run());
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(a).setTitle("書き込み後の自動監視")
            .setMessage("投稿成功を確認したスレを自動登録します。以下は未登録スレの初期設定です。登録済みスレは『このスレの新着通知』の個別設定を優先し、上書きしません。停止後も次の書き込みで監視を再開し、個別の期限を更新します。初期OFFです。")
            .setView(box).setNeutralButton("確認間隔",null).setNegativeButton("キャンセル",null)
            .setPositiveButton("保存",(d,w)->{p.edit().putBoolean("watchAfterPosting",auto.isChecked()).putBoolean("watchAutoRepliesOnly",replies.isChecked()).putBoolean("watchAutoStopAfterReply",stop.isChecked()).apply();a.getSharedPreferences(PREFS+"_options",0).edit().putInt("durationMinutes",duration[0]).apply();if(auto.isChecked())permission(a);}).create();
        keepParentForInterval(dialog,a,null);dialog.show();
    }
    /** The interval editor is a child; keep unsaved parent controls and Back/Cancel navigation. */
    private static void keepParentForInterval(HaiagaruDialog dialog,Activity a,Runnable onReturn){
        dialog.setOnShowListener(d->dialog.getButton(-3).setOnClickListener(v->showInterval(a,onReturn)));
    }
    private static String watchMessage(Activity a,boolean registered,JSONObject saved){
        return (registered?ThreadWatchManagement.status(saved)+"。":"")+"このスレの個別設定を優先します。書き込み後の自動監視設定には上書きされません。保存・再開時に期限を更新します。約"+intervalLabel(interval(a))+"ごとに確認します。初回確認は通知しません。標準の返信通知と同じ返信は、先に通知した側だけで知らせます。返信判定にはこの端末の自分の書き込みマークを使用します。";
    }
    private static void permission(Activity a){
        if(Build.VERSION.SDK_INT>=33&&a.checkSelfPermission("android.permission.POST_NOTIFICATIONS")!=PackageManager.PERMISSION_GRANTED)
            a.requestPermissions(new String[]{"android.permission.POST_NOTIFICATIONS"},0x4931);
        else if(Build.VERSION.SDK_INT>=24&&!((NotificationManager)a.getSystemService(Context.NOTIFICATION_SERVICE)).areNotificationsEnabled())
            Toast.makeText(a,"Androidのアプリ設定で通知を許可してください",Toast.LENGTH_LONG).show();
    }
    static void show(Activity a,ThreadWatchRules.Target t){
        try{
            boolean registered=prefs(a).contains(t.url);
            JSONObject saved=new JSONObject(prefs(a).getString(t.url,"{}"));
            android.widget.LinearLayout box=new android.widget.LinearLayout(a);box.setOrientation(1);
            android.widget.CheckBox replies=option(box,a,"自分の書き込みへの返信だけ通知する",saved.optBoolean("repliesOnly",false));
            android.widget.CheckBox stop=option(box,a,"自分への返信を通知したら定期確認を停止する",saved.optBoolean("stopAfterReply",false));
            int[] duration={registered?saved.optInt("durationMinutes",0):ThreadWatchManagement.defaultDuration(a)};
            ThreadWatchManagement.durationButton(box,a,duration);
            android.widget.Button defaults=new android.widget.Button(a);defaults.setText("書き込み後の自動監視を設定");box.addView(defaults);defaults.setOnClickListener(v->showDefaults(a));
            HaiagaruDialog.Builder dialog=new HaiagaruDialog.Builder(a).setTitle("このスレの新着通知")
                .setMessage(watchMessage(a,registered,saved))
                .setView(box).setNeutralButton("確認間隔を変更",null)
                .setPositiveButton(registered?"保存・監視を再開":"通知を登録",(d,w)->{
                    synchronized(LOCK){try{
                        if(!registered&&prefs(a).getAll().size()>=100){Toast.makeText(a,"登録できるのは100スレまでです",Toast.LENGTH_LONG).show();return;}
                        JSONObject item=new JSONObject(prefs(a).getString(t.url,"{}"));
                        item.put("count",item.optInt("count",-1)).put("token",UUID.randomUUID().toString()).put("paused",false)
                            .put("repliesOnly",replies.isChecked()).put("stopAfterReply",stop.isChecked());
                        ThreadWatchManagement.renew(item,duration[0]);
                        prefs(a).edit().putString(t.url,item.toString()).commit();
                    }catch(Exception error){return;}}
                    schedule(a);permission(a);
                }).setNegativeButton(registered?"登録を解除":"閉じる",(d,w)->{
                    if(!registered)return;
                    synchronized(LOCK){prefs(a).edit().remove(t.url).commit();}
                    ((NotificationManager)a.getSystemService(Context.NOTIFICATION_SERVICE)).cancel(t.url,JOB);schedule(a);
                });HaiagaruDialog parent=dialog.create();keepParentForInterval(parent,a,()->parent.setMessage(watchMessage(a,registered,saved)));parent.show();
        }catch(Exception error){Toast.makeText(a,"通知設定を開けません",Toast.LENGTH_LONG).show();}
    }
    /** Called only after native posting confirmation records the exact response URL. */
    public static void confirmed(String responseUrl){
        MediaUploadHosts.posted(responseUrl);
        Context c=Haiagaru.applicationContextForExtension();if(c==null)return;
        SharedPreferences options=RefreshTargets.prefs(c);if(!options.getBoolean("watchAfterPosting",false))return;
        ThreadWatchRules.Target t=ThreadWatchRules.target(responseUrl);if(t==null)return;
        try{
            String tail=new java.net.URI(responseUrl).getPath().substring(new java.net.URI(t.url).getPath().length());
            if(!tail.matches("[0-9]{1,7}/?"))return;
            int number=Integer.parseInt(tail.replace("/",""));if(number<1)return;
            synchronized(LOCK){
                if(!prefs(c).contains(t.url)&&prefs(c).getAll().size()>=100)return;
                JSONObject item=new JSONObject(prefs(c).getString(t.url,"{}"));
                org.json.JSONArray own=item.optJSONArray("own");if(own==null)own=new org.json.JSONArray();
                for(int i=0;i<own.length();i++)if(own.optInt(i)==number)return;
                if(own.length()>=1000)own=new org.json.JSONArray();own.put(number);
                boolean registered=prefs(c).contains(t.url);
                item.put("own",own).put("count",Math.max(number,item.optInt("count",-1))).put("token",UUID.randomUUID().toString()).put("paused",false);
                if(!registered)item.put("repliesOnly",options.getBoolean("watchAutoRepliesOnly",true)).put("stopAfterReply",options.getBoolean("watchAutoStopAfterReply",false));
                ThreadWatchManagement.renew(item,registered?item.optInt("durationMinutes",0):ThreadWatchManagement.defaultDuration(c));
                prefs(c).edit().putString(t.url,item.toString()).commit();
            }
            schedule(c);
        }catch(Exception error){android.util.Log.w("Haiagaru","Post notification registration unavailable",error);}
    }
    static boolean hasActive(Context c){
        for(String url:prefs(c).getAll().keySet())try{
            if(ThreadWatchRules.target(url)!=null&&ThreadWatchManagement.active(new JSONObject(prefs(c).getString(url,"{}")),System.currentTimeMillis()))return true;
        }catch(Exception ignored){}
        return false;
    }
    static void schedule(Context c){
        schedule(c,false);
    }
    /** Re-arm a completed short job; long intervals retain their periodic job. */
    static void completed(Context c){
        if(interval(c)<15||!hasActive(c))schedule(c,true);
    }
    private static void schedule(Context c,boolean completed){
        synchronized(LOCK){
        JobScheduler jobs=(JobScheduler)c.getSystemService(Context.JOB_SCHEDULER_SERVICE);if(jobs==null)return;
        if(!hasActive(c)){jobs.cancel(JOB);return;}
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
        Set<String> notified=new LinkedHashSet<>();
        for(String key:prefs(c).getAll().keySet()){
            ThreadWatchRules.Target t=ThreadWatchRules.target(key);
            try{if(t!=null&&ThreadWatchManagement.active(new JSONObject(prefs(c).getString(key,"{}")),System.currentTimeMillis()))groups.computeIfAbsent(t.subject,k->new ArrayList<>()).add(key);}catch(Exception ignored){}
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
                    ThreadWatchRules.Target t=ThreadWatchRules.target(key);Integer count=counts.get(t.id);
                    if(count==null){
                        // An empty/error subject is not evidence of dat expiry. Require
                        // repeated valid lists over time AND an explicit missing DAT.
                        if(!counts.isEmpty())missing(c,t,tokens.get(key),stopped);
                        continue;
                    }
                    JSONObject captured;
                    synchronized(LOCK){captured=new JSONObject(prefs(c).getString(key,"{}"));}
                    if(!ThreadWatchManagement.active(captured,System.currentTimeMillis()))continue;
                    int known=captured.optInt("count",-1),matching=0,firstMatch=0;boolean replySeen=false;
                    if(known>=0)known=Math.max(known,ThreadWatchRead.count(c,t));
                    boolean repliesOnly=captured.optBoolean("repliesOnly",false),stopAfter=captured.optBoolean("stopAfterReply",false);
                    String preview="";
                    Map<Integer,String> candidates=new LinkedHashMap<>();
                    Set<Integer> directReplies=new HashSet<>();
                    if(ThreadWatchRules.increase(known,count)>0){
                        try{
                            Map<Integer,String> bodies=ThreadWatchRules.newBodies(t,fetch(t.dat,stopped),known,count);
                            if(bodies.isEmpty()&&(repliesOnly||stopAfter))continue;
                            Set<Integer> own=new HashSet<>();
                            if(repliesOnly||stopAfter){
                                org.json.JSONArray savedOwn=captured.optJSONArray("own");if(savedOwn!=null)for(int i=0;i<savedOwn.length();i++)if(savedOwn.optInt(i)>0)own.add(savedOwn.optInt(i));
                                try{own.addAll(ThreadWatchOwnPosts.read(c,t));}catch(Exception unavailable){if(own.isEmpty())throw unavailable;}
                            }
                            List<String> lines=new ArrayList<>();
                            for(Map.Entry<Integer,String> body:bodies.entrySet()){
                                String plain=android.text.Html.fromHtml(body.getValue()).toString();
                                boolean reply=ThreadWatchRules.repliesTo(plain,body.getKey(),own);replySeen|=reply;if(reply)directReplies.add(body.getKey());
                                if(repliesOnly&&!reply)continue;
                                candidates.put(body.getKey(),body.getValue());
                                matching++;if(firstMatch==0)firstMatch=body.getKey();
                                String text=notificationText(body.getValue(),300);if(text.isEmpty())continue;
                                lines.add(">>"+body.getKey()+" "+text);if(lines.size()>3)lines.remove(0);
                            }
                            preview=android.text.TextUtils.join("\n",lines);
                        }catch(Exception unavailable){
                            if(stopped.get())return;
                            // Reply-only / stop-on-reply checks must retry after body/index failure.
                            if(repliesOnly||stopAfter)continue;
                        }
                    }
                    // Reading may have advanced while subject/DAT I/O was in flight.
                    int readNow=ThreadWatchRead.count(c,t);
                    synchronized(LOCK){
                        if(stopped.get())return;
                        JSONObject item=new JSONObject(prefs(c).getString(key,"{}"));
                        if(!tokens.containsKey(key)||!tokens.get(key).equals(item.optString("token"))||!prefs(c).contains(key)||!ThreadWatchManagement.active(item,System.currentTimeMillis()))continue;
                        item.put("missingChecks",0).put("missingSince",0);
                        String title=titles.get(t.id);if(title!=null)item.put("title",title.substring(0,Math.min(title.length(),4096)));
                        int current=item.optInt("count",-1);
                        int before=current<0&&known<0?-1:Math.max(Math.max(current,known),readNow),delta=ThreadWatchRules.increase(before,count);
                        if(delta>0&&(!repliesOnly||matching>0)){
                            Set<Integer> seen=ThreadWatchNative.seen(c,key,candidates.keySet());
                            if(!candidates.isEmpty()){
                                candidates.keySet().removeIf(number->number<=before);
                                candidates.keySet().removeAll(seen);matching=candidates.size();
                                if(matching==0){item.put("count",Math.max(before,count));prefs(c).edit().putString(key,item.toString()).commit();continue;}
                                firstMatch=candidates.keySet().iterator().next();List<String> uniqueLines=new ArrayList<>();
                                for(Map.Entry<Integer,String> body:candidates.entrySet()){
                                    uniqueLines.add(">>"+body.getKey()+" "+notificationText(body.getValue(),300));if(uniqueLines.size()>3)uniqueLines.remove(0);
                                }
                                preview=android.text.TextUtils.join("\n",uniqueLines);
                            }
                            int unique=ThreadWatchNative.seenCount(c,key,before+1,count);
                            int delivered=repliesOnly?matching:Math.max(0,delta-unique);
                            if(delivered==0){item.put("count",Math.max(before,count));prefs(c).edit().putString(key,item.toString()).commit();continue;}
                            if(!notify(c,t,delivered,count,titles.get(t.id),preview,firstMatch>0?firstMatch:Math.max(1,count-delta+1),repliesOnly))continue;
                            notified.add(t.url);
                            if(candidates.isEmpty())ThreadWatchNative.recordRange(item,before+1,count);else ThreadWatchNative.record(item,candidates.keySet());
                            if(stopAfter&&!Collections.disjoint(candidates.keySet(),directReplies))item.put("paused",true).put("pauseReason","reply");
                        }
                        item.put("count",Math.max(before,count));prefs(c).edit().putString(key,item.toString()).commit();
                    }
                }
            }catch(Exception error){android.util.Log.w("Haiagaru","Thread notification check unavailable ("+error.getClass().getSimpleName()+")");}
        }
        // The polling DAT is only a preview. Ask the host's worker to persist
        // the notified threads so tapping a notification can find the reply.
        if(!stopped.get())OpenTabsRefresh.downloadWatched(c,notified);
    }
    private static void missing(Context c,ThreadWatchRules.Target t,String token,AtomicBoolean stopped)throws Exception{
        JSONObject snapshot;
        synchronized(LOCK){
            if(stopped.get()||token==null||!prefs(c).contains(t.url))return;
            snapshot=new JSONObject(prefs(c).getString(t.url,"{}"));
            if(!token.equals(snapshot.optString("token"))||!ThreadWatchManagement.active(snapshot,System.currentTimeMillis()))return;
            int checks=Math.min(3,snapshot.optInt("missingChecks",0)+1);long since=snapshot.optLong("missingSince",0);
            if(since==0)since=System.currentTimeMillis();
            snapshot.put("missingChecks",checks).put("missingSince",since);
            prefs(c).edit().putString(t.url,snapshot.toString()).commit();
            if(checks<3||System.currentTimeMillis()-since<30*60_000L)return;
        }
        boolean gone=false;
        try{fetch(t.dat,stopped);}catch(HttpStatus error){gone=error.code==404||error.code==410;}catch(IOException unavailable){return;}
        if(!gone||stopped.get())return;
        synchronized(LOCK){
            if(!prefs(c).contains(t.url))return;
            JSONObject item=new JSONObject(prefs(c).getString(t.url,"{}"));
            if(!token.equals(item.optString("token"))||item.optInt("missingChecks",0)<3||!ThreadWatchManagement.active(item,System.currentTimeMillis()))return;
            item.put("paused",true).put("pauseReason","missing");prefs(c).edit().putString(t.url,item.toString()).commit();
        }
    }
    private static final class HttpStatus extends IOException{
        final int code;HttpStatus(int code){super("HTTP "+code);this.code=code;}
    }
    private static String fetch(String url,AtomicBoolean stopped)throws Exception{
        HttpURLConnection c=(HttpURLConnection)new URL(url).openConnection();
        c.setConnectTimeout(8000);c.setReadTimeout(8000);c.setInstanceFollowRedirects(false);
        String ua=ViewingUserAgent.selected(url,"GET");if(ua!=null)c.setRequestProperty("User-Agent",ua);
        try{
            String cookie=ReadingAuth.clearance(url);if(cookie!=null)c.setRequestProperty("Cookie",cookie);
            int status=c.getResponseCode();if(status!=200)throw new HttpStatus(status);
            try(InputStream in=c.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(stopped.get())throw new InterruptedIOException();if(out.size()+n>4*1024*1024)throw new IOException("Size");out.write(b,0,n);}
                String type=c.getContentType();java.util.regex.Matcher charset=java.util.regex.Pattern.compile("charset\\s*=\\s*[\"']?([^;\\s\"']+)",2).matcher(type==null?"":type);
                return new String(out.toByteArray(),Charset.forName(charset.find()?charset.group(1):url.contains("eddibb.cc/")?"UTF-8":url.contains("jbbs.shitaraba.net/")?"EUC-JP":"MS932"));
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
    private static boolean notify(Context c,ThreadWatchRules.Target t,int delta,int count,String title,String preview,int first,boolean repliesOnly){
        NotificationManager manager=(NotificationManager)c.getSystemService(Context.NOTIFICATION_SERVICE);
        if(Build.VERSION.SDK_INT>=33&&c.checkSelfPermission("android.permission.POST_NOTIFICATIONS")!=PackageManager.PERMISSION_GRANTED)return false;
        if(Build.VERSION.SDK_INT>=24&&!manager.areNotificationsEnabled())return false;
        if(Build.VERSION.SDK_INT>=26){manager.createNotificationChannel(new NotificationChannel(CHANNEL,"登録スレの新着",NotificationManager.IMPORTANCE_DEFAULT));if(manager.getNotificationChannel(CHANNEL).getImportance()==0)return false;}
        Intent open=new Intent(Intent.ACTION_VIEW,Uri.parse(t.url+first))
            .setClass(c,ThreadWatchOpenActivity.class);
        // Different watched threads must not overwrite each other's pending intent.
        PendingIntent tap=PendingIntent.getActivity(c,t.url.hashCode(),open,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder b=Build.VERSION.SDK_INT>=26?new Notification.Builder(c,CHANNEL):new Notification.Builder(c);
        String name=notificationText(title,160);if(name.isEmpty())name=Uri.parse(t.url).getHost()+" / "+t.id;
        String summary=(repliesOnly?"自分への返信 ":"新着 ")+delta+"件",body=preview.isEmpty()?summary+"（本文を取得できませんでした）":preview;
        b.setSmallIcon(c.getApplicationInfo().icon).setContentTitle(name)
            .setContentText(body).setSubText(summary).setStyle(new Notification.BigTextStyle().bigText(body))
            .setContentIntent(tap).setAutoCancel(true).setOnlyAlertOnce(false);
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
