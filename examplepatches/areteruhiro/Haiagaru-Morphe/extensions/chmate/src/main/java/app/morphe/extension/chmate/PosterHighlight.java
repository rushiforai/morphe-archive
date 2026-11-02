package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.text.Html;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.Spannable;
import android.text.style.BackgroundColorSpan;
import android.text.style.StyleSpan;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.*;
import org.json.JSONArray;
import org.json.JSONObject;
import java.lang.ref.WeakReference;
import java.util.*;

/** Display-only poster highlighting. No NG flags, model fields or DAT text are modified. */
public final class PosterHighlight {
    static final String PREFS="haiagaru.poster-highlight";
    static final int COLOR_PREVIEW_TAG=0x48690d01;
    private static final int ITEM=0x7e484b01;
    private static final Map<Object, PosterHighlightRules.Poster> FIRST=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<MenuItem, Identity> MENU_TARGETS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final int[] COLORS=PosterHighlightRules.COLORS;
    private static Context context;
    private static volatile boolean enabled;
    private static volatile int color=COLORS[0], revision;
    private static volatile List<PosterHighlightRules.Rule> rules=Collections.emptyList();
    private static final class Identity {
        final PosterHighlightRules.Poster poster, first;
        final WeakReference<Object> response;
        final String thread, board;
        Identity(Object response, Object board, PosterHighlightRules.Poster first) throws Exception {
            this.poster=poster(response); this.first=first; this.response=new WeakReference<>(response);
            // Matching needs only the thread URL, not a snapshot/copy of the whole body.
            String method=response.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError")?"d":
                    response.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"e":"c";
            java.lang.reflect.Method urlMethod=board.getClass().getDeclaredMethod(method,int.class);
            urlMethod.setAccessible(true);
            String url=(String)urlMethod.invoke(board,number(response));
            thread=PosterHighlightRules.thread(url); this.board=PosterHighlightRules.board(thread);
        }
    }
    private static final class Tint extends BackgroundColorSpan { Tint(int color){super(color);} }
    private static final class Bold extends StyleSpan { Bold(){super(Typeface.BOLD);} }
    private static final class Applied { int revision; Applied(){revision=PosterHighlight.revision;} }
    public static void initialize(Context supplied) {
        if(supplied==null || context!=null)return;
        context=supplied.getApplicationContext();
        if(context==null)context=supplied;
        reload();
    }
    private static SharedPreferences prefs(){return context.getSharedPreferences(PREFS,Context.MODE_PRIVATE);}
    private static void reload() {
        try {
            SharedPreferences p=prefs(); enabled=p.getBoolean("enabled",false);
            color=COLORS[Math.max(0,Math.min(COLORS.length-1,p.getInt("color",0)))];
            JSONArray array=new JSONArray(p.getString("rules","[]"));
            ArrayList<PosterHighlightRules.Rule> loaded=new ArrayList<>();
            for(int i=0;i<array.length() && i<500;i++) {
                JSONObject j=array.getJSONObject(i);
                loaded.add(new PosterHighlightRules.Rule(j.getInt("kind"),j.getInt("scope"),j.getString("target"),
                        j.getString("value"),j.optBoolean("enabled",true),j.optInt("colorIndex",-1)));
            }
            rules=Collections.unmodifiableList(loaded);
        } catch(Exception error) { enabled=false; rules=Collections.emptyList(); report(error); }
        ++revision;
    }
    static void save(List<PosterHighlightRules.Rule> values) {
        if(values.size()>500)throw new IllegalArgumentException("強調ルールは500件までです");
        try {
            JSONArray array=new JSONArray();
            for(PosterHighlightRules.Rule r:values) array.put(new JSONObject().put("kind",r.kind).put("scope",r.scope)
                    .put("target",r.target).put("value",r.value).put("enabled",r.enabled).put("colorIndex",r.colorIndex));
            prefs().edit().putString("rules",array.toString()).apply(); reload(); refresh();
        } catch(Exception error){throw new IllegalStateException("強調ルールを保存できませんでした",error);}
    }
    private static void refresh(){EmojiFontFallback.refreshVisibleRows();}
    private static final android.util.LruCache<String,String> PLAIN_CACHE=new android.util.LruCache<>(512);
    private static String plain(Object value){
        if(value==null)return "";
        String html=String.valueOf(value);
        if(html.indexOf('<')<0&&html.indexOf('&')<0)return html;
        String cached=PLAIN_CACHE.get(html);if(cached!=null)return cached;
        String result=Html.fromHtml(html).toString();
        if(html.length()<=4096)PLAIN_CACHE.put(html,result);
        return result;
    }
    static PosterHighlightRules.Poster poster(Object response) throws Exception {
        String id,name,date;
        switch(response.getClass().getName()) {
            case "o.processAdDisplayErrorPostbackForUserError": id="h";name="n";date="q";break;
            case "o.BouncyCastleSocketAdapterCompanion": id="j";name="m";date="t";break;
            case "o.KeJ11": id="g";name="n";date="p";break;
            default:throw new IllegalArgumentException("Unsupported poster model");
        }
        return new PosterHighlightRules.Poster(plain(ResponseArchiveEntry.field(response,id)),
                plain(ResponseArchiveEntry.field(response,name)),plain(ResponseArchiveEntry.field(response,date)));
    }
    private static int number(Object response) throws Exception {
        return ((Number)ResponseArchiveEntry.field(response,
                response.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"l":"o")).intValue();
    }
    private static Object firstResponse(Object list) throws Exception {
        if(!(list instanceof List))return null;
        Object base;
        try {base=ResponseArchiveEntry.field(list,"mBase");}catch(NoSuchFieldException ignored){base=null;}
        if(base instanceof List)list=base;
        // Native DAT order starts at response 1. Never infer an OP from a filtered first visible row.
        for(Object response:(List<?>)list) {
            if(response==null)continue;
            int no=number(response);
            if(no==1)return response;
            if(no>1)return null;
        }
        return null;
    }
    /** Called at 242's full/compact row-list boundary, independent of programmable NG being enabled. */
    public static void observeResponses(Object list) {
        if(!enabled || !hasStarterRule() || !(list instanceof List))return;
        try {
            Object response=firstResponse(list);
            if(response==null)return;
            PosterHighlightRules.Poster first=poster(response);
            boolean changed=false;
            synchronized(FIRST) {
                if(FIRST.size()>30000)FIRST.clear();
                for(Object row:(List<?>)list)if(row!=null && !FIRST.containsKey(row)){FIRST.put(row,first);changed=true;}
            }
            if(changed)++revision;
        } catch(Exception error){report(error);}
    }
    private static boolean hasStarterRule() {
        for(PosterHighlightRules.Rule rule:rules)if(rule.enabled && rule.kind==0)return true;
        return false;
    }
    private static Object board(Object owner) throws Exception {
        switch(owner.getClass().getName()) {
            case "o.m9ExternalSyntheticLambda1":return ResponseArchiveEntry.field(ResponseArchiveEntry.field(owner,"M"),"f");
            case "o.listener":return ResponseArchiveEntry.field(ResponseArchiveEntry.field(owner,"E"),"j");
            case "o.WorkSourceUtil":return ResponseArchiveEntry.field(ResponseArchiveEntry.field(owner,"w"),"b");
            default:throw new IllegalArgumentException("Unsupported response renderer");
        }
    }
    private static PosterHighlightRules.Poster starter(Object owner,Object response) throws Exception {
        if(number(response)==1)return poster(response);
        if(owner.getClass().getName().equals("o.m9ExternalSyntheticLambda1")) {
            Object first=firstResponse(ResponseArchiveEntry.field(owner,"K"));
            return first==null?null:poster(first);
        }
        if(owner.getClass().getName().equals("o.listener")) {
            Object first=firstResponse(ResponseArchiveEntry.field(owner,"J"));
            return first==null?null:poster(first);
        }
        return FIRST.get(response);
    }
    /** Wrapper return type stays Spanned so the native ART verifier retains the exact type. */
    public static Spanned decorate(Spanned source,Object owner,Object response) {
        if(context==null || source==null || source.length()==0)return source;
        try {
            return decorateResponse(source,response,board(owner),hasStarterRule()?starter(owner,response):null);
        }catch(Exception error){report(error);return source;}
    }
    static Spanned decorateResponse(Spanned source,Object response,Object board,PosterHighlightRules.Poster first) throws Exception {
        Identity identity=new Identity(response,board,first);
        // The body text is never edited here. SpannableString copies dense native
        // anchor spans without rebuilding SpannableStringBuilder's editable tree.
        SpannableString copy=copyStyles(source);
        for(Identity previous:copy.getSpans(0,copy.length(),Identity.class))copy.removeSpan(previous);
        copy.setSpan(identity,0,copy.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return styled(copy,identity);
    }
    private static SpannableString copyStyles(Spanned source){
        SpannableString copy=new SpannableString(source);
        // Match the old editable builder's semantics: native selection/watchers
        // marked NoCopySpan belong to their original View, not another bound row.
        for(android.text.NoCopySpan span:copy.getSpans(0,copy.length(),android.text.NoCopySpan.class))copy.removeSpan(span);
        return copy;
    }
    private static PosterHighlightRules.Rule matchingRule(Identity identity) {
        if(!enabled)return null;
        PosterHighlightRules.Poster first=identity.first;
        if(first==null)first=FIRST.get(identity.response.get());
        // The last registered matching rule wins, so a new person-specific color overrides older broad rules.
        for(int i=rules.size()-1;i>=0;i--) {
            PosterHighlightRules.Rule rule=rules.get(i);
            if(rule.matches(identity.poster,first,identity.thread,identity.board))return rule;
        }
        return null;
    }
    private static boolean hasStyle(Spanned text,PosterHighlightRules.Rule match) {
        Tint[] tints=text.getSpans(0,text.length(),Tint.class);
        Bold[] bold=text.getSpans(0,text.length(),Bold.class);
        if(match==null)return tints.length==0 && bold.length==0;
        return tints.length==1 && bold.length==1 && tints[0].getBackgroundColor()==match.color(color)
                && text.getSpanStart(tints[0])==0 && text.getSpanEnd(tints[0])==text.length()
                && text.getSpanStart(bold[0])==0 && text.getSpanEnd(bold[0])==text.length();
    }
    private static Spanned styled(Spannable text,Identity identity) {
        PosterHighlightRules.Rule match=matchingRule(identity);
        if(hasStyle(text,match)) {
            Applied[] applied=text.getSpans(0,text.length(),Applied.class);
            if(applied.length==1){applied[0].revision=revision;return text;}
        }
        for(Tint span:text.getSpans(0,text.length(),Tint.class))text.removeSpan(span);
        for(Applied span:text.getSpans(0,text.length(),Applied.class))text.removeSpan(span);
        Bold[] bold=text.getSpans(0,text.length(),Bold.class);
        // A color change is draw-only. Keep metric-affecting bold spans intact.
        if(match==null)for(Bold span:bold)text.removeSpan(span);
        if(match!=null) {
            text.setSpan(new Tint(match.color(color)),0,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            if(bold.length==0)text.setSpan(new Bold(),0,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        text.setSpan(new Applied(),0,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }
    static void apply(TextView view) {
        if(view instanceof EditText || !(view.getText() instanceof Spanned))return;
        Spanned text=(Spanned)view.getText();
        Identity[] identities=text.getSpans(0,text.length(),Identity.class);
        if(identities.length==0)return;
        Applied[] applied=text.getSpans(0,text.length(),Applied.class);
        if(applied.length>0 && applied[0].revision==revision)return;
        // Never reset the list's scroll anchor for a highlight refresh. In particular,
        // registering a second person must not snap an active fling to an older offset.
        if(text instanceof Spannable)styled((Spannable)text,identities[0]);
        else view.setText(styled(copyStyles(text),identities[0]),TextView.BufferType.SPANNABLE);
    }
    public static void append(Object menuObject,Object response,Object nativeBoard) {
        RedIdAutoNg.appendMenu(menuObject,response);
        if(context==null || !(menuObject instanceof Menu) || response==null || nativeBoard==null)return;
        Menu menu=(Menu)menuObject;
        if(!ResponseMenuSettings.visible(ITEM) || menu.findItem(ITEM)!=null)return;
        try {
            Identity identity=new Identity(response,nativeBoard,number(response)==1?poster(response):FIRST.get(response));
            MenuItem item=menu.add(Menu.NONE,ITEM,ResponseMenuSettings.order(ITEM,menu.size()),"この人の書き込みを強調");
            MENU_TARGETS.put(item,identity);
            item.setOnMenuItemClickListener(PosterHighlight::handle);
        }catch(Exception error){report(error);}
    }
    /** Native icon/Compose menus may bypass MenuItem's own listener. */
    public static boolean handle(Object object) {
        if(RedIdAutoNg.handleMenu(object))return true;
        if(!(object instanceof MenuItem) || ((MenuItem)object).getItemId()!=ITEM)return false;
        Identity identity=MENU_TARGETS.get((MenuItem)object);
        Activity activity=Haiagaru.toolbarActivity(null);
        if(identity!=null)choose(activity,identity);
        else if(activity!=null)toast(activity,"投稿者を取得できません。レスのメニューを開き直してください");
        return true;
    }
    public static void appendSheet(Object builder,Object response,Object nativeBoard) {
        try {
            Identity identity=new Identity(response,nativeBoard,number(response)==1?poster(response):FIRST.get(response));
            ResponseArchive.appendSheetAction(builder,"この人の書き込みを強調",android.R.drawable.btn_star_big_on,
                    ()->choose(Haiagaru.toolbarActivity(null),identity));
        }catch(Exception error){report(error);}
    }
    /** 242 also has an ordinary response dialog, separate from its ViewModel sheet. */
    public static void appendDialog242(Object dialog,Object menu) {
        try {
            Object parent=dialog.getClass().getMethod("getParentFragment").invoke(dialog);
            Object response=ResponseArchiveEntry.field(ResponseArchiveEntry.field(parent,"o"),"c");
            Object board=ResponseArchiveEntry.field(ResponseArchiveEntry.field(parent,"r"),"b");
            append(menu,response,board);
        }catch(Exception error){report(error);}
    }
    private static void choose(Activity activity,Identity identity) {
        if(activity==null || activity.isFinishing())return;
        String[] labels=PosterHighlightRules.KINDS.clone();
        for(int i=1;i<labels.length;i++)labels[i]+="："+(identity.poster.value(i).isEmpty()?"取得できません":identity.poster.value(i));
        new HaiagaruDialog.Builder(activity).setTitle("強調する条件")
                .setItems(labels,(d,kind)->edit(activity,identity,kind)).setNegativeButton("キャンセル",null).show();
    }
    private static void edit(Activity activity,Identity identity,int kind) {
        String value=kind==0?"":identity.poster.value(kind);
        if(kind!=0 && value.isEmpty()){toast(activity,"このレスには対象の識別情報がありません");return;}
        LinearLayout content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);
        int pad=(int)(16*activity.getResources().getDisplayMetrics().density);content.setPadding(pad,pad,pad,pad);
        TextView help=new TextView(activity);
        help.setText("一致した投稿者の名前・本文を背景色と太字で強調します。NG設定には影響しません。\n"
                + (kind==0?"レス1とID（なければトリップ、ﾜｯﾁｮｲ）が一致する投稿を強調します。識別情報がない場合やID変更後の同一人物までは判定できません。":"同じIDやﾜｯﾁｮｲを使う別人も一致する可能性があります。通常は「このスレ」を選んでください。"));
        content.addView(help);
        EditText input=new EditText(activity);input.setSingleLine(true);input.setText(value);
        if(kind!=0)content.addView(input);
        Spinner scope=new Spinner(activity);scope.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_spinner_dropdown_item,PosterHighlightRules.SCOPES));
        content.addView(scope);
        TextView colorLabel=new TextView(activity);colorLabel.setText("この登録の背景色");content.addView(colorLabel);
        Spinner ruleColor=colorSpinner(activity,true);content.addView(ruleColor);
        TextView sample=colorSample(activity,color);
        content.addView(sample);
        ruleColor.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> p){}
            public void onItemSelected(AdapterView<?> p,android.view.View v,int position,long id){
                setSampleColor(sample,position==0?color:COLORS[position-1]);
            }
        });
        TextView priority=new TextView(activity);priority.setText("複数の登録に一致した場合は、最後に登録した条件の色を使います。");content.addView(priority);
        ScrollView scroll=new ScrollView(activity);scroll.addView(content);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle(PosterHighlightRules.KINDS[kind]+"で強調")
                .setView(scroll).setNegativeButton("キャンセル",null).setNeutralButton("登録一覧",(d,w)->showSettings(activity))
                .setPositiveButton("登録",null).create();
        dialog.setOnShowListener(d->dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{
            try {
                int selected=scope.getSelectedItemPosition();
                String target=selected==0?identity.thread:selected==1?identity.board:"";
                String raw=kind==0?"":input.getText().toString().trim();
                if(kind==3 && raw.startsWith("-"))raw=raw.substring(1);
                if(kind==4 && raw.startsWith("◆"))raw=raw.substring(1);
                PosterHighlightRules.Rule rule=new PosterHighlightRules.Rule(kind,selected,target,raw,true,ruleColor.getSelectedItemPosition()-1);
                ArrayList<PosterHighlightRules.Rule> copy=new ArrayList<>(rules);
                for(int i=copy.size()-1;i>=0;i--) {
                    PosterHighlightRules.Rule old=copy.get(i);
                    if(old.kind==rule.kind && old.scope==rule.scope && old.target.equals(rule.target) && old.value.equals(rule.value))copy.remove(i);
                }
                copy.add(rule);prefs().edit().putBoolean("enabled",true).apply();save(copy);
                toast(activity,"強調を登録しました。未反映の行はスレを開き直してください");dialog.dismiss();
            }catch(Exception error){input.setError(error.getMessage());}
        }));dialog.show();
    }
    public static void addSettingsButton(LinearLayout parent,Activity activity) {
        Button button=new Button(activity);button.setText("投稿者の強調（スレ主・ID・ﾜｯﾁｮｲ・トリップ）");
        button.setOnClickListener(v->showSettings(activity));parent.addView(button);
    }
    private static TextView colorSample(Activity activity,int selectedColor) {
        TextView sample=new TextView(activity);sample.setText("名前・本文の強調色の見本");sample.setTypeface(null,Typeface.BOLD);
        setSampleColor(sample,selectedColor);return sample;
    }
    private static void setSampleColor(TextView sample,int selectedColor) {
        sample.setTag(COLOR_PREVIEW_TAG,selectedColor);sample.setBackgroundColor(selectedColor);
    }
    private static Spinner colorSpinner(Activity activity,boolean inherit) {
        ArrayList<String> labels=new ArrayList<>();
        if(inherit)labels.add("共通設定の色");
        for(String name:PosterHighlightRules.COLOR_NAMES)labels.add("背景色："+name);
        Spinner spinner=new Spinner(activity);
        spinner.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_spinner_dropdown_item,labels));
        return spinner;
    }
    public static void showSettings(Activity activity) {
        if(context==null || activity==null || activity.isFinishing())return;
        LinearLayout content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);
        Switch master=new Switch(activity);master.setText("投稿者の強調を有効にする");master.setChecked(enabled);content.addView(master);
        master.setOnCheckedChangeListener((b,on)->{prefs().edit().putBoolean("enabled",on).apply();reload();refresh();});
        TextView help=new TextView(activity);help.setText("レス本文を長押し →「この人の書き込みを強調」から条件を登録できます。\n下のチェックで登録ごとのオン／オフを切り替えます。変更は即時保存されます。");content.addView(help);
        TextView commonLabel=new TextView(activity);commonLabel.setText("共通設定の色（個別に色を指定していない登録に適用）");content.addView(commonLabel);
        Spinner colors=colorSpinner(activity,false);
        colors.setSelection(Math.max(0,Math.min(COLORS.length-1,prefs().getInt("color",0))));content.addView(colors);
        TextView commonSample=colorSample(activity,color);content.addView(commonSample);
        ArrayList<TextView> inheritedSamples=new ArrayList<>();
        colors.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(android.widget.AdapterView<?> p){}
            public void onItemSelected(android.widget.AdapterView<?> p,android.view.View v,int position,long id){
                setSampleColor(commonSample,COLORS[position]);
                for(TextView sample:inheritedSamples)setSampleColor(sample,COLORS[position]);
                if(prefs().getInt("color",0)==position)return;
                prefs().edit().putInt("color",position).apply();reload();refresh();
            }
        });
        List<PosterHighlightRules.Rule> displayed=rules;
        for(int i=0;i<displayed.size();i++) {
            final int index=i; PosterHighlightRules.Rule r=displayed.get(i);
            CheckBox check=new CheckBox(activity);check.setText(r.label());check.setChecked(r.enabled);content.addView(check);
            check.setOnCheckedChangeListener((b,on)->{
                ArrayList<PosterHighlightRules.Rule> copy=new ArrayList<>(rules);
                if(index>=copy.size())return;
                PosterHighlightRules.Rule old=copy.get(index);
                copy.set(index,new PosterHighlightRules.Rule(old.kind,old.scope,old.target,old.value,on,old.colorIndex));save(copy);
            });
            Spinner individualColor=colorSpinner(activity,true);individualColor.setSelection(r.colorIndex+1);content.addView(individualColor);
            TextView individualSample=colorSample(activity,r.colorIndex<0?color:COLORS[r.colorIndex]);content.addView(individualSample);
            if(r.colorIndex<0)inheritedSamples.add(individualSample);
            individualColor.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onNothingSelected(AdapterView<?> p){}
                public void onItemSelected(AdapterView<?> p,android.view.View v,int position,long id){
                    setSampleColor(individualSample,position==0?color:COLORS[position-1]);
                    inheritedSamples.remove(individualSample);if(position==0)inheritedSamples.add(individualSample);
                    ArrayList<PosterHighlightRules.Rule> copy=new ArrayList<>(rules);
                    if(index>=copy.size())return;
                    PosterHighlightRules.Rule old=copy.get(index);
                    if(old.colorIndex==position-1)return;
                    copy.set(index,new PosterHighlightRules.Rule(old.kind,old.scope,old.target,old.value,old.enabled,position-1));save(copy);
                }
            });
        }
        if(displayed.isEmpty()){TextView empty=new TextView(activity);empty.setText("登録はありません");content.addView(empty);}
        Button remove=new Button(activity);remove.setText("登録を選んで削除");content.addView(remove);
        ScrollView scroll=new ScrollView(activity);scroll.addView(content);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("投稿者の強調").setView(scroll).setPositiveButton("閉じる",null).create();
        remove.setOnClickListener(v->{
            List<PosterHighlightRules.Rule> selectedRules=rules;
            String[] labels=new String[selectedRules.size()];boolean[] checked=new boolean[labels.length];
            for(int i=0;i<labels.length;i++)labels[i]=selectedRules.get(i).label();
            new HaiagaruDialog.Builder(activity).setTitle("削除する登録を選択").setMultiChoiceItems(labels,checked,(d,i,on)->checked[i]=on)
                    .setNegativeButton("キャンセル",null).setPositiveButton("削除",(d,w)->{
                        ArrayList<PosterHighlightRules.Rule> keep=new ArrayList<>();
                        for(int i=0;i<labels.length;i++)if(!checked[i])keep.add(selectedRules.get(i));
                        save(keep);dialog.dismiss();showSettings(activity);
                    }).show();
        });dialog.show();
    }
    private static void report(Exception error){android.util.Log.w("Haiagaru","Poster highlight",error);}
    private static void toast(Context c,String text){Toast.makeText(c,text,Toast.LENGTH_LONG).show();}
}
