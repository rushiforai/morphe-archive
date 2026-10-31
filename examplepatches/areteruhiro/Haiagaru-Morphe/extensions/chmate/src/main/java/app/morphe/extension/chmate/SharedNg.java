package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.provider.Settings;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;

/** Offline matching with bounded, background delta synchronization. */
final class SharedNg {
    static final String PREFS="haiagaru.shared-ng";
    static final String DEFAULT_ENDPOINT="https://script.google.com/macros/s/AKfycbwd-Rxh5FvA9ooSCgR7IAXVyJAKiQVSjfVaozM7nuBSN6YGOA_4E5Qu69bB8zRVwCk/exec";
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static volatile Context context;
    private static volatile List<SharedNgRules.Rule> rules=Collections.emptyList();
    private static volatile Set<String> exceptions=Collections.emptySet();
    private static volatile boolean enabled,busy;
    private static volatile int threshold=5;
    private static volatile long nextSync;
    private static volatile String status="未同期";
    private static final java.util.concurrent.atomic.AtomicBoolean syncQueued=new java.util.concurrent.atomic.AtomicBoolean();
    private static volatile MatchPlan matchPlan;
    private static boolean reportFlushQueued;
    private static boolean reportPreparing;
    private static final Object REPORT_QUEUE_LOCK=new Object();
    private static final Object SOURCE_LOCK=new Object();
    private static long sourceGeneration;
    static SharedPreferences prefs(){return context.getSharedPreferences(PREFS,0);}
    static void initialize(Context c){if(context!=null)return;context=c.getApplicationContext();if(prefs().contains("githubFeed")||prefs().contains("feedEndpoint"))prefs().edit().remove("githubFeed").remove("feedEndpoint").putLong("cursor",0).apply();prefs().edit().remove("filterLevel").apply();reload();PersonalNgSubmissions.initialize(context);IO.execute(()->{
        try{loadCache();}catch(FileNotFoundException absent){/* First launch has no cache. */}catch(Exception e){status="キャッシュを読み込めません";}
        if(rules.isEmpty())prefs().edit().putLong("cursor",0).apply();flushReports();sync(false);
    });}
    static void reload(){if(context==null)return;SharedPreferences p=prefs();enabled=p.getBoolean("enabled",false);threshold=p.getInt("threshold",5);if(threshold<1)threshold=5;exceptions=new HashSet<>(p.getStringSet("exceptions",Collections.emptySet()));new android.os.Handler(android.os.Looper.getMainLooper()).post(ProgrammableNgController::sharedNgChanged);}
    static boolean enabled(){return enabled;}
    private static final class MatchPlan {
        final List<SharedNgRules.Rule> source;final Set<String> ignored,excluded;final int votes,kinds;final SharedNgIndex index;
        MatchPlan(List<SharedNgRules.Rule> source,Set<String> ignored,Set<String> excluded,int votes,int kinds){
            this.source=source;this.ignored=ignored;this.excluded=new HashSet<>(excluded);this.votes=votes;this.kinds=kinds;
            index=new SharedNgIndex(source,votes,ignored,this.excluded,kinds);
        }
    }
    private static SharedNgIndex index(){
        SharedPreferences p=prefs();int kinds=0;
        for(int i=0;i<SharedNgIndex.KINDS.length;i++)if(p.getBoolean("kind."+SharedNgIndex.KINDS[i],true))kinds|=1<<i;
        Set<String> excluded=p.getStringSet("excludedBoards",Collections.emptySet());
        List<SharedNgRules.Rule> source=rules;Set<String> ignored=exceptions;int votes=threshold;MatchPlan plan=matchPlan;
        if(plan==null||plan.source!=source||plan.ignored!=ignored||plan.votes!=votes||plan.kinds!=kinds||!plan.excluded.equals(excluded)){
            plan=new MatchPlan(source,ignored,excluded,votes,kinds);matchPlan=plan;
        }
        return plan.index;
    }
    static boolean[] match(List<ProgrammableNgScript.Input> inputs){
        boolean[] out=new boolean[inputs.size()];if(!enabled)return out;
        SharedNgIndex active=index();Map<String,String> boardCache=new HashMap<>();
        for(int i=0;i<inputs.size();i++){
            ProgrammableNgScript.Input input=inputs.get(i);String url=string(input,"boardUrl");
            String board=boardCache.computeIfAbsent(url,SharedNgRules::board);
            if("title".equals(input.values.get("target"))){out[i]=active.matchesTitle(board,string(input,"posterId"));continue;}
            out[i]=active.matches(board,string(input,"responseId"),string(input,"name"),input.text);
        }
        schedule();return out;
    }
    static String string(ProgrammableNgScript.Input input,String key){Object v=input.values.get(key);return v==null?"":v.toString();}
    static void schedule(){
        if(context==null||!enabled||busy||System.currentTimeMillis()<nextSync||!syncQueued.compareAndSet(false,true))return;
        try{IO.execute(()->{try{if(enabled&&!busy&&System.currentTimeMillis()>=nextSync){flushReports();sync(false);}}finally{syncQueued.set(false);}});}
        catch(RejectedExecutionException unavailable){syncQueued.set(false);}
    }
    static String configuredEndpoint(){String url=prefs().getString("endpoint","");return url==null||url.trim().isEmpty()?DEFAULT_ENDPOINT:url;}
    static String feedEndpoint(){return endpoint()+"?action=reviewed&reporter=1&globalIdentity=1";}
    static String endpoint(){String url=configuredEndpoint();if(!url.matches("https://script\\.google\\.com/macros/s/[A-Za-z0-9_-]+/exec"))throw new IllegalArgumentException("GASの /exec URLを指定してください");return url;}
    static void changeEndpoint(String next){synchronized(SOURCE_LOCK){
        if(next.equals(configuredEndpoint()))return;
        sourceGeneration++;prefs().edit().putString("endpoint",next).putLong("cursor",0).putInt("failures",0).apply();
        rules=Collections.emptyList();nextSync=0;
        new android.os.Handler(android.os.Looper.getMainLooper()).post(ProgrammableNgController::sharedNgChanged);
    }}
    static synchronized void sync(boolean manual){if(context==null||busy||(!manual&&(!enabled||System.currentTimeMillis()<nextSync)))return;busy=true;
        long generation=-1;
        try{String source;long cursor;synchronized(SOURCE_LOCK){source=feedEndpoint();cursor=prefs().getLong("cursor",0);generation=sourceGeneration;}
            List<SharedNgRules.Rule> updated=null;JSONObject response=request("GET",source,null);
            if(!response.optBoolean("ok"))throw new IOException(response.optString("error","同期失敗"));
            if(!source.equals(feedEndpoint()))throw new IOException("同期中に接続先が変更されました");
            long revision=response.getLong("revision");if(revision<cursor)throw new IOException("更新番号が戻っています");
            if(!response.optBoolean("unchanged")){
                LinkedHashMap<String,SharedNgRules.Rule> merged=new LinkedHashMap<>();
                boolean full=response.optBoolean("full");if(!full)throw new IOException("共有NG配信は全件形式で指定してください");
                if(!full)for(SharedNgRules.Rule r:rules)merged.put(r.id,r);
                int offset=0,pages=0;
                for(;;){
                    if(response.optBoolean("restart"))throw new IOException("同期中に共有NGが更新されました。後で再試行します");
                    if(response.getLong("revision")!=revision||response.optBoolean("full")!=full)throw new IOException("同期ページの更新番号が一致しません");
                    List<SharedNgRules.Rule> incoming=decode(response.getJSONArray("rules"));
                    for(SharedNgRules.Rule r:incoming)merged.put(r.id,r);
                    if(merged.size()>10000||++pages>51)throw new IOException("共有NGが上限を超えています");
                    if(response.isNull("nextOffset")||!response.has("nextOffset"))break;
                    int next=response.getInt("nextOffset");if(next<=offset||next>10000||incoming.isEmpty())throw new IOException("同期ページが不正です");offset=next;
                    response=request("GET",source+(source.contains("?")?"&":"?")+"since="+cursor+"&offset="+offset+"&snapshot="+revision,null);
                    if(!response.optBoolean("ok"))throw new IOException(response.optString("error","同期失敗"));
                    if(!source.equals(feedEndpoint()))throw new IOException("同期中に接続先が変更されました");
                }
                List<SharedNgRules.Rule> next=new ArrayList<>(merged.values());synchronized(SOURCE_LOCK){if(generation!=sourceGeneration||!source.equals(feedEndpoint()))throw new IOException("同期中に接続先が変更されました");saveCache(next,source);}updated=Collections.unmodifiableList(next);
            }
            synchronized(SOURCE_LOCK){
            if(generation!=sourceGeneration||!source.equals(feedEndpoint()))throw new IOException("同期中に接続先が変更されました");
            if(updated!=null){rules=updated;new android.os.Handler(android.os.Looper.getMainLooper()).post(ProgrammableNgController::sharedNgChanged);}
            prefs().edit().putLong("cursor",revision).putLong("lastSync",System.currentTimeMillis()).putInt("failures",0).apply();
            nextSync=System.currentTimeMillis()+15*60*1000;status="同期済み："+rules.size()+"条件";
            }
        }catch(Exception e){synchronized(SOURCE_LOCK){if(generation>=0&&generation!=sourceGeneration){nextSync=0;status="接続先を変更しました。再同期します";}else{int n=Math.min(6,prefs().getInt("failures",0)+1);prefs().edit().putInt("failures",n).apply();nextSync=System.currentTimeMillis()+Math.min(6*60*60*1000L,(15*60*1000L)<<n);status="同期失敗（保存済みの条件を使用）："+e.getMessage();}}}
        finally{busy=false;}
    }
    static List<SharedNgRules.Rule> decode(JSONArray rows)throws JSONException{if(rows.length()>10000)throw new JSONException("条件が多すぎます");List<SharedNgRules.Rule> out=new ArrayList<>();Set<String> seen=new HashSet<>();
        for(int i=0;i<rows.length();i++){JSONObject r=rows.getJSONObject(i);SharedNgRules.Rule rule=new SharedNgRules.Rule(r.getString("id"),r.getString("board"),r.getString("kind"),r.getString("value"),r.getString("period"),r.getInt("votes"),r.optBoolean("revoked"),r.optInt("minLevel",1),r.optInt("minVotes",0));if(!seen.add(rule.id))throw new JSONException("重複ID");out.add(rule);}return Collections.unmodifiableList(out);}
    static JSONObject encode(SharedNgRules.Rule r)throws JSONException{return new JSONObject().put("id",r.id).put("board",r.board).put("kind",r.kind).put("value",r.value).put("period",r.period).put("votes",r.votes).put("revoked",r.revoked).put("minLevel",r.minLevel).put("minVotes",r.minVotes);}
    static android.util.AtomicFile cacheFile(){return new android.util.AtomicFile(new File(context.getFilesDir(),"shared-ng-cache-v2.json.gz"));}
    /** Stream cached conditions so a large rule set is never duplicated as one JSON string. */
    static void loadCache()throws Exception{
        String source="";int format=0;List<SharedNgRules.Rule> loaded=new ArrayList<>();Set<String> ids=new HashSet<>();
        try(InputStream file=cacheFile().openRead();java.util.zip.GZIPInputStream zipped=new java.util.zip.GZIPInputStream(file);android.util.JsonReader reader=new android.util.JsonReader(new InputStreamReader(zipped,StandardCharsets.UTF_8))){
            reader.beginObject();while(reader.hasNext()){String key=reader.nextName();
                if(key.equals("format"))format=reader.nextInt();
                else if(key.equals("endpoint"))source=reader.nextString();
                else if(key.equals("rules")){reader.beginArray();while(reader.hasNext()){
                    if(loaded.size()>=10000)throw new IOException("保存済み共有NGが上限を超えています");
                    String id="",board="",kind="",value="",period="";int votes=0,minLevel=1,minVotes=0;boolean revoked=false;
                    reader.beginObject();while(reader.hasNext()){switch(reader.nextName()){
                        case "id":id=reader.nextString();break;case "board":board=reader.nextString();break;case "kind":kind=reader.nextString();break;case "value":value=reader.nextString();break;case "period":period=reader.nextString();break;
                        case "minLevel":minLevel=reader.nextInt();break;case "minVotes":minVotes=reader.nextInt();break;case "votes":votes=reader.nextInt();break;case "revoked":revoked=reader.nextBoolean();break;default:reader.skipValue();}}
                    reader.endObject();SharedNgRules.Rule rule=new SharedNgRules.Rule(id,board,kind,value,period,votes,revoked,minLevel,minVotes);if(!ids.add(id))throw new IOException("保存済み共有NGに重複があります");loaded.add(rule);
                }reader.endArray();}else reader.skipValue();
            }reader.endObject();
        }
        if(format!=2)throw new IOException("共有NGキャッシュの形式が不正です");
        synchronized(SOURCE_LOCK){if(source.equals(feedEndpoint()))rules=Collections.unmodifiableList(loaded);}
    }
    static void saveCache(List<SharedNgRules.Rule> data,String endpoint)throws Exception{
        android.util.AtomicFile file=cacheFile();FileOutputStream stream=file.startWrite();
        try{
            java.util.zip.GZIPOutputStream zipped=new java.util.zip.GZIPOutputStream(stream);
            android.util.JsonWriter writer=new android.util.JsonWriter(new OutputStreamWriter(zipped,StandardCharsets.UTF_8));
            writer.beginObject().name("format").value(2).name("endpoint").value(endpoint).name("rules").beginArray();
            for(SharedNgRules.Rule r:data)writer.beginObject().name("id").value(r.id).name("board").value(r.board).name("kind").value(r.kind).name("value").value(r.value).name("period").value(r.period).name("votes").value(r.votes).name("revoked").value(r.revoked).name("minLevel").value(r.minLevel).name("minVotes").value(r.minVotes).endObject();
            writer.endArray().endObject();writer.flush();zipped.finish();file.finishWrite(stream);
        }catch(Exception e){file.failWrite(stream);throw e;}
    }
    static String deviceHash()throws Exception{return PersonalNgSubmissions.installation();}
    /** Only explicitly confirmed reports enter this durable queue. */
    static void queueReport(JSONObject report)throws Exception{
        if("keyword".equals(report.optString("kind"))&&!SharedNgRules.shareableKeyword(report.optString("value")))throw new IOException("NGワードは空白を除いて5文字以上、英字だけではない条件にしてください");
        synchronized(REPORT_QUEUE_LOCK){
        String source=endpoint();JSONArray queue=new JSONArray(prefs().getString("reportQueue","[]"));
        for(int i=0;i<queue.length();i++){JSONObject row=queue.getJSONObject(i);if(source.equals(row.getString("endpoint"))&&row.getJSONObject("report").toString().equals(report.toString()))return;}
        if(queue.length()>=100)throw new IOException("未送信の報告が100件あります。通信回復後に再試行してください");
        queue.put(new JSONObject().put("endpoint",source).put("report",report));
        if(!prefs().edit().putString("reportQueue",queue.toString()).commit())throw new IOException("報告を保存できません");
        if(!reportFlushQueued){reportFlushQueued=true;new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(()->IO.execute(()->{synchronized(REPORT_QUEUE_LOCK){reportFlushQueued=false;}flushReports();}),5000);}
        }
    }
    static void flushReports(){try{
        if(System.currentTimeMillis()<prefs().getLong("reportRetryAfter",0))return;
        JSONArray queue;synchronized(REPORT_QUEUE_LOCK){
            JSONArray old=new JSONArray(prefs().getString("reportQueue","[]"));queue=new JSONArray();
            for(int i=0;i<old.length();i++){JSONObject row=old.getJSONObject(i),report=row.getJSONObject("report");
                if("keyword".equals(report.optString("kind"))&&!SharedNgRules.shareableKeyword(report.optString("value")))continue;queue.put(row);}
            if(queue.length()!=old.length()&&!prefs().edit().putString("reportQueue",queue.toString()).commit())throw new IOException("送信待ちを更新できません");
        }if(queue.length()==0)return;
        String source=queue.getJSONObject(0).getString("endpoint");JSONArray reports=new JSONArray();Set<Integer> sent=new HashSet<>();
        for(int i=0;i<queue.length()&&reports.length()<20;i++){JSONObject row=queue.getJSONObject(i);if(!source.equals(row.getString("endpoint")))continue;
            JSONObject report=row.getJSONObject("report");int bytes=reports.toString().getBytes(StandardCharsets.UTF_8).length+report.toString().getBytes(StandardCharsets.UTF_8).length;
            if(bytes>55000)break;reports.put(report);sent.add(i);
        }
        JSONArray personal=new JSONArray();Set<String> expected=new HashSet<>();
        for(int i=0;i<reports.length();i++){JSONObject old=reports.getJSONObject(i);String operation=PersonalNgSubmissions.hash(source+"\n"+old.toString());expected.add(operation);personal.put(new JSONObject(old.toString()).put("operationId",operation).put("action","upsert").put("flags",16).put("regex",false));}
        JSONObject response=request("POST",source,new JSONObject().put("version",2).put("action","personal").put("device",deviceHash()).put("reports",personal));
        if(!response.optBoolean("ok"))throw new IOException(response.optString("error","報告失敗"));
        Set<String> ackIds=new HashSet<>();JSONArray ack=response.getJSONArray("ack");for(int i=0;i<ack.length();i++)ackIds.add(ack.getString(i));
        Set<String> acknowledged=new HashSet<>();for(int i:sent){JSONObject row=queue.getJSONObject(i);if(ackIds.contains(PersonalNgSubmissions.hash(source+"\n"+row.getJSONObject("report").toString())))acknowledged.add(row.toString());}
        JSONArray remaining;
        synchronized(REPORT_QUEUE_LOCK){
            remaining=remainingReports(new JSONArray(prefs().getString("reportQueue","[]")),acknowledged);
            if(!prefs().edit().putString("reportQueue",remaining.toString()).putLong("reportRetryAfter",0).commit())throw new IOException("送信結果を保存できません");
        }
        status="報告を送信しました";nextSync=0;sync(true);
        if(remaining.length()>0)new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(()->IO.execute(SharedNg::flushReports),5000);
    }catch(Exception error){prefs().edit().putLong("reportRetryAfter",System.currentTimeMillis()+15*60*1000).apply();status="報告を保存しました（通信回復後に再試行）："+error.getMessage();}}
    /** Remove only acknowledged entries, retaining reports added while HTTP was in flight. */
    static JSONArray remainingReports(JSONArray current,Set<String> acknowledged)throws JSONException{
        JSONArray remaining=new JSONArray();for(int i=0;i<current.length();i++)if(!acknowledged.contains(current.getJSONObject(i).toString()))remaining.put(current.get(i));return remaining;
    }
    static JSONObject request(String verb,String url,JSONObject body)throws Exception{
        for(int redirects=0;redirects<3;redirects++){
            URL target=new URL(url);String host=target.getHost();if(!target.getProtocol().equals("https")||!(host.equals("script.google.com")||host.equals("script.googleusercontent.com")||host.equals("raw.githubusercontent.com")))throw new IOException("不正な転送先");
            HttpURLConnection c=(HttpURLConnection)target.openConnection();c.setInstanceFollowRedirects(false);c.setConnectTimeout(10000);c.setReadTimeout(15000);c.setRequestMethod(verb);
            try{if(body!=null){byte[] bytes=body.toString().getBytes(StandardCharsets.UTF_8);c.setDoOutput(true);c.setRequestProperty("Content-Type","application/json; charset=utf-8");c.setFixedLengthStreamingMode(bytes.length);try(OutputStream out=c.getOutputStream()){out.write(bytes);}}
                int code=c.getResponseCode();if(code==302||code==303){url=new URL(target,c.getHeaderField("Location")).toString();verb="GET";body=null;continue;}
                if(code!=200)throw new IOException("HTTP "+code);try(InputStream in=c.getInputStream()){return new JSONObject(read(in,4*1024*1024));}
            }finally{c.disconnect();}
        }throw new IOException("転送回数が多すぎます");
    }
    static String read(InputStream in,int max)throws IOException{ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buf=new byte[8192];int n;while((n=in.read(buf))!=-1){if(out.size()+n>max)throw new IOException("応答が大きすぎます");out.write(buf,0,n);}return out.toString("UTF-8");}
    static void settings(Activity a){LinearLayout box=new LinearLayout(a);box.setOrientation(1);int pad=(int)(16*a.getResources().getDisplayMetrics().density);box.setPadding(pad,0,pad,0);
        PersonalNgSubmissions.addSettings(box,a);
        Switch on=new Switch(a);on.setText("オンライン共有NGを使う");on.setChecked(enabled);box.addView(on);on.setOnCheckedChangeListener((v,b)->{if(b&&!PersonalNgSubmissions.consented()){on.setChecked(false);PersonalNgSubmissions.enableWithConsent(a,()->on.setChecked(true));return;}prefs().edit().putBoolean("enabled",b).apply();reload();schedule();});
        TextView help=new TextView(a);help.setText("初回は個人NGの送信に同意すると共有NGが有効になります。送信対象は個人NGの送信設定で変更できます。承認された条件だけを受信し、必要な報告数・掲示板・種類・個別除外で絞り込みます。ID・ワッチョイは保存された掲示板の区分で適用し、掲示板が不明な過去NGと全板指定のNGは全掲示板に適用します。有効期間は設けません。変更後はスレを開き直してください。");box.addView(help);
        TextView levelLabel=new TextView(a);levelLabel.setText("必要な報告数");box.addView(levelLabel);
        LinearLayout voteRow=new LinearLayout(a);voteRow.setGravity(android.view.Gravity.CENTER_VERTICAL);
        EditText votes=new EditText(a);votes.setSingleLine(true);votes.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);votes.setText(Integer.toString(threshold));votes.setContentDescription("共有NGに必要な報告数");voteRow.addView(votes,new LinearLayout.LayoutParams(0,-2,1));
        Button saveVotes=new Button(a);saveVotes.setText("保存");voteRow.addView(saveVotes);box.addView(voteRow);
        TextView voteHelp=new TextView(a);voteHelp.setText("1以上の整数で指定します。審査済みの共有NGのうち、この報告数以上の条件を適用します。");box.addView(voteHelp);
        saveVotes.setOnClickListener(v->{try{int number=SharedNgRules.reportThreshold(votes.getText().toString());prefs().edit().putInt("threshold",number).apply();reload();votes.setText(Integer.toString(number));Toast.makeText(a,"必要な報告数を保存しました",Toast.LENGTH_SHORT).show();}catch(IllegalArgumentException invalid){votes.setError(invalid.getMessage());}});

        String[] kinds={"id","wacchoi","prefix","suffix","keyword","name","trip","reporter"};String[] kindLabels={"ID","ワッチョイ全文","ワッチョイ上4桁","ワッチョイ下4桁","NGワード","NGName","トリップ","エッヂの記者ID（スレ一覧）"};
        for(int i=0;i<kinds.length;i++){final String kind=kinds[i];Switch choice=new Switch(a);choice.setText(kindLabels[i]+"を共有NGの対象にする");choice.setChecked(prefs().getBoolean("kind."+kind,true));choice.setOnCheckedChangeListener((b,onValue)->{prefs().edit().putBoolean("kind."+kind,onValue).apply();reload();});box.addView(choice);}
        Button boards=new Button(a);boards.setText("対象掲示板を選ぶ（取得済みの共有条件）");box.addView(boards);boards.setOnClickListener(v->{Set<String> set=new TreeSet<>();for(SharedNgRules.Rule r:rules)set.add(r.board);String[] items=set.toArray(new String[0]);String[] labels=new String[items.length];for(int i=0;i<items.length;i++)labels[i]=SharedNgRules.boardLabel(items[i]);Set<String> excluded=new HashSet<>(prefs().getStringSet("excludedBoards",Collections.emptySet()));boolean[] checked=new boolean[items.length];for(int i=0;i<items.length;i++)checked[i]=!excluded.contains(items[i]);new HaiagaruDialog.Builder(a).setTitle("共有NGを適用する掲示板").setMultiChoiceItems(labels,checked,(d,n,b)->checked[n]=b).setPositiveButton("保存",(d,w)->{for(int i=0;i<items.length;i++)if(checked[i])excluded.remove(items[i]);else excluded.add(items[i]);prefs().edit().putStringSet("excludedBoards",excluded).apply();reload();}).setNegativeButton("戻る",null).show();});
        TextView state=new TextView(a);state.setText(status);box.addView(state);
        Button update=new Button(a);update.setText("共有NGを同期");box.addView(update);update.setOnClickListener(v->{update.setEnabled(false);state.setText("同期中…");IO.execute(()->{sync(true);a.runOnUiThread(()->{state.setText(status);update.setEnabled(true);});});});
        Button report=new Button(a);report.setText("選んだ投稿から共有NGを報告");box.addView(report);report.setOnClickListener(v->report(a));
        Button list=new Button(a);list.setText("受信した条件・個別解除");box.addView(list);list.setOnClickListener(v->{List<SharedNgRules.Rule> snapshot=rules;String[] names=new String[snapshot.size()];boolean[] disabled=new boolean[names.length];for(int i=0;i<names.length;i++){SharedNgRules.Rule r=snapshot.get(i);names[i]=SharedNgRules.boardLabel(r.board)+" / "+r.kind+" / "+r.value+" / "+r.votes+"票"+(r.revoked?"（配信停止）":"");disabled[i]=exceptions.contains(r.id);}new HaiagaruDialog.Builder(a).setTitle("チェックした条件を適用しない").setMultiChoiceItems(names,disabled,(d,i,b)->disabled[i]=b).setPositiveButton("保存",(d,w)->{Set<String> off=new HashSet<>();for(int i=0;i<disabled.length;i++)if(disabled[i])off.add(snapshot.get(i).id);prefs().edit().putStringSet("exceptions",off).apply();reload();}).setNegativeButton("戻る",null).show();});
        ScrollView scroll=new ScrollView(a);scroll.addView(box);new HaiagaruDialog.Builder(a).setTitle("オンライン共有NG（開発中）").setView(scroll).setPositiveButton("閉じる",null).show();
    }
    static void report(Activity a){
        if(reportPreparing){Toast.makeText(a,"レスの準備中です",Toast.LENGTH_SHORT).show();return;}
        final Object[] source;try{source=ProgrammableNgController.captureSharedReportSource(a);}catch(Exception error){Toast.makeText(a,"先に報告するスレを表示してください",Toast.LENGTH_LONG).show();return;}
        reportPreparing=true;
        Toast.makeText(a,"報告するレスを準備しています…",Toast.LENGTH_SHORT).show();
        IO.execute(()->{try{List<ProgrammableNgScript.Input> posts=ProgrammableNgController.sharedReportInputs(source[0],(String)source[1]);
            String[] names=new String[posts.size()];for(int i=0;i<names.length;i++){ProgrammableNgScript.Input p=posts.get(i);String text=SharedNgRules.text(p.text);names[i]=string(p,"responseNumber")+"："+text.substring(0,Math.min(70,text.length()));}
            a.runOnUiThread(()->{reportPreparing=false;if(a.isFinishing()||a.isDestroyed())return;showReportPosts(a,posts,names);});
            }catch(Exception error){a.runOnUiThread(()->{reportPreparing=false;if(!a.isFinishing()&&!a.isDestroyed())Toast.makeText(a,"レスを準備できませんでした。スレを開き直してください",Toast.LENGTH_LONG).show();});}
        });
    }
    private static void showReportPosts(Activity a,List<ProgrammableNgScript.Input> posts,String[] names){if(posts.isEmpty()){Toast.makeText(a,"先にスレを開いてください",Toast.LENGTH_LONG).show();return;}
        new HaiagaruDialog.Builder(a).setTitle("報告するレスを選択").setItems(names,(d,n)->{ProgrammableNgScript.Input input=posts.get(n);new HaiagaruDialog.Builder(a).setTitle("共有する条件").setItems(new String[]{"ID（板・投稿日を限定）","ワッチョイ全体（板・週を限定）","本文キーワード","ワッチョイ上4桁","ワッチョイ下4桁"},(dialog,k)->{
            String kind=new String[]{"id","wacchoi","keyword","prefix","suffix"}[k],value=k==0?string(input,"responseId"):k==1?SharedNgRules.wacchoi(string(input,"name")):SharedNgRules.text(input.text),period="";
            if(k>=3){String full=SharedNgRules.wacchoi(string(input,"name"));value=full.isEmpty()?"":k==3?full.substring(0,4):full.substring(5);}
            EditText content=new EditText(a);content.setText(value);content.setMinLines(2);
            new HaiagaruDialog.Builder(a).setTitle("共有NG報告："+kind).setMessage("対象掲示板："+SharedNgRules.boardLabel(SharedNgRules.board(string(input,"boardUrl")))+"\n期間："+(period.isEmpty()?"期限なし":period)+"\n選択した条件と端末ハッシュをGASへ送信します。本文全体や閲覧履歴は自動送信しません。").setView(content).setNegativeButton("キャンセル",null).setPositiveButton("この条件を報告",(confirm,w)->{String selected=content.getText().toString().trim();IO.execute(()->{String message;try{
                String board=SharedNgRules.board(string(input,"boardUrl"));new SharedNgRules.Rule(String.join("",Collections.nCopies(64,"0")),board,kind,selected,period,1,false);
                JSONObject row=new JSONObject().put("board",board).put("kind",kind).put("value",selected).put("period",period);
                queueReport(row);message="報告を保存しました。まとめて送信します";
            }catch(Exception e){message="報告できませんでした："+e.getMessage();}final String text=message;a.runOnUiThread(()->Toast.makeText(a,text,Toast.LENGTH_LONG).show());});}).show();
        }).show();}).setNegativeButton("戻る",null).show();
    }
    private SharedNg(){}
}
