package e.e.a;
import android.app.*;import android.content.*;import android.preference.*;import android.view.*;import android.widget.*;import java.util.*;import java.lang.reflect.Method;import org.json.*;
public final class ContentFilter {
 private static final String KEY="nicoid_content_keywords",CHANNELS="nicoid_content_channels",STORE="nicoid_content_rules_v2";
 private static String tr(Context c,String j,String e,String z){return PanelUi.tr(c,j,e,z);}
 public static void settings(PreferenceActivity a){PreferenceGroup root=a.getPreferenceScreen();PreferenceCategory section=(PreferenceCategory)a.findPreference("nicoid_content_filter");if(section==null){section=new PreferenceCategory(a);section.setKey("nicoid_content_filter");int after=root.getPreferenceCount();for(int i=0;i<root.getPreferenceCount();i++){Preference p=root.getPreference(i);p.setOrder(i*2);if("comment".equals(p.getKey()))after=i+1;}section.setOrder(after*2-1);root.addPreference(section);}section.setTitle(tr(a,"その他","Other","其他"));if(a.findPreference("nicoid_filter_list")==null){Preference p=new Preference(a);p.setKey("nicoid_filter_list");p.setTitle(tr(a,"コンテンツフィルター","Content filter","內容篩選"));p.setSummary(stored(a).length()+tr(a,"件：登録した条件に一致する動画を非表示"," rules: hide videos matching registered conditions","項：隱藏符合已登錄條件的影片"));p.setOnPreferenceClickListener(v->{list(a);return true;});section.addPreference(p);}}
 private static JSONArray stored(Context c){SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(c);if(p.contains(STORE)){try{return new JSONArray(p.getString(STORE,"[]"));}catch(Exception e){return new JSONArray();}}JSONArray a=new JSONArray();try{for(int cat=0;cat<2;cat++)for(String s:ContentFilterRules.keywords(p.getString(cat==0?KEY:CHANNELS,"")))a.put(new JSONObject().put("category",cat).put("value",s).put("mode","partial").put("enabled",true).put("date",0));}catch(Exception e){}save(c,a);return a;}
 private static void save(Context c,JSONArray a){PreferenceManager.getDefaultSharedPreferences(c).edit().putString(STORE,a.toString()).apply();compiled=null;}
 public static final class Rules {final String snapshot;final ArrayList<ContentFilterRules.Rule> words=new ArrayList<>(),names=new ArrayList<>();Rules(String s){snapshot=s;try{JSONArray a=new JSONArray(s);for(int i=0;i<a.length();i++){JSONObject o=a.optJSONObject(i);if(o==null||o.optString("value").isEmpty())continue;try{(o.optInt("category")==0?words:names).add(new ContentFilterRules.Rule(o.optString("value"),o.optString("mode","partial"),o.optBoolean("enabled",true)));}catch(java.util.regex.PatternSyntaxException ignored){}}}catch(Exception ignored){}}Rules(String a,String b){this(legacy(a,b));}static String legacy(String a,String b){JSONArray rows=new JSONArray();try{for(int cat=0;cat<2;cat++)for(String s:ContentFilterRules.keywords(cat==0?a:b))rows.put(new JSONObject().put("category",cat).put("value",s));}catch(Exception ignored){}return rows.toString();}public boolean blocked(String title,String channel){for(ContentFilterRules.Rule r:words)if(r.matches(title))return true;for(ContentFilterRules.Rule r:names)if(r.matches(channel))return true;return false;}boolean empty(){return words.isEmpty()&&names.isEmpty();}}
 public static void confirmOwner(Context host,String owner){if(owner==null||owner.trim().isEmpty()){Toast.makeText(host,tr(host,"投稿者名を取得できませんでした","Uploader name unavailable","無法取得投稿者名稱"),0).show();return;}Context c=PlaybackSession.dialogContext(host);AlertDialog d=new AlertDialog.Builder(c).setTitle(tr(c,"投稿者をNGに追加しますか？","Block this uploader?","封鎖此投稿者？")).setMessage(owner+"\n"+tr(c,"投稿者・チャンネル名に完全一致で登録します","Add an exact uploader/channel-name rule","新增完全相符的投稿者／頻道名稱規則")).setPositiveButton(tr(c,"追加","Add","新增"),(dialog,w)->{JSONArray rows=stored(host);try{boolean found=false;for(int n=0;n<rows.length();n++){JSONObject o=rows.optJSONObject(n);if(o!=null&&o.optInt("category")==1&&owner.equals(o.optString("value"))&&"exact".equals(o.optString("mode"))){o.put("enabled",true);found=true;}}if(!found)rows.put(new JSONObject().put("category",1).put("value",owner).put("mode","exact").put("enabled",true).put("date",System.currentTimeMillis()));save(host,rows);Toast.makeText(host,tr(host,"NGリストに追加しました","Added to NG list","已加入 NG 清單"),0).show();}catch(JSONException e){Toast.makeText(host,tr(host,"保存に失敗しました","Unable to save","儲存失敗"),1).show();}}).setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null).create();PlaybackSession.showDialog(d);}
 private static volatile Rules compiled;
 public static Rules rules(Context c){SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(c);String s=p.contains(STORE)?p.getString(STORE,"[]"):stored(c).toString();Rules r=compiled;if(r!=null&&r.snapshot.equals(s))return r;return compiled=new Rules(s);}
 public static boolean blocked(Context c,String title){return blocked(c,title,null);}public static boolean blocked(Context c,String title,String channel){return rules(c).blocked(title,channel);}
 private static String category(Context c,int n){return n==0?tr(c,"動画タイトル","Video titles","影片標題"):tr(c,"投稿者・チャンネル名","Uploaders / channels","投稿者／頻道名稱");}
 private static String mode(Context c,String s){return s.equals("regex")?tr(c,"正規表現","Regular expression","正規表示式"):s.equals("exact")?tr(c,"完全一致","Exact match","完全相符"):tr(c,"部分一致","Partial match","部分相符");}
 private static void list(PreferenceActivity a){Context c=PlaybackSession.dialogContext(a);JSONArray rows=stored(a);LinearLayout box=PanelUi.column(c);box.setPadding(PanelUi.dp(c,12),0,PanelUi.dp(c,12),0);LinearLayout tabs=new LinearLayout(c);Button[] tab={PanelUi.button(c,category(c,0)),PanelUi.button(c,category(c,1))};for(Button b:tab)tabs.addView(b,new LinearLayout.LayoutParams(0,-2,1));box.addView(tabs);ScrollView scroll=new ScrollView(c);LinearLayout items=PanelUi.column(c);scroll.addView(items);box.addView(scroll,new LinearLayout.LayoutParams(-1,Math.min(PanelUi.dp(c,320),c.getResources().getDisplayMetrics().heightPixels/2)));LinearLayout actions=new LinearLayout(c);Button add=PanelUi.button(c,tr(c,"追加","Add","新增")),delete=PanelUi.button(c,tr(c,"選択した項目を削除","Delete selected","刪除所選項目")),cancel=PanelUi.button(c,tr(c,"選択解除","Clear selection","取消選取"));actions.addView(add,new LinearLayout.LayoutParams(0,-2,1));actions.addView(delete,new LinearLayout.LayoutParams(0,-2,1));actions.addView(cancel,new LinearLayout.LayoutParams(0,-2,1));box.addView(actions);int[] cat={0};Set<Integer> selected=new HashSet<>();boolean[] choosing={false};Runnable[] refresh={null};AlertDialog dialog=new AlertDialog.Builder(c).setTitle(tr(c,"NGリスト","NG list","NG 清單")).setView(box).setNegativeButton(tr(c,"閉じる","Close","關閉"),null).create();
 refresh[0]=()->{items.removeAllViews();for(int i=0;i<2;i++){ThemeChoice.button(tab[i]);tab[i].setTextColor(PanelUi.ink(c));tab[i].setBackgroundTintList(android.content.res.ColorStateList.valueOf(i==cat[0]?(ThemeChoice.isNight(c)?0xff444851:0xffd5d9df):(ThemeChoice.isNight(c)?0xff292c32:0xffeeeeee)));}add.setVisibility(choosing[0]?View.GONE:View.VISIBLE);delete.setVisibility(choosing[0]?View.VISIBLE:View.GONE);cancel.setVisibility(choosing[0]?View.VISIBLE:View.GONE);delete.setEnabled(!selected.isEmpty());int count=0;for(int i=0;i<rows.length();i++){JSONObject o=rows.optJSONObject(i);if(o==null||o.optInt("category")!=cat[0])continue;count++;final int index=i;LinearLayout row=PanelUi.column(c);TextView value=PanelUi.text(c,(choosing[0]?(selected.contains(i)?"✓ ":"□ "):"")+o.optString("value"),16);row.addView(value);String status=(o.optBoolean("enabled",true)?tr(c,"有効","Enabled","啟用"):tr(c,"無効","Disabled","停用"))+" · "+mode(c,o.optString("mode","partial"));long date=o.optLong("date");if(date>0)status+="   "+android.text.format.DateFormat.getDateFormat(c).format(new Date(date))+" "+android.text.format.DateFormat.getTimeFormat(c).format(new Date(date));TextView details=PanelUi.text(c,status,12);row.addView(details);row.setOnClickListener(v->{if(choosing[0]){if(!selected.add(index))selected.remove(index);refresh[0].run();}else edit(a,rows,index,cat[0],refresh[0]);});row.setOnLongClickListener(v->{if(choosing[0]){if(!selected.add(index))selected.remove(index);refresh[0].run();}else new AlertDialog.Builder(c).setTitle(tr(c,"項目を削除","Delete rule","刪除規則")).setMessage(o.optString("value")).setPositiveButton(tr(c,"削除","Delete","刪除"),(d,w)->{rows.remove(index);save(a,rows);refresh[0].run();}).setNeutralButton(tr(c,"複数選択","Select multiple","選取多個"),(d,w)->{choosing[0]=true;selected.add(index);refresh[0].run();}).setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null).show();return true;});items.addView(row);PanelUi.divider(items);}if(count==0)items.addView(PanelUi.text(c,tr(c,"登録された項目はありません","No rules","尚無規則"),14));};
 for(int i=0;i<2;i++){final int n=i;tab[i].setOnClickListener(v->{cat[0]=n;selected.clear();choosing[0]=false;refresh[0].run();});}add.setOnClickListener(v->edit(a,rows,-1,cat[0],refresh[0]));cancel.setOnClickListener(v->{selected.clear();choosing[0]=false;refresh[0].run();});delete.setOnClickListener(v->new AlertDialog.Builder(c).setTitle(tr(c,"選択した項目を削除しますか？","Delete selected rules?","刪除所選規則？")).setMessage(String.valueOf(selected.size())).setPositiveButton(tr(c,"削除","Delete","刪除"),(d,w)->{ArrayList<Integer> indices=new ArrayList<>(selected);Collections.sort(indices,Collections.reverseOrder());for(int index:indices)rows.remove(index);save(a,rows);selected.clear();choosing[0]=false;refresh[0].run();}).setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null).show());dialog.setOnDismissListener(d->{Preference p=a.findPreference("nicoid_filter_list");if(p!=null)p.setSummary(rows.length()+tr(c,"件：登録した条件に一致する動画を非表示"," rules: hide videos matching registered conditions","項：隱藏符合已登錄條件的影片"));});refresh[0].run();PlaybackSession.showDialog(dialog);}
 private static void edit(PreferenceActivity a,JSONArray rows,int index,int cat,Runnable refresh){Context c=PlaybackSession.dialogContext(a);JSONObject o=index<0?new JSONObject():rows.optJSONObject(index);LinearLayout box=PanelUi.column(c);box.setPadding(PanelUi.dp(c,16),0,PanelUi.dp(c,16),0);CheckBox enabled=new CheckBox(c);enabled.setText(tr(c,"有効","Enabled","啟用"));enabled.setChecked(o.optBoolean("enabled",true));PanelUi.tint(enabled);box.addView(enabled);int[] selectedCategory={o.optInt("category",cat)};Button categories=PanelUi.button(c,category(c,selectedCategory[0])+" ▾");categories.setOnClickListener(v->{String[] labels={category(c,0),category(c,1)};ArrayAdapter<String> options=new ArrayAdapter<String>(c,android.R.layout.simple_list_item_single_choice,labels){public View getView(int position,View reuse,ViewGroup parent){View row=super.getView(position,reuse,parent);if(row instanceof TextView)((TextView)row).setTextColor(PanelUi.ink(c));return row;}};AlertDialog chooser=new AlertDialog.Builder(c).setSingleChoiceItems(options,selectedCategory[0],(dialog,which)->{selectedCategory[0]=which;categories.setText(labels[which]+" ▾");dialog.dismiss();}).setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null).create();PlaybackSession.showDialog(chooser);});box.addView(categories);RadioGroup modes=new RadioGroup(c);String[] names={"partial","exact","regex"};for(int i=0;i<3;i++){RadioButton b=new RadioButton(c);b.setId(100+i);b.setText(mode(c,names[i]));PanelUi.tint(b);modes.addView(b);if(o.optString("mode","partial").equals(names[i]))b.setChecked(true);}box.addView(modes);EditText value=new EditText(c);value.setText(o.optString("value"));value.setTextColor(PanelUi.ink(c));value.setBackgroundTintList(android.content.res.ColorStateList.valueOf(ThemeChoice.accent(c)));value.setMinLines(2);value.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);box.addView(value);AlertDialog d=new AlertDialog.Builder(c).setTitle(tr(c,"NG編集","Edit NG rule","編輯 NG 規則")).setView(box).setPositiveButton("OK",null).setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null).create();PlaybackSession.showForm(d);value.setTextColor(PanelUi.ink(c));value.setBackgroundTintList(android.content.res.ColorStateList.valueOf(ThemeChoice.accent(a)));d.getButton(-1).setOnClickListener(v->{String s=value.getText().toString();String m=names[Math.max(0,modes.getCheckedRadioButtonId()-100)];if(s.trim().isEmpty()){value.setError(tr(c,"文字を入力してください","Enter a value","請輸入文字"));return;}try{if(m.equals("regex"))java.util.regex.Pattern.compile(s);JSONObject next=new JSONObject().put("value",s).put("mode",m).put("category",selectedCategory[0]).put("enabled",enabled.isChecked()).put("date",System.currentTimeMillis());if(index<0)rows.put(next);else rows.put(index,next);save(a,rows);refresh.run();d.dismiss();}catch(java.util.regex.PatternSyntaxException e){value.setError(tr(c,"正規表現が不正です","Invalid regular expression","正規表示式無效"));}catch(Exception ignored){}});}
    private static volatile Method rowValue;
    private static volatile java.lang.reflect.Field rowOwner;
    /** Same owner-name sources used by normal video rows, including channel videos. */
    public static String owner(JSONObject row) {
        if (row == null) return "";
        PaidVideos.remember(row);
        for (String key : new String[]{"owner", "user", "channel"}) {
            JSONObject source = row.optJSONObject(key);
            if (source == null) continue;
            for (String name : new String[]{"nickname", "name"}) {
                String value = source.optString(name, "");
                if (!value.isEmpty()) return value;
            }
            String nested = owner(source);
            if (!nested.isEmpty()) return nested;
        }
        String value = row.optString("ownerName", "");
        return value.isEmpty() ? row.optString("uploaderName", "") : value;
    }
    public static void rememberHistory(JSONObject record) {
        try {
            JSONObject watch = (JSONObject) Class.forName("e.e.a.ModernPlayback").getField("latestWatch").get(null);
            JSONObject video = watch == null ? null : watch.optJSONObject("video");
            if (video != null && HistoryRules.same(record.optString("videourl"), video.optString("id"))) {
                record.put("isPaymentRequired", PaidVideos.watchRequired(watch));
                PaidVideos.remember(record);
                String name = owner(watch);
                if (!name.isEmpty()) record.put("ownerName", name);
            }
        } catch (ReflectiveOperationException | org.json.JSONException ignored) { }
    }
    public static void restoreHistory(Object row, JSONObject record) {
        PaidVideos.remember(record);
        try { row.getClass().getField("y").set(row, owner(record)); }
        catch (ReflectiveOperationException error) { throw new IllegalStateException("Unsupported history row", error); }
    }
    /** The adapter and fragment share this list, preserving click and selection indices. */
    public static void filter(Object adapter) {
        try {
            Class<?> type = adapter.getClass();
            Context context = (Context) type.getField("d").get(adapter);
            Rules rules = rules(context);
            if (rules.empty()) return;
            ArrayList<?> rows = (ArrayList<?>) type.getField("b").get(adapter);
            Method value = rowValue; java.lang.reflect.Field owner = rowOwner;
            if (value == null || owner == null) {
                Class<?> rowType = Class.forName("e.e.a.x1");
                value = rowType.getMethod("a", String.class); owner = rowType.getField("y");
                rowValue = value; rowOwner = owner;
            }
            for (int n = rows.size() - 1; n >= 0; n--) {
                Object row = rows.get(n);
                Object title = value.invoke(row, "title");
                Object url = value.invoke(row, "videourl");
                Object channel = owner.get(row);
                if (url != null && (url.toString().contains("/watch/") || url.toString().contains("/shorts/")) &&
                    rules.blocked(title == null ? null : title.toString(), channel == null ? null : channel.toString())) rows.remove(n);
            }
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unsupported video list", error);
        }
    }
}
