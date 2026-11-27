package app.johninnl.modelhost.api;

import org.json.JSONObject;
public final class PrefixRequest {
    public final String prefixId, instruction;
    public final int maxOutputTokens;
    public PrefixRequest(String prefixId, String instruction, int maxOutputTokens) {
        if (prefixId == null || prefixId.isEmpty() || prefixId.length()>128 || instruction==null || maxOutputTokens<1 || maxOutputTokens>2048) throw new IllegalArgumentException("Invalid prefix");
        this.prefixId=prefixId;this.instruction=instruction;this.maxOutputTokens=maxOutputTokens;
    }
    String toJson(String id) { JSONObject o=Protocol.envelope(); Protocol.put(o,"clientRequestId",id);Protocol.put(o,"prefixId",prefixId);Protocol.put(o,"instruction",instruction);Protocol.put(o,"maxOutputTokens",maxOutputTokens);return o.toString(); }
}
