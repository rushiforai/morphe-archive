package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.webkit.CookieManager;
import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;
import org.json.*;
import org.jsoup.Jsoup;

/** Opt-in loopback transport for ChMate's standard subject/DAT/posting reader. */
final class SiteBoardGateway {
    static final String PREFS="haiagaru.site-boards";
    static final String KEY_PATTERN="h(?:[bfa])?[a-f0-9]{32}";
    private static SiteBoardGateway instance;
    final SharedPreferences prefs;final Transport transport;
    final Map<String,SiteBoardProtocol.Board> boards=new ConcurrentHashMap<>();
    final Map<String,String> names=new ConcurrentHashMap<>();
    final Map<String,String> folders=new ConcurrentHashMap<>();
    private final Map<String,String> newsSources=Collections.synchronizedMap(new LinkedHashMap<>());
    private final Map<String,String> animanchCategories=Collections.synchronizedMap(new LinkedHashMap<String,String>(256,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>4096;}
    });
    private final Map<String,Pattern> sitePatterns=new HashMap<>();
    private final Map<String,String> images=Collections.synchronizedMap(new LinkedHashMap<String,String>(64,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>2048;}
    });
    private final Set<String> posting=ConcurrentHashMap.newKeySet();
    private final Set<Socket> clients=ConcurrentHashMap.newKeySet();
    private final Map<String,Long> sent=new ConcurrentHashMap<>();
    private final Map<String,PendingImage> attachments=new ConcurrentHashMap<>();
    private final Map<String,Confirmation> confirmations=new ConcurrentHashMap<>();
    private static final class PendingImage {final SitePostProtocol.Image image;final long created;PendingImage(SitePostProtocol.Image image){this.image=image;created=android.os.SystemClock.elapsedRealtime();}}
    private static final class Confirmation {final SitePostProtocol.Plan plan;final String alias;final long created;Confirmation(SitePostProtocol.Plan plan,String alias){this.plan=plan;this.alias=alias;created=android.os.SystemClock.elapsedRealtime();}}
    private ServerSocket socket;private ExecutorService workers;private volatile int port;
    private boolean settingNativeFlags;
    private String imageBoardKey;
    private final SharedPreferences.OnSharedPreferenceChangeListener nativeFlags=this::nativeFlagChanged;
    private void nativeFlagChanged(SharedPreferences preferences,String key){
        // Android delivers background commits on the main thread after the write guard ends.
        // Only the visible site switches are activation events. Legacy board flags are
        // retained as data, but registration/migration must never activate a different site.
        if(key==null||settingNativeFlags||!key.startsWith("bbs.haiagaru_site_")||!key.endsWith(".enable"))return;
        synchronized(this){String kind=key.substring("bbs.haiagaru_site_".length(),key.length()-".enable".length());boolean value=prefs.getBoolean(key,false);
            if(!Arrays.asList(SiteBoardMenuProtocol.KINDS).contains(kind))return;
            if(!value)for(Map.Entry<String,SiteBoardProtocol.Board> row:boards.entrySet())if(row.getValue().kind.equals(kind))clearPending(row.getKey());
            boolean any=false;for(String otherKind:SiteBoardMenuProtocol.KINDS)any|=siteEnabled(otherKind);
            prefs.edit().putBoolean("enabled",any).commit();try{if(any)start();else stop();}catch(IOException failure){android.util.Log.w("Haiagaru","Native board activation unavailable",failure);}
        }
    }
    private void clearPending(String key){attachments.keySet().removeIf(k->k.startsWith(key+":"));confirmations.entrySet().removeIf(e->e.getValue().alias.equals(key));}
    interface Transport {
        Response get(String url)throws IOException;
        Response post(SitePostProtocol.Plan plan,String target)throws IOException;
        default Response getThumbnail(Context context,String address)throws IOException{
            return ThumbnailRequestPacing.fetch(context,address,gate->{
                Response response=get(address);
                if(gate!=null)gate.check(response.status,response.retryAfter);
                return response;
            });
        }
    }
    static final class Response {
        final int status;final byte[] bytes;final String type,location,retryAfter;
        Response(int status,byte[] bytes,String type,String location){
            this(status,bytes,type,location,null);
        }
        Response(int status,byte[] bytes,String type,String location,String retryAfter){
            this.status=status;this.bytes=bytes;this.type=type;this.location=location;this.retryAfter=retryAfter;
        }
        String text()throws IOException{
            String charset="UTF-8";Matcher header=Pattern.compile("(?i)charset\\s*=\\s*[\"']?([A-Za-z0-9_-]+)").matcher(type);
            if(header.find())charset=header.group(1);else{
                Matcher meta=Pattern.compile("(?i)charset\\s*=\\s*[\"']?([A-Za-z0-9_-]+)").matcher(new String(bytes,0,Math.min(bytes.length,8192),"ISO-8859-1"));
                if(meta.find())charset=meta.group(1);
            }
            if(charset.equalsIgnoreCase("Shift_JIS"))charset="windows-31j";
            try{return new String(bytes,Charset.forName(charset));}catch(RuntimeException unsupported){throw new IOException("未対応の文字コードです");}
        }
    }
    static synchronized void initialize(Context context){
        if(instance!=null)return;instance=new SiteBoardGateway(context.getSharedPreferences(PREFS,0),null);
        instance.repairNativeGamesBoardTitle(context);
        if(instance.enabled())try{instance.start();}catch(IOException failure){android.util.Log.w("Haiagaru","Site board gateway unavailable");}
    }
    static synchronized SiteBoardGateway get(Context context){initialize(context);return instance;}
    SiteBoardGateway(SharedPreferences prefs,Transport supplied){
        this.prefs=prefs;transport=supplied==null?new HttpTransport():supplied;
        try{JSONObject saved=new JSONObject(prefs.getString("animanchCategories","{}"));Iterator<String> ids=saved.keys();while(ids.hasNext()&&animanchCategories.size()<4096){String id=ids.next(),category=saved.getString(id);if(id.matches("[1-9][0-9]{0,11}")&&category.matches("/category[1-9][0-9]{0,3}/"))animanchCategories.put(id,category);}}catch(Exception invalid){android.util.Log.w("Haiagaru","Saved Animanch categories unavailable");}
        try{JSONObject saved=new JSONObject(prefs.getString("yamiSources","{}"));Iterator<String> ids=saved.keys();while(ids.hasNext()&&newsSources.size()<256){String id=ids.next(),url=saved.getString(id);if(id.equals(SiteBoardProtocol.address(url).thread))newsSources.put(id,url);}}catch(Exception invalid){android.util.Log.w("Haiagaru","Saved news sources unavailable");}
        try{JSONArray saved=new JSONArray(prefs.getString("boards","[]"));for(int n=0;n<saved.length();n++){
            JSONObject row=saved.getJSONObject(n);String key=row.getString("key");if(!key.matches(KEY_PATTERN))continue;
            SiteBoardProtocol.Board board=SiteBoardProtocol.address(row.getString("url"));
            boards.put(key,board);names.put(key,boardName(board,row.optString("name","追加掲示板")));folders.put(key,row.optString("folder",SiteBoardMenuProtocol.title(board.kind)));
        }}catch(Exception invalid){android.util.Log.w("Haiagaru","Saved site board list unavailable");}
        SharedPreferences.Editor migration=prefs.edit();boolean changed=false;
        for(String key:boards.keySet())if(!prefs.contains(nativeFlag(key))&&(key.length()==33||prefs.contains("boardEnabled:"+key))){migration.putBoolean(nativeFlag(key),enabled()&&prefs.getBoolean("boardEnabled:"+key,true));changed=true;}
        boolean enableNewSites=false;
        for(String kind:SiteBoardMenuProtocol.KINDS)if(!prefs.contains(siteFlag(kind))){
            migration.putBoolean(siteFlag(kind),true);enableNewSites=true;changed=true;
        }
        // The per-site options are the new opt-in boundary. Seed the transport too
        // when introducing their initial-on defaults; preserve all saved site OFFs.
        if(enableNewSites&&!enabled()){migration.putBoolean("enabled",true);changed=true;}
        if(changed)migration.commit();
        port=prefs.getInt("port",0);prefs.registerOnSharedPreferenceChangeListener(nativeFlags);
    }
    private static boolean isAnimanchGamesBoard(SiteBoardProtocol.Board board) {
        return board.kind.equals("animanch") && board.path.equals("/category32/");
    }

    private static String boardName(SiteBoardProtocol.Board board, String name) {
        if (isAnimanchGamesBoard(board) && (name.isEmpty() || name.equals(board.host)
                || name.equals("追加掲示板"))) return "家庭用ゲーム";
        return name.isEmpty() ? board.host : name;
    }

    private void repairNativeGamesBoardTitle(Context context) {
        if (port == 0) return;
        java.io.File file = context.getDatabasePath("roidon.sqlite");
        if (!file.isFile()) return;
        String server = "127.0.0.1:" + port;
        for (Map.Entry<String, SiteBoardProtocol.Board> entry : boards.entrySet()) {
            if (!isAnimanchGamesBoard(entry.getValue())) continue;
            String key = entry.getKey();
            String title = names.get(key);
            if (title == null) continue;
            android.content.ContentValues values = new android.content.ContentValues();
            values.put("title", title);
            try (android.database.sqlite.SQLiteDatabase db = android.database.sqlite.SQLiteDatabase.openDatabase(
                    file.getPath(), null, android.database.sqlite.SQLiteDatabase.OPEN_READWRITE)) {
                db.update("boards", values, "server=? AND name IN (?,?) AND title IN (?,?,?)",
                        new String[]{server, android.net.Uri.encode(server + "/" + key), key,
                                entry.getValue().host, "", "追加掲示板"});
            } catch (RuntimeException unavailable) {
                android.util.Log.w("Haiagaru", "Saved Animanch board title repair unavailable", unavailable);
            }
        }
    }

    boolean enabled(){return prefs.getBoolean("enabled",false);}
    static String providerId(String key){return "haiagaru_"+key;}
    static String nativeFlag(String key){return "bbs."+providerId(key)+".enable";}
    static String siteProviderId(String kind){return "haiagaru_site_"+kind;}
    static String siteFlag(String kind){return "bbs."+siteProviderId(kind)+".enable";}
    boolean siteEnabled(String kind){return prefs.getBoolean(siteFlag(kind),false);}
    private boolean effectiveFlag(String key){return prefs.getBoolean(nativeFlag(key),prefs.getBoolean("boardEnabled:"+key,true));}
    private boolean kindHasEnabled(String kind){for(Map.Entry<String,SiteBoardProtocol.Board> row:boards.entrySet())if(row.getValue().kind.equals(kind)&&effectiveFlag(row.getKey()))return true;return false;}
    boolean boardEnabled(String key){SiteBoardProtocol.Board board=boards.get(key);return enabled()&&board!=null&&siteEnabled(board.kind)&&effectiveFlag(key);}
    int listLimit(String key){
        SiteBoardProtocol.Board board=boards.get(key);
        int defaultLimit=board!=null&&board.kind.equals("bakusai")?100:150;
        return Math.max(1,Math.min(500,prefs.getInt("listLimit:"+key,defaultLimit)));
    }
    synchronized void listLimit(String key,int value)throws IOException{
        SiteBoardProtocol.Board board=boards.get(key);
        if(board==null||!(board.kind.equals("futaba")||board.kind.equals("bakusai"))||value<1||value>500)
            throw new IOException("ふたば・爆サイの板のみ1〜500件で設定できます");
        if(!prefs.edit().putInt("listLimit:"+key,value).commit())throw new IOException("表示件数を保存できません");
    }
    synchronized void boardEnabled(String key,boolean value)throws IOException{
        if(!boards.containsKey(key))throw new IOException("登録した板がありません");
        SharedPreferences.Editor edit=prefs.edit();
        // An explicitly disabled master must not enable other legacy registrations incidentally.
        if(value&&!enabled())for(String other:boards.keySet())edit.putBoolean("boardEnabled:"+other,false).putBoolean(nativeFlag(other),false);
        edit.putBoolean("boardEnabled:"+key,value).putBoolean(nativeFlag(key),value);if(value)edit.putBoolean(siteFlag(boards.get(key).kind),true).putBoolean("enabled",true);
        settingNativeFlags=true;try{if(!edit.commit())throw new IOException("設定を保存できません");}finally{settingNativeFlags=false;}
        if(value)try{start();}catch(IOException failure){prefs.edit().putBoolean("boardEnabled:"+key,false).commit();throw failure;}
        else{clearPending(key);String kind=boards.get(key).kind;if(!kindHasEnabled(kind))prefs.edit().putBoolean(siteFlag(kind),false).commit();boolean any=siteEnabled("edge")||siteEnabled("kenmo");for(String other:boards.keySet())any|=effectiveFlag(other);if(!any)enabled(false);}
    }
    private boolean boardEnabled(SiteBoardProtocol.Board board){
        for(Map.Entry<String,SiteBoardProtocol.Board> row:boards.entrySet())if(row.getValue().url.equals(board.url)&&boardEnabled(row.getKey()))return true;
        if(board.thread!=null&&board.threadUrl(board.thread).equals(newsSources.get(board.thread)))for(String key:boards.keySet())if(newsBoard(key)&&boardEnabled(key))return true;return false;
    }
    synchronized void enabled(boolean value)throws IOException{
        SharedPreferences.Editor edit=prefs.edit().putBoolean("enabled",value);for(String key:boards.keySet())edit.putBoolean(nativeFlag(key),value&&prefs.getBoolean("boardEnabled:"+key,true));
        for(String kind:SiteBoardMenuProtocol.KINDS){boolean active=value&&(kind.equals("edge")||kind.equals("kenmo"))&&siteEnabled(kind);if(value)for(Map.Entry<String,SiteBoardProtocol.Board> row:boards.entrySet())if(row.getValue().kind.equals(kind)&&prefs.getBoolean("boardEnabled:"+row.getKey(),true))active=true;edit.putBoolean(siteFlag(kind),active);}
        settingNativeFlags=true;try{if(!edit.commit())throw new IOException("設定を保存できません");}finally{settingNativeFlags=false;}
        if(value)try{start();}catch(IOException failed){prefs.edit().putBoolean("enabled",false).commit();throw failed;}
        else stop();
    }
    synchronized String register(String address,String name)throws IOException{
        SiteBoardProtocol.Board board=SiteBoardProtocol.address(address);String key=null;
        for(Map.Entry<String,SiteBoardProtocol.Board> e:boards.entrySet())if(e.getValue().url.equals(board.url)){key=e.getKey();break;}
        boolean fresh=key==null;if(fresh)key=SiteBoardCatalog.prefix(board.kind)+UUID.randomUUID().toString().replace("-","");
        boards.put(key,SiteBoardProtocol.address(board.url));names.put(key,boardName(board,name.trim()));
        folders.putIfAbsent(key,SiteBoardMenuProtocol.title(board.kind));
        SharedPreferences.Editor save=prefs.edit().putString("boards",savedBoards());if(fresh)save.putBoolean("boardEnabled:"+key,true).putBoolean(nativeFlag(key),true);
        settingNativeFlags=true;try{if(!save.commit())throw new IOException("板を保存できません");}finally{settingNativeFlags=false;}
        if(enabled())start();return key;
    }
    synchronized String nativeUrl(String key,String thread)throws IOException{
        if(!boardEnabled(key))throw new IOException("この板の「使用する」をオンにしてください");start();
        return thread==null?origin()+"/"+key+"/":origin()+"/test/read.cgi/"+key+"/"+SiteThreadIds.nativeId(thread)+"/";
    }
    /** Resolve only already registered/enabled boards. Never performs a network request. */
    synchronized String localUrl(String address)throws IOException{
        URI uri;try{uri=URI.create(address);}catch(RuntimeException invalid){return null;}
        if("127.0.0.1".equals(uri.getHost())&&uri.getUserInfo()==null&&uri.getRawQuery()==null
                &&("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))&&(uri.getPort()==-1||uri.getPort()==port)){
            Matcher thread=Pattern.compile("/test/read\\.cgi/("+KEY_PATTERN+")/([0-9]{1,12})/([0-9ln-]*)").matcher(uri.getRawPath());
            Matcher board=Pattern.compile("/("+KEY_PATTERN+")/").matcher(uri.getRawPath());
            if(thread.matches()&&boards.containsKey(thread.group(1)))return nativeUrl(thread.group(1),sourceThread(thread.group(2)))+thread.group(3);
            if(board.matches()&&boards.containsKey(board.group(1)))return nativeUrl(board.group(1),null);
            return null;
        }
        if(uri.getUserInfo()!=null||uri.getPort()!=-1||!("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme())))return null;
        String canonical="https://"+uri.getRawAuthority()+uri.getRawPath()+(uri.getRawQuery()==null?"":"?"+uri.getRawQuery());
        final SiteBoardProtocol.Board source;try{source=SiteBoardProtocol.address(canonical);}catch(IOException other){return null;}
        if(source.kind.equals("futaba")&&source.host.equals("www.2chan.net")&&source.path.equals("script"))return null;
        List<String> keys=new ArrayList<>(boards.keySet());Collections.sort(keys);
        String category=source.kind.equals("animanch")&&source.thread!=null?animanchCategories.get(source.thread):null;
        String selected=null;for(String key:keys)if(boardEnabled(key)&&SiteBoardProtocol.matchesRegisteredBoard(boards.get(key),source,category)){
            if(selected==null||boards.get(key).url.equals(source.url))selected=key;
            if(boards.get(key).url.equals(source.url))break;
        }
        if(selected==null&&source.thread!=null&&source.threadUrl(source.thread).equals(newsSources.get(source.thread)))for(String key:keys)if(newsBoard(key)&&boardEnabled(key)){selected=key;break;}
        if(selected==null&&source.path.equals("yamibaito/"))for(String key:keys)if(newsBoard(key)&&boardEnabled(key)){selected=key;break;}
        if(selected==null)return null;String result=nativeUrl(selected,source.thread);
        if(source.thread!=null&&source.kind.equals("animanch")){
            String response=AnimanchProtocol.replyNumber(canonical),fragment=uri.getFragment();
            if(response==null&&fragment!=null&&fragment.matches("res[1-9][0-9]{0,5}"))response=fragment.substring(3);
            if(response!=null)result+=response;
        }
        return result;
    }
    /** Called from an I/O worker; never from Android's UI thread. */
    String resolveUnclassifiedAnimanch(String address)throws IOException{
        String id=AnimanchProtocol.threadId(address);
        if(id==null)return localUrl(address);
        if(animanchCategories.get(id)==null){
            String html=page(AnimanchProtocol.ORIGIN+"/board/"+id+"/");
            rememberAnimanch(id,AnimanchCategories.fromThread(html,id));
        }
        return localUrl(address);
    }
    private void rememberAnimanch(String id,String category){
        if(id==null||!id.matches("[1-9][0-9]{0,11}")||category==null||!category.matches("/category[1-9][0-9]{0,3}/"))return;
        synchronized(animanchCategories){
            if(category.equals(animanchCategories.get(id)))return;
            animanchCategories.put(id,category);
            prefs.edit().putString("animanchCategories",new JSONObject(animanchCategories).toString()).apply();
        }
    }
    private void rememberAnimanchTopics(SiteBoardProtocol.Board board,List<SiteBoardProtocol.Topic> topics){
        if(!board.kind.equals("animanch")||!board.path.matches("/category[1-9][0-9]{0,3}/"))return;
        synchronized(animanchCategories){
            boolean changed=false;
            for(SiteBoardProtocol.Topic topic:topics)if(!board.path.equals(animanchCategories.get(topic.id))){animanchCategories.put(topic.id,board.path);changed=true;}
            if(changed)prefs.edit().putString("animanchCategories",new JSONObject(animanchCategories).toString()).apply();
        }
    }
    /** Image getters keep the source label in the response and receive an existing native image route. */
    synchronized String nativeImageUrl(String address)throws IOException{
        final URI uri;try{uri=URI.create(address);}catch(RuntimeException invalid){return null;}
        if(!"https".equals(uri.getScheme())||!"bbs.animanch.com".equals(uri.getHost())||uri.getUserInfo()!=null
                ||uri.getPort()!=-1||uri.getRawQuery()!=null||uri.getRawFragment()!=null
                 ||!uri.getRawPath().matches("/(?:arc/)?img/[1-9][0-9]{0,11}/[1-9][0-9]{0,11}"))return null;
        String key=imageBoardKey;SiteBoardProtocol.Board selected=key==null?null:boards.get(key);
        if(selected==null||!selected.kind.equals("animanch")||!boardEnabled(key)){
            key=null;for(Map.Entry<String,SiteBoardProtocol.Board> entry:boards.entrySet())
                if(entry.getValue().kind.equals("animanch")&&boardEnabled(entry.getKey())){key=entry.getKey();break;}
            imageBoardKey=key;
        }
        if(key==null)return null;start();return origin()+"/m/"+key+uri.getRawPath()+".jpg";
    }
    /** Copy/share conversion does not activate a disabled board or start the gateway. */
    synchronized String originalUrl(String address){
        try{URI uri=URI.create(address);if(!"127.0.0.1".equals(uri.getHost())||uri.getPort()!=-1&&uri.getPort()!=port||uri.getUserInfo()!=null||uri.getRawQuery()!=null||!("http".equals(uri.getScheme())||"https".equals(uri.getScheme())))return address;
            Matcher thread=Pattern.compile("/test/read\\.cgi/("+KEY_PATTERN+")/([0-9]{1,12})/(?:([1-9][0-9]{0,5})|[ln][0-9]+)?").matcher(uri.getRawPath());
            Matcher board=Pattern.compile("/("+KEY_PATTERN+")/").matcher(uri.getRawPath());
             Matcher image=Pattern.compile("/m/("+KEY_PATTERN+")/((?:arc/)?img)/([1-9][0-9]{0,11})/([1-9][0-9]{0,11})\\.jpg").matcher(uri.getRawPath());
            if(image.matches()){
                SiteBoardProtocol.Board source=boards.get(image.group(1));
                 if(source!=null&&source.kind.equals("animanch"))return AnimanchProtocol.ORIGIN+"/"+image.group(2)+"/"+image.group(3)+"/"+image.group(4);
            }
            if(thread.matches()){
                SiteBoardProtocol.Board target=boards.get(thread.group(1));if(target==null)return address;String id=sourceThread(thread.group(2));if(newsBoard(thread.group(1)))return newsSources.containsKey(id)?newsSources.get(id):address;String result=target.threadUrl(id);
                if(target.kind.equals("animanch")&&thread.group(3)!=null)result+="#res"+thread.group(3);return result;
            }
            if(board.matches()&&boards.containsKey(board.group(1)))return boards.get(board.group(1)).url;
        }catch(Exception invalid){/* Leave unrelated/malformed copied text intact. */}return address;
    }
    private String origin(){return "http://127.0.0.1:"+port;}
    private String savedBoards()throws IOException{JSONArray rows=new JSONArray();try{for(Map.Entry<String,SiteBoardProtocol.Board> e:boards.entrySet())rows.put(new JSONObject().put("key",e.getKey()).put("url",e.getValue().url).put("name",names.get(e.getKey())).put("folder",folders.get(e.getKey())));}catch(JSONException invalid){throw new IOException("板を保存できません",invalid);}return rows.toString();}
    private synchronized void reservePort()throws IOException{
        if(port==0){try(ServerSocket reserve=new ServerSocket()){reserve.bind(new InetSocketAddress(InetAddress.getByName("127.0.0.1"),0));port=reserve.getLocalPort();}if(!prefs.edit().putInt("port",port).commit())throw new IOException("接続先を保存できません");}
    }
    synchronized String siteMenuUrl(String kind)throws IOException{
        if(!Arrays.asList(SiteBoardMenuProtocol.KINDS).contains(kind))throw new IOException("未対応の掲示板です");
        // These sites expose native 2ch-compatible BBS menus and DAT endpoints.
        // Fetch their published menus directly so the native parser sees the same
        // board count and URLs as a regular user-added BBSMENU.
        if(kind.equals("edge")||kind.equals("kenmo"))return SiteBoardMenuProtocol.source(kind,0);
        reservePort();return origin()+"/haiagaru-menu-"+kind+"/";
    }
    synchronized Pattern sitePattern(String kind)throws IOException{
        Pattern cached=sitePatterns.get(kind);if(cached!=null)return cached;
        if(kind.equals("edge")){Pattern result=Pattern.compile("https://bbs\\.eddibb\\.cc/liveedge/");sitePatterns.put(kind,result);return result;}
        if(kind.equals("kenmo")){Pattern result=Pattern.compile("https://(?:kenmo\\.org|00c\\.org)/[A-Za-z0-9_-]+/");sitePatterns.put(kind,result);return result;}
        reservePort();StringBuilder aliases=new StringBuilder(SiteBoardCatalog.prefix(kind)+"[a-f0-9]{32}");for(Map.Entry<String,SiteBoardProtocol.Board> row:boards.entrySet())if(row.getKey().length()==33&&row.getValue().kind.equals(kind))aliases.append('|').append(Pattern.quote(row.getKey()));Pattern result=Pattern.compile(Pattern.quote(origin())+"/(?:"+aliases+")/");sitePatterns.put(kind,result);return result;
    }
    synchronized String registrationUrl(String key)throws IOException{
        if(!boards.containsKey(key))throw new IOException("未登録の板です");
        reservePort();
        return origin()+"/"+key+"/";
    }
    String attachmentTarget(String address)throws IOException{
        try{URI u=URI.create(address);if(!"http".equals(u.getScheme())||!"127.0.0.1".equals(u.getHost())||u.getPort()!=port||u.getUserInfo()!=null)throw new IOException("追加掲示板の投稿先ではありません");
            Matcher thread=Pattern.compile("/test/read\\.cgi/("+KEY_PATTERN+")/([0-9]{1,12})/(?:[0-9ln-]*)?").matcher(u.getPath());
            Matcher board=Pattern.compile("/("+KEY_PATTERN+")/").matcher(u.getPath());String key,id;
            if(thread.matches()){key=thread.group(1);id=sourceThread(thread.group(2));}else if(board.matches()){key=board.group(1);id="new";}else throw new IOException("投稿先を確認できません");
            if(!boardEnabled(key))throw new IOException("この板の「使用する」をオンにしてください");return key+":"+id;
        }catch(IllegalArgumentException error){throw new IOException("投稿先が不正です");}
    }
    void attachment(String target,SitePostProtocol.Image image)throws IOException{
        if(target==null||!target.matches(KEY_PATTERN+":(?:new|[1-9][0-9]{0,11})")||!boardEnabled(target.substring(0,target.indexOf(':'))))throw new IOException("使用しない板です");
        long now=android.os.SystemClock.elapsedRealtime();attachments.entrySet().removeIf(e->now-e.getValue().created>600000);
        if(image==null){attachments.remove(target);return;}if(!attachments.containsKey(target)&&attachments.size()>=4)throw new IOException("添付の待機数が上限です。他の添付を解除してください");attachments.put(target,new PendingImage(image));
    }
    synchronized void start()throws IOException{
        if(socket!=null&&!socket.isClosed())return;
        ServerSocket next=new ServerSocket();next.setReuseAddress(true);
        int saved=prefs.getInt("port",0);if(saved<0||saved>65535){next.close();throw new IOException("保存した接続先が不正です");}
        try{next.bind(new InetSocketAddress(InetAddress.getByName("127.0.0.1"),saved),16);}
        catch(IOException error){next.close();throw new IOException("保存した板の接続先を開始できません。アプリを再起動してください",error);}
        port=next.getLocalPort();if(!prefs.edit().putInt("port",port).commit()){next.close();throw new IOException("接続先を保存できません");}
        socket=next;workers=new ThreadPoolExecutor(2,2,30,TimeUnit.SECONDS,new ArrayBlockingQueue<>(16),r->{Thread t=new Thread(r,"Haiagaru-site-request");t.setDaemon(true);return t;});
        HttpsTransport.siteBoardServerListening(port,true);
        ExecutorService pool=workers;Thread accept=new Thread(()->{
            while(!next.isClosed())try{Socket client=next.accept();clients.add(client);try{pool.execute(()->serve(client));}catch(RejectedExecutionException busy){clients.remove(client);client.close();}}
            catch(IOException closed){break;}
        },"Haiagaru-site-listener");accept.setDaemon(true);accept.start();
    }
    synchronized void stop(){if(socket!=null){HttpsTransport.siteBoardServerListening(socket.getLocalPort(),false);try{socket.close();}catch(IOException ignored){}}socket=null;for(Socket client:clients)try{client.close();}catch(IOException ignored){}clients.clear();if(workers!=null)workers.shutdownNow();workers=null;images.clear();attachments.clear();confirmations.clear();}
    private static String line(InputStream in,int limit)throws IOException{
        ByteArrayOutputStream out=new ByteArrayOutputStream();for(int n=0;n<limit;n++){
            int b=in.read();if(b<0)throw new EOFException();if(b=='\n')return out.toString("ISO-8859-1").replaceFirst("\\r$","");out.write(b);
        }throw new IOException("Header too large");
    }
    private void serve(Socket client){
        try{client.setSoTimeout(15000);InputStream input=new BufferedInputStream(client.getInputStream());String[] request=line(input,8192).split(" ");
            if(request.length!=3||!(request[0].equals("GET")||request[0].equals("POST"))){send(client,400,"text/plain",new byte[0]);return;}
            URI target=URI.create(request[1]);if(target.isAbsolute()||target.getRawAuthority()!=null||target.getRawPath().contains("%")){send(client,400,"text/plain",new byte[0]);return;}
            Map<String,String> headers=new HashMap<>();int total=0;for(int n=0;n<64;n++){
                String head=line(input,8192);total+=head.length();if(total>32768)throw new IOException("Headers too large");if(head.isEmpty())break;
                int split=head.indexOf(':');if(split<1)throw new IOException("Invalid header");String key=head.substring(0,split).toLowerCase(Locale.ROOT);
                if(headers.put(key,head.substring(split+1).trim())!=null)throw new IOException("Repeated header");if(n==63)throw new IOException("Too many headers");
            }
            if(!("127.0.0.1:"+port).equals(headers.get("host"))||headers.containsKey("transfer-encoding")
                    ||headers.containsKey("origin")&&!origin().equals(headers.get("origin"))){send(client,403,"text/plain",new byte[0]);return;}
            if(!enabled()){send(client,503,"text/plain; charset=UTF-8","追加掲示板の「使用する」がオフです".getBytes("UTF-8"));return;}
            String path=target.getRawPath();
            Matcher catalogue=Pattern.compile("/haiagaru-menu-(edge|bakusai|futaba|animanch)/").matcher(path);
            if(request[0].equals("GET")&&catalogue.matches()){
                String kind=catalogue.group(1);if(!siteEnabled(kind)){send(client,403,"text/plain",new byte[0]);return;}
                List<SiteBoardMenuProtocol.Choice> entries=SiteBoardCatalog.load(kind,(service,region)->{if(!enabled()||!siteEnabled(kind))throw new IOException("掲示板の使用がオフです");return menu(service,region);});
                String html=kind.equals("edge")?directCatalogue(entries):importCatalogue(kind,entries);
                send(client,200,"text/html; charset=Shift_JIS",SiteNativeData.wire(html));return;
            }
            Matcher menu=Pattern.compile("/("+KEY_PATTERN+")/").matcher(path);
            if(request[0].equals("GET")&&menu.matches()&&boardEnabled(menu.group(1))){
                String key=menu.group(1);
                org.jsoup.nodes.Document.OutputSettings escaping=new org.jsoup.nodes.Document.OutputSettings().charset("windows-31j");
                String name=org.jsoup.nodes.Entities.escape(names.get(key),escaping);
                String html="<html><body>\n<B>"+name+"</B><BR>\n<A HREF=\""+registrationUrl(key)+"\">"+name+"</A><BR>\n</body></html>";
                send(client,200,"text/html; charset=Shift_JIS",SiteNativeData.wire(html));return;}
            if(request[0].equals("POST")){
                int length=Integer.parseInt(headers.getOrDefault("content-length","0"));if(length<1||length>262144)throw new IOException("Invalid post size");
                String type=headers.getOrDefault("content-type","");if(!type.toLowerCase(Locale.ROOT).startsWith("application/x-www-form-urlencoded"))throw new IOException("未対応の投稿形式です");
                byte[] body=new byte[length];int used=0;while(used<length){int n=input.read(body,used,length-used);if(n<0)throw new EOFException();used+=n;}
                if(!path.endsWith("/bbs.cgi"))throw new IOException("Unknown post endpoint");
                String charset=type.toLowerCase(Locale.ROOT).contains("utf-8")?"UTF-8":"windows-31j";Map<String,String> form=form(body,charset);
                SiteBoardProtocol.Board board=boards.get(form.get("bbs"));if(board==null||!boardEnabled(form.get("bbs")))throw new IOException("未登録または使用しない板です");
                post(client,board,form);return;
            }
            // The source coordinates remain in the URL so cached DAT images survive restart.
            Matcher stableMedia=Pattern.compile("/m/("+KEY_PATTERN+")/((?:arc/)?img)/([1-9][0-9]{0,11})/([1-9][0-9]{0,11})\\.jpg").matcher(path);
            if(stableMedia.matches()){
                String key=stableMedia.group(1);SiteBoardProtocol.Board sourceBoard=boards.get(key);
                if(!boardEnabled(key)||sourceBoard==null||!sourceBoard.kind.equals("animanch")){send(client,403,"text/plain",new byte[0]);return;}
                String mediaPath=stableMedia.group(2), coordinates="/"+stableMedia.group(3)+"/"+stableMedia.group(4);
                Response r=null;
                try { r=transport.get(AnimanchProtocol.ORIGIN+"/"+mediaPath+coordinates); }
                catch(IOException unavailable) { if(!mediaPath.equals("arc/img"))throw unavailable; }
                // Older /arc/img links now redirect to /storage/img, which may return
                // Cloudflare 503. The same post image is served by /img/<thread>/<res>.
                if(mediaPath.equals("arc/img")&&(r==null||r.status!=200||r.type==null
                        ||!r.type.toLowerCase(Locale.ROOT).startsWith("image/")))
                    r=transport.get(AnimanchProtocol.ORIGIN+"/img"+coordinates);
                if(r==null||r.status!=200||r.type==null||!r.type.toLowerCase(Locale.ROOT).startsWith("image/")||r.bytes==null||r.bytes.length==0)
                    throw new IOException("画像を取得できません");
                send(client,200,r.type,r.bytes);return;
            }
            Matcher media=Pattern.compile("/m/([a-f0-9]{64})\\.jpg").matcher(path);
            if(media.matches()){
                String stored=images.get(media.group(1));if(stored==null){send(client,404,"text/plain",new byte[0]);return;}
                int split=stored.indexOf('\n');if(split<0||!boardEnabled(stored.substring(0,split))){send(client,403,"text/plain",new byte[0]);return;}String source=stored.substring(split+1);
                Response r=transport.get(source);if(r==null||r.status!=200||r.type==null||!r.type.toLowerCase(Locale.ROOT).startsWith("image/")||r.bytes==null||r.bytes.length==0)
                    throw new IOException("画像を取得できません");
                send(client,200,r.type,r.bytes);return;
            }
            Matcher route=Pattern.compile("/("+KEY_PATTERN+")/(subject\\.txt|SETTING\\.TXT|dat/([0-9]{1,12})\\.dat)").matcher(path);
            if(!route.matches()||!boards.containsKey(route.group(1))){send(client,404,"text/plain",new byte[0]);return;}
            String key=route.group(1);SiteBoardProtocol.Board board=boards.get(key);byte[] data;
            if(!boardEnabled(key)){send(client,403,"text/plain; charset=UTF-8","この板の「使用する」がオフです".getBytes("UTF-8"));return;}
            if(route.group(2).equals("SETTING.TXT"))data=SiteNativeData.wire("BBS_TITLE="+names.get(key).replace('\n',' ')+"\nBBS_NONAME_NAME=名無しさん\nBBS_UNICODE=pass\n");
            else if(route.group(2).equals("subject.txt")){
                if(board.kind.equals("futaba")&&board.host.equals("www.2chan.net")&&board.path.equals("script"))throw new IOException("ふたばの「配布」はスクリプト配布ページのため、スレ一覧はありません。元のURLをブラウザで開いてください");
                String listing=page(board.indexUrl());
                if(board.path.equals("yamibaito/")||SiteBoardProtocol.webDestination(board,listing)!=null){prefs.edit().putBoolean("yamiBoard:"+key,true).apply();data=SiteNativeData.subject(newsTopics(),true);}
                else{prefs.edit().remove("yamiBoard:"+key).apply();List<SiteBoardProtocol.Topic> topics=board.kind.equals("futaba")?FutabaCatalogue.topics(board,listing,url->{if(!boardEnabled(key))throw new IOException("使用しない板です");return page(url);},listLimit(key)):board.kind.equals("bakusai")?BakusaiCatalogue.topics(board,listing,url->{if(!boardEnabled(key))throw new IOException("使用しない板です");return page(url);},listLimit(key)):SiteBoardProtocol.topics(board,listing);rememberAnimanchTopics(board,topics);data=SiteNativeData.subject(topics);}
            }
            else{
                String id=sourceThread(route.group(3));SiteBoardProtocol.Board resolved=newsSource(key,id,board);String html=page(resolved.threadUrl(id));if(board.kind.equals("animanch"))rememberAnimanch(id,AnimanchCategories.fromThread(html,id));if(newsBoard(key)){resolved=BakusaiNews.canonical(resolved.threadUrl(id),id,html);saveNews(id,resolved.threadUrl(id));prefs.edit().putInt("yamiCount:"+id,SiteBoardProtocol.bakusaiCount(Jsoup.parse(html))+1).apply();}SiteBoardProtocol.Board sourceBoard=resolved;SiteBoardProtocol.ThreadPage page=thread(sourceBoard,id,html);
                if(!page.entries.isEmpty())SiteThreadMetadata.remember(key,id,SiteThreadDates.parse(page.entries.get(0).date));
                data=SiteNativeData.dat(board,page,source->{if(board.kind.equals("animanch"))return origin()+"/m/"+key+URI.create(source).getPath()+".jpg";return source;},
                        source->{String other=SiteBoardProtocol.threadIn(sourceBoard,source);if(other==null)return source;try{String targetKey=key;if(board.kind.equals("animanch")){String targetCategory=animanchCategories.get(other);if(targetCategory==null)return source;targetKey=null;for(Map.Entry<String,SiteBoardProtocol.Board> entry:boards.entrySet())if(boardEnabled(entry.getKey())&&entry.getValue().kind.equals("animanch")&&entry.getValue().path.equals(targetCategory)){targetKey=entry.getKey();break;}if(targetKey==null)return source;}return origin()+"/test/read.cgi/"+targetKey+"/"+SiteThreadIds.nativeId(other)+"/";}catch(IOException invalid){return source;}});
            }
            send(client,200,"text/plain; charset=Shift_JIS",data);
        }catch(Exception error){android.util.Log.w("Haiagaru","Additional board request failed",error);try{
            String detail=readFailure(error);
            String message=error instanceof BakusaiAccessError?detail:detail.isEmpty()?"取得できませんでした。認証・通信・対応形式を確認してください。":detail+"\n取得できませんでした。認証・通信・対応形式を確認してください。";
            send(client,503,"text/plain; charset=UTF-8",message.getBytes("UTF-8"));
            SiteReadFailureUi.show(error);
        }catch(Exception ignored){}}
        finally{clients.remove(client);try{client.close();}catch(IOException ignored){}}
    }
    private String page(String url)throws IOException{Response r=transport.get(url);if(r.status!=200)throw new IOException("HTTP "+r.status);return r.text();}
    long creationTime(String key,String id)throws IOException{SiteBoardProtocol.Board board=boards.get(key);if(board==null||!boardEnabled(key))throw new IOException("使用しない板です");board=newsSource(key,id,board);return SiteThreadDates.opening(board,id,page(board.threadUrl(id)));}
    /** Retrieve opening attachments on an I/O worker. */
    String openingImage(String key,String id)throws IOException{
        List<String> urls=openingImages(key,id,1,null);
        return urls.isEmpty()?null:urls.get(0);
    }
    List<String> openingImages(String key,String id,int limit,Context thumbnailContext)throws IOException{
        if(limit<=0)return Collections.emptyList();
        SiteBoardProtocol.Board board=boards.get(key);
        if(board==null||!boardEnabled(key)||!(board.kind.equals("futaba")||board.kind.equals("animanch")))return Collections.emptyList();
        Response response=transport.getThumbnail(thumbnailContext,board.threadUrl(id));
        if(response.status!=200)throw new IOException("HTTP "+response.status);
        SiteBoardProtocol.ThreadPage thread=SiteBoardProtocol.thread(board,id,response.text());
        if(thread.entries.isEmpty())return Collections.emptyList();
        LinkedHashSet<String> found=new LinkedHashSet<>();
        collectOpeningMedia(found,thread.entries.get(0),board.threadUrl(id),limit);
        // Futaba img/may occasionally have the thread image attached to entry 2.
        if(found.isEmpty()&&board.kind.equals("futaba")&&thread.entries.size()>1)
            collectOpeningMedia(found,thread.entries.get(1),board.threadUrl(id),limit);
        return new ArrayList<>(found);
    }
    private static void collectOpeningMedia(Set<String> found,SiteBoardProtocol.Entry entry,String threadUrl,int limit){
        for(String url:entry.media){
            if(ThreadListThumbnailRules.publicImage(url)&&found.add(url)&&found.size()>=limit)return;
        }
        for(String url:ThreadListThumbnailRules.openingTextMedia(entry.body,threadUrl,limit)){
            if(found.add(url)&&found.size()>=limit)return;
        }
    }
    /** Site transport enforces the same origin and authentication rules as native DAT images. */
    byte[] openingImageBytes(Context context,String url)throws IOException{
        if(ImageVpnController.protectedPreview(url)){
            app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image result=
                    ThumbnailRequestPacing.fetch(context,url,gate->ImageVpnController.fetchPreview(url));
            byte[] body=result.getBody();String type=result.getContentType();
            if(body==null||body.length>3*1024*1024||type==null||!type.toLowerCase(Locale.ROOT).startsWith("image/"))
                throw new IOException("VPN経由でサムネイルを取得できません");
            return body;
        }
        Response image=transport.getThumbnail(context,url);
        if(image.status!=200||image.bytes.length>3*1024*1024||!image.type.toLowerCase(Locale.ROOT).startsWith("image/"))throw new IOException("サムネイル画像を取得できません");
        return image.bytes;
    }
    String sourceUrl(String key,String id)throws IOException{SiteBoardProtocol.Board board=boards.get(key);if(board==null||!boardEnabled(key))throw new IOException("使用しない板です");return newsSource(key,id,board).threadUrl(id);}
    private boolean newsBoard(String key){SiteBoardProtocol.Board board=boards.get(key);return board!=null&&(board.path.equals("yamibaito/")||prefs.getBoolean("yamiBoard:"+key,false));}
    private SiteBoardProtocol.Board newsSource(String key,String id,SiteBoardProtocol.Board original)throws IOException{if(!newsBoard(key))return original;String source=newsSources.get(id);if(source==null){newsTopics();source=newsSources.get(id);}if(source==null)throw new IOException("関連ニュースの元スレが見つかりません。一覧を更新してください");return SiteBoardProtocol.address(source);}
    private synchronized void saveNews(String id,String url)throws IOException{if(url.equals(newsSources.get(id)))return;newsSources.put(id,url);while(newsSources.size()>256)newsSources.remove(newsSources.keySet().iterator().next());try{if(!prefs.edit().putString("yamiSources",new JSONObject(newsSources).toString()).commit())throw new IOException("ニュースの元URLを保存できません");}catch(RuntimeException invalid){throw new IOException("ニュースの元URLを保存できません",invalid);}}
    private synchronized void mergeNews(List<BakusaiNews.Item> items)throws IOException{boolean changed=false;for(BakusaiNews.Item item:items)if(!newsSources.containsKey(item.id)){newsSources.put(item.id,item.url);changed=true;}SharedPreferences.Editor edit=prefs.edit();while(newsSources.size()>256){String oldest=newsSources.keySet().iterator().next();newsSources.remove(oldest);edit.remove("yamiCount:"+oldest);}if(changed&&!edit.putString("yamiSources",new JSONObject(newsSources).toString()).commit())throw new IOException("ニュースの元URLを保存できません");}
    private List<SiteBoardProtocol.Topic> newsTopics()throws IOException{SitePostProtocol.Plan plan=BakusaiNews.request();Response response=transport.post(plan,plan.url);if(response.status!=200)throw new IOException("関連ニュースの取得エラー（HTTP "+response.status+"）");List<BakusaiNews.Item> items=BakusaiNews.catalogue(response.text());mergeNews(items);List<SiteBoardProtocol.Topic> topics=new ArrayList<>();for(BakusaiNews.Item item:items)topics.add(new SiteBoardProtocol.Topic(item.id,item.title,prefs.getInt("yamiCount:"+item.id,0)));return topics;}
    private SiteBoardProtocol.ThreadPage thread(SiteBoardProtocol.Board board,String id,String html)throws IOException{
        if(board.kind.equals("animanch"))return AnimanchPagination.thread(board,id,html,url->{if(!boardEnabled(board))throw new IOException("使用しない板です");return page(url);});
        return board.kind.equals("bakusai")?BakusaiPagination.thread(board,id,html,url->{if(!boardEnabled(board))throw new IOException("使用しない板です");return page(url);}):SiteBoardProtocol.thread(board,id,html);
    }
    List<SiteBoardMenuProtocol.Choice> menu(String kind,int region)throws IOException{
        if(kind.equals("edge"))return SiteBoardMenuProtocol.parse(kind,"");
        return SiteBoardMenuProtocol.parse(kind,page(SiteBoardMenuProtocol.source(kind,region)));
    }
    private String directCatalogue(List<SiteBoardMenuProtocol.Choice> entries)throws IOException{
        if(entries.size()!=1||!"https://bbs.eddibb.cc/liveedge/".equals(entries.get(0).url))
            throw new IOException("エッヂの板一覧を確認できません");
        return "<html><body>\n<B>エッヂ</B><BR>\n<A HREF=\"https://bbs.eddibb.cc/liveedge/\">エッヂ</A><BR>\n</body></html>";
    }
    synchronized String importCatalogue(String kind,List<SiteBoardMenuProtocol.Choice> entries)throws IOException{
        if(!enabled()||!siteEnabled(kind))throw new IOException("掲示板の使用がオフです");
        Map<String,String> existing=new HashMap<>();for(Map.Entry<String,SiteBoardProtocol.Board> row:boards.entrySet())existing.put(row.getValue().url,row.getKey());
        LinkedHashMap<String,List<String>> sections=new LinkedHashMap<>();SharedPreferences.Editor eligible=prefs.edit();
        for(SiteBoardMenuProtocol.Choice choice:entries){SiteBoardProtocol.Board board=SiteBoardProtocol.address(choice.url);if(!kind.equals(board.kind))throw new IOException("別の掲示板が含まれています");
            String key=existing.get(board.url);if(key==null){key=SiteBoardCatalog.key(board);SiteBoardProtocol.Board collision=boards.get(key);if(collision!=null&&!collision.url.equals(board.url))throw new IOException("板の識別子が重複しました");boards.put(key,board);names.put(key,choice.name);existing.put(board.url,key);}
            String folder=choice.group.isEmpty()?SiteBoardMenuProtocol.title(kind):choice.group;folders.put(key,folder);sections.computeIfAbsent(folder,k->new ArrayList<>()).add(key);
            if(prefs.contains("boardEnabled:"+key)||prefs.contains(nativeFlag(key)))eligible.putBoolean("boardEnabled:"+key,true).putBoolean(nativeFlag(key),true);
        }
        settingNativeFlags=true;try{if(!eligible.putString("boards",savedBoards()).commit())throw new IOException("板一覧を保存できません");}finally{settingNativeFlags=false;}
        org.jsoup.nodes.Document.OutputSettings escaping=new org.jsoup.nodes.Document.OutputSettings().charset("windows-31j");
        // ChMate's native HTML parser recognizes one menu heading or link per line.
        StringBuilder html=new StringBuilder("<html><body>\n");for(Map.Entry<String,List<String>> section:sections.entrySet()){
            html.append("<B>").append(org.jsoup.nodes.Entities.escape(section.getKey(),escaping)).append("</B><BR>\n");
            for(String key:section.getValue())html.append("<A HREF=\"").append(registrationUrl(key)).append("\">").append(org.jsoup.nodes.Entities.escape(names.get(key),escaping)).append("</A><BR>\n");
        }return html.append("</body></html>").toString();
    }
    static String sourceThread(String id)throws IOException{
        return SiteThreadIds.source(id);
    }
    private void post(Socket client,SiteBoardProtocol.Board board,Map<String,String> form)throws IOException{
        String token=form.get("haiagaruConfirm");if(token!=null){confirm(client,board,form,token);return;}
        String id=form.get("key");boolean creating=id==null||id.isEmpty()||id.equals("0");if(!creating){try{id=sourceThread(id);}catch(IOException invalid){postError(client,"投稿先が不正です");return;}}
        String alias=form.get("bbs"),attachmentKey=alias+":"+(creating?"new":id);PendingImage selected=attachments.get(attachmentKey);if(selected!=null&&android.os.SystemClock.elapsedRealtime()-selected.created>600000){attachments.remove(attachmentKey,selected);postError(client,"添付画像の選択から10分経過しました。画像を選び直してください");return;}
        if(newsBoard(alias)){if(creating){postError(client,"関連ニュース一覧からの新規スレ作成には対応していません。元の板を開いてください");return;}board=newsSource(alias,id,board);}
        SitePostProtocol.Image image=selected==null?null:selected.image;
        String identity=board.url+":"+(creating?"new":id);if(!posting.add(identity)){postError(client,"この投稿先への送信を処理中です");return;}
        try{
            String source=creating?board.kind.equals("bakusai")?"https://bakusai.com/thr_tc0/"+board.path+"tp=1/":board.kind.equals("futaba")?board.url+"futaba.htm":board.url:board.threadUrl(id);
            String html=page(source),body=form.getOrDefault("MESSAGE","");
            if(newsBoard(alias)){board=BakusaiNews.canonical(source,id,html);saveNews(id,board.threadUrl(id));}
            String name=form.getOrDefault("FROM",""),email=form.getOrDefault("mail",""),password=prefs.getString("password:"+board.url,"");
            SitePostProtocol.Plan plan;
            try{
                if(creating)plan=SitePostProtocol.create(board,html,form.getOrDefault("subject",""),name,email,body,password,image);
                else{
                    // Validate the current form before fetching older pages for quote translation.
                    SitePostProtocol.Plan reply=SitePostProtocol.reply(board,id,html,name,email,body,password);
                    if(Pattern.compile(">>[1-9][0-9]{0,5}").matcher(body).find()){
                        body=SiteNativeData.originalQuotes(body,thread(board,id,html));reply=SitePostProtocol.reply(board,id,html,name,email,body,password);
                    }
                    plan=SitePostProtocol.attach(reply,board,html,image);
                }
            }
            catch(IOException invalid){postError(client,invalid.getMessage());return;}
            // Form tokens change on every GET; compare user content to prevent accidental resends.
            String signature=hash(identity+Arrays.asList(form.getOrDefault("subject",""),name,email,body,password).toString()+(image==null?"":hashBytes(image.bytes)));long now=android.os.SystemClock.elapsedRealtime();
            Long previous=sent.get(signature);if(previous!=null&&now-previous<120000){postError(client,"同じ投稿を直前に送信しました。スレを更新して確認してください");return;}
            if(!boardEnabled(board)){postError(client,"この板の「使用する」がオフです");return;}
            if(plan.check!=null){Response check=transport.post(plan,plan.check);if(check.status<200||check.status>=300){postError(client,"あにまんの投稿前確認で拒否されました（HTTP "+check.status+"）。認証・投稿内容を確認してください。"+AnimanchProtocol.postingError(check.text()));return;}}
            if(!boardEnabled(board)){postError(client,"この板の「使用する」がオフです");return;}
            // Once transmission starts, never automatically retry an uncertain result.
            sent.put(signature,now);if(sent.size()>256)sent.entrySet().removeIf(e->now-e.getValue()>120000);
            if(selected!=null)attachments.remove(attachmentKey,selected);
            Response response=transport.post(plan,plan.url);
            String answer=response.text(),resultId=creating?SitePostProtocol.createdThread(board,response.status,response.location,answer):id;
            if(creating&&resultId==null&&response.status==200){SitePostProtocol.Plan next=SitePostProtocol.confirmation(board,plan,answer);if(next!=null){
                confirmations.entrySet().removeIf(e->now-e.getValue().created>120000);if(confirmations.size()>=4){postError(client,"確認待ちの投稿があります。再送せず確認画面を閉じてください");return;}
                String confirmToken=UUID.randomUUID().toString();confirmations.put(confirmToken,new Confirmation(next,alias));
                StringBuilder hidden=new StringBuilder();for(String key:new String[]{"bbs","key","subject","FROM","mail","MESSAGE"})hidden.append("<input type=hidden name=\"").append(key).append("\" value=\"").append(org.jsoup.nodes.Entities.escape(form.getOrDefault(key,"")).replace("\"","&quot;")).append("\">");
                hidden.append("<input type=hidden name=haiagaruConfirm value=\"").append(confirmToken).append("\">");
                String preview=org.jsoup.nodes.Entities.escape(Jsoup.parse(answer).text());if(preview.length()>5000)preview=preview.substring(0,5000);
                send(client,200,"text/html; charset=Shift_JIS",SiteNativeData.wire("<html><head><title>書き込み確認</title></head><body><!-- 2ch_X:cookie -->"+preview+"<form method=POST action=\"/test/bbs.cgi\">"+hidden+"<input type=submit value=\"内容を確認して投稿する\"></form></body></html>"));return;
            }}
            String rejection=board.kind.equals("futaba")&&response.status==200?SitePostProtocol.futabaRejection(answer):"";
            if(!rejection.isEmpty()){sent.remove(signature);if(selected!=null)attachments.putIfAbsent(attachmentKey,selected);postError(client,rejection);return;}
            if(resultId==null||!creating&&!SitePostProtocol.success(board,id,response.status,response.location,answer)){postError(client,"投稿結果を確認できません（HTTP "+response.status+"）。再送せず、板・スレを更新して確認してください。"+(board.kind.equals("animanch")?AnimanchProtocol.postingError(answer):""));return;}
            if(image!=null&&board.kind.equals("animanch")){
                int number=AnimanchProtocol.postedReply(answer,resultId);if(!boardEnabled(board)){postError(client,"本文は送信済みです。「使用する」がオフになったため画像の送信を中止しました。本文を再送しないでください");return;}
                SitePostProtocol.Plan upload=SitePostProtocol.imageUpload(resultId,number,image);Response uploaded=transport.post(upload,upload.url);
                if(uploaded.status<200||uploaded.status>=300){postError(client,"本文は送信済みですが、画像の送信を確認できません。本文を再送せずスレを確認してください");return;}
            }
            send(client,200,"text/html; charset=Shift_JIS",SiteNativeData.wire("<html><head><title>書きこみました。</title></head><body><!-- 2ch_X:true -->書きこみました。</body></html>"));
        }catch(Exception failure){android.util.Log.w("Haiagaru","Additional board posting failed",failure);postError(client,"投稿を完了したか確認できません。スレを更新してください。"+safe(failure));}
        finally{posting.remove(identity);}
    }
    private void confirm(Socket client,SiteBoardProtocol.Board board,Map<String,String> form,String token)throws IOException{
        Confirmation pending=confirmations.remove(token);
        if(pending==null||!pending.alias.equals(form.get("bbs"))||!boardEnabled(pending.alias)||android.os.SystemClock.elapsedRealtime()-pending.created>120000){postError(client,"確認画面の期限が切れたか、この板の使用がオフです。板を確認してから操作し直してください");return;}
        String identity=board.url+":new";if(!posting.add(identity)){postError(client,"この板への投稿を処理中です");return;}
        try{Response result=transport.post(pending.plan,pending.plan.url);String id=SitePostProtocol.createdThread(board,result.status,result.location,result.text());if(id==null){postError(client,"投稿結果を確認できません。再送せず板を更新して確認してください");return;}
            send(client,200,"text/html; charset=Shift_JIS",SiteNativeData.wire("<html><head><title>書きこみました。</title></head><body><!-- 2ch_X:true -->書きこみました。</body></html>"));
        }catch(Exception failure){postError(client,"投稿結果を確認できません。再送せず板を更新して確認してください");}finally{posting.remove(identity);}
    }
    private static String safe(Exception error){String message=error.getMessage();return message!=null&&message.matches("HTTP [0-9]{3}")?message:"";}
    private static String readFailure(Exception error){
        String status=safe(error);if(!status.isEmpty())return status.equals("HTTP 403")?status+"：元サイトがアクセスを拒否しました。追加掲示板の認証を確認してください。":status;
        String message=error.getMessage();
        // Only bounded diagnostics from our parsers, never upstream HTML/cookies/URLs.
        return error instanceof IOException&&message!=null&&message.length()<=160
                &&message.matches("(?:対応する|爆サイ|ふたば|レス|本文|あにまん|スレ|取得|使用しない)[^<>\\r\\n]*")?message:"";
    }
    private static void postError(Socket client,String text)throws IOException{send(client,200,"text/html; charset=Shift_JIS",SiteNativeData.wire("<html><head><title>ERROR</title></head><body><!-- 2ch_X:error -->"+org.jsoup.nodes.Entities.escape(text)+"</body></html>"));}
    private static Map<String,String> form(byte[] bytes,String charset)throws IOException{
        LinkedHashMap<String,String> out=new LinkedHashMap<>();for(String part:new String(bytes,"ISO-8859-1").split("&")){
            String[] pair=part.split("=",2);String key=URLDecoder.decode(pair[0],charset),value=URLDecoder.decode(pair.length>1?pair[1]:"",charset);
            if(out.put(key,value)!=null)throw new IOException("Repeated form field");
        }return out;
    }
    private static void send(Socket client,int code,String type,byte[] body)throws IOException{
        OutputStream output=client.getOutputStream();String reason=code==200?"OK":code==404?"Not Found":code==403?"Forbidden":"Service Unavailable";
        output.write(("HTTP/1.1 "+code+" "+reason+"\r\nContent-Type: "+type.replace("\r","").replace("\n","")+"\r\nContent-Length: "+body.length+"\r\nConnection: close\r\nCache-Control: no-store\r\n\r\n").getBytes("US-ASCII"));output.write(body);output.flush();
    }
    private static String hash(String text){try{byte[] digest=MessageDigest.getInstance("SHA-256").digest(text.getBytes("UTF-8"));StringBuilder out=new StringBuilder();for(byte b:digest)out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();}catch(Exception impossible){throw new IllegalStateException(impossible);}}
    private static String hashBytes(byte[] bytes){try{byte[] digest=MessageDigest.getInstance("SHA-256").digest(bytes);StringBuilder out=new StringBuilder();for(byte b:digest)out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();}catch(Exception impossible){throw new IllegalStateException(impossible);}}
    private final class HttpTransport implements Transport {
        private final SiteSessionCookies sessionCookies=new SiteSessionCookies();
        @Override public Response get(String url)throws IOException{
            return getThumbnail(null,url);
        }
        @Override public Response getThumbnail(Context context,String url)throws IOException{
            for(int hop=0;hop<4;hop++){
                String addressForHop=url;
                Response r=ThumbnailRequestPacing.fetch(context,addressForHop,gate->{
                    Response response=request(addressForHop,null,null,null);
                    if(gate!=null)gate.check(response.status,response.retryAfter);
                    return response;
                });
                URI address=URI.create(url);
                if(r.status==200&&"bakusai.com".equals(address.getHost())&&address.getPath().startsWith("/thr_res/")&&SiteBoardProtocol.bakusaiEmptyMobile(r.text())){
                    // The public mobile page sometimes omits both article and replies. Try its
                    // desktop representation once; never change the user's stored browser UA.
                    Response desktop=request(url,null,null,null,"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36");
                    if(desktop.status==200&&Jsoup.parse(desktop.text()).selectFirst("#title_thr")!=null)r=desktop;
                }
                if(r.status<300||r.status>=400||r.location==null)return r;
                String target=SiteBoardProtocol.resolve(url,r.location);if(target==null||!URI.create(url).getHost().equals(URI.create(target).getHost()))throw new IOException("別サイトでの確認が必要です");url=target;
            }throw new IOException("移動が多すぎます");
        }
        @Override public Response post(SitePostProtocol.Plan plan,String target)throws IOException{
            String boundary="Haiagaru-"+UUID.randomUUID().toString();byte[] body=SitePostProtocol.encoded(plan,boundary);
            return request(target,body,plan.multipart?"multipart/form-data; boundary="+boundary:"application/x-www-form-urlencoded; charset=UTF-8",plan.referer);
        }
        private Response request(String address,byte[] body,String contentType,String referer)throws IOException{
            return request(address,body,contentType,referer,null);
        }
        private Response request(String address,byte[] body,String contentType,String referer,String overrideUa)throws IOException{
            URI uri=URI.create(address);String host=uri.getHost();boolean boardMenu="bbs-menu.pages.dev".equals(host)&&body==null&&uri.getRawQuery()==null&&(uri.getPath().matches("/bakusai_bbsmenu/[a-z]+_bbsmenu\\.json")||uri.getPath().equals("/animanch_bbsmenu/bbsmenu.json"));
            if(!"https".equals(uri.getScheme())||uri.getPort()!=-1||uri.getUserInfo()!=null||!(boardMenu||"bakusai.com".equals(host)||"img2.bakusai.com".equals(host)||"bbs.animanch.com".equals(host)||host!=null&&host.matches("[a-z0-9-]+\\.2chan\\.net")))throw new IOException("未対応の接続先です");
            HttpURLConnection c=(HttpURLConnection)uri.toURL().openConnection();c.setInstanceFollowRedirects(false);c.setConnectTimeout(8000);c.setReadTimeout(15000);
            boolean useCookies=prefs.getBoolean("cookies:"+host,false);
            String ua=overrideUa!=null?overrideUa:SiteAuthenticationPolicy.userAgent(host,useCookies,prefs.getString("browserUa",System.getProperty("http.agent","Haiagaru")));c.setRequestProperty("User-Agent",ua);
            if(useCookies){String cookie=CookieManager.getInstance().getCookie(address);if(cookie!=null&&!cookie.isEmpty())c.setRequestProperty("Cookie",cookie);}
            if((host.endsWith(".2chan.net")||host.equals("bakusai.com"))&&c.getRequestProperty("Cookie")==null){String cookie=sessionCookies.header(uri);if(!cookie.isEmpty())c.setRequestProperty("Cookie",cookie);}
            try{
                if(body!=null){c.setRequestMethod("POST");c.setDoOutput(true);c.setRequestProperty("Referer",referer);c.setRequestProperty("Origin","https://"+host);if("bbs.animanch.com".equals(host))c.setRequestProperty("X-Requested-With","XMLHttpRequest");c.setRequestProperty("Content-Type",contentType);c.setFixedLengthStreamingMode(body.length);try(OutputStream output=c.getOutputStream()){output.write(body);}}
                int status=c.getResponseCode();String type=c.getContentType();if(type==null)type="application/octet-stream";
                if(host.endsWith(".2chan.net")||host.equals("bakusai.com"))sessionCookies.receive(uri,c.getHeaderFields());
                if(useCookies)for(Map.Entry<String,List<String>> h:c.getHeaderFields().entrySet())if("Set-Cookie".equalsIgnoreCase(h.getKey()))for(String value:h.getValue())CookieManager.getInstance().setCookie(address,value);
                InputStream stream=status<400?c.getInputStream():c.getErrorStream();ByteArrayOutputStream data=new ByteArrayOutputStream();
                if(stream!=null)try(InputStream in=stream){byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(data.size()+n>12*1024*1024)throw new IOException("取得上限を超えました");data.write(buffer,0,n);}}
                return new Response(status,data.toByteArray(),type,c.getHeaderField("Location"),c.getHeaderField("Retry-After"));
            }finally{c.disconnect();}
        }
    }
}
