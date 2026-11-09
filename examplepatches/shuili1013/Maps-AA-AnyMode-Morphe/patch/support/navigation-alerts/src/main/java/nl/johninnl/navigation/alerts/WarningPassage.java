package nl.johninnl.navigation.alerts;

import android.location.Location;

/** Conservative delayed point check. Never infer passage for moving/nonspatial native warnings. */
public final class WarningPassage {
    private WarningPassage(){}
    public enum Relevance { RELEVANT, PASSED, OFF_ROUTE, CONTEXT_UNVERIFIED }
    /** Route checks need a real recent fix; asking for status cannot refresh it. */
    public static boolean freshFix(Location fix,long now){
        if(fix==null||!fix.hasAccuracy()||!Float.isFinite(fix.getAccuracy())||fix.getAccuracy()<0||fix.getAccuracy()>30
                ||!Double.isFinite(fix.getLatitude())||Math.abs(fix.getLatitude())>90||!Double.isFinite(fix.getLongitude())||Math.abs(fix.getLongitude())>180)return false;
        long at=fix.getElapsedRealtimeNanos()/1000000;return at>0&&at<=now&&now-at<=5000;
    }
    public static boolean passed(WarningEvent event,Location fix,long now){
        if(!event.relevance.equals("point_ahead") || event.latitude==null || event.longitude==null || fix==null
                || !fix.hasBearing() || !fix.hasSpeed() || fix.getSpeed()<1.5 || !fix.hasAccuracy() || fix.getAccuracy()>30)return false;
        long at=fix.getElapsedRealtimeNanos()/1000000;
        if(at<=0 || at>now || now-at>5000 || !Double.isFinite(fix.getLatitude()) || !Double.isFinite(fix.getLongitude())
                || !Float.isFinite(fix.getBearing()) || fix.hasBearingAccuracy() && fix.getBearingAccuracyDegrees()>30)return false;
        double north=Math.toRadians(event.latitude-fix.getLatitude())*6371000;
        double east=Math.toRadians(event.longitude-fix.getLongitude())*6371000*Math.cos(Math.toRadians(fix.getLatitude()));
        double heading=Math.toRadians(fix.getBearing()),forward=north*Math.cos(heading)+east*Math.sin(heading);
        double lateral=Math.abs(east*Math.cos(heading)-north*Math.sin(heading));
        // Only a nearby target well behind a known directed movement; parallel-road ambiguity stays unknown.
        return forward < -Math.max(35,fix.getAccuracy()*2) && forward>-250 && lateral<Math.max(12,fix.getAccuracy());
    }
    public static boolean passedOnRoute(WarningEvent event,Location fix,long now,Double signedDistance){
        if(!event.relevance.equals("point_ahead") || fix==null || signedDistance==null || !Double.isFinite(signedDistance)
                || !fix.hasAccuracy() || fix.getAccuracy()>30)return false;
        long at=fix.getElapsedRealtimeNanos()/1000000;
        return at>0 && at<=now && now-at<=5000 && signedDistance < -Math.max(40,fix.getAccuracy()*2) && signedDistance>-250;
    }
}
