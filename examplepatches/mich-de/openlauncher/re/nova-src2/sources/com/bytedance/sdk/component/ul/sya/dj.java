package com.bytedance.sdk.component.ul.sya;

/* loaded from: classes2.dex */
public class dj {
    private ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private zb f24062zb;

    public static class sya {
        private static final dj ycx = new dj();
    }

    public enum ycx {
        DEBUG,
        INFO,
        ERROR,
        OFF
    }

    public interface zb {
    }

    public static void ycx(ycx ycxVar) {
        synchronized (dj.class) {
            sya.ycx.ycx = ycxVar;
        }
    }

    private dj() {
        this.ycx = ycx.OFF;
        this.f24062zb = new com.bytedance.sdk.component.ul.sya.zb();
    }
}
