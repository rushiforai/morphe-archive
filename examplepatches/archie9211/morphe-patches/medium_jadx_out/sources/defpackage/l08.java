package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l08 extends p92 {
    public boolean b;
    public boolean c;
    public Object d;
    public Object e;
    public a98 f;
    public y88 g;
    public ArrayList h;
    public int i;
    public int j;
    public /* synthetic */ Object k;
    public final /* synthetic */ o08 l;
    public int m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l08(o08 o08Var, p92 p92Var) {
        super(p92Var);
        this.l = o08Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.k = obj;
        this.m |= Integer.MIN_VALUE;
        return this.l.a(false, false, this);
    }
}
