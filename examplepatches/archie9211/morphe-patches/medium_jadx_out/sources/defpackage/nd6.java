package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nd6 extends p92 {
    public pw2 b;
    public ad c;
    public LinkedHashMap d;
    public String e;
    public /* synthetic */ Object f;
    public final /* synthetic */ ad g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nd6(ad adVar, kn0 kn0Var) {
        super(kn0Var);
        this.g = adVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.r(null, this);
    }
}
