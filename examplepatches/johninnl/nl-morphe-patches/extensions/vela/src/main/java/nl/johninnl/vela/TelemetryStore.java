package nl.johninnl.vela;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** Provider observations, never UI or GPS positions. Call from one serialized owner. */
public final class TelemetryStore {
    public static final String WAZE="com.waze", FLITSMEISTER="nl.flitsmeister";
    public static final long SPEED_AGE=5000, ROAD_AGE=30000, ZONE_AGE=90000, ADVERTISEMENT_AGE=10000;
    private final Map<String,Peer> peers=new HashMap<>();
    private String selected="";

    public static boolean supported(String source) { return WAZE.equals(source)||FLITSMEISTER.equals(source); }
    public synchronized void select(String source) { selected=supported(source)?source:""; }
    public synchronized String selected() { return selected; }

    /** authenticatedSource comes from framework sender identity on API34+, never from a second extra. */
    public synchronized boolean accept(Map<String,Object> payload,String authenticatedSource,long now) {
        if(payload==null)return false;
        String source=text(payload,"source_package",128), session=text(payload,"publisher_session_id",128);
        long sent=number(payload,"sent_elapsed_ms",-1),sequence=number(payload,"sequence",-1);
        if(!supported(source)||!source.equals(authenticatedSource)||session==null||session.isEmpty()||
                number(payload,"schema_version",-1)!=1||sequence<1||sent<0||sent>now||now-sent>15000)return false;
        Peer old=peers.get(source);
        if(old!=null&&(sent<old.sent||(session.equals(old.session)&&sequence<=old.sequence)))return false;
        peers.put(source,new Peer(payload,session,sequence,sent));
        return true;
    }

    public synchronized View view(long now) {
        Peer peer=peers.get(selected);
        if(peer==null||!peer.live(now))return View.empty(selected);
        Double speed=peer.speedFresh(now)?peer.speed:null;
        Double limit=peer.limitFresh(now)?peer.limit:null;
        boolean zone=peer.zoneFresh(now);
        return new View(selected,speed,limit,zone?peer.zoneId:"",zone?peer.zoneSession:-1,
                zone?peer.remaining:-1,zone?peer.progress:null,zone?peer.average:null,
                zone&&peer.averagePartial,zone&&peer.progressEstimated,zone,
                speed!=null||limit!=null||zone||peer.approachFresh(now)||!peer.freshAlerts(now).isEmpty(),
                peer.freshAlerts(now), !zone&&peer.approachFresh(now)?peer.approachId:"",
                !zone&&peer.approachFresh(now)?peer.approachDistance:null, peer.approachEstimated);
    }

    /** Mask effective native behavior; never write the user's saved Flock preferences. */
    public synchronized boolean suppressNativeFlock(long now) {
        if(selected.isEmpty())return false;
        for(Peer p:peers.values())if(p.live(now)&&p.usable(now))return true;
        return false;
    }

    private static boolean fresh(long at,long maxAge,long now) { return maxAge>0&&at>=0&&now>=at&&now-at<=maxAge; }
    private static long ttl(Map<String,Object> p,String key,long cap) {
        long value=number(p,key,cap);return value>0?Math.min(cap,value):0;
    }
    private static String text(Map<String,Object> p,String key,int max) {
        Object v=p.get(key);return v instanceof String&&((String)v).length()<=max?(String)v:null;
    }
    private static long number(Map<String,Object> p,String key,long fallback) {
        Object n=p.get(key);return n instanceof Long||n instanceof Integer?((Number)n).longValue():fallback;
    }
    private static Double scalar(Map<String,Object> p,String key,double minimum,double maximum) {
        Object v=p.get(key);if(!(v instanceof Number))return null;
        double d=((Number)v).doubleValue();return Double.isFinite(d)&&d>=minimum&&d<=maximum?d:null;
    }
    private static final class Peer {
        final String session,zoneId;
        final long sequence,sent,speedAt,roadAt,zoneAt,speedTtl,roadTtl,zoneTtl,zoneSession;
        final Double speed,limit,progress,average;
        final int remaining;
        final boolean active,averagePartial,progressEstimated;
        final List<RoadAlert> alerts;
        final long alertsAt,alertsTtl,approachAt,approachTtl;
        final String approachId;
        final Integer approachDistance;
        final boolean approachEstimated,approaching;
        Peer(Map<String,Object> p,String session,long sequence,long sent) {
            this.session=session;this.sequence=sequence;this.sent=sent;
            speedAt=number(p,"current_speed_updated_elapsed_ms",-1);
            roadAt=number(p,"road_updated_elapsed_ms",-1);zoneAt=number(p,"zone_updated_elapsed_ms",-1);
            speedTtl=ttl(p,"current_speed_max_age_ms",SPEED_AGE);roadTtl=ttl(p,"road_max_age_ms",ROAD_AGE);zoneTtl=ttl(p,"zone_max_age_ms",ZONE_AGE);
            speed="valid".equals(p.get("current_speed_status"))&&speedAt<=sent?scalar(p,"current_speed_kmh",0,500):null;
            limit="valid".equals(p.get("road_speed_limit_status"))&&roadAt<=sent?scalar(p,"road_speed_limit_kmh",0.1,500):null;
            String id=text(p,"zone_segment_id",256);zoneId=id==null?"":id;
            zoneSession=number(p,"zone_session",-1);
            long rawRemaining=number(p,"zone_remaining_m",-1);
            remaining=rawRemaining>=0&&rawRemaining<=10000000?(int)rawRemaining:-1;
            progress=scalar(p,"zone_progress_percent",0,100);
            averagePartial=Boolean.TRUE.equals(p.get("zone_average_partial"));
            progressEstimated=!Boolean.FALSE.equals(p.get("zone_progress_estimated"));
            active="active".equals(p.get("zone_status"))&&zoneAt<=sent&&zoneSession>0&&remaining>=0&&progress!=null;
            long start=number(p,"zone_observation_start_elapsed_ms",-1), observed=number(p,"zone_observed_distance_m",-1);
            Double avg=scalar(p,"zone_average_speed_kmh",0,500);
            String method=text(p,"zone_average_method",128);
            if(!active||!averagePartial||start<0||start>zoneAt||zoneAt-start<3000||observed<30||avg==null||
                    (method!=null&&!method.equals("observed_distance_over_elapsed_time"))||
                    Math.abs(avg-observed*3600.0/(zoneAt-start))>0.01)avg=null;
            average=avg;
            alertsAt=number(p,"alerts_updated_elapsed_ms",-1);alertsTtl=ttl(p,"alerts_max_age_ms",30000);
            alerts="valid".equals(p.get("alerts_status"))&&alertsAt<=sent?readAlerts(p,sent):Collections.emptyList();
            approachAt=number(p,"zone_approach_updated_elapsed_ms",-1);approachTtl=ttl(p,"zone_approach_max_age_ms",30000);
            String approach=text(p,"zone_approach_id",256);approachId=approach==null?"":approach;
            long distance=number(p,"zone_approach_distance_m",-1);
            approachDistance=distance>=0&&distance<=10000000?(int)distance:null;
            approachEstimated=!Boolean.FALSE.equals(p.get("zone_approach_distance_estimated"));
            approaching="ahead".equals(p.get("zone_approach_status"))&&approachAt<=sent&&!approachId.isEmpty()&&approachDistance!=null;
        }
        boolean live(long now) { return fresh(sent,ADVERTISEMENT_AGE,now); }
        boolean speedFresh(long now) { return speed!=null&&fresh(speedAt,speedTtl,now); }
        boolean limitFresh(long now) { return limit!=null&&fresh(roadAt,roadTtl,now); }
        boolean zoneFresh(long now) { return active&&fresh(zoneAt,zoneTtl,now); }
        boolean approachFresh(long now) { return approaching&&fresh(approachAt,approachTtl,now); }
        List<RoadAlert> freshAlerts(long now) {
            if(!fresh(alertsAt,alertsTtl,now))return Collections.emptyList();
            List<RoadAlert> result=new ArrayList<>();for(RoadAlert a:alerts)if(fresh(a.observedAt,alertsTtl,now))result.add(a);
            return Collections.unmodifiableList(result);
        }
        boolean usable(long now) { return speedFresh(now)||limitFresh(now)||zoneFresh(now)||approachFresh(now)||!freshAlerts(now).isEmpty(); }
    }

    private static final Set<String> ALERT_KINDS=new HashSet<>(Arrays.asList("camera","mobile_camera","police","crash","jam","hazard","closure","flock","average_speed_zone"));
    private static List<RoadAlert> readAlerts(Map<String,Object> p,long sent) {
        Object ids=p.get("alert_ids"),kinds=p.get("alert_kinds"),titles=p.get("alert_titles"),dist=p.get("alert_distance_m"),trigger=p.get("alert_trigger_m"),lat=p.get("alert_latitude"),lon=p.get("alert_longitude"),times=p.get("alert_updated_elapsed_ms");
        if(!(ids instanceof String[])||!(kinds instanceof String[])||!(titles instanceof String[])||!(dist instanceof int[])||!(trigger instanceof int[])||!(lat instanceof double[])||!(lon instanceof double[])||!(times instanceof long[]))return Collections.emptyList();
        int size=((String[])ids).length;
        if(size>512||((String[])kinds).length!=size||((String[])titles).length!=size||((int[])dist).length!=size||((int[])trigger).length!=size||((double[])lat).length!=size||((double[])lon).length!=size||((long[])times).length!=size)return Collections.emptyList();
        List<RoadAlert> result=new ArrayList<>();Set<String> unique=new HashSet<>();
        for(int i=0;i<size;i++) {
            String id=((String[])ids)[i],kind=((String[])kinds)[i],title=((String[])titles)[i];
            int distance=((int[])dist)[i],threshold=((int[])trigger)[i];double latitude=((double[])lat)[i],longitude=((double[])lon)[i];long at=((long[])times)[i];
            boolean position=Double.isFinite(latitude)&&Double.isFinite(longitude)&&Math.abs(latitude)<=90&&Math.abs(longitude)<=180;
            if(id==null||id.isEmpty()||id.length()>256||!ALERT_KINDS.contains(kind)||at<0||at>sent||distance< -1||distance>10000000||threshold< -1||threshold>10000000||(!position&&distance<0)||!unique.add(kind+":"+id))continue;
            result.add(new RoadAlert(id,kind,title==null?"":title.substring(0,Math.min(240,title.length())),distance,threshold,position?latitude:Double.NaN,position?longitude:Double.NaN,at));
        }
        return Collections.unmodifiableList(result);
    }
    public static final class RoadAlert {
        public final String id,kind,title;
        public final int distanceMeters,triggerMeters;
        public final double latitude,longitude;
        public final long observedAt;
        RoadAlert(String id,String kind,String title,int distance,int trigger,double latitude,double longitude,long at) {
            this.id=id;this.kind=kind;this.title=title;distanceMeters=distance;triggerMeters=trigger;this.latitude=latitude;this.longitude=longitude;observedAt=at;
        }
    }

    public static final class View {
        public final String provider,zoneId,approachId;
        public final Integer approachDistanceMeters;
        public final boolean approachEstimated;
        public final List<RoadAlert> alerts;
        public final long zoneSession;
        public final Double currentKmh,limitKmh,progressPercent,averageKmh;
        public final int remainingMeters;
        public final boolean partialAverage,progressEstimated,zoneActive,external;
        private View(String provider,Double currentKmh,Double limitKmh,String zoneId,long zoneSession,
                int remaining,Double progress,Double average,boolean partial,boolean estimated,boolean active,boolean external,List<RoadAlert> alerts,String approachId,Integer approachDistance,boolean approachEstimated) {
            this.alerts=alerts;this.approachId=approachId;approachDistanceMeters=approachDistance;this.approachEstimated=approachEstimated;
            this.provider=provider;this.currentKmh=currentKmh;this.limitKmh=limitKmh;this.zoneId=zoneId;this.zoneSession=zoneSession;
            remainingMeters=remaining;progressPercent=progress;averageKmh=average;partialAverage=partial;progressEstimated=estimated;zoneActive=active;this.external=external;
        }
        static View empty(String provider) { return new View(provider,null,null,"",-1,-1,null,null,false,false,false,false,Collections.emptyList(),"",null,false); }
    }
}
