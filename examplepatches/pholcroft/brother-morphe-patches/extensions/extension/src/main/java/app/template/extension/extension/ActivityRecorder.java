package app.template.extension.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/** Groups completed request lifecycles without doing I/O on the request path. */
public final class ActivityRecorder {
    public interface Clock { long nowNanos(); }
    public interface Sink { void publish(Completed burst); }
    private static final long IDLE_NANOS = 3_000_000_000L;
    private static final int LIMIT = 4096;
    public static final class Token {
        private final Burst burst; private final int index;
        private boolean completed;
        private Token(Burst burst, int index) { this.burst = burst; this.index = index; }
    }
    public static final class Completed {
        public final String key; public final long startNanos, endNanos;
        private final long generation;
        public final boolean complete; public final List<RequestRecord> requests;
        private Completed(Burst b) {
            key=b.key; startNanos=b.start; endNanos=b.last; generation=b.generation; complete=!b.incomplete;
            requests=Collections.unmodifiableList(new ArrayList<>(b.requests));
        }
    }
    private static final class Burst {
        final String key; final long start, generation; long last; int pending; boolean incomplete;
        final List<RequestRecord> requests = new ArrayList<>();
        final List<Long> starts = new ArrayList<>();
        final List<String> oids = new ArrayList<>();
        final List<RequestRecord.Details> details = new ArrayList<>();
        Burst(String key,long now,long generation) {this.key=key;start=last=now;this.generation=generation;}
    }
    private final Clock clock; private final Sink sink;
    private final Map<String,Burst> active = new HashMap<>();
    private final Map<String,Long> generations = new HashMap<>();
    private final List<Completed> ready = new ArrayList<>();
    public ActivityRecorder(Clock clock, Sink sink) {
        if (clock==null || sink==null) throw new IllegalArgumentException();
        this.clock=clock;this.sink=sink;
    }
    public synchronized Token begin(String key,String oid) {
        return begin(key,oid,null);
    }
    public synchronized Token begin(String key,String oid,RequestRecord.Details details) {
        if(key==null||oid==null) throw new IllegalArgumentException();
        long n=clock.nowNanos(); Burst b=active.get(key);
        if(b!=null&&b.pending==0&&n-b.last>=IDLE_NANOS){active.remove(key);ready.add(new Completed(b));b=null;}
        if(b==null){b=new Burst(key,n,generations.containsKey(key)?generations.get(key):0L);active.put(key,b);}
        b.last=n;
        if(b.requests.size()>=LIMIT){b.incomplete=true;b.pending++;return new Token(b,-1);}
        int index=b.requests.size(); b.requests.add(null);b.starts.add(n);b.oids.add(oid);b.details.add(details);b.pending++;
        return new Token(b,index);
    }
    public synchronized void complete(Token token,boolean cached,byte[] response) {
        finish(token,cached,response,RequestRecord.Outcome.SUCCESS);
    }
    public synchronized void fail(Token token,String reason) {
        RequestRecord.Outcome outcome="timeout".equals(reason)?RequestRecord.Outcome.TIMEOUT:
                "cancelled".equals(reason)?RequestRecord.Outcome.CANCELLED:RequestRecord.Outcome.ERROR;
        finish(token,false,null,outcome);
    }
    private void finish(Token token,boolean cached,byte[] response,RequestRecord.Outcome outcome) {
        if(token==null||token.completed)return; Burst b=token.burst;
        if(active.get(b.key)!=b)return;
        token.completed=true;
        if(outcome!=RequestRecord.Outcome.SUCCESS)b.incomplete=true;
        if(token.index<0){b.pending--;b.last=Math.max(b.last,clock.nowNanos());return;}
        long n=Math.max(clock.nowNanos(),b.starts.get(token.index));
        b.requests.set(token.index,new RequestRecord(UUID.randomUUID().toString(),token.index,b.oids.get(token.index),
                b.starts.get(token.index)-b.start,n-b.start,cached,response,b.details.get(token.index),outcome));
        b.pending--;b.last=Math.max(b.last,n);
    }
    public synchronized List<Completed> takeReady() {
        List<Completed> result=new ArrayList<>(ready);ready.clear();
        long now=clock.nowNanos();Iterator<Burst> it=active.values().iterator();
        while(it.hasNext()){Burst b=it.next();if(b.pending==0&&now-b.last>=IDLE_NANOS){it.remove();result.add(new Completed(b));}}
        return result;
    }
    public synchronized boolean isCurrent(Completed burst){return burst!=null&&burst.generation==(generations.containsKey(burst.key)?generations.get(burst.key):0L);}
    public void tick() {for(Completed burst:takeReady())if(isCurrent(burst))sink.publish(burst);}
    public synchronized void clear(String key){active.remove(key);ready.removeIf(b->b.key.equals(key));long old=generations.containsKey(key)?generations.get(key):0L;generations.put(key,old+1);}
}
