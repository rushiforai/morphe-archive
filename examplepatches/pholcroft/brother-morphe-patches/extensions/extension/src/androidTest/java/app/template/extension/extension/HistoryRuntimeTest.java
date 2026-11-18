package app.template.extension.extension;

import android.content.Context;

public final class HistoryRuntimeTest {
    public static void run(Context context) throws Exception {
        AutoCache.init(context);String address="192.0.2.77";long sequence=-1;
        for(int i=0;i<100&&sequence<1;i++){
            CommunicationTiming.discard(address);
            CommunicationTiming.request(address);CommunicationTiming.response(address);CommunicationTiming.finishAll();
            CommunicationTiming.Snapshot burst=CommunicationTiming.latestSnapshot(address);
            sequence=burst==null?-1:burst.sequence;
            if(sequence<1)Thread.sleep(50);
        }
        CommunicationTiming.discard(address);
        if(sequence<1)throw new AssertionError("history runtime did not reserve a sequence asynchronously");
        if(HistoryRuntime.failure()!=null)throw HistoryRuntime.failure();
        String mac="02:01:02:03:04:05";
        CommunicationTiming.request(address,AutoCache.generation());
        CommunicationTiming.Capture capture=CommunicationTiming.capture(address,new ReplayEngine.Spec("1.3.6.1.2.1.2.2.1.6.1","private-test-community",0,1,161,1000,1));
        CommunicationTiming.captureResponse(capture,"octets:AgECAwQF");CommunicationTiming.finishAll();
        ActivityStore reader=new ActivityStore(context);String id=null;ActivityBurst saved=null;
        for(int i=0;i<100&&saved==null;i++){id=reader.findPrinterIdByMac(mac);if(id!=null)saved=reader.latestBurst(id);if(saved==null)Thread.sleep(50);}
        if(saved==null||saved.requests().size()!=1||saved.requests().get(0).details.contextId.contains("private-test-community"))
            throw new AssertionError("verified burst must be persisted without its community string");
        if(!"private-test-community".equals(HistoryRuntime.prepareReplay(saved).specs.get(0).community))
            throw new AssertionError("a verified live context should enable replay without persisting credentials");
        HistoryRuntime.verifyCache(address,mac);
        HistoryRuntime.lookupCache(address,0,"private-test-community","1.2.3");
        HistoryRuntime.learnCache(address,0,"private-test-community","1.2.3","integer:9");
        if(!HistoryRuntime.awaitIdle()||!"integer:9".equals(HistoryRuntime.lookupCache(address,0,"private-test-community","1.2.3")))
            throw new AssertionError("verified cache must learn through the database worker");
        String contextId=ReplayCredentials.contextId(ReplayKey.getOrCreate(),0,"private-test-community");
        if(!"integer:9".equals(reader.getCached(id,contextId,"1.2.3")))throw new AssertionError("learned cache entry must be durable");
        java.util.concurrent.CountDownLatch firstLoaded=new java.util.concurrent.CountDownLatch(1);
        final ActivityBurst[] displayed={null};
        HistoryRuntime.loadLatest(address,mac,(burst,error)->{displayed[0]=burst;firstLoaded.countDown();});
        if(!firstLoaded.await(5,java.util.concurrent.TimeUnit.SECONDS)||displayed[0]==null)throw new AssertionError("card must load a stored burst");
        CommunicationTiming.request(address,AutoCache.generation(),mac);
        CommunicationTiming.Capture later=CommunicationTiming.capture(address,new ReplayEngine.Spec("1.2.3","private-test-community",0,2,161,1000,1));
        CommunicationTiming.captureCachedResponse(later,"integer:7",10);CommunicationTiming.finishAll();
        long laterSequence=CommunicationTiming.latestSnapshot(address).sequence;
        if(!HistoryRuntime.awaitIdle()||reader.latestBurst(id).ref.sequence!=laterSequence)
            throw new AssertionError("a burst with an already verified identity must be persisted without another MAC request");
        if(displayed[0].ref.sequence==laterSequence||reader.loadBurst(displayed[0].ref.printerId,displayed[0].ref.burstId).ref.sequence!=displayed[0].ref.sequence)
            throw new AssertionError("a displayed burst reference must remain attached to its original record");
        java.util.concurrent.CountDownLatch loaded=new java.util.concurrent.CountDownLatch(1);
        final java.util.List<ActivityBurst>[] found=new java.util.List[]{null};
        HistoryRuntime.loadHistory(address,mac,(printer,bursts,error)->{found[0]=bursts;loaded.countDown();});
        if(!loaded.await(5,java.util.concurrent.TimeUnit.SECONDS)||found[0]==null||found[0].size()!=2||found[0].get(0).ref.sequence!=laterSequence)
            throw new AssertionError("history must load in sequence order for the verified printer");
        CommunicationTiming.request(address,AutoCache.generation(),mac);
        CommunicationTiming.Capture conflict=CommunicationTiming.capture(address,new ReplayEngine.Spec("1.3.6.1.2.1.2.2.1.6.1","private-test-community",0,3,161,1000,1));
        CommunicationTiming.captureResponse(conflict,"octets:AgECAwQG");CommunicationTiming.finishAll();
        if(!HistoryRuntime.awaitIdle()||reader.findPrinterIdByMac("02:01:02:03:04:06")!=null||reader.latestBurst(id).ref.sequence!=laterSequence)
            throw new AssertionError("a conflicting identity must not be assigned to either printer");
        CommunicationTiming.request(address,AutoCache.generation(),mac);
        CommunicationTiming.Capture inFlight=CommunicationTiming.capture(address,new ReplayEngine.Spec("1.2.3","private-test-community",0,4,161,1000,1));
        java.util.concurrent.CountDownLatch cleared=new java.util.concurrent.CountDownLatch(1);String[] clearError={null};
        HistoryRuntime.clearHistory(address,mac,error->{clearError[0]=error;cleared.countDown();});
        if(!cleared.await(5,java.util.concurrent.TimeUnit.SECONDS)||clearError[0]!=null)throw new AssertionError("history-only clear failed");
        CommunicationTiming.captureResponse(inFlight,"integer:1");CommunicationTiming.finishAll();
        if(!HistoryRuntime.awaitIdle()||!reader.listBursts(id).isEmpty())throw new AssertionError("cleared or in-flight bursts must not reappear");
        if(!"integer:9".equals(reader.getCached(id,contextId,"1.2.3")))throw new AssertionError("history-only clear must keep cached responses");
        if(!AutoCache.clearPrinter(address))throw new AssertionError("clearing history failed");
        if(HistoryRuntime.lookupCache(address,0,"private-test-community","1.2.3")!=null)throw new AssertionError("clear must invalidate the cache session");
        if(reader.findPrinterIdByMac(mac)!=null||reader.latestBurst(id)!=null)throw new AssertionError("clear must remove persisted history");
        try{HistoryRuntime.prepareReplay(saved);throw new AssertionError("clear must remove replay credentials");}catch(IllegalStateException expected){}
        reader.close();
    }
}
