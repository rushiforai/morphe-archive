// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.os.Build;
import java.io.PrintStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

/** Shell-only diagnostic of named firmware constants. Never opens autoservice or calls a getter. */
public final class VehicleChargingCatalog {
    private static final String FEATURES="android.hardware.bydauto.BYDAutoFeatureIds";
    private static final String CONSTANTS="android.hardware.bydauto.BYDAutoConstants";
    private static final int MAX_DEPTH=4,MAX_CLASSES=64,MAX_FIELDS=4096,MAX_ROWS=128,MAX_ERRORS=16;
    private static final int MAX_ROW_BYTES=48000,MAX_OUTPUT_BYTES=65536;
    private static final String[] MATCHES={"CAP","GUN","PORT","LOCK","COVER","LID"};
    private VehicleChargingCatalog(){}

    public static void main(String[] args){int status=run(args,System.out);if(status!=0)System.exit(status);}

    static int run(String[] args,PrintStream output){
        // Check before loading firmware classes, fingerprint or properties.
        if(android.os.Process.myUid()!=2000){output.println("{\"schema\":1,\"status\":\"denied\",\"error\":\"SecurityException\"}");return 2;}
        if(args==null||!(args.length==0||args.length==1&&"--catalog".equals(args[0]))){
            output.println("{\"schema\":1,\"status\":\"invalid_arguments\",\"error\":\"IllegalArgumentException\"}");return 2;
        }
        Report report=new Report();
        String ro=property("ro.car.protocol",report),sys=property("sys.car.protocol",report);
        String raw=ro.trim().isEmpty()?sys.trim():ro.trim();
        String protocol="CAN".equals(raw)||"CANFD".equals(raw)?raw:"UNKNOWN";
        String firmware=digest(Build.FINGERPRINT==null?"unknown-firmware":Build.FINGERPRINT);
        int api=Build.VERSION.SDK_INT; if(api<1||api>100)api=0;
        ClassLoader loader=VehicleChargingCatalog.class.getClassLoader();
        // Reserve catalog space for device mappings before a large feature tree can exhaust limits.
        try{report.devices(Class.forName(CONSTANTS,false,loader));}
        catch(ReflectiveOperationException|LinkageError|RuntimeException error){report.error(CONSTANTS,error);}
        try{report.features(Class.forName(FEATURES,false,loader),0);}
        catch(ReflectiveOperationException|LinkageError|RuntimeException error){report.error(FEATURES,error);}
        report.flushFeatures();
        String text="{\"schema\":1,\"kind\":\"firmware_static_int_catalog\",\"status\":\""+(report.errors.isEmpty()&&!report.truncated?"complete":"partial")+
            "\",\"uid\":2000,\"api\":"+api+",\"protocol\":"+quote(protocol)+",\"firmware_sha256\":"+quote(firmware)+
            ",\"interpretation\":\"Symbols only; no getter addresses or state meanings are verified\",\"fields\":["+join(report.fields)+
            "],\"devices\":["+join(report.devices)+"],\"errors\":["+join(report.errors)+"],\"limits\":{\"max_depth\":"+MAX_DEPTH+
            ",\"max_classes\":"+MAX_CLASSES+",\"max_fields\":"+MAX_FIELDS+",\"max_rows\":"+MAX_ROWS+
            ",\"max_output_bytes\":"+MAX_OUTPUT_BYTES+"},\"visited_classes\":"+report.classes+",\"examined_fields\":"+report.examined+
            ",\"truncated\":"+report.truncated+"}";
        // Names and scalar data are ASCII; enforce the byte limit as a final independent guard.
        if(text.getBytes(StandardCharsets.UTF_8).length+1>MAX_OUTPUT_BYTES){
            output.println("{\"schema\":1,\"status\":\"bounded_output_rejected\",\"error\":\"IllegalStateException\"}");return 3;
        }
        output.print(text+"\n");return 0;
    }

    private static final class Report {
        final List<String> fields=new ArrayList<>(),devices=new ArrayList<>(),errors=new ArrayList<>();
        final List<Field> candidates=new ArrayList<>();
        int classes,examined,rowBytes;boolean truncated;
        void features(Class<?> type,int depth){
            if(depth>MAX_DEPTH||classes>=MAX_CLASSES){truncated=true;return;}
            String owner=type.getName();
            if(!(owner.equals(FEATURES)||owner.startsWith(FEATURES+"$"))||!safe(owner,256))return;
            classes++;scan(type,false);
            if(depth==MAX_DEPTH){
                try{if(type.getDeclaredClasses().length>0)truncated=true;}
                catch(LinkageError|RuntimeException error){error(owner,error);}return;
            }
            try{
                Class<?>[] children=type.getDeclaredClasses();Arrays.sort(children,Comparator.comparingInt((Class<?> child)->priority(child.getSimpleName())).thenComparing(Class::getName));
                for(Class<?> child:children){if(classes>=MAX_CLASSES){truncated=true;break;}features(child,depth+1);}
            }catch(LinkageError|RuntimeException error){error(owner,error);}
        }
        void devices(Class<?> type){scan(type,true);}
        void scan(Class<?> type,boolean device){
            String owner=type.getName();
            if(!safe(owner,256))return;
            try{
                Field[] members=type.getDeclaredFields();Arrays.sort(members,Comparator.comparingInt((Field member)->priority(member.getName())).thenComparing(Field::getName));
                for(Field field:members){
                    if(examined>=MAX_FIELDS){truncated=true;break;}examined++;
                    String name=field.getName();if(!safe(name,128))continue;
                    String upper=name.toUpperCase(Locale.ROOT);
                    if(device?!(upper.contains("DEVICE")&&relevantDevice(upper)):!matches(upper))continue;
                    int flags=field.getModifiers();if(field.getType()!=int.class||!Modifier.isStatic(flags))continue;
                    if(!device){candidates.add(field);continue;}
                    if(fields.size()+devices.size()>=MAX_ROWS){truncated=true;break;}
                    if(!emit(field,true))break;
                }
            }catch(LinkageError|RuntimeException error){error(owner,error);}
        }
        void flushFeatures(){
            candidates.sort(Comparator.comparingInt((Field member)->priority(member.getName())).thenComparing(member->member.getDeclaringClass().getName()).thenComparing(Field::getName));
            for(Field field:candidates){if(fields.size()+devices.size()>=MAX_ROWS){truncated=true;break;}if(!emit(field,false))break;}
        }
        boolean emit(Field field,boolean device){
            String owner=field.getDeclaringClass().getName(),name=field.getName(),upper=name.toUpperCase(Locale.ROOT);
            try{
                if(!field.isAccessible())field.setAccessible(true);
                int value=field.getInt(null);boolean isFinal=Modifier.isFinal(field.getModifiers());
                String classification=device?"device_mapping_unverified":upper.contains("CAPACITY")?"ambiguous_capacity_match":"unverified_symbol";
                String row="{\"owner\":"+quote(owner)+",\"name\":"+quote(name)+",\"value\":"+value+
                    ",\"hex\":"+quote(String.format(Locale.ROOT,"0x%08x",value))+",\"final\":"+isFinal+
                    ",\"provenance\":"+quote(isFinal?"firmware-static-final-int":"firmware-static-mutable-int")+",\"classification\":"+quote(classification)+"}";
                if(rowBytes+row.length()>MAX_ROW_BYTES){truncated=true;return false;}rowBytes+=row.length();
                (device?devices:fields).add(row);return true;
            }catch(ReflectiveOperationException|LinkageError|RuntimeException error){error(owner,error);return true;}
        }
        void error(String owner,Throwable error){
            if(errors.size()>=MAX_ERRORS){truncated=true;return;}
            // Never serialize error messages, causes, stack traces or firmware property values.
            String name=error.getClass().getSimpleName();if(!safe(name,128))name="Exception";
            errors.add("{\"owner\":"+quote(owner)+",\"class\":"+quote(name)+"}");
        }
    }
    private static boolean matches(String name){for(String match:MATCHES)if(name.contains(match))return true;return false;}
    private static int priority(String name){String upper=name.toUpperCase(Locale.ROOT);return upper.contains("CHARGING")?0:upper.contains("CHARGE")?1:upper.contains("GUN")||upper.contains("CAP")?2:3;}
    private static boolean relevantDevice(String name){return matches(name)||name.contains("BODY")||name.contains("CHARG")||name.contains("BATTERY")||name.contains("ENERGY")||name.contains("POWER")||name.contains("STATISTIC");}
    private static boolean safe(String value,int max){return value!=null&&value.length()<=max&&value.matches("[A-Za-z_$][A-Za-z0-9_.$]*");}
    private static String property(String name,Report report){
        try{String value=(String)Class.forName("android.os.SystemProperties").getMethod("get",String.class).invoke(null,name);return value==null?"":value;}
        catch(ReflectiveOperationException|LinkageError|RuntimeException error){report.error("android.os.SystemProperties",error);return "";}
    }
    private static String digest(String value){
        try{byte[] hash=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));StringBuilder out=new StringBuilder();
            for(byte b:hash)out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();}
        catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException();}
    }
    private static String quote(String value){return "\""+value.replace("\\","\\\\").replace("\"","\\\"")+"\"";}
    private static String join(List<String> rows){StringBuilder out=new StringBuilder();for(String row:rows){if(out.length()>0)out.append(',');out.append(row);}return out.toString();}
}
