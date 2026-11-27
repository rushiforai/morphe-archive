package app.johninnl.modelhost.api;

import org.json.JSONArray;
public final class HostCapabilities {
    public final int protocolMajor, protocolMinor, maxContextTokens;
    private final String json;
    public HostCapabilities(String json) { org.json.JSONObject o=Protocol.object(json);this.json=o.toString();protocolMajor=o.optInt("protocolMajor",0);protocolMinor=o.optInt("protocolMinor",0);maxContextTokens=o.optInt("maxContextTokens",0); }
    public boolean supports(String operation) { JSONArray a=Protocol.object(json).optJSONArray("operations");if(a!=null)for(int i=0;i<a.length();i++)if(operation.equals(a.optString(i)))return true;return false; }
    public boolean supportsSpeechContactHints() {
        org.json.JSONObject speech = Protocol.object(json).optJSONObject("speech");
        return protocolMajor == 1 && speech != null && "parakeet-ultra".equals(speech.opt("modelId"))
            && Boolean.TRUE.equals(speech.opt("contextBias"));
    }
    public String toJson() { return json; }
}
