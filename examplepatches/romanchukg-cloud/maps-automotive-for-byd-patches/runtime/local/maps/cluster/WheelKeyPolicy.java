// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Pure policy: no Android objects, clocks, I/O, key injection or global settings. */
public final class WheelKeyPolicy {
    private static final long ACTIVE=Long.MAX_VALUE;
    public static final int DOWN=0, UP=1;
    public static final class Binding {
        public final int code,scan;
        public final String device;
        public Binding(int code,int scan,String device) {
            if(code<=0||code>65535||scan<0||scan>65535||device==null||device.length()==0||device.length()>128)
                throw new IllegalArgumentException("Invalid wheel binding");
            for(int i=0;i<device.length();i++)if(Character.isISOControl(device.charAt(i)))throw new IllegalArgumentException("Invalid wheel device");
            this.code=code;this.scan=scan;this.device=device;
        }
        boolean matches(Event event){return code==event.code&&scan==event.scan&&device.equals(event.device);}
        boolean same(Binding other){return code==other.code&&scan==other.scan&&device.equals(other.device);}
    }
    public static final class Bindings {
        public final Binding mode,in,out;
        public Bindings(Binding mode,Binding in,Binding out){
            if(mode==null||in==null||out==null||mode.same(in)||mode.same(out)||in.same(out))throw new IllegalArgumentException("Conflicting wheel bindings");
            this.mode=mode;this.in=in;this.out=out;
        }
        public static Bindings tang(){return new Bindings(new Binding(305,300,"simulate-keys"),new Binding(291,115,"simulate-keys"),new Binding(292,114,"simulate-keys"));}
        /** Tang DiLink 5.0 long press on the microphone key: the default Gemini key. */
        public static Binding tangGemini(){return new Binding(312,312,"simulate-keys");}
        int role(Event event){return mode.matches(event)?1:in.matches(event)?2:out.matches(event)?3:0;}
    }
    public static final class Event {
        public final int action,code,scan,deviceId,repeat;
        public final String device;
        public final long downTime;
        public final boolean canceled;
        public Event(int action,int code,int scan,int deviceId,String device,long downTime,int repeat,boolean canceled){
            this.action=action;this.code=code;this.scan=scan;this.deviceId=deviceId;this.device=device;
            this.downTime=downTime;this.repeat=repeat;this.canceled=canceled;
        }
        String identity(){return deviceId+":"+code+":"+scan+":"+downTime;}
    }
    public static final class Result {
        public final boolean consume,mode;
        public final int delta;
        Result(boolean consume,int delta,boolean mode){this.consume=consume;this.delta=delta;this.mode=mode;}
    }
    private Bindings bindings;
    private final Map<String,Integer> owned=new HashMap<>();
    private long until;
    public WheelKeyPolicy(Bindings bindings){if(bindings==null)throw new IllegalArgumentException();this.bindings=bindings;}
    public void updateBindings(Bindings next){if(next==null)throw new IllegalArgumentException();bindings=next;until=0;}
    public void endMode(){until=0;}
    public void disconnected(){until=0;owned.clear();}
    public boolean mode(long now){return until!=0&&now>=0;}
    public long deadline(){return until;}
    public Result handle(Event event,boolean enabled,boolean mapReady,boolean audioSafe,long now){
        if(!enabled||!mapReady||!audioSafe||now<0)until=0;
        String id=event.identity();Integer ownership=owned.get(id);
        // Ownership survives opt-out/call/map loss until UP. Never leak half a consumed pair.
        if(ownership!=null){
            if(event.action==UP){owned.remove(id);return new Result(true,0,mode(now));}
            return new Result(true,0,mode(now)); // A physical repeat is consumed, never a second toggle/zoom.
        }
        if(event.action!=DOWN||event.repeat!=0||event.canceled||!enabled||!mapReady||!audioSafe||now<0)
            return new Result(false,0,mode(now));
        int role=bindings.role(event);
        if(role==0||owned.size()>=32)return new Result(false,0,mode(now));
        if(role==1){
            owned.put(id,role);until=mode(now)?0:ACTIVE;
            return new Result(true,0,mode(now));
        }
        if(!mode(now))return new Result(false,0,false);
        owned.put(id,role);
        return new Result(true,role==2?1:-1,true);
    }

    /** Zoom role using this key: 1 custom, 2 in, 3 out, 0 none. */
    public static int zoomRole(Bindings current,Binding key){return current.mode.same(key)?1:current.in.same(key)?2:current.out.same(key)?3:0;}
    /** A button already used by another role swaps with it, so the three bindings stay distinct. */
    public static Bindings assign(Bindings current,int role,Binding learned){
        if(current==null||learned==null||role<1||role>3)throw new IllegalArgumentException("Invalid wheel assignment");
        Binding mode=current.mode,in=current.in,out=current.out,old=role==1?mode:role==2?in:out;
        if(mode.same(learned))mode=old;if(in.same(learned))in=old;if(out.same(learned))out=old;
        if(role==1)mode=learned;else if(role==2)in=learned;else out=learned;
        return new Bindings(mode,in,out);
    }

    /** Press-to-assign for wheels other than the Tang. One press is taken and its repeats/release are
     * consumed, so the car does not act on it. Home/back/power/recents are never taken. */
    public static final class Learning {
        public static final long TIMEOUT=10000;
        public static final class Capture {
            static final Capture PASS=new Capture(false,0,null),CONSUME=new Capture(true,0,null);
            public final boolean consume;public final int role;public final Binding binding;
            Capture(boolean consume,int role,Binding binding){this.consume=consume;this.role=role;this.binding=binding;}
        }
        private int role;private long until;private final Map<String,Boolean> taken=new HashMap<>();
        /** Roles 1–3 are the zoom keys, 4 is the Gemini key. */
        public synchronized void start(int role,long now){if(role<1||role>4||now<0)throw new IllegalArgumentException("Unknown wheel role");this.role=role;until=now+TIMEOUT;}
        public synchronized void cancel(){role=0;until=0;}
        public synchronized int role(long now){if(role!=0&&(now<0||now>=until))cancel();return role;}
        public synchronized long remaining(long now){return role(now)==0?0:until-now;}
        public synchronized Capture handle(Event event,long now){
            String id=event.identity();
            if(taken.containsKey(id)){if(event.action==UP)taken.remove(id);return Capture.CONSUME;}
            int active=role(now);
            if(active==0||event.action!=DOWN||event.repeat!=0||event.canceled||reserved(event.code))return Capture.PASS;
            Binding binding;
            try{binding=new Binding(event.code,event.scan,event.device);}catch(IllegalArgumentException unnamed){return Capture.PASS;}
            if(taken.size()>=32)taken.clear();
            taken.put(id,Boolean.TRUE);cancel();
            return new Capture(true,active,binding);
        }
        public synchronized void disconnected(){cancel();taken.clear();}
        static boolean reserved(int code){return code==3||code==4||code==26||code==187;}
    }

    /** Recent presses for the settings diagnostic, newest first. Only codes and the device name. */
    public static final class Recent {
        public static final int SIZE=20;
        private final long[] at=new long[SIZE];private final int[] code=new int[SIZE],scan=new int[SIZE],id=new int[SIZE];
        private final String[] device=new String[SIZE];private final boolean[] kept=new boolean[SIZE];private int next,count;
        public synchronized void add(long wall,Event event,boolean consumed){
            if(event.action!=DOWN||event.repeat!=0)return;
            String name=event.device==null?"unknown device":event.device.replaceAll("\\p{Cntrl}","?");if(name.length()>40)name=name.substring(0,40);
            at[next]=wall;code[next]=event.code;scan[next]=event.scan;id[next]=event.deviceId;device[next]=name;kept[next]=consumed;
            next=(next+1)%SIZE;if(count<SIZE)count++;
        }
        public synchronized int size(){return count;}
        public synchronized String describe(java.util.TimeZone zone){
            if(count==0)return "No keys received yet. Press a steering-wheel button. If nothing appears, this head unit handles that button before Android.";
            java.text.SimpleDateFormat time=new java.text.SimpleDateFormat("HH:mm:ss",java.util.Locale.US);time.setTimeZone(zone);
            StringBuilder out=new StringBuilder();
            for(int i=0;i<count;i++){int k=(next-1-i+SIZE)%SIZE;if(i>0)out.append('\n');
                out.append(time.format(new java.util.Date(at[k]))).append("  key ").append(code[k]).append('/').append(scan[k]).append("  ").append(device[k]).append(" #").append(id[k]).append(kept[k]?"  · Maps":"  · passed");}
            return out.toString();
        }
    }

    /** Validated colon-list utilities. Preserve all unrelated text/order and remove only our ID. */
    public static final class Components {
        private final List<String> entries;
        private Components(List<String> entries){this.entries=entries;}
        public static Components parse(String text){
            if(text==null)throw new IllegalArgumentException("Missing accessibility setting");
            if(text.length()>2800)throw new IllegalArgumentException("Accessibility setting is too long");
            text=text.trim();List<String> entries=new ArrayList<>();
            if(text.length()==0||"null".equals(text))return new Components(entries);
            for(String entry:text.split(":",-1)){normalize(entry);entries.add(entry);if(entries.size()>128)throw new IllegalArgumentException("Too many accessibility services");}
            return new Components(entries);
        }
        public static String normalize(String value){
            if(value==null||value.length()>512)throw new IllegalArgumentException("Invalid component");
            int slash=value.indexOf('/');
            if(slash<=0||slash!=value.lastIndexOf('/')||slash==value.length()-1)throw new IllegalArgumentException("Invalid component");
            String pkg=value.substring(0,slash),cls=value.substring(slash+1);
            if(!pkg.matches("[A-Za-z_][A-Za-z0-9_]*(\\.[A-Za-z_][A-Za-z0-9_]*)*"))throw new IllegalArgumentException("Invalid component package");
            if(cls.charAt(0)=='.')cls=pkg+cls;
            if(!cls.matches("[A-Za-z_$][A-Za-z0-9_$]*(\\.[A-Za-z_$][A-Za-z0-9_$]*)*"))throw new IllegalArgumentException("Invalid component class");
            return pkg+"/"+cls;
        }
        public String withOwn(String own,boolean on){
            own=normalize(own);StringBuilder result=new StringBuilder();boolean inserted=false;
            for(String entry:entries){
                if(normalize(entry).equals(own)){
                    if(!on||inserted)continue;
                    append(result,own);inserted=true;
                }else append(result,entry);
            }
            if(on&&!inserted)append(result,own);
            if(result.length()>2800)throw new IllegalArgumentException("Accessibility setting is too long");
            return result.toString();
        }
        public int count(String own){own=normalize(own);int count=0;for(String entry:entries)if(normalize(entry).equals(own))count++;return count;}
        public boolean preservesOthers(Components baseline,String own){
            own=normalize(own);
            for(String entry:baseline.entries){String normalized=normalize(entry);if(!normalized.equals(own)&&count(normalized)==0)return false;}
            return true;
        }
        private static void append(StringBuilder builder,String value){if(builder.length()>0)builder.append(':');builder.append(value);}
    }
}
