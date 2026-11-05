package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.*;
import java.util.*;

/** Local, reversible exclusions of anonymous public contributor keys, including future reports. */
final class SharedNgReporterBlocks {
    static final String PREFS="haiagaru.shared-ng-reporters";
    static final String ACTION="このレポーターをすべて除外（今後も）";
    private static SharedPreferences prefs(Activity activity){return activity.getSharedPreferences(PREFS,0);}
    static String label(String id){return "レポーター "+id.substring(0,12)+"…"+id.substring(id.length()-8);}
    static void forRule(Activity activity,SharedNgRules.Rule rule){
        if(rule.contributors.isEmpty()){
            Toast.makeText(activity,"報告者情報がありません。共有NGを同期してから確認してください",Toast.LENGTH_LONG).show();return;
        }
        if(rule.contributors.size()==1){confirm(activity,rule.contributors.get(0));return;}
        String[] labels=new String[rule.contributors.size()];for(int i=0;i<labels.length;i++)labels[i]=label(rule.contributors.get(i));
        new HaiagaruDialog.Builder(activity).setTitle("除外するレポーターを選択")
                .setItems(labels,(d,n)->confirm(activity,rule.contributors.get(n))).setNegativeButton("戻る",null).show();
    }
    private static void confirm(Activity activity,String id){
        new HaiagaruDialog.Builder(activity).setTitle(ACTION)
                .setMessage(label(id)+"\n\nこの端末で、このレポーターの現在・今後の報告を除外します。同じ条件への他のレポーターの報告は残ります。設定から解除できます。保存後はスレを開き直してください。")
                .setPositiveButton("除外する",(d,w)->{
                    Set<String> ignored=new HashSet<>(prefs(activity).getStringSet("ignored",Collections.emptySet()));ignored.add(id);
                    prefs(activity).edit().putStringSet("ignored",ignored).apply();SharedNg.reload();
                    Toast.makeText(activity,"このレポーターの現在・今後の報告を除外しました",Toast.LENGTH_LONG).show();
                }).setNegativeButton("キャンセル",null).show();
    }
    static void show(Activity activity,List<SharedNgRules.Rule> source){
        Set<String> ignored=new HashSet<>(prefs(activity).getStringSet("ignored",Collections.emptySet()));
        Map<String,Integer> counts=new TreeMap<>();for(SharedNgRules.Rule rule:source)for(String id:rule.contributors)counts.put(id,counts.getOrDefault(id,0)+1);
        for(String id:ignored)if(id.matches("[a-f0-9]{64}"))counts.putIfAbsent(id,0);
        LinearLayout box=new LinearLayout(activity);box.setOrientation(1);
        TextView help=new TextView(activity);help.setText("チェックしたレポーターの現在・今後の報告を、この端末で除外します。チェックを外して保存すると解除できます。報告者情報のない古い配信条件は対象外です。変更後はスレを開き直してください。");box.addView(help);
        EditText search=new EditText(activity);search.setSingleLine(true);search.setHint("レポーターIDで検索");box.addView(search);
        LinearLayout rows=new LinearLayout(activity);rows.setOrientation(1);box.addView(rows);
        Map<CheckBox,String> labels=new LinkedHashMap<>();
        for(Map.Entry<String,Integer> entry:counts.entrySet()){
            String id=entry.getKey();CheckBox row=new CheckBox(activity);row.setText(label(id)+" / "+entry.getValue()+"条件");row.setContentDescription("レポーター "+id);row.setChecked(ignored.contains(id));
            row.setOnCheckedChangeListener((button,checked)->{if(checked)ignored.add(id);else ignored.remove(id);});rows.addView(row);labels.put(row,id);
        }
        if(counts.isEmpty()){TextView empty=new TextView(activity);empty.setText("報告者情報がありません。共有NGを同期してください。");rows.addView(empty);}
        search.addTextChangedListener(new android.text.TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void afterTextChanged(android.text.Editable e){}public void onTextChanged(CharSequence s,int start,int before,int count){String query=s.toString().trim().toLowerCase(Locale.ROOT);for(Map.Entry<CheckBox,String> entry:labels.entrySet())entry.getKey().setVisibility(entry.getValue().contains(query)?android.view.View.VISIBLE:android.view.View.GONE);}});
        ScrollView scroll=new ScrollView(activity);scroll.addView(box);
        new HaiagaruDialog.Builder(activity).setTitle("除外するレポーター").setView(scroll).setPositiveButton("保存",(d,w)->{prefs(activity).edit().putStringSet("ignored",ignored).apply();SharedNg.reload();}).setNegativeButton("キャンセル",null).show();
    }
}
