package nl.johninnl.navigation.alerts;

import android.os.Bundle;
import java.util.Map;

/** Versioned visual vocabulary. Native identity, category, priority and speech authority remain independent. */
public final class IndicatorContract {
    public static final int VERSION=1;
    private IndicatorContract(){}
    public enum Kind {
        SPEED_TRAP("speed_trap"),SPEED_CAMERA("speed_camera"),AVERAGE_SPEED("average_speed"),SPEED_TRAP_HOTSPOT("speed_trap_hotspot"),
        TRAFFIC_JAM("traffic_jam"),ROADWORKS("roadworks"),INCIDENT("incident"),POOR_ROAD("poor_road"),EMERGENCY("emergency"),
        WRONG_WAY("wrong_way"),LEVEL_CROSSING("level_crossing"),ANIMALS("animals"),BRIDGE("bridge"),MATRIX("matrix"),
        TRAFFIC_CAMERA("traffic_camera"),MAXIMUM_SPEED("maximum_speed_unknown"),BORDER_CROSSING("border_nl"),SPEED_130("speed_limit_130"),TRAFFIC_LIGHT("traffic_light");
        public final String icon;
        Kind(String icon){this.icon=icon;}
    }
    public static Kind kind(WarningEvent event){return classify(event.nativeType,event.nativeSubtype,event.category,event.fields());}
    public static String icon(WarningEvent event){Kind kind=kind(event);return kind==Kind.BORDER_CROSSING&&!"NL".equals(event.fields().get("country_code"))?Kind.INCIDENT.icon:kind.icon;}
    /** Nonspatial values must not be formatted as a fictitious distance. */
    public static String valueText(WarningEvent event,boolean imperial){
        if(event.category.equals("maximum_speed")){
            Object raw=event.fields().get("road_speed_limit_kmh");
            if(raw instanceof Number){double value=((Number)raw).doubleValue();if(Double.isFinite(value)&&value>0&&value<=500)return Math.round(imperial?value/1.609344:value)+(imperial?" mph":" km/h");}
        }
        return null;
    }
    public static void annotate(Bundle fields){
        if("CLEAR".equals(fields.getString("operation")))return;
        java.util.Map<String,Object> values=new java.util.HashMap<>();for(String key:fields.keySet())values.put(key,fields.get(key));
        Kind kind=classify(fields.getString("native_type",""),fields.getString("native_subtype",""),fields.getString("category",""),values);
        fields.putInt("indicator_contract_version",VERSION);fields.putString("indicator_kind",kind.name());
    }
    private static Kind classify(String type,String sub,String category,Map<String,Object> fields){
        if(category.equals("border_crossing"))return Kind.BORDER_CROSSING;
        // A posted limit and the separate native Hop-hop notice retain different native types.
        if(type.equals("HOP_HOP_GAS_EROP"))return Kind.SPEED_130;
        if(category.equals("maximum_speed")){
            Object limit=fields.get("road_speed_limit_kmh");
            if(limit==null)return Kind.MAXIMUM_SPEED;
            if(limit instanceof Number&&((Number)limit).doubleValue()==130)return Kind.SPEED_130;
            return Kind.MAXIMUM_SPEED;
        }
        if(type.equals("AVG_SPEED_CHECK")||type.equals("AVERAGE_SPEED_CAMERA")||type.equals("AVERAGE_SPEED_WARNING")
                ||type.equals("CAMERA")&&Boolean.TRUE.equals(fields.get("native_segment_correlated"))&&"AVERAGE_SPEED_CAMERA".equals(fields.get("native_segment_type")))return Kind.AVERAGE_SPEED;
        if(type.equals("POLICEHOTSPOT")||type.equals("POLICE_HOTSPOT"))return Kind.SPEED_TRAP_HOTSPOT;
        // Owner decision (11 Nov 2026): every police control, FM "controle" or Waze visible/hidden police, uses the
        // speed-trap artwork so both providers look the same; FM hotspots above keep their own icon.
        if(type.equals("SPEED_TRAP")||sub.equals("POLICE_TYPE_MOBILE_CAMERA")||type.equals("POLICE")||category.equals("police_control"))return Kind.SPEED_TRAP;
        if(sub.equals("TRAFFIC_CAMERA"))return Kind.TRAFFIC_CAMERA;
        if(type.equals("SPEED_CAM")||type.equals("CAMERA"))return Kind.SPEED_CAMERA;
        if(sub.equals("WRONG_WAY_DRIVER"))return Kind.WRONG_WAY;
        if(sub.equals("BRIDGE_OPEN")||sub.equals("BRIDGE_CLOSED")||type.equals("CITS_BRIDE_CLOSED"))return Kind.BRIDGE;
        if(sub.contains("RAILWAY_CROSSING"))return Kind.LEVEL_CROSSING;
        if(sub.equals("ANIMAL_ON_ROAD")||sub.equals("WILD_ANIMALS_ON_THE_ROAD")||sub.equals("ELKS_ON_THE_ROAD")
                ||sub.equals("REINDEER_ON_THE_ROAD")||sub.equals("REINDEER_NEAR_THE_ROAD")||type.equals("ANIMAL")||sub.equals("HAZARD_TYPE_ON_SHOULDER_ANIMALS"))return Kind.ANIMALS;
        if(category.equals("emergency_vehicle")||sub.equals("HAZARD_TYPE_EMERGENCY_VEHICLE"))return Kind.EMERGENCY;
        if(category.equals("roadworks")||type.equals("CONSTRUCTION")||sub.equals("ROADWORKS")||sub.equals("HAZARD_TYPE_ON_ROAD_CONSTRUCTION"))return Kind.ROADWORKS;
        if(category.equals("traffic")||type.equals("TRAFFIC_JAM"))return Kind.TRAFFIC_JAM;
        if(sub.equals("BUMPY_ROAD")||sub.equals("SLIPPERY_ROAD")||sub.equals("ICE_ON_THE_ROAD")||sub.equals("SNOW_ON_THE_ROAD")
                ||sub.equals("HAZARD_TYPE_ON_ROAD_POT_HOLE")||sub.equals("HAZARD_TYPE_ON_ROAD_OIL")||sub.equals("BAD_WEATHER_TYPE_SLIPPERY_ROAD")||sub.equals("BAD_WEATHER_TYPE_ON_ROAD_ICE"))return Kind.POOR_ROAD;
        if(type.equals("CITS_LANE_CLOSED")||type.equals("BLOCKED_LANE")||sub.equals("HAZARD_TYPE_ON_ROAD_LANE_CLOSED"))return Kind.MATRIX;
        if("vri_state".equals(fields.get("capture_path"))&&Boolean.TRUE.equals(fields.get("native_is_traffic_light")))return Kind.TRAFFIC_LIGHT;
        return Kind.INCIDENT;
    }
}
