package app.morphe.extension.chmate;

import android.app.Activity;
import android.view.*;
import android.widget.*;
import android.text.Html;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.lang.ref.WeakReference;

/** User-reviewed multi-response registration through the existing native NG stores and DAT index. */
public final class MultiResponseNg {
    static final int MENU=0x4847381;
    static final int TOOLBAR=0x7e00000e;
    private static final String[] CATEGORIES={"ID","名前","本文（NGWord）","レス番号（このスレ）"};
    private static final String[] STORES={"ID","NAME","WORD"};
    static final ExecutorService IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Haiagaru-response-selection");t.setDaemon(true);return t;});
    private static final Set<Object> OPEN=Collections.newSetFromMap(new WeakHashMap<>());
    static final class Target {
        final Object fragment,board,adapter,index;final String version,url,scope;final Activity activity;
        Target(Object fragment)throws Exception{
            this.fragment=fragment;activity=Haiagaru.toolbarActivity(fragment);
            if(activity==null)throw new IllegalStateException("スレ画面を開いてください");
            version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            board=NativeThreadContext.board(fragment,version);url=NativeThreadContext.url(board,version,1);
            if(url==null)throw new IllegalStateException("スレを確認できません");
            Object boardId;
            if(version.contains("191"))boardId=board.getClass().getMethod("h").invoke(board);
            else boardId=board.getClass().getMethod(version.contains("226")?"e":"b",board.getClass()).invoke(null,board);
            scope=boardId.toString();adapter=ExtraQuickFilters.adapter(fragment);index=ExtraQuickFilters.index(adapter);
        }
        void current()throws Exception {
            if(activity.isFinishing()||activity.isDestroyed()||!url.equals(NativeThreadContext.url(NativeThreadContext.board(fragment,version),version,1)))
                throw new IllegalStateException("表示中のスレが変わりました。選択を開き直してください");
        }
    }
    static final class Plan {
        final Object response;final int number;final String id,name,body;
        boolean selected;int category;String pattern;boolean hidden,chain,global;
        Plan(Object row)throws Exception{
            response=row;number=ExtraQuickFilters.number(row);
            PosterHighlightRules.Poster poster=PosterHighlight.poster(row);id=poster.id;
            String nameField=row.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"m":"n";
            name=Html.fromHtml(String.valueOf(NativeFields.find(row.getClass(),nameField).get(row))).toString();
            String f=row.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError")?"c":row.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"d":"h";
            String html=String.valueOf(NativeFields.find(row.getClass(),f).get(row));
            body=Html.fromHtml(html.length()>8000?html.substring(0,8000):html).toString();
            category=id==null||id.trim().isEmpty()?3:0;pattern=value(category);
        }
        String value(int type){return type==0?(id==null?"":id):type==1?(name==null?"":name):type==2?body:Integer.toString(number);}
        String label(){String preview=body.replaceAll("[\r\n]+"," ");return ">>"+number+"  "+(id==null?"":id)+"  "+name+Character.toString(10)+(preview.length()>120?preview.substring(0,120)+"…":preview);}
    }
    public static void menu(Object fragment,Menu menu){
        if(menu==null)return;
        for(int i=0;i<menu.size();i++){
            MenuItem search=menu.getItem(i);
            if("検索".contentEquals(search.getTitle()==null?"":search.getTitle())
                    &&!ThreadSearchOptions.menuEnabled(ThreadSearchOptions.MENU_SEARCH))search.setVisible(false);
        }
        MenuItem item=menu.findItem(MENU);if(item==null)item=menu.add(0,MENU,0,"レス複数選択");
        item.setVisible(ThreadSearchOptions.menuEnabled(ThreadSearchOptions.MENU_SELECTION));
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);item.setOnMenuItemClickListener(v->{open(fragment);return true;});
    }
    public static boolean click(Object fragment,int action){
        if(action!=MENU&&action!=TOOLBAR)return false;
        open(fragment);
        return true;
    }
    static void open(Object fragment){
        if(OPEN.contains(fragment))return;OPEN.add(fragment);
        try{
            Target target=new Target(fragment);
            Object raw=NativeFields.find(target.adapter.getClass(),target.version.contains("191")?"K":target.version.contains("226")?"J":"o").get(target.adapter);
            List<?> source=new ArrayList<>(PopularReplies.fullList(raw));
            IO.execute(()->{
                try{
                    ArrayList<Plan> plans=new ArrayList<>();Set<Integer> seen=new HashSet<>();
                    for(Object row:source){if(plans.size()>=10000)break;if(row!=null){Plan plan=new Plan(row);if(seen.add(plan.number))plans.add(plan);}}
                    target.activity.runOnUiThread(()->{OPEN.remove(fragment);if(!target.activity.isFinishing())select(target,plans);});
                }catch(Exception e){target.activity.runOnUiThread(()->{OPEN.remove(fragment);error(target.activity,e);});}
            });
        }catch(Exception e){OPEN.remove(fragment);Activity a=Haiagaru.toolbarActivity(fragment);if(a!=null)error(a,e);}
    }
    private static void select(Target target,ArrayList<Plan> rows){
        if(rows.isEmpty()){Toast.makeText(target.activity,"選択できるレスがありません",1).show();return;}
        try{ResponseMultiSelection.start(target,rows);}catch(Exception e){error(target.activity,e);}
    }
    static void ng(Target target,ArrayList<Plan> plans){
        if(plans.isEmpty()){Toast.makeText(target.activity,"レスをタップして選択してください",0).show();return;}
        new HaiagaruDialog.Builder(target.activity).setTitle(plans.size()+"レスのNG登録")
            .setItems(new String[]{"一括で同じ条件を使う","1件ずつ別の条件を使う（チェックで除外可）"},(d,mode)->condition(target,plans,0,mode==0))
            .setNegativeButton("キャンセル",null).show();
    }
    private static void condition(Target target,ArrayList<Plan> plans,int at,boolean common){
        Activity a=target.activity;Plan p=plans.get(at);LinearLayout box=new LinearLayout(a);box.setOrientation(1);
        CheckBox selected=new CheckBox(a);selected.setText(common?plans.size()+"レスを登録対象にする":">>"+p.number+" を登録対象にする");selected.setChecked(p.selected);box.addView(selected);
        Spinner category=new Spinner(a);category.setAdapter(new ArrayAdapter<>(a,android.R.layout.simple_spinner_dropdown_item,CATEGORIES));category.setSelection(p.category);box.addView(category);
        EditText text=new EditText(a);text.setText(p.pattern);text.setHint("空欄は登録できません");box.addView(text);
        TextView info=new TextView(a);info.setText(common?"ID・名前・本文は、選択した各レスの値を同じ設定で登録します。ここで入力した内容は先頭レスに適用します。レス番号はこのスレだけが対象です。":"条件を編集して次へ進めます。最後にまとめて確認するまで登録しません。レス番号はこのスレだけが対象です。");box.addView(info);
        CheckBox hidden=new CheckBox(a);hidden.setText("非表示（透明あぼーん）");hidden.setChecked(p.hidden);box.addView(hidden);
        CheckBox chain=new CheckBox(a);chain.setText("連鎖あぼーん");chain.setChecked(p.chain);box.addView(chain);
        CheckBox global=new CheckBox(a);global.setText("全板共通（オフはこの板だけ）");global.setChecked(p.global);box.addView(global);
        final int[] previous={p.category};
        Runnable availability=()->{boolean number=category.getSelectedItemPosition()==3;text.setEnabled(!number);global.setEnabled(!number);chain.setEnabled(!number);hidden.setEnabled(!number);};
        category.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onItemSelected(AdapterView<?> parent,View view,int pos,long id){if(previous[0]!=pos){text.setText(p.value(pos));previous[0]=pos;}availability.run();}
            public void onNothingSelected(AdapterView<?> parent){}
        });availability.run();
        ScrollView scroll=new ScrollView(a);scroll.addView(box);
        HaiagaruDialog d=new HaiagaruDialog.Builder(a).setTitle(common?"共通の登録条件":"登録条件 "+(at+1)+"/"+plans.size()+"（>>"+p.number+"）").setView(scroll)
            .setNegativeButton("キャンセル",null).setNeutralButton(at==0?"選択へ戻る":"前のレス",null)
            .setPositiveButton(common||at==plans.size()-1?"登録内容を確認":"次のレス",null).create();
        d.setOnShowListener(x->{
            Runnable remember=()->{p.selected=selected.isChecked();p.category=category.getSelectedItemPosition();p.pattern=text.getText().toString().trim();p.hidden=hidden.isChecked();p.chain=chain.isChecked();p.global=global.isChecked();};
            d.getButton(-3).setOnClickListener(v->{remember.run();d.dismiss();if(at==0)select(target,new ArrayList<>(plans));else condition(target,plans,at-1,false);});
            d.getButton(-1).setOnClickListener(v->{
                remember.run();if(p.selected&&p.category!=3&&p.pattern.isEmpty()){text.setError("登録する条件を入力してください");return;}
                if(common){for(int i=1;i<plans.size();i++){Plan other=plans.get(i);other.selected=p.selected;other.category=p.category;other.pattern=other.value(p.category);other.hidden=p.hidden;other.chain=p.chain;other.global=p.global;}}
                d.dismiss();if(common||at==plans.size()-1)confirm(target,plans);else condition(target,plans,at+1,false);
            });
        });d.show();
    }
    private static void confirm(Target target,ArrayList<Plan> plans){
        StringBuilder summary=new StringBuilder();int count=0;
        for(Plan p:plans)if(p.selected){count++;summary.append(">>").append(p.number).append("  ").append(CATEGORIES[p.category]).append("：").append(p.pattern.length()>80?p.pattern.substring(0,80)+"…":p.pattern).append((char)10);}
        if(count==0){Toast.makeText(target.activity,"登録対象がありません",1).show();return;}
        new HaiagaruDialog.Builder(target.activity).setTitle(count+"レスのNG登録を確認").setMessage(summary.toString()).setNegativeButton("戻る",(d,w)->condition(target,plans,0,false))
            .setPositiveButton("登録する",(d,w)->{
                try{target.current();Map<String,Integer> result=register(target,plans);ExtraQuickFilters.rebuild(target.adapter);Toast.makeText(target.activity,"登録しました："+result,1).show();}
                catch(Exception e){error(target.activity,e);}
            }).show();
    }
    static Map<String,Integer> register(Target target,List<Plan> plans)throws Exception{
        target.current();
        Map<String,NativeNgStore> stores=new LinkedHashMap<>();Map<String,List<NativeNgStore.Entry>> before=new LinkedHashMap<>();Map<String,List<Object>> after=new LinkedHashMap<>();Map<String,Integer> counts=new LinkedHashMap<>();Map<String,Set<String>> seen=new HashMap<>();
        ArrayList<Integer> numbers=new ArrayList<>();
        for(Plan p:plans)if(p.selected){
            if(p.category==3){numbers.add(p.number);continue;}
            String category=STORES[p.category];NativeNgStore store=stores.get(category);
            if(store==null){store=new NativeNgStore(target.activity,category);stores.put(category,store);List<NativeNgStore.Entry> old=store.entries();before.put(category,old);ArrayList<Object> copy=new ArrayList<>();for(NativeNgStore.Entry e:old)copy.add(e.nativeItem);after.put(category,copy);}
            if(p.pattern==null||p.pattern.trim().isEmpty())throw new IllegalArgumentException(">>"+p.number+" の登録条件が空です");
            short flags=WacchoiSuffixNg.registrationFlags((short)0,false,true,p.chain,p.hidden);
            NgRuleSafety.requireAllowed(category,p.pattern,flags);
            String scope=p.global?null:target.scope;
            Set<String> keys=seen.get(category);
            if(keys==null){keys=new HashSet<>();for(NativeNgStore.Entry e:before.get(category))keys.add(e.pattern+Character.toString(0)+e.flags+Character.toString(0)+e.board);seen.put(category,keys);}
            boolean duplicate=!keys.add(p.pattern+Character.toString(0)+flags+Character.toString(0)+scope);
            if(!duplicate){after.get(category).add(store.item(p.pattern,flags,System.currentTimeMillis(),scope));counts.put(category,counts.getOrDefault(category,0)+1);}
            if(after.get(category).size()>Haiagaru.getNgRegistrationLimit())throw new IllegalStateException(category+" のNG上限を超えます");
        }
        Method numberWriter=null;
        if(!numbers.isEmpty()){for(Method m:target.index.getClass().getDeclaredMethods())if(m.getReturnType()==void.class&&Arrays.equals(m.getParameterTypes(),new Class<?>[]{int[].class,int.class,int.class})){
            if(numberWriter!=null)throw new IllegalStateException("レス番号の登録先が複数あります");numberWriter=m;
        }if(numberWriter==null)throw new IllegalStateException("レス番号の登録先を確認できません");numberWriter.setAccessible(true);}
        ArrayList<String> completed=new ArrayList<>();
        try{
            for(String key:stores.keySet())if(counts.getOrDefault(key,0)>0){stores.get(key).replace(before.get(key),after.get(key));completed.add(key);}
            if(numberWriter!=null){for(int number:numbers)numberWriter.invoke(target.index,new int[]{number},0,8);counts.put("レス番号",numbers.size());}
        }catch(Exception error){throw new IllegalStateException("登録を中断しました。保存済み："+completed+"。残りは再選択してください。",error);}
        return counts;
    }
    private static void error(Activity a,Exception e){android.util.Log.w("Haiagaru","Multiple response NG",e);Toast.makeText(a,e.getMessage()==null?"NG登録画面を開けませんでした":e.getMessage(),1).show();}
    private MultiResponseNg(){}
}
