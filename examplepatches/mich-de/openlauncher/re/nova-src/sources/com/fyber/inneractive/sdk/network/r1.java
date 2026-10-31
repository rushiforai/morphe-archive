package com.fyber.inneractive.sdk.network;

/* loaded from: classes3.dex */
public enum r1 {
    EVENT_TABLE("sdk_event_"),
    ERROR_TABLE("sdk_error_");

    private final String tableName;

    r1(String str) {
        this.tableName = str;
    }

    public final String a() {
        return this.tableName;
    }
}
