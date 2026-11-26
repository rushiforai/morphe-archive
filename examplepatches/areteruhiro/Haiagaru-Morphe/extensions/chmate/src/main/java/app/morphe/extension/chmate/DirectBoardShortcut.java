package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

public final class DirectBoardShortcut {
    public static final int ACTION = 0x7e484a32;
    static final int COUNT = 8;
    static String key(int slot) { if(slot<0||slot>=COUNT) throw new IllegalArgumentException("ボタン番号が範囲外です"); return slot==0?KEY:KEY+slot; }
    static String resource(int slot) { return slot==0?"haiagaru_direct_board":"haiagaru_direct_board_"+(slot+1); }
    static boolean handles(int action) { return action>=ACTION&&action<ACTION+COUNT; }
    static final String KEY = "directBoardToolbarTarget";

    static String defaultName(String address) {
        android.net.Uri uri=android.net.Uri.parse(address);
        String host=uri.getHost();
        if(host==null)return address;
        host=host.toLowerCase(java.util.Locale.ROOT);
        if(host.equals("kenmo.org")||host.equals("00c.org"))return "オルグ";
        if(host.equals("bbs.eddibb.cc")||host.equals("bbs.eddibb.net")||host.equals("bbs.eddibb.org"))return "エッヂ";
        return address;
    }

    static String displayName(BoardUrlPicker.Entry entry) {
        return entry.name.isEmpty()||entry.name.equals(entry.url)?defaultName(entry.url):entry.name;
    }

    private static volatile int[] textIds;
    private static String label(Context context,int id) {
        int[] ids=textIds;
        if(ids==null){
            ids=new int[COUNT];
            for(int i=0;i<COUNT;i++)ids[i]=context.getResources().getIdentifier(resource(i),"string",context.getPackageName());
            textIds=ids;
        }
        for(int i=0;i<COUNT;i++)if(id!=0&&ids[i]==id){
            BoardUrlPicker.Entry entry=target(context,i);
            return entry==null?null:displayName(entry);
        }
        return null;
    }
    public static String toolbarText(Context context,int id) {
        String value=label(context,id);return value==null?context.getString(id):value;
    }
    public static CharSequence toolbarCharSequence(Context context,int id) {
        String value=label(context,id);return value==null?context.getText(id):value;
    }

    static boolean validSaved(String value) {
        if (value.isEmpty()) return true;
        try {
            JSONObject row = new JSONObject(value);
            BoardUrlPicker.manualEntry(row.getString("name"), row.getString("url"), true);
            return true;
        } catch (Exception invalid) { return false; }
    }

    static BoardUrlPicker.Entry target(Context context) { return target(context,0); }
    static BoardUrlPicker.Entry target(Context context, int slot) {
        try {
            JSONObject row = new JSONObject(FeatureSwitches.prefs(context).getString(key(slot), ""));
            return BoardUrlPicker.manualEntry(row.getString("name"), row.getString("url"), true);
        } catch (Exception unset) { return null; }
    }

    static void save(Context context, String name, String url) throws Exception { save(context,0,name,url); }
    static void save(Context context, int slot, String name, String url) throws Exception {
        BoardUrlPicker.Entry selected = BoardUrlPicker.manualEntry(name, url, true);
        selected=BoardUrlPicker.manualEntry(displayName(selected),selected.url,true);
        List<BoardUrlPicker.Entry> entries = new ArrayList<>(BoardUrlPicker.custom(context));
        boolean registered = false;
        for (BoardUrlPicker.Entry entry : entries) if (entry.url.equals(selected.url)) registered = true;
        if (!registered) { entries.add(selected); BoardUrlPicker.store(context, entries); }
        String value = new JSONObject().put("name", selected.name).put("url", selected.url).toString();
        FeatureSwitches.prefs(context).edit().putString(key(slot), value).apply();
    }

    static Intent destination(Context context) { return destination(context,0); }
    static Intent destination(Context context, int slot) {
        BoardUrlPicker.Entry selected = target(context,slot);
        return selected == null ? null : BoardUrlPicker.destination(context, selected.url, false);
    }

    public static void open(Activity activity) { open(activity,0); }
    public static void open(Activity activity, int slot) {
        if (activity == null || activity.isFinishing()) return;
        Intent intent = destination(activity,slot);
        if (intent == null) { configure(activity,slot); return; }
        try { activity.startActivity(intent); }
        catch (Exception unavailable) { Toast.makeText(activity, "登録した板を開けませんでした", Toast.LENGTH_LONG).show(); }
    }

    static void addSettings(LinearLayout root, Activity activity) {
        Button configure = new Button(activity);
        configure.setText("直接移動ボタンの移動先を設定（8個）");
        configure.setOnClickListener(view -> configure(activity));
        root.addView(configure);
        TextView help = new TextView(activity);
        help.setText("最大8個のボタンに別々の移動先を登録できます。移動先を一度登録し、ChMateのツールバーカスタマイズで「登録板へ直接移動」を配置してください。HOME・スレ内のどちらでも、一覧や確認画面を挟まず1タップでその板を開きます。未設定時だけ移動先の設定を開きます。ボタンの表示／非表示と位置はChMate標準のツールバー設定で変更できます。移動先の設定だけでは通信しません。各番号のアイコンは「ツールバーのアイコン画像」から個別に変更できます。");
        root.addView(help);
    }

    static void configure(Activity activity) {
        String[] labels=new String[COUNT];
        for(int i=0;i<COUNT;i++){BoardUrlPicker.Entry entry=target(activity,i);labels[i]="登録板へ直接移動 "+(i+1)+"："+(entry==null?"未登録":displayName(entry));}
        new HaiagaruDialog.Builder(activity).setTitle("直接移動ボタンを選択").setItems(labels,(d,i)->configure(activity,i)).setNegativeButton("閉じる",null).show();
    }

    static void configure(Activity activity, int slot) {
        if (activity == null || activity.isFinishing()) return;
        List<BoardUrlPicker.Entry> boards = new ArrayList<>();
        for (BoardUrlPicker.Entry entry : BoardUrlPicker.custom(activity)) if (entry.board) boards.add(entry);
        String[] names = new String[boards.size() + 1];
        for (int index = 0; index < boards.size(); index++) names[index] = boards.get(index).name;
        names[boards.size()] = "板名・板URLを入力して登録…";
        BoardUrlPicker.Entry selected = target(activity,slot);
        new HaiagaruDialog.Builder(activity).setTitle(selected == null ? "直接開く板を登録" : "直接開く板：" + selected.name)
            .setItems(names, (dialog, index) -> {
                if (index == boards.size()) { edit(activity,slot); return; }
                BoardUrlPicker.Entry entry = boards.get(index);
                try { save(activity,slot, entry.name, entry.url); Toast.makeText(activity, "移動先を登録しました", Toast.LENGTH_SHORT).show(); }
                catch (Exception invalid) { Toast.makeText(activity, invalid.getMessage(), Toast.LENGTH_LONG).show(); }
            }).setNeutralButton("移動先を解除", (dialog, which) -> FeatureSwitches.prefs(activity).edit().remove(key(slot)).apply())
            .setNegativeButton("閉じる", null).show();
    }

    private static void edit(Activity activity, int slot) {
        LinearLayout form = new LinearLayout(activity); form.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(16 * activity.getResources().getDisplayMetrics().density); form.setPadding(padding, padding, padding, padding);
        EditText name = new EditText(activity); name.setSingleLine(true); name.setHint("板名（省略可）"); form.addView(name);
        EditText url = new EditText(activity); url.setSingleLine(true); url.setHint("https://…/ 板のトップURL"); url.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_VARIATION_URI); form.addView(url);
        BoardUrlPicker.Entry selected = target(activity,slot);
        if (selected != null) { name.setText(selected.name); url.setText(selected.url); }
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("直接開く板を登録").setView(form)
            .setPositiveButton("登録", null).setNegativeButton("キャンセル", null).show();
        dialog.getButton(-1).setOnClickListener(view -> {
            try { save(activity,slot, name.getText().toString(), url.getText().toString()); dialog.dismiss(); }
            catch (Exception invalid) { url.setError(invalid.getMessage()); }
        });
    }

    private DirectBoardShortcut() { }
}
