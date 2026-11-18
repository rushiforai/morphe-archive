package nl.flitsmeister.fmcore.service.lookahead;

import java.util.Collections;
import java.util.List;

/** Test double for FM15's look-ahead StateFlow bridge (same public member names). */
public final class RelevantReportsAheadBridge {
    public static final RelevantReportsAheadBridge INSTANCE=new RelevantReportsAheadBridge();
    public static final class Flow { public volatile List<?> value=Collections.emptyList(); public List<?> getValue(){return value;} }
    public static final Flow FLOW=new Flow();
    private RelevantReportsAheadBridge(){}
    public Flow getRelevantReports(){return FLOW;}
    public static final class Ahead {
        private final Object report;private final float distance;
        public Ahead(Object report,float distance){this.report=report;this.distance=distance;}
        public Object getBaseReport(){return report;}
        public float getDistanceInMeters(){return distance;}
        public boolean isOnLookAheadPolyline(){return true;}
    }
}
