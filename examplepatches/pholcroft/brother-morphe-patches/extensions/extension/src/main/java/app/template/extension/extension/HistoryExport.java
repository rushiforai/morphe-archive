package app.template.extension.extension;

import android.util.Base64;
import android.util.JsonWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.List;

/** Structured, local export of retained printer history. Credentials are never included. */
public final class HistoryExport {
 public interface Replays {List<ReplayRun> forBurst(ActivityBurst.Ref ref);}
 private static void bytes(JsonWriter out,String key,byte[] value)throws IOException{out.name(key);if(value==null)out.nullValue();else out.value(Base64.encodeToString(value,Base64.NO_WRAP));}
 public static void write(Writer writer,PrinterRecord printer,List<ActivityBurst> bursts,Replays replays)throws IOException{
  JsonWriter out=new JsonWriter(writer);out.setIndent("  ");out.beginObject();out.name("format_version").value(1);out.name("exported_at_unix_ms").value(System.currentTimeMillis());
  out.name("printer").beginObject();out.name("name").value(printer.name);out.name("last_ip").value(printer.lastAddress);out.name("mac").value(printer.macAddress);out.name("address_changed").value(printer.addressChanged);out.name("address_history").beginArray();for(String ip:printer.addressHistory())out.value(ip);out.endArray();out.endObject();
  out.name("bursts").beginArray();for(ActivityBurst burst:bursts){out.beginObject();out.name("burst_id").value(burst.ref.burstId);out.name("sequence").value(burst.ref.sequence);out.name("started_unix_ms").value(burst.startedWallMillis);out.name("elapsed_ns").value(burst.elapsedNanos);out.name("endpoint").value(burst.endpoint);out.name("requests_complete").value(burst.coverage.requestsComplete);out.name("responses_complete").value(burst.coverage.responsesComplete);out.name("matched_samples").value(burst.coverage.matchedSamples);out.name("cache_hits").value(burst.coverage.cacheHits);
   out.name("requests").beginArray();for(RequestRecord r:burst.requests()){out.beginObject();out.name("ordinal").value(r.ordinal);out.name("token").value(r.token);out.name("oid").value(r.oid);out.name("start_offset_ns").value(r.startNanos);out.name("end_offset_ns").value(r.endNanos);out.name("cached").value(r.cached);out.name("outcome").value(r.outcome.name());bytes(out,"response_base64",r.response());
    if(r.details!=null){RequestRecord.Details d=r.details;out.name("details").beginObject();out.name("endpoint").value(d.endpoint);out.name("port").value(d.port);out.name("version").value(d.version);out.name("request_id").value(d.requestId);out.name("timeout_ms").value(d.timeoutMillis);out.name("retries").value(d.retries);out.name("context_id").value(d.contextId);out.name("response_type").value(d.responseType);out.name("outcome").value(d.outcome);out.name("sample_ns").value(d.sampleNanos);out.endObject();}out.endObject();}
   out.endArray();out.name("replays").beginArray();for(ReplayRun replay:replays.forBurst(burst.ref)){out.beginObject();out.name("replay_id").value(replay.id);out.name("endpoint").value(replay.endpoint);out.name("elapsed_ns").value(replay.elapsedNanos);out.name("responses").beginArray();for(ReplayRun.RequestResult rr:replay.results()){out.beginObject();out.name("request_token").value(rr.requestToken);bytes(out,"response_base64",rr.response());out.endObject();}out.endArray();out.endObject();}out.endArray();out.endObject();}
  out.endArray();out.endObject();out.flush();
 }
 private HistoryExport(){}
}
