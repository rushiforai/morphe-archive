package defpackage;

import android.view.View;
import com.medium.android.graphql.type.AlgoliaIndexName;
import com.medium.android.graphql.type.UserDismissableFlags;
import com.medium.android.onboarding.ui.topics.TopicsFragment;
import com.medium.android.onboarding.ui.welcome.WelcomeFragment;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cfd extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cfd(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new cfd((efd) this.d, (String) obj2, n92Var, 0);
            case 1:
                return new cfd((va6) this.d, (f0a) obj2, n92Var, 1);
            case 2:
                return new cfd((TopicsFragment) this.d, (SourceParameter) obj2, n92Var, 2);
            case 3:
                return new cfd((mtd) this.d, (m45) obj2, n92Var, 3);
            case 4:
                cfd cfdVar = new cfd((do4) obj2, n92Var, 4);
                cfdVar.d = obj;
                return cfdVar;
            case 5:
                return new cfd((pw6) this.d, (k3e) obj2, n92Var, 5);
            case 6:
                return new cfd((k3e) this.d, (UnsplashPhoto) obj2, n92Var, 6);
            case 7:
                return new cfd((kv6) this.d, (s3e) obj2, n92Var, 7);
            case 8:
                return new cfd((kv6) this.d, (l8e) obj2, n92Var, 8);
            case 9:
                return new cfd((sc5) this.d, (q9e) obj2, n92Var, 9);
            case 10:
                return new cfd((pu7) this.d, (v16) obj2, n92Var, 10);
            case 11:
                return new cfd((kv6) this.d, (ide) obj2, n92Var, 11);
            case 12:
                return new cfd((kv6) this.d, (khe) obj2, n92Var, 12);
            case 13:
                return new cfd((gz8) this.d, (jje) obj2, n92Var, 13);
            case 14:
                return new cfd((kv6) this.d, (gle) obj2, n92Var, 14);
            case 15:
                return new cfd((kle) this.d, (tjd) obj2, n92Var, 15);
            case 16:
                return new cfd((cxe) this.d, (ime) obj2, n92Var, 16);
            case 17:
                return new cfd((sc5) this.d, (ime) obj2, n92Var, 17);
            case 18:
                return new cfd((gz8) this.d, (wme) obj2, n92Var, 18);
            case 19:
                return new cfd((kv6) this.d, (coe) obj2, n92Var, 19);
            case 20:
                return new cfd((ooe) this.d, (String) obj2, n92Var, 20);
            case 21:
                return new cfd((Map) this.d, (kv6) obj2, n92Var, 21);
            case 22:
                return new cfd((mya) this.d, (yd4) obj2, n92Var, 22);
            case 23:
                cfd cfdVar2 = new cfd((z0f) obj2, n92Var, 23);
                cfdVar2.d = obj;
                return cfdVar2;
            case 24:
                cfd cfdVar3 = new cfd((t1f) obj2, n92Var, 24);
                cfdVar3.d = obj;
                return cfdVar3;
            case 25:
                return new cfd((t1f) this.d, (h00) obj2, n92Var, 25);
            case 26:
                return new cfd((WelcomeFragment) this.d, (String) obj2, n92Var, 26);
            case 27:
                return new cfd((swa) this.d, (View) obj2, n92Var, 27);
            case 28:
                return new cfd((w6f) this.d, (r6f) obj2, n92Var, 28);
            default:
                return new cfd((kv6) this.d, (laf) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((cfd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        String str;
        Object objB;
        Object objD;
        Object obj2;
        String str2;
        Object objB2;
        int i = this.b;
        int i2 = 17;
        int i3 = 2;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        int i4 = 1;
        Integer num = null;
        boolean z = false;
        switch (i) {
            case 0:
                efd efdVar = (efd) this.d;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    bub bubVar = efdVar.f;
                    String str3 = efdVar.l;
                    if (str3 == null) {
                        g76.g0("mostRecentSearchQuery");
                        throw null;
                    }
                    bubVar.a(str3);
                    ftb ftbVar = (ftb) efdVar.k.get((String) obj3);
                    if (ftbVar == null || (str = ftbVar.b) == null) {
                        return c1eVar;
                    }
                    bub bubVar2 = efdVar.f;
                    AlgoliaIndexName algoliaIndexName = AlgoliaIndexName.TAG;
                    List listS = d46.S(ftbVar.c);
                    List listQ = d46.Q(new Integer(ftbVar.d + 1));
                    this.c = 1;
                    objB = bubVar2.b(str, algoliaIndexName, listS, listQ, this);
                    if (objB == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objB = ((bjb) obj).a;
                }
                Throwable thB = bjb.b(objB);
                if (thB == null) {
                    return c1eVar;
                }
                wld.a.e(thB, "Report search result click failed", new Object[0]);
                return c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    va6 va6Var = (va6) this.d;
                    this.c = 1;
                    if (va6Var.z0(this) != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i6 != 1) {
                    if (i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 2;
                if (((f0a) obj3).d(this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ks8 ks8Var = ((TopicsFragment) this.d).u0;
                if (ks8Var == null) {
                    g76.g0("onboardingRouter");
                    throw null;
                }
                String strU = gp7.u((SourceParameter) obj3);
                this.c = 1;
                return ks8Var.a(strU, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                m45 m45Var = (m45) obj3;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                try {
                    if (i8 == 0) {
                        br7.v(obj);
                        mtd mtdVar = (mtd) this.d;
                        this.c = 1;
                        objD = mtdVar.d(this);
                        if (objD == tb2Var4) {
                            return tb2Var4;
                        }
                    } else {
                        if (i8 != 1) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        br7.v(obj);
                        objD = obj;
                    }
                    return c1eVar;
                } finally {
                    m45Var.invoke();
                }
            case 4:
                Object obj4 = this.d;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return ((do4) obj3).a(obj4, this) == tb2Var5 ? tb2Var5 : c1eVar;
                }
                if (i9 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                pw6 pw6Var = (pw6) this.d;
                ibd ibdVar = new ibd(0, (k3e) obj3, k3e.class, "fetchNextPage", "fetchNextPage()V", 0, 15);
                this.c = 1;
                Object objB3 = m40.J(new vh1(no7.E(new ps5(pw6Var, 8, new vx5(16))), i4)).b(new aq(i2, ibdVar), this);
                if (objB3 != tb2Var6) {
                    objB3 = c1eVar;
                }
                return objB3 == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return ((k3e) this.d).d.a((UnsplashPhoto) obj3, this) == tb2Var7 ? tb2Var7 : c1eVar;
                }
                if (i11 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj5 = ((bjb) obj).a;
                return c1eVar;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 != 0) {
                    if (i12 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var = (kv6) this.d;
                ibd ibdVar2 = new ibd(0, (s3e) obj3, s3e.class, "loadMore", "loadMore()V", 0, 21);
                this.c = 1;
                return nk7.r0(kv6Var, null, ibdVar2, this, 3) == tb2Var8 ? tb2Var8 : c1eVar;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var2 = (kv6) this.d;
                ibd ibdVar3 = new ibd(0, (l8e) obj3, l8e.class, "loadMore", "loadMore()V", 0, 29);
                this.c = 1;
                return nk7.r0(kv6Var2, null, ibdVar3, this, 3) == tb2Var9 ? tb2Var9 : c1eVar;
            case 9:
                Object obj6 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                if (i14 == 0) {
                    br7.v(obj);
                    sc5 sc5Var = (sc5) this.d;
                    String str4 = ((q9e) obj3).b;
                    this.c = 1;
                    Object objA = sc5Var.a(str4, this);
                    if (objA != obj6) {
                        obj6 = objA;
                    }
                    return obj6;
                }
                if (i14 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                obj6 = ((bjb) obj).a;
                if (obj6 instanceof ajb) {
                    return null;
                }
                return obj6;
            case 10:
                pu7 pu7Var = (pu7) this.d;
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 == 0) {
                    br7.v(obj);
                    pu7Var.getClass();
                    if (pu7Var.j(ek6.SHOULD_SHOW_VERIFIED_AUTHOR_INTRO, true)) {
                        return c1eVar;
                    }
                    og3 og3VarD = ((ko2) ((v16) obj3)).d();
                    UserDismissableFlags userDismissableFlags = UserDismissableFlags.VERIFIED_BOOK_AUTHORS_CTA;
                    this.c = 1;
                    Object objC = og3VarD.c(userDismissableFlags, this);
                    if (objC == tb2Var10) {
                        return tb2Var10;
                    }
                    obj2 = objC;
                } else {
                    if (i15 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj2 = ((bjb) obj).a;
                }
                if (obj2 instanceof ajb) {
                    return c1eVar;
                }
                pu7Var.getClass();
                pu7Var.e(ek6.SHOULD_SHOW_VERIFIED_AUTHOR_INTRO);
                return c1eVar;
            case 11:
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i16 = this.c;
                if (i16 != 0) {
                    if (i16 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var3 = (kv6) this.d;
                k8e k8eVar = new k8e(0, (ide) obj3, ide.class, "fetchNextPage", "fetchNextPage()V", 0, 7);
                this.c = 1;
                return nk7.r0(kv6Var3, null, k8eVar, this, 3) == tb2Var11 ? tb2Var11 : c1eVar;
            case 12:
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 != 0) {
                    if (i17 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var4 = (kv6) this.d;
                k8e k8eVar2 = new k8e(0, (khe) obj3, khe.class, "loadMore", "loadMore()V", 0, 12);
                this.c = 1;
                return nk7.r0(kv6Var4, null, k8eVar2, this, 3) == tb2Var12 ? tb2Var12 : c1eVar;
            case 13:
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i18 = this.c;
                if (i18 != 0) {
                    if (i18 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                gz8 gz8Var = (gz8) this.d;
                int i19 = ((jje) obj3).u;
                this.c = 1;
                return gz8Var.f(i19, f76.P(0.0f, 0.0f, null, 7), this) == tb2Var13 ? tb2Var13 : c1eVar;
            case 14:
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i20 = this.c;
                if (i20 != 0) {
                    if (i20 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var5 = (kv6) this.d;
                k8e k8eVar3 = new k8e(0, (gle) obj3, gle.class, "loadMore", "loadMore()V", 0, 17);
                this.c = 1;
                return nk7.r0(kv6Var5, null, k8eVar3, this, 3) == tb2Var14 ? tb2Var14 : c1eVar;
            case 15:
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i21 = this.c;
                if (i21 != 0) {
                    if (i21 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kle kleVar = (kle) this.d;
                r6c r6cVar = kleVar.a.a.d;
                jo9 jo9Var = new jo9(kleVar, 28, (tjd) obj3);
                this.c = 1;
                return r6c.m(r6cVar, jo9Var, this) == tb2Var15 ? tb2Var15 : c1eVar;
            case 16:
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i22 = this.c;
                if (i22 != 0) {
                    if (i22 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = ((cxe) this.d).a.d;
                a7c a7cVar = new a7c(9, (ime) obj3);
                this.c = 1;
                tb2 tb2VarM = r6c.m(r6cVar2, new xha(a7cVar, i2), this);
                Object obj7 = tb2VarM;
                if (tb2VarM != tb2Var16) {
                    obj7 = c1eVar;
                }
                return obj7 == tb2Var16 ? tb2Var16 : c1eVar;
            case 17:
                Object obj8 = tb2.COROUTINE_SUSPENDED;
                int i23 = this.c;
                if (i23 == 0) {
                    br7.v(obj);
                    sc5 sc5Var2 = (sc5) this.d;
                    String str5 = ((ime) obj3).b;
                    this.c = 1;
                    Object objA2 = sc5Var2.a(str5, this);
                    if (objA2 != obj8) {
                        obj8 = objA2;
                    }
                    return obj8;
                }
                if (i23 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                obj8 = ((bjb) obj).a;
                if (obj8 instanceof ajb) {
                    return null;
                }
                return obj8;
            case 18:
                tb2 tb2Var17 = tb2.COROUTINE_SUSPENDED;
                int i24 = this.c;
                if (i24 != 0) {
                    if (i24 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                gz8 gz8Var2 = (gz8) this.d;
                int iOrdinal = ((wme) obj3).a.ordinal();
                this.c = 1;
                return gz8Var2.f(iOrdinal, f76.P(0.0f, 0.0f, null, 7), this) == tb2Var17 ? tb2Var17 : c1eVar;
            case 19:
                tb2 tb2Var18 = tb2.COROUTINE_SUSPENDED;
                int i25 = this.c;
                if (i25 != 0) {
                    if (i25 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var6 = (kv6) this.d;
                k8e k8eVar4 = new k8e(0, (coe) obj3, coe.class, "fetchNextPage", "fetchNextPage()V", 0, 20);
                this.c = 1;
                return nk7.r0(kv6Var6, null, k8eVar4, this, 3) == tb2Var18 ? tb2Var18 : c1eVar;
            case 20:
                ooe ooeVar = (ooe) this.d;
                tb2 tb2Var19 = tb2.COROUTINE_SUSPENDED;
                int i26 = this.c;
                if (i26 == 0) {
                    br7.v(obj);
                    bub bubVar3 = ooeVar.f;
                    String str6 = ooeVar.m;
                    if (str6 == null) {
                        g76.g0("mostRecentSearchQuery");
                        throw null;
                    }
                    bubVar3.a(str6);
                    ftb ftbVar2 = (ftb) ooeVar.l.get((String) obj3);
                    if (ftbVar2 == null || (str2 = ftbVar2.b) == null) {
                        return c1eVar;
                    }
                    bub bubVar4 = ooeVar.f;
                    AlgoliaIndexName algoliaIndexName2 = AlgoliaIndexName.USER;
                    List listS2 = d46.S(ftbVar2.c);
                    List listQ2 = d46.Q(new Integer(ftbVar2.d + 1));
                    this.c = 1;
                    objB2 = bubVar4.b(str2, algoliaIndexName2, listS2, listQ2, this);
                    if (objB2 == tb2Var19) {
                        return tb2Var19;
                    }
                } else {
                    if (i26 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objB2 = ((bjb) obj).a;
                }
                Throwable thB2 = bjb.b(objB2);
                if (thB2 == null) {
                    return c1eVar;
                }
                wld.a.e(thB2, "Report search result click failed", new Object[0]);
                return c1eVar;
            case 21:
                Map map = (Map) this.d;
                tb2 tb2Var20 = tb2.COROUTINE_SUSPENDED;
                int i27 = this.c;
                if (i27 != 0) {
                    if (i27 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (map.isEmpty()) {
                    return c1eVar;
                }
                Iterator it2 = map.keySet().iterator();
                int i28 = 0;
                while (it2.hasNext()) {
                    i28++;
                    List list = (List) map.get((String) it2.next());
                    if (list != null) {
                        Iterator it3 = list.iterator();
                        while (it3.hasNext()) {
                            if (((uwe) it3.next()).b) {
                                num = new Integer(i28);
                            } else {
                                t40.B(i28);
                                i28++;
                            }
                        }
                    }
                }
                if (num == null) {
                    return c1eVar;
                }
                int iIntValue = num.intValue();
                this.c = 1;
                mya myaVar = kv6.y;
                return ((kv6) obj3).f(iIntValue, 0, this) == tb2Var20 ? tb2Var20 : c1eVar;
            case 22:
                tb2 tb2Var21 = tb2.COROUTINE_SUSPENDED;
                int i29 = this.c;
                if (i29 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return ((zk2) ((mya) this.d).b).r((yd4) obj3, false, this) == tb2Var21 ? tb2Var21 : c1eVar;
                }
                if (i29 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj9 = ((bjb) obj).a;
                return c1eVar;
            case 23:
                tb2 tb2Var22 = tb2.COROUTINE_SUSPENDED;
                int i30 = this.c;
                if (i30 == 0) {
                    br7.v(obj);
                    xha xhaVar = new xha((do4) this.d, 29);
                    this.c = 1;
                    return ((z0f) obj3).b(xhaVar, this) == tb2Var22 ? tb2Var22 : c1eVar;
                }
                if (i30 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 24:
                tb2 tb2Var23 = tb2.COROUTINE_SUSPENDED;
                int i31 = this.c;
                if (i31 == 0) {
                    br7.v(obj);
                    sb2 sb2Var = (sb2) this.d;
                    this.c = 1;
                    return ((t1f) obj3).b(sb2Var, this) == tb2Var23 ? tb2Var23 : c1eVar;
                }
                if (i31 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 25:
                tb2 tb2Var24 = tb2.COROUTINE_SUSPENDED;
                int i32 = this.c;
                if (i32 != 0) {
                    if (i32 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                uz0 uz0Var = ((t1f) this.d).g;
                tnc tncVar = new tnc((h00) obj3);
                this.c = 1;
                return uz0Var.b(this, tncVar) == tb2Var24 ? tb2Var24 : c1eVar;
            case 26:
                tb2 tb2Var25 = tb2.COROUTINE_SUSPENDED;
                int i33 = this.c;
                if (i33 != 0) {
                    if (i33 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ks8 ks8Var2 = ((WelcomeFragment) this.d).u0;
                if (ks8Var2 != null) {
                    this.c = 1;
                    return ks8Var2.a((String) obj3, this) == tb2Var25 ? tb2Var25 : c1eVar;
                }
                g76.g0("onboardingRouter");
                throw null;
            case 27:
                swa swaVar = (swa) this.d;
                View view = (View) obj3;
                tb2 tb2Var26 = tb2.COROUTINE_SUSPENDED;
                int i34 = this.c;
                try {
                    if (i34 == 0) {
                        br7.v(obj);
                        this.c = 1;
                        Object objD2 = dm2.D(swaVar.u, new au2(i3, i3, z ? 1 : 0), this);
                        if (objD2 != tb2Var26) {
                            objD2 = c1eVar;
                        }
                        if (objD2 == tb2Var26) {
                            return tb2Var26;
                        }
                    } else {
                        if (i34 != 1) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        br7.v(obj);
                    }
                    if (t5f.a(view) != swaVar) {
                        return c1eVar;
                    }
                    view.setTag(R.id.androidx_compose_ui_view_composition_context, null);
                    return c1eVar;
                } finally {
                    if (t5f.a(view) == swaVar) {
                        view.setTag(R.id.androidx_compose_ui_view_composition_context, null);
                    }
                }
            case 28:
                tb2 tb2Var27 = tb2.COROUTINE_SUSPENDED;
                int i35 = this.c;
                if (i35 != 0) {
                    if (i35 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                uua uuaVar = ((w6f) this.d).i;
                a7c a7cVar2 = new a7c(11, (r6f) obj3);
                this.c = 1;
                return uuaVar.a.b(a7cVar2, this) == tb2Var27 ? tb2Var27 : c1eVar;
            default:
                tb2 tb2Var28 = tb2.COROUTINE_SUSPENDED;
                int i36 = this.c;
                if (i36 != 0) {
                    if (i36 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var7 = (kv6) this.d;
                iaf iafVar = new iaf(0, (laf) obj3, laf.class, "loadMore", "loadMore()V", 0, 1);
                this.c = 1;
                return nk7.r0(kv6Var7, null, iafVar, this, 3) == tb2Var28 ? tb2Var28 : c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cfd(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
    }
}
