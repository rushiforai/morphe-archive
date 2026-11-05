package app.morphe.extension.chmate;

import android.app.Activity;
import android.widget.*;

/** Stored with programmable-NG preferences, which are included in Haiagaru backup. */
final class NgPlainTextCacheSettings {
    static final String COUNT="plainTextCacheEntries",CAPACITY="plainTextCacheCharacters";
    static void add(LinearLayout root,Activity activity){
        Button button=new Button(activity);button.setText("NG判定用テキストの再利用設定");root.addView(button);
        button.setOnClickListener(v->show(activity));
    }
    private static void show(Activity activity){
        android.content.SharedPreferences prefs=activity.getSharedPreferences(ProgrammableNgController.PREFS,0);
        LinearLayout box=new LinearLayout(activity);box.setOrientation(1);
        TextView help=new TextView(activity);help.setText("HTMLから変換した本文・名前をメモリ内で再利用します。件数と容量の両方を上限にし、いずれかが0なら再利用しません。容量は入力と変換結果の合計文字数です（100万文字は文字データ約2MB＋管理領域）。大きくするほどメモリを使います。保存するとすぐ反映し、上限を下げた分は解放します。");box.addView(help);
        EditText count=number(box,activity,"最大件数",prefs.getInt(COUNT,512));
        EditText capacity=number(box,activity,"最大容量（文字数）",prefs.getInt(CAPACITY,1_000_000));
        Button defaults=new Button(activity);defaults.setText("初期値に戻す（保存で反映）");box.addView(defaults);
        defaults.setOnClickListener(v->{count.setText("512");capacity.setText("1000000");});
        Button save=new Button(activity);save.setText("保存");box.addView(save);
        ScrollView scroll=new ScrollView(activity);scroll.addView(box);
        android.app.Dialog dialog=new HaiagaruDialog.Builder(activity).setTitle("NG判定用テキストの再利用設定").setView(scroll).setNegativeButton("戻る",null).create();
        save.setOnClickListener(v->{
            Integer entries=read(count),characters=read(capacity);if(entries==null||characters==null)return;
            prefs.edit().putInt(COUNT,entries).putInt(CAPACITY,characters).apply();
            ProgrammableNgController.reload();dialog.dismiss();
        });
        dialog.show();
    }
    private static EditText number(LinearLayout box,Activity activity,String label,int value){
        TextView title=new TextView(activity);title.setText(label);box.addView(title);
        EditText input=new EditText(activity);input.setSingleLine(true);input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        input.setContentDescription(label);input.setText(Integer.toString(Math.max(0,value)));box.addView(input);return input;
    }
    private static Integer read(EditText input){
        try{int value=Integer.parseInt(input.getText().toString().trim());if(value>=0)return value;}catch(NumberFormatException invalid){}
        input.setError("0〜2147483647の整数を入力してください");return null;
    }
}
