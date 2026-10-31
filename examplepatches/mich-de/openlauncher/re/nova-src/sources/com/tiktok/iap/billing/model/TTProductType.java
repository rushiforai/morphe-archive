package com.tiktok.iap.billing.model;

/* loaded from: classes4.dex */
public enum TTProductType {
    IN_APP("inapp"),
    SUBS("subs");

    private String type;

    TTProductType(String str) {
        this.type = str;
    }

    public String getType() {
        return this.type;
    }

    @Override // java.lang.Enum
    public String toString() {
        return String.valueOf(this.type);
    }
}
