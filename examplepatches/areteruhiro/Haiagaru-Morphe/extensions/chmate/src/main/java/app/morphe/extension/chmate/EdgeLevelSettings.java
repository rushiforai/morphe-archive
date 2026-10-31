package app.morphe.extension.chmate;
import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.*;
import java.util.*;

final class EdgeLevelSettings {
    static void add(LinearLayout parent,Activity a){Button b=new Button(a);b.setText("エッヂの公開レベルによる自動NG（開発中）");parent.addView(b);b.setOnClickListener(v->show(a));}
    static void show(Activity a){LinearLayout box=new LinearLayout(a);box.setOrientation(1);int p=(int)(16*a.getResources().getDisplayMetrics().density);box.setPadding(p,p,p,p);SharedPreferences prefs=EdgeLevelNg.config();
        TextView help=new TextView(a);help.setText("公開スレの名前欄で確認したエッヂのレベルだけを使用します。IDは掲示板・投稿日単位で照合し、不明なIDはNGにしません。通常NG登録・DATは変更しません。変更後はスレを開き直してください。");box.addView(help);
        toggle(box,a,"確認済みレベルが指定値以下のIDを非表示",EdgeLevelNg.OBSERVED,false);
        number(box,a,"確認済みレベルの閾値（この値以下をNG）","edgeLevelThreshold",5,0,9999);
        toggle(box,a,"レベル情報を自動同期","edgeLevelAutoSync",true);
        number(box,a,"同期間隔（分・15〜1440）","edgeLevelIntervalMinutes",30,15,1440);
        TextView source=new TextView(a);source.setText("クロール対象：\n"+EdgeLevelPolicy.SOURCE+"\nGAS側で取得をまとめます。");source.setTextIsSelectable(true);box.addView(source);
        Button exclusions=new Button(a);exclusions.setText("自動NGから除外するID");box.addView(exclusions);exclusions.setOnClickListener(v->{EditText input=new EditText(a);input.setMinLines(4);input.setText(android.text.TextUtils.join("\n",prefs.getStringSet("edgeLevelExceptions",Collections.emptySet())));new HaiagaruDialog.Builder(a).setTitle("エッヂレベルNGの除外ID（完全一致）").setView(input).setNegativeButton("戻る",null).setPositiveButton("保存",(d,w)->{Set<String> values=new HashSet<>();for(String line:input.getText().toString().split("\\s+")){String id=EdgeLevelPolicy.id(line);if(id!=null&&values.size()<500)values.add(id);}prefs.edit().putStringSet("edgeLevelExceptions",values).apply();}).show();});
        TextView state=new TextView(a);state.setText(EdgeLevelNg.status);box.addView(state);Button sync=new Button(a);sync.setText("レベル情報を今すぐ同期");box.addView(sync);sync.setOnClickListener(v->{EdgeLevelNg.schedule(true);state.setText("同期を開始しました。画面を開き直すと結果を表示します。");});
        ScrollView scroll=new ScrollView(a);scroll.addView(box);new HaiagaruDialog.Builder(a).setTitle("エッヂの公開レベル自動NG（開発中）").setView(scroll).setPositiveButton("閉じる",null).show();
    }
    private static void toggle(LinearLayout box,Activity a,String title,String key,boolean initial){Switch s=new Switch(a);s.setText(title);s.setChecked(EdgeLevelNg.config().getBoolean(key,initial));box.addView(s);s.setOnCheckedChangeListener((v,on)->{EdgeLevelNg.config().edit().putBoolean(key,on).apply();if(on)EdgeLevelNg.schedule(false);});}
    private static void number(LinearLayout box,Activity a,String title,String key,int initial,int min,int max){TextView label=new TextView(a);label.setText(title);box.addView(label);LinearLayout row=new LinearLayout(a);EditText text=new EditText(a);text.setSingleLine(true);text.setInputType(2);text.setText(Integer.toString(EdgeLevelNg.config().getInt(key,initial)));row.addView(text,new LinearLayout.LayoutParams(0,-2,1));Button save=new Button(a);save.setText("保存");row.addView(save);box.addView(row);save.setOnClickListener(v->{try{int n=Integer.parseInt(text.getText().toString());if(n<min||n>max)throw new IllegalArgumentException();EdgeLevelNg.config().edit().putInt(key,n).apply();}catch(Exception invalid){text.setError(min+"〜"+max+"で入力してください");}});}
    private EdgeLevelSettings(){}
}
