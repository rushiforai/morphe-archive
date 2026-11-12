package app.morphe.extension.chmate;

import java.util.*;
import org.json.*;

/** Persistent, idempotent moderation feedback; independent from personal NG submissions. */
final class SharedNgFeedbackState {
    static final long MAX_REVISION=9007199254740991L;
    final Set<String> desired,pending;final long revision;
    SharedNgFeedbackState(Set<String> desired,Set<String> pending,long revision){
        this.desired=checked(desired);this.pending=checked(pending);
        if(revision<0||revision>MAX_REVISION)throw new IllegalArgumentException("Invalid feedback revision");this.revision=revision;
    }
    private static Set<String> checked(Set<String> source){TreeSet<String> copy=new TreeSet<>(source);for(String id:copy)if(id==null||!id.matches("[a-f0-9]{64}"))throw new IllegalArgumentException("Invalid feedback target");return Collections.unmodifiableSet(copy);}
    SharedNgFeedbackState saved(Set<String> next,long now){
        Set<String> desired=checked(next),queued=new TreeSet<>(pending),changed=new HashSet<>(this.desired);changed.addAll(desired);
        for(String id:changed)if(this.desired.contains(id)!=desired.contains(id))queued.add(id);
        long serial=Math.max(revision+1,now);if(serial<1||serial>MAX_REVISION)throw new IllegalArgumentException("Feedback revision exhausted");
        return new SharedNgFeedbackState(desired,queued,serial);
    }
    JSONArray batch()throws JSONException{
        JSONArray out=new JSONArray();if(!pending.isEmpty()&&revision<1)throw new IllegalStateException("Missing feedback revision");
        for(String id:pending){if(out.length()==20)break;out.put(new JSONObject().put("target",id).put("exclude",desired.contains(id)).put("revision",revision));}return out;
    }
    SharedNgFeedbackState acknowledged(JSONArray sent,JSONArray ack)throws JSONException{
        Map<String,JSONObject> expected=new HashMap<>();for(int i=0;i<sent.length();i++){JSONObject row=sent.getJSONObject(i);if(expected.put(row.getString("target"),row)!=null)throw new JSONException("Duplicate requested target");}
        if(ack.length()!=expected.size())throw new JSONException("Incomplete feedback acknowledgement");
        Set<String> remaining=new TreeSet<>(pending),seen=new HashSet<>();long serial=revision;boolean stale=false;
        for(int i=0;i<ack.length();i++){
            JSONObject row=ack.getJSONObject(i);String id=row.getString("target");JSONObject request=expected.get(id);
            if(request==null||!seen.add(id)||!(row.get("exclude") instanceof Boolean)||!(row.get("revision") instanceof Number))throw new JSONException("Invalid feedback acknowledgement");
            Number value=(Number)row.get("revision");long accepted=value.longValue();if(accepted<request.getLong("revision")||accepted>MAX_REVISION||value.doubleValue()!=accepted)throw new JSONException("Invalid acknowledged revision");serial=Math.max(serial,accepted);
            if(desired.contains(id)==row.getBoolean("exclude"))remaining.remove(id);else{remaining.add(id);stale=true;}
        }
        if(stale){if(serial==MAX_REVISION)throw new JSONException("Feedback revision exhausted");serial++;}
        return new SharedNgFeedbackState(desired,remaining,serial);
    }
}
