package app.template.extension.extension;

import java.util.ArrayDeque;

/** Opt-in, bounded, in-memory diagnostics; nothing is uploaded automatically. */
public final class Diagnostics {
    private static final int LIMIT=2000;
    private static final ArrayDeque<Event> EVENTS=new ArrayDeque<>();
    private static final ThreadLocal<Pending> PENDING=new ThreadLocal<>();
    private static volatile boolean recording;
    private static volatile long generation;
    private static int dropped;
    private static final class Pending {
        final String ip,oid; final long wall,start,generation,sequence;
        Pending(String ip,String oid,long sequence){this.ip=ip;this.oid=oid;this.sequence=sequence;wall=System.currentTimeMillis();start=System.nanoTime();generation=Diagnostics.generation;}
    }
    private static final class Event {
        final Pending p; final String source,state,type,value; final long millis;
        Event(Pending p,String source,String state,String type,String value){this.p=p;this.source=source;this.state=state;this.type=type;this.value=value;millis=Math.max(0,(System.nanoTime()-p.start)/1000000);}
    }
    public static synchronized void start(){generation++;recording=true;}
    public static synchronized void stop(){recording=false;generation++;PENDING.remove();}
    public static synchronized void clear(){EVENTS.clear();dropped=0;generation++;}
    public static boolean isRecording(){return recording;}
    public static synchronized int count(){return EVENTS.size();}
    public static synchronized int dropped(){return dropped;}
    public static void abandon(){PENDING.remove();}
    public static void begin(String ip,String oid){begin(ip,oid,-1);}
    public static void begin(String ip,String oid,long sequence){if(recording)PENDING.set(new Pending(ip,oid,sequence));else PENDING.remove();}
    public static synchronized void finish(String source,String state,String type,String value){
        Pending p=PENDING.get();PENDING.remove();if(!recording||p==null||p.generation!=generation)return;
        if(EVENTS.size()==LIMIT){EVENTS.removeFirst();dropped++;}EVENTS.addLast(new Event(p,source,state,type,value));
    }
    private static String quote(String value){return "\""+(value==null?"":value.replace("\"","\"\""))+"\"";}
    public static synchronized String csv(){
        StringBuilder b=new StringBuilder("timestamp_unix_ms,printer_ip,burst_sequence,oid,source,result,value_type,value,duration_ms\r\n");
        for(Event e:EVENTS)b.append(e.p.wall).append(',').append(quote(e.p.ip)).append(',').append(e.p.sequence<0?"":Long.toString(e.p.sequence)).append(',').append(quote(e.p.oid)).append(',').append(quote(e.source)).append(',').append(quote(e.state)).append(',').append(quote(e.type)).append(',').append(quote(e.value)).append(',').append(e.millis).append("\r\n");
        return b.toString();
    }
    public static synchronized String recent(){
        StringBuilder b=new StringBuilder();int skip=Math.max(0,EVENTS.size()-100),i=0;
        for(Event e:EVENTS){if(i++<skip)continue;b.append(e.source).append(" · ").append(e.p.oid).append(" · ").append(e.state).append(" · ").append(e.millis).append(" ms");if(!e.type.isEmpty())b.append("\n  ").append(e.type).append(": ").append(e.value.length()>100?e.value.substring(0,100)+"…":e.value);b.append("\n");}
        return b.toString();
    }
    private Diagnostics(){}
}

