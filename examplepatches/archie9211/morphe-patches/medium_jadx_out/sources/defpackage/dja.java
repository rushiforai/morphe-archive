package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dja extends p92 {
    public tia b;
    public cja c;
    public List d;
    public /* synthetic */ Object e;
    public final /* synthetic */ eja f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dja(eja ejaVar, n92 n92Var) {
        super(n92Var);
        this.f = ejaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.a(null, this);
    }
}
