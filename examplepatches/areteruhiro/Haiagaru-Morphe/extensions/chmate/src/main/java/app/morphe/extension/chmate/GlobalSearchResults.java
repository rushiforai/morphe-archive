package app.morphe.extension.chmate;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;

/** Completed per-query snapshots. Partial results remain in their running foreground job. */
final class GlobalSearchResults {
    static final int MAX_BYTES=2*1024*1024, MAX_ROWS=5000;
    private static Database database;
    static final class Result {
        final String id,query,text,status; final long updated; final boolean partial;
        Result(String id,String query,String text,long updated,String status,boolean partial){
            this.id=id;this.query=query;this.text=text;this.updated=updated;this.status=status;this.partial=partial;
        }
    }
    private static final class Database extends SQLiteOpenHelper {
        Database(Context c){super(c,"haiagaru-global-search.db",null,1);}
        public void onCreate(SQLiteDatabase d){d.execSQL("CREATE TABLE results(id TEXT PRIMARY KEY,query TEXT NOT NULL,data BLOB NOT NULL,updated INTEGER NOT NULL,status TEXT NOT NULL)");}
        public void onUpgrade(SQLiteDatabase d,int old,int next){}
    }
    private static synchronized Database db(Context c){if(database==null)database=new Database(c.getApplicationContext());return database;}
    static String key(String query){
        try{byte[] digest=MessageDigest.getInstance("SHA-256").digest(query.trim().getBytes(StandardCharsets.UTF_8));
            char[] hex="0123456789abcdef".toCharArray(),out=new char[digest.length*2];
            for(int i=0;i<digest.length;i++){int value=digest[i]&255;out[i*2]=hex[value>>>4];out[i*2+1]=hex[value&15];}return new String(out);}
        catch(Exception e){throw new IllegalStateException(e);}
    }
    static SharedPreferences metadata(Context c){return c.getSharedPreferences("haiagaru-global-search-results",0);}
    static long date(Context c,String query){return metadata(c).getLong(key(query)+".date",0);}
    static String latest(Context c,String query){return metadata(c).getString(key(query)+".id",null);}
    static String dateLabel(long date){return new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm",Locale.getDefault()).format(new Date(date));}
    static synchronized void save(Context c,Result r)throws IOException {
        byte[] raw=r.text.getBytes(StandardCharsets.UTF_8);
        if(raw.length>MAX_BYTES)throw new IOException("検索結果が保存上限を超えました");
        ByteArrayOutputStream out=new ByteArrayOutputStream();try(GZIPOutputStream zip=new GZIPOutputStream(out)){zip.write(raw);}
        if(out.size()>900000)throw new IOException("検索結果が保存上限を超えました");
        ContentValues row=new ContentValues();row.put("id",r.id);row.put("query",r.query);row.put("data",out.toByteArray());row.put("updated",r.updated);row.put("status",r.status);
        SQLiteDatabase d=db(c).getWritableDatabase();d.insertOrThrow("results",null,row);
        SharedPreferences.Editor meta=metadata(c).edit().putString(key(r.query)+".id",r.id).putLong(key(r.query)+".date",r.updated);
        try(Cursor rows=d.rawQuery("SELECT id,query,length(data) FROM results ORDER BY updated DESC",null)){
            int count=0;long size=0;while(rows.moveToNext()){count++;size+=rows.getLong(2);if(count>50||size>24*1024*1024){
                String id=rows.getString(0),q=rows.getString(1);d.delete("results","id=?",new String[]{id});
                if(!q.equals(r.query)&&id.equals(latest(c,q)))meta.remove(key(q)+".id").remove(key(q)+".date");
            }}
        }meta.commit();
    }
    static Result read(Context c,String id)throws IOException{
        if(id==null||!id.matches("[0-9a-f-]{36}"))return null;
        try(Cursor rows=db(c).getReadableDatabase().rawQuery("SELECT query,data,updated,status FROM results WHERE id=?",new String[]{id})){
            if(!rows.moveToFirst())return null;
            ByteArrayOutputStream out=new ByteArrayOutputStream();
            try(InputStream in=new GZIPInputStream(new ByteArrayInputStream(rows.getBlob(1)))){
                byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(out.size()+n>MAX_BYTES)throw new IOException("保存結果が不正です");out.write(buffer,0,n);}
            }return new Result(id,rows.getString(0),out.toString("UTF-8"),rows.getLong(2),rows.getString(3),false);
        }
    }
    /** Deduplicate progressive updates; reject invalid/truncated TSV records. */
    static String merge(String first,String second){
        LinkedHashMap<String,String> rows=new LinkedHashMap<>();int bytes=0;
        for(String source:new String[]{first,second}){
            if(source==null)continue;
            for(String line:source.split("\n")){
                String[] f=line.split("\t",-1);if(f.length!=3||!f[1].matches("[0-9]{1,7}"))continue;
                try{java.net.URI u=java.net.URI.create(f[2]);if(u.getHost()==null||u.getUserInfo()!=null||!("https".equals(u.getScheme())||"http".equals(u.getScheme())))continue;}catch(RuntimeException invalid){continue;}
                String key=GlobalTitleSearchRules.key(f[2]);if(rows.containsKey(key))continue;
                int length=line.getBytes(StandardCharsets.UTF_8).length+1;
                if(rows.size()>=MAX_ROWS||bytes+length>MAX_BYTES)continue;
                rows.put(key,line);bytes+=length;
            }
        }return String.join(Character.toString(10),rows.values())+(rows.isEmpty()?"":Character.toString(10));
    }
    static int count(String text){if(text==null||text.isEmpty())return 0;int n=0;for(int i=0;i<text.length();i++)if(text.charAt(i)==10)n++;return n;}
    private GlobalSearchResults(){}
}
