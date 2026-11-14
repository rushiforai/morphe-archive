package app.morphe.extension.chmate;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.*;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.*;
import android.provider.*;
import java.io.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Read-only recovery from the native cache, saved images and user-selected SAF trees. */
public final class LocalImageArchive {
    static final String PREFS="haiagaru.local-image-archive";
    static final long MAX_BYTES=32L*1024*1024;
    private static Context context;private static Database database;private static LocalImageRelay relay;
    private static final ExecutorService IO=Executors.newFixedThreadPool(2);
    private static final ExecutorService INDEX=Executors.newSingleThreadExecutor();
    private static final Map<String,String> READY=Collections.synchronizedMap(new LinkedHashMap<String,String>(128,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>1024;}});
    private static final Map<String,String> ORIGINALS=Collections.synchronizedMap(new LinkedHashMap<String,String>(128,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>2048;}});
    private static final Set<String> PENDING=ConcurrentHashMap.newKeySet();
    private static final Map<String,Long> CHECKED=Collections.synchronizedMap(new LinkedHashMap<String,Long>(128,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Long> e){return size()>2000;}});
    private static final AtomicBoolean SCANNING=new AtomicBoolean(),RESETTING=new AtomicBoolean();private static final AtomicInteger GENERATION=new AtomicInteger();
    private static long lastScan;private static volatile String status="未検索";
    private static final class Database extends SQLiteOpenHelper {
        Database(Context c){super(c,"haiagaru-local-image-index.db",null,1);setWriteAheadLoggingEnabled(true);}
        public void onCreate(SQLiteDatabase db){
            db.execSQL("CREATE TABLE urls(key TEXT PRIMARY KEY,hash TEXT NOT NULL)");
            db.execSQL("CREATE TABLE files(uri TEXT PRIMARY KEY,name TEXT,key TEXT,hash TEXT,size INTEGER,modified INTEGER,mime TEXT,manual INTEGER NOT NULL DEFAULT 0)");
            db.execSQL("CREATE INDEX image_content ON files(hash)");db.execSQL("CREATE INDEX image_url ON files(key)");
        }
        public void onUpgrade(SQLiteDatabase db,int oldVersion,int newVersion){}
    }
    static synchronized void initialize(Context source){if(context!=null)return;context=source.getApplicationContext();database=new Database(context);}
    static SharedPreferences prefs(Context c){return c.getSharedPreferences(PREFS,0);}
    static String status(){return status;}
    static boolean enabled(){return context!=null&&prefs(context).getBoolean("enabled",true);}
    static String originalUrl(String value){String original=ORIGINALS.get(value);return original==null?value:original;}
    static String copiedText(String text){
        if(text==null||!text.contains("/local-image/"))return text;
        java.util.regex.Matcher match=java.util.regex.Pattern.compile("http://127\\.0\\.0\\.1:[0-9]+/local-image/[a-f0-9]{32}\\.jpg").matcher(text);
        StringBuffer out=new StringBuffer();while(match.find())match.appendReplacement(out,java.util.regex.Matcher.quoteReplacement(originalUrl(match.group())));match.appendTail(out);return out.toString();
    }
    private static String identity(String raw){
        if(raw==null)return "";
        String source=ImageVpnController.imageIdentity(originalUrl(raw));
        try{source=SiteBoardGateway.get(context).originalUrl(source);}catch(Exception ignored){}
        return source.replace("https://bbs.animanch.com/arc/img/","https://bbs.animanch.com/img/");
    }
    private static String key(String raw){return PatrolImageRules.hash(identity(raw));}
    static String[] project(Object model,String[] original){
        if(original==null||context==null)return original;String[] result=original;
        if(enabled()&&original.length>0)ImgurAlbumAttachments.watchLocal(model);
        for(int i=0;i<original.length;i++){
            if(original[i]==null)continue;
            String raw=originalUrl(original[i]);String target=raw;
            if(enabled()){
                String id=key(raw);String ready=READY.get(id);
                if(ready!=null)target=ready;else lookup(raw,id,model);
            }
            if(!Objects.equals(target,original[i])){if(result==original)result=original.clone();result[i]=target;}
        }
        return result;
    }
    private static void lookup(String raw,String id,Object model){
        if(!web(identity(raw)))return;Long last=CHECKED.get(id);long now=SystemClock.elapsedRealtime();
        if(last!=null&&now-last<30000||PENDING.size()>=128||!PENDING.add("lookup:"+id))return;
        CHECKED.put(id,now);int generation=GENERATION.get();java.lang.ref.WeakReference<Object> row=new java.lang.ref.WeakReference<>(model);
        IO.execute(()->{try{
            prepare(id,identity(raw),generation);
            if(!READY.containsKey(id)){observe(raw);scan(false);}
            if(READY.containsKey(id)&&row.get()!=null)ImgurAlbumAttachments.localReady(row.get());
        }catch(Exception unavailable){}finally{PENDING.remove("lookup:"+id);}});
    }
    /** Called after a native cached stream was opened. This never initiates a download. */
    public static void observe(String raw){
        try{observeReady(raw);}catch(RuntimeException ignored){/* Native cache reads must retain their original result. */}
    }
    private static void observeReady(String raw){
        if(!enabled()||ORIGINALS.containsKey(raw))return;
        String id=key(raw);if(!web(identity(raw))||PENDING.size()>=128||!PENDING.add("observe:"+id))return;
        IO.execute(()->{try{
            SQLiteDatabase db=database.getReadableDatabase();
            try(Cursor existing=db.rawQuery("SELECT hash FROM urls WHERE key=?",new String[]{id})){if(existing.moveToFirst())return;}
            try(InputStream in=new RegisteredImageNativeCache(context).cachedOnly(raw)){
                if(in!=null){remember(id,digest(in));prepare(id,identity(raw),GENERATION.get());if(READY.containsKey(id))ImgurAlbumAttachments.refreshVideoModels();}
            }
        }catch(Exception unavailable){}finally{PENDING.remove("observe:"+id);}});
    }
    private static boolean web(String value){try{java.net.URI uri=java.net.URI.create(value);return ("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))&&uri.getHost()!=null&&uri.getUserInfo()==null&&!uri.getHost().equals("127.0.0.1");}catch(Exception invalid){return false;}}
    private static void remember(String key,String hash){ContentValues values=new ContentValues();values.put("key",key);values.put("hash",hash);database.getWritableDatabase().insertWithOnConflict("urls",null,values,SQLiteDatabase.CONFLICT_REPLACE);}
    static void associate(String source,Uri uri)throws Exception {
        if(!web(source))throw new IOException("元画像のhttp／https URLを入力してください");
        long size=0,modified=0;String name="画像";
        try(Cursor row=context.getContentResolver().query(uri,new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE},null,null,null)){
            if(row!=null&&row.moveToFirst()){name=row.getString(0);size=row.getLong(1);}
        }
        index(uri,name,size,modified,GENERATION.get());
        ContentValues manual=new ContentValues();manual.put("manual",1);
        database.getWritableDatabase().update("files",manual,"uri=?",new String[]{uri.toString()});
        try(Cursor row=database.getReadableDatabase().rawQuery("SELECT hash FROM files WHERE uri=?",new String[]{uri.toString()})){
            if(!row.moveToFirst())throw new IOException("対応する画像を読み取れません");remember(key(source),row.getString(0));
        }
        prepare(key(source),identity(source),GENERATION.get());ImgurAlbumAttachments.refreshVideoModels();
    }
    static void reset(){
        GENERATION.incrementAndGet();RESETTING.set(true);READY.clear();CHECKED.clear();
        synchronized(LocalImageArchive.class){if(relay!=null)relay.clear();}
        INDEX.execute(()->{try{database.getWritableDatabase().delete("files","manual=0",null);}finally{RESETTING.set(false);lastScan=0;scan(true);ImgurAlbumAttachments.refreshVideoModels();}});
    }
    static void unavailable(Uri uri){
        READY.clear();CHECKED.clear();
        INDEX.execute(()->{database.getWritableDatabase().delete("files","uri=?",new String[]{uri.toString()});scan(true);ImgurAlbumAttachments.refreshVideoModels();});
    }
    static synchronized void scan(boolean force){
        if(!enabled()||SCANNING.get()||!force&&SystemClock.elapsedRealtime()-lastScan<600000&&lastScan!=0)return;
        if(!SCANNING.compareAndSet(false,true))return;lastScan=SystemClock.elapsedRealtime();int generation=GENERATION.get();
        INDEX.execute(()->{android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);int[] count={0};try{
            status="保存画像の索引を作成しています…";
            if(Build.VERSION.SDK_INT>=29){
                Uri collection=MediaStore.Files.getContentUri("external");
                String paths="(relative_path LIKE 'Download/Haiagaru/%' OR relative_path LIKE 'Pictures/Haiagaru/%' OR relative_path LIKE 'Pictures/2chMate/%' OR relative_path LIKE 'Pictures/ChMate/%' OR relative_path LIKE 'Download/2chMate/%')";
                try(Cursor rows=context.getContentResolver().query(collection,new String[]{"_id","_display_name","_size","date_modified"},paths+" AND _size>0 AND _size<=? AND mime_type LIKE 'image/%'",new String[]{Long.toString(MAX_BYTES)},"date_modified DESC")){
                    while(rows!=null&&rows.moveToNext()&&count[0]<20000&&valid(generation)){
                        scanIndex(ContentUris.withAppendedId(collection,rows.getLong(0)),rows.getString(1),rows.getLong(2),rows.getLong(3),generation);progress(++count[0]);
                    }
                }catch(RuntimeException denied){/* SAF roots remain usable without broad storage permission. */}
            }else{
                for(String path:new String[]{"Download/Haiagaru","Pictures/Haiagaru","Pictures/2chMate","Pictures/ChMate"})
                    files(new File(Environment.getExternalStorageDirectory(),path),0,count,generation);
            }
            for(int n=0;n<2;n++){
                String value=prefs(context).getString("tree"+n,"");if(!value.isEmpty()&&valid(generation)){
                    Uri tree=Uri.parse(value);documents(tree,DocumentsContract.getTreeDocumentId(tree),0,count,new HashSet<>(),generation);
                }
            }
            status=valid(generation)?"索引を更新しました（"+count[0]+"枚）":"索引の更新を停止しました";
            READY.clear();CHECKED.clear();ImgurAlbumAttachments.refreshVideoModels();
        }catch(Exception denied){status="一部の画像を検索できませんでした。フォルダの権限を確認してください。";}
        finally{SCANNING.set(false);if(generation!=GENERATION.get()&&enabled())scan(true);}});
    }
    private static boolean valid(int generation){return enabled()&&generation==GENERATION.get()&&!Thread.currentThread().isInterrupted();}
    private static void progress(int count)throws InterruptedException {if(count%16==0){status="保存画像の索引を作成中："+count+"枚";Thread.sleep(20);}}
    private static void files(File root,int depth,int[] count,int generation)throws Exception {
        if(depth>8||!root.isDirectory()||!valid(generation))return;File[] entries=root.listFiles();if(entries==null)return;
        for(File file:entries){if(count[0]>=20000||!valid(generation))return;if(file.isDirectory())files(file,depth+1,count,generation);
            else if(file.length()>0&&file.length()<=MAX_BYTES){scanIndex(Uri.fromFile(file),file.getName(),file.length(),file.lastModified(),generation);progress(++count[0]);}}
    }
    private static void documents(Uri tree,String parent,int depth,int[] count,Set<String> visited,int generation)throws Exception {
        if(depth>8||visited.size()>=1000||!visited.add(parent)||!valid(generation))return;
        try(Cursor rows=context.getContentResolver().query(DocumentsContract.buildChildDocumentsUriUsingTree(tree,parent),new String[]{"document_id","_display_name","mime_type","_size","last_modified"},null,null,null)){
            while(rows!=null&&rows.moveToNext()&&count[0]<20000&&valid(generation)){
                String id=rows.getString(0),mime=rows.getString(2);
                if(DocumentsContract.Document.MIME_TYPE_DIR.equals(mime))documents(tree,id,depth+1,count,visited,generation);
                else if(mime!=null&&mime.startsWith("image/")&&rows.getLong(3)<=MAX_BYTES){scanIndex(DocumentsContract.buildDocumentUriUsingTree(tree,id),rows.getString(1),rows.getLong(3),rows.getLong(4),generation);progress(++count[0]);}
            }
        }
    }
    private static void scanIndex(Uri uri,String name,long size,long modified,int generation){
        try{index(uri,name,size,modified,generation);}catch(Exception unavailable){/* A moved or unreadable image must not stop the remaining folder scan. */}
    }
    private static void index(Uri uri,String name,long size,long modified,int generation)throws Exception {
        if(!valid(generation)||size>MAX_BYTES)return;
        int manual=0;
        try(Cursor old=database.getReadableDatabase().rawQuery("SELECT size,modified,manual FROM files WHERE uri=?",new String[]{uri.toString()})){
            if(old.moveToFirst()){manual=old.getInt(2);if(size>0&&modified>0&&old.getLong(0)==size&&old.getLong(1)==modified)return;}
        }
        BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;
        try(InputStream in=context.getContentResolver().openInputStream(uri)){if(in==null)return;BitmapFactory.decodeStream(in,null,bounds);}
        if(bounds.outWidth<1||bounds.outHeight<1||bounds.outMimeType==null||!bounds.outMimeType.matches("image/[a-zA-Z0-9.+-]+"))return;
        String hash;try(InputStream in=context.getContentResolver().openInputStream(uri)){if(in==null)return;hash=digest(in);}
        if(size<=0){try(Cursor row=context.getContentResolver().query(uri,new String[]{OpenableColumns.SIZE},null,null,null)){if(row!=null&&row.moveToFirst())size=row.getLong(0);}}
        if(size<=0||size>MAX_BYTES)return;
        ContentValues values=new ContentValues();values.put("uri",uri.toString());values.put("name",name);values.put("size",size);values.put("modified",modified);values.put("hash",hash);values.put("mime",bounds.outMimeType);values.put("manual",manual);
        if(name!=null&&name.matches("(?i)[0-9a-f]{64}\\.[a-z0-9]{1,6}"))values.put("key",name.substring(0,64).toLowerCase(Locale.ROOT));
        if(valid(generation))database.getWritableDatabase().insertWithOnConflict("files",null,values,SQLiteDatabase.CONFLICT_REPLACE);
    }
    static String digest(InputStream input)throws Exception {
        MessageDigest digest=MessageDigest.getInstance("SHA-256");byte[] buffer=new byte[16384];long total=0;int n;
        while((n=input.read(buffer))!=-1){total+=n;if(total>MAX_BYTES)throw new IOException("画像の上限32MBを超えています");digest.update(buffer,0,n);}
        if(total==0)throw new IOException("空の画像です");StringBuilder out=new StringBuilder();for(byte b:digest.digest())out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();
    }
    private static void prepare(String id,String original,int generation)throws Exception {
        if(RESETTING.get())return;
        String hash=null;try(Cursor row=database.getReadableDatabase().rawQuery("SELECT hash FROM urls WHERE key=?",new String[]{id})){if(row.moveToFirst())hash=row.getString(0);}
        // Once content is known, a matching file name alone must not select a different image.
        try(Cursor files=database.getReadableDatabase().rawQuery("SELECT uri,mime,size,hash FROM files WHERE "+(hash==null?"key=?":"hash=?")+" ORDER BY modified DESC LIMIT 8",new String[]{hash==null?id:hash})){
            while(files.moveToNext()&&valid(generation)){
                Uri uri=Uri.parse(files.getString(0));try(InputStream in=context.getContentResolver().openInputStream(uri)){
                    if(in==null||!digest(in).equals(files.getString(3)))continue;
                }catch(Exception missing){continue;}
                if(!valid(generation)||RESETTING.get())return;
                String target;synchronized(LocalImageArchive.class){if(relay==null)relay=new LocalImageRelay(context);target=relay.register(uri,files.getString(1),files.getLong(2));}
                remember(id,files.getString(3));ORIGINALS.put(target,original);READY.put(id,target);return;
            }
        }
    }
}
