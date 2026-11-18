package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.concurrent.ConcurrentHashMap;

/** Learns responses from normal Brother traffic, stored in app-private preferences. */
public final class AutoCache {
    private static final String SNMP="com.brother.sdk.common.socket.devicemanagement.snmp.";
    private static final String WEST=SNMP+"westhawk.";
    private static final String MAC_OID="1.3.6.1.2.1.2.2.1.6.1";
    private static volatile SharedPreferences prefs,legacyPrefs;
    private static final ConcurrentHashMap<String,Long> VERIFIED=new ConcurrentHashMap<>();
    private static final LinkedHashMap<String,LinkedHashMap<String,String>> PENDING_LIVE=new LinkedHashMap<>();
    private static final LinkedHashMap<String,LinkedHashMap<PendingKey,String>> PENDING_HISTORY=new LinkedHashMap<>();
    private static final class PendingKey {
        final int version;final String community,oid;
        PendingKey(int version,String community,String oid){this.version=version;this.community=community;this.oid=oid;}
        @Override public boolean equals(Object value){if(!(value instanceof PendingKey))return false;PendingKey k=(PendingKey)value;return version==k.version&&community.equals(k.community)&&oid.equals(k.oid);}
        @Override public int hashCode(){return 31*(31*version+community.hashCode())+oid.hashCode();}
    }
    private static final long VERIFY_TTL_MS=30000;
    private static long cacheEpoch;
    private static final Map<String,Long> ENDPOINT_EPOCHS=new LinkedHashMap<>();
    private static long endpointEpoch(String ip){Long n=ENDPOINT_EPOCHS.get(ip);if(n==null){n=cacheEpoch;ENDPOINT_EPOCHS.put(ip,n);}return n;}
    private static final ThreadLocal<Long> REQUEST_EPOCH=new ThreadLocal<>();
    private static final ThreadLocal<Long> REQUEST_START=new ThreadLocal<>();
    private static final ThreadLocal<CommunicationTiming.Capture> REQUEST_CAPTURE=new ThreadLocal<>();
    private static volatile boolean historyStarted;
    private static java.lang.reflect.Method historyVerify,historyLookup,historyLearn;

    public static synchronized void init(Context context) {
        if(context==null)return;
        Context app=context.getApplicationContext();
        SharedPreferences fresh=app.getSharedPreferences("morphe_printer_cache_v2",Context.MODE_PRIVATE);
        SharedPreferences legacy=app.getSharedPreferences("morphe_printer_cache_v1",Context.MODE_PRIVATE);legacyPrefs=legacy;
        if(!fresh.getAll().containsKey("enabled")){
            fresh.edit().putBoolean("enabled",legacy.getBoolean("enabled",true)).apply();
        }
        prefs=fresh;
        purgeLegacy();
        if(!historyStarted){try{Class<?> runtime=Class.forName("app.template.extension.extension.HistoryRuntime");runtime.getMethod("init",Context.class).invoke(null,app);
            historyVerify=runtime.getMethod("verifyCache",String.class,String.class);
            historyLookup=runtime.getMethod("lookupCache",String.class,int.class,String.class,String.class);
            historyLearn=runtime.getMethod("learnCache",String.class,int.class,String.class,String.class,String.class);
            historyStarted=Boolean.TRUE.equals(runtime.getMethod("isInitialized").invoke(null));
        }catch(Exception|LinkageError ignored){}}
    }
    private static boolean purgeLegacy(){
        SharedPreferences old=legacyPrefs;if(old==null)return true;SharedPreferences.Editor edit=old.edit();boolean changed=false;
        for(String k:old.getAll().keySet())if(k.startsWith("entry|")||k.startsWith("name|")||k.startsWith("name-identity|")||k.startsWith("mac|")||k.startsWith("status|")||k.startsWith("identity|")||k.startsWith("last|")||k.startsWith("dynamic|")||k.startsWith("timing|")||k.startsWith("timing-identity|")){edit.remove(k);changed=true;}
        return !changed||edit.commit();
    }
    private static Object field(Object o,String name)throws ReflectiveOperationException{
        Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);
    }
    private static String address(Object socket)throws ReflectiveOperationException {
        if(socket==null || !socket.getClass().getName().equals("com.brother.sdk.network.BrDatagramSocket"))return null;
        InetAddress addr=(InetAddress)field(socket,"mInetAddress");
        if(addr==null || addr.isAnyLocalAddress() || addr.isMulticastAddress() || addr.isLoopbackAddress())return null;
        String ip=addr.getHostAddress();
        return ip!=null && ip.matches("[0-9]+(\\.[0-9]+){3}") && !ip.equals("255.255.255.255") ? ip:null;
    }
    private static String oid(Object request)throws ReflectiveOperationException {
        if(request==null || ((Byte)field(request,"msg_type"))!=(byte)0xa0)return null;
        Vector<?> bindings=(Vector<?>)field(request,"reqVarbinds");if(bindings.size()!=1)return null;
        Object obj=bindings.get(0).getClass().getMethod("getOid").invoke(bindings.get(0));
        String oid=(String)obj.getClass().getMethod("getValue").invoke(obj);
        return oid!=null && oid.matches("[0-9]+(\\.[0-9]+)+") ? oid:null;
    }
    private static String key(String ip,String oid){return "entry|"+ip+"|"+oid;}
    private static synchronized void resetVerification(){VERIFIED.clear();PENDING_LIVE.clear();PENDING_HISTORY.clear();}
    private static long monotonicMillis(){return System.nanoTime()/1000000L;}
    private static boolean isVerified(String ip){Long t=VERIFIED.get(ip);return t!=null && monotonicMillis()-t<VERIFY_TTL_MS;}
    private static String macAddress(byte[] bytes){
        if(bytes==null||bytes.length!=6||(bytes[0]&1)!=0)return null;
        boolean zero=true;for(byte b:bytes)if(b!=0)zero=false;if(zero)return null;
        StringBuilder s=new StringBuilder();for(byte b:bytes){if(s.length()>0)s.append(':');s.append(String.format(java.util.Locale.ROOT,"%02x",b&255));}return s.toString();
    }
    private static void archiveAddress(SharedPreferences p,String ip,String mac){
        SharedPreferences.Editor edit=p.edit();String prefix="entry|"+ip+"|";
        String printerName=p.getString("name|"+ip,null);if(mac!=null&&printerName!=null)edit.putString("name-identity|"+mac,printerName);edit.remove("name|"+ip);
        for(Map.Entry<String,?> e:p.getAll().entrySet())if(e.getKey().startsWith(prefix)){
            if(mac!=null && e.getValue() instanceof String)edit.putString("identity|"+mac+"|"+e.getKey().substring(prefix.length()),(String)e.getValue());
            edit.remove(e.getKey());
        }
        String timingPrefix="timing|"+ip+"|";
        for(Map.Entry<String,?> e:p.getAll().entrySet())if(mac!=null&&e.getKey().startsWith(timingPrefix)){
            if(e.getValue() instanceof String)edit.putString("timing-identity|"+mac+"|"+e.getKey().substring(timingPrefix.length()),(String)e.getValue());
            edit.remove(e.getKey());
        }
        edit.remove("mac|"+ip).remove("status|"+ip).apply();VERIFIED.remove(ip);
    }
    private static synchronized void acceptIdentity(String ip,String mac){
        SharedPreferences p=prefs;if(p==null)return;
        String previous=p.getString("mac|"+ip,null);
        if(previous!=null&&!previous.equals(mac))PENDING_HISTORY.remove(ip);
        if(previous==null||!previous.equals(mac))archiveAddress(p,ip,previous);
        String last=p.getString("last|"+mac,null);boolean moved=false;
        for(Map.Entry<String,?> entry:p.getAll().entrySet()){
            String k=entry.getKey();if(!k.startsWith("mac|")||!mac.equals(entry.getValue()))continue;
            String old=k.substring(4);if(!old.equals(ip)){moved=true;PENDING_HISTORY.remove(old);CommunicationTiming.discard(old);archiveAddress(p,old,mac);}
        }
        SharedPreferences.Editor edit=p.edit();String prefix="identity|"+mac+"|";
        String savedName=p.getString("name-identity|"+mac,null);if(savedName!=null){edit.putString("name|"+ip,savedName);edit.remove("name-identity|"+mac);}
        for(Map.Entry<String,?> entry:p.getAll().entrySet())if(entry.getKey().startsWith(prefix)&&entry.getValue() instanceof String){
            String dest=key(ip,entry.getKey().substring(prefix.length()));
            if(!p.getAll().containsKey(dest))edit.putString(dest,(String)entry.getValue());
            edit.remove(entry.getKey());
        }
        String timingPrefix="timing-identity|"+mac+"|";
        for(Map.Entry<String,?> entry:p.getAll().entrySet())if(entry.getKey().startsWith(timingPrefix)&&entry.getValue() instanceof String){
            String dest="timing|"+ip+"|"+entry.getKey().substring(timingPrefix.length());
            if(!p.getAll().containsKey(dest)||(previous==null&&(moved||(last!=null&&!last.equals(ip)))))edit.putString(dest,(String)entry.getValue());edit.remove(entry.getKey());
        }
        LinkedHashMap<String,String> pending=PENDING_LIVE.remove(ip);
        if(pending!=null)for(Map.Entry<String,String> entry:pending.entrySet())edit.putString(key(ip,entry.getKey()),entry.getValue());
        edit.putString("mac|"+ip,mac).putString("last|"+mac,ip);
        if(moved||(last!=null&&!last.equals(ip)))edit.putBoolean("dynamic|"+mac,true);
        edit.apply();VERIFIED.put(ip,monotonicMillis());
        if(historyStarted){
            try{historyVerify.invoke(null,ip,mac);LinkedHashMap<PendingKey,String> staged=PENDING_HISTORY.remove(ip);if(staged!=null)for(Map.Entry<PendingKey,String> entry:staged.entrySet()){PendingKey k=entry.getKey();historyLearn.invoke(null,ip,k.version,k.community,k.oid,entry.getValue());if(k.oid.equals("1.3.6.1.2.1.25.3.2.1.3.1")||k.oid.equals("1.3.6.1.2.1.1.1.0"))p.edit().putString("name|"+ip,entry.getValue()).apply();}}
            catch(Exception|LinkageError ignored){PENDING_HISTORY.remove(ip);}
        }
    }
    public static boolean hasChangedAddress(String ip){SharedPreferences p=prefs;if(p==null)return false;String mac=p.getString("mac|"+ip,null);return mac!=null&&p.getBoolean("dynamic|"+mac,false);}
    private static void diagnosticResult(String source,Object result){
        if(!Diagnostics.isRecording())return;
        try{
            String state=result==null?"No result":String.valueOf(result.getClass().getField("state").get(result));
            String type="",value="";
            if(result!=null && state.equals("SuccessRequest")){
                Object values=result.getClass().getField("results").get(result);
                if(values!=null && Array.getLength(values)==1){
                    Object v=Array.get(values,0).getClass().getMethod("getValue").invoke(Array.get(values,0));
                    if(v!=null && v.getClass().getName().equals(WEST+"AsnOctets")){byte[] bytes=(byte[])v.getClass().getMethod("getBytes").invoke(v);if(bytes.length<=8192){type="octets_base64";value=Base64.encodeToString(bytes,Base64.NO_WRAP);}else type="too_large";}
                    else if(v!=null && v.getClass().getName().equals(WEST+"AsnInteger")){type="integer";value=String.valueOf(v.getClass().getMethod("getValue").invoke(v));}
                    else if(v!=null)type="unsupported";
                }
            }
            Diagnostics.finish(source,state,type,value);
        }catch(Exception|LinkageError ignored){Diagnostics.finish(source,"unreadable","","");}
    }
    public static boolean enabled(){SharedPreferences p=prefs;return p!=null && p.getBoolean("enabled",true);}
    public static synchronized void setEnabled(boolean value){SharedPreferences p=prefs;if(p!=null)p.edit().putBoolean("enabled",value).apply();if(!value){cacheEpoch++;ENDPOINT_EPOCHS.clear();resetVerification();}}
    public static String readString(String key,String fallback){SharedPreferences p=prefs;return p==null?fallback:p.getString(key,fallback);}
    public static synchronized void saveTiming(String ip,long span,int live,int cached){saveTiming(ip,span,live,cached,0,0,0,0);}
    public static synchronized long generation(){return cacheEpoch;}
    public static synchronized void saveTimingIfCurrent(String ip,long span,int live,int cached,long estimate,int matched,long liveTime,int liveMeasured,long expected){if(expected<0||expected==endpointEpoch(ip))saveTiming(ip,span,live,cached,estimate,matched,liveTime,liveMeasured);}
    public static synchronized void saveTiming(String ip,long span,int live,int cached,long estimate,int matched,long liveTime,int liveMeasured){
        SharedPreferences p=prefs;if(p==null||ip==null||live+cached==0)return;
        String base="timing|"+ip+"|",firstKey=base+"baseline",latestKey=base+"latest";
        String row=span+"|"+live+"|"+cached+"|"+System.currentTimeMillis();
        String detail=estimate+"|"+matched+"|"+cached+"|"+liveTime+"|"+liveMeasured+"|"+live;
        SharedPreferences.Editor edit=p.edit().putString(latestKey,row).putString(latestKey+"|estimate",detail);
        String legacy=p.getString(firstKey,null)==null?firstKey:(cached>0?base+"cached":null);
        if(legacy!=null)edit.putString(legacy,row).putString(legacy+"|estimate",detail);
        edit.apply();
    }
    public static String timingValue(String ip,String kind){SharedPreferences p=prefs;if(p==null)return "";String v=p.getString("timing|"+ip+"|"+kind,"");String[] a=v.split("\\|");return a.length==4?a[0]:"";}
    public static String timingRequestCount(String ip,String kind){SharedPreferences p=prefs;if(p==null)return "";try{String[] a=p.getString("timing|"+ip+"|"+kind,"").split("\\|");return Integer.toString(Integer.parseInt(a[1])+Integer.parseInt(a[2]));}catch(Exception ignored){return "";}}
    private static String timingLine(String label,String value){
        if(value==null||value.isEmpty())return label+": Not recorded";
        try{String[] a=value.split("\\|");long ms=Long.parseLong(a[0]);int live=Integer.parseInt(a[1]),cached=Integer.parseInt(a[2]);return String.format(java.util.Locale.ROOT,"%s: %.2f s · %d requests (%d cached)",label,ms/1000.0,live+cached,cached);}catch(Exception ignored){return label+": Not recorded";}
    }
    public static String timingEstimateField(String ip,String kind,int index){SharedPreferences p=prefs;if(p==null)return "";try{String[] a=p.getString("timing|"+ip+"|"+kind+"|estimate","").split("\\|");return a.length==6?a[index]:"";}catch(Exception ignored){return "";}}
    private static String estimateLine(SharedPreferences p,String key){
        try{String[] a=p.getString(key+"|estimate","").split("\\|");long ms=Long.parseLong(a[0]);int matched=Integer.parseInt(a[1]),total=Integer.parseInt(a[2]);if(total==0)return "";if(matched==0)return "\nEstimated request time avoided: Not available (0 of "+total+" hits matched)";String out=String.format(java.util.Locale.ROOT,"\nEstimated request time avoided: %.2f s (%d of %d hits matched)",ms/1000.0,matched,total);if(a.length>=6){long liveTime=Long.parseLong(a[3]);int liveMeasured=Integer.parseInt(a[4]),live=Integer.parseInt(a[5]);if(matched==total&&liveMeasured==live)out+=String.format(java.util.Locale.ROOT,"\nEstimated total request time without cache: %.2f s",(liveTime+ms)/1000.0);}return out;}catch(Exception ignored){return "";}
    }
    public static synchronized void saveMeasurement(String ip,long span,int count){SharedPreferences p=prefs;if(p!=null)p.edit().putString("timing|"+ip+"|measurement",span+"|"+count+"|0|"+System.currentTimeMillis()).apply();}
    private static long timingTimestamp(String value){try{return Long.parseLong(value.split("\\|")[3]);}catch(Exception ignored){return -1;}}
    private static String latestTimingKey(SharedPreferences p,String ip){String base="timing|"+ip+"|",latest=base+"latest",first=base+"baseline",cached=base+"cached";if(!p.getString(latest,"").isEmpty())return latest;return timingTimestamp(p.getString(cached,""))>=timingTimestamp(p.getString(first,""))?cached:first;}
    public static String timingSummary(String ip){SharedPreferences p=prefs;if(p==null)return "Latest activity: Not recorded";String latest=latestTimingKey(p,ip),measure="timing|"+ip+"|measurement";String out=timingLine("Latest activity",p.getString(latest,""))+estimateLine(p,latest);String m=p.getString(measure,"");if(!m.isEmpty())out+="\n"+timingLine("Uncached measurement",m);return out;}
    private static long sample(String ip,String id){try{String[] a=prefs.getString("timing|"+ip+"|sample|"+id,"").split("\\|");return Long.parseLong(a[0])/Long.parseLong(a[1]);}catch(Exception ignored){return -1;}}
    private static void saveSample(String ip,String id,long elapsed){if(elapsed<0||elapsed>30000)return;SharedPreferences p=prefs;if(p==null)return;String key="timing|"+ip+"|sample|"+id;try{String[] a=p.getString(key,"").split("\\|");long sum=Long.parseLong(a[0]),n=Long.parseLong(a[1]);if(n>=32){sum=sum*31/n;n=31;}p.edit().putString(key,(sum+elapsed)+"|"+(n+1)).apply();}catch(Exception ignored){p.edit().putString(key,elapsed+"|1").apply();}}
    private static String activityTime(SharedPreferences p,String key,String label){
        try{String[] a=p.getString(key,"").split("\\|");return String.format(java.util.Locale.ROOT,"%s: %.2f s",label,Long.parseLong(a[0])/1000.0);}catch(Exception ignored){return label+": Not recorded";}
    }
    private static String cardEstimates(SharedPreferences p,String key){
        try{String[] a=p.getString(key+"|estimate","").split("\\|");long avoided=Long.parseLong(a[0]),liveTime=Long.parseLong(a[3]);int matched=Integer.parseInt(a[1]),cached=Integer.parseInt(a[2]),liveMeasured=Integer.parseInt(a[4]),live=Integer.parseInt(a[5]);String total=(matched==cached&&liveMeasured==live)?String.format(java.util.Locale.ROOT,"~%.2f s of requests",(liveTime+avoided)/1000.0):"estimate unavailable";String saved=(cached==0||matched>0)?String.format(java.util.Locale.ROOT," (~%.2f s avoided%s)",avoided/1000.0,matched<cached?", partial":""):"";return "\nWithout cache: "+total+saved;}catch(Exception ignored){return "\nWithout cache: estimate unavailable";}
    }
    public static String timingCardSummary(String ip){SharedPreferences p=prefs;if(p==null)return "Actual time: Not recorded";String key=latestTimingKey(p,ip);return activityTime(p,key,"Actual time")+cardEstimates(p,key);}
    public static String uncachedMeasurementSummary(String ip){SharedPreferences p=prefs;return p==null?"Uncached test: Not recorded":timingLine("Uncached test",p.getString("timing|"+ip+"|measurement",""));}
    public static synchronized void clearTimings(String ip){SharedPreferences p=prefs;if(p==null||ip==null)return;String mac=p.getString("mac|"+ip,null);SharedPreferences.Editor e=p.edit().remove("timing|"+ip+"|baseline").remove("timing|"+ip+"|baseline|estimate").remove("timing|"+ip+"|cached").remove("timing|"+ip+"|cached|estimate").remove("timing|"+ip+"|measurement").remove("timing|"+ip+"|latest").remove("timing|"+ip+"|latest|estimate");if(mac!=null){e.remove("timing-identity|"+mac+"|baseline").remove("timing-identity|"+mac+"|baseline|estimate").remove("timing-identity|"+mac+"|cached").remove("timing-identity|"+mac+"|cached|estimate").remove("timing-identity|"+mac+"|measurement").remove("timing-identity|"+mac+"|latest").remove("timing-identity|"+mac+"|latest|estimate");}e.apply();CommunicationTiming.discard(ip);}
    public static String printerName(String ip){
        SharedPreferences p=prefs;if(p==null||ip==null)return "Saved printer";
        String[] names=historyStarted?new String[]{"name|"+ip}:new String[]{key(ip,"1.3.6.1.2.1.25.3.2.1.3.1"),key(ip,"1.3.6.1.2.1.1.1.0")};
        for(String nameKey:names){
            try{String saved=p.getString(nameKey,null);if(saved==null||!saved.startsWith("octets:"))continue;
                String name=new String(Base64.decode(saved.substring(7),Base64.DEFAULT),StandardCharsets.UTF_8).replaceAll("[\\p{Cntrl}\\s]+"," ").trim();
                if(!name.isEmpty())return name.length()>80?name.substring(0,77)+"…":name;
            }catch(Exception ignored){}
        }
        return "Saved printer";
    }
    public static void writeString(String key,String value){SharedPreferences p=prefs;if(p!=null)p.edit().putString(key,value).apply();}
    public static Set<String> printers(){
        Set<String> result=new HashSet<>();SharedPreferences p=prefs;if(p==null)return result;
        for(String k:p.getAll().keySet()){if(k.startsWith("entry|")){int end=k.indexOf('|',6);if(end>6)result.add(k.substring(6,end));}else if(historyStarted&&k.startsWith("mac|"))result.add(k.substring(4));}
        return result;
    }
    private static boolean clearHistory(String method,String ip,String mac){
        if(!historyStarted)return true;
        try{Class<?> runtime=Class.forName("app.template.extension.extension.HistoryRuntime");
            Object result=ip==null?runtime.getMethod(method).invoke(null):runtime.getMethod(method,String.class,String.class).invoke(null,ip,mac);
            return Boolean.TRUE.equals(result);
        }catch(Exception|LinkageError e){return false;}
    }
    public static synchronized boolean clearPrinter(String ip){
        SharedPreferences p=prefs;if(p==null||ip==null)return false;SharedPreferences.Editor e=p.edit();
        cacheEpoch++;ENDPOINT_EPOCHS.put(ip,cacheEpoch);
        String mac=p.getString("mac|"+ip,null);
        CommunicationTiming.discard(ip);
        if(!clearHistory("clearPrinter",ip,mac)||!purgeLegacy())return false;
        for(String k:p.getAll().keySet())if(k.startsWith("entry|"+ip+"|")||k.startsWith("timing|"+ip+"|")||k.equals("name|"+ip)||k.equals("mac|"+ip)||k.equals("status|"+ip)||(mac!=null&&(k.startsWith("identity|"+mac+"|")||k.startsWith("timing-identity|"+mac+"|")||k.equals("name-identity|"+mac)||k.equals("last|"+mac)||k.equals("dynamic|"+mac))))e.remove(k);e.apply();VERIFIED.remove(ip);PENDING_LIVE.remove(ip);PENDING_HISTORY.remove(ip);CommunicationTiming.discard(ip);
        return true;
    }
    public static synchronized boolean clearAll(){SharedPreferences p=prefs;if(p==null)return false;cacheEpoch++;ENDPOINT_EPOCHS.clear();CommunicationTiming.discardAll();if(!clearHistory("clearAll",null,null)||!purgeLegacy())return false;SharedPreferences.Editor e=p.edit();for(String k:p.getAll().keySet())if(k.startsWith("entry|")||k.startsWith("name|")||k.startsWith("name-identity|")||k.startsWith("mac|")||k.startsWith("status|")||k.startsWith("identity|")||k.startsWith("last|")||k.startsWith("dynamic|")||k.startsWith("timing|")||k.startsWith("timing-identity|"))e.remove(k);e.apply();VERIFIED.clear();PENDING_LIVE.clear();PENDING_HISTORY.clear();CommunicationTiming.discardAll();return true;}
    private static boolean timingResponseMatches(Object result,String id,String state){
        if(state.equals("ErrorRequestNoSuchName"))return true;
        if(!state.equals("SuccessRequest"))return false;
        try{Object values=result.getClass().getField("results").get(result);if(values==null||Array.getLength(values)!=1)return false;Object binding=Array.get(values,0);Object returned=binding.getClass().getMethod("getOid").invoke(binding);return id.equals(returned.getClass().getMethod("getValue").invoke(returned));}catch(Exception ignored){return false;}
    }
    private static void stageLive(String ip,String oid,String value){
        LinkedHashMap<String,String> pending=PENDING_LIVE.get(ip);
        if(pending==null){if(PENDING_LIVE.size()>=8)PENDING_LIVE.remove(PENDING_LIVE.keySet().iterator().next());pending=new LinkedHashMap<>();PENDING_LIVE.put(ip,pending);}
        if(!pending.containsKey(oid)&&pending.size()>=128)pending.remove(pending.keySet().iterator().next());pending.put(oid,value);
    }
    private static void stageHistory(String ip,Object request,String oid,String value){
        try{String community=(String)field(request,"community");int version=(Integer)field(request,"version");if(community==null)return;
            LinkedHashMap<PendingKey,String> pending=PENDING_HISTORY.get(ip);
            if(pending==null){if(PENDING_HISTORY.size()>=8)PENDING_HISTORY.remove(PENDING_HISTORY.keySet().iterator().next());pending=new LinkedHashMap<>();PENDING_HISTORY.put(ip,pending);}
            PendingKey key=new PendingKey(version,community,oid);if(!pending.containsKey(key)&&pending.size()>=128)pending.remove(pending.keySet().iterator().next());pending.put(key,value);
        }catch(Exception|LinkageError ignored){}
    }
    public static synchronized Map<String,String> replaySnapshot(String ip,java.util.List<ReplayEngine.Spec> specs){Map<String,String> snapshot=new LinkedHashMap<>();SharedPreferences p=prefs;if(p==null)return snapshot;for(ReplayEngine.Spec spec:specs){String saved=p.getString(key(ip,spec.oid),null);if(saved!=null)snapshot.put(spec.oid,saved);}return snapshot;}
    private static String responseValue(Object result,String oid){
        try{if(result==null||oid==null)return null;String state=String.valueOf(result.getClass().getField("state").get(result));
            if(state.equals("ErrorRequestNoSuchName"))return "missing:";
            if(!state.equals("SuccessRequest"))return null;
            Object values=result.getClass().getField("results").get(result);if(values==null||Array.getLength(values)!=1)return null;
            Object binding=Array.get(values,0),returned=binding.getClass().getMethod("getOid").invoke(binding);
            if(!oid.equals(returned.getClass().getMethod("getValue").invoke(returned)))return null;
            Object value=binding.getClass().getMethod("getValue").invoke(binding);if(value==null)return null;
            if(value.getClass().getName().equals(WEST+"AsnOctets")){byte[] bytes=(byte[])value.getClass().getMethod("getBytes").invoke(value);return bytes.length<=8192?"octets:"+Base64.encodeToString(bytes,Base64.NO_WRAP):null;}
            if(value.getClass().getName().equals(WEST+"AsnInteger"))return "integer:"+value.getClass().getMethod("getValue").invoke(value);
        }catch(Exception|LinkageError ignored){}return null;
    }
    public static Object lookup(Object socket,Object request){return lookup(socket,request,1000,1);}
    /** Called on terminal SDK returns and explicit throws, including timeouts. */
    public static void finishRequest(){if(ReplayTransport.isReplayThread())return;CommunicationTiming.failCapture(REQUEST_CAPTURE.get());REQUEST_CAPTURE.remove();REQUEST_EPOCH.remove();REQUEST_START.remove();}
    public static synchronized Object lookup(Object socket,Object request,int timeout,int retries){
        if(ReplayTransport.isReplayThread())return null;
        try{
            Diagnostics.abandon();
            REQUEST_EPOCH.remove();REQUEST_START.remove();REQUEST_CAPTURE.remove();
            String ip=address(socket),id=oid(request);if(ip==null||id==null)return null;
            long requestEpoch=endpointEpoch(ip);REQUEST_EPOCH.set(requestEpoch);REQUEST_START.set(System.nanoTime());
            CommunicationTiming.request(ip,requestEpoch,isVerified(ip)&&prefs!=null?prefs.getString("mac|"+ip,null):null);
            try{String community=(String)field(request,"community");int version=(Integer)field(request,"version"),requestId=(Integer)field(request,"req_id"),port=(Integer)field(socket,"mPort");if(community==null||port<1||port>65535||timeout<0||retries<1)REQUEST_CAPTURE.set(CommunicationTiming.capture(ip,null));else REQUEST_CAPTURE.set(CommunicationTiming.capture(ip,new ReplayEngine.Spec(id,community,version,requestId,port,timeout,retries)));}catch(Exception ignored){REQUEST_CAPTURE.set(CommunicationTiming.capture(ip,null));}
            Diagnostics.begin(ip,id,CommunicationTiming.captureSequence(REQUEST_CAPTURE.get()));
            if(!enabled())return null;
            if(id.equals(MAC_OID)){VERIFIED.remove(ip);return null;}
            if(!isVerified(ip))return null;
            String saved;
            if(historyStarted){try{saved=(String)historyLookup.invoke(null,ip,(Integer)field(request,"version"),(String)field(request,"community"),id);}catch(Exception|LinkageError ignored){saved=null;}}
            else saved=prefs.getString(key(ip,id),null);
            if(saved==null)return null;
            String[] parts=saved.split(":",2);ClassLoader loader=request.getClass().getClassLoader();
            Class<?> resultClass=loader.loadClass(SNMP+"SnmpResult");Object result=resultClass.getConstructor().newInstance();
            if(parts[0].equals("missing")){
                Class<?> state=loader.loadClass(SNMP+"SnmpResult$SnmpState");resultClass.getField("state").set(result,state.getField("ErrorRequestNoSuchName").get(null));long estimate=sample(ip,id);CommunicationTiming.cacheHit(ip,id,estimate);CommunicationTiming.captureCachedResponse(REQUEST_CAPTURE.get(),saved,estimate);REQUEST_CAPTURE.remove();REQUEST_START.remove();diagnosticResult("cache",result);REQUEST_EPOCH.remove();return result;
            }
            if(parts.length!=2)return null;Class<?> asn=loader.loadClass(WEST+"AsnObject"),vb=loader.loadClass(WEST+"Varbind");Object value;
            if(parts[0].equals("octets"))value=loader.loadClass(WEST+"AsnOctets").getConstructor(byte[].class).newInstance((Object)Base64.decode(parts[1],Base64.DEFAULT));
            else if(parts[0].equals("integer"))value=loader.loadClass(WEST+"AsnInteger").getConstructor(int.class).newInstance(Integer.parseInt(parts[1]));
            else return null;
            Object bind=vb.getConstructor(String.class,asn).newInstance(id,value);Object array=Array.newInstance(vb,1);Array.set(array,0,bind);resultClass.getField("results").set(result,array);long estimate=sample(ip,id);CommunicationTiming.cacheHit(ip,id,estimate);CommunicationTiming.captureCachedResponse(REQUEST_CAPTURE.get(),saved,estimate);REQUEST_CAPTURE.remove();REQUEST_START.remove();diagnosticResult("cache",result);REQUEST_EPOCH.remove();return result;
        }catch(Exception|LinkageError ignored){return null;}
    }
    public static synchronized void record(Object socket,Object request,Object result){
        if(ReplayTransport.isReplayThread())return;
        try{
            diagnosticResult("printer",result);
            // A failed decode can be followed by another response in the same request.
            // Keep its epoch and capture until a result exists, so a clear invalidates retries too.
            if(result==null)return;
            String ip=address(socket),id=oid(request);if(ip==null||id==null)return;
            Long requestEpoch=REQUEST_EPOCH.get();REQUEST_EPOCH.remove();Long started=REQUEST_START.get();REQUEST_START.remove();if(requestEpoch!=null&&requestEpoch.longValue()!=endpointEpoch(ip))return;
            String timingIp=address(socket);if(timingIp!=null&&oid(request)!=null)CommunicationTiming.response(timingIp);
            if(result!=null){CommunicationTiming.captureResponse(REQUEST_CAPTURE.get(),responseValue(result,oid(request)));REQUEST_CAPTURE.remove();}
            String state=String.valueOf(result.getClass().getField("state").get(result));
            if(started!=null&&timingResponseMatches(result,id,state)){long elapsed=Math.max(0,(System.nanoTime()-started)/1000000L);saveSample(ip,id,elapsed);CommunicationTiming.liveSample(ip,elapsed);}
            if(!enabled())return;String encoded;
            if(state.equals("ErrorRequestNoSuchName"))encoded="missing:";
            else if(state.equals("SuccessRequest")){
                Object values=result.getClass().getField("results").get(result);if(values==null||Array.getLength(values)!=1)return;
                Object binding=Array.get(values,0);Object returnedOid=binding.getClass().getMethod("getOid").invoke(binding);
                if(!id.equals(returnedOid.getClass().getMethod("getValue").invoke(returnedOid)))return;
                Object value=binding.getClass().getMethod("getValue").invoke(binding);if(value==null)return;
                if(value.getClass().getName().equals(WEST+"AsnOctets")){
                    byte[] bytes=(byte[])value.getClass().getMethod("getBytes").invoke(value);if(bytes.length>8192)return;
                    encoded="octets:"+Base64.encodeToString(bytes,Base64.NO_WRAP);
                    if(id.equals(MAC_OID)){String mac=macAddress(bytes);if(mac==null){VERIFIED.remove(ip);PENDING_LIVE.remove(ip);PENDING_HISTORY.remove(ip);return;}acceptIdentity(ip,mac);}
                }else if(value.getClass().getName().equals(WEST+"AsnInteger"))encoded="integer:"+value.getClass().getMethod("getValue").invoke(value);
                else return;
            }else return;
            if(isVerified(ip)){
                if(historyStarted){try{historyLearn.invoke(null,ip,(Integer)field(request,"version"),(String)field(request,"community"),id,encoded);}catch(Exception|LinkageError ignored){}
                    if(id.equals("1.3.6.1.2.1.25.3.2.1.3.1")||id.equals("1.3.6.1.2.1.1.1.0"))prefs.edit().putString("name|"+ip,encoded).apply();
                }else prefs.edit().putString(key(ip,id),encoded).apply();
            }else if(!id.equals(MAC_OID)){if(historyStarted)stageHistory(ip,request,id,encoded);else stageLive(ip,id,encoded);}
        }catch(Exception|LinkageError ignored){}
    }
    private AutoCache(){}
}

