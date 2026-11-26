package app.morphe.extension.chmate;

import android.app.*;import android.content.*;import android.database.Cursor;import android.database.sqlite.SQLiteDatabase;import android.net.Uri;import android.text.*;import android.widget.*;import java.io.*;import java.util.*;import org.json.*;

/** Native board navigation and user URL shortcuts share a searchable compact picker. */
public final class BoardUrlPicker {
    public static final int ACTION=0x7e484a31;static final String KEY="boardUrlShortcuts",STYLE="boardPickerDisplayStyle";
    private static final java.util.concurrent.ExecutorService UNREAD_IO=java.util.concurrent.Executors.newSingleThreadExecutor();
    interface UnreadCallback { void accept(Map<String,Integer> counts); }
    static final class Entry {final String name,url;final boolean custom,board;Entry(String n,String u,boolean c){this(n,u,c,!c);}Entry(String n,String u,boolean c,boolean b){name=n;url=u;custom=c;board=b;}}
    static String validUrl(String raw){try{Uri u=Uri.parse(raw.trim());if(!("http".equalsIgnoreCase(u.getScheme())||"https".equalsIgnoreCase(u.getScheme()))||u.getHost()==null||u.getUserInfo()!=null||raw.length()>4096)throw new IllegalArgumentException();return u.toString();}catch(Exception e){throw new IllegalArgumentException("http:// または https:// のURLを入力してください");}}
    static Entry manualEntry(String name,String address,boolean board){
        String url=board?BoardAddress.parse(address).url:validUrl(address);
        if(board&&threadUrl(url))throw new IllegalArgumentException("板のトップURLを入力してください（スレURLは指定できません）");
        String title=name==null?"":name.trim();if(title.length()>160)throw new IllegalArgumentException("表示名は160文字までです");
        return new Entry(title.isEmpty()?url:title,url,true,board);
    }
    static boolean validSaved(String value){try{JSONArray rows=new JSONArray(value);if(rows.length()>500)return false;for(int i=0;i<rows.length();i++){JSONObject row=rows.getJSONObject(i);if(row.getString("name").length()>160)return false;validUrl(row.getString("url"));}return true;}catch(Exception e){return false;}}
    static List<Entry> custom(Context c){List<Entry> result=new ArrayList<>();try{JSONArray rows=new JSONArray(FeatureSwitches.prefs(c).getString(KEY,"[]"));for(int i=0;i<rows.length();i++){JSONObject row=rows.getJSONObject(i);result.add(new Entry(row.getString("name"),validUrl(row.getString("url")),true,row.optBoolean("board",false)));}}catch(Exception ignored){}return result;}
    /** Read native unread counts off the UI thread; when a local DAT is available, apply the same NG matcher as notifications. */
    static Map<String,Integer> unreadCounts(Context context,List<Entry> entries){
        Map<String,Integer> result=new HashMap<>();if(context==null||entries==null||entries.isEmpty())return result;
        String version;try{version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;}catch(Exception unavailable){return result;}
        boolean middle=version.contains("226");
        try(SQLiteDatabase db=SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READONLY)){
            for(Entry entry:entries){
                if(entry.board)continue;
                try{
                    Uri uri=Uri.parse(validUrl(entry.url));Class<?> infoType=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,context.getClassLoader());
                    Object info=infoType.getMethod(version.contains("242")?"d":"c",String.class).invoke(null,uri.toString());if(info==null)continue;
                    String board=RefreshTargets.nativeBoard(info,version).toString();if(board.contains("/")||board.contains("\\")||board.contains(".."))continue;
                    long id=((Number)NativeFields.find(info.getClass(),middle?"c":"e").get(info)).longValue();if(id<=0)continue;
                    int total=0,read=0;boolean found=false;
                    try(Cursor row=db.rawQuery("SELECT MAX(res_count, server_res_count), read_count FROM bookmarks WHERE name=? AND created=? LIMIT 1",new String[]{board,Long.toString(id)})){
                        if(row.moveToFirst()){total=Math.max(0,row.getInt(0));read=Math.max(0,row.getInt(1));found=true;}
                    }
                    if(!found)continue;read=Math.min(read,total);int unread=Math.max(0,total-read);
                    ThreadWatchRules.Target target=ThreadWatchRules.target(entry.url);
                    if(unread>0&&target!=null&&NotificationNg.enabled(context)){
                        File datFile=new File(new File(HaiagaruSyncSnapshot.externalRoot(context),"dat"),board+"_"+id+".dat");
                        if(datFile.isFile()&&datFile.length()>0&&datFile.length()<=32L*1024*1024){
                            String charset=target.shitaraba?"EUC-JP":entry.url.contains("eddibb.cc/")||entry.url.contains("eddibb.net/")?"UTF-8":"MS932";
                            StringBuilder dat=new StringBuilder((int)Math.min(datFile.length(),1_000_000));
                            try(BufferedReader reader=new BufferedReader(NotificationDatText.reader(datFile,charset))){String line;while((line=reader.readLine())!=null){if(dat.length()+line.length()+1>32*1024*1024)throw new IOException("DAT text too large");dat.append(line).append('\n');}}
                            unread=NotificationNg.filter(context,target,dat.toString(),read,total).size();
                        }
                    }
                    result.put(entry.url,unread);
                }catch(Exception ignored){/* An unavailable mapping or cache leaves the shortcut visible without a badge. */}
            }
        }catch(Exception unavailable){android.util.Log.w("Haiagaru","Board shortcut unread counts unavailable",unavailable);}
        return result;
    }
    static void loadUnreadCounts(Context context,List<Entry> entries,UnreadCallback callback){
        Context app=context.getApplicationContext();UNREAD_IO.execute(()->{Map<String,Integer> counts=unreadCounts(app,entries);android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());main.post(()->callback.accept(counts));});
    }
    static void store(Context c,List<Entry> rows){JSONArray json=new JSONArray();try{for(Entry e:rows)json.put(new JSONObject().put("name",e.name).put("url",e.url).put("board",e.board));}catch(JSONException e){throw new IllegalArgumentException(e);}if(!validSaved(json.toString()))throw new IllegalArgumentException("追加URLは500件までです");FeatureSwitches.prefs(c).edit().putString(KEY,json.toString()).apply();}
    static List<Entry> boards(Context c)throws Exception{Map<String,Entry> result=new LinkedHashMap<>();SiteBoardGateway gateway=SiteBoardGateway.get(c);
        try(SQLiteDatabase db=SQLiteDatabase.openDatabase(c.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READONLY);Cursor rows=db.rawQuery("SELECT name,server,title FROM boards ORDER BY title",null)){
            while(rows.moveToNext()){try{String server=rows.getString(1),raw=rows.getString(0);if(server==null||raw==null)continue;String kind=SiteBoardVisibility.kind(server);if(kind!=null&&(!gateway.enabled()||!gateway.siteEnabled(kind)))continue;
                String name=java.net.URLDecoder.decode(raw,"UTF-8"),path=name.contains("/")?name.substring(name.indexOf('/')+1):name;
                String url=server.startsWith("127.0.0.1:")&&path.matches(SiteBoardGateway.KEY_PATTERN)?gateway.registrationUrl(path):"https://"+server+"/"+path+"/";
                BoardAddress address=BoardAddress.parse(url);if(!SiteBoardVisibility.visible(gateway,address.server,address.path))continue;String title=rows.getString(2);result.put(address.url,new Entry(title==null||title.isEmpty()?name:title,address.url,false));
            }catch(IllegalArgumentException ignored){}}
        }return new ArrayList<>(result.values());
    }
    public static void show(Activity a){if(a==null||a.isFinishing())return;if(FeatureSwitches.prefs(a).getInt(STYLE,1)==1)showSpinner(a);else BoardUrlPickerUi.show(a);}
    static void addSettings(LinearLayout root,Activity activity){
        Spinner style=Haiagaru.addSpinner(root,activity,"板・スレボタンの表示形式",new String[]{"ダイアログ","スピナー（小さなドロップダウン）"},FeatureSwitches.prefs(activity).getInt(STYLE,1));
        new LiveSettings(FeatureSwitches.prefs(activity),()->{}).choice(style,STYLE);
        Button manage=new Button(activity);manage.setText("板・スレの追加／編集");manage.setOnClickListener(v->BoardUrlPickerUi.show(activity));root.addView(manage);
    }
    private static void showSpinner(Activity a){
        int[] colors=HaiagaruUi.toolTabHeaderColors(a);float density=a.getResources().getDisplayMetrics().density;
        LinearLayout root=new LinearLayout(a);root.setOrientation(1);root.setPadding((int)(12*density),(int)(8*density),(int)(12*density),(int)(8*density));root.setBackgroundColor(colors[0]);
        EditText search=new EditText(a);search.setSingleLine(true);search.setHint("板・スレを検索");search.setTextColor(colors[1]);search.setHintTextColor((colors[1]&0xffffff)|0x99000000);root.addView(search);
        ListView list=new ListView(a);root.addView(list,new LinearLayout.LayoutParams(-1,0,1));Button edit=new Button(a);edit.setText("追加・編集…");root.addView(edit);
        List<Entry> shown=new ArrayList<>();Map<String,Integer> unread=new HashMap<>();ArrayAdapter<String> adapter=new ArrayAdapter<String>(a,android.R.layout.simple_list_item_1,new ArrayList<>()){@Override public android.view.View getView(int pos,android.view.View v,android.view.ViewGroup parent){TextView text=(TextView)super.getView(pos,v,parent);text.setTextColor(colors[1]);text.setMaxLines(2);return text;}};list.setAdapter(adapter);
        Runnable refresh=()->{String q=search.getText().toString().toLowerCase(Locale.ROOT);shown.clear();adapter.clear();for(Entry e:custom(a))if((e.name+" "+e.url).toLowerCase(Locale.ROOT).contains(q)){shown.add(e);Integer value=unread.get(e.url);int count=value==null?0:value;adapter.add(e.name+(count>0?"（新着"+count+"件）":""));}if(shown.isEmpty())adapter.add("登録なし（追加・編集から登録）");adapter.notifyDataSetChanged();};
        PopupWindow popup=new PopupWindow(root,Math.min((int)(a.getResources().getDisplayMetrics().widthPixels*.9f),(int)(320*density)),Math.min((int)(a.getResources().getDisplayMetrics().heightPixels*.55f),(int)(360*density)),true);
        popup.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(colors[0]));popup.setOutsideTouchable(true);popup.setElevation(12*density);popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NEEDED);popup.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN|android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        loadUnreadCounts(a,custom(a),counts->{unread.clear();unread.putAll(counts);if(popup.isShowing())refresh.run();});
        list.setOnItemClickListener((parent,v,i,id)->{if(i>=shown.size())return;Entry e=shown.get(i);try{a.startActivity(destination(a,e.url,!e.board));popup.dismiss();}catch(Exception error){Toast.makeText(a,"リンクを開けませんでした",Toast.LENGTH_LONG).show();}});
        edit.setOnClickListener(v->{popup.dismiss();BoardUrlPickerUi.show(a);});search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){refresh.run();}public void afterTextChanged(Editable e){}});
        root.setFocusableInTouchMode(true);root.requestFocus();refresh.run();
        android.view.View anchor=a.findViewById(ACTION);
        if(anchor!=null&&anchor.isShown())popup.showAsDropDown(anchor);else popup.showAtLocation(a.getWindow().getDecorView(),android.view.Gravity.TOP|android.view.Gravity.END,(int)(12*density),(int)(64*density));
    }
    static boolean threadUrl(String address){
        Uri u=Uri.parse(address);String path=u.getPath();if(path==null)return false;
        return path.matches(".*/(?:test|bbs)/read\\.cgi/.*")||path.matches("/boards/[^/]+/[0-9]{9,}(?:/.*)?")
            ||path.matches(".*/res/[0-9]+\\.html?")||path.matches("/[^/]+/[0-9]{9,}/?");
    }
    static Intent destination(Context c,String url,boolean custom){
        String address=validUrl(url);
        String local=SiteNativeBoards.localUrl(address);if(local!=null)address=local;
        Uri uri=OpenUrlActivity.normalizeEdge(Uri.parse(address));
        Intent intent=new Intent(Intent.ACTION_VIEW,uri);
        try{
            String version=c.getPackageManager().getPackageInfo(c.getPackageName(),0).versionName;
            Class<?> type=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,c.getClassLoader());
            Object parsed=type.getMethod(version.contains("242")?"d":"c",String.class).invoke(null,uri.toString());
            if(parsed!=null){
                java.lang.reflect.Field id=type.getDeclaredField(version.contains("226")?"c":"e");id.setAccessible(true);Object created=id.get(parsed);
                intent.setClassName(c,created==null?"jp.syoboi.a2chMate.activity.ThreadListActivity":"jp.syoboi.a2chMate.activity.ResListActivity");
                return intent;
            }
        }catch(Exception error){android.util.Log.w("Haiagaru","Shortcut native URL classification unavailable",error);}
        if(!custom)intent.setClassName(c,"jp.syoboi.a2chMate.activity.ThreadListActivity");
        else if(threadUrl(url))intent.setClass(c,OpenUrlActivity.class);
        else intent.setClassName(c,"jp.syoboi.a2chMate.activity.WebViewActivity");
        return intent;
    }
    private BoardUrlPicker(){}
}
