package local.maps.cluster;

import org.json.*;
import java.util.*;
import java.security.SecureRandom;

/** Serialized durable outbox. Android supplies private storage and a worker thread. */
final class DiagnosticQueue {
    interface Storage { String read(); boolean write(String value); }
    interface Transport { Reply request(String method,String path,String body,String key,String token) throws Exception; }
    static final class Reply {
        final int code; final JSONObject body; final long retryAfter;
        Reply(int code,JSONObject body,long retryAfter){this.code=code;this.body=body;this.retryAfter=retryAfter;}
    }
    private final Storage storage;
    private final Transport transport;
    private JSONObject state;
    DiagnosticQueue(Storage storage,Transport transport) {
        this.storage=storage;this.transport=transport;load();
    }
    private void load() {
        try {
            String value=storage.read();
            if(value.length()>600000)throw new IllegalStateException();
            state=new JSONObject(value);
            JSONArray pending=state.getJSONArray("queue");
            if(pending.length()>3)throw new IllegalStateException();
            for(int i=0;i<pending.length();i++) {
                JSONObject e=pending.getJSONObject(i);
                if(!e.getString("key").matches("[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}")
                    ||!e.getString("token").matches("[A-Za-z0-9_-]{43}")||e.getLong("created")<=0
                    ||(!e.optBoolean("cancel")&&e.getString("body").getBytes(java.nio.charset.StandardCharsets.UTF_8).length>DiagnosticPolicy.MAX_REPORT)
                    ||(e.has("id")&&!e.getString("id").matches("[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}")))throw new IllegalStateException();
            }
        } catch(Exception e){state=new JSONObject();put(state,"queue",new JSONArray());}
    }
    static JSONObject object(Object... pairs) {
        JSONObject value=new JSONObject();
        for(int i=0;i<pairs.length;i+=2)put(value,(String)pairs[i],pairs[i+1]);
        return value;
    }
    static void put(JSONObject o,String key,Object value){try{o.put(key,value);}catch(JSONException e){throw new IllegalArgumentException(e);}}
    private boolean save(){if(storage.write(state.toString()))return true;load();return false;}
    boolean informed(){return state.optBoolean("informed",false);}
    boolean automatic(){return state.optBoolean("automatic",true);}
    boolean choice(boolean enabled){put(state,"informed",true);put(state,"automatic",enabled);return save();}
    String summary(){return state.optString("summary","No reports sent.");}
    String issue(){String value=state.optString("issue","");return DiagnosticPolicy.issueUrl(value)?value:"";}
    JSONArray entries(){try{return new JSONArray(state.getJSONArray("queue").toString());}catch(JSONException e){return new JSONArray();}}
    boolean enqueue(JSONObject report,boolean automatic,long now) {
        JSONArray q=state.optJSONArray("queue");
        if(q.length()>=DiagnosticPolicy.MAX_QUEUE||report.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8).length>DiagnosticPolicy.MAX_REPORT)return false;
        if(automatic) {
            if(!DiagnosticPolicy.automaticAllowed(informed(),automatic(),state.optLong("lastAutomatic",0),now))return false;
            for(int i=0;i<q.length();i++)if(q.optJSONObject(i).optBoolean("automatic"))return false;
        }
        byte[] random=new byte[32];new SecureRandom().nextBytes(random);
        String token=Base64.getUrlEncoder().withoutPadding().encodeToString(random);
        q.put(object("key",UUID.randomUUID().toString(),"token",token,"body",report.toString(),
            "created",now,"next",now,"attempts",0,"automatic",automatic,"status","pending"));
        if(automatic)put(state,"lastAutomatic",now);
        put(state,"summary","Pending: waiting to upload.");put(state,"issue","");
        return save(); // No transport is called until this durable write has succeeded.
    }
    boolean stopAutomatic() {
        if(!choice(false))return false;
        JSONArray q=state.optJSONArray("queue");
        for(int i=q.length()-1;i>=0;i--) {
            JSONObject entry=q.optJSONObject(i);
            if(!entry.optBoolean("automatic"))continue;
            if(entry.has("id")){put(entry,"cancel",true);entry.remove("body");put(entry,"next",0);}
            else q.remove(i);
        }
        put(state,"summary","Automatic reports stopped. A report already delivered cannot be recalled.");return save();
    }
    void cancel(String key) {
        JSONArray q=state.optJSONArray("queue");
        for(int i=q.length()-1;i>=0;i--)if(q.optJSONObject(i).optString("key").equals(key)) {
            JSONObject e=q.optJSONObject(i);
            if(e.has("id")){put(e,"cancel",true);e.remove("body");put(e,"next",0);}
            else q.remove(i);
            put(state,"summary","Cancellation requested. Previously accepted delivery may already be in progress.");save();return;
        }
    }
    private void finish(JSONArray q,int index,String message,String issue) {
        q.remove(index);put(state,"summary",message);put(state,"issue",issue);save();
    }
    private static boolean supportsV2(JSONObject capabilities) {
        JSONArray versions=capabilities.optJSONArray("schema_versions");
        if(versions==null)return false;
        for(int i=0;i<versions.length();i++)if(versions.optInt(i,-1)==2)return true;
        return false;
    }
    void tick(long now) {
        JSONArray q=state.optJSONArray("queue");
        for(int i=0;i<q.length();i++) {
            JSONObject e=q.optJSONObject(i);
            if(e.optLong("next")>now || "failed".equals(e.optString("status")))continue;
            if(now<e.optLong("created") || now-e.optLong("created")>=DiagnosticPolicy.DAY) {
                if(e.optBoolean("automatic"))finish(q,i,"Automatic report expired.","");
                else {put(e,"status","failed");put(state,"summary","Report timed out. Export diagnostics or remove the pending report.");save();}
                return;
            }
            if(e.optBoolean("automatic")&&!e.optBoolean("cancel")&&(!informed()||!automatic())) {stopAutomatic();return;}
            try {
                if(e.optBoolean("automatic")&&!e.has("id")&&!e.optBoolean("cancel")) {
                    Reply caps=transport.request("GET","/",null,null,null);
                    if(caps.code!=200||!caps.body.optBoolean("automatic_reports",false)||!supportsV2(caps.body)) {
                        put(e,"next",now+Math.max(3600000,caps.retryAfter));save();return;
                    }
                }
                boolean cancel=e.optBoolean("cancel");
                String path=e.has("id")?"/v1/reports/"+e.optString("id"):"/v1/reports";
                Reply r=transport.request(cancel?"DELETE":e.has("id")?"GET":"POST",path,
                    cancel||e.has("id")?null:e.optString("body"),e.optString("key"),e.optString("token"));
                if(r.code==200||r.code==202) {
                    String id=r.body.optString("report_id"),status=r.body.optString("status");
                    if(!id.matches("[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}") || (e.has("id")&&!e.optString("id").equals(id)))throw new IllegalStateException();
                    if("submitted".equals(status)) {
                        String url=r.body.optString("issue_url");if(!DiagnosticPolicy.issueUrl(url))throw new IllegalStateException();
                        finish(q,i,"Report sent: "+id,url);return;
                    }
                    if("cancelled".equals(status)){finish(q,i,"Report cancelled.","");return;}
                    if("failed".equals(status)){put(e,"status","failed");put(state,"summary","Delivery failed. Export diagnostics or remove the pending report.");save();return;}
                    if(!Arrays.asList("queued","delivering","delivery_uncertain").contains(status))throw new IllegalStateException();
                    put(e,"id",id);put(e,"status",status);put(e,"next",now+Math.max(10000,Math.min(3600000,r.body.optLong("poll_after_seconds",30)*1000)));
                    put(state,"summary","Queued on server: "+id+" ("+status+")");save();return;
                }
                if(cancel&&(r.code==409||r.code==404)) {finish(q,i,r.code==409?"Delivery already claimed; cancellation is unavailable.":"Report no longer available.","");return;}
                if(!DiagnosticPolicy.retryable(r.code)) {
                    put(e,"status","failed");put(state,"summary","Report could not be accepted (HTTP "+r.code+"). Export diagnostics or remove it.");save();return;
                }
                retry(e,now,r.retryAfter);return;
            } catch(Exception ex){retry(e,now,0);return;}
        }
    }
    private void retry(JSONObject e,long now,long retryAfter) {
        int attempts=e.optInt("attempts");put(e,"attempts",Math.min(20,attempts+1));
        put(e,"next",now+DiagnosticPolicy.delay(attempts,retryAfter)+new SecureRandom().nextInt(3000));
        put(state,"summary",e.has("id")?"Waiting for delivery confirmation.":"Pending: will retry while Maps is running.");save();
    }
}
