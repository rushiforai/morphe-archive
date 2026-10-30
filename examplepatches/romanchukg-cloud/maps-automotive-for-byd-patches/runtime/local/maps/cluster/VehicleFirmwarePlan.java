// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Fixed, read-only BYD address policy. No Android, persistence, shell commands or vehicle writes. */
public final class VehicleFirmwarePlan {
    public enum Mode { AUTO, LEGACY }
    public enum Origin { AUTO_CAN, AUTO_CANFD, FIRMWARE, CONTROLLER_13, CANFD_FALLBACK }
    public enum Confidence { PROTOCOL, NAMED_FIRMWARE, NEEDS_CONFIRMATION }
    public static final java.util.List<String> FIELDS=Collections.unmodifiableList(java.util.Arrays.asList(
        "soc","range","cable","charging","ac_port","dc_port","remaining_energy","port_lock"));
    private static final String[] LEGACY_FIELDS={"soc","range","charging","remaining_energy"};
    private VehicleFirmwarePlan() {}

    public static final class Context {
        public final String firmware,protocol;
        public final int sdk;
        public final Mode mode;
        public final long generation;
        public Context(String firmware,String ro,String sys,int sdk,Mode mode,long generation) {
            if(firmware==null||!firmware.matches("[a-f0-9]{64}")||sdk<1||sdk>100||mode==null||generation<0)
                throw new IllegalArgumentException("Invalid firmware context");
            this.firmware=firmware;this.protocol=protocol(ro,sys);this.sdk=sdk;this.mode=mode;this.generation=generation;
        }
        private String key(){return firmware+"\n"+protocol+"\n"+mode;}
    }

    /** Empty ro falls back to sys; unsupported nonempty ro stays unsupported. */
    public static String protocol(String ro,String sys) {
        String first=ro==null?"":ro.trim();String value=first.isEmpty()?(sys==null?"":sys.trim()):first;
        return "CAN".equals(value)||"CANFD".equals(value)?value:"UNKNOWN";
    }

    public static final class Address {
        public final String field;
        public final int transaction,device,fid;
        public final Origin origin;
        public Address(String field,int transaction,int device,int fid,Origin origin) {
            if(!known(field)||transaction!=transaction(field)||device<=0||device>65535||fid<=0||origin==null)
                throw new IllegalArgumentException("Invalid getter address");
            this.field=field;this.transaction=transaction;this.device=device;this.fid=fid;this.origin=origin;
        }
        public Confidence confidence(){return origin==Origin.FIRMWARE?Confidence.NAMED_FIRMWARE:
            origin==Origin.AUTO_CAN||origin==Origin.AUTO_CANFD?Confidence.PROTOCOL:Confidence.NEEDS_CONFIRMATION;}
        private String key(){return field+":"+transaction+":"+device+":"+fid+":"+origin;}
        private boolean same(Address other){return other!=null&&key().equals(other.key());}
    }

    public static final class Reading {
        public final String status;
        public final Double raw;
        public Reading(String status,Double raw) {
            if(!("available".equals(status)||"unknown".equals(status)||"unsupported".equals(status)||
                "denied".equals(status)||"error".equals(status)||"unconfirmed".equals(status)))
                throw new IllegalArgumentException("Invalid reading status");
            this.status=status;this.raw=raw!=null&&Double.isFinite(raw)?raw:null;
        }
        public static Reading value(double raw){return new Reading("available",raw);}
        public static Reading unavailable(String status){return new Reading(status,null);}
    }
    public interface Getter { Reading read(Address address) throws Exception; }

    /** Only exact requested symbol names are retained; arbitrary SDK members cannot become getters. */
    public static final class Catalog {
        public final Map<String,Integer> symbols;
        public Catalog(Map<String,Integer> values) {
            LinkedHashMap<String,Integer> clean=new LinkedHashMap<>();
            if(values!=null)for(String field:LEGACY_FIELDS){
                copy(values,clean,symbol(field));
                if("charging".equals(field))copy(values,clean,"Charging.CHARGING_BATTERY_DEVICE_STATE");
                copy(values,clean,deviceSymbol(field));
            }
            symbols=Collections.unmodifiableMap(clean);
        }
        private static void copy(Map<String,Integer> in,Map<String,Integer> out,String key){
            Integer value=in.get(key);
            if(value!=null&&value>0&&(!key.startsWith("BYDAutoConstants.")||value<=65535))out.put(key,value);
        }
        private Integer fid(String field){
            Integer value=symbols.get(symbol(field));
            return value==null&&"charging".equals(field)?symbols.get("Charging.CHARGING_BATTERY_DEVICE_STATE"):value;
        }
        private int device(String field){Integer value=symbols.get(deviceSymbol(field));return value==null?defaultDevice(field):value;}
        /** Read only the named static int fields in two firmware classes, without enumerating getters. */
        public static Catalog reflect(ClassLoader loader) {
            LinkedHashMap<String,Integer> found=new LinkedHashMap<>();
            try {
                Class<?> root=Class.forName("android.hardware.bydauto.BYDAutoFeatureIds",false,loader);
                Map<String,Class<?>> nested=new LinkedHashMap<>();
                for(Class<?> type:root.getDeclaredClasses())nested.put(type.getSimpleName(),type);
                for(String field:LEGACY_FIELDS){
                    readSymbol(nested,symbol(field),found);
                    if("charging".equals(field))readSymbol(nested,"Charging.CHARGING_BATTERY_DEVICE_STATE",found);
                }
            }catch(ReflectiveOperationException|LinkageError|SecurityException ignored){}
            try {
                Class<?> constants=Class.forName("android.hardware.bydauto.BYDAutoConstants",false,loader);
                for(String field:LEGACY_FIELDS)read(constants,deviceSymbol(field),found);
            }catch(ReflectiveOperationException|LinkageError|SecurityException ignored){}
            return new Catalog(found);
        }
        private static void readSymbol(Map<String,Class<?>> types,String key,Map<String,Integer> found){
            Class<?> type=types.get(key.substring(0,key.indexOf('.')));if(type!=null)read(type,key,found);
        }
        private static void read(Class<?> type,String key,Map<String,Integer> found){
            try {
                Field member=type.getDeclaredField(key.substring(key.indexOf('.')+1));
                if(member.getType()!=int.class||!Modifier.isStatic(member.getModifiers()))return;
                if(!member.isAccessible())member.setAccessible(true);
                found.put(key,member.getInt(null));
            }catch(ReflectiveOperationException|LinkageError|SecurityException ignored){}
        }
    }

    public static final class Selection {
        public final Context context;
        public final Map<String,Address> addresses;
        /** Probe samples are diagnostic only. read() always obtains a new live reading. */
        public final Map<String,Reading> probeSamples;
        public final String hash;
        private Selection(Context context,Map<String,Address> addresses,Map<String,Reading> probes) {
            this.context=context;this.addresses=Collections.unmodifiableMap(new LinkedHashMap<>(addresses));
            this.probeSamples=Collections.unmodifiableMap(new LinkedHashMap<>(probes));
            StringBuilder canonical=new StringBuilder(context.key());
            for(String field:FIELDS){Address address=addresses.get(field);if(address!=null)canonical.append('\n').append(address.key());}
            hash=sha256(canonical.toString());
        }
        public boolean needsConfirmation(){for(Address a:addresses.values())if(a.confidence()==Confidence.NEEDS_CONFIRMATION)return true;return false;}
    }

    /** AUTO selects a protocol whitelist without touching Binder. LEGACY performs a fixed bounded probe. */
    public static Selection select(Context context,Catalog catalog,Getter getter) {
        if(context==null)throw new IllegalArgumentException("Missing context");
        LinkedHashMap<String,Address> selected=new LinkedHashMap<>();
        LinkedHashMap<String,Reading> probes=new LinkedHashMap<>();
        if(context.mode==Mode.AUTO){
            for(String field:FIELDS){Address a=automatic(context,field);if(a!=null)selected.put(field,a);}
        }else{
            if(getter==null)throw new IllegalArgumentException("Missing probe getter");
            for(String field:LEGACY_FIELDS){
                if("remaining_energy".equals(field)&&"CAN".equals(context.protocol))continue;
                for(Address address:candidates(context,catalog,field).values()){
                    Reading reading=invoke(getter,address);
                    if("available".equals(reading.status)&&plausible(field,reading.raw)){
                        selected.put(field,address);probes.put(field,canonical(context,address,reading,null));break;
                    }
                }
            }
        }
        return new Selection(context,selected,probes);
    }

    /** Reuse addresses, never old values. Invalid reads clear only that value and never try another FID. */
    public static Map<String,Reading> read(Selection selected,Getter getter,String confirmedHash) {
        if(selected==null||getter==null)throw new IllegalArgumentException("Missing read selection");
        LinkedHashMap<String,Reading> values=new LinkedHashMap<>();
        for(String field:FIELDS){
            Address address=selected.addresses.get(field);
            values.put(field,address==null?Reading.unavailable("unsupported"):
                canonical(selected.context,address,invoke(getter,address),matches(selected.hash,confirmedHash)?selected.hash:null));
        }
        return Collections.unmodifiableMap(values);
    }

    /** Restore only addresses still on this exact context's whitelist or named firmware catalog. */
    public static Selection restore(Context expected,Catalog catalog,String savedContextKey,Iterable<Address> saved) {
        if(expected==null||!expected.key().equals(savedContextKey)||saved==null)throw new IllegalArgumentException("Stale firmware selection");
        LinkedHashMap<String,Address> addresses=new LinkedHashMap<>();
        for(Address address:saved){
            if(address==null||addresses.containsKey(address.field))throw new IllegalArgumentException("Duplicate cached address");
            Address allowed=expected.mode==Mode.AUTO?automatic(expected,address.field):candidates(expected,catalog,address.field).get(address.key());
            if(!address.same(allowed))throw new IllegalArgumentException("Cached address outside whitelist");
            addresses.put(address.field,address);
        }
        // AUTO is a complete protocol whitelist. An older cache must not silently omit a new getter.
        if(expected.mode==Mode.AUTO)for(String field:FIELDS){
            Address required=automatic(expected,field);
            if(required!=null&&!required.same(addresses.get(field)))throw new IllegalArgumentException("Incomplete automatic getter cache");
        }
        return new Selection(expected,addresses,Collections.emptyMap());
    }
    public static String contextKey(Context context){return context.key();}

    private static Reading invoke(Getter getter,Address address){
        try {Reading value=getter.read(address);return value==null?Reading.unavailable("error"):value;}
        catch(SecurityException denied){return Reading.unavailable("denied");}
        catch(Exception error){return Reading.unavailable("error");}
    }
    private static Reading canonical(Context context,Address address,Reading reading,String confirmed) {
        if(!"available".equals(reading.status))return new Reading(reading.status,reading.raw);
        // REBACK is SDK command feedback; physical port-lock state is not verified on this firmware.
        if("port_lock".equals(address.field))return new Reading("unknown",reading.raw);
        if(!plausible(address.field,reading.raw))return new Reading("unknown",reading.raw);
        if("remaining_energy".equals(address.field))return new Reading("unknown",reading.raw);
        if(address.confidence()==Confidence.NEEDS_CONFIRMATION&&confirmed==null)return new Reading("unconfirmed",reading.raw);
        if("charging".equals(address.field)){
            int value=reading.raw.intValue();
            boolean known=context.mode==Mode.AUTO&&"CANFD".equals(context.protocol)?
                value==0||value==1||value==2||value==3||value==4||value==9||value==13:value==1;
            if(!known)return new Reading("unknown",reading.raw);
        }
        return new Reading("available",reading.raw);
    }
    private static boolean plausible(String field,Double value) {
        if(value==null||!Double.isFinite(value))return false;double n=value;
        if("soc".equals(field)||"remaining_energy".equals(field))
            return n>=0&&n<=("soc".equals(field)?100:300)&&(n==0||n>=0.001);
        if(n!=Math.rint(n))return false;
        if("range".equals(field))return n>=0&&n<=3000&&n!=1000&&n!=1023;
        if("charging".equals(field))return n>=0&&n<=255;
        if("cable".equals(field))return n>=1&&n<=5;
        if("ac_port".equals(field)||"dc_port".equals(field))return n==0||n==1;
        return false;
    }
    private static Address automatic(Context c,String field) {
        if("CANFD".equals(c.protocol))return new Address(field,transaction(field),defaultDevice(field),defaultFid(field),Origin.AUTO_CANFD);
        if(!"CAN".equals(c.protocol))return null;
        if("soc".equals(field))return new Address(field,7,1014,1033543720,Origin.AUTO_CAN);
        if("range".equals(field))return new Address(field,5,1014,1033203771,Origin.AUTO_CAN);
        if("charging".equals(field))return new Address(field,5,1009,876611608,Origin.AUTO_CAN);
        return null;
    }
    private static Map<String,Address> candidates(Context c,Catalog catalog,String field) {
        LinkedHashMap<String,Address> values=new LinkedHashMap<>();
        if(!legacy(field)||"remaining_energy".equals(field)&&"CAN".equals(c.protocol))return values;
        if(catalog!=null){Integer fid=catalog.fid(field);int device=catalog.device(field);
            if(fid!=null&&device>0)add(values,new Address(field,transaction(field),device,fid,Origin.FIRMWARE));}
        if(c.sdk<=29){
            if("soc".equals(field))add(values,new Address(field,7,1014,1033543720,Origin.CONTROLLER_13));
            if("charging".equals(field)){
                add(values,new Address(field,5,1009,1231032336,Origin.CONTROLLER_13));
                add(values,new Address(field,5,1009,876611608,Origin.CONTROLLER_13));
            }
        }
        add(values,new Address(field,transaction(field),defaultDevice(field),defaultFid(field),Origin.CANFD_FALLBACK));
        return values;
    }
    private static void add(Map<String,Address> values,Address address){
        for(Address old:values.values())if(old.transaction==address.transaction&&old.device==address.device&&old.fid==address.fid)return;
        values.put(address.key(),address);
    }
    private static boolean matches(String expected,String actual){return actual!=null&&MessageDigest.isEqual(expected.getBytes(StandardCharsets.US_ASCII),actual.getBytes(StandardCharsets.US_ASCII));}
    private static boolean known(String field){for(String value:FIELDS)if(value.equals(field))return true;return false;}
    private static boolean legacy(String field){for(String value:LEGACY_FIELDS)if(value.equals(field))return true;return false;}
    private static int transaction(String field){return "soc".equals(field)||"remaining_energy".equals(field)?7:5;}
    private static int defaultDevice(String field){return "soc".equals(field)||"range".equals(field)?1014:"remaining_energy".equals(field)?1005:1009;}
    private static int defaultFid(String field){
        switch(field){case "soc":return 1246777400;case "range":return 1246765118;case "cable":return 876609586;
            case "charging":return 876609560;case "ac_port":return 0x4fb00020;case "dc_port":return 0x4fb00018;
            case "remaining_energy":return 882901008;case "port_lock":return 0x4940000a;default:throw new IllegalArgumentException("Unknown getter field");}
    }
    private static String symbol(String field){switch(field){case "soc":return "Statistic.STATISTIC_ELEC_PERCENTAGE";
        case "range":return "Statistic.STATISTIC_ELEC_DRIVING_RANGE";case "charging":return "Charging.CHARGING_BATTERRY_DEVICE_STATE";
        case "remaining_energy":return "Power.POWER_BATTERY_REMAIN_ELECTRICITY";default:throw new IllegalArgumentException("Unknown firmware symbol");}}
    private static String deviceSymbol(String field){return "BYDAutoConstants.BYDAUTO_DEVICE_"+("soc".equals(field)||"range".equals(field)?"STATISTIC":"remaining_energy".equals(field)?"POWER":"CHARGING");}
    private static String sha256(String text){
        try{byte[] digest=MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8));StringBuilder hex=new StringBuilder();for(byte value:digest)hex.append(String.format(java.util.Locale.ROOT,"%02x",value&255));return hex.toString();}
        catch(java.security.NoSuchAlgorithmException impossible){throw new AssertionError(impossible);}
    }
}
