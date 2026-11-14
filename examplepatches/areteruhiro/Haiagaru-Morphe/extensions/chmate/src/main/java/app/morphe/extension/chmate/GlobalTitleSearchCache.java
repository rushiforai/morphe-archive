package app.morphe.extension.chmate;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.zip.*;

/** Bounded, compressed snapshots. The fast search never opens a network connection. */
final class GlobalTitleSearchCache {
    private static final int MAX_TEXT=2*1024*1024;
    private static final long MAX_STORE=64L*1024*1024;
    private static Database database;
    private static final AtomicInteger WRITES=new AtomicInteger();
    private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(1,1,0,TimeUnit.SECONDS,new ArrayBlockingQueue<>(64),
            r->{Thread t=new Thread(r,"Haiagaru-title-index");t.setDaemon(true);return t;},new ThreadPoolExecutor.DiscardOldestPolicy());
    private static final class Database extends SQLiteOpenHelper {
        Database(Context context){super(context,"haiagaru-title-snapshots.db",null,1);setWriteAheadLoggingEnabled(true);}
        public void onCreate(SQLiteDatabase db){db.execSQL("CREATE TABLE subjects(url TEXT PRIMARY KEY,data BLOB NOT NULL,updated INTEGER NOT NULL)");}
        public void onUpgrade(SQLiteDatabase db,int oldVersion,int newVersion){}
    }
    private static synchronized Database database(Context context){if(database==null)database=new Database(context.getApplicationContext());return database;}
    static void remember(Context context,String identity,String text){
        if(context==null||identity==null||text==null||text.length()>MAX_TEXT)return;
        Context app=context.getApplicationContext();
        IO.execute(()->{try{
            byte[] bytes=text.getBytes(StandardCharsets.UTF_8);if(bytes.length>MAX_TEXT)return;
            ByteArrayOutputStream out=new ByteArrayOutputStream();try(GZIPOutputStream gzip=new GZIPOutputStream(out)){gzip.write(bytes);}
            if(out.size()>1024*1024)return; // Keep each SQLite cursor row below its window limit.
            ContentValues row=new ContentValues();row.put("url",identity);row.put("data",out.toByteArray());row.put("updated",System.currentTimeMillis());
            SQLiteDatabase db=database(app).getWritableDatabase();db.insertWithOnConflict("subjects",null,row,SQLiteDatabase.CONFLICT_REPLACE);
            if(WRITES.incrementAndGet()%16==0){long size=0;int count=0;try(Cursor rows=db.rawQuery("SELECT url,length(data) FROM subjects ORDER BY updated DESC",null)){
                while(rows.moveToNext()){size+=rows.getLong(1);if(++count>10000||size>MAX_STORE)db.delete("subjects","url=?",new String[]{rows.getString(0)});}
            }}
        }catch(Exception unavailable){android.util.Log.w("HaiagaruSearch","Cannot save title snapshot",unavailable);}});
    }
    interface Visitor {boolean visit(String identity,String text,long updated)throws Exception;}
    static void read(Context context,java.util.Set<String> wanted,Visitor visitor)throws Exception{
        if(wanted.isEmpty())return;
        try(Cursor rows=database(context).getReadableDatabase().rawQuery("SELECT url,data,updated FROM subjects ORDER BY updated DESC",null)){
            while(rows.moveToNext()){
                String id=rows.getString(0);if(!wanted.contains(id))continue;
                ByteArrayOutputStream out=new ByteArrayOutputStream();try(InputStream in=new GZIPInputStream(new ByteArrayInputStream(rows.getBlob(1)))){
                    byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(out.size()+n>MAX_TEXT)throw new IOException("Snapshot too large");out.write(buffer,0,n);}
                }catch(IOException corrupt){continue;}
                if(!visitor.visit(id,new String(out.toByteArray(),StandardCharsets.UTF_8),rows.getLong(2)))break;
            }
        }
    }
    private GlobalTitleSearchCache(){}
}
