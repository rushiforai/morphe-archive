package defpackage;

import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yde extends p92 {
    public Calendar b;
    public Calendar c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ zde f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yde(zde zdeVar, n92 n92Var) {
        super(n92Var);
        this.f = zdeVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.a(null, this);
    }
}
