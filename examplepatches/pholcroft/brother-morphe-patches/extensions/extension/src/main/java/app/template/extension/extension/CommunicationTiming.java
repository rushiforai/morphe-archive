package app.template.extension.extension;

import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/** Approximate per-printer SNMP activity bursts; never claims tap-to-preview time. */
public final class CommunicationTiming {
    public interface SequenceSource {long take();}
    public interface SnapshotSink {void accept(String endpoint,Snapshot snapshot);}
    private static SequenceSource sequenceSource;
    private static volatile SnapshotSink snapshotSink;
    public static synchronized void setSequenceSource(SequenceSource source){sequenceSource=source;assignPending();}
    public static void setSnapshotSink(SnapshotSink sink){snapshotSink=sink;}
    private static void publish(String ip,Snapshot snapshot){SnapshotSink sink=snapshotSink;if(sink!=null)try{sink.accept(ip,snapshot);}catch(RuntimeException ignored){}}
    private static final long IDLE_MS=3000;
    private static final ScheduledExecutorService WORK=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"printer-timing");t.setDaemon(true);return t;});
    private static final Map<String,Burst> BURSTS=new HashMap<>();
    private static final Map<String,List<ReplayEngine.Spec>> RECORDED=new HashMap<>();
    private static final Map<String,Snapshot> SNAPSHOTS=new HashMap<>();
    private static final Map<String,Object> EPOCHS=new HashMap<>();
    private static final int MAX_REPLAY_REQUESTS=4096;
    private static final class PendingSequence {final String ip;final Burst burst;Snapshot snapshot;PendingSequence(String ip,Burst burst){this.ip=ip;this.burst=burst;}}
    private static final List<PendingSequence> PENDING_SEQUENCES=new ArrayList<>();
    private static boolean sequenceRetry;
    private static void assignPending(){
        while(sequenceSource!=null&&!PENDING_SEQUENCES.isEmpty()){
            long sequence;try{sequence=sequenceSource.take();}catch(RuntimeException e){break;}if(sequence<1)break;
            PendingSequence item=PENDING_SEQUENCES.remove(0);item.burst.sequence=sequence;
            if(item.snapshot!=null){item.snapshot.sequence=sequence;publish(item.ip,item.snapshot);}
        }
        if(sequenceSource!=null&&!PENDING_SEQUENCES.isEmpty()&&!sequenceRetry){sequenceRetry=true;WORK.schedule(()->{synchronized(CommunicationTiming.class){sequenceRetry=false;assignPending();}},100,TimeUnit.MILLISECONDS);}
    }
    private static boolean deferSnapshot(String ip,Burst burst,Snapshot snapshot){
        if(burst.sequence>0){snapshot.sequence=burst.sequence;return false;}
        for(PendingSequence item:PENDING_SEQUENCES)if(item.burst==burst){item.snapshot=snapshot;assignPending();return true;}
        return true;
    }

    private static final class Burst {long first;long last;final long firstNano=System.nanoTime(),wallMillis=System.currentTimeMillis(),epoch;long sequence;int live,cached,matched,liveMeasured,pending;long estimated,liveTime;boolean incomplete,identityConflict;String verifiedMac;final List<ReplayEngine.Spec> requests=new ArrayList<>();final List<String> responses=new ArrayList<>();final List<Long> starts=new ArrayList<>(),ends=new ArrayList<>(),samples=new ArrayList<>();final List<Boolean> sources=new ArrayList<>(),failures=new ArrayList<>();Burst(long now,long sequence,long epoch){first=last=now;this.sequence=sequence;this.epoch=epoch;}}
    public static final class Capture {private final String ip;private final Burst burst;private final int index;private boolean finished;private Capture(String ip,Burst burst,int index){this.ip=ip;this.burst=burst;this.index=index;}}
    /** Immutable view of the same completed burst used by a card and its action. */
    public static final class Snapshot {
        private final List<ReplayEngine.Spec> requests,observed; private final List<String> responses; private final List<Long> starts,ends,samples;private final List<Boolean> sources,failures; private final String summary; private final Object epoch;
        public final long startedWallMillis,elapsedMillis;public volatile long sequence;
        public final String verifiedMac;public final boolean identityConflict;
        private Snapshot(String ip,Burst b){
            Object existing=EPOCHS.get(ip);if(existing==null){existing=new Object();EPOCHS.put(ip,existing);}epoch=existing;
            List<ReplayEngine.Spec> captured=copyRequests(b);
            requests=captured==null?null:java.util.Collections.unmodifiableList(captured);
            observed=java.util.Collections.unmodifiableList(new ArrayList<>(b.requests));
            responses=java.util.Collections.unmodifiableList(new ArrayList<>(b.responses));
            starts=java.util.Collections.unmodifiableList(new ArrayList<>(b.starts));ends=java.util.Collections.unmodifiableList(new ArrayList<>(b.ends));samples=java.util.Collections.unmodifiableList(new ArrayList<>(b.samples));sources=java.util.Collections.unmodifiableList(new ArrayList<>(b.sources));failures=java.util.Collections.unmodifiableList(new ArrayList<>(b.failures));startedWallMillis=b.wallMillis;elapsedMillis=Math.max(0,b.last-b.first);sequence=b.sequence;verifiedMac=b.verifiedMac;identityConflict=b.identityConflict;
            String actual=String.format(java.util.Locale.ROOT,"Actual time: %.2f s",Math.max(0,b.last-b.first)/1000.0);
            String total=(b.matched==b.cached&&b.liveMeasured==b.live)?String.format(java.util.Locale.ROOT,"~%.2f s of requests",(b.liveTime+b.estimated)/1000.0):"estimate unavailable";
            String saved=(b.cached==0||b.matched>0)?String.format(java.util.Locale.ROOT," (~%.2f s avoided%s)",b.estimated/1000.0,b.matched<b.cached?", partial":""):"";
            summary=actual+"\nWithout cache: "+total+saved;
        }
        public List<ReplayEngine.Spec> requests(){return requests;}
        public List<ReplayEngine.Spec> observedRequests(){return observed;}
        public List<String> responses(){return responses;}
        public List<Long> startOffsetsNanos(){return starts;}
        public List<Long> endOffsetsNanos(){return ends;}
        public List<Long> sampleMillis(){return samples;}
        public List<Boolean> cacheSources(){return sources;}
        public List<Boolean> failures(){return failures;}
        public String summary(){return summary;}
    }
    public static synchronized Snapshot latestSnapshot(String ip){return SNAPSHOTS.get(ip);}
    public static synchronized boolean isValidSnapshot(String ip,Snapshot snapshot){return snapshot!=null&&snapshot.epoch==EPOCHS.get(ip);}
    private static long now(){return System.nanoTime()/1000000L;}
    private static void schedule(String ip,Burst b,long delay){WORK.schedule(()->finishIfIdle(ip,b),delay,TimeUnit.MILLISECONDS);}
    public static synchronized void request(String ip){request(ip,-1);}
    public static synchronized void request(String ip,long epoch){request(ip,epoch,null);}
    public static synchronized void request(String ip,long epoch,String verifiedMac){
        if(ip==null)return;long n=now();Burst b=BURSTS.get(ip);
        if(b==null){if(BURSTS.size()>=32||PENDING_SEQUENCES.size()>=128)return;b=new Burst(n,-1,epoch);PENDING_SEQUENCES.add(new PendingSequence(ip,b));assignPending();BURSTS.put(ip,b);schedule(ip,b,IDLE_MS);}
        if(verifiedMac!=null){if(b.verifiedMac!=null&&!b.verifiedMac.equalsIgnoreCase(verifiedMac))b.identityConflict=true;else b.verifiedMac=verifiedMac;}
        b.last=n;b.live++;
    }
    public static synchronized void cacheHit(String ip){cacheHit(ip,"",-1);}
    public static synchronized void cacheHit(String ip,String oid,long estimate){Burst b=BURSTS.get(ip);if(b!=null){if(b.live>0)b.live--;b.cached++;b.last=now();if(estimate>=0){b.estimated+=estimate;b.matched++;}}}
    public static synchronized void liveSample(String ip,long ms){Burst b=BURSTS.get(ip);if(b!=null){b.liveTime+=ms;b.liveMeasured++;}}
    public static synchronized Capture capture(String ip,ReplayEngine.Spec spec){Burst b=BURSTS.get(ip);if(b==null)return null;b.pending++;if(spec==null||b.requests.size()>=MAX_REPLAY_REQUESTS){b.incomplete=true;return new Capture(ip,b,-1);}int index=b.requests.size();b.requests.add(spec);b.responses.add(null);b.starts.add(Math.max(0,System.nanoTime()-b.firstNano));b.ends.add(null);b.sources.add(false);b.failures.add(false);b.samples.add(-1L);return new Capture(ip,b,index);}
    public static synchronized void captureResponse(Capture capture,String response){if(capture==null||capture.finished||BURSTS.get(capture.ip)!=capture.burst)return;if(capture.index>=0)capture.burst.responses.set(capture.index,response);finishCapture(capture);}
    public static synchronized void captureCachedResponse(Capture capture,String response,long sampleMillis){if(capture==null||capture.finished||BURSTS.get(capture.ip)!=capture.burst)return;if(capture.index>=0){capture.burst.sources.set(capture.index,true);capture.burst.samples.set(capture.index,sampleMillis);}captureResponse(capture,response);}
    public static synchronized void finishCapture(Capture capture){if(capture==null||capture.finished||BURSTS.get(capture.ip)!=capture.burst)return;capture.finished=true;capture.burst.pending--;if(capture.index>=0)capture.burst.ends.set(capture.index,Math.max(capture.burst.starts.get(capture.index),System.nanoTime()-capture.burst.firstNano));capture.burst.last=now();}
    public static synchronized long captureSequence(Capture capture){return capture==null?-1:capture.burst.sequence;}
    public static synchronized void failCapture(Capture capture){if(capture==null||capture.finished||BURSTS.get(capture.ip)!=capture.burst)return;capture.burst.incomplete=true;if(capture.index>=0)capture.burst.failures.set(capture.index,true);finishCapture(capture);}
    private static List<ReplayEngine.Spec> copyRequests(Burst b){if(b==null||b.incomplete||b.requests.size()!=b.live+b.cached)return null;return new ArrayList<>(b.requests);}
    public static synchronized List<ReplayEngine.Spec> replaySequence(String ip){List<ReplayEngine.Spec> done=RECORDED.get(ip);return done==null?null:new ArrayList<>(done);}
    public static synchronized void response(String ip){Burst b=BURSTS.get(ip);if(b!=null)b.last=now();}
    private static void finishIfIdle(String ip,Burst b){
        Snapshot snapshot;
        synchronized(CommunicationTiming.class){
            if(BURSTS.get(ip)!=b)return;if(b.pending>0){schedule(ip,b,IDLE_MS);return;}long remaining=IDLE_MS-(now()-b.last);
            if(remaining>0){schedule(ip,b,remaining);return;}BURSTS.remove(ip);List<ReplayEngine.Spec> requests=copyRequests(b);if(SNAPSHOTS.size()>=32&&!SNAPSHOTS.containsKey(ip)){RECORDED.clear();SNAPSHOTS.clear();EPOCHS.clear();}if(requests==null)RECORDED.remove(ip);else RECORDED.put(ip,requests);snapshot=new Snapshot(ip,b);SNAPSHOTS.put(ip,snapshot);
        }
        AutoCache.saveTimingIfCurrent(ip,Math.max(0,b.last-b.first),b.live,b.cached,b.estimated,b.matched,b.liveTime,b.liveMeasured,b.epoch);
        synchronized(CommunicationTiming.class){if(!deferSnapshot(ip,b,snapshot))publish(ip,snapshot);}
    }
    public static void finishAll(){
        Map<String,Burst> copy;Map<String,Snapshot> published=new HashMap<>();
        synchronized(CommunicationTiming.class){copy=new HashMap<>();java.util.Iterator<Map.Entry<String,Burst>> it=BURSTS.entrySet().iterator();while(it.hasNext()){Map.Entry<String,Burst> e=it.next();if(e.getValue().pending==0){copy.put(e.getKey(),e.getValue());it.remove();}}for(Map.Entry<String,Burst> e:copy.entrySet()){List<ReplayEngine.Spec> requests=copyRequests(e.getValue());if(SNAPSHOTS.size()>=32&&!SNAPSHOTS.containsKey(e.getKey())){RECORDED.clear();SNAPSHOTS.clear();EPOCHS.clear();}if(requests==null)RECORDED.remove(e.getKey());else RECORDED.put(e.getKey(),requests);Snapshot snapshot=new Snapshot(e.getKey(),e.getValue());SNAPSHOTS.put(e.getKey(),snapshot);published.put(e.getKey(),snapshot);}}
        for(Map.Entry<String,Burst> e:copy.entrySet()){Burst b=e.getValue();AutoCache.saveTimingIfCurrent(e.getKey(),Math.max(0,b.last-b.first),b.live,b.cached,b.estimated,b.matched,b.liveTime,b.liveMeasured,b.epoch);synchronized(CommunicationTiming.class){if(!deferSnapshot(e.getKey(),b,published.get(e.getKey())))publish(e.getKey(),published.get(e.getKey()));}}
    }
    public static synchronized void discard(String ip){PENDING_SEQUENCES.removeIf(item->item.ip.equals(ip));BURSTS.remove(ip);RECORDED.remove(ip);SNAPSHOTS.remove(ip);EPOCHS.remove(ip);}
    public static synchronized void discardAll(){PENDING_SEQUENCES.clear();BURSTS.clear();RECORDED.clear();SNAPSHOTS.clear();EPOCHS.clear();}
    private CommunicationTiming(){}
}

