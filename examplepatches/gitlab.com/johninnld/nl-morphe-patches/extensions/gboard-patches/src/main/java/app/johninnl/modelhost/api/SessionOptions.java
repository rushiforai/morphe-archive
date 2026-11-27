package app.johninnl.modelhost.api;

import org.json.JSONObject;
public final class SessionOptions {
    public final String clientLabel, languageHint;
    public final int contextTokens;
    public SessionOptions(String clientLabel, String languageHint, int contextTokens) {
        if (contextTokens < 256 || contextTokens > 4096) throw new IllegalArgumentException("Unsupported context capacity");
        this.clientLabel = clientLabel; this.languageHint = languageHint; this.contextTokens = contextTokens;
    }
    public String toJson() {
        JSONObject o = Protocol.envelope(); Protocol.put(o,"clientLabel",clientLabel); Protocol.put(o,"languageHint",languageHint);
        Protocol.put(o,"contextTokens",contextTokens); Protocol.put(o,"retention","session"); return o.toString();
    }
}
