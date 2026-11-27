package app.johninnl.modelhost.api;

public final class HostStatus {
    public final String state, epoch, modelSha256;
    public final boolean enabled;
    private final String json;
    public HostStatus(String json) {
        org.json.JSONObject o=Protocol.object(json);this.json=o.toString();state=o.optString("state","FAILED");epoch=o.optString("epoch","");modelSha256=o.optString("modelSha256","");enabled=o.optBoolean("enabled",false);
    }
    public boolean isReady() { return "READY".equals(state) || "BUSY".equals(state); }
    public String toJson() { return json; }
}
