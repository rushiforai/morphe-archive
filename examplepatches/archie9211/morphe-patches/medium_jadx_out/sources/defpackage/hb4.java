package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hb4 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public /* synthetic */ Object d;
    public final /* synthetic */ que e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hb4(int i, n92 n92Var, que queVar) {
        super(3, n92Var);
        this.b = i;
        this.e = queVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        que queVar = this.e;
        switch (i) {
            case 0:
                Object obj4 = ((bjb) obj).a;
                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                hb4 hb4Var = new hb4(0, (n92) obj3, (ib4) queVar);
                hb4Var.d = obj4;
                hb4Var.c = zBooleanValue;
                return hb4Var.invokeSuspend(c1eVar);
            default:
                boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
                hb4 hb4Var2 = new hb4(1, (n92) obj3, (e2e) queVar);
                hb4Var2.d = (uid) obj;
                hb4Var2.c = zBooleanValue2;
                return hb4Var2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object ab4Var;
        int i = this.b;
        que queVar = this.e;
        switch (i) {
            case 0:
                Object obj2 = this.d;
                boolean z = this.c;
                br7.v(obj);
                ib4 ib4Var = (ib4) queVar;
                Throwable thB = bjb.b(obj2);
                if (thB != null) {
                    return new bb4(m4.I(thB));
                }
                yf9 yf9Var = (yf9) obj2;
                String str = yf9Var.f;
                String str2 = yf9Var.a;
                String str3 = yf9Var.e;
                String str4 = yf9Var.c;
                String str5 = yf9Var.b;
                String str6 = yf9Var.g;
                ib4Var.m = str;
                jda jdaVar = yf9Var.i;
                if (yf9Var.h) {
                    ab4Var = new eb4(new pq9(str5, str4, null, yf9Var.d, 64), new rq9(str3, str, str6 != null ? str6 : null, true, false), str2, ib4Var.c, !z, ib4Var.i);
                } else {
                    if (jdaVar.a <= 0) {
                        Long l = jdaVar.c;
                        if (l != null) {
                            return new db4(l.longValue(), jdaVar.d, jdaVar.b, ib4Var.c, !z, ib4Var.i);
                        }
                        ay0.e("When available featuring tokens are not maxed then nextFeaturingTokenRefill should not be null");
                        return null;
                    }
                    pq9 pq9Var = new pq9(str5, str4, null, yf9Var.d, 64);
                    if (str6 == null) {
                        str6 = null;
                    }
                    ab4Var = new ab4(pq9Var, new rq9(str3, str, str6, true, false), str2, jdaVar.a, ib4Var.c, !z, ib4Var.i);
                }
                return ab4Var;
            default:
                uid uidVar = (uid) this.d;
                boolean z2 = this.c;
                br7.v(obj);
                e2e e2eVar = (e2e) queVar;
                return new c2e(uidVar, e2eVar.c, !z2 && huc.b(uidVar.a.b), e2eVar.k, e2eVar.d, e2eVar.e);
        }
    }
}
