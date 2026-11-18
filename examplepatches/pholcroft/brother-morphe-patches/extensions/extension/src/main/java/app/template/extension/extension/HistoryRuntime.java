package app.template.extension.extension;

import android.content.Context;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.List;
import javax.crypto.SecretKey;

/** Owns history storage work off the printer request thread. */
public final class HistoryRuntime {
    public interface HistoryCallback {void complete(PrinterRecord printer,List<ActivityBurst> bursts,String error);}
    public interface LatestCallback {void complete(ActivityBurst burst,String error);}
    public interface ReplayCallback {void complete(String error);}
    private static java.util.concurrent.ScheduledExecutorService worker;
    private static volatile ActivityStore store;
    private static volatile SecretKey contextKey;
    private static volatile VerifiedCache verifiedCache;
    private static volatile RuntimeException failure;
    private static volatile boolean ready;
    private static final String MAC_OID="1.3.6.1.2.1.2.2.1.6.1";
    private static final ReplayContextRegistry CONTEXTS=new ReplayContextRegistry(128);
    private static final java.util.concurrent.CopyOnWriteArrayList<Runnable> LISTENERS=new java.util.concurrent.CopyOnWriteArrayList<>();
    public static void addListener(Runnable listener){if(listener!=null)LISTENERS.addIfAbsent(listener);}
    public static void removeListener(Runnable listener){LISTENERS.remove(listener);}
    public static synchronized void init(Context context){
        if(context==null||worker!=null)return;
        final Context app=context.getApplicationContext();
        worker=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"printer-history");t.setDaemon(true);return t;});
        verifiedCache=new VerifiedCache(new VerifiedCache.Store(){
            public String identify(String ip,String mac){ActivityStore db=store;if(db==null)throw new IllegalStateException("Printer database unavailable");return db.resolveVerified(ip,mac,null).id;}
            public String context(int version,String community)throws Exception{SecretKey key=contextKey;if(key==null)throw new IllegalStateException("Printer context key unavailable");return ReplayCredentials.contextId(key,version,community);}
            public java.util.Map<String,String> load(String id,String context){ActivityStore db=store;if(db==null)throw new IllegalStateException("Printer database unavailable");return db.loadCache(id,context);}
            public void write(String id,String context,String oid,String value){ActivityStore db=store;if(db==null||!db.putCached(id,context,oid,value,0))throw new IllegalStateException("Printer cache write rejected");}
        },worker);
        CommunicationTiming.setSnapshotSink((ip,snapshot)->{SecretKey key=contextKey;if(key!=null)enqueue(ip,snapshot,key);});
        worker.execute(()->initialize(app));
    }
    private static void initialize(Context app){
        try{ActivityStore opened=store;if(opened==null){opened=new ActivityStore(app);opened.getWritableDatabase();store=opened;}
            SecretKey key=ReplayKey.getOrCreate();contextKey=key;
            SequenceAllocator allocator=new SequenceAllocator(opened::reserveSequences,worker,256);
            worker.execute(()->CommunicationTiming.setSequenceSource(allocator::take));
            failure=null;ready=true;
        }catch(Exception e){ready=false;failure=new IllegalStateException("Could not initialize printer history",e);worker.schedule(()->initialize(app),5,java.util.concurrent.TimeUnit.SECONDS);}
    }
    public static boolean isInitialized(){return worker!=null;}
    public static boolean isReady(){return ready;}
    public static void verifyCache(String ip,String mac){VerifiedCache cache=verifiedCache;if(cache!=null)cache.verify(ip,mac);}
    public static String lookupCache(String ip,int version,String community,String oid){VerifiedCache cache=verifiedCache;return cache==null?null:cache.lookup(ip,version,community,oid);}
    public static void learnCache(String ip,int version,String community,String oid,String value){VerifiedCache cache=verifiedCache;if(cache!=null)cache.learn(ip,version,community,oid,value);}
    private static String verifiedMac(CommunicationTiming.Snapshot snapshot){
        if(snapshot.identityConflict)return null;
        List<ReplayEngine.Spec> requests=snapshot.observedRequests();String found=snapshot.verifiedMac;
        for(int i=0;i<requests.size();i++)if(MAC_OID.equals(requests.get(i).oid)){
            String value=snapshot.responses().get(i);if(value==null||!value.startsWith("octets:"))return null;
            byte[] bytes;try{bytes=android.util.Base64.decode(value.substring(7),android.util.Base64.DEFAULT);}catch(IllegalArgumentException e){return null;}
            if(bytes.length!=6||(bytes[0]&1)!=0)return null;boolean zero=true;StringBuilder mac=new StringBuilder();
            for(byte b:bytes){if(b!=0)zero=false;if(mac.length()>0)mac.append(':');mac.append(String.format(java.util.Locale.ROOT,"%02x",b&255));}
            if(zero)return null;String observed=mac.toString();if(found!=null&&!found.equals(observed))return null;found=observed;
        }
        return found;
    }
    private static String printerName(CommunicationTiming.Snapshot snapshot){
        String[] identifiers={"1.3.6.1.2.1.25.3.2.1.3.1","1.3.6.1.2.1.1.1.0"};
        for(String oid:identifiers)for(int i=0;i<snapshot.observedRequests().size();i++)if(oid.equals(snapshot.observedRequests().get(i).oid)){
            String value=snapshot.responses().get(i);if(value==null||!value.startsWith("octets:"))continue;
            try{String name=new String(android.util.Base64.decode(value.substring(7),android.util.Base64.DEFAULT),java.nio.charset.StandardCharsets.UTF_8).replaceAll("[\\p{Cntrl}\\s]+"," ").trim();if(!name.isEmpty())return name.length()>80?name.substring(0,80):name;}catch(IllegalArgumentException ignored){}
        }
        return null;
    }
    private static void enqueue(String ip,CommunicationTiming.Snapshot snapshot,SecretKey key){
        if(snapshot.sequence<1)return;
        ExecutorService target=worker;if(target==null)return;
        target.execute(()->{
            try{if(!CommunicationTiming.isValidSnapshot(ip,snapshot))return;String mac=verifiedMac(snapshot);if(mac==null)return;
                ActivityStore db=store;if(db==null)return;PrinterRecord printer=db.resolveVerified(ip,mac,printerName(snapshot));long generation=db.registerPrinter(printer.id);
                java.util.Map<String,String> contexts=new java.util.HashMap<>();
                ActivityBurst burst=HistoryMapper.map(ip,printer.id,java.util.UUID.randomUUID().toString(),snapshot,s->{String id=ReplayCredentials.contextId(key,s.version,s.community);contexts.put(id,s.community);return id;});
                if(CommunicationTiming.isValidSnapshot(ip,snapshot)&&db.publish(burst,generation)){
                    for(java.util.Map.Entry<String,String> entry:contexts.entrySet())CONTEXTS.put(printer.id,entry.getKey(),entry.getValue());
                    for(Runnable listener:LISTENERS)try{listener.run();}catch(RuntimeException ignored){}
                }
            }catch(RuntimeException e){failure=e;}
        });
    }
    /** Must be called after invalidating in-memory snapshots. */
    public static boolean clearPrinter(String ip,String mac){
        ExecutorService target=worker;if(target==null)return false;
        VerifiedCache cache=verifiedCache;if(cache!=null){cache.invalidate(ip);cache.invalidatePrinter(mac);}
        try{return target.submit(()->{ReplayController.cancel();ActivityStore db=store;if(db==null)return false;String id=mac==null?db.findPrinterIdByAddress(ip):db.findPrinterIdByMac(mac);if(id!=null){db.clearPrinter(id);CONTEXTS.clear(id);}return true;}).get();}
        catch(Exception e){failure=new IllegalStateException("Could not clear saved printer history",e);return false;}
    }
    public static boolean clearAll(){
        ExecutorService target=worker;if(target==null)return false;
        VerifiedCache cache=verifiedCache;if(cache!=null)cache.clearAll();
        try{return target.submit(()->{ReplayController.cancel();ActivityStore db=store;if(db==null)return false;db.clearAllPrinters();CONTEXTS.clearAll();return true;}).get();}
        catch(Exception e){failure=new IllegalStateException("Could not clear saved printer history",e);return false;}
    }
    public static void exportHistory(Context context,android.net.Uri destination,String ip,String mac,ReplayCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete("Printer history is unavailable.");return;}final Context app=context.getApplicationContext();
        target.execute(()->{try{ActivityStore db=store;if(db==null)throw new IllegalStateException("Printer history is unavailable.");
            String id=mac==null||mac.isEmpty()?db.findPrinterIdByAddress(ip):db.findPrinterIdByMac(mac);PrinterRecord printer=id==null?null:db.findPrinter(id);
            if(printer==null)throw new IllegalStateException("This printer is no longer saved.");
            try(java.io.OutputStream stream=app.getContentResolver().openOutputStream(destination);java.io.Writer writer=stream==null?null:new java.io.OutputStreamWriter(stream,java.nio.charset.StandardCharsets.UTF_8)){
                if(writer==null)throw new java.io.IOException("No output stream");HistoryExport.write(writer,printer,db.listBursts(id),db::listReplays);
            }callback.complete(null);
        }catch(Exception e){failure=new IllegalStateException("Could not export printer history",e);callback.complete("Could not save activity history. Please try again.");}});
    }
    public static void exportBurst(Context context,android.net.Uri destination,ActivityBurst.Ref ref,ReplayCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete("Printer history is unavailable.");return;}final Context app=context.getApplicationContext();
        target.execute(()->{try{ActivityStore db=store;if(db==null)throw new IllegalStateException("Printer history is unavailable.");
            PrinterRecord printer=db.findPrinter(ref.printerId);ActivityBurst burst=db.loadBurst(ref.printerId,ref.burstId);
            if(printer==null||burst==null||burst.ref.sequence!=ref.sequence)throw new IllegalStateException("Activity no longer available.");
            try(java.io.OutputStream stream=app.getContentResolver().openOutputStream(destination);java.io.Writer writer=stream==null?null:new java.io.OutputStreamWriter(stream,java.nio.charset.StandardCharsets.UTF_8)){
                if(writer==null)throw new java.io.IOException("No output stream");HistoryExport.writeBurst(writer,printer,burst);
            }callback.complete(null);
        }catch(Exception e){callback.complete("Could not save this activity. Please try again.");}});
    }
    public static void clearHistory(String ip,String mac,ReplayCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete("Printer history is unavailable.");return;}
        CommunicationTiming.discard(ip);
        target.execute(()->{try{ActivityStore db=store;if(db==null){callback.complete("Printer history is unavailable.");return;}
            String id=mac==null||mac.isEmpty()?db.findPrinterIdByAddress(ip):db.findPrinterIdByMac(mac);
            if(id!=null){ReplayController.cancel();db.clearBurstHistory(id);}
            for(Runnable listener:LISTENERS)try{listener.run();}catch(RuntimeException ignored){}
            callback.complete(null);
        }catch(RuntimeException e){failure=e;callback.complete("Could not clear activity history.");}});
    }
    /** Wait for already queued history work, for lifecycle coordination and tests. */
    public static boolean awaitIdle(){ExecutorService target=worker;if(target==null)return false;try{target.submit(()->{}).get();return true;}catch(Exception e){failure=new IllegalStateException("Could not finish printer history work",e);return false;}}
    public static HistoryReplayPlan prepareReplay(ActivityBurst burst){return HistoryReplayPlan.from(burst,context->CONTEXTS.get(burst.ref.printerId,context));}
    private static void saveReplay(ActivityBurst burst,String endpoint,ReplayEngine.Result result){
        ExecutorService target=worker;if(target==null)return;
        target.execute(()->{try{if(result.responses.size()!=burst.requests().size()||result.elapsedMs>Long.MAX_VALUE/1000000L)return;
            java.util.ArrayList<ReplayRun.RequestResult> rows=new java.util.ArrayList<>();
            for(int i=0;i<result.responses.size();i++){String value=result.responses.get(i);rows.add(new ReplayRun.RequestResult(burst.requests().get(i).token,value==null?null:value.getBytes(java.nio.charset.StandardCharsets.UTF_8)));}
            ActivityStore db=store;if(db!=null)db.saveReplay(new ReplayRun(java.util.UUID.randomUUID().toString(),burst.ref,endpoint,result.elapsedMs*1000000L,rows));
        }catch(RuntimeException e){failure=e;}});
    }
    public static void loadHistory(String ip,String mac,HistoryCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete(null,null,"Printer history is unavailable.");return;}
        target.execute(()->{try{ActivityStore db=store;if(db==null){callback.complete(null,null,"Printer history is unavailable.");return;}
            String id=mac==null||mac.isEmpty()?db.findPrinterIdByAddress(ip):db.findPrinterIdByMac(mac);
            if(id==null){callback.complete(null,java.util.Collections.emptyList(),null);return;}
            callback.complete(db.findPrinter(id),db.listBursts(id),null);
        }catch(RuntimeException e){failure=e;callback.complete(null,null,"Could not load printer history.");}});
    }
    public static void loadBurst(ActivityBurst.Ref ref,LatestCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete(null,"Printer history is unavailable.");return;}
        target.execute(()->{try{ActivityStore db=store;if(db==null){callback.complete(null,"Printer history is unavailable.");return;}ActivityBurst burst=db.loadBurst(ref.printerId,ref.burstId);callback.complete(burst!=null&&burst.ref.sequence==ref.sequence?burst:null,null);}catch(RuntimeException e){failure=e;callback.complete(null,"Could not load printer activity.");}});
    }
    public static void loadCardBurst(String ip,String mac,LatestCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete(null,"Printer history is unavailable.");return;}
        target.execute(()->{try{ActivityStore db=store;if(db==null){callback.complete(null,"Printer history is unavailable.");return;}
            String id=mac==null||mac.isEmpty()?db.findPrinterIdByAddress(ip):db.findPrinterIdByMac(mac);
            callback.complete(id==null?null:db.preferredCardBurst(id),null);
        }catch(RuntimeException e){failure=e;callback.complete(null,"Could not load printer activity.");}});
    }
    public static void startReplay(ActivityBurst.Ref ref,ReplayCallback callback){
        ExecutorService target=worker;if(target==null){callback.complete("Printer history is unavailable.");return;}
        target.execute(()->{try{ActivityStore db=store;if(db==null){callback.complete("Printer history is unavailable.");return;}
            ActivityBurst burst=db.loadBurst(ref.printerId,ref.burstId);PrinterRecord printer=db.findPrinter(ref.printerId);
            if(burst==null||burst.ref.sequence!=ref.sequence||printer==null||printer.lastAddress==null||printer.macAddress==null){callback.complete("This recorded activity or printer is no longer available.");return;}
            HistoryReplayPlan plan=prepareReplay(burst);
            if(!ReplayController.startRecorded(printer.lastAddress,plan.specs,plan.responses,printer.macAddress,ref.sequence,result->saveReplay(burst,printer.lastAddress,result))){callback.complete("Another replay is already running.");return;}
            callback.complete(null);
        }catch(IllegalStateException e){callback.complete(e.getMessage());}catch(RuntimeException e){failure=e;callback.complete("Could not replay this activity.");}});
    }
    public static RuntimeException failure(){return failure;}
    private HistoryRuntime(){}
}
