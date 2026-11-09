package nl.johninnl.navigation.alerts;

import android.content.SharedPreferences;
import java.util.Locale;

/** Explicit migration: absent legacy preferences are not an intentional mute or Police-only choice. */
public final class WarningPreferences {
    public static final int CAMERA=1,ZONE=2,ROAD_DANGER=4,EMERGENCY=8,TRAFFIC=16,POLICE=32,OTHER=64;
    public static final int RECOMMENDED=CAMERA|ZONE|ROAD_DANGER|EMERGENCY|POLICE,ALL=127;
    public static final int[] CATEGORIES={CAMERA,ZONE,ROAD_DANGER,EMERGENCY,TRAFFIC,POLICE,OTHER};
    public static final String[] LABELS={"Speed cameras and mobile controls","Average-speed zones","Road danger","Emergency vehicles","Traffic and advice","Police controls","Other native warnings"};
    public static final String[] LABELS_NL={"Flitspalen en mobiele controles","Trajectcontroles","Gevaar op de weg","Hulpdiensten","Verkeer en advies","Politiecontroles","Overige bronwaarschuwingen"};
    private static final String FM_PREFIX="morphe_native_warnings_";
    private final String PREFIX;
    private final SharedPreferences prefs;
    public WarningPreferences(SharedPreferences prefs,boolean maps){this(prefs,maps,WarningProviders.FLITSMEISTER);}
    public WarningPreferences(SharedPreferences prefs,boolean maps,String provider){
        if(!WarningProviders.supported(provider))throw new IllegalArgumentException("UNSUPPORTED_WARNING_PROVIDER");
        this.prefs=prefs;
        PREFIX=WarningProviders.WAZE.equals(provider)?"morphe_native_warnings_waze_":FM_PREFIX;
        if(prefs.getBoolean(PREFIX+"initialized",false))return;
        WarningAudioOwner.Mode mode=WarningAudioOwner.Mode.VOICE;int categories=RECOMMENDED;
        String origin="recommended";SharedPreferences.Editor edit=prefs.edit();
        if(maps){
            if(prefs.contains("waze_alerts_chime")){mode=prefs.getBoolean("waze_alerts_chime",true)?WarningAudioOwner.Mode.TONE:WarningAudioOwner.Mode.SILENT;origin="legacy_explicit_output";}
            if(prefs.contains("waze_alerts_kinds")){
                int legacy=prefs.getInt("waze_alerts_kinds",1);categories=legacyCategories(legacy);
                edit.putInt(PREFIX+"legacy_types",legacy);origin+="+legacy_explicit_types";
            }
        }else if(prefs.contains("morphe_telemetry_spoken")){
            mode=prefs.getBoolean("morphe_telemetry_spoken",false)?WarningAudioOwner.Mode.VOICE:WarningAudioOwner.Mode.SILENT;origin="legacy_explicit_output";
        }else if(prefs.contains("speed_cam_warn")){
            mode=prefs.getBoolean("speed_cam_warn",false)?WarningAudioOwner.Mode.VOICE:WarningAudioOwner.Mode.SILENT;origin="native_explicit_output";
        }
        edit.putString(PREFIX+"mode",mode.name()).putInt(PREFIX+"categories",categories).putString(PREFIX+"origin",origin)
                .putInt(PREFIX+"review",0).putBoolean(PREFIX+"initialized",true).apply();
    }
    public boolean reviewed(){return prefs.getInt(PREFIX+"review",0)>=1;}
    public void confirm(){prefs.edit().putInt(PREFIX+"review",1).apply();}
    public String origin(){return prefs.getString(PREFIX+"origin","");}
    public WarningAudioOwner.Mode mode(){try{return WarningAudioOwner.Mode.valueOf(prefs.getString(PREFIX+"mode","SILENT"));}catch(RuntimeException invalid){return WarningAudioOwner.Mode.SILENT;}}
    public void mode(WarningAudioOwner.Mode value){prefs.edit().putString(PREFIX+"mode",value.name()).apply();}
    public int categories(){return prefs.getInt(PREFIX+"categories",RECOMMENDED)&ALL;}
    public void categories(int value){prefs.edit().putInt(PREFIX+"categories",value&ALL).remove(PREFIX+"legacy_types").apply();}
    public void category(int value,boolean enabled){
        int mask=categories();prefs.edit().putInt(PREFIX+"categories",enabled?mask|value:mask&~value)
                .putInt(PREFIX+"edited_categories",prefs.getInt(PREFIX+"edited_categories",0)|value).apply();
    }
    public boolean enabled(WarningEvent event){
        int category=categoryOf(event);
        if((categories()&category)==0)return false;
        if(prefs.contains(PREFIX+"legacy_types") && (prefs.getInt(PREFIX+"edited_categories",0)&category)==0)
            return (prefs.getInt(PREFIX+"legacy_types",0)&(1<<legacyKind(event)))!=0;
        return true;
    }
    public String summary(boolean nl){
        String output=mode()==WarningAudioOwner.Mode.VOICE?(nl?"Spraak":"Voice"):mode()==WarningAudioOwner.Mode.TONE?(nl?"Toon":"Tone"):(nl?"Stil":"Silent");
        return (reviewed()?"":(nl?"Keuzes controleren · ":"Review choices · "))+output;
    }
    public static int categoryOf(WarningEvent e){
        // Waze's emergency-vehicle hazard is a point report, not a moving responder.
        if(e.nativeType.equals("HAZARD")&&(e.nativeSubtype.equals("HAZARD_TYPE_EMERGENCY_VEHICLE")||e.nativeSubtype.equals("HAZARD_SUB_TYPE_EMERGENCY_VEHICLE")))return ROAD_DANGER;
        if(e.category.equals("emergency_vehicle") || e.relevance.equals("moving_emergency"))return EMERGENCY;
        if(e.category.equals("average_speed_zone")||e.category.equals("enforcement_zone")||e.nativeType.equals("AVG_SPEED_CHECK")||e.nativeType.equals("AVERAGE_SPEED_CAMERA"))return ZONE;
        if(e.nativeSubtype.equals("POLICE_TYPE_MOBILE_CAMERA"))return CAMERA;
        if(e.nativeType.equals("POLICE"))return POLICE;
        if(e.category.equals("police_control")||e.nativeType.equals("POLICEHOTSPOT") || e.nativeType.equals("POLICE_HOTSPOT") || e.nativeSubtype.equals("POLICE") || e.nativeSubtype.startsWith("POLICE_"))return POLICE;
        if(e.category.equals("speed_control")||e.category.equals("traffic_camera")||e.nativeType.equals("CAMERA"))return CAMERA;
        if(e.category.equals("traffic")||e.category.equals("speed_advice")||e.nativeType.equals("TRAFFIC_JAM")||e.nativeType.equals("TRAFFIC_INFO")||e.nativeType.equals("SPEED_LIMIT_DECREASE"))return TRAFFIC;
        switch(e.nativeType){
            case "HAZARD":case "ACCIDENT":case "CONSTRUCTION":case "CLOSURE":case "BLOCKED_LANE":case "BAD_WEATHER":case "PERMANENT_HAZARD":case "ANIMAL":case "SUDDEN_SLOWDOWN":case "SPEED_BUMP":case "DANGEROUS_CURVE":case "SCHOOL_ZONE":return ROAD_DANGER;
            default:break;
        }
        if((e.category.equals("road_danger")||e.category.equals("road_feature")||e.category.equals("roadworks")||e.category.equals("closure")||e.category.equals("weather")||e.category.equals("service_vehicle")||e.category.equals("slow_vehicle")) && !e.nativeType.equals("UNKNOWN"))return ROAD_DANGER;
        return OTHER;
    }
    private static int legacyCategories(int types){
        int out=0;if((types&1)!=0)out|=POLICE;
        if((types&((1<<1)|(1<<2)|(1<<4)))!=0)out|=ROAD_DANGER;
        if((types&(1<<3))!=0)out|=TRAFFIC;
        if((types&(1<<5))!=0)out|=CAMERA;
        if((types&(1<<6))!=0)out|=OTHER;
        if((types&(1<<7))!=0)out|=ZONE;
        return out;
    }
    private static int legacyKind(WarningEvent e){
        switch(categoryOf(e)){
            case POLICE:return 0;case TRAFFIC:return 3;case CAMERA:return 5;case ZONE:return 7;
            case ROAD_DANGER:
                if(e.nativeType.equals("ACCIDENT"))return 1;
                if(e.nativeType.equals("CONSTRUCTION")||e.nativeType.equals("CLOSURE"))return 4;
                String type=e.nativeSubtype.toUpperCase(Locale.ROOT);
                if(type.contains("ACCIDENT") || type.contains("CRASH"))return 1;
                if(type.contains("CLOSURE") || type.contains("ROAD_WORK") || type.contains("ROADWORK"))return 4;
                return 2;
            default:return 6;
        }
    }
}
