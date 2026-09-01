package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wdg extends p92 {
    public Map b;
    public /* synthetic */ Object c;
    public final /* synthetic */ tag d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wdg(tag tagVar, p92 p92Var) {
        super(p92Var);
        this.d = tagVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.m(null, null, null, null, this);
    }
}
