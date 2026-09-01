package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ai7 implements d56 {
    public final long a;
    public final LinkedHashMap b = new LinkedHashMap();
    public final pc1 c;

    public ai7(m68 m68Var, long j) {
        this.a = j;
        this.c = new pc1(m68Var.a, 21, this);
    }

    @Override // defpackage.d56
    public final bo4 a() {
        return this.c;
    }
}
