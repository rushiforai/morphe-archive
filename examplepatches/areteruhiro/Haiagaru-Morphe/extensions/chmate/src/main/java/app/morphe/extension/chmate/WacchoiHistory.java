package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.util.AtomicFile;
import android.text.*;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.*;

/** Private, bounded query/result snapshots. Reading a snapshot never starts a search. */
final class WacchoiHistory {
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static volatile long generation;
    private static final Set<String> deletedSessions=new HashSet<>();
    static final int MAX_FILE=Integer.MAX_VALUE-8; // Java JSON/byte-array representation ceiling, not retention policy.
    static File directory(Context c){return new File(c.getFilesDir(),"haiagaru-wacchoi-history");}
    static final class Session {
        final Context context;final JSONObject data;final JSONArray records=new JSONArray();final long epoch;
        boolean queued;long characters;
        final Set<String> recordKeys=new HashSet<>();
        Session(Context c,Intent args)throws Exception{
            context=c.getApplicationContext();epoch=generation;
            data=new JSONObject().put("id",UUID.randomUUID().toString()).put("time",System.currentTimeMillis())
                    .put("four",args.getStringExtra("four")).put("upper",args.getBooleanExtra("upper",false))
                    .put("requestLimit",args.getIntExtra("requestLimit",0))
                    .put("titleWords",args.getStringExtra("titleWords")).put("bodyWords",args.getStringExtra("bodyWords"))
                    .put("edgeArchive",args.getBooleanExtra("edgeArchive",true)).put("edgeMatchMode",args.getIntExtra("edgeMatchMode",0))
                    .put("edge",args.getBooleanExtra("edge",false)).put("boards",args.getStringExtra("boards"))
                    .put("from",args.getStringExtra("from")).put("to",args.getStringExtra("to"))
                    .put("limit",args.getIntExtra("limit",20)).put("status","開始しています");
        }
        synchronized void add(int kind,String a,String b,String c,String d){
            if(!recordKeys.add(kind+"\n"+a))return;
            try{long size=(long)a.length()+b.length()+c.length()+d.length();
                if(records.length()<WacchoiStorageLimits.bound(context,3)&&characters+size<=WacchoiStorageLimits.bound(context,4)){records.put(new JSONObject().put("kind",kind).put("a",a).put("b",b).put("c",c).put("d",d));characters+=size;}
                else data.put("truncated",true);
            }catch(Exception e){report(e);}
        }
        synchronized void status(String value){try{data.put("status",value);}catch(Exception e){report(e);}save();}
        synchronized void progress(SearchCursor cursor,String next,String url,String title,Set<String> visited){
            try{if(cursor==null)data.remove("checkpoint");else data.put("checkpoint",cursor.encode(next,url,title,visited));}
            catch(Exception e){report(e);}
        }
        synchronized void save(){
            if(queued)return;queued=true;
            IO.execute(()->{
                synchronized(WacchoiHistory.class){
                    synchronized(this){queued=false;if(epoch!=generation||deletedSessions.contains(data.optString("id")))return;
                        try{
                            data.put("results",new JSONArray(records.toString()));
                            JSONArray out=data.getJSONArray("results");
                            byte[] bytes=data.toString().getBytes(StandardCharsets.UTF_8);
                            while(bytes.length>WacchoiStorageLimits.scaled(context,2,1024L*1024)&&out.length()>0){out.remove(out.length()-1);data.put("truncated",true);bytes=data.toString().getBytes(StandardCharsets.UTF_8);}
                            File dir=directory(context);if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("history directory");
                            AtomicFile file=new AtomicFile(new File(dir,data.getString("id")+".json"));
                            FileOutputStream stream=null;try{stream=file.startWrite();stream.write(bytes);file.finishWrite(stream);stream=null;}finally{if(stream!=null)file.failWrite(stream);}
                            trim(context,dir);
                        }catch(Exception error){report(error);}
                    }
                }
            });
        }
    }
    static Session begin(Context c,Intent args){
        try{if(!c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean("wacchoiSearchHistory",true))return null;
            Session session=new Session(c,args);session.save();return session;
        }catch(Exception error){report(error);return null;}
    }
    static List<JSONObject> read(Context c)throws Exception{
        ArrayList<JSONObject> rows=new ArrayList<>();
        for(File file:files(directory(c))){
            if(file.length()>MAX_FILE)continue;
            try(InputStream in=new AtomicFile(file).openRead();ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] block=new byte[8192];int count;long total=0;while((count=in.read(block))!=-1){total+=count;if(total>MAX_FILE)throw new IOException("history size");out.write(block,0,count);}
                rows.add(new JSONObject(out.toString("UTF-8")));
            }catch(Exception e){report(e);}
        }
        rows.sort((a,b)->Long.compare(b.optLong("time"),a.optLong("time")));return rows;
    }
    private static File[] files(File dir){File[] list=dir.listFiles(f->f.getName().matches("[a-f0-9-]{36}\\.json"));return list==null?new File[0]:list;}
    static JSONObject readOne(Context c,String id)throws Exception{
        if(id==null||!id.matches("[a-f0-9-]{36}"))throw new IOException("履歴IDが不正です");
        try(InputStream in=new AtomicFile(new File(directory(c),id+".json")).openRead();ByteArrayOutputStream out=new ByteArrayOutputStream()){
            byte[] block=new byte[8192];int n;while((n=in.read(block))!=-1){if((long)out.size()+n>MAX_FILE)throw new IOException("history size");out.write(block,0,n);}
            return new JSONObject(out.toString("UTF-8"));
        }
    }
    private static void trim(Context c,File dir){File[] list=files(dir);Arrays.sort(list,(a,b)->Long.compare(b.lastModified(),a.lastModified()));long bytes=0;for(int i=0;i<list.length;i++){bytes+=list[i].length();if(i>=WacchoiStorageLimits.bound(c,0)||bytes>WacchoiStorageLimits.scaled(c,1,1024L*1024))new AtomicFile(list[i]).delete();}}
    interface Selected{void open(JSONObject data);}
    static String recordText(JSONObject r){return r.optString("a")+"\n"+r.optString("b")+"\n"+r.optString("c")+"\n"+r.optString("d");}
    private static String searchText(JSONObject r,String label){StringBuilder text=new StringBuilder(label).append('\n').append(r.optString("from")).append('\n').append(r.optString("to"));JSONArray records=r.optJSONArray("results");if(records!=null)for(int i=0;i<records.length();i++){JSONObject record=records.optJSONObject(i);if(record!=null)text.append('\n').append(recordText(record));}return text.toString();}
    static void show(Activity a,Selected selected){IO.execute(()->{try{
        List<JSONObject> rows=read(a);String[] labels=new String[rows.size()],texts=new String[rows.size()];
        for(int i=0;i<rows.size();i++){JSONObject r=rows.get(i);labels[i]=(r.optBoolean("edge")?(r.optInt("edgeMatchMode",0)==0?"ID ":r.optInt("edgeMatchMode",0)==1?"上4桁 ":"下4桁 "):(r.optBoolean("upper")?"上4桁 ":"下4桁 "))+r.optString("four")+"　"+(r.optBoolean("edge")?"エッヂ":r.optString("boards"))+"\n"+new SimpleDateFormat("yyyy/MM/dd HH:mm",Locale.JAPAN).format(new Date(r.optLong("time")))+"　"+r.optString("status");texts[i]=searchText(r,labels[i]);}
        a.runOnUiThread(()->{if(a.isFinishing()||a.isDestroyed())return;
            LinearLayout panel=new LinearLayout(a);panel.setOrientation(1);
            EditText input=new EditText(a);input.setSingleLine(true);input.setHint("4桁・板・ID・スレ名・保存本文を検索（空白区切りAND）");panel.addView(input);
            TextView count=new TextView(a);panel.addView(count);ListView list=new ListView(a);panel.addView(list,new LinearLayout.LayoutParams(-1,(int)(320*a.getResources().getDisplayMetrics().density)));
            ArrayList<JSONObject> visible=new ArrayList<>(rows);ArrayList<String> names=new ArrayList<>(Arrays.asList(labels));
            ArrayAdapter<String> adapter=new ArrayAdapter<>(a,android.R.layout.simple_list_item_multiple_choice,names);list.setAdapter(adapter);list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);count.setText("保存 "+rows.size()+"件");
            Set<String> checked=new HashSet<>();Switch selection=new Switch(a);selection.setText("チェックして削除する履歴を選択");panel.addView(selection);
            LinearLayout controls=new LinearLayout(a);panel.addView(controls);
            Button delete=new Button(a);delete.setText("選択を削除");delete.setEnabled(false);controls.addView(delete);
            Button all=new Button(a);all.setText("履歴を全削除");controls.addView(all);
            selection.setOnCheckedChangeListener((v,on)->{checked.clear();list.clearChoices();adapter.notifyDataSetChanged();delete.setEnabled(false);count.setText("該当 "+visible.size()+" / "+rows.size()+"件");});
            HaiagaruDialog dialog=new HaiagaruDialog.Builder(a).setTitle("4桁検索履歴・保存結果内検索").setView(panel).setNegativeButton("閉じる",null).create();
            list.setOnItemClickListener((p,v,i,id)->{JSONObject row=visible.get(i);
                if(selection.isChecked()){String key=row.optString("id");if(!checked.add(key))checked.remove(key);list.setItemChecked(i,checked.contains(key));delete.setEnabled(!checked.isEmpty());count.setText("選択 "+checked.size()+"件（非表示の選択を含む）");}
                else {list.clearChoices();dialog.dismiss();selected.open(row);}
            });
            delete.setOnClickListener(v->confirmDelete(a,dialog,selected,new HashSet<>(checked),false));
            all.setOnClickListener(v->confirmDelete(a,dialog,selected,Collections.emptySet(),true));
            input.addTextChangedListener(new TextWatcher(){int revision;
                public void beforeTextChanged(CharSequence s,int start,int n,int after){}
                public void onTextChanged(CharSequence s,int start,int before,int n){}
                public void afterTextChanged(Editable value){final int ticket=++revision;String query=value.toString();IO.execute(()->{
                    ArrayList<JSONObject> found=new ArrayList<>();ArrayList<String> foundNames=new ArrayList<>();
                    for(int i=0;i<rows.size();i++)if(WacchoiHistorySearch.matches(texts[i],query)){found.add(rows.get(i));foundNames.add(labels[i]);}
                    a.runOnUiThread(()->{if(ticket!=revision||!dialog.isShowing()||a.isFinishing()||a.isDestroyed())return;visible.clear();visible.addAll(found);adapter.clear();adapter.addAll(foundNames);adapter.notifyDataSetChanged();list.clearChoices();for(int i=0;i<visible.size();i++)list.setItemChecked(i,checked.contains(visible.get(i).optString("id")));count.setText("該当 "+found.size()+" / "+rows.size()+"件　選択 "+checked.size()+"件");});
                });}
            });dialog.show();});
    }catch(Exception e){report(e);}});}
    private static void confirmDelete(Activity a,HaiagaruDialog list,Selected selected,Set<String> ids,boolean all){
        if(!all&&ids.isEmpty())return;
        new HaiagaruDialog.Builder(a).setTitle(all?"検索履歴を全削除":"選択した履歴を削除")
                .setMessage((all?"検索条件にかかわらず、上／下4桁の全履歴と保存結果を削除します。":ids.size()+"件の履歴と保存結果を削除します。")+"検索用ページキャッシュは残します。削除は元に戻せません。実行中の検索の履歴も再作成されません。")
                .setNegativeButton("キャンセル",null).setPositiveButton("削除",(d,w)->{
                    IO.execute(()->{int failures=deleteNow(a,ids,all);a.runOnUiThread(()->{
                        if(a.isFinishing()||a.isDestroyed())return;list.dismiss();Toast.makeText(a,failures==0?"履歴を削除しました":failures+"件の削除に失敗しました",Toast.LENGTH_LONG).show();show(a,selected);
                    });});
                }).show();
    }
    static synchronized int deleteNow(Context context,Set<String> ids,boolean all){
        int failures=0;
        if(all){generation++;deletedSessions.clear();}
        else for(String id:ids)if(id.matches("[a-f0-9-]{36}"))deletedSessions.add(id);
        for(File file:files(directory(context))){String id=file.getName().substring(0,36);if(!all&&!ids.contains(id))continue;
            new AtomicFile(file).delete();if(file.exists()||new File(file.getPath()+".bak").exists())failures++;
        }
        return failures;
    }
    static void clear(Context c,boolean pages){IO.execute(()->{synchronized(WacchoiHistory.class){
        if(!pages){deleteNow(c,Collections.emptySet(),true);}
        else{for(File dir:new File[]{new File(c.getFilesDir(),"hissi-public-pages"),new File(c.getCacheDir(),"hissi-public-pages")}){File[] files=dir.listFiles(f->f.getName().matches("[a-f0-9]{64}\\.html"));if(files!=null)for(File file:files)file.delete();}}
    }});}
    private static void report(Exception e){android.util.Log.w("Haiagaru","Wacchoi search history",e);}
    private WacchoiHistory(){}
}
