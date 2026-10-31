package app.local.extension.curve;

import org.json.*;

/** Submission boundary shared by the real service and offline failure tests. */
final class BatchRunner {
    interface Transport {
        void account(String id) throws Exception;
        void validate(JSONObject batch, JSONObject row) throws Exception;
        void move(JSONObject batch, JSONObject row) throws Exception;
    }
    interface Journal { void save(JSONObject batch) throws Exception; }
    interface Control { boolean stopped(); void progress(JSONObject batch) throws Exception; }
    static final class Rejected extends Exception { Rejected(String message) { super(message); } }

    static boolean unresolved(JSONObject batch) throws JSONException {
        JSONArray rows=batch.getJSONArray("rows");
        for(int i=0;i<rows.length();i++) {
            String state=rows.getJSONObject(i).getString("state");
            if(state.equals("inflight") || state.equals("review")) return true;
        }
        return false;
    }
    static void run(JSONObject batch, Transport transport, Journal journal, Control control) throws Exception {
        if(!batch.getString("status").equals("ready") || unresolved(batch)) throw new Exception("Review the existing batch first.");
        transport.account(batch.getString("account"));
        batch.put("status","running"); journal.save(batch);
        JSONArray rows=batch.getJSONArray("rows");
        for(int i=0;i<rows.length();i++) {
            JSONObject row=rows.getJSONObject(i);
            if(!row.getString("state").equals("pending")) continue;
            if(control.stopped()) break;
            transport.account(batch.getString("account"));
            transport.validate(batch,row);
            if(control.stopped()) break;
            control.progress(batch);
            row.put("state","inflight");
            try { journal.save(batch); } catch(Exception notSubmitted) { row.put("state","pending"); throw notSubmitted; }
            try { transport.move(batch,row); }
            catch(Rejected e) {
                row.put("state","failed"); batch.put("message",e.getMessage()); journal.save(batch); break;
            } catch(Exception e) {
                row.put("state","review"); batch.put("message","A request was interrupted. Refresh its outcome before continuing."); journal.save(batch); break;
            }
            row.put("state","moved"); journal.save(batch); control.progress(batch);
        }
        boolean complete=true;
        for(int i=0;i<rows.length();i++) if(!rows.getJSONObject(i).getString("state").equals("moved")) complete=false;
        batch.put("status",complete?"complete":"paused");
        if(control.stopped()) batch.put("message","Stopped before the next purchase. Completed moves remain in place.");
        journal.save(batch);
    }
}
