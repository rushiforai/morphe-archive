package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.*;
import java.net.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.JSONObject;

/** Optional public rule feed. No posting data, cookies or search history are sent. */
final class F9NgUpdates {
    private static final String DEFAULT_URL="https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/rules/f9.json";
    private static final ExecutorService WORK=Executors.newSingleThreadExecutor();
    private static final java.util.concurrent.atomic.AtomicBoolean RUNNING=new java.util.concurrent.atomic.AtomicBoolean();
    private static final String URL_KEY="f9.update.url",AUTO="f9.update.auto",SCRIPT="f9.update.script",
            VERSION="f9.update.version",ATTEMPT="f9.update.attempt",SUCCESS="f9.update.success",STATUS="f9.update.status";
    private static final long DAY=24*60*60*1000L;
    private static SharedPreferences prefs(Context c){return c.getSharedPreferences(ProgrammableNgController.PREFS,0);}
    static String currentScript(Context c){return prefs(c).getString(SCRIPT,F9NgTemplate.SCRIPT);}
    static void maybeUpdate(Context c){
        SharedPreferences p=prefs(c);
        if(p.getBoolean(AUTO,false)&&System.currentTimeMillis()-p.getLong(ATTEMPT,0)>=DAY&&!p.getString(URL_KEY,DEFAULT_URL).isEmpty())fetch(c,null);
    }
    static void addSettings(LinearLayout parent,Activity activity){
        Button button=new Button(activity);button.setText("F9対策ルールの自動更新（開発中）");parent.addView(button);
        button.setOnClickListener(v->show(activity));
    }
    private static void show(Activity a){
        SharedPreferences p=prefs(a);LinearLayout form=new LinearLayout(a);form.setOrientation(1);
        Switch auto=new Switch(a);auto.setText("自動更新する（アプリ起動時、1日1回まで）");auto.setChecked(p.getBoolean(AUTO,false));form.addView(auto);
        EditText url=new EditText(a);url.setSingleLine(true);url.setHint("配信データのHTTPS URL");url.setText(p.getString(URL_KEY,DEFAULT_URL));form.addView(url);
        TextView help=new TextView(a);help.setText("GitHubで配信するF9対策ルールを取得します。\n信頼する配信元だけを指定してください。F9対策のひな形から作った未編集の条件だけ更新します。対象板・オンオフは維持し、手動編集した条件は上書きしません。新しい条件の自動追加や、NG機能の自動有効化は行いません。失敗時は現在のルールを維持します。更新後はスレを開き直してください。");form.addView(help);
        TextView status=new TextView(a);status.setText(p.getString(STATUS,"まだ更新していません")+"\n現在の配信版："+p.getLong(VERSION,0));form.addView(status);
        Button now=new Button(a);now.setText("保存して今すぐ更新");form.addView(now);
        Runnable save=()->{
            String address=url.getText().toString().trim();
            if(!address.isEmpty()&&!validUrl(address))throw new IllegalArgumentException("認証情報を含まないHTTPS URLを指定してください");
            if(auto.isChecked()&&address.isEmpty())throw new IllegalArgumentException("取得先URLを入力してください");
            // A new feed has its own version sequence. Keep the current script for migration.
            SharedPreferences.Editor edit=p.edit().putString(URL_KEY,address).putBoolean(AUTO,auto.isChecked());
            if(!address.equals(p.getString(URL_KEY,DEFAULT_URL)))edit.remove(VERSION).remove(ATTEMPT);
            edit.commit();
        };
        now.setOnClickListener(v->{try{save.run();now.setEnabled(false);status.setText("更新を確認しています…");fetch(a,result->a.runOnUiThread(()->{now.setEnabled(true);status.setText(result);}));}catch(IllegalArgumentException invalid){url.setError(invalid.getMessage());}});
        ScrollView scroll=new ScrollView(a);scroll.addView(form);
        new HaiagaruDialog.Builder(a).setTitle("F9対策ルールの自動更新（開発中）").setView(scroll)
            .setPositiveButton("保存",(d,w)->{try{save.run();maybeUpdate(a);}catch(IllegalArgumentException invalid){Toast.makeText(a,invalid.getMessage(),Toast.LENGTH_LONG).show();}})
            .setNegativeButton("閉じる",null).show();
    }
    private static boolean validUrl(String url){try{URI u=URI.create(url);return "https".equalsIgnoreCase(u.getScheme())&&u.getHost()!=null&&u.getUserInfo()==null&&u.getFragment()==null;}catch(IllegalArgumentException invalid){return false;}}
    private interface Done{void result(String message);}
    private static void fetch(Context source,Done done){
        Context app=source.getApplicationContext();final Context c=app==null?source:app;
        if(!RUNNING.compareAndSet(false,true)){if(done!=null)done.result("更新確認中です");return;}
        WORK.execute(()->{
            SharedPreferences p=prefs(c);String address=p.getString(URL_KEY,DEFAULT_URL);String message;
            p.edit().putLong(ATTEMPT,System.currentTimeMillis()).apply();
            try{
                if(!validUrl(address))throw new IOException("HTTPSの取得先URLを設定してください");
                JSONObject data=new JSONObject(download(address));
                if(data.getInt("format")!=1)throw new IOException("未対応の配信形式です");
                long version=data.getLong("version");String script=data.getString("script");
                if(version<1||script.isEmpty()||script.length()>ProgrammableNgScript.MAX_SOURCE_LENGTH)throw new IOException("配信データが不正です");
                ProgrammableNgScript evaluator=new ProgrammableNgScript(script);
                evaluator.evaluate(Collections.singletonList(new ProgrammableNgScript.Input("動作確認",Collections.emptyMap())));
                if(evaluator.error()!=null)throw new IOException("更新ルールの検証に失敗しました");
                synchronized(ProgrammableNgController.class){
                    if(!address.equals(p.getString(URL_KEY,DEFAULT_URL)))throw new IOException("取得先が変更されたため中止しました");
                    long previous=p.getLong(VERSION,0);
                    if(version<=previous){message="新しい更新はありません";}
                    else{
                        String old=p.getString(SCRIPT,F9NgTemplate.SCRIPT);List<ProgrammableNgRuleSet.Rule> updated=new ArrayList<>();int count=0;
                        for(ProgrammableNgRuleSet.Rule rule:ProgrammableNgController.currentRules().rules){
                            if("body".equals(rule.target)&&(rule.script.equals(old)||rule.script.equals(F9NgTemplate.SCRIPT))){
                                updated.add(new ProgrammableNgRuleSet.Rule(rule.id,rule.name,rule.target,rule.enabled,rule.allBoards,rule.boards,script));count++;
                            }else updated.add(rule);
                        }
                        if(!p.edit().putString(ProgrammableNgController.RULES_KEY,new ProgrammableNgRuleSet(updated).encode())
                                .putString(SCRIPT,script).putLong(VERSION,version).putLong(SUCCESS,System.currentTimeMillis()).commit())throw new IOException("更新を保存できませんでした");
                        ProgrammableNgController.reload();message="配信版 "+version+" に更新しました（既存の条件 "+count+"件）";
                    }
                }
            }catch(Exception error){message="更新できませんでした。現在のルールを維持します："+(error.getMessage()==null?error.getClass().getSimpleName():error.getMessage());}
            finally{RUNNING.set(false);}
            p.edit().putString(STATUS,message).apply();if(done!=null)done.result(message);
        });
    }
    private static String download(String address)throws IOException{
        for(int redirects=0;redirects<5;redirects++){
            if(!validUrl(address))throw new IOException("HTTPS以外の転送は利用できません");
            HttpURLConnection connection=(HttpURLConnection)new URL(address).openConnection();
            connection.setConnectTimeout(15000);connection.setReadTimeout(15000);connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept","application/json");connection.setRequestProperty("Cookie","");
            try{
                int code=connection.getResponseCode();
                if(code==301||code==302||code==303||code==307||code==308){String location=connection.getHeaderField("Location");if(location==null)throw new IOException("転送先がありません");address=new URL(new URL(address),location).toString();continue;}
                if(code!=200)throw new IOException("HTTP "+code);
                ByteArrayOutputStream bytes=new ByteArrayOutputStream();
                try(InputStream input=connection.getInputStream()){byte[] block=new byte[4096];int n;while((n=input.read(block))!=-1){if(bytes.size()+n>128*1024)throw new IOException("配信データが大きすぎます");bytes.write(block,0,n);}}
                return new String(bytes.toByteArray(),StandardCharsets.UTF_8);
            }finally{connection.disconnect();}
        }
        throw new IOException("転送回数が多すぎます");
    }
    private F9NgUpdates(){}
}
