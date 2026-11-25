package nl.johninnl.flitsmeister;

import android.location.Location;
import android.os.Bundle;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;

/** Correlates native response geometry to its request fix; never publishes or authorizes a warning. */
final class EarlyWarningGeometry {
    private static final int MAX=128;
    private static final Map<Object,Request> requests=new WeakHashMap<>();
    private static final Map<Object,Fact> models=new WeakHashMap<>();
    private static final ThreadLocal<Response> response=new ThreadLocal<>(),parsing=new ThreadLocal<>();
    private static final class Request {
        final Location fix;final long created;
        Request(Location fix){this.fix=new Location(fix);created=SystemClock.elapsedRealtime();}
    }
    private static final class Response {
        final Request request;final WeakReference<Object> json;
        Response(Request request,Object json){this.request=request;this.json=new WeakReference<>(json);}
    }
    private static final class Fact {
        final Request request;final double distance,maximum,heading,latitude,longitude;final boolean position;
        Fact(Request request,JSONObject json){
            this.request=request;distance=json.optDouble("distance",Double.NaN);maximum=json.optDouble("max_distance",Double.NaN);heading=json.optDouble("heading",Double.NaN);
            position=json.has("latitude")&&json.has("longitude")&&!json.isNull("latitude")&&!json.isNull("longitude");
            latitude=position?json.optDouble("latitude",Double.NaN):Double.NaN;longitude=position?json.optDouble("longitude",Double.NaN):Double.NaN;
        }
    }
    static synchronized void request(Object task,Location fix){
        if(task==null)return;requests.remove(task);if(fix==null)return;
        long now=SystemClock.elapsedRealtime();requests.entrySet().removeIf(e->now-e.getValue().created>30000);
        if(requests.size()>=MAX)requests.remove(requests.keySet().iterator().next());requests.put(task,new Request(fix));
    }
    static synchronized void response(Object task,Object json){
        response.remove();parsing.remove();Request request=requests.remove(task);
        if(request!=null&&json instanceof JSONObject)response.set(new Response(request,json));
    }
    static void parsing(Object json){
        parsing.remove();Response current=response.get();if(current!=null&&current.json.get()==json)parsing.set(current);
    }
    static synchronized void parsed(Object model){
        Response current=parsing.get();parsing.remove();if(current==null||model==null)return;
        Object raw=current.json.get();if(!(raw instanceof JSONObject))return;JSONObject json=(JSONObject)raw;
        if(!json.has("type")||json.isNull("type"))return;
        try{
            Fact fact=new Fact(current.request,json);
            // Retain presence even for a partial native parser result. It must not
            // promote the model's default/half-parsed coordinates into a target.
            if(models.size()>=MAX)models.remove(models.keySet().iterator().next());models.put(model,fact);
        }catch(RuntimeException invalid){/* A missing correlation has no canonical request geometry. */}
    }
    static void finished(){response.remove();parsing.remove();}
    static synchronized void append(Bundle fields,Object model,Object distance,Object maximum,Object heading,long now){
        Fact fact=models.get(model);if(fact==null)return;
        boolean fixedPoint=fields.getBoolean("native_point_target",false);
        for(String key:new String[]{"latitude","longitude","position_observed_elapsed_ms","position_estimated","position_clock_origin","native_point_target"})fields.remove(key);
        Location fix=fact.request.fix;long at=fix.getElapsedRealtimeNanos()/1000000;
        boolean usable=at>0&&at<=now&&now-at<=30000&&fix.hasAccuracy()&&Float.isFinite(fix.getAccuracy())&&fix.getAccuracy()>=0&&fix.getAccuracy()<=50
                &&finite(fix.getLatitude(),-90,90)&&finite(fix.getLongitude(),-180,180)
                &&Float.isFinite(fix.getBearing())&&Float.isFinite(fix.getSpeed())
                &&finite(fact.distance,0,1000000)&&finite(fact.maximum,0,1000000)&&finite(fact.heading,0,360);
        double nativeDistance=distance instanceof Number?((Number)distance).doubleValue():Double.NaN;
        double nativeMaximum=maximum instanceof Number?((Number)maximum).doubleValue():Double.NaN;
        double nativeHeading=heading instanceof Number?((Number)heading).doubleValue():Double.NaN;
        usable&=finite(nativeDistance,0,1000000)&&Math.abs(nativeDistance-fact.distance)<=25&&Double.compare(nativeMaximum,fact.maximum)==0
                &&finite(nativeHeading,0,360)&&Math.abs(nativeHeading-fact.heading)<1.01;
        if(!usable){fields.putString("native_early_geometry_status","unverified_request_or_model");return;}
        fields.putInt("distance_m",(int)Math.round(nativeDistance));fields.putLong("distance_observed_elapsed_ms",at);fields.putBoolean("distance_estimated",false);
        int range=(int)Math.round(nativeMaximum);
        if(range>0){fields.putInt("range_m",range);fields.putLong("range_observed_elapsed_ms",at);fields.putBoolean("range_estimated",false);fields.putString("range_origin","native_ui_max_distance");}
        fields.putString("geometry_clock_origin","native_response_request_fix");fields.putString("native_early_geometry_status",now-at<=5000?"fresh":"stale");
        if(fact.position&&finite(fact.latitude,-90,90)&&finite(fact.longitude,-180,180)){
            fields.putDouble("latitude",fact.latitude);fields.putDouble("longitude",fact.longitude);fields.putLong("position_observed_elapsed_ms",at);fields.putBoolean("position_estimated",false);fields.putString("position_clock_origin","native_response_request_fix");
            if(fixedPoint)fields.putBoolean("native_point_target",true);
            // Heading may describe vehicle orientation. Derive physical relative
            // position from the supplied coordinates instead of treating it as Behind.
            Location target=new Location("native-early-target");target.setLatitude(fact.latitude);target.setLongitude(fact.longitude);
            double separation=fix.distanceTo(target),bearing=fix.bearingTo(target);
            boolean ownBearing=fix.hasBearing()&&Float.isFinite(fix.getBearing())&&(!fix.hasBearingAccuracy()
                ||Float.isFinite(fix.getBearingAccuracyDegrees())&&fix.getBearingAccuracyDegrees()>=0&&fix.getBearingAccuracyDegrees()<=30);
            if(ownBearing&&Double.isFinite(bearing)&&separation>Math.max(10,fix.getAccuracy()*2)&&Math.abs(separation-fact.distance)<=Math.max(50,fix.getAccuracy()*2)){
                double relative=((bearing-fix.getBearing())%360+360)%360;
                fields.putDouble("relative_bearing_degrees",relative);fields.putLong("relationship_observed_elapsed_ms",at);fields.putBoolean("relationship_estimated",true);fields.putString("relationship_origin","source_request_coordinates");
                if(fields.getString("category","").equals("emergency_vehicle"))fields.putString("relationship",relative>=135&&relative<=225?"behind":relative<=45||relative>=315?"ahead":"unknown");
            }
        }
    }
    private static boolean finite(double value,double minimum,double maximum){return Double.isFinite(value)&&value>=minimum&&value<=maximum;}
    static synchronized void clear(){requests.clear();models.clear();finished();}
}
