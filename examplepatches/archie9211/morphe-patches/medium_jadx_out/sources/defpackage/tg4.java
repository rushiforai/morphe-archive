package defpackage;

import java.io.FileInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tg4 extends p92 {
    public Object b;
    public FileInputStream c;
    public /* synthetic */ Object d;
    public final /* synthetic */ ug4 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tg4(ug4 ug4Var, p92 p92Var) {
        super(p92Var);
        this.e = ug4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return ug4.a(this.e, this);
    }
}
