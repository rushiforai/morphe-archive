package nl.johninnl.warningprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Process;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real pinned FM models/resources and installed extension; no sound or detector invocation. */
public final class NativeFmModelProbe extends Instrumentation {
    private static final String REPORTS="nl.flitsmeister.fmcore.data.model.reports.";
    private static final String EARLY="nl.flitsmeister.earlywarning.model.";
    private Class<?> capture;
    private Context context;
    private final List<Bundle> events=new ArrayList<>();
    private boolean bootstrappedConfiguration,fm15;
    private String versionName;
    private long versionCode;
    private Bundle arguments;
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        Bundle output=new Bundle();JSONObject report=new JSONObject();
        try{
            Context target=getTargetContext();check(target.getPackageName().equals("nl.flitsmeister"),"Wrong target");
            admitVersion(target,report);
            Configuration configuration=new Configuration(target.getResources().getConfiguration());configuration.setLocale(Locale.forLanguageTag(arguments.getString("language","en")));
            context=target.createConfigurationContext(configuration);
            bootstrapNativeConfiguration();
            capture=Class.forName("nl.johninnl.flitsmeister.NativeWarnings");
            capture.getDeclaredMethod("citsSource",Object.class); // Reject the earlier checkpoint APK.
            Method reset=capture.getDeclaredMethod("resetForTest",Context.class,Consumer.class);reset.setAccessible(true);reset.invoke(null,context,(Consumer<Bundle>)events::add);
            report.put("language",configuration.getLocales().get(0).toLanguageTag());
            report.put("target_uid",target.getApplicationInfo().uid);report.put("process_uid",Process.myUid());report.put("process_pid",Process.myPid());
            report.put("native_configuration_bootstrap",bootstrappedConfiguration?(fm15?"original_y80_singleton_via_lp0_j":"original_z80_singleton_via_t25_i"):"already_initialized");
            report.put("native_configuration_globals",nativeName("t25")).put("native_configuration_field",fm15?"b":"a").put("native_geojson_parser",nativeName("ma9"));
            check(target.getApplicationInfo().uid==Process.myUid(),"Probe not in target UID");
            report.put("cameras",cameras());report.put("incidents",incidents());report.put("early",early());report.put("services",services());report.put("base_types",baseTypes());
            report.put("lane_closed",lanes());report.put("cits_roadworks",roadworks());
            report.put("base_warning_models",baseWarnings());report.put("cits_kind_labels",citsLabels());
            check(events.size()==170,"Synthetic adapter call denominator");report.put("adapter_call_cases",events.size());report.put("additional_lane_subtype_members",3);report.put("additional_weather_subtype_members",2);
            java.util.Set<String> captured=new java.util.TreeSet<>();for(Bundle e:events)captured.add(e.getString("native_type"));
            List<String> baseWarnings=java.util.Arrays.asList("AVG_SPEED_CHECK","CITS_BRIDE_CLOSED","CITS_LANE_CLOSED","CITS_SPEED_ADVICE","CITS_WEATHER","INCIDENT","POLICEHOTSPOT","SERVICE_VEHICLE","SLOW_MOVING_VEHICLE","SPEED_CAM","SPEED_TRAP","TRAFFIC_JAM");
            check(captured.containsAll(baseWarnings),"Some base-warning model families were not captured");report.put("base_warning_families_captured",new JSONArray(baseWarnings));
            report.put("inventory_members",159);report.put("native_detector_invoked",false);report.put("native_audio_invoked",false);
            report.put("probe_completed",true);report.put("acceptance_scope","Actual pinned native model/resource and installed extension adapter acceptance only; synthetic accepted calls, no detection/category preference runtime, transport, speech or car proof");
            output.putString("fm_model_result",report.toString());finish(Activity.RESULT_OK,output);
        }catch(Throwable error){try{report.put("probe_completed",false);output.putString("fm_model_partial_result",report.toString());}catch(Exception ignored){}output.putString("fm_model_error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,output);}
    }
    private void admitVersion(Context target,JSONObject report)throws Exception{
        android.content.pm.PackageInfo info=target.getPackageManager().getPackageInfo(target.getPackageName(),0);
        versionName=info.versionName;versionCode=info.getLongVersionCode();
        report.put("target_version",versionName).put("target_version_code",versionCode);
        fm15="15.0".equals(versionName)&&versionCode==1289;
        check(fm15||"14.17".equals(versionName)&&versionCode==1287,"Only exact FM14.17/1287 or FM15.0/1289 is admitted");
        report.put("native_binding_profile",fm15?"15.0/1289":"14.17/1287");
    }
    private String nativeName(String legacy){
        if(!fm15)return legacy;
        switch(legacy){case "t25":return "lp0";case "z80":return "y80";case "ye4":return "ff4";case "ma9":return "aa9";default:throw new IllegalArgumentException("Unported FM15 model alias: "+legacy);}
    }
    private Class<?> nativeType(String legacy)throws ClassNotFoundException{return context.getClassLoader().loadClass(nativeName(legacy));}
    private JSONArray cameras()throws Exception{
        reset();
        JSONArray rows=new JSONArray();Object[] types=values(REPORTS+"SpeedCamType");check(types.length==82,"Camera inventory");
        for(Object type:types){Object model=Class.forName(REPORTS+"SpeedCam").getConstructor().newInstance();call(model,"setSpeedCamType",type);call(model,"setId","probe-camera-"+name(type));
            String expected=String.valueOf(call(type,"getLocalizedTTS",context));regular(model,null);Bundle event=last();
            check(expected.equals(event.getString("message")),"Camera native TTS mismatch: "+name(type));check(name(type).equals(event.getString("native_subtype")),"Camera subtype");
            check("ANNOUNCE".equals(event.getString("operation")),"Camera missing speech text");rows.put(row(type,event).put("native_tts",expected));}
        return rows;
    }
    private void bootstrapNativeConfiguration()throws Exception{
        Class<?> nativeGlobals=nativeType("t25");if(nativeGlobals.getField(fm15?"b":"a").get(null)!=null)return;
        // Same concrete initializer used by the app's native entrypoints. z80's constructor
        // obtains feature preferences from the actual Hilt component; it starts no detector/audio.
        Object factory=nativeType("z80").getField("e").get(null);
        Object manager=factory.getClass().getMethod("getInstance",Context.class).invoke(factory,context);
        nativeGlobals.getMethod(fm15?"j":"i",Context.class,nativeType("ye4")).invoke(null,context,manager);
        check(nativeGlobals.getField(fm15?"b":"a").get(null)==manager,"Native configuration bootstrap");bootstrappedConfiguration=true;
    }
    private JSONArray services()throws Exception{
        reset();
        JSONArray rows=new JSONArray();Class<?> typeClass=Class.forName(REPORTS+"ServiceVehicle$Type");Object[] types=typeClass.getEnumConstants();check(types.length==6,"Service inventory");
        for(Object type:types){Object model=Class.forName(REPORTS+"ServiceVehicle").getConstructor(typeClass).newInstance(type);call(model,"setId","probe-service-"+name(type));
            String expected=String.valueOf(call(model,"reportTitleText",context));regular(model,null);Bundle event=last();
            check(expected.equals(event.getString("message")),"Service title mismatch: "+name(type));check("ANNOUNCE".equals(event.getString("operation")),"Service missing title");rows.put(row(type,event).put("native_title",expected));}
        return rows;
    }
    private JSONArray incidents()throws Exception{
        reset();
        JSONArray rows=new JSONArray();Object[] types=values(REPORTS+"IncidentType");check(types.length==35,"Incident inventory");
        for(Object type:types){Object model=Class.forName(REPORTS+"Incident").getConstructor().newInstance();call(model,"setIncidentType",type);call(model,"setId","probe-incident-"+name(type));
            call(model,"setFreeText","TEST ONLY synthetic incident instruction");call(model,"setVoiceOnlyText","TEST ONLY synthetic native voice-only instruction");
            String expected;
            if(name(type).equals("VOICE_ONLY")){expected=String.valueOf(call(model,"getVoiceOnlyText"));int count=events.size();capture.getMethod("voiceOnly",Object.class).invoke(null,model);check(events.size()==count+1,"VOICE_ONLY capture missing");}
            else{
                Object pair=call(type,"getTTSString",context,model);expected=String.valueOf(call(pair,"component1"));
                if(Boolean.TRUE.equals(call(pair,"component2")))expected=String.valueOf(call(model,"getFreeText"));
                else if(!name(type).equals("OTHER"))expected=context.getString(resource("tts_incident"),expected);
                regular(model,expected);
            }
            Bundle event=last();check(expected.equals(event.getString("message")),"Incident accepted text mismatch: "+name(type));check(name(type).equals(event.getString("native_subtype")),"Incident subtype");
            rows.put(row(type,event).put("native_tts",expected).put("fallback",fallback(model,"enter")));
        }
        return rows;
    }
    private JSONArray early()throws Exception{
        reset();
        JSONArray rows=new JSONArray();Class<?> notificationClass=Class.forName(EARLY+"EarlyWarningNotification");Object[] types=values(EARLY+"EarlyWarningTypeEnum");check(types.length==17,"Early inventory");
        for(Object type:types){Object notification=notificationClass.getConstructor().newInstance();call(notification,"setType",type);call(notification,"setName","TEST ONLY "+name(type));call(notification,"setCode","probe-"+name(type));
            call(notification,"setTitle","TEST ONLY native early title");call(notification,"setDescription","TEST ONLY native early description");call(notification,"setFreetext","TEST ONLY native early instruction");
            Object model=Class.forName("nl.flitsmeister.fmcore.models.data.reports.EarlyWarningReport").getConstructor(notificationClass).newInstance(notification);
            String reportText=String.valueOf(call(model,"getFreeText"));if(name(type).equals("BRIDGE_CLOSED"))reportText=context.getString(resource("tts_incident_bridge"),reportText);
            early(type,model,null,reportText);Bundle reportEvent=last();check(reportText.equals(reportEvent.getString("message")),"Early report text: "+name(type));
            String notificationText=String.valueOf(call(notification,"getNotificationTitle",context));early(type,null,notification,notificationText);Bundle notificationEvent=last();
            check(notificationText.equals(notificationEvent.getString("message")),"Early notification text: "+name(type));check(reportEvent.getString("warning_id").equals(notificationEvent.getString("warning_id")),"Early shared identity");
            rows.put(row(type,reportEvent).put("notification_message",notificationEvent.getString("message")).put("report_fallback",fallback(model,"notice")).put("notification_fallback",fallback(notification,"notice")));
        }
        return rows;
    }
    private JSONArray baseTypes()throws Exception{
        JSONArray rows=new JSONArray();Object[] values=values(REPORTS+"BaseReportType");check(values.length==19,"Base inventory");
        for(Object type:values){int id=((Number)call(type,"getResource")).intValue();String label=String.valueOf(call(type,"getTypeString",context));rows.put(new JSONObject().put("member",name(type)).put("native_resource",id).put("native_label",label));}
        return rows;
    }
    private JSONArray lanes()throws Exception{
        reset();JSONArray rows=new JSONArray();Object[] types=values("nl.flitsmeister.fmcore.models.enums.LaneClosedType");check(types.length==3,"Lane subtype inventory");
        int index=0;for(Object type:types){Object model=Class.forName("nl.flitsmeister.fmcore.models.data.cits.CitsLaneClosed").getConstructor().newInstance();
            call(model,"setId","probe-lane-"+name(type));call(model,"setLaneClosedType",type);call(model,"setLaneIndex",index);call(model,"setNumberOfLanesClosed",index+1);
            String expected=String.valueOf(call(model,"getLaneClosedTitle",context));regular(model,null);Bundle event=last();
            check(name(type).equals(event.getString("native_subtype")),"Native lane subtype");check(event.getInt("lane_index",-1)==index&&event.getInt("number_of_lanes_closed",-1)==index+1,"Native lane scalar fields");
            check(expected.equals(event.getString("message")),"Native lane title formatter");rows.put(row(type,event).put("lane_index",index).put("number_of_lanes_closed",index+1).put("native_lane_code",event.getString("native_lane_code")));index++;
        }
        return rows;
    }
    private JSONObject roadworks()throws Exception{
        reset();Object event=Class.forName("bemobile.cits.sdk.core.model.response.RoadWorks").getConstructor().newInstance();
        JSONObject info=new JSONObject().put("eventID","probe-roadworks").put("version",1);
        event.getClass().getField("info").set(event,Class.forName("bemobile.cits.sdk.core.model.response.generalObjects.Info").getConstructor(JSONObject.class).newInstance(info));
        JSONObject geo=new JSONObject("{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[5,52]},\"properties\":{}}]}");
        event.getClass().getField("geoJSON").set(event,nativeType("ma9").getMethod("a",JSONObject.class).invoke(null,geo));
        Object model=Class.forName("nl.flitsmeister.fmcore.models.data.cits.CitsRoadWorks").getConstructor(event.getClass()).newInstance(event);
        regular(model,null);Bundle value=last();String expected=context.getString(resource("report_roadworks_singleline"));
        check("INCIDENT".equals(value.getString("native_type"))&&"CitsRoadWorks".equals(value.getString("native_family")),"CITS roadworks model family");
        check("roadworks".equals(value.getString("category"))&&expected.equals(value.getString("message")),"CITS roadworks native resource classification");
        return new JSONObject().put("native_family",value.getString("native_family")).put("native_type",value.getString("native_type")).put("category",value.getString("category")).put("message",value.getString("message"));
    }
    private JSONArray baseWarnings()throws Exception{
        reset();JSONArray rows=new JSONArray();
        for(String family:new String[]{"SpeedTrap","TrafficJam","AvgSpeedCheck","PoliceHotspot","SlowMovingVehicle"}){
            Object model=Class.forName(REPORTS+family).getConstructor().newInstance();call(model,"setId","probe-base-"+family);
            if(family.equals("TrafficJam")){call(model,"setMinutesDelay",3);call(model,"setRoad","TEST ROAD");}
            regular(model,null);Bundle event=last();check("ANNOUNCE".equals(event.getString("operation")),"Base model lacks useful native text: "+family);
            String nativeType=((Enum<?>)call(model,"getReportType")).name();check(nativeType.equals(event.getString("native_type")),"Base model identity: "+family);
            if(family.equals("TrafficJam"))check(event.getString("message").contains(String.valueOf(call(model,"reportTitleText",context))),"Traffic description lost jam kind");
            rows.put(new JSONObject().put("model",family).put("native_type",nativeType).put("message",event.getString("message")).put("language_tag",event.getString("language_tag")));
        }
        return rows;
    }
    private Object sourceEvent(String kind,String id)throws Exception{
        Object event=Class.forName("bemobile.cits.sdk.core.model.response."+kind).getConstructor().newInstance();
        event.getClass().getField("info").set(event,Class.forName("bemobile.cits.sdk.core.model.response.generalObjects.Info").getConstructor(JSONObject.class).newInstance(new JSONObject().put("eventID",id).put("version",1)));
        JSONObject geo=new JSONObject("{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[5,52]},\"properties\":{}}]}");
        event.getClass().getField("geoJSON").set(event,nativeType("ma9").getMethod("a",JSONObject.class).invoke(null,geo));return event;
    }
    private JSONArray citsLabels()throws Exception{
        reset();JSONArray rows=new JSONArray();Class<?> base=Class.forName("bemobile.cits.sdk.core.model.response.generalObjects.BaseEvent");
        for(String kind:new String[]{"Fog","IceOnTheRoad"}){
            Object source=sourceEvent(kind,"probe-weather-"+kind);Object model=Class.forName("nl.flitsmeister.fmcore.models.data.cits.CitsWeather").getConstructor(base).newInstance(source);
            regular(model,null);Bundle event=last();String title=String.valueOf(call(model,"getTitle",context));check(event.getString("message").contains(title),"Native weather hazard kind missing");check(event.containsKey("native_subtype"),"Native weather subtype missing");
            rows.put(new JSONObject().put("model",kind).put("native_type",event.getString("native_type")).put("native_subtype",event.getString("native_subtype")).put("message",event.getString("message")));
        }
        Object bridge=sourceEvent("BridgeClosed","probe-bridge");bridge.getClass().getField("when").set(bridge,Class.forName("bemobile.cits.sdk.core.model.response.generalObjects.When").getConstructor(JSONObject.class).newInstance(new JSONObject().put("start","2020-01-01T00:00:00Z").put("end","2099-01-01T00:00:00Z")));
        Object model=Class.forName("nl.flitsmeister.fmcore.models.data.cits.CitsBridgeClosed").getConstructor(bridge.getClass()).newInstance(bridge);regular(model,null);Bundle bridgeEvent=last();String title=String.valueOf(call(model,"reportTitleText",context));check(bridgeEvent.getString("message").contains(title),"Native bridge kind lost to duration");rows.put(new JSONObject().put("model","BridgeClosed").put("native_type",bridgeEvent.getString("native_type")).put("message",bridgeEvent.getString("message")));
        Object speed=sourceEvent("SpeedAdvice","probe-advice");speed.getClass().getField("adviceKph").setInt(speed,40);speed.getClass().getField("isTrafficLight").setBoolean(speed,true);
        Object advice=Class.forName("nl.flitsmeister.fmcore.models.data.cits.CitsSpeedAdvice").getConstructor(speed.getClass()).newInstance(speed);Object wrapper=Class.forName("nl.flitsmeister.fmcore.models.eventbuses.cits.CitsSpeedAdviceWrapper").getConstructor(advice.getClass(),boolean.class).newInstance(advice,true);
        int before=events.size();capture.getMethod("vriState",Object.class).invoke(null,wrapper);check(events.size()==before+1,"Native VRI adapter missing");Bundle event=last();check("UPSERT".equals(event.getString("operation"))&&event.getInt("native_advice_kmh")==40,"VRI state/scalar changed");check(event.getString("message").contains(String.valueOf(call(advice,"getTitle",context))),"Native advice title missing");rows.put(new JSONObject().put("model","SpeedAdvice").put("native_type",event.getString("native_type")).put("message",event.getString("message")).put("native_advice_kmh",40));
        return rows;
    }
    private JSONObject fallback(Object model,String phase)throws Exception{
        Class<?> helper=Class.forName("nl.johninnl.flitsmeister.NativeWarningText");Method method=helper.getDeclaredMethod("resolve",Context.class,Object.class,String.class,String.class);method.setAccessible(true);
        Object text=method.invoke(null,context,model,phase,null);JSONObject result=new JSONObject();
        for(String key:new String[]{"value","origin","language"}){java.lang.reflect.Field field=text.getClass().getDeclaredField(key);field.setAccessible(true);result.put(key,field.get(text));}
        return result;
    }
    private void reset()throws Exception{Method method=capture.getDeclaredMethod("resetForTest",Context.class,Consumer.class);method.setAccessible(true);method.invoke(null,context,(Consumer<Bundle>)events::add);}
    private void regular(Object model,String text)throws Exception{int count=events.size();capture.getMethod("regular",Object.class,Object.class,boolean.class,boolean.class,String.class,Object.class).invoke(null,null,model,true,false,text,null);check(events.size()==count+1,"Regular capture missing");}
    private void early(Object type,Object model,Object notification,String text)throws Exception{int count=events.size();capture.getMethod("early",Object.class,Object.class,Object.class,Object.class,String.class,boolean.class,Object.class).invoke(null,null,type,model,notification,text,false,null);check(events.size()==count+1,"Early capture missing");}
    private Bundle last(){check(!events.isEmpty(),"No captured event");return events.get(events.size()-1);}
    private JSONObject row(Object type,Bundle event)throws Exception{return new JSONObject().put("member",name(type)).put("operation",event.getString("operation")).put("message",event.getString("message")).put("language_tag",event.getString("language_tag")).put("native_type",event.getString("native_type")).put("native_subtype",event.getString("native_subtype")).put("capture_path",event.getString("capture_path"));}
    private int resource(String name)throws Exception{
        int id=0;try{id=Class.forName("nl.flitsmeister.R$string").getField(name).getInt(null);}catch(ReflectiveOperationException ignored){}
        if(id==0)id=context.getResources().getIdentifier(name,"string",context.getPackageName());check(id!=0,"Missing original resource: "+name);return id;
    }
    private static Object[] values(String name)throws Exception{return Class.forName(name).getEnumConstants();}
    private static String name(Object value){return ((Enum<?>)value).name();}
    private static Object call(Object object,String name,Object... args)throws Exception{
        for(Method method:object.getClass().getMethods())if(method.getName().equals(name)&&method.getParameterTypes().length==args.length){
            Class<?>[] parameters=method.getParameterTypes();boolean fits=true;for(int i=0;i<parameters.length;i++)if(args[i]!=null&&!parameters[i].isInstance(args[i])&&!(parameters[i]==int.class&&args[i] instanceof Integer)){fits=false;break;}
            if(fits)return method.invoke(object,args);
        }
        throw new NoSuchMethodException(object.getClass().getName()+"."+name);
    }
    private static void check(boolean value,String message){if(!value)throw new IllegalStateException(message);}
}
