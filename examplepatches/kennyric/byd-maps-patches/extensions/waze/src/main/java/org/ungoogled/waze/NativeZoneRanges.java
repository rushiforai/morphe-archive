package org.ungoogled.waze;

import android.os.Bundle;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Exact native road-node geometry, correlated by Waze's own segment identity. */
final class NativeZoneRanges {
    private NativeZoneRanges() {}
    static final class Range {
        final long startLongitude, startLatitude, endLongitude, endLatitude;
        final int boundaries;
        Range(long a,long b,long c,long d,int flags) { startLongitude=a;startLatitude=b;endLongitude=c;endLatitude=d;boundaries=flags; }
    }
    static Map<String,Range> decode(long[] values) {
        if(values==null||values.length<1||(values.length-1)%7!=0||values.length>1+128*7||values[0]<0||values[0]==0&&values.length>1)
            return Collections.emptyMap();
        Map<String,Range> result=new LinkedHashMap<>();
        for(int i=1;i<values.length;i+=7){
            long tile=values[i],line=values[i+1];
            if(tile<Integer.MIN_VALUE||tile>Integer.MAX_VALUE||line<Integer.MIN_VALUE||line>Integer.MAX_VALUE
                    ||!valid(values[i+2],values[i+3])||!valid(values[i+4],values[i+5])||values[i+6]<0||values[i+6]>3)return Collections.emptyMap();
            String key=WazeWarningModels.hash("AVERAGE_SPEED_CAMERA:"+tile+"-"+line);
            if(result.put(key,new Range(values[i+2],values[i+3],values[i+4],values[i+5],(int)values[i+6]))!=null)
                return Collections.emptyMap();
        }
        return Collections.unmodifiableMap(result);
    }
    private static boolean valid(long longitude,long latitude) {
        return longitude>=-180000000&&longitude<=180000000&&latitude>=-90000000&&latitude<=90000000
            &&(longitude!=0||latitude!=0);
    }
    static boolean owns(Bundle fields) { return "native_route_line".equals(fields.getString("position_clock_origin")); }
    static void remove(Bundle fields) {
        if(!owns(fields))return;
        for(String key:new String[]{"latitude","longitude","zone_point","native_point_target","position_estimated",
                "position_clock_origin","position_observed_elapsed_ms"})fields.remove(key);
    }
    static void apply(Bundle fields,Map<String,Range> ranges,long now) {
        boolean correlated=fields.getBoolean("native_segment_correlated");
        String type=fields.getString(correlated?"native_segment_type":"native_type");
        if(!"AVERAGE_SPEED_CAMERA".equals(type)||"exit".equals(fields.getString("phase")))return;
        Range range=ranges.get(fields.getString("native_segment_key"));if(range==null)return;
        String phase=fields.getString("native_segment_phase"),state=fields.getString("native_zone_state");
        boolean start=(range.boundaries&1)!=0&&"APPROACHING".equals(phase)&&(state==null||"BeforeZone".equals(state));
        boolean end=(range.boundaries&2)!=0&&"WITHIN".equals(phase)&&(state==null||"InZone".equals(state));
        if(!start&&!end)return;
        fields.putDouble("longitude",(start?range.startLongitude:range.endLongitude)/1e6);
        fields.putDouble("latitude",(start?range.startLatitude:range.endLatitude)/1e6);
        fields.putString("relevance","zone");fields.putString("zone_point",start?"start":"end");
        fields.putBoolean("native_point_target",true);fields.putBoolean("position_estimated",false);
        fields.putString("position_clock_origin","native_route_line");fields.putLong("position_observed_elapsed_ms",now);
    }
}
