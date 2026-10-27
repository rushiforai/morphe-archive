package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import org.json.*;

/** Opt-in partition around native HTTP's cookie interceptor. The original jar remains untouched. */
public final class BoardCookies {
    static final String KEY="boardCookiesEnabled";
    private static volatile Context context;
    private static volatile long generation;
    private static final ThreadLocal<Scope> CURRENT=new ThreadLocal<>();
    private static final Map<MenuItem,String> MENUS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<MenuItem,java.lang.ref.WeakReference<Activity>> OWNERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<MenuItem,CharSequence> TITLES=Collections.synchronizedMap(new WeakHashMap<>());
    private static String authBoard;
    private static long authRevision,authGeneration;
    private static java.lang.ref.WeakReference<Activity> authOwner=new java.lang.ref.WeakReference<>(null);
    private static final class Scope{final String board;final long revision;final long epoch;Scope(String board){this.board=board;epoch=generation;revision=prefs().getLong("revision:"+board,0);}}
    private BoardCookies(){}
    static void initialize(Context c){context=c.getApplicationContext();}
    public static boolean enabled(){Context c=context;return c!=null&&SettingsProfiles.prefs(c).getBoolean(KEY,false);}
    static boolean active(){return enabled()&&CURRENT.get()!=null;}
    private static SharedPreferences prefs(){return context.getSharedPreferences("haiagaru.board-cookies",0);}
    public static Object requestFromChain(Object chain){return null;} // Bound to native Chain.request at patch time.
    public static Object nativeIntercept(Object bridge,Object chain)throws IOException{throw new IOException("Native cookie interceptor unavailable");}
    public static boolean matches(Object cookie,Object url){return BoardCookiePolicy.matches(cookie.toString(),url.toString());}
    public static long expires(Object cookie){return 0;} // Bound to Cookie.expiresAt.
    public static Object intercept(Object bridge,Object chain)throws IOException{
        Scope before=CURRENT.get();
        try{
            if(enabled()){
                String board=BoardCookieRequest.board(requestFromChain(chain));
                // Unknown targets use the unchanged native jar, as requested.
                if(board!=null)CURRENT.set(new Scope(board));else CURRENT.remove();
            }else CURRENT.remove();
            return nativeIntercept(bridge,chain);
        }catch(IOException error){throw error;}
        catch(Exception error){throw new IOException("Board cookie scope unavailable",error);}
        finally{if(before==null)CURRENT.remove();else CURRENT.set(before);}
    }
    public static List<?> load(List<?> original,Object url){
        Scope scope=CURRENT.get();return enabled()&&scope!=null?loadBoard(scope.board,original,url):original;
    }
    static synchronized List<?> loadBoard(String raw,List<?> original,Object url){
        String board=BoardCookiePolicy.board(raw,null);if(!enabled()||board==null)return original;
        String key="jar:"+board;
        try{
            if(!prefs().contains(key))store(board,Collections.emptyList(),false);
            ArrayList<Object> result=new ArrayList<>();JSONArray saved=new JSONArray(prefs().getString(key,"[]"));long now=System.currentTimeMillis();
            for(int i=0;i<saved.length();i++){Object cookie=ExternalBoardAuth.parseCookie(url,saved.getString(i));
                if(cookie!=null&&expires(cookie)>now&&matches(cookie,url))result.add(cookie);}
            return result;
        }catch(Exception error){throw new IllegalStateException("Board cookie storage unavailable",error);}
    }
    static List<?> authCookies(String board,List<?> original,Object url){return enabled()?loadBoard(board,original,url):original;}
    static synchronized int importShared(String address){
        String board=BoardCookiePolicy.board(address,null);
        if(board==null)throw new IllegalArgumentException("板URLから板を特定できません");
        try{
            Object jar=ExternalBoardAuth.nativeJar();
            Object url=ExternalBoardAuth.parseUrl(address);
            if(jar==null||url==null)throw new IOException("Cookie保存先を読み込めません。板を一度開いてから再試行してください。");
            java.lang.reflect.Method read=jar.getClass().getDeclaredMethod("haiagaruNativeAuthCookies",url.getClass());
            read.setAccessible(true);
            List<?> shared=(List<?>)read.invoke(jar,url);
            ArrayList<Object> selected=new ArrayList<>();long now=System.currentTimeMillis();
            for(Object cookie:shared)if(expires(cookie)>now&&matches(cookie,url))selected.add(cookie);
            store(board,selected,false);
            String key="revision:"+board;
            if(!prefs().edit().putLong(key,prefs().getLong(key,0)+1).commit())throw new IOException("Cookie割り当てを保存できません");
            return selected.size();
        }catch(InvocationTargetException error){throw new IllegalStateException("共通Cookieを読み込めません",error.getCause());}
        catch(Exception error){throw new IllegalStateException("共通Cookieを読み込めません",error);}
    }
    public static synchronized boolean save(Object url,List<?> cookies){
        Scope scope=CURRENT.get();if(!enabled()||scope==null)return false;
        if(scope.epoch!=generation||prefs().getLong("revision:"+scope.board,0)!=scope.revision)return true;
        if(!BoardCookiePolicy.sameServer(scope.board,url.toString()))return true;
        store(scope.board,cookies,true);return true;
    }
    private static void store(String board,List<?> cookies,boolean merge){
        try{
            LinkedHashMap<String,String> values=new LinkedHashMap<>();
            if(merge){JSONArray old=new JSONArray(prefs().getString("jar:"+board,"[]"));for(int i=0;i<old.length();i++)values.put(BoardCookiePolicy.cookieKey(old.getString(i)),old.getString(i));}
            long now=System.currentTimeMillis();
            for(Object cookie:cookies){String value=cookie.toString(),key=BoardCookiePolicy.cookieKey(value);
                if(expires(cookie)<=now)values.remove(key);else values.put(key,value);}
            JSONArray result=new JSONArray();for(String value:values.values())result.put(value);
            if(!prefs().edit().putString("jar:"+board,result.toString()).commit())throw new IOException("Cookie save failed");
        }catch(Exception error){throw new IllegalStateException("Board cookie save failed",error);}
    }
    // Backup restoration must invalidate requests/auth windows started before it.
    static synchronized void restored(){generation++;authBoard=null;}
    static synchronized void clear(String raw){
        String board=BoardCookiePolicy.board(raw,null);if(board==null)throw new IllegalArgumentException("Invalid board");
        // Keep a tombstone: a cleared board must not inherit the shared jar again.
        if(!prefs().edit().putString("jar:"+board,"[]").putLong("revision:"+board,prefs().getLong("revision:"+board,0)+1).commit())
            throw new IllegalStateException("Cookie delete failed");
    }
    static synchronized boolean beginAuth(Activity activity){
        if(!enabled())return true;Activity previous=authOwner.get();
        if(previous!=null&&previous!=activity&&!previous.isFinishing()&&!previous.isDestroyed())return false;
        authOwner=new java.lang.ref.WeakReference<>(activity);return true;
    }
    static synchronized void endAuth(Activity activity){if(authOwner.get()==activity){authOwner.clear();authBoard=null;}}
    static void prepareBrowser(Activity activity,String board,String address,Runnable ready){
        if(!enabled()){ready.run();return;}
        synchronized(BoardCookies.class){authBoard=BoardCookiePolicy.board(board,null);authRevision=prefs().getLong("revision:"+authBoard,0);authGeneration=generation;}
        // WebView's cookie store is shared. Only one auth window may hold this lease;
        // native cookies in other board partitions never read back from that store.
        ArrayList<String[]> removals=new ArrayList<>();
        try{
            java.net.URI uri=java.net.URI.create(board);String host=uri.getHost();
            LinkedHashSet<String> names=new LinkedHashSet<>();
            for(String url:new String[]{board,address}){
                String header=android.webkit.CookieManager.getInstance().getCookie(url);
                if(header!=null)for(String pair:header.split(";"))names.add(pair.trim().split("=",2)[0]);
            }
            ArrayList<String> domains=new ArrayList<>();domains.add(null);String domain=host;
            while(domain.contains(".")){domains.add(domain);domain=domain.substring(domain.indexOf('.')+1);}
            for(String name:names)for(String target:domains)for(String path:new String[]{"/",uri.getPath(),"/test","/test/"})
                removals.add(new String[]{board,name+"=; Max-Age=0; Path="+path+(target==null?"":"; Domain="+target)});
        }catch(RuntimeException error){throw new IllegalStateException("Board authentication cookie reset failed",error);}
        removeBrowser(removals,0,ready);
    }
    private static void removeBrowser(List<String[]> removals,int index,Runnable ready){
        if(index>=removals.size()){ready.run();return;}
        String[] entry=removals.get(index);
        android.webkit.CookieManager.getInstance().setCookie(entry[0],entry[1],accepted->removeBrowser(removals,index+1,ready));
    }
    static void importAuth(String board,String address){
        if(!enabled()||board==null||!BoardCookiePolicy.sameServer(board,address))return;
        String header=android.webkit.CookieManager.getInstance().getCookie(address);if(header==null)return;
        Object url=ExternalBoardAuth.parseUrl(address);if(url==null)return;ArrayList<Object> received=new ArrayList<>();
        for(String pair:header.split(";")){Object cookie=ExternalBoardAuth.parseCookie(url,pair.trim()+"; Path=/");if(cookie!=null)received.add(cookie);}
        synchronized(BoardCookies.class){
            String canonical=BoardCookiePolicy.board(board,null);
            if(canonical==null||authGeneration!=generation||!canonical.equals(authBoard)||prefs().getLong("revision:"+canonical,0)!=authRevision)return;
            store(canonical,received,true);
        }
    }
    static void decorateMenu(Object owner,Menu menu){
        String board=enabled()?ExternalBoardAuth.targetBoard(owner):null;
        for(int i=0;i<menu.size();i++){
            MenuItem item=menu.getItem(i);String title=String.valueOf(item.getTitle());
            boolean candidate=TITLES.containsKey(item)||title.matches("(?i).*(?:クッキー.*削除|cookie.*(?:削除|clear|delete)|(?:clear|delete).*cookie).*");
            if(!candidate)continue;
            if(board==null){
                MENUS.remove(item);OWNERS.remove(item);CharSequence original=TITLES.get(item);if(original!=null)item.setTitle(original);
            }else{
                if(!TITLES.containsKey(item))TITLES.put(item,item.getTitle());
                MENUS.put(item,board);OWNERS.put(item,new java.lang.ref.WeakReference<>(ExternalBoardAuth.activity(owner)));item.setTitle("この板のCookieを削除…");
                // Keep the native listener: the existing dispatcher hook handles this item.
            }
        }
    }
    static boolean handleActivityMenu(MenuItem item){
        java.lang.ref.WeakReference<Activity> owner=OWNERS.get(item);
        return owner!=null&&owner.get()!=null&&handleMenu(owner.get(),item);
    }
    static boolean handleMenu(Object owner,MenuItem item){
        String board=MENUS.get(item);if(board==null||!enabled())return false;
        Activity activity=ExternalBoardAuth.activity(owner);if(activity==null)return true;confirmDelete(activity,board);return true;
    }
    private static void confirmDelete(Activity activity,String board){
        new HaiagaruDialog.Builder(activity).setTitle("この板のCookieを削除")
                .setMessage(board+"\nこの板の認証が解除される場合があります。他の板のCookieは削除しません。")
                .setNegativeButton("キャンセル",null).setPositiveButton("削除",(d,w)->{
                    try{clear(board);Toast.makeText(activity,"この板のCookieを削除しました",Toast.LENGTH_SHORT).show();}
                    catch(RuntimeException failure){Toast.makeText(activity,"Cookieを削除できませんでした",Toast.LENGTH_LONG).show();}
                }).show();
    }
    static void addSettings(LinearLayout root,Activity activity){
        TextView help=new TextView(activity);
        help.setText("板別管理をオンにすると、既存の共通Cookieは自動ではコピーされません。必要な板のURLを指定して共通Cookieを割り当ててください。復元済みの板別Cookieはそのまま使われます。");
        root.addView(help);
        Button assign=new Button(activity);assign.setAllCaps(false);assign.setText("Cookieに合う板を探して割り当て");root.addView(assign);
        assign.setOnClickListener(v->findImportCandidates(activity));
        Button button=new Button(activity);button.setAllCaps(false);button.setText("板別Cookie管理");root.addView(button);
        button.setOnClickListener(v->{
            ArrayList<String> boards=new ArrayList<>();for(String key:prefs().getAll().keySet())if(key.startsWith("jar:"))boards.add(key.substring(4));Collections.sort(boards);
            if(boards.isEmpty()){new HaiagaruDialog.Builder(activity).setTitle("板別Cookie管理").setMessage("板別管理をオンにしてアクセスした板が表示されます。共通Cookieを移す場合は、先に板URLを指定してください。").setPositiveButton("閉じる",null).show();return;}
            new HaiagaruDialog.Builder(activity).setTitle("管理する板").setItems(boards.toArray(new String[0]),(d,index)->{
                String board=boards.get(index);ArrayList<String> names=new ArrayList<>();
                try{JSONArray cookies=new JSONArray(prefs().getString("jar:"+board,"[]"));for(int i=0;i<cookies.length();i++)names.add(cookies.getString(i).split("=",2)[0]);}catch(Exception ignored){}
                new HaiagaruDialog.Builder(activity).setTitle(board).setMessage("保存済みCookie: "+names.size()+"件\n"+android.text.TextUtils.join("\n",names)+"\nCookieの値は表示しません。")
                        .setNegativeButton("閉じる",null).setPositiveButton("この板のCookieを削除",(dialog,w)->confirmDelete(activity,board)).show();
            }).setNegativeButton("閉じる",null).show();
        });
    }
    private static final class ImportBoard{
        final String title,url;final int count;
        ImportBoard(String title,String url,int count){this.title=title==null||title.trim().isEmpty()?url:title;this.url=url;this.count=count;}
    }
    private static void findImportCandidates(Activity activity){
        new Thread(()->{
            ArrayList<ImportBoard> matches=new ArrayList<>();
            try{
                Object jar=ExternalBoardAuth.nativeJar();
                if(jar!=null)try(android.database.sqlite.SQLiteDatabase db=android.database.sqlite.SQLiteDatabase.openDatabase(
                        activity.getDatabasePath("roidon.sqlite").getPath(),null,android.database.sqlite.SQLiteDatabase.OPEN_READONLY);
                    android.database.Cursor rows=db.rawQuery("SELECT name,server,title FROM boards ORDER BY title LIMIT 2000",null)){
                    java.lang.reflect.Method read=null;
                    while(rows.moveToNext()){
                        String id=java.net.URLDecoder.decode(rows.getString(0),"UTF-8");
                        String path=id.contains("/")?id.substring(id.indexOf('/')+1):id;
                        String url="https://"+rows.getString(1)+"/"+path+"/";
                        String board=BoardCookiePolicy.board(url,null);if(board==null)continue;
                        Object nativeUrl=ExternalBoardAuth.parseUrl(url);if(nativeUrl==null)continue;
                        if(read==null){read=jar.getClass().getDeclaredMethod("haiagaruNativeAuthCookies",nativeUrl.getClass());read.setAccessible(true);}
                        List<?> cookies=(List<?>)read.invoke(jar,nativeUrl);
                        if(!cookies.isEmpty())matches.add(new ImportBoard(rows.getString(2),url,cookies.size()));
                    }
                }
            }catch(Exception failure){android.util.Log.w("HaiagaruBoardCookies","Board cookie candidates unavailable",failure);}
            ArrayList<ImportBoard> found=matches;
            activity.runOnUiThread(()->showImportCandidates(activity,found));
        },"Haiagaru-cookie-board-candidates").start();
    }
    private static void showImportCandidates(Activity activity,ArrayList<ImportBoard> boards){
        if(activity.isFinishing()||activity.isDestroyed())return;
        LinearLayout content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);
        EditText search=new EditText(activity);search.setSingleLine(true);search.setHint("板名・URLで検索");content.addView(search);
        TextView count=new TextView(activity);content.addView(count);
        TextView empty=new TextView(activity);empty.setText("一致する板がありません。");content.addView(empty);
        ListView list=new ListView(activity);
        int height=Math.round(300*activity.getResources().getDisplayMetrics().density);
        content.addView(list,new LinearLayout.LayoutParams(-1,height));
        ArrayList<ImportBoard> visible=new ArrayList<>();
        ArrayList<String> labels=new ArrayList<>();
        ArrayAdapter<String> adapter=new ArrayAdapter<>(activity,android.R.layout.simple_list_item_1,labels);
        list.setAdapter(adapter);
        Runnable filter=()->{
            String query=search.getText().toString().trim().toLowerCase(Locale.ROOT);
            visible.clear();labels.clear();
            for(ImportBoard board:boards){
                if(!query.isEmpty()&&!board.title.toLowerCase(Locale.ROOT).contains(query)
                        &&!board.url.toLowerCase(Locale.ROOT).contains(query))continue;
                visible.add(board);labels.add(board.title+"（Cookie "+board.count+"件）\n"+board.url);
            }
            adapter.notifyDataSetChanged();
            count.setText(visible.size()+" / "+boards.size()+"件");
            empty.setVisibility(visible.isEmpty()?View.VISIBLE:View.GONE);
            list.setVisibility(visible.isEmpty()?View.GONE:View.VISIBLE);
        };
        search.addTextChangedListener(new android.text.TextWatcher(){
            public void beforeTextChanged(CharSequence s,int start,int before,int after){}
            public void onTextChanged(CharSequence s,int start,int before,int count){filter.run();}
            public void afterTextChanged(android.text.Editable value){}
        });
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("既存Cookieを割り当てる板")
                .setView(content).setNeutralButton("URLを指定",(d,w)->showImportDialog(activity))
                .setNegativeButton("閉じる",null).create();
        list.setOnItemClickListener((parent,view,position,id)->{
            if(position<0||position>=visible.size())return;
            ImportBoard selected=visible.get(position);
            dialog.dismissForNavigation(()->confirmImport(activity,selected));
        });
        filter.run();dialog.show();
    }
    private static void confirmImport(Activity activity,ImportBoard board){
        new HaiagaruDialog.Builder(activity).setTitle("Cookieをこの板へ割り当て")
                .setMessage(board.title+"\n"+board.url+"\n\nこのURLで有効な共通Cookieを板別保存へコピーします。すでに割り当て済みのCookieは置き換わります。")
                .setNegativeButton("キャンセル",null).setPositiveButton("割り当て",(d,w)->{
                    new Thread(()->{
                        try{int count=importShared(board.url);activity.runOnUiThread(()->Toast.makeText(activity,count+"件のCookieを板へ割り当てました",Toast.LENGTH_LONG).show());}
                        catch(RuntimeException error){activity.runOnUiThread(()->Toast.makeText(activity,"Cookieを割り当てできませんでした。もう一度お試しください。",Toast.LENGTH_LONG).show());}
                    },"Haiagaru-board-cookie-import").start();
                }).show();
    }
    private static void showImportDialog(Activity activity){
        EditText input=new EditText(activity);input.setSingleLine(true);input.setHint("例: https://egg.5ch.io/liveedge/");
        new HaiagaruDialog.Builder(activity).setTitle("割り当て先の板URL")
                .setMessage("そのURLで有効な共通Cookieを指定した板へコピーします。保存済みの板別Cookieは置き換わります。Cookieの値は画面に表示しません。")
                .setView(input).setNegativeButton("キャンセル",null).setPositiveButton("この板へ割り当て",(d,w)->{
                    String address=input.getText().toString().trim();String board=BoardCookiePolicy.board(address,null);
                    if(board==null){Toast.makeText(activity,"板URLを確認してください",Toast.LENGTH_LONG).show();return;}
                    confirmImport(activity,new ImportBoard(board,address,-1));
                }).show();
    }
}
