package app.template.extension.extension;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Reconstructs a replay from one stored burst and currently available credentials. */
public final class HistoryReplayPlan {
    public interface Credentials {String get(String contextId);}
    public final ActivityBurst.Ref source;
    public final List<ReplayEngine.Spec> specs;
    public final List<String> responses;
    private HistoryReplayPlan(ActivityBurst.Ref source,List<ReplayEngine.Spec> specs,List<String> responses){
        this.source=source;this.specs=Collections.unmodifiableList(specs);this.responses=Collections.unmodifiableList(responses);
    }
    public static HistoryReplayPlan from(ActivityBurst burst,Credentials credentials){
        if(burst==null||credentials==null||!burst.coverage.requestsComplete||burst.requests().isEmpty())throw new IllegalStateException("No complete activity available");
        ArrayList<ReplayEngine.Spec> specs=new ArrayList<>();ArrayList<String> responses=new ArrayList<>();int port=-1;
        for(RequestRecord r:burst.requests()){
            RequestRecord.Details d=r.details;if(d==null||r.outcome!=RequestRecord.Outcome.SUCCESS)throw new IllegalStateException("Request details unavailable");
            String community=credentials.get(d.contextId);if(community==null)throw new IllegalStateException("Printer communication needs to be observed again before replay");
            if(port<0)port=d.port;else if(port!=d.port)throw new IllegalStateException("Multiple printer ports cannot yet be replayed");
            specs.add(new ReplayEngine.Spec(r.oid,community,d.version,d.requestId,d.port,d.timeoutMillis,d.retries));
            byte[] value=r.response();responses.add(value==null?null:new String(value,StandardCharsets.UTF_8));
        }
        return new HistoryReplayPlan(burst.ref,specs,responses);
    }
}
