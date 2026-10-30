// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.util.Locale;
import org.json.JSONObject;

/** Pure diagnostic presentation. Unconfirmed or unverified data is never labelled native EV data. */
final class VehicleDataText {
    private VehicleDataText(){}
    static String stale(){return "Readings are stale\n\nBattery: Unavailable\nElectric range: Unavailable\nCable: Unavailable\nCharging: Unavailable\nAC cover: Unavailable\nDC cover: Unavailable\nPort lock feedback: Unavailable\nRemaining energy: Unavailable\n\nSamples are taken once per minute. Values expire after 90 seconds.";}
    static String format(JSONObject status,String fallbackMode){
        String state=status.optString("reader_state"),protocol=status.optString("protocol","UNKNOWN");boolean fresh=status.optBoolean("fresh",false);
        JSONObject source=status.optJSONObject("source");String mode=source==null?fallbackMode:source.optString("mode",fallbackMode),confidence=source==null?"":source.optString("confidence","");
        String heading="FRESH".equals(state)?"ADB reader connected":"STALE".equals(state)?"Readings are stale":"WAITING".equals(state)?"Waiting for vehicle readings":"EXPIRED".equals(state)?"Reader session expired; automatic reader will retry":"RESTART_REQUIRED".equals(state)?"Waiting for the reader after restart":"BOOT_UNAVAILABLE".equals(state)?"Cannot verify this head unit restart":"STOPPED".equals(state)?"ADB reader stopped":"DISABLED".equals(state)?"BYD vehicle data is off":"Reader not started; enable Automatic reader or connect through ADB";
        JSONObject values=fresh?status.optJSONObject("values"):null;
        String text=heading+"\nProtocol: "+("CAN".equals(protocol)||"CANFD".equals(protocol)?protocol:"Unknown")+"\nReader mode: "+("legacy".equals(mode)?"Firmware detection (advanced)":"Automatic CAN/CANFD");
        if("candidate".equals(confidence))text+="\nUnconfirmed source: compare charge and range with the instrument cluster before confirming.";
        else if("confirmed".equals(confidence))text+="\nSource: confirmed by the owner";
        else if("firmware".equals(confidence))text+="\nSource: firmware-defined addresses";
        else if("documented".equals(confidence))text+="\nSource: documented CAN/CANFD addresses";
        else if("unsupported".equals(confidence))text+="\nSource: unsupported; no battery prediction is sent to Maps";
        if("UNKNOWN".equals(protocol)&&!"legacy".equals(mode))text+="\nAutomatic reading is unsupported when the CAN protocol is unknown.";
        text+="\n\nBattery: "+display(values,"soc",protocol,mode)+"\nElectric range: "+display(values,"range",protocol,mode)
            +"\nCable: "+display(values,"cable",protocol,mode)+"\nCharging: "+display(values,"charging",protocol,mode)
            +"\nAC cover: "+display(values,"ac_port",protocol,mode)+"\nDC cover: "+display(values,"dc_port",protocol,mode)
            +"\nPort lock feedback: "+display(values,"port_lock",protocol,mode)
            +"\nRemaining energy: "+display(values,"remaining_energy",protocol,mode);
        if(fresh)text+="\n\nSample age: "+String.format(Locale.US,"%.1f s",status.optLong("sample_age_ms",0)/1000.0);
        return text;
    }
    static boolean confirmable(JSONObject status,JSONObject config){
        JSONObject source=status.optJSONObject("source"),values=status.optJSONObject("values");
        if(source==null||values==null||!"legacy".equals(config.optString("mode"))||!"legacy".equals(source.optString("mode"))||!"candidate".equals(source.optString("confidence"))||source.optLong("generation",-1)<0||source.optLong("generation",-1)!=config.optLong("generation",-2)||!status.optBoolean("fresh",false)||!source.optString("selection","").matches("[a-f0-9]{64}"))return false;
        JSONObject soc=values.optJSONObject("soc"),range=values.optJSONObject("range");
        return soc!=null&&range!=null&&"unconfirmed".equals(soc.optString("status"))&&"unconfirmed".equals(range.optString("status"))&&VehicleReadingRules.percent(soc.optDouble("raw",Double.NaN))&&VehicleReadingRules.range(range.optDouble("raw",Double.NaN));
    }
    static String candidate(JSONObject status){JSONObject values=status.optJSONObject("values");return "Battery: "+display(values,"soc",status.optString("protocol"),"legacy")+"\nElectric range: "+display(values,"range",status.optString("protocol"),"legacy");}
    static String display(JSONObject values,String key,String protocol,String mode){
        JSONObject row=values==null?null:values.optJSONObject(key);if(row==null)return "Unavailable";
        String status=row.optString("status");double raw=row.optDouble("raw",Double.NaN);
        if("CAN".equals(protocol)&&("cable".equals(key)||"ac_port".equals(key)||"dc_port".equals(key)||"remaining_energy".equals(key)||"port_lock".equals(key)))return "Unsupported";
        if("port_lock".equals(key)&&(!"CANFD".equals(protocol)||!"auto".equals(mode)))return "Unsupported";
        if("unsupported".equals(status))return "Unsupported";
        if("denied".equals(status))return "Access denied by BYD";
        if("error".equals(status))return "Read error";
        if("ac_port".equals(key)||"dc_port".equals(key)){
            if(raw==0||raw==1)return "Unverified (code "+(int)raw+")";
            return unknownRaw(raw);
        }
        if("port_lock".equals(key)){
            if(raw==Math.rint(raw)&&raw>=1&&raw<=4){
                String[] feedback={"Lock completed","Invalid lock feedback","Unlock completed","Invalid unlock feedback"};
                return feedback[(int)raw-1]+" (code "+(int)raw+", unverified)";
            }
            return unknownRaw(raw);
        }
        if("remaining_energy".equals(key))return Double.isFinite(raw)?String.format(Locale.US,"%.3f raw (unit unverified)",raw):"Unknown (unit unverified)";
        boolean candidate="unconfirmed".equals(status);
        if(!"available".equals(status)&&!candidate)return "error".equals(status)?"Read error":"Unknown";
        if("soc".equals(key))return VehicleReadingRules.percent(raw)?String.format(Locale.US,"%.1f %%",raw)+(candidate?" — Unconfirmed":""):"Unknown";
        if("range".equals(key))return VehicleReadingRules.range(raw)?String.format(Locale.US,"%.0f km",raw)+(candidate?" — Unconfirmed":""):"Unknown";
        if(candidate||!Double.isFinite(raw)||raw!=Math.rint(raw)||raw<Integer.MIN_VALUE||raw>Integer.MAX_VALUE)return "Unknown";
        if("charging".equals(key)&&("CAN".equals(protocol)||"legacy".equals(mode)))return raw==1?"Charging":"Unknown";
        return "cable".equals(key)?VehicleReadingRules.cable((int)raw):"charging".equals(key)?VehicleReadingRules.charging((int)raw):VehicleReadingRules.port((int)raw);
    }
    private static String unknownRaw(double raw){return Double.isFinite(raw)?"Unknown (raw "+String.format(Locale.US,raw==Math.rint(raw)?"%.0f":"%.3f",raw)+")":"Unknown";}
}
