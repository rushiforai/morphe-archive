package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.widget.*;
import org.json.*;
import java.util.Map;

/** Bounded local history shared by versions with and without native event inboxes. */
public final class PatrolErrorHistory {
    private static final String PREFS="haiagaru_patrol_errors";
    private static volatile Context context;
    public static void initialize(Context app){context=app.getApplicationContext();}
    static synchronized void save(Map<String,String> errors){
        Context app=context;if(app==null||errors==null||errors.isEmpty())return;
        try{
            JSONArray old=new JSONArray(app.getSharedPreferences(PREFS,0).getString("entries","[]")),all=new JSONArray();
            long now=System.currentTimeMillis();
            for(Map.Entry<String,String> entry:errors.entrySet()){
                if(all.length()>=100)break;
                all.put(new JSONObject().put("time",now).put("url",entry.getKey()).put("type",entry.getValue()));
            }
            for(int i=0;i<old.length()&&all.length()<100;i++)all.put(old.getJSONObject(i));
            app.getSharedPreferences(PREFS,0).edit().putString("entries",all.toString()).apply();
        }catch(JSONException|RuntimeException ignored){}
    }
    static void addSettings(LinearLayout layout,Activity activity){
        Button button=new Button(activity);button.setText("巡回エラーログ（板URL）");
        button.setOnClickListener(v->show(activity));layout.addView(button);
    }
    private static void show(Activity activity){
        StringBuilder text=new StringBuilder();
        try{
            JSONArray entries=new JSONArray(activity.getSharedPreferences(PREFS,0).getString("entries","[]"));
            java.text.DateFormat dates=new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss",java.util.Locale.getDefault());
            for(int i=0;i<entries.length();i++){
                JSONObject e=entries.getJSONObject(i);
                text.append(dates.format(new java.util.Date(e.getLong("time")))).append("  ").append(e.getString("type"))
                    .append('\n').append(e.getString("url")).append("\n\n");
            }
        }catch(JSONException|RuntimeException ignored){}
        if(text.length()==0)text.append("記録された巡回エラーはありません。");
        TextView body=new TextView(activity);body.setText(text);body.setTextIsSelectable(true);
        int pad=(int)(16*activity.getResources().getDisplayMetrics().density);body.setPadding(pad,pad,pad,pad);
        ScrollView scroll=new ScrollView(activity);scroll.addView(body);
        new HaiagaruDialog.Builder(activity).setTitle("巡回エラーログ（最新100件・端末内のみ）").setView(scroll)
            .setPositiveButton("閉じる",null).setNeutralButton("履歴を消去",(d,w)->{
                synchronized(PatrolErrorHistory.class){activity.getSharedPreferences(PREFS,0).edit().remove("entries").apply();}
            }).show();
    }
    private PatrolErrorHistory(){}
}
