package com.bytedance.sdk.openadsdk.tn;

/* loaded from: classes2.dex */
public enum fby {
    L(1),
    M(0),
    Q(3),
    H(2);

    private static final fby[] lud;

    /* renamed from: lt, reason: collision with root package name */
    private final int f27045lt;

    static {
        fby fbyVar = L;
        fby fbyVar2 = M;
        fby fbyVar3 = Q;
        lud = new fby[]{fbyVar2, fbyVar, H, fbyVar3};
    }

    fby(int i5) {
        this.f27045lt = i5;
    }

    public int ycx() {
        return this.f27045lt;
    }
}
