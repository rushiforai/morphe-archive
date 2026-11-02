package nl.johninnl.vela;

import java.util.LinkedHashMap;
import java.util.Map;

/** Uses native approach distances or Vela's fresh position on its route, with heading fallback. */
public final class RoadWarningEngine {
    private final Map<String,Long> announced=new LinkedHashMap<>();
    private long lastVoice=-45000;
    public static final class Fix {
        public final double latitude,longitude,bearing,speedMps;
        public final long at;
        public Fix(double latitude,double longitude,double bearing,double speedMps,long at) {this.latitude=latitude;this.longitude=longitude;this.bearing=bearing;this.speedMps=speedMps;this.at=at;}
    }
    /** Snapshot of Vela's directed route; caller changes to the input arrays cannot alter it. */
    public static final class Route {
        private final double[] latitudes,longitudes,along;
        private final Map<Coordinate,Projection> targets=new LinkedHashMap<>();
        public Route(double[] latitudes,double[] longitudes) {
            boolean valid=latitudes!=null&&longitudes!=null&&latitudes.length==longitudes.length&&latitudes.length>=2;
            if(valid)for(int i=0;i<latitudes.length;i++)if(!position(latitudes[i],longitudes[i])){valid=false;break;}
            this.latitudes=valid?latitudes.clone():new double[0];
            this.longitudes=valid?longitudes.clone():new double[0];
            along=new double[this.latitudes.length];
            for(int i=1;i<along.length;i++)along[i]=along[i-1]+distance(this.latitudes[i-1],this.longitudes[i-1],this.latitudes[i],this.longitudes[i]);
        }
        private Projection project(double latitude,double longitude) {
            if(!position(latitude,longitude))return null;
            double scale=6371000*Math.PI/180,cos=Math.cos(Math.toRadians(latitude));
            double nearest=Double.POSITIVE_INFINITY,progress=0;
            for(int i=1;i<latitudes.length;i++) {
                double length=along[i]-along[i-1];if(length<=0)continue;
                double x1=longitudeDifference(longitudes[i-1],longitude)*scale*cos,y1=(latitudes[i-1]-latitude)*scale;
                double x2=longitudeDifference(longitudes[i],longitude)*scale*cos,y2=(latitudes[i]-latitude)*scale;
                double dx=x2-x1,dy=y2-y1,squared=dx*dx+dy*dy;if(squared<=0)continue;
                double fraction=Math.max(0,Math.min(1,-(x1*dx+y1*dy)/squared));
                double lateral=Math.hypot(x1+fraction*dx,y1+fraction*dy);
                if(lateral<nearest){nearest=lateral;progress=along[i-1]+fraction*length;}
            }
            return nearest<=60?new Projection(progress):null;
        }
        private synchronized Projection target(double latitude,double longitude) {
            Coordinate key=new Coordinate(latitude,longitude);
            if(targets.containsKey(key))return targets.get(key);
            Projection result=project(latitude,longitude);
            if(targets.size()>=512)targets.remove(targets.keySet().iterator().next());
            // Cache off-route misses too: unchanged reports must not repeatedly scan a long route.
            targets.put(key,result);return result;
        }
    }
    private static final class Coordinate {
        final long latitude,longitude;
        Coordinate(double latitude,double longitude) {this.latitude=Double.doubleToLongBits(latitude);this.longitude=Double.doubleToLongBits(longitude);}
        @Override public boolean equals(Object other) {if(!(other instanceof Coordinate))return false;Coordinate c=(Coordinate)other;return latitude==c.latitude&&longitude==c.longitude;}
        @Override public int hashCode() {return 31*Long.hashCode(latitude)+Long.hashCode(longitude);}
    }
    private static final class Projection {
        final double along;
        Projection(double along) {this.along=along;}
    }
    public static final class Warning {
        public final String id,kind;
        public final double distanceMeters,leadMeters;
        public final boolean estimated,moving;
        Warning(String id,String kind,double distance,double lead,boolean estimated,boolean moving) {this.id=id;this.kind=kind;distanceMeters=distance;leadMeters=lead;this.estimated=estimated;this.moving=moving;}
    }
    public Warning update(TelemetryStore.View view,Fix fix,long now) {
        return update(view,fix,null,now);
    }
    public Warning update(TelemetryStore.View view,Fix fix,Route route,long now) {
        boolean freshFix=fix!=null&&now>=fix.at&&now-fix.at<=10000&&position(fix.latitude,fix.longitude);
        double speed=view.currentKmh!=null?view.currentKmh/3.6:freshFix?fix.speedMps:0;
        boolean moving=Double.isFinite(speed)&&speed>=2;
        double lead=Math.max(150,Math.min(600,speed*12));
        Projection own=route!=null&&freshFix?route.project(fix.latitude,fix.longitude):null;
        Warning best=null;
        if(!view.zoneActive&&view.approachDistanceMeters!=null&&view.approachDistanceMeters>0&&view.approachDistanceMeters<=2000)
            best=new Warning("zone:"+view.approachId,"average_speed_zone",view.approachDistanceMeters,lead,view.approachEstimated,moving);
        for(TelemetryStore.RoadAlert report:view.alerts) {
            if(view.zoneActive&&report.kind.equals("average_speed_zone"))continue;
            double distance=report.distanceMeters;
            boolean estimated=false;
            if(distance<0) {
                if(!freshFix||!position(report.latitude,report.longitude))continue;
                if(own!=null) {
                    // A visible 2 km route span plus the 60 m allowance at each projected endpoint.
                    if(distance(fix.latitude,fix.longitude,report.latitude,report.longitude)>2120)continue;
                    Projection target=route.target(report.latitude,report.longitude);
                    if(target==null)continue;
                    distance=target.along-own.along;
                } else {
                    if(!Double.isFinite(fix.bearing))continue;
                    distance=distance(fix.latitude,fix.longitude,report.latitude,report.longitude);
                    double direction=bearing(fix.latitude,fix.longitude,report.latitude,report.longitude);
                    double difference=Math.abs((direction-fix.bearing+540)%360-180);
                    if(difference>60)continue;
                }
                estimated=true;
            }
            if(distance<=0||distance>2000)continue;
            if(best==null||distance<best.distanceMeters)best=new Warning(report.kind+":"+report.id,report.kind,distance,report.triggerMeters>0?report.triggerMeters:lead,estimated,moving);
        }
        return best;
    }
    public boolean shouldSpeak(Warning warning,long now) {
        if(warning==null||!warning.moving||warning.distanceMeters>warning.leadMeters||now-lastVoice<8000)return false;
        String key=warning.id;Long previous=announced.get(key);
        if(previous!=null&&now-previous<30*60*1000L)return false;
        announced.put(key,now);lastVoice=now;
        while(announced.size()>256)announced.remove(announced.keySet().iterator().next());
        return true;
    }
    public void reset() { announced.clear();lastVoice=-45000; }
    private static boolean position(double latitude,double longitude) { return Double.isFinite(latitude)&&Double.isFinite(longitude)&&Math.abs(latitude)<=90&&Math.abs(longitude)<=180; }
    private static double longitudeDifference(double longitude,double reference) { return (longitude-reference+540)%360-180; }
    static double distance(double lat1,double lon1,double lat2,double lon2) {
        double a=Math.toRadians(lat2-lat1),b=Math.toRadians(lon2-lon1);
        double h=Math.sin(a/2)*Math.sin(a/2)+Math.cos(Math.toRadians(lat1))*Math.cos(Math.toRadians(lat2))*Math.sin(b/2)*Math.sin(b/2);
        return 6371000*2*Math.atan2(Math.sqrt(Math.min(1,h)),Math.sqrt(Math.max(0,1-h)));
    }
    static double bearing(double lat1,double lon1,double lat2,double lon2) {
        double d=Math.toRadians(lon2-lon1),a=Math.toRadians(lat1),b=Math.toRadians(lat2);
        return (Math.toDegrees(Math.atan2(Math.sin(d)*Math.cos(b),Math.cos(a)*Math.sin(b)-Math.sin(a)*Math.cos(b)*Math.cos(d)))+360)%360;
    }
}
