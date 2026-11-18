package app.template.extension.extension;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/** Converts one immutable in-memory burst into a credential-free durable record. */
public final class HistoryMapper {
    public interface ContextId {String forRequest(ReplayEngine.Spec request) throws Exception;}
    public static ActivityBurst map(String endpoint,String printerId,String burstId,CommunicationTiming.Snapshot snapshot,ContextId contexts){
        if(endpoint==null||printerId==null||burstId==null||snapshot==null||snapshot.sequence<1||contexts==null)throw new IllegalArgumentException();
        List<ReplayEngine.Spec> specs=snapshot.observedRequests();
        if(specs==null||specs.size()!=snapshot.responses().size()||specs.size()!=snapshot.startOffsetsNanos().size()||specs.size()!=snapshot.endOffsetsNanos().size()||specs.size()!=snapshot.cacheSources().size()||specs.size()!=snapshot.failures().size()||specs.size()!=snapshot.sampleMillis().size())throw new IllegalArgumentException("Incomplete activity sequence");
        ArrayList<RequestRecord> requests=new ArrayList<>();boolean allResponses=true;int hits=0,matched=0;
        try{
            for(int i=0;i<specs.size();i++){
                ReplayEngine.Spec s=specs.get(i);String context=contexts.forRequest(s);if(context==null||context.isEmpty())throw new IllegalArgumentException("Missing context ID");
                boolean cached=snapshot.cacheSources().get(i);long sample=snapshot.sampleMillis().get(i);
                if(cached){hits++;if(sample>=0)matched++;}
                long sampleNanos=sample<0?-1:toNanos(sample);
                String value=snapshot.responses().get(i);byte[] bytes=value==null?null:value.getBytes(StandardCharsets.UTF_8);
                if(bytes!=null&&bytes.length>8192)bytes=null;if(bytes==null)allResponses=false;
                RequestRecord.Details details=new RequestRecord.Details(endpoint,s.port,s.version,s.id,s.timeout,s.retries,context,"encoded",bytes==null?"unavailable":"success",sampleNanos);
                requests.add(new RequestRecord(java.util.UUID.randomUUID().toString(),i,s.oid,snapshot.startOffsetsNanos().get(i),snapshot.endOffsetsNanos().get(i),cached,bytes,details,snapshot.failures().get(i)?RequestRecord.Outcome.ERROR:RequestRecord.Outcome.SUCCESS));
            }
        }catch(Exception e){throw new IllegalArgumentException("Could not map activity",e);}
        return new ActivityBurst(new ActivityBurst.Ref(printerId,burstId,snapshot.sequence),snapshot.startedWallMillis,toNanos(snapshot.elapsedMillis),requests,endpoint,new ActivityBurst.Coverage(snapshot.requests()!=null,allResponses,matched,hits));
    }
    private static long toNanos(long millis){if(millis<0||millis>Long.MAX_VALUE/1000000L)throw new IllegalArgumentException("Duration out of range");return millis*1000000L;}
    private HistoryMapper(){}
}
