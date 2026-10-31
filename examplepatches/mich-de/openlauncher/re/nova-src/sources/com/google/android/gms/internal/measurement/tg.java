package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public abstract class tg {

    /* renamed from: d, reason: collision with root package name */
    public static final rg f33088d = new rg();

    /* renamed from: a, reason: collision with root package name */
    public final tg f33089a;

    /* renamed from: b, reason: collision with root package name */
    public final z.c1 f33090b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f33091c = false;

    public /* synthetic */ tg(tg tgVar, z.c1 c1Var) {
        if (tgVar != null) {
            vk.b0.c(tgVar.f33091c);
        }
        this.f33089a = tgVar;
        this.f33090b = c1Var;
    }

    public static tg a(tg tgVar, tg tgVar2) {
        tgVar.getClass();
        tg tgVar3 = sg.f33071e;
        if (tgVar == tgVar3) {
            return tgVar2;
        }
        tgVar2.getClass();
        if (tgVar2 == tgVar3) {
            return tgVar;
        }
        xk.d1<tg> d1VarL = xk.d1.l(2, tgVar, tgVar2);
        if (d1VarL.isEmpty()) {
            return tgVar3;
        }
        if (d1VarL.size() == 1) {
            return (tg) d1VarL.iterator().next();
        }
        int i5 = 0;
        for (tg tgVar4 : d1VarL) {
            do {
                i5 += tgVar4.f33090b.f97753c;
                tgVar4 = tgVar4.f33089a;
            } while (tgVar4 != null);
        }
        if (i5 == 0) {
            return sg.f33071e;
        }
        z.c1 c1Var = new z.c1(i5);
        for (tg tgVar5 : d1VarL) {
            do {
                int i11 = 0;
                while (true) {
                    z.c1 c1Var2 = tgVar5.f33090b;
                    if (i11 >= c1Var2.f97753c) {
                        break;
                    }
                    vk.b0.d(c1Var.put((rg) c1Var2.f(i11), c1Var2.j(i11)) == null, "Duplicate bindings: %s", c1Var2.f(i11));
                    i11++;
                }
                tgVar5 = tgVar5.f33089a;
            } while (tgVar5 != null);
        }
        return new sg(null, c1Var).b();
    }

    public final tg b() {
        if (this.f33091c) {
            throw new IllegalStateException("Already frozen");
        }
        this.f33091c = true;
        tg tgVar = this.f33089a;
        return (tgVar == null || !this.f33090b.isEmpty()) ? this : tgVar;
    }

    public final boolean c() {
        if (this.f33090b.containsKey(f33088d)) {
            return true;
        }
        tg tgVar = this.f33089a;
        return tgVar != null && tgVar.c();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SpanExtras<");
        for (tg tgVar = this; tgVar != null; tgVar = tgVar.f33089a) {
            for (int i5 = 0; i5 < tgVar.f33090b.f97753c; i5++) {
                sb2.append("[");
                sb2.append(this.f33090b.j(i5));
                sb2.append("], ");
            }
        }
        sb2.append(">");
        return sb2.toString();
    }
}
