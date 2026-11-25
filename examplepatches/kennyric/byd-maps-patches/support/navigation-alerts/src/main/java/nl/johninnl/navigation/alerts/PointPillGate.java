package nl.johninnl.navigation.alerts;

import java.util.HashMap;
import java.util.Map;

/**
 * Car/phone visibility for point warnings. Providers choose candidates from their own road
 * guess, not the receiver's route, so a point is shown only with a distance (native or
 * receiver-route). A warning that recently had one survives a brief loss of route context
 * instead of blinking; a passed or off-route point disappears at once. Speech is unaffected.
 */
public final class PointPillGate {
    public static final long HOLD_MS=3000;
    private static final int MAX_TRACKED=256;
    private final Map<String,Long> verified=new HashMap<>();

    public synchronized boolean visible(String warningId,WarningPassage.Relevance relevance,boolean hasDistance,long now){
        verified.values().removeIf(at->now<at||now-at>HOLD_MS);
        if(relevance==WarningPassage.Relevance.PASSED||relevance==WarningPassage.Relevance.OFF_ROUTE){verified.remove(warningId);return false;}
        if(hasDistance){
            if(verified.containsKey(warningId)||verified.size()<MAX_TRACKED)verified.put(warningId,now);
            return true;
        }
        return verified.containsKey(warningId);
    }
    public synchronized void clear(){verified.clear();}
}
