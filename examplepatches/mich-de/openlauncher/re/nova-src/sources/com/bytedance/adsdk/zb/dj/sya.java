package com.bytedance.adsdk.zb.dj;

/* loaded from: classes2.dex */
public enum sya {
    JSON(".json"),
    ZIP(".zip");

    public final String sya;

    sya(String str) {
        this.sya = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.sya;
    }

    public String ycx() {
        return ".temp" + this.sya;
    }
}
