package app.morphe.extension.chmate;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.*;
import android.os.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Bounded read-only metadata acquisition for visible native thread-list rows. */
public final class SiteThreadMetadata {
    private static final ExecutorService IO=Executors.newFixedThreadPool(2);
    private static final Map<String,Long> CACHE=Collections.synchronizedMap(new LinkedHashMap<String,Long>(128,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Long> e){return size()>2000;}});
    private static final Map<String,Long> FAILED=Collections.synchronizedMap(new LinkedHashMap<String,Long>(128,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Long> e){return size()>2000;}});
    private static final Set<String> PENDING=ConcurrentHashMap.newKeySet();
    private static final Map<Object,Boolean> ADAPTERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<String,Field> FIELDS=new ConcurrentHashMap<>();
    private static final ThreadLocal<Binding> CURRENT=new ThreadLocal<>();
    private static final AtomicBoolean REFRESH=new AtomicBoolean();
    private static final AtomicInteger WRITES=new AtomicInteger();
    private static Database database;
    private static final class Binding {final SiteBoardGateway gateway;final String board;long thread;int count;Binding(SiteBoardGateway gateway,String board){this.gateway=gateway;this.board=board;}}
    private static final class Database extends SQLiteOpenHelper {
        Database(Context context){super(context,"haiagaru-site-metadata.db",null,1);}
        public void onCreate(SQLiteDatabase db){db.execSQL("CREATE TABLE creation(board TEXT NOT NULL,thread TEXT NOT NULL,created INTEGER NOT NULL,visited INTEGER NOT NULL,PRIMARY KEY(board,thread))");db.execSQL("CREATE INDEX creation_age ON creation(visited)");}
        public void onUpgrade(SQLiteDatabase db,int oldVersion,int newVersion){}
    }
    private static synchronized void initialize(Context context){
        if(database!=null)return;database=new Database(context.getApplicationContext());
        IO.execute(()->{try(Cursor rows=database.getReadableDatabase().rawQuery("SELECT board,thread,created FROM creation ORDER BY visited DESC LIMIT 2000",null)){while(rows.moveToNext())CACHE.put(rows.getString(0)+":"+rows.getString(1),rows.getLong(2));refresh();}catch(RuntimeException unavailable){/* Cache absence does not affect the native reader. */}});
    }
    private static Field field(Object object,String name)throws Exception{String key=object.getClass().getName()+":"+name;Field found=FIELDS.get(key);if(found!=null)return found;found=object.getClass().getDeclaredField(name);found.setAccessible(true);FIELDS.put(key,found);return found;}
    public static void begin(Object adapter){
        CURRENT.remove();if(adapter==null)return;String type=adapter.getClass().getName(),member=type.equals("o.m8a")?"r":type.equals("o.getWriteBytesTotal")?"g":type.equals("o.zzavb")?"c":null;if(member==null)return;
        Context context=Haiagaru.applicationContextForExtension();if(context==null)return;
        try{Object info=field(adapter,member).get(adapter);if(info==null)return;String[] members=ExternalBoardEditor.infoFields().split(",");if(members.length!=2)return;String host=(String)field(info,members[0]).get(info),key=(String)field(info,members[1]).get(info);if(host==null||!host.startsWith("127.0.0.1:")||key==null||!key.matches(SiteBoardGateway.KEY_PATTERN))return;SiteBoardGateway gateway=SiteBoardGateway.get(context);if(!gateway.registrationUrl(key).equals("http://"+host+"/"+key+"/"))return;initialize(context);CURRENT.set(new Binding(gateway,key));ADAPTERS.put(adapter,true);}catch(Exception ignored){/* Only the exact registered site namespace is eligible. */}
    }
    public static void subject(Object row){
        Binding state=CURRENT.get();if(state==null||row==null)return;
        String type=row.getClass().getName(),id=type.equals("o.MaxAdViewImplExternalSyntheticLambda1")?"e":type.equals("o.CertificateChainCleaner")?"b":type.equals("o.setSkipText")?"d":null,count=type.equals("o.MaxAdViewImplExternalSyntheticLambda1")?"a":type.equals("o.CertificateChainCleaner")?"e":type.equals("o.setSkipText")?"b":null;
        if(id==null)return;try{state.thread=field(row,id).getLong(row);state.count=field(row,count).getInt(row);String source=SiteThreadIds.source(Long.toString(state.thread));String key=state.board+":"+source;if(!CACHE.containsKey(key))acquire(state.gateway,state.board,source);}catch(Exception ignored){state.thread=0;state.count=0;}
    }
    static String currentBoard(){Binding binding=CURRENT.get();return binding==null?null:binding.board;}
    public static long epoch(long original){
        try{
            String source=SiteThreadIds.source(Long.toString(original));
            Binding state=CURRENT.get();
            if(state!=null){Long created=CACHE.get(state.board+":"+source);return created==null?original:created;}
            // External-board thread IDs live in ChMate's non-date namespace. The
            // title popup formats them outside the list adapter's board scope, so
            // resolve only a unique cached creation date across registered sites.
            if(original<=SiteThreadIds.BASE||original>=SiteThreadIds.BASE*2)return original;
            synchronized(CACHE){
                return SiteThreadDates.uniqueCachedDate(CACHE,source,original);
            }
        }catch(Exception unknown){return original;}
    }
    public static long momentum(long original){Binding state=CURRENT.get();if(state==null||state.thread<SiteThreadIds.BASE)return original;long created=epoch(state.thread);return created==state.thread?original:SiteThreadDates.momentum(state.count,created,System.currentTimeMillis()/1000);}
    public static void end(){CURRENT.remove();}
    static void remember(String board,String thread,long created){
        if(created<=0||!board.matches(SiteBoardGateway.KEY_PATTERN))return;Context context=Haiagaru.applicationContextForExtension();if(context==null)return;initialize(context);String key=board+":"+thread;Long previous=CACHE.put(key,created);if(previous!=null&&previous==created)return;
        IO.execute(()->{try{ContentValues values=new ContentValues();values.put("board",board);values.put("thread",thread);values.put("created",created);values.put("visited",System.currentTimeMillis());SQLiteDatabase db=database.getWritableDatabase();db.insertWithOnConflict("creation",null,values,SQLiteDatabase.CONFLICT_REPLACE);if(WRITES.incrementAndGet()%200==0)db.execSQL("DELETE FROM creation WHERE rowid NOT IN (SELECT rowid FROM creation ORDER BY visited DESC LIMIT 20000)");}catch(RuntimeException unavailable){/* RAM cache is still usable. */}});refresh();
    }
    private static void acquire(SiteBoardGateway gateway,String board,String thread){
        String key=board+":"+thread;Long retry=FAILED.get(key);if(retry!=null&&retry>SystemClock.elapsedRealtime()||PENDING.size()>=200||!PENDING.add(key))return;
        IO.execute(()->{try{
            if(!gateway.boardEnabled(board))return;
            try(Cursor row=database.getReadableDatabase().rawQuery("SELECT created FROM creation WHERE board=? AND thread=?",new String[]{board,thread})){if(row.moveToFirst()){CACHE.put(key,row.getLong(0));refresh();return;}}
            long created=gateway.creationTime(board,thread);if(created>0){FAILED.remove(key);remember(board,thread,created);}else FAILED.put(key,SystemClock.elapsedRealtime()+15*60*1000);
        }catch(Exception unavailable){FAILED.put(key,SystemClock.elapsedRealtime()+15*60*1000);}finally{PENDING.remove(key);}});
    }
    private static void refresh(){
        if(!REFRESH.compareAndSet(false,true))return;new Handler(Looper.getMainLooper()).postDelayed(()->{REFRESH.set(false);List<Object> adapters;synchronized(ADAPTERS){adapters=new ArrayList<>(ADAPTERS.keySet());}for(Object adapter:adapters)if(adapter!=null)try{adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);}catch(Exception ignored){/* The next ordinary rebind still reads the cache. */}},500);
    }
    private SiteThreadMetadata(){}
}
