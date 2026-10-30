package local.maps.cluster;

import java.util.Objects;

/** Raw metres and seconds, never formatted UI distances or ETA text. */
final class GuidanceFrame {
    final int icon, exit, turnMeters, routeMeters, routeSeconds;
    final String road;
    GuidanceFrame(int icon,int exit,int turnMeters,String road,int routeMeters,int routeSeconds) {
        this.icon=icon; this.exit=Math.max(0,exit); this.turnMeters=unknown(turnMeters);
        this.road=road==null?"":road; this.routeMeters=unknown(routeMeters);
        this.routeSeconds=unknown(routeSeconds);
    }
    private static int unknown(int n){return n<0?-1:n;}
    public boolean equals(Object value) {
        if(!(value instanceof GuidanceFrame))return false;
        GuidanceFrame f=(GuidanceFrame)value;
        return icon==f.icon && exit==f.exit && turnMeters==f.turnMeters && road.equals(f.road)
            && routeMeters==f.routeMeters && routeSeconds==f.routeSeconds;
    }
    public int hashCode(){return Objects.hash(icon,exit,turnMeters,road,routeMeters,routeSeconds);}
}
