package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.app.Activity;
import android.app.AlertDialog;
import android.widget.*;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/** Opt-in thread-local visibility overlay; native NGID storage and response fields stay untouched. */
public final class RedIdAutoNg {
    static final String KEY = "autoNgRedIds";
    static final String EXCLUSIONS = "autoNgRedIdExclusions";
    private static volatile SharedPreferences preferences;
    private static final java.util.regex.Pattern EMPTY_ID=java.util.regex.Pattern.compile("[?？!！*＊\\-]+");
    private static String exclusionSource;
    private static Set<String> exclusionIds = java.util.Collections.emptySet();
    static final int MENU_EXCLUSION=0x7e484b02;
    private static final Map<android.view.MenuItem,String> MENU_IDS=new java.util.WeakHashMap<>();

    static void appendMenu(Object menuObject,Object response){
        if(!(menuObject instanceof android.view.Menu)||response==null||!ResponseMenuSettings.visible(MENU_EXCLUSION))return;
        try{
            String key=response.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError")?"h":
                    response.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"j":"g";
            String id=literalId((String)ResponseArchiveEntry.field(response,key));if(id==null)return;
            android.view.Menu menu=(android.view.Menu)menuObject;if(menu.findItem(MENU_EXCLUSION)!=null)return;
            android.view.MenuItem item=menu.add(android.view.Menu.NONE,MENU_EXCLUSION,ResponseMenuSettings.order(MENU_EXCLUSION,menu.size()),"自動NGの除外IDに追加");
            item.setIcon(android.R.drawable.ic_menu_add);
            MENU_IDS.put(item,id);item.setOnMenuItemClickListener(RedIdAutoNg::handleMenu);
        }catch(ReflectiveOperationException|IllegalArgumentException ignored){}
    }
    static boolean handleMenu(Object value){
        if(!(value instanceof android.view.MenuItem)||((android.view.MenuItem)value).getItemId()!=MENU_EXCLUSION)return false;
        registerExclusion(Haiagaru.toolbarActivity(null),MENU_IDS.get(value));return true;
    }
    /** The native ID menu provides the exact tapped ID; no lookup in neighbouring rows. */
    public static void appendIdSheet(Object builder,Object board,String raw){
        if(!ResponseMenuSettings.visible(MENU_EXCLUSION))return;
        String id=literalId(raw);if(id==null)return;
        try{ResponseArchive.appendSheetAction(builder,"自動NGの除外IDに追加",android.R.drawable.ic_menu_add,
                ()->registerExclusion(Haiagaru.toolbarActivity(null),id));}
        catch(Exception ignored){}
    }
    private static String literalId(String raw){
        try{Set<String> ids=RedIdExclusions.parse(raw);return ids.size()==1?ids.iterator().next():null;}
        catch(IllegalArgumentException invalid){return null;}
    }
    private static void registerExclusion(Activity activity,String raw){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||raw==null)return;
        try{
            String id=literalId(raw);if(id==null)return;
            Set<String> ids=new java.util.LinkedHashSet<>(RedIdExclusions.parse(prefs(activity).getString(EXCLUSIONS,"")));
            if(!ids.add(id)){Toast.makeText(activity,"このIDは自動NGの除外リストに登録済みです",Toast.LENGTH_SHORT).show();return;}
            String updated=android.text.TextUtils.join("\n",ids);RedIdExclusions.parse(updated);
            if(!prefs(activity).edit().putString(EXCLUSIONS,updated).commit())throw new IllegalStateException("除外IDを保存できませんでした");
            Toast.makeText(activity,"自動NGの除外IDに追加しました。スレを開き直すと反映されます",Toast.LENGTH_LONG).show();
        }catch(IllegalArgumentException|IllegalStateException error){Toast.makeText(activity,error.getMessage(),Toast.LENGTH_LONG).show();}
    }

    private static SharedPreferences prefs(Context context) {
        SharedPreferences value=preferences;
        if(value==null)preferences=value=context.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        return value;
    }
    private static synchronized boolean excluded(Context context, String id) {
        String source = prefs(context).getString(EXCLUSIONS, "");
        if (!Objects.equals(source, exclusionSource)) {
            try { exclusionIds = RedIdExclusions.parse(source); exclusionSource = source; }
            catch (IllegalArgumentException invalid) { return true; }
        }
        return exclusionIds.contains(id);
    }
    static void addExclusionsButton(LinearLayout parent, Activity activity) {
        Button button = new Button(activity);
        Runnable update = () -> {
            try { button.setText("自動NGから除外するID（" + RedIdExclusions.parse(prefs(activity).getString(EXCLUSIONS, "")).size() + "件）"); }
            catch (IllegalArgumentException invalid) { button.setText("自動NGから除外するID（入力を確認）"); }
        };
        update.run();
        button.setOnClickListener(v -> showExclusions(activity, update));
        parent.addView(button);
    }
    public static void showExclusions(Activity activity) { showExclusions(activity, () -> {}); }
    private static void showExclusions(Activity activity, Runnable update) {
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
        LinearLayout form = new LinearLayout(activity); form.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        form.setPadding(padding, padding, padding, padding);
        TextView help = new TextView(activity);
        help.setText("除外するIDを1行に1件入力してください（ID:付きも可、最大500件）。除外リストは全スレ共通で、IDの完全一致に適用します。IDメニューの「自動NGの除外IDに追加」からも登録できます。行を消すと除外を解除します。保存後はスレを開き直してください。\n\nこの除外は赤いIDの自動非表示に適用されます。通常のNG設定による非表示は別に判定します。");
        form.addView(help);
        EditText input = new EditText(activity); input.setMinLines(4); input.setMaxLines(10);
        input.setGravity(android.view.Gravity.TOP | android.view.Gravity.START);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE | android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setText(prefs(activity).getString(EXCLUSIONS, "")); form.addView(input);
        ScrollView scroll = new ScrollView(activity); scroll.addView(form);
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("赤いIDの自動NG：除外リスト")
                .setView(scroll).setNegativeButton("キャンセル", null).setPositiveButton("保存", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(save -> {
            try {
                Set<String> ids = RedIdExclusions.parse(input.getText().toString());
                prefs(activity).edit().putString(EXCLUSIONS, android.text.TextUtils.join("\n", ids)).apply();
                update.run(); dialog.dismiss();
            } catch (IllegalArgumentException invalid) { input.setError(invalid.getMessage()); }
        }));
        dialog.show();
    }

    // All three supported native ID palettes have eight entries. Native renderers use
    // min(postCount - 1, palette.length - 1), so the final frequent-ID level starts at 8.
    static final int FREQUENT_POSTS = 8;

    static int merge(Object response,int original) {
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null||response==null||!prefs(context).getBoolean(KEY,false))return original;
        return merge(response,original,context);
    }
    private static int merge(Object response,int original,Context context) {
        if(response==null)return original;
        try {
            String idField, groupField, countField;
            switch (response.getClass().getName()) {
                case "o.processAdDisplayErrorPostbackForUserError": idField="h"; groupField="g"; countField="e"; break;
                case "o.BouncyCastleSocketAdapterCompanion": idField="j"; groupField="h"; countField="e"; break;
                case "o.KeJ11": idField="g"; groupField="m"; countField="b"; break;
                default: return original;
            }
            Object group = ResponseArchiveEntry.field(response, groupField);
            if (group == null || ((Number)ResponseArchiveEntry.field(group, countField)).intValue() < FREQUENT_POSTS) return original;
            Object raw = ResponseArchiveEntry.field(response, idField);
            String id = raw == null ? "" : raw.toString().trim();
            if (id.startsWith("ID:")) id = id.substring(3);
            if (id.isEmpty() || EMPTY_ID.matcher(id).matches() || excluded(context, id)) return original;
            return original | HiddenIdRules.HIDDEN_ID_FLAGS;
        } catch (Exception unsupported) { return original; }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    static Map modernFlags(Object source, Map original) {
        Context context=Haiagaru.applicationContextForExtension();
        if(original==null||context==null||!prefs(context).getBoolean(KEY,false))return original;
        try {
            List<?> rows = PopularReplies.fullList(source);
            Map result = null;
            for (Object row : rows) {
                int extra = merge(row, 0, context);
                if (extra == 0) continue;
                int number = ((Number)ResponseArchiveEntry.field(row, "o")).intValue();
                if (number <= 0) continue;
                if (result == null) result = new LinkedHashMap(original);
                Object old = result.get(number);
                result.put(number, (old instanceof Number ? ((Number)old).intValue() : 0) | extra);
            }
            return result == null ? original : result;
        } catch (Exception unsupported) { return original; }
    }
    private RedIdAutoNg() { }
}
