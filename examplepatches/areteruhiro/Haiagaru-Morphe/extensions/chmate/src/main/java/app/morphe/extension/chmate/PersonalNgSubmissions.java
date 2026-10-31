package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.widget.*;
import org.json.*;
import java.util.*;
import java.util.concurrent.*;
import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;

/** Consent-gated snapshots; only native personal registrations are collected. */
public final class PersonalNgSubmissions {
    private static final String PREFS="haiagaru.personal-ng-submissions";
    private static final ScheduledExecutorService IO=Executors.newSingleThreadScheduledExecutor();
    private static volatile Context context;
    private static final java.util.concurrent.atomic.AtomicBoolean pending=new java.util.concurrent.atomic.AtomicBoolean();
    private static SharedPreferences prefs(){return context.getSharedPreferences(PREFS,0);}
    private static ScheduledFuture<?> retryTask;
    private static long retryGeneration;
    static void initialize(Context c){
        if(context!=null)return;context=c.getApplicationContext();
        SharedPreferences p=prefs();
        if(!p.getBoolean("eventDrivenV1",false)){
            SharedPreferences.Editor edit=p.edit().remove("periodicEnabled").remove("periodicSeconds").putBoolean("eventDrivenV1",true);
            // Earlier builds also paused for 15 minutes after a successful send.
            // Preserve actual failure backoff, but remove that obsolete success throttle.
            if(p.getString("status","").startsWith("審査用NGを送信しました"))edit.remove("retryAfter");
            edit.apply();
        }
        // One recovery pass at startup; no recurring NG polling.
        IO.schedule(PersonalNgSubmissions::collect,20,TimeUnit.SECONDS);
    }
    private static synchronized void cancelRetry(){
        ++retryGeneration;
        if(retryTask!=null){retryTask.cancel(false);retryTask=null;}
    }
    private static synchronized void scheduleRetry(long delayMillis){
        cancelRetry();
        if(context==null||!prefs().getBoolean("consent",false))return;
        long generation=retryGeneration;
        retryTask=IO.schedule(()->{
            synchronized(PersonalNgSubmissions.class){if(generation!=retryGeneration)return;retryTask=null;}
            collect();
        },Math.max(1000,delayMillis),TimeUnit.MILLISECONDS);
    }
    public static void changed(){if(context!=null&&prefs().getBoolean("consent",false)&&pending.compareAndSet(false,true))IO.schedule(()->{pending.set(false);collect();},1,TimeUnit.SECONDS);}
    static void addSettings(LinearLayout root,Activity activity){
        Button button=new Button(activity);button.setText("個人NGの送信設定・既存NGをまとめて送信");root.addView(button);
        button.setOnClickListener(v->showSettings(activity,false,null));
    }
    static boolean consented(){return context!=null&&prefs().getBoolean("consent",false);}
    /** Show once from settings; opening or dismissing this dialog never grants consent. */
    static void offerOnSettingsOpen(Activity activity,Runnable next){
        if(activity.isFinishing()||activity.isDestroyed())return;
        SharedNg.initialize(activity);
        SharedPreferences p=prefs();
        if(p.contains("consent")||p.getBoolean("settingsConsentShownV1",false)){next.run();return;}
        showSettings(activity,true,()->{
            SharedNg.prefs().edit().putBoolean("enabled",true).apply();
            SharedNg.reload();SharedNg.schedule();
        },()->activity.getWindow().getDecorView().post(()->{
            if(!activity.isFinishing()&&!activity.isDestroyed())next.run();
        }));
        p.edit().putBoolean("settingsConsentShownV1",true).apply();
    }
    static void enableWithConsent(Activity activity,Runnable accepted){
        if(consented()){accepted.run();return;}
        showSettings(activity,true,accepted);
    }
    private static void showSettings(Activity activity,boolean enabling,Runnable accepted){
        showSettings(activity,enabling,accepted,null);
    }
    private static void showSettings(Activity activity,boolean enabling,Runnable accepted,Runnable dismissed){
            LinearLayout form=new LinearLayout(activity);form.setOrientation(1);SharedPreferences p=prefs();
            Switch on=new Switch(activity);on.setText("個人NGを運営の審査用に送信する");on.setChecked(enabling||p.getBoolean("consent",false));form.addView(on);
            String[] types={"ID","NAME","WORD","REPORTER"};String[] labels={"NGID","NGName（ワッチョイ上下4桁を含む）","NGワード","エッヂの記者ID（記者IDだけのNG・高度なNG）"};CheckBox[] choices=new CheckBox[types.length];
            for(int i=0;i<types.length;i++){choices[i]=new CheckBox(activity);choices[i].setText(labels[i]);choices[i].setChecked(p.getBoolean("type."+types[i],!types[i].equals("REPORTER")||!p.getBoolean("consent",false)));form.addView(choices[i]);}
            TextView triggerHelp=new TextView(activity);
            triggerHelp.setText("NGを登録・変更・削除して保存すると、約1秒後に変更分を自動送信します。連続操作はまとめ、1回20件まで送信します。定期的な全件確認は行いません。通信に失敗した送信待ちだけ15分後に再試行し、次回起動時にも回復します。アプリ終了中は動作しません。");
            form.addView(triggerHelp);
            TextView help=new TextView(activity);help.setText("初回同意後、選んだ種類の既存NGをまとめて送り、その後の追加・変更・削除も送信します。送信するのはNGの値・種類・掲示板の区分・一致設定・ランダムな送信元IDです。android等の個別板名と有効期間は送信しません。掲示板が不明な過去NGと全板指定のID・ワッチョイは、全掲示板に適用する共有条件として送信します。名前や個人的なNGワードも含まれます。NGワードは空白を除いて5文字以上かつ英字だけではないものを送信します。ローカルのNG登録には影響しません。記者IDは「記者IDだけをNG」の登録と、高度なNGのひな形と同じ完全一致条件からIDだけを取り出します。複雑なJavaScript条件は対象外です。Cookie・認証情報・閲覧履歴・書き込み履歴・高度NGのJavaScriptは送りません。\n受け取った共有NGは別キャッシュに保管し、再送しません。削除はあなたの報告の取り消しとして扱います。配信済み条件の停止とは別です。オフで未送信データの送信も停止します。");form.addView(help);
            Button preview=new Button(activity);preview.setText("選択した既存NGの件数・送信内容を確認");form.addView(preview);
            preview.setOnClickListener(previewView->{
                Set<String> selected=new HashSet<>();for(int i=0;i<types.length;i++)if(choices[i].isChecked())selected.add(types[i]);
                preview.setEnabled(false);IO.execute(()->{String result;try{
                    StringBuilder details=new StringBuilder();int total=0,shown=0;
                    for(String category:types)if(selected.contains(category)){
                        int count=0;StringBuilder examples=new StringBuilder();
                        if(category.equals("REPORTER")){for(JSONObject c:reporterConditions()){count++;if(shown++<80)examples.append("\n").append(c.toString()).append("\n");}}
                        else for(NativeNgStore.Entry entry:new NativeNgStore(context,category).entries()){
                            if(entry.pattern.isEmpty()||entry.pattern.length()>2000||(entry.flags&4)!=0||(category.equals("WORD")&&!SharedNgRules.shareableKeyword(entry.pattern)))continue;
                            count++;if(shown++<80)examples.append("\n").append(condition(category,entry).toString()).append("\n");
                        }
                        total+=count;details.append(category).append(": ").append(count).append("件\n").append(examples);
                    }
                    result="対象 "+total+"件（内容表示は先頭80件まで）\n無効・2000文字超の登録と、5文字未満または英字だけのNGワードは除外します。\n"+details;
                }catch(Exception error){result="一覧を読み込めませんでした："+error.getMessage();}
                final String text=result;activity.runOnUiThread(()->{if(activity.isFinishing()||activity.isDestroyed())return;preview.setEnabled(true);
                    TextView body=new TextView(activity);body.setText(text);body.setTextIsSelectable(true);ScrollView scroll=new ScrollView(activity);scroll.addView(body);
                    new HaiagaruDialog.Builder(activity).setTitle("既存NGの送信内容（未送信）").setView(scroll).setPositiveButton("閉じる",null).show();
                });});
            });
            TextView status=new TextView(activity);status.setText(p.getString("status","未送信"));form.addView(status);
            ScrollView settingsScroll=new ScrollView(activity);settingsScroll.addView(form);
            new HaiagaruDialog.Builder(activity).setTitle(dismissed==null?"個人NGの送信に同意":"オンライン共有NGへの同意（開発中）").setView(settingsScroll)
                .setOnDismissListener(d->{if(dismissed!=null)dismissed.run();})
                .setNegativeButton("キャンセル",null).setPositiveButton("保存",(d,w)->{
                SharedPreferences.Editor edit=p.edit().putBoolean("consent",on.isChecked());for(int i=0;i<types.length;i++)edit.putBoolean("type."+types[i],choices[i].isChecked());
                if(!on.isChecked()||!p.getBoolean("consent",false))for(String key:p.getAll().keySet())if(key.startsWith("queue.")||key.startsWith("snapshot."))edit.remove(key);edit.putLong("generation",p.getLong("generation",0)+1);if(edit.commit()){cancelRetry();changed();if(on.isChecked()&&accepted!=null)accepted.run();}
            }).show();
    }
    static String hash(String value)throws Exception{byte[] bytes=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));char[] hex="0123456789abcdef".toCharArray(),result=new char[bytes.length*2];for(int i=0;i<bytes.length;i++){result[i*2]=hex[(bytes[i]&255)>>>4];result[i*2+1]=hex[bytes[i]&15];}return new String(result);}
    static String installation()throws Exception{String id=prefs().getString("installation","");if(id.isEmpty()){id=hash(UUID.randomUUID().toString());if(!prefs().edit().putString("installation",id).commit())throw new Exception("送信元IDを保存できません");}return id;}
    private static JSONObject condition(String category,NativeNgStore.Entry entry)throws Exception{
        String board=SharedNgBoardCatalog.resolve(context,entry.board);
        if(board.isEmpty()||board.equals("unknown.invalid/unresolved"))board="*"; // User-selected shared policy: unresolved past registrations apply globally.
        String kind=category.equals("ID")?"id":category.equals("WORD")?"keyword":"name",value=entry.pattern;
        boolean regex=(entry.flags&0x20)!=0;
        if(category.equals("NAME")&&!regex){
            if(value.matches("-[A-Za-z0-9+/]{4}")){kind="suffix";value=value.substring(1);}
            else if(value.matches("[A-Za-z0-9+/]{4}-")){kind="prefix";value=value.substring(0,4);}
            else if(value.matches("[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}"))kind="wacchoi";
        }
        return new JSONObject().put("board",board).put("kind",kind).put("value",value).put("period","").put("regex",regex).put("flags",entry.flags&65535)
            .put("sourceCategory",category).put("boardName",SharedNgRules.boardLabel(board));
    }
    private static List<JSONObject> reporterConditions() throws Exception {
        List<JSONObject> out=new ArrayList<>();
        Set<String> seen=new HashSet<>();
        for(NativeNgStore.Entry entry:new NativeNgStore(context,"THREAD").entries()){
            int mode=entry.flags&0x74;
            if(mode!=0&&mode!=16)continue;
            String id=SharedNgReporter.nativeLiteral(entry.pattern);if(id==null)continue;
            String board=SharedNgBoardCatalog.resolve(context,entry.board);
            if(!board.isEmpty()&&!board.equals("*")&&!board.equals("unknown.invalid/unresolved")&&!board.equals("edge/all"))continue;
            if(seen.add(id))out.add(reporterCondition(id));
        }
        if(!ProgrammableNgController.isEnabled())return out;
        for(ProgrammableNgRuleSet.Rule rule:ProgrammableNgController.currentRules().rules){
            if(!rule.enabled||!"title".equals(rule.target))continue;
            String id=SharedNgReporter.literal(rule.script);if(id==null||!seen.add(id))continue;
            boolean edge=rule.allBoards;
            if(!edge)for(String board:rule.boards.split("\\s+"))if("edge/all".equals(SharedNgRules.board(board))){edge=true;break;}
            if(!edge){seen.remove(id);continue;}
            out.add(reporterCondition(id));
        }
        return out;
    }
    private static JSONObject reporterCondition(String id)throws Exception{
        return new JSONObject().put("board","edge/all").put("kind","reporter").put("value",id)
                .put("period","").put("regex",false).put("flags",16).put("sourceCategory","REPORTER").put("boardName","エッヂ");
    }
    private static void collect(){
        if(context==null||!prefs().getBoolean("consent",false))return;
        cancelRetry();
        try{
            SharedPreferences p=prefs();long generation=p.getLong("generation",0);String endpoint=SharedNg.endpoint();String sourceKey=hash(endpoint);JSONObject previous=new JSONObject(p.getString("snapshot."+sourceKey,"{}")),now=new JSONObject();
            JSONArray oldQueue=new JSONArray(p.getString("queue."+sourceKey,"[]")),queue=new JSONArray(),additions=new JSONArray();
            for(int i=0;i<oldQueue.length();i++){JSONObject row=oldQueue.getJSONObject(i);
                if(!"delete".equals(row.optString("action"))&&"keyword".equals(row.optString("kind"))&&!SharedNgRules.shareableKeyword(row.optString("value")))continue;
                queue.put(row);
            }
            boolean queueFiltered=queue.length()!=oldQueue.length();
            for(String kind:new String[]{"ID","NAME","WORD","REPORTER"}){
                if(!p.getBoolean("type."+kind,!kind.equals("REPORTER"))){for(Iterator<String> keys=previous.keys();keys.hasNext();){String key=keys.next();JSONObject c=previous.getJSONObject(key);if(kind.equals(c.optString("sourceCategory")))now.put(key,c);}continue;}
                if(kind.equals("REPORTER")){for(JSONObject c:reporterConditions()){String key=hash(c.toString());now.put(key,c);if(!previous.has(key))additions.put(operation(c,"upsert"));}continue;}
                for(NativeNgStore.Entry e:new NativeNgStore(context,kind).entries()){
                    if(e.pattern.isEmpty()||e.pattern.length()>2000||(e.flags&4)!=0||(kind.equals("WORD")&&!SharedNgRules.shareableKeyword(e.pattern)))continue;
                    JSONObject c=condition(kind,e);String key=hash(c.toString());now.put(key,c);
                    if(!previous.has(key))additions.put(operation(c,"upsert"));
                }
            }
            for(Iterator<String> it=previous.keys();it.hasNext();){String key=it.next();if(!now.has(key))queue.put(operation(previous.getJSONObject(key),"delete"));}
            // Withdraw old settings before adding replacements: presentation flags share one server vote.
            for(int i=0;i<additions.length();i++)queue.put(additions.get(i));
            if(queue.length()>10000)throw new Exception("未送信NGが10000件を超えました");
            if(!p.getBoolean("consent",false)||generation!=p.getLong("generation",0)||!endpoint.equals(SharedNg.endpoint()))return;
            // JSONObject comparison ignores key order; an idle poll must not serialize/save the whole snapshot again.
            boolean changed=queueFiltered||now.length()!=previous.length()||additions.length()!=0;
            if(!changed)for(Iterator<String> keys=previous.keys();keys.hasNext();)if(!now.has(keys.next())){changed=true;break;}
            if(changed&&!p.edit().putString("snapshot."+sourceKey,now.toString()).putString("queue."+sourceKey,queue.toString()).commit())throw new Exception("送信待ちを保存できません");
            if(queue.length()==0)return;
            long wait=p.getLong("retryAfter",0)-System.currentTimeMillis();
            if(wait>0){scheduleRetry(wait);return;}
            JSONArray batch=new JSONArray();int bytes=0;for(int i=0;i<queue.length()&&batch.length()<20;i++){JSONObject row=publicCondition(queue.getJSONObject(i));if(!p.getBoolean("type."+row.optString("sourceCategory"),true))continue;int size=row.toString().getBytes(StandardCharsets.UTF_8).length;if(bytes+size>50000)break;bytes+=size;batch.put(row);}
            if(!p.getBoolean("consent",false)||generation!=p.getLong("generation",0)||!endpoint.equals(SharedNg.endpoint()))return;
            if(batch.length()==0)return;
            JSONObject answer=SharedNg.request("POST",endpoint,new JSONObject().put("version",2).put("action","personal").put("device",installation()).put("reports",batch));
            if(!answer.optBoolean("ok"))throw new Exception(answer.optString("error","送信失敗"));
            Set<String> sent=new HashSet<>();for(int i=0;i<batch.length();i++)sent.add(batch.getJSONObject(i).getString("operationId"));
            Set<String> ack=new HashSet<>();JSONArray acknowledged=answer.getJSONArray("ack");for(int i=0;i<acknowledged.length();i++){String id=acknowledged.getString(i);if(!sent.contains(id))throw new Exception("送信していない操作の応答が返りました");ack.add(id);}
            if(ack.isEmpty())throw new Exception("送信の受領確認がありません");
            JSONArray remaining=new JSONArray();for(int i=0;i<queue.length();i++)if(!ack.contains(queue.getJSONObject(i).getString("operationId")))remaining.put(queue.get(i));
            if(p.getBoolean("consent",false)&&generation==p.getLong("generation",0)&&endpoint.equals(SharedNg.endpoint())){
                if(!p.edit().putString("queue."+sourceKey,remaining.toString()).putLong("retryAfter",0).putString("status","審査用NGを送信しました。残り "+remaining.length()+"件").commit())throw new Exception("送信結果を保存できません");
                if(remaining.length()>0)scheduleRetry(1000);
            }
        }catch(Exception error){
            if(!prefs().getBoolean("consent",false))return;
            prefs().edit().putLong("retryAfter",System.currentTimeMillis()+15*60*1000).putString("status","送信待ちを維持しています："+error.getMessage()).apply();
            scheduleRetry(15*60*1000);
        }

    }
    private static JSONObject publicCondition(JSONObject condition)throws Exception{
        JSONObject row=new JSONObject(condition.toString());row.put("board",SharedNgRules.family(row.getString("board"))).put("period","");row.remove("sourceScope");return row;
    }
    private static JSONObject operation(JSONObject condition,String action)throws Exception{return publicCondition(condition).put("action",action).put("operationId",hash(UUID.randomUUID().toString()));}
    private PersonalNgSubmissions(){}
}
