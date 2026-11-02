package nl.johninnl.velaprobe;

import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/** Flitsmeister 14.17 background native services/tasks and native AppNotificationBus. */
public final class FlitsmeisterProbe extends NativeProbe {
    static final String REPORTS="nl.flitsmeister.fmcore.data.model.reports.";
    Object location,road,zone,report,reportManager;
    double approachOffset=.004;
    String provider(){return "nl.flitsmeister";}
    String version(){return "14.17";}
    String[] expectedKinds(){return new String[]{"camera","mobile_camera","police","hazard","crash","jam","closure"};}
    Object singleton(String cls,String member)throws Exception{
        Object companion=type(cls).getField(member).get(null);return call(companion,"getInstance",new Class<?>[]{Context.class},getTargetContext());
    }
    Location fix(double longitude,Float speed) {
        Location value=new Location("gps");value.setLatitude(LATITUDE);value.setLongitude(longitude);value.setAccuracy(3);value.setBearing(90);
        if(speed!=null)value.setSpeed(speed);value.setTime(System.currentTimeMillis());value.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());return value;
    }
    @Override void prepare()throws Exception{
        approachOffset=Double.parseDouble(option("approach_offset_deg","0.004"));
        if(!Double.isFinite(approachOffset)||approachOffset<=0||approachOffset>.004)
            throw new IllegalArgumentException("approach_offset_deg must be finite, >0 and <=0.004 within the public fixture corridor");
        feedClass="nl.johninnl.flitsmeister.NavigationBroadcasts";
        Intent launch=getTargetContext().getPackageManager().getLaunchIntentForPackage(provider());
        if(launch==null)throw new AssertionError("No Flitsmeister launch Activity");
        launchedActivity=startActivitySync(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));SystemClock.sleep(3500);
        main(()->getTargetContext().startForegroundService(new Intent().setClassName(provider(),"nl.flitsmeister.services.base.FlitsmeisterBaseService")));
        SystemClock.sleep(3500);
        location=singleton("ab0","E1");road=singleton("omf","F1");zone=singleton("fsi","r").getClass().getField("k").get(singleton("fsi","r"));
        check(location!=null&&zone!=null,"actual Flitsmeister location and zone tasks resolved");
        Object platformProvider=location.getClass().getField("q").get(location);
        if(platformProvider!=null)main(()->call(platformProvider,"stop",new Class<?>[]{}));
        Object lazy=field(zone,"a");reportManager=call(lazy,"getValue",new Class<?>[]{});
        check(type("i06").isInstance(reportManager),"native zone report cache resolved");
        main(()->{report=zoneReport();type("r65").getField("b").setInt(null,1);type("hmf").getField("g").setInt(null,50);type("hmf").getField("d").setBoolean(null,false);call(road,"z",new Class<?>[]{});});
    }
    Object zoneReport()throws Exception{
        Object value=type(REPORTS+"AvgSpeedCheck").getConstructor().newInstance();
        List<Object> path=Arrays.asList(type("via").getConstructor(double.class,double.class).newInstance(LATITUDE,START_LONGITUDE),type("via").getConstructor(double.class,double.class).newInstance(LATITUDE,END_LONGITUDE));
        common(value,"vela-public-davis-zone",START_LONGITUDE);
        call(value,"setGpsPath",new Class<?>[]{List.class},path);call(value,"setStartLocation",new Class<?>[]{Location.class},fix(START_LONGITUDE,null));
        call(value,"setEndLocation",new Class<?>[]{Location.class},fix(END_LONGITUDE,null));call(value,"setBearingBetweenPoint1And2",new Class<?>[]{Float.class},90f);
        call(value,"setMaxSpeedDay",new Class<?>[]{Integer.class},50);call(value,"setMaxSpeedNight",new Class<?>[]{Integer.class},50);
        Object part=type(REPORTS+"AvgSpeedCheck$AvgSpeedCheckSegment").getConstructor(int.class,List.class,Integer.class,Integer.class).newInstance(1,path,50,50);
        call(value,"setSegments",new Class<?>[]{List.class},Arrays.asList(part));return value;
    }
    void common(Object value,String id,double longitude)throws Exception{
        call(value,"setId",new Class<?>[]{String.class},id);call(value,"setRoad",new Class<?>[]{String.class},"TEST DAVIS");call(value,"setCountry",new Class<?>[]{int.class},1);
        call(value,"setLocation",new Class<?>[]{Location.class},fix(longitude,null));
    }
    @SuppressWarnings("unchecked") void selectReport()throws Exception {
        List<Object> cache=(List<Object>)field(reportManager,"d");synchronized(cache){cache.clear();cache.add(report);}
        zone.getClass().getField("d").set(zone,report);
    }
    void sample(double longitude)throws Exception{
        Location value=fix(longitude,20f);selectReport();
        type("r65").getField("b").setInt(null,1);type("hmf").getField("g").setInt(null,50);type("hmf").getField("d").setBoolean(null,false);
        call(road,"z",new Class<?>[]{});call(location,"A",new Class<?>[]{Location.class},value);
        call(zone,"c",new Class<?>[]{Location.class,float.class,String.class},value,90f,"TEST DAVIS");
    }
    @SuppressWarnings({"rawtypes","unchecked"}) Object incident(String id,String kind,double longitude)throws Exception{
        Object value=type(REPORTS+"Incident").getConstructor().newInstance();common(value,id,longitude);
        Class enumType=type(REPORTS+"IncidentType");call(value,"setIncidentType",new Class<?>[]{enumType},Enum.valueOf(enumType,kind));return value;
    }
    Object report(String cls,String id,double longitude)throws Exception{
        Object value=type(REPORTS+cls).getConstructor().newInstance();common(value,id,longitude);return value;
    }
    Object alert(Object report)throws Exception{
        Object status=type("nl.flitsmeister.fmcore.models.eventbuses.AlertStatus").getField("ACTIVE").get(null);
        return type("nl.flitsmeister.fmcore.models.eventbuses.AlertedReport").getConstructor(type(REPORTS+"BaseReport"),status.getClass()).newInstance(report,status);
    }
    void reports(boolean empty)throws Exception{
        List<Object> values=new ArrayList<>();
        if(!empty){
            values.add(alert(report("SpeedCam","vela-public-static",START_LONGITUDE+0.004)));
            values.add(alert(report("SpeedTrap","vela-public-mobile",START_LONGITUDE+0.0042)));
            values.add(alert(report("PoliceHotspot","vela-public-police",START_LONGITUDE+0.0044)));
            values.add(alert(incident("vela-public-hazard","SLIPPERY_ROAD",START_LONGITUDE+0.0046)));
            values.add(alert(incident("vela-public-crash","ACCIDENT",START_LONGITUDE+0.0048)));
            values.add(alert(incident("vela-public-jam","HEAVY_TRAFFIC",START_LONGITUDE+0.0050)));
            values.add(alert(incident("vela-public-closure","ROAD_CLOSURE",START_LONGITUDE+0.0052)));
        }
        Object bus=type("nl.flitsmeister.fmcore.models.eventbuses.AppNotificationBus").getMethod("getBusAlertedReports").invoke(null);
        call(bus,"a",new Class<?>[]{Object.class},values);
    }
    void zoneClear()throws Exception{
        List<?> cache=(List<?>)field(reportManager,"d");synchronized(cache){cache.clear();}
        zone.getClass().getField("d").set(zone,null);call(zone,"onStop",new Class<?>[]{});
    }
    @Override void approach()throws Exception{sample(START_LONGITUDE-approachOffset);reports(false);}
    @Override void active(int sample)throws Exception{sample(START_LONGITUDE+0.003+Math.min(sample,25)*0.0005);reports(false);}
    @Override void alertsOnly()throws Exception{zoneClear();call(location,"A",new Class<?>[]{Location.class},fix(START_LONGITUDE+0.003,20f));call(road,"z",new Class<?>[]{});reports(false);}
    @Override void clear()throws Exception{zoneClear();call(location,"A",new Class<?>[]{Location.class},fix(START_LONGITUDE+0.003,0f));call(road,"z",new Class<?>[]{});reports(true);}
    @Override void stopProducer()throws Exception{zoneClear();call(location,"onStop",new Class<?>[]{});getTargetContext().stopService(new Intent().setClassName(provider(),"nl.flitsmeister.services.base.FlitsmeisterBaseService"));}
}
