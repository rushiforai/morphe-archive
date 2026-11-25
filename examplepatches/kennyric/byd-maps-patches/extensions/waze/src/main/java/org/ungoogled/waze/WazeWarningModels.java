package org.ungoogled.waze;

import android.content.Context;
import android.os.Bundle;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Pinned native model readers. No native/UI action, speech, network or observation refresh. */
final class WazeWarningModels {
    private WazeWarningModels(){}
    private static final Map<String,String> SUBTYPES=new LinkedHashMap<>();
    static {
        SUBTYPES.put("UNSPECIFIED/-1","UNSPECIFIED");
        SUBTYPES.put("HAZARD/0","HAZARD_TYPE_ON_ROAD");
        SUBTYPES.put("HAZARD/1","HAZARD_TYPE_ON_SHOULDER");
        SUBTYPES.put("HAZARD/2","HAZARD_TYPE_WEATHER");
        SUBTYPES.put("HAZARD/3","HAZARD_TYPE_ON_ROAD_OBJECT");
        SUBTYPES.put("HAZARD/4","HAZARD_TYPE_ON_ROAD_POT_HOLE");
        SUBTYPES.put("HAZARD/5","HAZARD_TYPE_ON_ROAD_ROAD_KILL");
        SUBTYPES.put("HAZARD/6","HAZARD_TYPE_ON_SHOULDER_CAR_STOPPED");
        SUBTYPES.put("HAZARD/7","HAZARD_TYPE_ON_SHOULDER_ANIMALS");
        SUBTYPES.put("HAZARD/8","HAZARD_TYPE_ON_SHOULDER_MISSING_SIGN");
        SUBTYPES.put("HAZARD/18","HAZARD_TYPE_WEATHER_FREEZING_RAIN");
        SUBTYPES.put("HAZARD/19","HAZARD_TYPE_ON_ROAD_LANE_CLOSED");
        SUBTYPES.put("HAZARD/20","HAZARD_TYPE_ON_ROAD_OIL");
        SUBTYPES.put("HAZARD/22","HAZARD_TYPE_ON_ROAD_CONSTRUCTION");
        SUBTYPES.put("HAZARD/23","HAZARD_TYPE_ON_ROAD_CAR_STOPPED");
        SUBTYPES.put("HAZARD/24","HAZARD_TYPE_ON_ROAD_BROKEN_TRAFFIC_LIGHT");
        SUBTYPES.put("HAZARD/25","HAZARD_TYPE_DEFAULT");
        SUBTYPES.put("HAZARD/28","HAZARD_TYPE_EMERGENCY_VEHICLE");
        SUBTYPES.put("BAD_WEATHER/9","BAD_WEATHER_TYPE_FOG");
        SUBTYPES.put("BAD_WEATHER/10","BAD_WEATHER_TYPE_HAIL");
        SUBTYPES.put("BAD_WEATHER/11","BAD_WEATHER_TYPE_HEAVY_RAIN");
        SUBTYPES.put("BAD_WEATHER/12","BAD_WEATHER_TYPE_HEAVY_SNOW");
        SUBTYPES.put("BAD_WEATHER/13","BAD_WEATHER_TYPE_FLOOD");
        SUBTYPES.put("BAD_WEATHER/14","BAD_WEATHER_TYPE_MONSOON");
        SUBTYPES.put("BAD_WEATHER/15","BAD_WEATHER_TYPE_TORNADO");
        SUBTYPES.put("BAD_WEATHER/16","BAD_WEATHER_TYPE_HEAT_WAVE");
        SUBTYPES.put("BAD_WEATHER/17","BAD_WEATHER_TYPE_HURRICANE");
        SUBTYPES.put("BAD_WEATHER/21","BAD_WEATHER_TYPE_ON_ROAD_ICE");
        SUBTYPES.put("BAD_WEATHER/26","BAD_WEATHER_TYPE_DEFAULT");
        SUBTYPES.put("BAD_WEATHER/27","BAD_WEATHER_TYPE_SLIPPERY_ROAD");
        SUBTYPES.put("BLOCKED_LANE/0","BLOCKED_LANE_TYPE_DEFAULT");
        SUBTYPES.put("BLOCKED_LANE/1","BLOCKED_LANE_TYPE_LEFT");
        SUBTYPES.put("BLOCKED_LANE/2","BLOCKED_LANE_TYPE_CENTER");
        SUBTYPES.put("BLOCKED_LANE/3","BLOCKED_LANE_TYPE_RIGHT");
        SUBTYPES.put("PERMANENT_HAZARD/0","PERMANENT_HAZARD_TYPE_SPEED_BUMP");
        SUBTYPES.put("PERMANENT_HAZARD/1","PERMANENT_HAZARD_TYPE_TOPES");
        SUBTYPES.put("PERMANENT_HAZARD/2","PERMANENT_HAZARD_TYPE_TOLL_BOOTH");
        SUBTYPES.put("PERMANENT_HAZARD/3","PERMANENT_HAZARD_TYPE_DANGEROUS_CURVE");
        SUBTYPES.put("PERMANENT_HAZARD/4","PERMANENT_HAZARD_TYPE_FORK");
        SUBTYPES.put("PERMANENT_HAZARD/5","PERMANENT_HAZARD_TYPE_LANES_MERGING");
        SUBTYPES.put("PERMANENT_HAZARD/6","PERMANENT_HAZARD_TYPE_INTERSECTION");
        SUBTYPES.put("PERMANENT_HAZARD/7","PERMANENT_HAZARD_TYPE_SCHOOL_ZONE");
        SUBTYPES.put("PERMANENT_HAZARD/8","PERMANENT_HAZARD_TYPE_LEFT_LANE_ENDING");
        SUBTYPES.put("PERMANENT_HAZARD/9","PERMANENT_HAZARD_TYPE_RIGHT_LANE_ENDING");
        SUBTYPES.put("PERMANENT_HAZARD/10","PERMANENT_HAZARD_TYPE_RAISED_CROSSWALK");
        SUBTYPES.put("PERMANENT_HAZARD/11","PERMANENT_HAZARD_TYPE_HIGHWAY_CROSSWALK");
        SUBTYPES.put("PERMANENT_HAZARD/12","PERMANENT_HAZARD_TYPE_LEFT_SHOULDER_ENDING");
        SUBTYPES.put("PERMANENT_HAZARD/13","PERMANENT_HAZARD_TYPE_RIGHT_SHOULDER_ENDING");
        SUBTYPES.put("PERMANENT_HAZARD/14","PERMANENT_HAZARD_TYPE_BOTH_SHOULDER_ENDING");
        SUBTYPES.put("PERMANENT_HAZARD/15","PERMANENT_HAZARD_TYPE_NARROW_BRIDGE");
        SUBTYPES.put("SPEED_LIMIT_DECREASE/1","SPEED_LIMIT_DECREASE_TYPE_DEFAULT");
        SUBTYPES.put("PERSONAL_SAFETY/1","PERSONAL_SAFETY_TYPE_DEFAULT");
        SUBTYPES.put("CLOSURE/0","CLOSURE_TYPE_HAZARD");
        SUBTYPES.put("CLOSURE/1","CLOSURE_TYPE_CONSTRUCTION");
        SUBTYPES.put("CLOSURE/2","CLOSURE_TYPE_EVENT");
        SUBTYPES.put("CLOSURE/3","CLOSURE_TYPE_DEFAULT");
        SUBTYPES.put("SOS/4","SOS_TYPE_GENERAL_ASSISTANCE");
        SUBTYPES.put("SOS/1","SOS_TYPE_EMPTY_TANK");
        SUBTYPES.put("SOS/0","SOS_TYPE_FLAT_TIRE");
        SUBTYPES.put("SOS/5","SOS_TYPE_BATTERY_ISSUE");
        SUBTYPES.put("SOS/2","SOS_TYPE_MEDICAL_ISSUE");
        SUBTYPES.put("GUARDIAN/0","GUARDIAN_SHORT");
        SUBTYPES.put("GUARDIAN/1","GUARDIAN_LONG");
        SUBTYPES.put("TRAFFIC_JAM/0","JAM_TYPE_MODERATE_TRAFFIC");
        SUBTYPES.put("TRAFFIC_JAM/1","JAM_TYPE_HEAVY_TRAFFIC");
        SUBTYPES.put("TRAFFIC_JAM/2","JAM_TYPE_STAND_STILL_TRAFFIC");
        SUBTYPES.put("TRAFFIC_JAM/3","JAM_TYPE_LIGHT_TRAFFIC");
        SUBTYPES.put("TRAFFIC_JAM/5","JAM_TYPE_CLOSED_ROAD");
        SUBTYPES.put("TRAFFIC_JAM/6","JAM_TYPE_DEFAULT");
        SUBTYPES.put("CAMERA/-1","CAMERA_TYPE_UNKNOWN");
        SUBTYPES.put("CAMERA/0","CAMERA_TYPE_SPEED");
        SUBTYPES.put("CAMERA/1","CAMERA_TYPE_REDLIGHT");
        SUBTYPES.put("CAMERA/2","CAMERA_TYPE_DUMMY");
        SUBTYPES.put("CAMERA/3","CAMERA_TYPE_RAILROAD");
        SUBTYPES.put("CAMERA/4","CAMERA_TYPE_HOV_LANE");
        SUBTYPES.put("CAMERA/5","CAMERA_TYPE_HOV_LANE_BUS");
        SUBTYPES.put("CAMERA/6","CAMERA_TYPE_HOV_LANE_CARPOOL");
        SUBTYPES.put("CAMERA/7","CAMERA_TYPE_RED_LIGHT_AND_SPEED");
        SUBTYPES.put("CAMERA/8","CAMERA_TYPE_ROAD_SAFETY_PHONE");
        SUBTYPES.put("CAMERA/9","CAMERA_TYPE_ROAD_SAFETY_SEAT_BELT");
        SUBTYPES.put("CAMERA/10","CAMERA_TYPE_ROAD_SAFETY_DISTANCE_BETWEEN_VEHICLES");
        SUBTYPES.put("CAMERA/11","CAMERA_TYPE_ROAD_SAFETY_STOP_SIGN");
        SUBTYPES.put("CAMERA/12","CAMERA_TYPE_ROAD_SAFETY_NOISE");
        SUBTYPES.put("ACCIDENT/0","ACCIDENT_TYPE_MINOR");
        SUBTYPES.put("ACCIDENT/1","ACCIDENT_TYPE_MAJOR");
        SUBTYPES.put("ACCIDENT/2","ACCIDENT_TYPE_DEFAULT");
        SUBTYPES.put("ACCIDENT/3","ACCIDENT_TYPE_PILE_UP");
        SUBTYPES.put("POLICE/0","POLICE_TYPE_VISIBLE");
        SUBTYPES.put("POLICE/1","POLICE_TYPE_HIDDEN");
        SUBTYPES.put("POLICE/2","POLICE_TYPE_MOBILE_CAMERA");
        SUBTYPES.put("MID_DRIVE_TOAST/0","MID_DRIVE_TOAST_TYPE_GENERAL");
        SUBTYPES.put("MID_DRIVE_TOAST/1","MID_DRIVE_TOAST_TYPE_THANK_YOU");
        SUBTYPES.put("OTHER/0","MISC_HEADLIGHTS_REMINDER");
        SUBTYPES.put("ECO/0","ECO_TYPE_DEFAULT");
        SUBTYPES.put("DANGER_ZONE/0","DANGER_ZONE_TYPE_NORMAL");
        SUBTYPES.put("DANGER_ZONE/1","DANGER_ZONE_TYPE_ISRAEL");
    }
    static Object call(Object object,String method,Object...arguments){
        if(object==null)throw new IllegalArgumentException("MISSING_NATIVE_MODEL");
        try{
            if(arguments.length==0)return object.getClass().getMethod(method).invoke(object);
            for(Method candidate:object.getClass().getMethods())if(candidate.getName().equals(method)&&candidate.getParameterCount()==arguments.length)
                return candidate.invoke(object,arguments);
            throw new NoSuchMethodException(method);
        }catch(ReflectiveOperationException failure){throw new IllegalStateException("WAZE_MODEL_ABI_"+method,failure);}
    }
    static String string(Object value){return value==null?"":value instanceof Enum?((Enum<?>)value).name():String.valueOf(value);}
    static boolean present(Object object,String field){return Boolean.TRUE.equals(call(object,"has"+field));}
    static boolean flag(Object object,String field){return Boolean.TRUE.equals(call(object,"get"+field));}
    static int number(Object object,String field){return ((Number)call(object,"get"+field)).intValue();}
    static String hash(String value){
        try{byte[] bytes=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));StringBuilder out=new StringBuilder();for(byte b:bytes)out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();}
        catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }
    static String identity(Object id){
        boolean ui=id.getClass().getName().equals("com.waze.j");
        String provider=string(call(id,ui?"a":"getProviderId")),unique=string(call(id,ui?"b":"getUniqueId")),uuid=string(call(id,ui?"c":"getUuid"));
        if(unique.isEmpty()&&uuid.isEmpty())throw new IllegalArgumentException("MISSING_NATIVE_ID");
        return "waze/alerter/"+hash(provider.length()+":"+provider+unique.length()+":"+unique+uuid.length()+":"+uuid);
    }
    static String uuid(Object id){return string(call(id,id.getClass().getName().equals("com.waze.j")?"c":"getUuid"));}
    static String soundKey(Object id){
        boolean ui=id.getClass().getName().equals("com.waze.j");String provider=string(call(id,ui?"a":"getProviderId")),unique=string(call(id,ui?"b":"getUniqueId"));
        return unique.isEmpty()?"":hash(provider.length()+":"+provider+unique.length()+":"+unique);
    }
    static boolean matchesSoundIdentity(Object sound,Object controller){
        if(identity(sound).equals(identity(controller)))return true;
        String key=soundKey(sound);return uuid(sound).isEmpty()&&!key.isEmpty()&&key.equals(soundKey(controller));
    }
    static String link(String unique,String uuid){return hash(unique.length()+":"+unique+uuid.length()+":"+uuid);}
    static String subtype(String type,long value){return SUBTYPES.getOrDefault(type+"/"+value,"UNKNOWN_"+value);}
    static String language(Context context){
        try{
            Object manager=Class.forName("com.waze.NativeManager").getMethod("getInstance").invoke(null);
            Object locale=call(manager,"getLocale");if(locale instanceof Locale&&!((Locale)locale).getLanguage().isEmpty())return ((Locale)locale).toLanguageTag();
        }catch(ReflectiveOperationException|RuntimeException unavailable){}
        return "und";
    }
    static Bundle base(String namespace,String type,String message,String language){
        Bundle b=new Bundle();b.putString("provider_package","com.waze");b.putString("provider_profile_version","5.26.90.901/1030746");
        b.putString("native_namespace",namespace);b.putString("native_type",type);b.putString("message",message);b.putString("language_tag",language);
        b.putString("message_origin","native_text");b.putString("relationship","unknown");b.putString("relevance","notice");b.putString("context","current_road");
        b.putString("managed_output_policy","receiver_choices_v1");
        b.putString("phase","notice");b.putString("category","road_danger");b.putInt("priority",1);return b;
    }
    static String join(String title,String description){
        if(title.isEmpty())return description;if(description.isEmpty()||description.equals(title)||title.contains(description))return title;
        return description.startsWith(title)?description:title+". "+description;
    }
    static void priority(Bundle b,Object value){b.putInt("source_priority",number(value,"Value"));b.putBoolean("source_preemptive",flag(value,"Preemptive"));}
    static Bundle descriptor(Context context,Object descriptor){
        if(!present(descriptor,"AlertId")||!present(descriptor,"Info"))throw new IllegalArgumentException("MISSING_NATIVE_DESCRIPTOR");
        Object id=call(descriptor,"getAlertId"),info=call(descriptor,"getInfo");String type=string(call(info,"getType"));
        String title=string(call(info,"getTitle")),description=string(call(info,"getDescription"));
        Bundle b=base("com.waze.jni.protos.alerters.AlerterInfo",type,join(title,description),language(context));b.putString("warning_id",identity(id));
        b.putString("native_link_key",link(string(call(id,"getUniqueId")),string(call(id,"getUuid"))));
        b.putString("native_title",title);b.putString("native_description",description);b.putInt("native_type_raw",number(info,"TypeValue"));
        if(present(info,"SubType")){int raw=number(info,"SubType");b.putInt("native_subtype_raw",raw);b.putString("native_subtype_namespace","com.waze.AlerterController.Alerter.Subtype");b.putString("native_subtype",subtype(type,raw));}
        if(present(info,"SubtypeTrait")){long trait=((Number)call(info,"getSubtypeTrait")).longValue();b.putLong("native_trait_raw",trait);b.putString("native_trait",trait==1?"CAR_ON_SHOULDER_PEOPLE_AROUND":trait==2?"CAR_ON_SHOULDER_NEAR_LANE":trait==3?"CAR_ON_SHOULDER_NOT_CLEARLY_MARKED":"UNKNOWN");}
        b.putBoolean("native_validation_present",present(info,"ValidationResult"));
        if(present(info,"ValidationResult")){
            Object validation=call(info,"getValidationResult");b.putBoolean("native_valid",flag(validation,"IsValid"));
            if(present(validation,"DistanceMeters")){int distance=number(validation,"DistanceMeters");if(distance>=0){b.putInt("distance_m",distance);b.putBoolean("distance_estimated",false);}}
            if(present(validation,"TimeToAlertSec")){int time=number(validation,"TimeToAlertSec");if(time>=0)b.putInt("native_time_to_alert_s",time);}
        }else b.putBoolean("native_valid",false);
        if(present(info,"SilentActivation"))b.putString("native_silent_activation",string(call(info,"getSilentActivation")));
        b.putBoolean("native_require_distance_in_range",flag(info,"RequireDistanceInRange"));b.putBoolean("native_approaching_with_validation",flag(info,"IsApproachingWithValidation"));
        b.putBoolean("native_close_distance_capping",flag(info,"CloseDistanceSameAlertsCappingEnabled"));b.putBoolean("native_abort_on_removal",flag(descriptor,"AbortImmediatelyOnRemoval"));
        int trigger=number(descriptor,"TriggerDistanceMeters");if(trigger>=0){b.putInt("trigger_m",trigger);b.putBoolean("trigger_estimated",false);}
        if(present(descriptor,"InsightPriority"))priority(b,call(descriptor,"getInsightPriority"));
        if(present(info,"Position")){
            Object pos=call(info,"getPosition");double lat=((Number)call(pos,"getLatitude")).doubleValue()/1e6,lon=((Number)call(pos,"getLongitude")).doubleValue()/1e6;
            if(Double.isFinite(lat)&&Math.abs(lat)<=90&&Double.isFinite(lon)&&Math.abs(lon)<=180){b.putDouble("latitude",lat);b.putDouble("longitude",lon);b.putBoolean("position_estimated",false);b.putString("relevance","point_ahead");}
        }
        if(type.equals("CAMERA")||type.equals("POLICE"))b.putString("category",type.equals("POLICE")?"police_control":"speed_control");
        else if(type.equals("BAD_WEATHER"))b.putString("category","weather");
        else if(type.equals("CLOSURE")||type.equals("BLOCKED_LANE"))b.putString("category","closure");
        else if(type.equals("TRAFFIC_JAM")||type.equals("TRAFFIC_INFO")){b.putString("category","traffic");b.putInt("priority",2);}
        else if(type.equals("PERMANENT_HAZARD")||type.equals("SPEED_LIMIT_DECREASE")||type.equals("GUARDIAN")){b.putString("category","road_feature");b.putInt("priority",2);}
        else if(type.equals("SOS")){b.putString("category","road_danger");b.putInt("priority",2);b.putString("native_scope","roadside_assistance");}
        else if(type.equals("PERSONAL_SAFETY")){b.putString("category","road_danger");b.putString("native_scope","reported_safety_incident");}
        else if(type.equals("OTHER")||type.equals("DYNAMIC")||type.equals("UNRECOGNIZED")){b.putString("category","other_native");b.putInt("priority",2);b.putString("native_scope","native_text_fallback");}
        else if(type.equals("CHITCHAT")||type.equals("PARKING")||type.equals("PARKED")||type.equals("ECO")||type.equals("REROUTE")){
            b.putString("category","display_only");b.putString("capture_exclusion","social_parking_or_personal_route");b.putString("message","");b.remove("native_title");b.remove("native_description");
        }
        // Native preemption orders Waze's selected cards. Preserve it without treating
        // every weather/accident card as authority to interrupt Maps/Vela guidance.
        b.putString("priority_origin","waze_semantic_family_v1");
        if(present(descriptor,"ZoneAlertData")){
            Object zone=call(descriptor,"getZoneAlertData");String state=string(call(zone,"getState"));b.putString("native_zone_state",state);b.putInt("native_zone_percent",number(zone,"ZonePercent"));
            if(type.equals("CAMERA"))b.putString("category","enforcement_zone");
            b.putString("relevance","zone");b.putString("phase",state.equals("BeforeZone")?"approach":state.equals("InZone")?"enter":state.equals("LeftZone")?"exit":"notice");
            if(state.equals("LeftZone"))b.putInt("priority",2);
        }
        return b;
    }
    static Bundle segment(Context context,Object info){
        Object id=call(info,"getId");String type=string(call(id,"getSegmentType")),nativeId=string(call(id,"getSegmentId"));if(nativeId.isEmpty())throw new IllegalArgumentException("MISSING_SEGMENT_ID");
        boolean nl=language(context).startsWith("nl");String label;
        switch(type){
            case "TRAFFIC":label=nl?"File":"Traffic";break;case "SPEED_BUMP":label=nl?"Verkeersdrempel":"Speed bump";break;
            case "DANGEROUS_CURVE":label=nl?"Gevaarlijke bocht":"Dangerous curve";break;case "HOV_LANE":label="HOV lane";break;
            case "CARPOOL_LANE":label=nl?"Carpoolstrook":"Carpool lane";break;case "BUS_LANE":label=nl?"Busstrook":"Bus lane";break;
            case "ENFORCEMENT_ZONE":label=nl?"Controlezone":"Enforcement zone";break;case "AVERAGE_SPEED_CAMERA":label=nl?"Trajectcontrole":"Average-speed zone";break;
            case "SCHOOL_ZONE":label=nl?"Schoolzone":"School zone";break;default:label="";
        }
        Bundle b=base("com.waze.jni.protos.insights_infra.SegmentInsightInfo",type,label,nl?"nl":"en");b.putString("message_origin","template");b.putString("template_id","waze_segment_label_v1");
        b.putString("warning_id","waze/segment/"+hash(type+":"+nativeId));b.putString("native_segment_key",hash(type+":"+nativeId));b.putInt("native_type_raw",number(id,"SegmentTypeValue"));
        String phase=string(call(info,"getPositionRelativeToSegment"));b.putString("native_segment_phase",phase);b.putString("phase",phase.equals("APPROACHING")?"approach":"active");
        b.putString("relevance","zone");b.putString("category",type.equals("AVERAGE_SPEED_CAMERA")?"average_speed_zone":type.equals("TRAFFIC")?"traffic":"road_feature");b.putInt("priority",2);
        int distance=number(info,"RemainingDistanceMeters");if(distance>=0&&(phase.equals("APPROACHING")||phase.equals("WITHIN"))){b.putInt("distance_m",distance);b.putBoolean("distance_estimated",false);b.putString("native_distance_kind",phase.equals("APPROACHING")?"to_segment":"remaining_in_segment");}
        if(present(info,"RemainingDurationSeconds")){int duration=number(info,"RemainingDurationSeconds");if(duration>=0)b.putInt("native_remaining_duration_s",duration);}
        if(present(info,"Priority"))priority(b,call(info,"getPriority"));
        List<?> alerts=(List<?>)call(info,"getSourceAlertInfosList");if(alerts.size()>32)throw new IllegalArgumentException("SEGMENT_LINK_BOUND");b.putInt("source_alert_count",alerts.size());
        for(int i=0;i<alerts.size();i++){
            Object alert=alerts.get(i);String prefix="source_alert_"+i+"_";
            b.putString(prefix+"link_key",link(string(call(alert,"getId")),string(call(alert,"getUuid"))));b.putString(prefix+"type",string(call(alert,"getAlerterType")));
            b.putInt(prefix+"subtype_raw",number(alert,"Subtype"));b.putBoolean(prefix+"familiar",flag(alert,"Familiar"));
        }
        if(type.equals("HOV_LANE")||type.equals("CARPOOL_LANE")||type.equals("BUS_LANE")){b.putString("context","source_route");b.putBoolean("requires_source_route",true);b.putString("category","display_only");b.putString("capture_exclusion","source_route_context");}
        return b;
    }
    static Bundle notification(Context context,Object notification){
        if(!present(notification,"Id"))throw new IllegalArgumentException("MISSING_NOTIFICATION_ID");Object id=call(notification,"getId");String feature=string(call(id,"getFeature")),nativeId=string(call(id,"getId"));if(nativeId.isEmpty())throw new IllegalArgumentException("MISSING_NOTIFICATION_ID");
        String title=string(call(notification,"getTitle")),body=string(call(notification,"getBody"));Bundle b=base("com.waze.jni.protos.insights_infra.Notification","NOTIFICATION",join(title,body),language(context));
        b.putString("warning_id",notificationIdentity(id));b.putString("native_subtype",feature);b.putInt("native_subtype_raw",number(id,"FeatureValue"));b.putString("category","road_feature");b.putInt("priority",2);b.putBoolean("native_visual_only",true);
        if(present(notification,"Priority"))b.putInt("source_priority",number(notification,"Priority"));
        if(present(notification,"TimeoutMs")){long timeout=((Number)call(notification,"getTimeoutMs")).longValue();if(timeout>=0)b.putLong("native_timeout_ms",timeout);}
        List<?> titles=(List<?>)call(notification,"getInCarTitleVariantsList"),bodies=(List<?>)call(notification,"getInCarBodyVariantsList");
        if(titles.size()>8||bodies.size()>8)throw new IllegalArgumentException("CAR_VARIANT_BOUND");b.putInt("native_car_title_count",titles.size());b.putInt("native_car_body_count",bodies.size());
        for(int i=0;i<titles.size();i++){String titleVariant=string(titles.get(i));b.putString("native_car_title_"+i,titleVariant);if(!titleVariant.isEmpty()&&!b.containsKey("native_car_title"))b.putString("native_car_title",titleVariant);}
        for(int i=0;i<bodies.size();i++){String bodyVariant=string(bodies.get(i));b.putString("native_car_body_"+i,bodyVariant);if(!bodyVariant.isEmpty()&&!b.containsKey("native_car_body"))b.putString("native_car_body",bodyVariant);}
        b.putBoolean("native_car_available",b.containsKey("native_car_title")||b.containsKey("native_car_body"));
        if(!feature.equals("FEATURE_CYCLISTS")){
            b.putString("message","");b.putString("category","display_only");b.putString("capture_diagnostic","UNKNOWN_NATIVE_NOTIFICATION");
            for(String key:new java.util.ArrayList<>(b.keySet()))if(key.startsWith("native_car_"))b.remove(key);
            b.putBoolean("native_car_available",false);
        }
        return b;
    }
    static String notificationIdentity(Object id){return "waze/notification/"+hash(string(call(id,"getFeature"))+":"+string(call(id,"getId")));}
}
