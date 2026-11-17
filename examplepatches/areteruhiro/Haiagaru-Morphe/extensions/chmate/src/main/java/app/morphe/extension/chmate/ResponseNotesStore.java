package app.morphe.extension.chmate;

import android.content.*;import android.database.*;import android.database.sqlite.*;import java.util.*;

/** Private notes; native response bodies, DATs and NG/search data stay untouched. */
public final class ResponseNotesStore extends SQLiteOpenHelper {
    private static ResponseNotesStore instance;
    public static synchronized ResponseNotesStore get(Context context){if(instance==null)instance=new ResponseNotesStore(context);return instance;}
    public static final class Note {
        public final String id,url,title,text,source;public final int number;public final long updated;
        public Note(String id,String url,String title,String text,String source,int number,long updated){this.id=id;this.url=url;this.title=title;this.text=text;this.source=source;this.number=number;this.updated=updated;}
    }
    public ResponseNotesStore(Context context){super(context.getApplicationContext(),"haiagaru-response-notes.db",null,1);}
    public void onCreate(SQLiteDatabase db){db.execSQL("CREATE TABLE notes(id TEXT PRIMARY KEY,url TEXT NOT NULL,title TEXT NOT NULL,text TEXT NOT NULL,source TEXT NOT NULL,number INTEGER NOT NULL,updated INTEGER NOT NULL)");db.execSQL("CREATE INDEX notes_updated ON notes(updated DESC)");db.execSQL("CREATE UNIQUE INDEX notes_response ON notes(url) WHERE url<>''");}
    public void onUpgrade(SQLiteDatabase db,int oldVersion,int newVersion){}
    private static String clean(String value,int max){return value==null?"":value.substring(0,Math.min(value.length(),max));}
    private Note row(Cursor c){return new Note(c.getString(0),c.getString(1),c.getString(2),c.getString(3),c.getString(4),c.getInt(5),c.getLong(6));}
    public Note find(String id){try(Cursor c=getReadableDatabase().rawQuery("SELECT * FROM notes WHERE id=?",new String[]{id})){return c.moveToFirst()?row(c):null;}}
    public Note response(String url){if(url==null||url.isEmpty())return null;try(Cursor c=getReadableDatabase().rawQuery("SELECT * FROM notes WHERE url=?",new String[]{url})){return c.moveToFirst()?row(c):null;}}
    public List<Note> search(String query){
        String term=clean(query,160).trim().replace("\\","\\\\").replace("%","\\%").replace("_","\\_");
        String where=term.isEmpty()?null:"title LIKE ? ESCAPE '\\' OR text LIKE ? ESCAPE '\\' OR source LIKE ? ESCAPE '\\'";
        String[] args=term.isEmpty()?null:new String[]{"%"+term+"%","%"+term+"%","%"+term+"%"};ArrayList<Note> result=new ArrayList<>();
        try(Cursor c=getReadableDatabase().query("notes",null,where,args,null,null,"updated DESC, id ASC","500")){while(c.moveToNext())result.add(row(c));}return result;
    }
    public String save(Note note){
        if(note.text==null||note.text.trim().isEmpty())throw new IllegalArgumentException("メモを入力してください");
        String id=note.id==null||note.id.isEmpty()?UUID.randomUUID().toString():note.id;
        if(!id.matches("[a-f0-9-]{36}"))throw new IllegalArgumentException("invalid note ID");
        if(!note.url.isEmpty()){java.net.URI u=java.net.URI.create(note.url);if(!("http".equalsIgnoreCase(u.getScheme())||"https".equalsIgnoreCase(u.getScheme()))||u.getHost()==null||u.getUserInfo()!=null)throw new IllegalArgumentException("invalid source URL");}
        ContentValues values=new ContentValues();values.put("id",id);values.put("url",clean(note.url,8192));values.put("title",clean(note.title,160));values.put("text",clean(note.text,30000));values.put("source",clean(note.source,4000));values.put("number",note.number);values.put("updated",System.currentTimeMillis());
        SQLiteDatabase db=getWritableDatabase();db.beginTransaction();try{
            if(!note.url.isEmpty()){Note existing=response(note.url);if(existing!=null){id=existing.id;values.put("id",id);}}
            if(db.insertWithOnConflict("notes",null,values,SQLiteDatabase.CONFLICT_REPLACE)<0)throw new SQLException("Note was not saved");db.setTransactionSuccessful();return id;
        }finally{db.endTransaction();}
    }
    public void remove(String id){getWritableDatabase().delete("notes","id=?",new String[]{id});}
}
