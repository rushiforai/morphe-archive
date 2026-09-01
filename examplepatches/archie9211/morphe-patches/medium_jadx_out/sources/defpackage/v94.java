package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v94 extends pnb {
    public final HashMap e = new HashMap();

    @Override // defpackage.pnb
    public final mnb d(Object obj) {
        return (mnb) this.e.get(obj);
    }

    @Override // defpackage.pnb
    public final Object e(Object obj) {
        Object objE = super.e(obj);
        this.e.remove(obj);
        return objE;
    }
}
