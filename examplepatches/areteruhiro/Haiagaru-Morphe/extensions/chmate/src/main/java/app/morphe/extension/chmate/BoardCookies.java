package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import org.json.*;

/** Opt-in partition around native HTTP's cookie interceptor. The original jar remains untouched. */
public final class BoardCookies {
    static final String KEY="boardCookiesEnabled";
    private static final java.util.concurrent.ExecutorService AUTH_IO=java.util.concurrent.Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Haiagaru-cookie-check");t.setDaemon(true);return t;});
    private static volatile Context context;
    private static volatile long generation;
    private static final ConcurrentHashMap<String,Long> BOARD_REVISIONS=new ConcurrentHashMap<>();
    private static final Object[] BOARD_LOCKS=new Object[32];
    static{for(int i=0;i<BOARD_LOCKS.length;i++)BOARD_LOCKS[i]=new Object();}
    private static final ConcurrentHashMap<String,CachedJar> CACHED_JARS=new ConcurrentHashMap<>();
    private static final int MAX_CACHED_JARS=24;
    private static final class CachedCookie {
        final Object cookie;final String wire;final long expires;
        CachedCookie(Object cookie,String wire,long expires){this.cookie=cookie;this.wire=wire;this.expires=expires;}
    }
    private static final class CachedJar {
        final long epoch,revision;final List<String> wire;final List<CachedCookie> cookies;
        CachedJar(long epoch,long revision,List<String> wire,List<CachedCookie> cookies){
            this.epoch=epoch;this.revision=revision;this.wire=Collections.unmodifiableList(wire);
            this.cookies=Collections.unmodifiableList(cookies);
        }
    }
    private static final ThreadLocal<Scope> CURRENT=new ThreadLocal<>();
    private static final Map<MenuItem,String> MENUS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<MenuItem,java.lang.ref.WeakReference<Activity>> OWNERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<MenuItem,CharSequence> TITLES=Collections.synchronizedMap(new WeakHashMap<>());
    private static String authBoard;
    private static long authRevision,authGeneration;
    private static java.lang.ref.WeakReference<Activity> authOwner=new java.lang.ref.WeakReference<>(null);
    private static final class Scope{final String board;final long revision;final long epoch;Scope(String board){this.board=board;epoch=generation;revision=revision(board);}}
    private static Object boardLock(String board){return BOARD_LOCKS[(board.hashCode()&0x7fffffff)%BOARD_LOCKS.length];}
    private static long revision(String board){
        if(!optimizedReads())return prefs().getLong("revision:"+board,0);
        Long known=BOARD_REVISIONS.get(board);if(known!=null)return known;
        long loaded=prefs().getLong("revision:"+board,0);Long previous=BOARD_REVISIONS.putIfAbsent(board,loaded);return previous==null?loaded:previous;
    }
    private static void rememberRevision(String board,long value){
        if(!optimizedReads()){BOARD_REVISIONS.remove(board);return;}
        BOARD_REVISIONS.put(board,value);
        if(BOARD_REVISIONS.size()>MAX_CACHED_JARS)for(String key:BOARD_REVISIONS.keySet())
            if(!key.equals(board)&&BOARD_REVISIONS.size()>MAX_CACHED_JARS)BOARD_REVISIONS.remove(key);
    }
    private static void invalidate(String board){CACHED_JARS.remove(board);}
    private static boolean optimizedReads(){Context c=context;return c!=null&&SettingsProfiles.prefs(c).getBoolean(ExpertSettings.BOARD_COOKIES,true);}
    private static boolean optimizedAuthUi(){Context c=context;return c!=null&&SettingsProfiles.prefs(c).getBoolean(ExpertSettings.COOKIE_AUTH_UI,true);}
    private BoardCookies(){}
    static void initialize(Context c){
        context=c.getApplicationContext();
        // Reinitialization follows the same boundary as preference/profile restoration.
        CACHED_JARS.clear();BOARD_REVISIONS.clear();
    }
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
    static List<?> loadBoard(String raw,List<?> original,Object url){
        String board=BoardCookiePolicy.board(raw,null);if(!enabled()||board==null)return original;
        return optimizedReads()?loadCached(board,original,url):loadUncached(board,original,url);
    }
    private static synchronized List<?> loadUncached(String board,List<?> original,Object url){
        String key="jar:"+board;
        try{
            if(!prefs().contains(key))store(board,Collections.emptyList(),false);
            ArrayList<Object> result=new ArrayList<>();JSONArray saved=new JSONArray(prefs().getString(key,"[]"));long now=System.currentTimeMillis();
            for(int i=0;i<saved.length();i++){Object cookie=ExternalBoardAuth.parseCookie(url,saved.getString(i));
                if(cookie!=null&&expires(cookie)>now&&matches(cookie,url))result.add(cookie);}
            return result;
        }catch(Exception error){throw new IllegalStateException("Board cookie storage unavailable",error);}
    }
    private static List<?> loadCached(String board,List<?> original,Object url){
        synchronized(boardLock(board)){
            long epoch=generation,rev=revision(board);CachedJar jar=CACHED_JARS.get(board);
            if(jar==null||jar.epoch!=epoch||jar.revision!=rev){
                String key="jar:"+board;
                try{
                    if(!prefs().contains(key))store(board,Collections.emptyList(),false);
                    JSONArray saved=new JSONArray(prefs().getString(key,"[]"));ArrayList<String> wire=new ArrayList<>();
                    ArrayList<CachedCookie> cookies=new ArrayList<>();
                    for(int i=0;i<saved.length();i++){
                        String value=saved.getString(i);wire.add(value);Object cookie=ExternalBoardAuth.parseCookie(url,value);
                        if(cookie!=null)cookies.add(new CachedCookie(cookie,value,expires(cookie)));
                    }
                    jar=new CachedJar(epoch,rev,wire,cookies);CACHED_JARS.put(board,jar);trimCache(board);
                }catch(Exception error){throw new IllegalStateException("Board cookie storage unavailable",error);}
            }
            long now=System.currentTimeMillis();ArrayList<Object> result=new ArrayList<>();
            for(CachedCookie cookie:jar.cookies)if(cookie.expires>now&&BoardCookiePolicy.matches(cookie.wire,url.toString()))result.add(cookie.cookie);
            return result;
        }
    }
    private static void trimCache(String keep){
        if(CACHED_JARS.size()<=MAX_CACHED_JARS)return;
        for(String key:CACHED_JARS.keySet())if(!key.equals(keep)&&CACHED_JARS.size()>MAX_CACHED_JARS){CACHED_JARS.remove(key);BOARD_REVISIONS.remove(key);}
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
            synchronized(boardLock(board)){
                store(board,selected,false);
                String key="revision:"+board;long next=revision(board)+1;
                if(!prefs().edit().putLong(key,next).commit())throw new IOException("Cookie割り当てを保存できません");
                rememberRevision(board,next);invalidate(board);
            }
            return selected.size();
        }catch(InvocationTargetException error){throw new IllegalStateException("共通Cookieを読み込めません",error.getCause());}
        catch(Exception error){throw new IllegalStateException("共通Cookieを読み込めません",error);}
    }
    public static boolean save(Object url,List<?> cookies){
        if(!optimizedReads())synchronized(BoardCookies.class){return saveScoped(CURRENT.get(),url,cookies);}
        Scope scope=CURRENT.get();if(scope==null)return false;
        synchronized(boardLock(scope.board)){return saveScoped(scope,url,cookies);}
    }
    private static boolean saveScoped(Scope scope,Object url,List<?> cookies){
        if(!enabled()||scope==null)return false;
        if(scope.epoch!=generation||revision(scope.board)!=scope.revision)return true;
        if(!BoardCookiePolicy.sameServer(scope.board,url.toString()))return true;
        store(scope.board,cookies,true);return true;
    }
    private static void store(String board,List<?> cookies,boolean merge){
        synchronized(boardLock(board)){
            try{
                LinkedHashMap<String,String> values=new LinkedHashMap<>();
                if(merge){
                    CachedJar cached=CACHED_JARS.get(board);
                    if(optimizedReads()&&cached!=null&&cached.epoch==generation&&cached.revision==revision(board))
                        for(String value:cached.wire)values.put(BoardCookiePolicy.cookieKey(value),value);
                    else{JSONArray old=new JSONArray(prefs().getString("jar:"+board,"[]"));for(int i=0;i<old.length();i++)values.put(BoardCookiePolicy.cookieKey(old.getString(i)),old.getString(i));}
                }
                long now=System.currentTimeMillis();
                for(Object cookie:cookies){String value=cookie.toString(),key=BoardCookiePolicy.cookieKey(value);
                    if(expires(cookie)<=now)values.remove(key);else values.put(key,value);}
                JSONArray result=new JSONArray();for(String value:values.values())result.put(value);
                if(!prefs().edit().putString("jar:"+board,result.toString()).commit())throw new IOException("Cookie save failed");
                invalidate(board);
            }catch(Exception error){throw new IllegalStateException("Board cookie save failed",error);}
        }
    }
    // Backup restoration must invalidate requests/auth windows started before it.
    static synchronized void restored(){generation++;authBoard=null;CACHED_JARS.clear();BOARD_REVISIONS.clear();}
    static synchronized void clear(String raw){
        String board=BoardCookiePolicy.board(raw,null);if(board==null)throw new IllegalArgumentException("Invalid board");
        synchronized(boardLock(board)){
            // Keep a tombstone: a cleared board must not inherit the shared jar again.
            long next=revision(board)+1;
            if(!prefs().edit().putString("jar:"+board,"[]").putLong("revision:"+board,next).commit())
                throw new IllegalStateException("Cookie delete failed");
            rememberRevision(board,next);invalidate(board);
        }
    }
    static synchronized boolean beginAuth(Activity activity){
        if(!enabled())return true;Activity previous=authOwner.get();
        if(previous!=null&&previous!=activity&&!previous.isFinishing()&&!previous.isDestroyed())return false;
        authOwner=new java.lang.ref.WeakReference<>(activity);return true;
    }
    static synchronized void endAuth(Activity activity){if(authOwner.get()==activity){authOwner.clear();authBoard=null;}}
    static void prepareBrowser(Activity activity,String board,String address,Runnable ready){
        if(!enabled()){ready.run();return;}
        synchronized(BoardCookies.class){authBoard=BoardCookiePolicy.board(board,null);authRevision=authBoard==null?0:revision(authBoard);authGeneration=generation;}
        if(optimizedAuthUi()){
            AUTH_IO.execute(()->{
                final ArrayList<String[]> removals;
                try{removals=browserRemovals(board,address);}
                catch(RuntimeException error){activity.runOnUiThread(()->authPreparationFailed(activity,error));return;}
                activity.runOnUiThread(()->{
                    if(activity.isFinishing()||activity.isDestroyed())return;
                    synchronized(BoardCookies.class){
                        if(authGeneration!=generation||!Objects.equals(authBoard,BoardCookiePolicy.board(board,null))
                                ||authBoard==null||revision(authBoard)!=authRevision){
                            authPreparationFailed(activity,new IllegalStateException("Cookie state changed during preparation"));return;
                        }
                    }
                    removeBrowser(removals,0,ready);
                });
            });
            return;
        }
        removeBrowser(browserRemovals(board,address),0,ready);
    }
    private static ArrayList<String[]> browserRemovals(String board,String address){
        ArrayList<String[]> removals=new ArrayList<>();
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
        return removals;
    }
    private static void authPreparationFailed(Activity activity,RuntimeException error){
        android.util.Log.w("HaiagaruBoardCookies","Authentication cookie preparation failed",error);
        if(activity.isFinishing()||activity.isDestroyed())return;
        new HaiagaruDialog.Builder(activity).setTitle("認証を準備できません")
                .setMessage("Cookieの確認に失敗しました。前の画面に戻ってから再試行してください。")
                .setPositiveButton("閉じる",(dialog,which)->activity.finish()).show();
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
            if(canonical==null||authGeneration!=generation||!canonical.equals(authBoard)||revision(canonical)!=authRevision)return;
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
