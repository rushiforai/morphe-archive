package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.widget.*;
import org.json.*;
import java.util.*;

/** Hash-keyed local overlays; feed/cache/submission rows are always kept in their original form. */
final class SharedNgLocalEdits {
    static final String KEY="localEditsV1";
    private static volatile Map<String,Edit> edits=Collections.emptyMap();
    static final class Edit {
        final String board,kind,value;final boolean regex;
        Edit(String board,String kind,String value,boolean regex){this.board=board;this.kind=kind;this.value=value;this.regex=regex;}
        SharedNgRules.Rule apply(SharedNgRules.Rule source){
            if(!board.equals(source.board)||!kind.equals(source.kind))return source;
            try{return source.localValue(value,regex);}catch(IllegalArgumentException invalid){return source;}
        }
    }
    static Map<String,Edit> snapshot(){return edits;}
    static Map<String,Edit> decode(String raw){
        Map<String,Edit> out=new HashMap<>();if(raw==null||raw.length()>2_500_000)return Collections.emptyMap();
        try{JSONObject data=new JSONObject(raw);if(data.length()>1000)return Collections.emptyMap();Iterator<String> ids=data.keys();while(ids.hasNext()){
            String id=ids.next();try{JSONObject row=data.getJSONObject(id);String value=row.getString("value");
                if(id.matches("[a-f0-9]{64}")&&!value.isEmpty()&&value.length()<=2000)out.put(id,new Edit(row.getString("board"),row.getString("kind"),value,row.getBoolean("regex")));
            }catch(JSONException invalid){/* A bad entry must not discard the other edits. */}
        }}catch(JSONException invalid){return Collections.emptyMap();}return Collections.unmodifiableMap(out);
    }
    static void reload(SharedPreferences prefs){edits=decode(prefs.getString(KEY,"{}"));}
    static List<SharedNgRules.Rule> apply(List<SharedNgRules.Rule> source,Map<String,Edit> snapshot){
        if(snapshot.isEmpty())return source;List<SharedNgRules.Rule> out=new ArrayList<>(source.size());
        for(SharedNgRules.Rule rule:source){Edit edit=snapshot.get(rule.id);out.add(edit==null?rule:edit.apply(rule));}return Collections.unmodifiableList(out);
    }
    static synchronized void save(SharedPreferences prefs,SharedNgRules.Rule source,String value,boolean regex)throws JSONException{
        source.localValue(value,regex);Map<String,Edit> next=new HashMap<>(decode(prefs.getString(KEY,"{}")));
        if(!next.containsKey(source.id)&&next.size()>=1000)throw new IllegalArgumentException("端末内の編集は1000件までです");
        next.put(source.id,new Edit(source.board,source.kind,value,regex));write(prefs,next);
    }
    static synchronized void reset(SharedPreferences prefs,String id)throws JSONException{Map<String,Edit> next=new HashMap<>(decode(prefs.getString(KEY,"{}")));next.remove(id);write(prefs,next);}
    private static void write(SharedPreferences prefs,Map<String,Edit> next)throws JSONException{
        JSONObject data=new JSONObject();for(Map.Entry<String,Edit> entry:next.entrySet()){Edit e=entry.getValue();data.put(entry.getKey(),new JSONObject().put("board",e.board).put("kind",e.kind).put("value",e.value).put("regex",e.regex));}
        if(!prefs.edit().putString(KEY,data.toString()).commit())throw new IllegalStateException("編集内容を保存できませんでした");
    }
    static AlertDialog show(Activity activity,SharedNgRules.Rule original,Runnable changed){
        SharedNgRules.Rule current=apply(Collections.singletonList(original),snapshot()).get(0);
        LinearLayout box=new LinearLayout(activity);box.setOrientation(LinearLayout.VERTICAL);
        EditText value=new EditText(activity);value.setMinLines(3);value.setMaxLines(10);value.setText(current.value);value.setContentDescription("この端末で使う共有NG条件");box.addView(value);
        CheckBox regex=new CheckBox(activity);regex.setText("正規表現");regex.setChecked(current.regex);box.addView(regex);
        TextView help=new TextView(activity);help.setText("対象："+SharedNgRules.boardLabel(original.board)+" / "+original.kind+"\nこの端末だけに保存します。同期後も保持され、入力した条件どおりに適用します。報告数・配信停止・レポーター除外は引き続き有効です。\n変更後はスレを開き直してください。");box.addView(help);
        ScrollView scroll=new ScrollView(activity);scroll.addView(box);
        AlertDialog dialog=new AlertDialog.Builder(activity).setTitle("共有NGをこの端末で編集").setView(scroll)
                .setPositiveButton("保存",null).setNegativeButton("キャンセル",null).setNeutralButton("配信条件に戻す",null).create();
        dialog.setOnShowListener(ignored->{
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{try{save(SharedNg.prefs(),original,value.getText().toString(),regex.isChecked());SharedNg.reload();changed.run();dialog.dismiss();Toast.makeText(activity,"端末内の編集を保存しました",Toast.LENGTH_SHORT).show();}catch(Exception error){value.setError("保存できません："+error.getMessage());}});
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(current.locallyEdited);
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v->{try{reset(SharedNg.prefs(),original.id);SharedNg.reload();changed.run();dialog.dismiss();}catch(Exception error){value.setError("変更できません："+error.getMessage());}});
        });dialog.show();return dialog;
    }
    private SharedNgLocalEdits(){}
}
