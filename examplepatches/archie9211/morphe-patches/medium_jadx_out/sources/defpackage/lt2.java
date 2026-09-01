package defpackage;

import java.io.Serializable;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lt2 extends p92 {
    public Serializable b;
    public Iterator c;
    public /* synthetic */ Object d;
    public final /* synthetic */ tz7 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lt2(tz7 tz7Var, p92 p92Var) {
        super(p92Var);
        this.e = tz7Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.k(null, null, this);
    }
}
