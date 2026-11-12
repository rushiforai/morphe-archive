package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.EditText;
import android.text.InputType;
import android.widget.Toast;
import org.json.JSONObject;
import java.util.*;

/** Local subscription lifecycle. Old registrations retain their unlimited deadline. */
final class ThreadWatchManagement {
    static int defaultDuration(Context c) {
        return c.getSharedPreferences(ThreadWatch.PREFS+"_options",0).getInt("durationMinutes",10080);
    }
    static boolean expired(JSONObject item,long now) {
        long deadline=item.optLong("expiresAt",0);return deadline>0&&now>=deadline;
    }
    static boolean active(JSONObject item,long now) {return !item.optBoolean("paused",false)&&!expired(item,now);}
    static void renew(JSONObject item,int minutes)throws Exception {
        item.put("durationMinutes",minutes).put("expiresAt",minutes==0?0:System.currentTimeMillis()+minutes*60_000L)
            .put("missingSince",0).put("missingChecks",0).put("pauseReason","");
    }
    static String durationLabel(int minutes){return minutes==0?"期限なし":ThreadWatch.intervalLabel(minutes);}
    static String status(JSONObject item) {
        if(expired(item,System.currentTimeMillis()))return "停止：期限切れ";
        if(item.optBoolean("paused",false)){
            String reason=item.optString("pauseReason");
            return "停止："+(reason.equals("missing")?"dat落ち確認":reason.equals("manual")?"手動":reason.equals("expired")?"期限切れ":"返信通知後");
        }
        long end=item.optLong("expiresAt",0);
        return "監視中・"+(end==0?"期限なし":android.text.format.DateFormat.format("yyyy/MM/dd HH:mm",end)+"まで");
    }
    static void durationButton(LinearLayout box,Activity a,int[] value){
        Button button=new Button(a);button.setAllCaps(false);box.addView(button);
        Runnable label=()->button.setText("監視期限："+durationLabel(value[0]));label.run();
        int[] choices={60,120,180,360,1440,4320,10080,43200,0};
        String[] labels=new String[choices.length+1];for(int i=0;i<choices.length;i++)labels[i]=durationLabel(choices[i]);labels[choices.length]="任意の時間を指定";
        button.setOnClickListener(v->new HaiagaruDialog.Builder(a).setTitle("登録・再開からの監視期限")
            .setItems(labels,(d,w)->{
                if(w<choices.length){value[0]=choices[w];label.run();return;}
                EditText hours=new EditText(a);hours.setHint("時間数（例：12）");hours.setInputType(InputType.TYPE_CLASS_NUMBER);hours.setText(value[0]>0?Integer.toString(Math.max(1,value[0]/60)):"");
                new HaiagaruDialog.Builder(a).setTitle("監視期限を任意指定（時間）").setView(hours)
                    .setPositiveButton("設定",(dialog,which)->{try{
                        long parsed=Long.parseLong(hours.getText().toString().trim());if(parsed<1||parsed>8760)throw new NumberFormatException();
                        value[0]=(int)(parsed*60);label.run();
                    }catch(NumberFormatException invalid){Toast.makeText(a,"1～8760時間で入力してください",Toast.LENGTH_LONG).show();}})
                    .setNegativeButton("キャンセル",null).show();
            }).setNegativeButton("キャンセル",null).show());
    }
    static void addButton(LinearLayout box,Activity a){
        Button button=new Button(a);button.setText("通知の監視スレ一覧・停止・再開");box.addView(button);
        button.setOnClickListener(v->show(a));
    }
    static void show(Activity a){
        List<String> urls=new ArrayList<>();List<String> labels=new ArrayList<>();
        for(String url:new TreeSet<>(ThreadWatch.prefs(a).getAll().keySet()))try{
            if(ThreadWatchRules.target(url)==null)continue;
            JSONObject item=new JSONObject(ThreadWatch.prefs(a).getString(url,"{}"));urls.add(url);
            labels.add(item.optString("title",url)+"\n"+status(item)+"\n"+url);
        }catch(Exception ignored){}
        new HaiagaruDialog.Builder(a).setTitle("通知の監視スレ（"+urls.size()+"件）")
            .setMessage("スレを選ぶと個別設定・再開・解除ができます。停止したスレの登録は残ります。")
            .setItems(labels.toArray(new String[0]),(d,w)->actions(a,urls.get(w)))
            .setNegativeButton("閉じる",null).show();
    }
    private static void actions(Activity a,String url){
        new HaiagaruDialog.Builder(a).setTitle("監視スレの操作")
            .setItems(new String[]{"個別設定・監視を再開","監視を停止","登録を解除"},(d,w)->{
                if(w==0){ThreadWatch.show(a,ThreadWatchRules.target(url));return;}
                synchronized(ThreadWatch.LOCK){try{
                    if(!ThreadWatch.prefs(a).contains(url))return;
                    if(w==2)ThreadWatch.prefs(a).edit().remove(url).commit();
                    else {JSONObject item=new JSONObject(ThreadWatch.prefs(a).getString(url,"{}"));
                        item.put("paused",true).put("pauseReason","manual").put("token",UUID.randomUUID().toString());
                        ThreadWatch.prefs(a).edit().putString(url,item.toString()).commit();}
                }catch(Exception ignored){}}
                ThreadWatch.schedule(a);show(a);
            }).setNegativeButton("戻る",(d,w)->show(a)).show();
    }
    private ThreadWatchManagement(){}
}
