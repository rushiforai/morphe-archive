package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wc1 extends p4d implements d55 {
    public /* synthetic */ bt4 b;
    public /* synthetic */ cg8 c;
    public /* synthetic */ String d;
    public final /* synthetic */ String e;
    public final /* synthetic */ id1 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wc1(id1 id1Var, n92 n92Var, String str) {
        super(4, n92Var);
        this.e = str;
        this.f = id1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        bt4 bt4Var = this.b;
        cg8 cg8Var = this.c;
        String str = this.d;
        br7.v(obj);
        return new wu4(this.e, str, EntityType.AUTHOR, bt4Var, cg8Var, this.f.j());
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        String str = this.e;
        wc1 wc1Var = new wc1(this.f, (n92) obj4, str);
        wc1Var.b = (bt4) obj;
        wc1Var.c = (cg8) obj2;
        wc1Var.d = (String) obj3;
        return wc1Var.invokeSuspend(c1e.a);
    }
}
