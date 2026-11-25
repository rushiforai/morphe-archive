package nl.johninnl.vela;

import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningGeometry;
import nl.johninnl.navigation.alerts.WarningIcons;
import nl.johninnl.navigation.alerts.WarningPassage;

/**
 * Display-only map markers for provider warnings (navigation indicator contract v1, Geometry).
 * Candidates are the pill selection, so identity, CLEAR, expiry, preferences and passed/off-route
 * filtering are shared with the pills. A marker never renews speech, the source observation clock
 * or warning state, and its coordinates are never logged.
 */
final class AlertMarkers {
    private AlertMarkers() {}
    /** Style image names in the phone map; one per shared warning icon key. */
    static final String IMAGE_PREFIX="johninnl-warning-";

    static final class Marker {
        final WarningEvent event;
        final String warningId,icon;
        final double latitude,longitude;
        Marker(WarningEvent event,String icon){
            this.event=event;warningId=event.warningId;this.icon=icon;latitude=event.latitude;longitude=event.longitude;
        }
        String image(){return IMAGE_PREFIX+icon;}
    }
    static final class Placement {
        final Marker marker;final RectF slot;
        Placement(Marker marker,RectF slot){this.marker=marker;this.slot=slot;}
    }
    interface Relevance { WarningPassage.Relevance of(WarningEvent event); }
    /** Raw map pixel for a WGS84 point, or null when the map cannot place it. */
    interface Projector { PointF pixel(double latitude,double longitude) throws ReflectiveOperationException; }

    /**
     * Only a native coordinate pair is a target. A fixed native point keeps its marker until the
     * event state ends; any other point (Waze reports, responders) needs a position observed within
     * the last 5 s. Nonspatial warnings have no point to draw. An average-speed control is drawn only
     * at the fixed native point its provider marks: its start before entry, its end inside (contract
     * revision 12 November 2026); never an entry point while the zone is being traversed.
     */
    static boolean eligible(WarningEvent event,long now,WarningPassage.Relevance relevance){
        if(event==null||!event.stateValid(now)||event.latitude==null||event.longitude==null)return false;
        if(!WarningGeometry.nativeMapFeature(event)
                &&(relevance==WarningPassage.Relevance.PASSED||relevance==WarningPassage.Relevance.OFF_ROUTE))return false;
        boolean point=event.relevance.equals("point_ahead"),moving=event.relevance.equals("moving_emergency");
        boolean zone=WarningGeometry.zonePoint(event)!=null;
        if(!zone&&(!point&&!moving||WarningGeometry.remainingSegment(event)))return false;
        double latitude=event.latitude,longitude=event.longitude;
        if(!Double.isFinite(latitude)||!Double.isFinite(longitude)||Math.abs(latitude)>90||Math.abs(longitude)>180
                ||latitude==0&&longitude==0)return false;
        // A moving target cannot keep a stale position by being redrawn.
        if((point||zone)&&Boolean.TRUE.equals(event.fields().get("native_point_target")))return true;
        return WarningGeometry.fresh(event.positionObservedAt,now);
    }

    static List<Marker> select(List<WarningEvent> events,long now,Relevance relevance){
        if(events==null||events.isEmpty())return Collections.emptyList();
        List<Marker> result=new ArrayList<>();
        for(WarningEvent event:events){
            if(event==null)continue;
            if(!eligible(event,now,relevance==null?WarningPassage.Relevance.RELEVANT:relevance.of(event)))continue;
            String icon=WarningIcons.key(event);
            if(icon==null||icon.isEmpty())continue;
            result.add(new Marker(event,icon));
        }
        return Collections.unmodifiableList(result);
    }

    /** Change detection only; never log it, it contains positions. */
    static String signature(List<Marker> markers){
        if(markers.isEmpty())return "";
        StringBuilder key=new StringBuilder();
        for(Marker marker:markers)key.append(marker.warningId).append('\u0000').append(marker.icon).append('\u0000')
            .append(marker.latitude).append(',').append(marker.longitude).append('\n');
        return key.toString();
    }

    /**
     * Snapshot pixels are scaled onto the car surface exactly as the native frame scaled the map
     * bitmap. A marker whose centre falls outside the visible rectangle is withheld.
     */
    static List<Placement> place(List<Marker> markers,Projector projector,float scaleX,float scaleY,Rect visible,float size)
            throws ReflectiveOperationException {
        if(markers.isEmpty()||projector==null||visible==null||visible.isEmpty()||!(size>0)
                ||!Float.isFinite(scaleX)||!Float.isFinite(scaleY)||scaleX<=0||scaleY<=0)return Collections.emptyList();
        List<Placement> result=new ArrayList<>();
        for(Marker marker:markers){
            PointF raw=projector.pixel(marker.latitude,marker.longitude);
            if(raw==null||!Float.isFinite(raw.x)||!Float.isFinite(raw.y))continue;
            float x=raw.x*scaleX,y=raw.y*scaleY;
            if(x<visible.left||x>=visible.right||y<visible.top||y>=visible.bottom)continue;
            float half=size/2;
            result.add(new Placement(marker,new RectF(x-half,y-half,x+half,y+half)));
        }
        return Collections.unmodifiableList(result);
    }
}
