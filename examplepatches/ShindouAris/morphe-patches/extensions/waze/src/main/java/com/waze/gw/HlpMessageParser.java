package com.waze.gw;

import org.json.JSONException;
import org.json.JSONObject;

/** Single strict entry point for peer JSON messages; no substring-based dispatch is allowed. */
final class HlpMessageParser {
    private HlpMessageParser() {}

    static String type(JSONObject message) throws JSONException {
        if (message == null || message.optInt("v", -1) != HlpProtocol.VERSION)
            throw new JSONException("unsupported HLP version");
        String type = message.optString("t", "");
        if (type.length() == 0) throw new JSONException("missing message type");
        return type;
    }

    static HlpProtocol.DevRequest parseDev(JSONObject message) throws JSONException {
        type(message);
        return HlpProtocol.parseDev(message);
    }
}
