package nl.johninnl.velaprobe;

import android.content.Intent;
import android.os.SystemClock;
import android.os.Bundle;
import java.util.List;
import java.lang.reflect.Field;

/** Waze 5.26.90.901 native callbacks, with no synthetic external navigation broadcasts. */
public final class WazeProbe extends NativeProbe {
    Object location,insights,alerter,navigation;
    Class<?> locationType,insightsType,alerterType,navigationType;
    int diagnosticPosition=Integer.MIN_VALUE,diagnosticReportsPosition=Integer.MIN_VALUE;
    boolean diagnosticReportsEmpty;
    String provider(){return "com.waze";}
    String version(){return "5.26.90.901";}
    String[] expectedKinds(){return new String[]{"camera","police","hazard","crash","jam","closure"};}
    void feature(String key,boolean value)throws Exception {
        declared(null,type("org.ungoogled.waze.Customization"),"setForTest",new Class<?>[]{String.class,boolean.class},key,value);
    }
    Object service(Class<?> cls)throws Exception{return type("kotlinx.coroutines.a.ab").getMethod("l",Class.class).invoke(null,cls);}
    @Override void prepare()throws Exception {
        feedClass="org.ungoogled.waze.NavigationBroadcasts";
        launchedActivity=startActivitySync(new Intent().setClassName(provider(),"com.waze.FreeMapAppActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        Class<?> manager=type("com.waze.NativeManager");long deadline=SystemClock.elapsedRealtime()+60000;
        while(!(Boolean)manager.getMethod("isAppStarted").invoke(null)) {
            if(SystemClock.elapsedRealtime()>deadline)throw new AssertionError("Waze native startup timeout");SystemClock.sleep(100);
        }
        locationType=type("com.waze.location.LocationSensorListener");
        Field singleton=locationType.getDeclaredField("mInstance");singleton.setAccessible(true);location=singleton.get(null);
        if(location==null)for(String key:new String[]{"com.waze.location.x","com.waze.location.bp","com.waze.location.LocationSensorListener"}){
            try{location=service(type(key));if(locationType.isInstance(location))break;}catch(ReflectiveOperationException ignored){}
        }
        check(locationType.isInstance(location),"actual Waze speedometer producer resolved");
        insightsType=type("com.waze.insights_infra.InsightsInfraNativeManager");insights=service(insightsType);
        alerterType=type("com.waze.alerters.AlerterNativeManager");alerter=service(alerterType);
        navigationType=type("com.waze.navigate.NavigationInfoNativeManager");navigation=navigationType.getMethod("a").invoke(null);
        main(()->{feature("zoneBar",false);feature("shareAlerts",false);feature("flockCameras",false);feature("speedCameras",false);feature("navigationBroadcasts",true);});
        check((Boolean)declared(null,type("org.ungoogled.waze.Customization"),"on",new Class<?>[]{String.class},"stayAwake"),"native background keep-alive enabled by exporter");
    }
    /** Stop the audited concrete device listener only after the Activity's background transition.
     * com.waze.cm.a.a.stop removes Android location updates before stopping sensors/watchdog.
     * Native fixture callbacks below still run through the real producer methods and exporter hooks. */
    @Override void background() throws Exception {
        super.background();
        main(()->{
            check("com.waze.cm.a.a".equals(location.getClass().getName()),"audited concrete Waze device listener");
            call(location,"stop",new Class<?>[]{});
            check(!Boolean.TRUE.equals(field(location,"mStarted")),"native device location updates quiesced after background");
        });
        // Drain callbacks already in the Android/native queues; never assert immediately after a fixture write.
        SystemClock.sleep(SAMPLE_MS);
        main(()->check(!Boolean.TRUE.equals(field(location,"mStarted")),"native device listener remains stopped after callback drain"));
    }
    @Override void assertPhase(String name) throws Exception {
        check(!Boolean.TRUE.equals(field(location,"mStarted")),"native device listener stayed quiesced during "+name);
        Intent observed=snapshot();
        diagnostic(name+"-before-assert",observed);
        if(name.equals("approach")||name.equals("active")||name.equals("alerts")||name.equals("clear")) {
            double expected=name.equals("clear")?0d:72d;
            double speed=observed.getDoubleExtra("current_speed_kmh",Double.NaN);
            double limit=observed.getDoubleExtra("road_speed_limit_kmh",Double.NaN);
            check("valid".equals(observed.getStringExtra("current_speed_status"))&&Math.abs(speed-expected)<.000001,
                    "native fixture current exactly "+expected+" km/h after hold (actual "+speed+")");
            check("valid".equals(observed.getStringExtra("road_speed_limit_status"))&&Math.abs(limit-50d)<.000001,
                    "native fixture effective limit exactly 50 km/h after hold (actual "+limit+")");
        }
        if(name.equals("approach")) {
            check("vela-public-davis-zone".equals(observed.getStringExtra("zone_approach_id"))&&
                    observed.getIntExtra("zone_approach_distance_m",-1)==450,"native fixture approach identity and 450m distance retained");
        } else if(name.equals("active")) {
            check("vela-public-davis-zone".equals(observed.getStringExtra("zone_segment_id")),"native fixture active-zone identity retained");
        }
        if(name.equals("approach")||name.equals("active")||name.equals("alerts")) {
            String[] ids=observed.getStringArrayExtra("alert_ids");
            check(ids!=null&&java.util.Arrays.asList(ids).containsAll(java.util.Arrays.asList(
                    "vela-public-road-10","vela-public-road-1","vela-public-road-5",
                    "vela-public-road-2","vela-public-road-3","vela-public-road-12")),
                    "native fixture report identities retained after hold");
        }
        // Base emits VELA_PROBE_VERIFIED only after the exact values and identities passed above.
        super.assertPhase(name);
    }
    /** Check callback-return semantics without claiming that a native JNI route stays in the fixture zone. */
    @Override void callbacks() throws Exception {
        phase("callbacks-approach");
        main(()->{approach();assertCallback("approach",snapshot());});
        phase("callbacks-within");
        main(()->{active(0);assertCallback("within",snapshot());});
        phase("callbacks-clear");
        main(()->{clear();assertCallback("clear",snapshot());});
    }
    void assertCallback(String stage,Intent observed) {
        diagnostic("callbacks-"+stage+"-return",observed);
        double expected=stage.equals("clear")?0d:72d;
        check("valid".equals(observed.getStringExtra("current_speed_status"))&&
                Math.abs(observed.getDoubleExtra("current_speed_kmh",Double.NaN)-expected)<.000001,
                "callback "+stage+" current exactly "+expected+" km/h");
        check("valid".equals(observed.getStringExtra("road_speed_limit_status"))&&
                Math.abs(observed.getDoubleExtra("road_speed_limit_kmh",Double.NaN)-50d)<.000001,
                "callback "+stage+" effective limit exactly 50 km/h");
        if(stage.equals("approach")) {
            check("ahead".equals(observed.getStringExtra("zone_approach_status"))&&
                    "vela-public-davis-zone".equals(observed.getStringExtra("zone_approach_id"))&&
                    observed.getIntExtra("zone_approach_distance_m",-1)==450,"callback approach id and 450m distance");
            check(!"active".equals(observed.getStringExtra("zone_status"))&&!observed.hasExtra("zone_average_speed_kmh"),
                    "callback approach has no active average");
        } else if(stage.equals("within")) {
            check("active".equals(observed.getStringExtra("zone_status"))&&
                    "vela-public-davis-zone".equals(observed.getStringExtra("zone_segment_id")),"callback within active fixture id");
            check("inactive".equals(observed.getStringExtra("zone_approach_status")),"callback within ends approach");
            check(observed.getBooleanExtra("zone_average_partial",false)&&!observed.hasExtra("zone_average_speed_kmh")&&
                    observed.getIntExtra("zone_observed_distance_m",-1)==0,
                    "callback first within observation leaves partial average pending");
        } else {
            check("inactive".equals(observed.getStringExtra("zone_status"))&&
                    "inactive".equals(observed.getStringExtra("zone_approach_status")),"callback native empty update clears zone and approach");
            check(!observed.hasExtra("zone_average_speed_kmh"),"callback clear removes observed average");
        }
        String[] ids=observed.getStringArrayExtra("alert_ids");
        if(stage.equals("clear"))check(ids!=null&&ids.length==0,"callback native empty repository clears reports");
        else {
            check(ids!=null&&java.util.Arrays.asList(ids).containsAll(java.util.Arrays.asList(
                    "vela-public-road-10","vela-public-road-1","vela-public-road-5",
                    "vela-public-road-2","vela-public-road-3","vela-public-road-12")),"callback fixture report identities exported");
            String[] kinds=observed.getStringArrayExtra("alert_kinds");
            check(kinds!=null&&java.util.Arrays.asList(kinds).containsAll(java.util.Arrays.asList(expectedKinds())),"callback native report kinds exported");
        }
        Bundle row=new Bundle();row.putString("provider",provider());row.putString("phase","callbacks-"+stage+"-verified");
        row.putString("verification_scope","immediate-native-callback");row.putBoolean("held",false);
        row.putString("approach_status",observed.getStringExtra("zone_approach_status"));
        row.putString("zone_status",observed.getStringExtra("zone_status"));
        row.putBoolean("average_pending",stage.equals("within"));
        row.putDouble("current_speed_kmh",observed.getDoubleExtra("current_speed_kmh",Double.NaN));
        row.putDouble("road_speed_limit_kmh",observed.getDoubleExtra("road_speed_limit_kmh",Double.NaN));
        String line="VELA_PROBE_VERIFIED_CALLBACKS "+provider()+" "+stage+" scope=immediate-native-callback held=false\n";
        row.putString("stream",line);sendStatus(0,row);evidence.append(line);
    }
    String fixtureId(String id) {
        return id==null?"<absent>":id.isEmpty()?"":id.startsWith("vela-public-")?id:"<non-fixture>";
    }
    void diagnostic(String stage,Intent value) {
        String[] original=value.getStringArrayExtra("alert_ids"),ids=null;
        if(original!=null){ids=new String[original.length];for(int i=0;i<ids.length;i++)ids[i]=fixtureId(original[i]);}
        Bundle row=new Bundle();row.putString("provider",provider());row.putString("phase",stage);
        row.putString("approach_status",value.getStringExtra("zone_approach_status"));
        row.putString("approach_id",fixtureId(value.getStringExtra("zone_approach_id")));
        row.putInt("approach_distance_m",value.getIntExtra("zone_approach_distance_m",-1));
        row.putLong("approach_observed_ms",value.getLongExtra("zone_approach_updated_elapsed_ms",-1));
        row.putString("zone_status",value.getStringExtra("zone_status"));
        row.putString("zone_id",fixtureId(value.getStringExtra("zone_segment_id")));
        row.putString("alerts_status",value.getStringExtra("alerts_status"));row.putStringArray("alert_ids",ids);
        row.putDouble("current_speed_kmh",value.getDoubleExtra("current_speed_kmh",Double.NaN));
        row.putDouble("road_speed_limit_kmh",value.getDoubleExtra("road_speed_limit_kmh",Double.NaN));
        row.putLong("elapsed_ms",SystemClock.elapsedRealtime());
        String line="WAZE_PROBE_DIAGNOSTIC "+stage+" approach="+row.getString("approach_status")+
                "/"+row.getString("approach_id")+"/"+row.getInt("approach_distance_m")+
                " zone="+row.getString("zone_status")+"/"+row.getString("zone_id")+
                " alerts="+row.getString("alerts_status")+"/"+java.util.Arrays.toString(ids)+"\n";
        row.putString("stream",line);sendStatus(0,row);evidence.append(line);
    }
    Object builder(String cls)throws Exception{return type(cls).getMethod("newBuilder").invoke(null);}
    Object build(Object builder)throws Exception{return call(builder,"build",new Class<?>[]{});}
    void set(Object builder,String name,Class<?> parameter,Object value)throws Exception{call(builder,name,new Class<?>[]{parameter},value);}
    Object insightUpdate(int position,int remaining)throws Exception {
        String prefix="com.waze.jni.protos.insights_infra.";
        Object update=builder(prefix+"SegmentInsightUpdate");
        if(position>=0){
            Object id=builder(prefix+"SegmentInsightInfo$Id");set(id,"setSegmentTypeValue",int.class,7);set(id,"setSegmentId",String.class,"vela-public-davis-zone");
            Object info=builder(prefix+"SegmentInsightInfo");set(info,"setId",type(prefix+"SegmentInsightInfo$Id"),build(id));
            set(info,"setPositionRelativeToSegmentValue",int.class,position);set(info,"setRemainingDistanceMeters",int.class,remaining);
            set(update,"addInfo",type(prefix+"SegmentInsightInfo"),build(info));
        }
        return build(update);
    }
    void zone(int position,int remaining)throws Exception {
        Object update=insightUpdate(position,remaining);
        List<?> info=(List<?>)call(update,"getInfoList",new Class<?>[]{});
        check(info.size()==(position>=0?1:0),"native insight protobuf fixture item count");
        if(position>=0){
            Object item=info.get(0),id=call(item,"getId",new Class<?>[]{});
            check(((Integer)call(id,"getSegmentTypeValue",new Class<?>[]{}))==7&&
                    "vela-public-davis-zone".equals(call(id,"getSegmentId",new Class<?>[]{}))&&
                    ((Integer)call(item,"getPositionRelativeToSegmentValue",new Class<?>[]{}))==position&&
                    ((Integer)call(item,"getRemainingDistanceMeters",new Class<?>[]{}))==remaining,
                    "native insight protobuf fixture type/id/position/distance");
        }
        declared(insights,insightsType,"c",new Class<?>[]{type("com.waze.jni.protos.insights_infra.SegmentInsightUpdate")},update);
        if(position!=diagnosticPosition){diagnosticPosition=position;diagnostic("native-insights-c-return-"+position,snapshot());}
    }
    void speed(double current)throws Exception {
        declared(location,locationType,"updateSpeedometer",new Class<?>[]{int.class,String.class,int.class,double.class},0,"km/h",50,current);
    }
    Object repository(boolean empty)throws Exception {
        String prefix="com.waze.jni.protos.alerters.";Object update=builder(prefix+"NativeAlertRepositoryUpdate");
        int[] types={10,1,5,2,3,12};String[] titles={"TEST static camera","TEST police","TEST road hazard","TEST crash","TEST traffic jam","TEST road closure"};
        if(!empty)for(int i=0;i<types.length;i++){
            Object position=builder("com.waze.jni.protos.Position$IntPosition");
            set(position,"setLatitude",int.class,(int)Math.round(LATITUDE*1e6));set(position,"setLongitude",int.class,(int)Math.round((START_LONGITUDE+0.004+i*0.0002)*1e6));
            Object info=builder(prefix+"AlerterInfo");set(info,"setTypeValue",int.class,types[i]);set(info,"setSubType",int.class,0);
            set(info,"setTitle",String.class,titles[i]);set(info,"setDescription",String.class,"Public road test fixture");
            set(info,"setPosition",type("com.waze.jni.protos.Position$IntPosition"),build(position));set(info,"setReportId",int.class,760000+i);
            Object id=builder(prefix+"AlerterId");set(id,"setUniqueId",String.class,"vela-public-road-"+types[i]);
            Object descriptor=builder(prefix+"NativeAlertDescriptor");set(descriptor,"setInfo",type(prefix+"AlerterInfo"),build(info));
            set(descriptor,"setAlertId",type(prefix+"AlerterId"),build(id));set(descriptor,"setTriggerDistanceMeters",int.class,600);
            set(update,"addDescriptors",type(prefix+"NativeAlertDescriptor"),build(descriptor));
        }
        return build(update);
    }
    void reports(boolean empty)throws Exception {
        declared(alerter,alerterType,"b",new Class<?>[]{type("com.waze.jni.protos.alerters.NativeAlertRepositoryUpdate")},repository(empty));
        if(diagnosticReportsPosition!=diagnosticPosition||diagnosticReportsEmpty!=empty){
            diagnosticReportsPosition=diagnosticPosition;diagnosticReportsEmpty=empty;
            diagnostic("native-alerter-b-return-empty-"+empty,snapshot());
        }
    }
    @Override void approach()throws Exception{speed(72);zone(0,450);reports(false);}
    @Override void active(int sample)throws Exception{speed(72);zone(1,Math.max(50,1500-sample*44));reports(false);}
    @Override void alertsOnly()throws Exception{speed(72);zone(-1,0);declared(navigation,navigationType,"h",new Class<?>[]{});reports(false);}
    @Override void clear()throws Exception{speed(0);zone(-1,0);declared(navigation,navigationType,"h",new Class<?>[]{});reports(true);}
    @Override void stopProducer()throws Exception{feature("navigationBroadcasts",false);}
}
