package com.fyber.inneractive.sdk.ignite;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public enum j {
    FAILED_TO_BIND_SERVICE("failed to bind"),
    FAILED_TO_RETRIEVE_CREDENTIALS("failed to retrieve credentials"),
    FAILED_TO_AUTHENTICATE("failed to authenticate"),
    INSTALL_TIMEOUT("install timeout"),
    WEBPAGE_NOT_LOADED_BEFORE_SHOW("webpage not loaded before show"),
    LOAD_WEBPAGE_TIMEOUT("webpage timeout"),
    NOT_CONNECTED("not connected"),
    SESSION_EXPIRED("session expired"),
    DOWNLOAD_IS_CANCELLED("Download is cancelled");

    private static final Map<String, j> CONSTANTS = new HashMap();
    private final String value;

    static {
        for (j jVar : values()) {
            CONSTANTS.put(jVar.value, jVar);
        }
    }

    j(String str) {
        this.value = str;
    }

    public final String a() {
        return this.value;
    }
}
