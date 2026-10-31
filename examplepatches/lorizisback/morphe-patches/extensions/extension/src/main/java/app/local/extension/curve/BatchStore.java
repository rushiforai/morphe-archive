package app.local.extension.curve;

import android.content.Context;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import org.json.*;

/** One durable batch; never stores credentials or participates in Android backup. */
final class BatchStore {
    private final AtomicFile file;
    BatchStore(Context context) {
        file = new AtomicFile(new File(context.getNoBackupFilesDir(), "morphe_batch_gbit.json"));
    }
    JSONObject read() throws Exception {
        synchronized (BatchGbitService.LOCK) {
            // openRead restores Android 9's backup even when the base file is absent.
            try (InputStream in = file.openRead()) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int n;
                while ((n = in.read(buffer)) != -1) bytes.write(buffer, 0, n);
                return new JSONObject(bytes.toString("UTF-8"));
            } catch (FileNotFoundException absent) {
                if (file.getBaseFile().exists() || new File(file.getBaseFile()+".bak").exists()) throw absent;
                return null;
            }
        }
    }
    void save(JSONObject batch) throws Exception {
        synchronized (BatchGbitService.LOCK) {
            FileOutputStream out = null;
            try {
                out = file.startWrite();
                out.write(batch.toString().getBytes(StandardCharsets.UTF_8));
                file.finishWrite(out);
            } catch (Exception e) {
                if (out != null) file.failWrite(out);
                throw e;
            }
        }
    }
    JSONObject recover(String account) throws Exception {
        return recover(account,null);
    }
    JSONObject recover(String account,String requestedId) throws Exception {
        synchronized (BatchGbitService.LOCK) {
            JSONObject batch=read();
            if(batch==null) return null;
            if(!account.equals(batch.getString("account"))) {
                if(!BatchGbitService.running && isTerminal(batch)) return null;
                throw new Exception("A batch belongs to a different account. Sign in to that account to review it.");
            }
            if(requestedId!=null) showResults(batch,requestedId);
            if(!BatchGbitService.running && !isTerminal(batch)) {
                JSONArray rows=batch.getJSONArray("rows");
                for(int i=0;i<rows.length();i++) if(rows.getJSONObject(i).getString("state").equals("inflight")) rows.getJSONObject(i).put("state","review");
                batch.put("status","paused");
                save(batch);
            }
            return batch;
        }
    }
    static boolean isTerminal(JSONObject batch) throws JSONException {
        String status=batch.getString("status");
        return (status.equals("complete") || status.equals("archived")) && !unresolved(batch);
    }
    static boolean showResults(JSONObject batch,String requestedId) throws Exception {
        if(requestedId!=null) {
            if(batch==null || !requestedId.equals(batch.getString("id"))) throw new Exception("These batch results are no longer available. Open Batch GBIT from Launchpad.");
            return true;
        }
        return batch!=null && !isTerminal(batch);
    }
    static boolean unresolved(JSONObject batch) throws JSONException { return BatchRunner.unresolved(batch); }
}
