package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w80 extends p92 {
    public List b;
    public ocb c;
    public int d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ x80 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w80(x80 x80Var, p92 p92Var) {
        super(p92Var);
        this.g = x80Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.c(this);
    }
}
