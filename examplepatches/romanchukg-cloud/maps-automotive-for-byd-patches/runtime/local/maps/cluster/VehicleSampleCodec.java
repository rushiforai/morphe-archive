// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import org.json.*;

/** Strict snapshots: firmware provenance is validated independently of sender display text. */
final class VehicleSampleCodec {
    static final int MAX_BYTES=16384;
    static final String[] FIELDS={"soc","range","cable","charging","ac_port","dc_port","remaining_energy"};
    static final String[] ALL_FIELDS={"soc","range","cable","charging","ac_port","dc_port","remaining_energy","port_lock"};
    private VehicleSampleCodec(){}
    static JSONObject object(String text)throws JSONException{
        if(text==null||text.getBytes(StandardCharsets.UTF_8).length>MAX_BYTES)throw new IllegalArgumentException("Invalid vehicle packet size");
        JSONTokener parser=new JSONTokener(text);Object value=parser.nextValue();
        if(!(value instanceof JSONObject)||parser.nextClean()!=0)throw new IllegalArgumentException("Invalid vehicle object");
        return (JSONObject)value;
    }
    static void keys(JSONObject object,String... expected)throws JSONException{
        if(object.length()!=expected.length)throw new IllegalArgumentException("Invalid vehicle fields");
        for(String key:expected)if(!object.has(key))throw new IllegalArgumentException("Missing vehicle field");
    }
    static String session(JSONObject object)throws JSONException{
        Object value=object.get("session");
        if(!(value instanceof String)||!((String)value).matches("[a-f0-9]{32}"))throw new IllegalArgumentException("Invalid reader session");
        return (String)value;
    }
    static long integer(JSONObject object,String key)throws JSONException{
        Object value=object.get(key);
        if(!(value instanceof Number))throw new IllegalArgumentException("Invalid vehicle number");
        if(value instanceof Long||value instanceof Integer||value instanceof Short||value instanceof Byte){
            long exact=((Number)value).longValue();if(exact<0)throw new IllegalArgumentException("Invalid vehicle number");return exact;
        }
        double number=((Number)value).doubleValue();long result=((Number)value).longValue();
        if(!Double.isFinite(number)||number<0||number>9007199254740991.0||number!=result)throw new IllegalArgumentException("Invalid vehicle number");
        return result;
    }
    static String digest(String text){
        try{byte[] bytes=MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8));StringBuilder out=new StringBuilder();for(byte b:bytes)out.append(String.format(Locale.US,"%02x",b&255));return out.toString();}
        catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }
    static JSONObject source(JSONObject input,String protocol)throws JSONException{
        keys(input,"firmware","mode","generation","selection","confidence","identity");
        String firmware=hash(input,"firmware"),selection=hash(input,"selection"),identity=hash(input,"identity");
        Object mode=input.get("mode"),confidence=input.get("confidence");long generation=integer(input,"generation");
        if(!(mode instanceof String)||!Arrays.asList("auto","legacy").contains(mode)||!(confidence instanceof String)||!Arrays.asList("documented","firmware","confirmed","candidate","unsupported").contains(confidence))throw new IllegalArgumentException("Invalid vehicle provenance");
        String expected=digest(firmware+"\n"+protocol+"\n"+mode+"\n"+generation+"\n"+selection);
        if(!expected.equals(identity))throw new IllegalArgumentException("Vehicle provenance does not match source identity");
        return new JSONObject().put("firmware",firmware).put("mode",mode).put("generation",generation).put("selection",selection).put("confidence",confidence).put("identity",identity);
    }
    private static String hash(JSONObject object,String key)throws JSONException{
        Object value=object.get(key);if(!(value instanceof String)||!((String)value).matches("[a-f0-9]{64}"))throw new IllegalArgumentException("Invalid vehicle source hash");return (String)value;
    }
    static String identity(JSONObject packet)throws JSONException{
        return packet.getInt("schema")==1?digest("schema1\nCANFD"):packet.getJSONObject("source").getString("identity");
    }
    static JSONObject sample(String text)throws JSONException{
        JSONObject input=object(text);long schema=integer(input,"schema");
        if(schema==1)keys(input,"schema","session","uid","protocol","captured_elapsed_ms","values");
        else if(schema==2)keys(input,"schema","session","uid","protocol","captured_elapsed_ms","source","values");
        else throw new IllegalArgumentException("Invalid vehicle schema");
        Object protocol=input.get("protocol");
        if(integer(input,"uid")!=2000||!(protocol instanceof String)||!(schema==1?"CANFD".equals(protocol):Arrays.asList("CANFD","CAN","UNKNOWN").contains(protocol)))throw new IllegalArgumentException("Invalid vehicle source");
        JSONObject source=schema==2?source(input.getJSONObject("source"),(String)protocol):null;
        String session=session(input);long captured=integer(input,"captured_elapsed_ms");
        JSONObject values=input.getJSONObject("values");
        String[] fields=schema==2&&values.has("port_lock")?ALL_FIELDS:FIELDS;
        keys(values,fields);
        JSONObject clean=new JSONObject();
        for(String field:fields){
            JSONObject row=values.getJSONObject(field);Object status=row.get("status");
            List<String> statuses=schema==1?Arrays.asList("available","unknown","denied","unsupported","error"):Arrays.asList("available","unknown","denied","unsupported","error","unconfirmed");
            if(!(status instanceof String)||!statuses.contains(status))throw new IllegalArgumentException("Invalid reading status");
            if(row.length()!=1+(row.has("raw")?1:0))throw new IllegalArgumentException("Unexpected reading field");
            Double raw=null;
            if(row.has("raw")){
                Object value=row.get("raw");if(!(value instanceof Number))throw new IllegalArgumentException("Invalid reading number");
                double number=((Number)value).doubleValue();if(!Double.isFinite(number))throw new IllegalArgumentException("Invalid reading number");raw=number;
            }
            if("available".equals(status)&&raw==null)throw new IllegalArgumentException("Missing reading number");
            String canonical="available".equals(status)&&(raw==null||!valid(field,raw))?"unknown":(String)status;
            if(schema==2){
                String confidence=source.getString("confidence");boolean battery="soc".equals(field)||"range".equals(field);
                // Tiny positive floats can be integer-result bits decoded through the wrong getter.
                if("soc".equals(field)&&raw!=null&&raw>0&&raw<0.001&&"available".equals(canonical))canonical="unknown";
                if("CAN".equals(protocol)&&Arrays.asList("remaining_energy","cable","ac_port","dc_port").contains(field)){canonical="unsupported";raw=null;}
                if("port_lock".equals(field)){
                    if(!"CANFD".equals(protocol)||!"auto".equals(source.getString("mode"))){canonical="unsupported";raw=null;}
                    else if("available".equals(status)||"unconfirmed".equals(status))canonical="unknown";
                    if(Arrays.asList("unsupported","denied","error").contains(canonical))raw=null;
                }
                if("charging".equals(field)&&("CAN".equals(protocol)||"legacy".equals(source.getString("mode")))&&"available".equals(status))canonical=raw!=null&&raw==1?"available":"unknown";
                if(battery&&"available".equals(canonical)&&"candidate".equals(confidence))canonical="unconfirmed";
                if(battery&&("unsupported".equals(confidence)||"UNKNOWN".equals(protocol)&&!"legacy".equals(source.getString("mode")))){canonical="unsupported";raw=null;}
            }
            JSONObject normalized=new JSONObject().put("status",canonical);
            if(raw!=null)normalized.put("raw",raw);
            clean.put(field,normalized);
        }
        JSONObject result=new JSONObject().put("schema",schema).put("session",session).put("uid",2000).put("protocol",protocol).put("captured_elapsed_ms",captured);
        if(source!=null)result.put("source",source);
        return result.put("values",clean);
    }
    private static boolean valid(String field,double n){
        if("soc".equals(field))return VehicleReadingRules.percent(n);
        if("range".equals(field))return VehicleReadingRules.range(n);
        if(n!=Math.rint(n)||n<Integer.MIN_VALUE||n>Integer.MAX_VALUE)return false;
        if("cable".equals(field))return !"Unknown".equals(VehicleReadingRules.cable((int)n));
        if("charging".equals(field))return !"Unknown".equals(VehicleReadingRules.charging((int)n));
        if("ac_port".equals(field)||"dc_port".equals(field))return !"Unknown".equals(VehicleReadingRules.port((int)n));
        return false;
    }
}
