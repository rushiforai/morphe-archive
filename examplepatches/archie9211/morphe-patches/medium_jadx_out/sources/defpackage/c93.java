package defpackage;

import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c93 {
    public final ConcurrentHashMap a;

    public c93(int i) {
        switch (i) {
            case 1:
                this.a = new ConcurrentHashMap();
                break;
            default:
                this.a = new ConcurrentHashMap(16);
                break;
        }
    }
}
