package local.maps.cluster;

import org.json.*;

/** Common wire report builder. All metadata is bounded; events come from typed hooks. */
final class DiagnosticReport {
    static JSONObject create(String version,String origin,String category,String cluster,String hud,String stock,
            int api,String android,String manufacturer,String model,String firmware,boolean map,boolean guidance,
            int duration,boolean truncated,JSONArray events) {
        return DiagnosticQueue.object("schema_version",2,"project_id","google-maps-for-byd","consent","public_issue","report_source",origin,
            "app",DiagnosticQueue.object("version",version,"build","maps-26.41-"+version),
            "device",DiagnosticQueue.object("android_api",api,"android_version",DiagnosticPolicy.metadata(android,160),
                "manufacturer",DiagnosticPolicy.metadata(manufacturer,160),"model",DiagnosticPolicy.metadata(model,160),"firmware",DiagnosticPolicy.metadata(firmware,160)),
            "problem",DiagnosticQueue.object("category",category,"cluster_guidance",cluster,"hud_guidance",hud,"stock_navigation_hud",stock),
            "settings",DiagnosticQueue.object("map_enabled",map,"guidance_enabled",guidance),"components",new JSONArray(),
            "capture",DiagnosticQueue.object("duration_seconds",duration,"truncated",truncated),"events",events);
    }
}
