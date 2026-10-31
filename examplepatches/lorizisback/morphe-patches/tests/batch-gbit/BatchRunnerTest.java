package app.local.extension.curve;

import android.app.Instrumentation;
import android.os.Bundle;
import org.json.*;
import java.util.*;

/** Offline fake financial transport. Never loads Curve or contacts any server. */
public final class BatchRunnerTest extends Instrumentation {
    static final class Fake implements BatchRunner.Transport, BatchRunner.Journal, BatchRunner.Control {
        final List<String> submitted=new ArrayList<>();
        String durable="",fault=""; int saves; boolean stop;
        public void account(String id) throws Exception { if(fault.equals("account")) throw new Exception("Account changed"); }
        public void validate(JSONObject b,JSONObject r) throws Exception { if(fault.equals("quote")) throw new Exception("Quote changed"); }
        public void move(JSONObject b,JSONObject row) throws Exception {
            require(new JSONObject(durable).getJSONArray("rows").getJSONObject(submitted.size()).getString("state").equals("inflight"),"Journal must precede submission");
            if(fault.equals("late-account")) throw new BatchRunner.Rejected("Session expired before submission");
            submitted.add(row.getString("id"));
            if(fault.equals("timeout")) throw new java.util.concurrent.TimeoutException();
            if(fault.equals("rejected")) throw new BatchRunner.Rejected("Unavailable");
            if(fault.equals("stop")) stop=true;
            if(fault.equals("second") && submitted.size()==2) throw new Exception("Lost response after server success");
        }
        public void save(JSONObject batch) throws Exception {
            saves++; if(fault.equals("disk") && saves==2) throw new Exception("Disk full before submission");
            durable=batch.toString();
        }
        public boolean stopped() { return stop; }
        public void progress(JSONObject batch) { }
    }
    static JSONObject batch() throws Exception {
        return new JSONObject().put("id","batch-one").put("status","ready").put("account","account-a").put("rows",new JSONArray()
            .put(new JSONObject().put("id","one").put("state","pending"))
            .put(new JSONObject().put("id","two").put("state","pending")));
    }
    static void require(boolean value,String message) { if(!value) throw new AssertionError(message); }
    static void check() throws Exception {
        Fake f=new Fake(); JSONObject b=batch(); BatchRunner.run(b,f,f,f); require(f.submitted.size()==2 && b.getString("status").equals("complete"),"Sequential success");
        for(String fault:new String[]{"disk","account","quote"}) {
            f=new Fake();f.fault=fault;b=batch();try { BatchRunner.run(b,f,f,f); throw new AssertionError("Expected failure"); } catch(Exception expected) { }
            require(f.submitted.isEmpty(),"Preflight/storage failure must not submit: "+fault);
        }
        f=new Fake();f.fault="stop";b=batch();BatchRunner.run(b,f,f,f);require(f.submitted.size()==1 && b.getJSONArray("rows").getJSONObject(1).getString("state").equals("pending"),"Stop after current");
        f=new Fake();f.fault="second";b=batch();BatchRunner.run(b,f,f,f);require(b.getJSONArray("rows").getJSONObject(0).getString("state").equals("moved") && BatchRunner.unresolved(b),"Partial success and unknown response");
        b.put("status","ready");Fake again=new Fake();try { BatchRunner.run(b,again,again,again);throw new AssertionError("Unknown outcome replay"); } catch(Exception expected) { }require(again.submitted.isEmpty(),"No retry of uncertain request");
        f=new Fake();f.fault="rejected";b=batch();BatchRunner.run(b,f,f,f);require(!BatchRunner.unresolved(b) && b.getJSONArray("rows").getJSONObject(0).getString("state").equals("failed"),"Definitive rejection is reviewable");
        f=new Fake();f.fault="late-account";b=batch();BatchRunner.run(b,f,f,f);require(f.submitted.isEmpty() && !BatchRunner.unresolved(b),"Known pre-submission auth failure must not become uncertain");
        f=new Fake();b=batch();b.put("status","running");try { BatchRunner.run(b,f,f,f);throw new AssertionError("Duplicate start"); } catch(Exception expected) { }require(f.submitted.isEmpty(),"Reject duplicate runner");
    }
    private void checkStorage() throws Exception {
        java.io.File base=new java.io.File(getContext().getNoBackupFilesDir(),"morphe_batch_gbit.json");
        new android.util.AtomicFile(base).delete();
        JSONObject state=batch().put("account","account-a");
        state.getJSONArray("rows").getJSONObject(0).put("state","inflight");
        try(java.io.FileOutputStream out=new java.io.FileOutputStream(base+".bak")) { out.write(state.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8)); }
        BatchStore store=new BatchStore(getContext());
        require(BatchRunner.unresolved(store.read()),"Backup-only journal must be recovered");
        JSONObject recovered=store.recover("account-a");
        require(recovered.getJSONArray("rows").getJSONObject(0).getString("state").equals("review"),"Inactive inflight state must be reviewable without reopening");
        try { store.recover("account-b"); throw new AssertionError("Cross-account recovery"); } catch(Exception expected) { }
        require(store.read().getString("account").equals("account-a"),"Cross-account recovery must preserve journal");
        require(BatchStore.showResults(store.recover("account-a"),null),"Uncertain outcomes must stay in the normal flow");
        for(String terminal:new String[]{"complete","archived"}) {
            JSONObject finished=batch().put("status",terminal);
            for(int i=0;i<finished.getJSONArray("rows").length();i++) finished.getJSONArray("rows").getJSONObject(i).put("state","moved");
            store.save(finished);
            require(store.recover("account-b")==null,"Terminal journal must not block or expose another account: "+terminal);
            require(store.read().toString().equals(finished.toString()),"Ignoring another account's result must preserve it");
            require(store.recover("account-a").getString("status").equals(terminal),"Owner must retain terminal results");
            require(!BatchStore.showResults(store.recover("account-a"),null),"Launchpad must start a fresh flow after a completed batch");
            require(BatchStore.showResults(store.recover("account-a"),"batch-one"),"Notification must reopen the saved terminal result");
            require(store.read().toString().equals(finished.toString()),"Fresh entry must retain completed results for the notification");
            try { BatchStore.showResults(store.recover("account-a"),"old-batch"); throw new AssertionError("Notification opened a different batch"); } catch(Exception expected) { }
            try { BatchStore.showResults(store.recover("account-b"),"batch-one"); throw new AssertionError("Notification exposed another account's result"); } catch(Exception expected) { }
            finished.getJSONArray("rows").getJSONObject(0).put("state","review"); store.save(finished);
            try { store.recover("account-b"); throw new AssertionError("Uncertain terminal journal crossed accounts"); } catch(Exception expected) { }
            require(store.recover("account-a").getString("status").equals("paused"),"Contradictory terminal journal must require review");
        }
        require(!BatchStore.showResults(null,null),"No saved batch must open purchase selection");
        try { BatchStore.showResults(null,"gone-batch"); throw new AssertionError("Missing result silently opened new flow"); } catch(Exception expected) { }
        JSONObject queued=batch().put("id","new-ready-batch"); store.save(queued);
        try { store.recover("account-a","old-batch"); throw new AssertionError("Stale notification recovered a new batch"); } catch(Exception expected) { }
        require(store.read().toString().equals(queued.toString()),"A stale result request must not pause or rewrite a new ready batch");
        new android.util.AtomicFile(base).delete();
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    @Override public void onStart() {
        Bundle out=new Bundle();try { check();checkStorage();out.putString("stream","PASS Batch GBIT offline queue checks\n");finish(-1,out); } catch(Throwable e) {out.putString("stream",android.util.Log.getStackTraceString(e));finish(0,out);}
    }
}
