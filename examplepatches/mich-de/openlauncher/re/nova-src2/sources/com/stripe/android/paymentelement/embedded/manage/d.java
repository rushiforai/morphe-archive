package com.stripe.android.paymentelement.embedded.manage;

import android.app.Application;
import as.h;
import au.f;
import au.i;
import bu.o;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentelement.embedded.manage.ManageContract;
import cu.a0;
import cu.k;
import cu.l;
import cu.p;
import cu.z;
import h6.f1;
import h6.j1;
import h6.u0;
import h6.y0;
import kotlin.jvm.internal.Intrinsics;
import s40.e;
import t70.j0;

/* loaded from: classes4.dex */
public final class d implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final l f44236a;

    public d(l lVar) {
        this.f44236a = lVar;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        u0 u0VarA = y0.a(extras);
        ManageContract.Args args = (ManageContract.Args) this.f44236a.invoke();
        String str = args.f44231d;
        PaymentMethodMetadata paymentMethodMetadata = args.f44228a;
        Application applicationT = jk.b.T(extras);
        paymentMethodMetadata.getClass();
        str.getClass();
        br.a aVar = new br.a(0);
        b50.d dVar = new b50.d();
        cu.a aVar2 = new cu.a();
        aVar2.f47904a = s40.c.b(p.f47962a);
        e eVarA = e.a(u0VarA);
        aVar2.f47905b = eVarA;
        aVar2.f47906c = s40.c.b(new h(eVarA, 1));
        e eVarA2 = e.a(paymentMethodMetadata);
        aVar2.f47907d = eVarA2;
        aVar2.f47908e = s40.c.b(new au.d(aVar2.f47905b, aVar2.f47906c, new h(eVarA2, 4), 0));
        aVar2.f47909f = e.a(applicationT);
        s40.h hVarB = s40.c.b(new br.b(aVar, au.b.f15670d, 0));
        aVar2.f47910g = hVarB;
        au.c cVar = au.b.f15667a;
        aVar2.f47911h = new bs.e(hVarB, cVar, 4);
        e eVar = aVar2.f47909f;
        aVar2.f47912i = new bs.b(eVar, cVar, hVarB, 5);
        au.e eVar2 = new au.e(eVar, 0);
        aVar2.f47913j = eVar2;
        f fVar = new f(eVar2, 0);
        aVar2.f47914k = fVar;
        au.c cVar2 = au.b.f15672f;
        aVar2.f47915l = new bs.b(eVar, fVar, cVar2, 4);
        au.e eVar3 = new au.e(e.a(str), 1);
        e eVar4 = aVar2.f47909f;
        aVar2.f47916m = s40.c.b(new ru.b(eVar4, au.b.f15671e, aVar2.f47911h, aVar2.f47912i, aVar2.f47915l, au.b.f15669c, eVar3, cVar, new au.e(eVar4, 10), aVar2.f47907d));
        av.a aVar3 = new av.a(dVar, 5);
        e eVar5 = aVar2.f47909f;
        f fVar2 = aVar2.f47914k;
        bs.b bVar = aVar2.f47915l;
        bs.e eVar6 = aVar2.f47911h;
        s40.h hVar = aVar2.f47910g;
        aVar2.n = s40.c.b(new as.f(new o(eVar5, fVar2, aVar3, cVar, cVar2, bVar, eVar6, hVar, 1), aVar2.f47913j, hVar, new bs.e(eVar6, bVar, 5), cVar, cVar2, 4));
        aVar2.o = new s40.b();
        s40.h hVarB2 = s40.c.b(au.b.f15673g);
        s40.b bVar2 = new s40.b();
        aVar2.f47917p = bVar2;
        s40.h hVarB3 = s40.c.b(new av.a(new z(aVar2.f47916m, aVar2.n, aVar2.f47906c, aVar2.f47908e, aVar2.o, aVar2.f47907d, hVarB2, aVar2.f47904a, bVar2), 3));
        aVar2.f47918q = hVarB3;
        s40.b.a(aVar2.f47917p, new as.f(hVarB3, aVar2.f47907d, aVar2.f47908e, aVar2.f47906c, aVar2.f47916m, aVar2.o, 3));
        e eVar7 = aVar2.f47907d;
        s40.h hVar2 = aVar2.f47908e;
        s40.h hVar3 = aVar2.f47906c;
        s40.h hVar4 = aVar2.f47918q;
        s40.h hVar5 = aVar2.f47916m;
        s40.b bVar3 = aVar2.o;
        s40.b.a(bVar3, s40.c.b(new au.d(new k(0, new as.f(eVar7, hVar2, hVar3, hVar4, hVar5, bVar3, 2), hVar2, eVar7, aVar2.f47917p), aVar2.f47904a, hVar5)));
        ((ou.c) aVar2.f47908e.get()).a(args.f44229b);
        ((i) aVar2.f47906c.get()).a(args.f44230c);
        return new a0(aVar2, (j0) aVar2.f47904a.get());
    }
}
