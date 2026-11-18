package app.template.extension.extension;

import android.content.Context;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.util.ArrayList;

/** Durable snapshots with a transactionally checked printer generation. */
public final class ActivityStore extends SQLiteOpenHelper implements CacheCoordinator.Storage {
    public static final String DATABASE_NAME="morphe_activity_v1.db";
    public ActivityStore(Context context){super(context,DATABASE_NAME,null,1);}
    @Override public void onConfigure(SQLiteDatabase db){super.onConfigure(db);db.setForeignKeyConstraintsEnabled(true);}
    @Override public void onCreate(SQLiteDatabase db){
        db.execSQL("CREATE TABLE printers (id TEXT PRIMARY KEY, generation INTEGER NOT NULL, active INTEGER NOT NULL)");
        db.execSQL("CREATE TABLE identities (printer_id TEXT PRIMARY KEY REFERENCES printers(id), mac TEXT NOT NULL UNIQUE, name TEXT, last_address TEXT UNIQUE, changed INTEGER NOT NULL)");
        db.execSQL("CREATE TABLE addresses (printer_id TEXT NOT NULL REFERENCES printers(id), address TEXT NOT NULL, ordinal INTEGER NOT NULL, PRIMARY KEY(printer_id,address))");
        db.execSQL("CREATE TABLE cache_entries (printer_id TEXT NOT NULL REFERENCES printers(id), context_id TEXT NOT NULL, oid TEXT NOT NULL, value TEXT NOT NULL, PRIMARY KEY(printer_id,context_id,oid))");
        db.execSQL("CREATE TABLE bursts (id TEXT PRIMARY KEY, printer_id TEXT NOT NULL REFERENCES printers(id), sequence INTEGER NOT NULL, wall INTEGER NOT NULL, elapsed INTEGER NOT NULL, endpoint TEXT, requests_complete INTEGER NOT NULL, responses_complete INTEGER NOT NULL, matched INTEGER NOT NULL, hits INTEGER NOT NULL, UNIQUE(printer_id,sequence))");
        db.execSQL("CREATE TABLE requests (burst_id TEXT NOT NULL REFERENCES bursts(id) ON DELETE CASCADE, ordinal INTEGER NOT NULL, token TEXT NOT NULL, oid TEXT NOT NULL, start INTEGER NOT NULL, end INTEGER NOT NULL, cached INTEGER NOT NULL, outcome TEXT NOT NULL, response BLOB, endpoint TEXT, port INTEGER, version INTEGER, request_id INTEGER, timeout INTEGER, retries INTEGER, context_id TEXT, response_type TEXT, detail_outcome TEXT, sample INTEGER, PRIMARY KEY(burst_id,ordinal))");
        db.execSQL("CREATE TABLE replay_runs (id TEXT PRIMARY KEY, burst_id TEXT NOT NULL REFERENCES bursts(id) ON DELETE CASCADE, endpoint TEXT NOT NULL, elapsed INTEGER NOT NULL)");
        db.execSQL("CREATE TABLE replay_responses (run_id TEXT NOT NULL REFERENCES replay_runs(id) ON DELETE CASCADE, ordinal INTEGER NOT NULL, token TEXT NOT NULL, response BLOB, PRIMARY KEY(run_id,ordinal))");
        db.execSQL("CREATE TABLE counters (name TEXT PRIMARY KEY, next INTEGER NOT NULL)");
        db.execSQL("INSERT INTO counters(name,next) VALUES ('sequence',1)");
    }
    @Override public void onUpgrade(SQLiteDatabase db,int oldVersion,int newVersion){throw new IllegalStateException("Unsupported activity database upgrade");}
    public long registerPrinter(String id){
        if(id==null||id.isEmpty())throw new IllegalArgumentException(); SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
        try{ContentValues v=new ContentValues();v.put("id",id);v.put("generation",0);v.put("active",1);db.insertWithOnConflict("printers",null,v,SQLiteDatabase.CONFLICT_IGNORE);
            long g;try(Cursor c=db.rawQuery("SELECT generation,active FROM printers WHERE id=?",new String[]{id})){if(!c.moveToFirst()||c.getInt(1)!=1)throw new IllegalStateException("Cleared printer ID cannot be reused");g=c.getLong(0);}
            db.setTransactionSuccessful();return g;
        }finally{db.endTransaction();}
    }
    /** Resolve only after the caller has verified the hardware address from the printer. */
    public PrinterRecord resolveVerified(String address,String mac,String name){
        if(address==null||address.isEmpty()||mac==null||!mac.matches("(?i)[0-9a-f]{2}(:[0-9a-f]{2}){5}"))throw new IllegalArgumentException();
        mac=mac.toLowerCase(java.util.Locale.ROOT);
        if((Integer.parseInt(mac.substring(0,2),16)&1)!=0||mac.equals("00:00:00:00:00:00"))throw new IllegalArgumentException();
        SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
        try{
            String id=null,old=null;boolean changed=false;
            try(Cursor c=db.rawQuery("SELECT printer_id,last_address,changed,name FROM identities WHERE mac=?",new String[]{mac})){
                if(c.moveToFirst()){id=c.getString(0);old=c.getString(1);changed=c.getInt(2)!=0;if(name==null)name=c.getString(3);}
            }
            if(id==null){id=java.util.UUID.randomUUID().toString();ContentValues p=new ContentValues();p.put("id",id);p.put("generation",0);p.put("active",1);db.insertOrThrow("printers",null,p);ContentValues v=new ContentValues();v.put("printer_id",id);v.put("mac",mac);v.put("changed",0);db.insertOrThrow("identities",null,v);}
            if(old==null){try(Cursor c=db.rawQuery("SELECT address FROM addresses WHERE printer_id=? ORDER BY ordinal DESC LIMIT 1",new String[]{id})){if(c.moveToFirst())old=c.getString(0);}}
            changed=changed||(old!=null&&!old.equals(address));
            db.execSQL("UPDATE identities SET last_address=NULL WHERE last_address=? AND printer_id<>?",new Object[]{address,id});
            ContentValues v=new ContentValues();v.put("name",name);v.put("last_address",address);v.put("changed",changed?1:0);db.update("identities",v,"printer_id=?",new String[]{id});
            long ordinal=0;try(Cursor c=db.rawQuery("SELECT COALESCE(MAX(ordinal),-1)+1 FROM addresses WHERE printer_id=?",new String[]{id})){if(c.moveToFirst())ordinal=c.getLong(0);}
            ContentValues a=new ContentValues();a.put("printer_id",id);a.put("address",address);a.put("ordinal",ordinal);db.insertWithOnConflict("addresses",null,a,SQLiteDatabase.CONFLICT_IGNORE);
            ArrayList<String> history=new ArrayList<>();try(Cursor c=db.rawQuery("SELECT address FROM addresses WHERE printer_id=? ORDER BY ordinal,rowid",new String[]{id})){while(c.moveToNext())history.add(c.getString(0));}
            PrinterRecord result=new PrinterRecord(id,name,address,mac,history,changed);db.setTransactionSuccessful();return result;
        }finally{db.endTransaction();}
    }
    /** Reserve a durable block before assigning numbers on the request path. */
    public long reserveSequences(int count){
        if(count<1)throw new IllegalArgumentException();SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
        try{long first;try(Cursor c=db.rawQuery("SELECT next FROM counters WHERE name='sequence'",null)){if(!c.moveToFirst())throw new IllegalStateException();first=c.getLong(0);}
            if(first>Long.MAX_VALUE-count)throw new IllegalStateException("Sequence exhausted");
            db.execSQL("UPDATE counters SET next=? WHERE name='sequence'",new Object[]{first+count});db.setTransactionSuccessful();return first;
        }finally{db.endTransaction();}
    }
    public boolean publish(ActivityBurst burst,long generation){
        if(burst.requests().size()>4096)throw new IllegalArgumentException("Too many recorded requests");
        SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
        try{try(Cursor c=db.rawQuery("SELECT generation,active FROM printers WHERE id=?",new String[]{burst.ref.printerId})){
                if(!c.moveToFirst()||c.getLong(0)!=generation||c.getInt(1)!=1)return false;}
            ContentValues v=new ContentValues();v.put("id",burst.ref.burstId);v.put("printer_id",burst.ref.printerId);v.put("sequence",burst.ref.sequence);v.put("wall",burst.startedWallMillis);v.put("elapsed",burst.elapsedNanos);v.put("endpoint",burst.endpoint);v.put("requests_complete",burst.coverage.requestsComplete?1:0);v.put("responses_complete",burst.coverage.responsesComplete?1:0);v.put("matched",burst.coverage.matchedSamples);v.put("hits",burst.coverage.cacheHits);db.insertOrThrow("bursts",null,v);
            for(RequestRecord r:burst.requests()){byte[] response=r.response();if(response!=null&&response.length>8192)throw new IllegalArgumentException("Recorded response too large");ContentValues x=new ContentValues();x.put("burst_id",burst.ref.burstId);x.put("ordinal",r.ordinal);x.put("token",r.token);x.put("oid",r.oid);x.put("start",r.startNanos);x.put("end",r.endNanos);x.put("cached",r.cached?1:0);x.put("outcome",r.outcome.name());x.put("response",response);if(r.details!=null){RequestRecord.Details d=r.details;x.put("endpoint",d.endpoint);x.put("port",d.port);x.put("version",d.version);x.put("request_id",d.requestId);x.put("timeout",d.timeoutMillis);x.put("retries",d.retries);x.put("context_id",d.contextId);x.put("response_type",d.responseType);x.put("detail_outcome",d.outcome);x.put("sample",d.sampleNanos);}db.insertOrThrow("requests",null,x);}
            db.execSQL("DELETE FROM bursts WHERE printer_id=? AND id NOT IN (SELECT id FROM bursts WHERE printer_id=? ORDER BY sequence DESC LIMIT 20)",new Object[]{burst.ref.printerId,burst.ref.printerId});
            try(Cursor c=db.rawQuery("SELECT COALESCE((SELECT SUM(COALESCE(length(response),0)+length(oid)+length(token)+COALESCE(length(context_id),0)+COALESCE(length(endpoint),0)+128) FROM requests),0)+COALESCE((SELECT SUM(COALESCE(length(response),0)+length(token)+64) FROM replay_responses),0)",null)){
                if(c.moveToFirst()&&c.getLong(0)>64L*1024L*1024L)throw new IllegalStateException("Activity history is full");
            }
            db.setTransactionSuccessful();return true;
        }finally{db.endTransaction();}
    }
    public boolean putCached(String id,String contextId,String oid,String value,long generation){
        if(id==null||contextId==null||oid==null||value==null)throw new IllegalArgumentException();SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
        try{try(Cursor c=db.rawQuery("SELECT generation,active FROM printers WHERE id=?",new String[]{id})){if(!c.moveToFirst()||c.getLong(0)!=generation||c.getInt(1)!=1)return false;}
            ContentValues v=new ContentValues();v.put("printer_id",id);v.put("context_id",contextId);v.put("oid",oid);v.put("value",value);db.insertWithOnConflict("cache_entries",null,v,SQLiteDatabase.CONFLICT_REPLACE);db.setTransactionSuccessful();return true;
        }finally{db.endTransaction();}
    }
    public String getCached(String id,String contextId,String oid){try(Cursor c=getReadableDatabase().rawQuery("SELECT value FROM cache_entries WHERE printer_id=? AND context_id=? AND oid=?",new String[]{id,contextId,oid})){return c.moveToFirst()?c.getString(0):null;}}
    public String findPrinterIdByMac(String mac){if(mac==null)return null;try(Cursor c=getReadableDatabase().rawQuery("SELECT printer_id FROM identities WHERE mac=?",new String[]{mac.toLowerCase(java.util.Locale.ROOT)})){return c.moveToFirst()?c.getString(0):null;}}
    public String findPrinterIdByAddress(String address){if(address==null)return null;try(Cursor c=getReadableDatabase().rawQuery("SELECT printer_id FROM identities WHERE last_address=?",new String[]{address})){return c.moveToFirst()?c.getString(0):null;}}
    public PrinterRecord findPrinter(String id){
        SQLiteDatabase db=getReadableDatabase();db.beginTransaction();
        try(Cursor c=db.rawQuery("SELECT name,last_address,mac,changed FROM identities WHERE printer_id=?",new String[]{id})){
            if(!c.moveToFirst())return null;String name=c.getString(0),address=c.getString(1),mac=c.getString(2);boolean changed=c.getInt(3)!=0;
            ArrayList<String> addresses=new ArrayList<>();try(Cursor a=db.rawQuery("SELECT address FROM addresses WHERE printer_id=? ORDER BY ordinal,rowid",new String[]{id})){while(a.moveToNext())addresses.add(a.getString(0));}
            PrinterRecord result=new PrinterRecord(id,name,address,mac,addresses,changed);db.setTransactionSuccessful();return result;
        }finally{db.endTransaction();}
    }
    /** Read an isolated snapshot for the service's in-memory lookup index. */
    public java.util.Map<String,String> loadCache(String id,String contextId){
        if(id==null||contextId==null)throw new IllegalArgumentException();
        java.util.Map<String,String> result=new java.util.HashMap<>();
        try(Cursor c=getReadableDatabase().rawQuery("SELECT oid,value FROM cache_entries WHERE printer_id=? AND context_id=?",new String[]{id,contextId})){
            while(c.moveToNext())result.put(c.getString(0),c.getString(1));
        }
        return java.util.Collections.unmodifiableMap(result);
    }
    @Override public java.util.Map<String,String> load(String id,String contextId){return loadCache(id,contextId);}
    @Override public boolean write(String id,String contextId,String oid,String value,long generation){return putCached(id,contextId,oid,value,generation);}
    @Override public void clear(String id){clearPrinter(id);}
    public void clearBurstHistory(String id){if(id==null)throw new IllegalArgumentException();getWritableDatabase().delete("bursts","printer_id=?",new String[]{id});}
    public void clearPrinter(String id){SQLiteDatabase db=getWritableDatabase();db.beginTransaction();try{db.delete("bursts","printer_id=?",new String[]{id});db.delete("cache_entries","printer_id=?",new String[]{id});db.delete("addresses","printer_id=?",new String[]{id});db.delete("identities","printer_id=?",new String[]{id});db.execSQL("UPDATE printers SET active=0,generation=generation+1 WHERE id=?",new Object[]{id});db.setTransactionSuccessful();}finally{db.endTransaction();}}
    public void clearAllPrinters(){SQLiteDatabase db=getWritableDatabase();db.beginTransaction();try{
        db.delete("bursts",null,null);db.delete("cache_entries",null,null);db.delete("addresses",null,null);db.delete("identities",null,null);
        db.execSQL("UPDATE printers SET active=0,generation=generation+1 WHERE active=1");db.setTransactionSuccessful();
    }finally{db.endTransaction();}}
    public boolean hasBurst(String printerId,String burstId){try(Cursor c=getReadableDatabase().rawQuery("SELECT 1 FROM bursts WHERE printer_id=? AND id=?",new String[]{printerId,burstId})){return c.moveToFirst();}}
    public boolean saveReplay(ReplayRun run){
        if(run==null)throw new IllegalArgumentException();SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
        try{try(Cursor c=db.rawQuery("SELECT sequence FROM bursts WHERE printer_id=? AND id=?",new String[]{run.source.printerId,run.source.burstId})){if(!c.moveToFirst()||c.getLong(0)!=run.source.sequence)return false;}
            try(Cursor c=db.rawQuery("SELECT token FROM requests WHERE burst_id=? ORDER BY ordinal",new String[]{run.source.burstId})){
                int index=0;while(c.moveToNext()){if(index>=run.results().size()||!c.getString(0).equals(run.results().get(index).requestToken))throw new IllegalArgumentException("Replay does not match its burst");index++;}
                if(index!=run.results().size())throw new IllegalArgumentException("Replay length does not match its burst");
            }
            ContentValues values=new ContentValues();values.put("id",run.id);values.put("burst_id",run.source.burstId);values.put("endpoint",run.endpoint);values.put("elapsed",run.elapsedNanos);db.insertOrThrow("replay_runs",null,values);
            for(int i=0;i<run.results().size();i++){ReplayRun.RequestResult result=run.results().get(i);byte[] response=result.response();if(response!=null&&response.length>8192)response=null;ContentValues row=new ContentValues();row.put("run_id",run.id);row.put("ordinal",i);row.put("token",result.requestToken);row.put("response",response);db.insertOrThrow("replay_responses",null,row);}
            db.execSQL("DELETE FROM replay_runs WHERE burst_id=? AND rowid NOT IN (SELECT rowid FROM replay_runs WHERE burst_id=? ORDER BY rowid DESC LIMIT 3)",new Object[]{run.source.burstId,run.source.burstId});
            try(Cursor c=db.rawQuery("SELECT COALESCE((SELECT SUM(COALESCE(length(response),0)+length(oid)+length(token)+COALESCE(length(context_id),0)+COALESCE(length(endpoint),0)+128) FROM requests),0)+COALESCE((SELECT SUM(COALESCE(length(response),0)+length(token)+64) FROM replay_responses),0)",null)){if(c.moveToFirst()&&c.getLong(0)>64L*1024L*1024L)throw new IllegalStateException("Activity history is full");}
            db.setTransactionSuccessful();return true;
        }finally{db.endTransaction();}
    }
    public ReplayRun latestReplay(ActivityBurst.Ref ref){
        SQLiteDatabase db=getReadableDatabase();db.beginTransaction();
        try(Cursor c=db.rawQuery("SELECT r.id,r.endpoint,r.elapsed FROM replay_runs r JOIN bursts b ON b.id=r.burst_id WHERE b.id=? AND b.printer_id=? AND b.sequence=? ORDER BY r.rowid DESC LIMIT 1",new String[]{ref.burstId,ref.printerId,Long.toString(ref.sequence)})){
            if(!c.moveToFirst())return null;String id=c.getString(0),endpoint=c.getString(1);long elapsed=c.getLong(2);ArrayList<ReplayRun.RequestResult> results=new ArrayList<>();
            try(Cursor rows=db.rawQuery("SELECT token,response FROM replay_responses WHERE run_id=? ORDER BY ordinal",new String[]{id})){while(rows.moveToNext())results.add(new ReplayRun.RequestResult(rows.getString(0),rows.isNull(1)?null:rows.getBlob(1)));}
            ReplayRun result=new ReplayRun(id,ref,endpoint,elapsed,results);db.setTransactionSuccessful();return result;
        }finally{db.endTransaction();}
    }
    public java.util.List<ReplayRun> listReplays(ActivityBurst.Ref ref){
        SQLiteDatabase db=getReadableDatabase();java.util.ArrayList<ReplayRun> result=new java.util.ArrayList<>();
        try(Cursor c=db.rawQuery("SELECT r.id,r.endpoint,r.elapsed FROM replay_runs r JOIN bursts b ON b.id=r.burst_id WHERE b.id=? AND b.printer_id=? AND b.sequence=? ORDER BY r.rowid",new String[]{ref.burstId,ref.printerId,Long.toString(ref.sequence)})){
            while(c.moveToNext()){String id=c.getString(0),endpoint=c.getString(1);long elapsed=c.getLong(2);ArrayList<ReplayRun.RequestResult> rows=new ArrayList<>();
                try(Cursor values=db.rawQuery("SELECT token,response FROM replay_responses WHERE run_id=? ORDER BY ordinal",new String[]{id})){while(values.moveToNext())rows.add(new ReplayRun.RequestResult(values.getString(0),values.isNull(1)?null:values.getBlob(1)));}
                result.add(new ReplayRun(id,ref,endpoint,elapsed,rows));}
        }return java.util.Collections.unmodifiableList(result);
    }
    /** Latest means greatest sequence, even when older bursts arrive later. */
    public ActivityBurst latestBurst(String printerId){
        SQLiteDatabase db=getReadableDatabase();db.beginTransaction();
        try(Cursor c=db.rawQuery("SELECT id FROM bursts WHERE printer_id=? ORDER BY sequence DESC LIMIT 1",new String[]{printerId})){
            ActivityBurst result=c.moveToFirst()?loadBurst(printerId,c.getString(0)):null;
            db.setTransactionSuccessful();return result;
        }finally{db.endTransaction();}
    }
    /** Prefer the most recent burst that queried preview paper capabilities. */
    public ActivityBurst preferredCardBurst(String printerId) {
        SQLiteDatabase db = getReadableDatabase();
        db.beginTransaction();
        try {
            String preview = "SELECT b.id FROM bursts b WHERE b.printer_id=? AND ("
                    + "EXISTS (SELECT 1 FROM requests r WHERE r.burst_id=b.id AND r.oid LIKE ?) OR ("
                    + "EXISTS (SELECT 1 FROM requests r WHERE r.burst_id=b.id AND r.oid LIKE ?) AND "
                    + "EXISTS (SELECT 1 FROM requests r WHERE r.burst_id=b.id AND r.oid LIKE ?)))"
                    + " ORDER BY b.sequence DESC LIMIT 1";
            ActivityBurst result;
            try (Cursor cursor = db.rawQuery(preview, new String[]{printerId,
                    "1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.71.12.1.2.%",
                    "1.3.6.1.2.1.43.8.2.1.13.%", "1.3.6.1.2.1.43.9.2.1.7.%"})) {
                result = cursor.moveToFirst() ? loadBurst(printerId, cursor.getString(0)) : null;
            }
            if (result == null) {
                String fallback = "SELECT recent.id FROM (SELECT id,sequence FROM bursts "
                        + "WHERE printer_id=? ORDER BY sequence DESC LIMIT 2) recent "
                        + "ORDER BY (SELECT COUNT(*) FROM requests r WHERE r.burst_id=recent.id) DESC, "
                        + "recent.sequence DESC LIMIT 1";
                try (Cursor cursor = db.rawQuery(fallback, new String[]{printerId})) {
                    if (cursor.moveToFirst()) result = loadBurst(printerId, cursor.getString(0));
                }
            }
            db.setTransactionSuccessful();
            return result;
        } finally {
            db.endTransaction();
        }
    }

    /** Return complete immutable snapshots in reverse sequence order. */
    public java.util.List<ActivityBurst> listBursts(String printerId){
        SQLiteDatabase db=getReadableDatabase();db.beginTransaction();
        try(Cursor c=db.rawQuery("SELECT id FROM bursts WHERE printer_id=? ORDER BY sequence DESC LIMIT 20",new String[]{printerId})){
            java.util.List<ActivityBurst> result=new ArrayList<>();
            while(c.moveToNext()){ActivityBurst burst=loadBurst(printerId,c.getString(0));if(burst!=null)result.add(burst);}
            db.setTransactionSuccessful();return java.util.Collections.unmodifiableList(result);
        }finally{db.endTransaction();}
    }
    public ActivityBurst loadBurst(String printerId,String burstId){
        SQLiteDatabase db=getReadableDatabase();db.beginTransaction();
        try(Cursor c=db.rawQuery("SELECT sequence,wall,elapsed,endpoint,requests_complete,responses_complete,matched,hits FROM bursts WHERE printer_id=? AND id=?",new String[]{printerId,burstId})){
            if(!c.moveToFirst())return null;
            ActivityBurst.Ref ref=new ActivityBurst.Ref(printerId,burstId,c.getLong(0));
            long wall=c.getLong(1),elapsed=c.getLong(2);String endpoint=c.getString(3);
            ActivityBurst.Coverage coverage=new ActivityBurst.Coverage(c.getInt(4)!=0,c.getInt(5)!=0,c.getInt(6),c.getInt(7));
            ArrayList<RequestRecord> requests=new ArrayList<>();
            try(Cursor r=db.rawQuery("SELECT ordinal,token,oid,start,end,cached,outcome,response,endpoint,port,version,request_id,timeout,retries,context_id,response_type,detail_outcome,sample FROM requests WHERE burst_id=? ORDER BY ordinal",new String[]{burstId})){
                while(r.moveToNext()){
                    RequestRecord.Details d=null;
                    if(!r.isNull(8))d=new RequestRecord.Details(r.getString(8),r.getInt(9),r.getInt(10),r.getInt(11),r.getInt(12),r.getInt(13),r.getString(14),r.getString(15),r.getString(16),r.getLong(17));
                    requests.add(new RequestRecord(r.getString(1),r.getInt(0),r.getString(2),r.getLong(3),r.getLong(4),r.getInt(5)!=0,r.isNull(7)?null:r.getBlob(7),d,RequestRecord.Outcome.valueOf(r.getString(6))));
                }
            }
            ActivityBurst result=new ActivityBurst(ref,wall,elapsed,requests,endpoint,coverage);db.setTransactionSuccessful();return result;
        }finally{db.endTransaction();}
    }
}
