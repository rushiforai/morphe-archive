package nl.johninnl.navigation;

import android.content.Intent;
import java.util.ArrayList;
import java.util.List;

/** Optional schema-1 road report and approach observations. Publication never refreshes observation age. */
public final class NavigationAlerts {
    public static final long TTL_MS = 30000;
    public static final int MAX_ALERTS = 512;
    public static final class Alert {
        public final String id, kind, title;
        public final long observedAt;
        public final int distance, trigger;
        public final double latitude, longitude;
        public Alert(String id, String kind, String title, int distance, int trigger, double latitude, double longitude) {
            this(id,kind,title,distance,trigger,latitude,longitude,-1);
        }
        public Alert(String id,String kind,String title,int distance,int trigger,double latitude,double longitude,long at) {
            observedAt=at;
            this.id=shortText(id,160); this.kind=shortText(kind,40); this.title=shortText(title,240);
            this.distance=Math.max(-1,distance); this.trigger=Math.max(-1,trigger);
            this.latitude=latitude; this.longitude=longitude;
        }
    }
    private boolean enabled=true;
    private long observed=-1, approachAt=-1;
    private List<Alert> reports=new ArrayList<>();
    private String approachId="";
    private int approachDistance=-1;
    private boolean estimated;
    public void reset(boolean on) { enabled=on; observed=approachAt=-1; reports.clear(); approachId=""; approachDistance=-1; }
    public void reports(List<Alert> values,long at) {
        if (!enabled || at<observed) return;
        reports=new ArrayList<>();
        for(Alert a:values.subList(0,Math.min(MAX_ALERTS,values.size())))
            reports.add(new Alert(a.id,a.kind,a.title,a.distance,a.trigger,a.latitude,a.longitude,a.observedAt<0?at:a.observedAt));
        observed=at;
    }
    public void approach(String id,int distance,boolean isEstimated,long at) {
        if (!enabled || at<approachAt) return;
        approachId=shortText(id,160); approachDistance=Math.max(-1,distance); estimated=isEstimated; approachAt=at;
    }
    private String status(long at,long now) { return !enabled ? "disabled" : at<0 ? "unknown" : now<at || now-at>TTL_MS ? "stale" : "valid"; }
    public String status(long now) { return status(observed,now)+":"+status(approachAt,now); }
    public boolean fresh(long now) { return "valid".equals(status(observed,now)) || "valid".equals(status(approachAt,now)); }
    public Intent append(Intent out,long now) {
        String status=status(observed,now);
        out.putExtra("alerts_status",status).putExtra("alerts_updated_elapsed_ms",observed).putExtra("alerts_max_age_ms",TTL_MS);
        if ("valid".equals(status)) {
            List<Alert> fresh=new ArrayList<>();
            for(Alert a:reports)if(a.observedAt<=now && now-a.observedAt<=TTL_MS)fresh.add(a);
            int count=fresh.size(); long[] times=new long[count]; String[] ids=new String[count],kinds=new String[count],titles=new String[count];
            int[] distances=new int[count],triggers=new int[count]; double[] lat=new double[count],lng=new double[count];
            for(int i=0;i<count;i++) { Alert a=fresh.get(i); times[i]=a.observedAt; ids[i]=a.id;kinds[i]=a.kind;titles[i]=a.title;distances[i]=a.distance;triggers[i]=a.trigger;lat[i]=a.latitude;lng[i]=a.longitude; }
            out.putExtra("alert_ids",ids).putExtra("alert_kinds",kinds).putExtra("alert_titles",titles)
                .putExtra("alert_distance_m",distances).putExtra("alert_trigger_m",triggers)
                .putExtra("alert_updated_elapsed_ms",times).putExtra("alert_latitude",lat).putExtra("alert_longitude",lng);
        }
        String approach=status(approachAt,now);
        if ("valid".equals(approach) && approachId.isEmpty()) approach="inactive";
        if ("valid".equals(approach)) approach="ahead";
        out.putExtra("zone_approach_status",approach).putExtra("zone_approach_updated_elapsed_ms",approachAt).putExtra("zone_approach_max_age_ms",TTL_MS);
        if ("ahead".equals(approach)) out.putExtra("zone_approach_id",approachId).putExtra("zone_approach_distance_m",approachDistance).putExtra("zone_approach_distance_estimated",estimated);
        return out;
    }
    private static String shortText(String text,int max) { return text==null ? "" : text.substring(0,Math.min(text.length(),max)); }
}
