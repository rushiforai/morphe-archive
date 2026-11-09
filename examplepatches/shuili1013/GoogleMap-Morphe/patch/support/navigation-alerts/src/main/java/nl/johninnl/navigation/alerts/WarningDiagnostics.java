package nl.johninnl.navigation.alerts;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Bounded process-local timing evidence. No messages, coordinates, accounts, files or upload. */
public final class WarningDiagnostics {
    public static final int MAX_RECORDS=512;
    private static final ArrayDeque<Map<String,Object>> records=new ArrayDeque<>();
    private WarningDiagnostics(){}
    public static void event(WarningEvent event,String stage,long now){
        Map<String,Object> row=new LinkedHashMap<>();
        row.put("stage",stage);row.put("elapsed_ms",now);row.put("provider_session",event.providerSession);row.put("sequence",event.sequence);
        row.put("observed_ms",event.observedAt);row.put("issued_ms",event.issuedAt);row.put("deadline_ms",event.announceUntil);
        row.put("event_key",event.phase==null?"":PlaybackGrant.key(event));row.put("category",bounded(event.category));row.put("native_type",bounded(event.nativeType));
        row.put("priority",event.priority==null?-1:event.priority.ordinal());row.put("preview",Boolean.TRUE.equals(event.fields().get("is_preview")));add(row);
    }
    public static void grant(PlaybackGrant grant,String stage,long now){
        Map<String,Object> row=new LinkedHashMap<>();row.put("stage",stage);row.put("elapsed_ms",now);row.put("provider_session",grant.providerSession);
        row.put("event_key",grant.eventKey);row.put("attempt_id",grant.attemptId);row.put("owner_epoch",grant.ownerEpoch);row.put("mode",grant.mode.name());add(row);
    }
    private static String bounded(String value){return value==null?"":value.substring(0,Math.min(128,value.length()));}
    private static synchronized void add(Map<String,Object> row){if(records.size()==MAX_RECORDS)records.removeFirst();records.addLast(Collections.unmodifiableMap(row));}
    public static synchronized List<Map<String,Object>> snapshot(){return Collections.unmodifiableList(new ArrayList<>(records));}
}
