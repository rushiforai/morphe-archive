package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.apollographql.apollo.exception.ApolloNetworkException;
import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.type.UserDismissableFlags;
import com.medium.proto.event.NewsletterSubscribeConsentConfirmed;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xi7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xi7(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new xi7((yi7) obj2, n92Var, 0);
            case 1:
                return new xi7((nx0) obj2, n92Var, 1);
            case 2:
                return new xi7((o08) obj2, n92Var, 2);
            case 3:
                return new xi7((h18) obj2, n92Var, 3);
            case 4:
                return new xi7((q48) obj2, n92Var, 4);
            case 5:
                return new xi7((x88) obj2, n92Var, 5);
            case 6:
                return new xi7((m98) obj2, n92Var, 6);
            case 7:
                return new xi7((lca) obj2, n92Var, 7);
            case 8:
                return new xi7((rja) obj2, n92Var, 8);
            case 9:
                return new xi7((pka) obj2, n92Var, 9);
            case 10:
                return new xi7((lma) obj2, n92Var, 10);
            case 11:
                return new xi7((sza) obj2, n92Var, 11);
            case 12:
                return new xi7((z9b) obj2, n92Var, 12);
            case 13:
                return new xi7((vx1) obj2, n92Var, 13);
            case 14:
                return new xi7((hwb) obj2, n92Var, 14);
            case 15:
                return new xi7((f3c) obj2, n92Var, 15);
            case 16:
                return new xi7((c8c) obj2, n92Var, 16);
            case 17:
                return new xi7((xmc) obj2, n92Var, 17);
            case 18:
                return new xi7((uoc) obj2, n92Var, 18);
            case 19:
                return new xi7((jpc) obj2, n92Var, 19);
            case 20:
                return new xi7((owc) obj2, n92Var, 20);
            case 21:
                return new xi7((r0d) obj2, n92Var, 21);
            case 22:
                return new xi7((j2d) obj2, n92Var, 22);
            case 23:
                return new xi7((w4d) obj2, n92Var, 23);
            case 24:
                return new xi7((p8d) obj2, n92Var, 24);
            case 25:
                return new xi7((qed) obj2, n92Var, 25);
            case 26:
                return new xi7((il2) obj2, n92Var, 26);
            case 27:
                return new xi7((p07) obj2, n92Var, 27);
            case 28:
                return new xi7((nld) obj2, n92Var, 28);
            default:
                return new xi7((tld) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 10:
                break;
        }
        return ((xi7) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objU;
        Object objC;
        xi7 xi7Var = this;
        int i = xi7Var.b;
        int i2 = 20;
        int i3 = 3;
        c1e c1eVar = c1e.a;
        Object obj2 = xi7Var.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                yi7 yi7Var = (yi7) obj2;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i4 = xi7Var.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                u50 u50VarE = no7.E(new em4(i2, yi7Var));
                mo5 mo5Var = new mo5(yi7Var, n92Var, 10);
                xi7Var.c = 1;
                return wgf.h(u50VarE, mo5Var, xi7Var) == tb2Var ? tb2Var : c1eVar;
            case 1:
                nx0 nx0Var = (nx0) obj2;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i5 = xi7Var.c;
                if (i5 != 0) {
                    if (i5 == 1 || i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object value = nx0Var.a.a.g.getValue();
                px0 px0Var = px0.Collapsed;
                ox0 ox0Var = nx0Var.a;
                if (value == px0Var) {
                    xi7Var.c = 1;
                    if (ox0Var.a(xi7Var) != tb2Var2) {
                        return c1eVar;
                    }
                } else {
                    xi7Var.c = 2;
                    sl slVar = ox0Var.a;
                    Object objX = sgg.x(slVar, px0Var, slVar.j.g(), xi7Var);
                    if (objX != tb2Var2) {
                        objX = c1eVar;
                    }
                    if (objX != tb2Var2) {
                        return c1eVar;
                    }
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i6 = xi7Var.c;
                if (i6 == 0) {
                    br7.v(obj);
                    xi7Var.c = 1;
                    int i7 = o08.s;
                    return ((o08) obj2).a(true, true, xi7Var) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i8 = xi7Var.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ou ouVar = ((h18) obj2).e;
                Float f = new Float(0.0f);
                xi7Var.c = 1;
                return ou.a(ouVar, f, null, null, xi7Var, 14) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i9 = xi7Var.c;
                if (i9 != 0) {
                    if (i9 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                uz0 uz0Var = ((q48) obj2).g;
                xi7Var.c = 1;
                Object objS = o7f.s(new kd7(uz0Var, n92Var, 11), xi7Var);
                return objS == tb2Var5 ? tb2Var5 : objS;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i10 = xi7Var.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                y85 y85Var = ((x88) obj2).c;
                xi7Var.c = 1;
                Object objC0 = y85Var.b.c0(xi7Var);
                if (objC0 != tb2Var6) {
                    objC0 = c1eVar;
                }
                return objC0 == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                m98 m98Var = (m98) obj2;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i11 = xi7Var.c;
                if (i11 != 0) {
                    if (i11 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                bo4 bo4VarJ = m40.J(new sp4(m98Var.C.k(UserDismissableFlags.MOBILE_OFFLINE_MODE_EDUCATIONAL_DIALOG), new zh(mya.w(m98Var.B, null, 7), 13), new m14(i3, i3, n92Var), 0));
                aq aqVar = new aq(i2, m98Var);
                xi7Var.c = 1;
                Object objB = bo4VarJ.b(new wv4(aqVar, 17), xi7Var);
                if (objB != tb2Var7) {
                    objB = c1eVar;
                }
                return objB == tb2Var7 ? tb2Var7 : c1eVar;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i12 = xi7Var.c;
                if (i12 != 0) {
                    if (i12 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                hba hbaVar = ((lca) obj2).e;
                xi7Var.c = 1;
                Object objD = hbaVar.b.D(xi7Var);
                if (objD != tb2Var8) {
                    objD = c1eVar;
                }
                return objD == tb2Var8 ? tb2Var8 : c1eVar;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i13 = xi7Var.c;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                gja gjaVar = ((rja) obj2).c;
                xi7Var.c = 1;
                Object objA = gjaVar.b.a(sia.a, xi7Var);
                if (objA != tb2Var9) {
                    objA = c1eVar;
                }
                return objA == tb2Var9 ? tb2Var9 : c1eVar;
            case 9:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i14 = xi7Var.c;
                if (i14 != 0) {
                    if (i14 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                uja ujaVar = ((pka) obj2).e;
                xi7Var.c = 1;
                Object objD2 = ujaVar.b.D(xi7Var);
                if (objD2 != tb2Var10) {
                    objD2 = c1eVar;
                }
                return objD2 == tb2Var10 ? tb2Var10 : c1eVar;
            case 10:
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i15 = xi7Var.c;
                if (i15 != 0) {
                    if (i15 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                lma lmaVar = (lma) obj2;
                na5 na5Var = lmaVar.e;
                String str = lmaVar.b;
                xi7Var.c = 1;
                Object objA2 = na5Var.a(str, yd4.NetworkFirst, xi7Var);
                return objA2 == tb2Var11 ? tb2Var11 : objA2;
            case 11:
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i16 = xi7Var.c;
                if (i16 != 0) {
                    if (i16 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                q85 q85Var = ((sza) obj2).c;
                xi7Var.c = 1;
                Object objC02 = q85Var.b.c0(xi7Var);
                if (objC02 != tb2Var12) {
                    objC02 = c1eVar;
                }
                return objC02 == tb2Var12 ? tb2Var12 : c1eVar;
            case 12:
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i17 = xi7Var.c;
                if (i17 == 0) {
                    br7.v(obj);
                    r6c r6cVar = ((z9b) obj2).o;
                    xi7Var.c = 1;
                    return r6cVar.a(l9b.a, xi7Var) == tb2Var13 ? tb2Var13 : c1eVar;
                }
                if (i17 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 13:
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i18 = xi7Var.c;
                if (i18 == 0) {
                    br7.v(obj);
                    xi7Var.c = 1;
                    Object objI = ((vx1) obj2).i(xi7Var);
                    return objI == tb2Var14 ? tb2Var14 : objI;
                }
                if (i18 == 1) {
                    br7.v(obj);
                    return obj;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 14:
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i19 = xi7Var.c;
                if (i19 == 0) {
                    br7.v(obj);
                    xi7Var.c = 1;
                    return ((hwb) obj2).A0(xi7Var) == tb2Var15 ? tb2Var15 : c1eVar;
                }
                if (i19 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 15:
                f3c f3cVar = (f3c) obj2;
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i20 = xi7Var.c;
                if (i20 != 0) {
                    if (i20 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar = f3cVar.w;
                xpcVar.getClass();
                xpcVar.m(null, r2c.a);
                pz2 pz2Var = f3cVar.f;
                String str2 = f3cVar.b;
                String str3 = f3cVar.A;
                String str4 = f3cVar.y;
                xi7Var.c = 1;
                return km4.K(pz2Var, str2, str3, str4, null, this, 8) == tb2Var16 ? tb2Var16 : c1eVar;
            case 16:
                tb2 tb2Var17 = tb2.COROUTINE_SUSPENDED;
                int i21 = xi7Var.c;
                if (i21 != 0) {
                    if (i21 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                c8c c8cVar = (c8c) obj2;
                xi7Var.c = 1;
                Object objA3 = ou.a(c8cVar.e, new Float(1.0f), c8cVar.a, null, xi7Var, 12);
                if (objA3 != tb2Var17) {
                    objA3 = c1eVar;
                }
                return objA3 == tb2Var17 ? tb2Var17 : c1eVar;
            case 17:
                tb2 tb2Var18 = tb2.COROUTINE_SUSPENDED;
                int i22 = xi7Var.c;
                if (i22 == 0) {
                    br7.v(obj);
                    r6c r6cVar2 = ((xmc) obj2).i;
                    xi7Var.c = 1;
                    return r6cVar2.a(pmc.a, xi7Var) == tb2Var18 ? tb2Var18 : c1eVar;
                }
                if (i22 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 18:
                tb2 tb2Var19 = tb2.COROUTINE_SUSPENDED;
                int i23 = xi7Var.c;
                if (i23 != 0) {
                    if (i23 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ts8 ts8Var = ((uoc) obj2).d;
                xi7Var.c = 1;
                Object objA4 = ts8Var.c.a(ps8.a, xi7Var);
                if (objA4 != tb2Var19) {
                    objA4 = c1eVar;
                }
                return objA4 == tb2Var19 ? tb2Var19 : c1eVar;
            case 19:
                tb2 tb2Var20 = tb2.COROUTINE_SUSPENDED;
                int i24 = xi7Var.c;
                if (i24 != 0) {
                    if (i24 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                et8 et8Var = ((jpc) obj2).c;
                xi7Var.c = 1;
                Object objA5 = et8Var.b.a(ct8.a, xi7Var);
                if (objA5 != tb2Var20) {
                    objA5 = c1eVar;
                }
                return objA5 == tb2Var20 ? tb2Var20 : c1eVar;
            case 20:
                owc owcVar = (owc) obj2;
                r6c r6cVar3 = owcVar.i;
                tb2 tb2Var21 = tb2.COROUTINE_SUSPENDED;
                int i25 = xi7Var.c;
                if (i25 == 0) {
                    br7.v(obj);
                    EntityType entityType = owcVar.c;
                    EntityType entityType2 = EntityType.AUTHOR;
                    if (entityType == entityType2) {
                        ax2 ax2Var = owcVar.h;
                        String str5 = owcVar.d;
                        String str6 = owcVar.b;
                        String str7 = owcVar.e;
                        String str8 = owcVar.l;
                        str7.getClass();
                        rqd.a(ax2Var.b, new NewsletterSubscribeConsentConfirmed(null, str5, str6, null, 9, null), str7, str8, false, null, "subscribe_to_newsletter", 24);
                    }
                    o2b o2bVar = owcVar.f;
                    String str9 = owcVar.d;
                    String str10 = owcVar.b;
                    EntityType entityType3 = owcVar.c;
                    Boolean bool = entityType3 == entityType2 ? null : Boolean.TRUE;
                    xi7Var.c = 1;
                    objU = o2bVar.u(this, entityType3, bool, str9, str10, false);
                    xi7Var = this;
                    if (objU != tb2Var21) {
                    }
                    return tb2Var21;
                }
                if (i25 != 1) {
                    if (i25 == 2 || i25 == 3) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objU = obj;
                swc swcVar = (swc) objU;
                if (!g76.L(swcVar, pwc.a)) {
                    if (swcVar instanceof qwc) {
                        xi7Var.c = 2;
                        if (r6cVar3.a(jwc.a, xi7Var) != tb2Var21) {
                            return c1eVar;
                        }
                    } else if (swcVar instanceof rwc) {
                        xi7Var.c = 3;
                        if (r6cVar3.a(kwc.a, xi7Var) != tb2Var21) {
                            return c1eVar;
                        }
                    } else {
                        ygf.a();
                    }
                    return tb2Var21;
                }
                ygf.f("The consent to share the user email address should be given in this screen");
                return null;
            case 21:
                tb2 tb2Var22 = tb2.COROUTINE_SUSPENDED;
                int i26 = xi7Var.c;
                if (i26 == 0) {
                    br7.v(obj);
                    xi7Var.c = 1;
                    objC = ((r0d) obj2).c(xi7Var);
                    if (objC == tb2Var22) {
                        return tb2Var22;
                    }
                } else {
                    if (i26 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objC = obj;
                }
                Map map = (Map) objC;
                Object obj3 = map.get("type");
                if (g76.L(obj3, "connection_ack")) {
                    return c1eVar;
                }
                if (!g76.L(obj3, "connection_error")) {
                    System.out.println((Object) ka1.q("unknown message while waiting for connection_ack: '", obj3));
                    return c1eVar;
                }
                throw new ApolloNetworkException("Connection error:\n" + map, null);
            case 22:
                tb2 tb2Var23 = tb2.COROUTINE_SUSPENDED;
                int i27 = xi7Var.c;
                if (i27 != 0) {
                    if (i27 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kc5 kc5Var = ((j2d) obj2).d;
                xi7Var.c = 1;
                Object objA6 = kc5Var.b.a(gc5.a, xi7Var);
                if (objA6 != tb2Var23) {
                    objA6 = c1eVar;
                }
                return objA6 == tb2Var23 ? tb2Var23 : c1eVar;
            case 23:
                w4d w4dVar = (w4d) obj2;
                tb2 tb2Var24 = tb2.COROUTINE_SUSPENDED;
                int i28 = xi7Var.c;
                if (i28 == 0) {
                    br7.v(obj);
                    PointerInputEventHandler pointerInputEventHandler = w4dVar.q;
                    xi7Var.c = 2;
                    return pointerInputEventHandler.invoke(w4dVar, xi7Var) == tb2Var24 ? tb2Var24 : c1eVar;
                }
                if (i28 == 1 || i28 == 2) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 24:
                p8d p8dVar = (p8d) obj2;
                tb2 tb2Var25 = tb2.COROUTINE_SUSPENDED;
                int i29 = xi7Var.c;
                if (i29 == 0) {
                    br7.v(obj);
                    s26 s26Var = p8dVar.d;
                    xi7Var.c = 1;
                    if (s26Var.t0(xi7Var) != tb2Var25) {
                    }
                    return tb2Var25;
                }
                if (i29 != 1) {
                    if (i29 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                yb5 yb5Var = p8dVar.e;
                xi7Var.c = 2;
                Object objC2 = ((o2b) yb5Var.b.a).C(xi7Var);
                if (objC2 != tb2Var25) {
                    objC2 = c1eVar;
                }
                if (objC2 != tb2Var25) {
                    objC2 = c1eVar;
                }
                if (objC2 != tb2Var25) {
                    return c1eVar;
                }
                return tb2Var25;
            case 25:
                qed qedVar = (qed) obj2;
                tb2 tb2Var26 = tb2.COROUTINE_SUSPENDED;
                int i30 = xi7Var.c;
                if (i30 == 0) {
                    br7.v(obj);
                    s26 s26Var2 = qedVar.e;
                    xi7Var.c = 1;
                    if (s26Var2.t0(xi7Var) != tb2Var26) {
                    }
                    return tb2Var26;
                }
                if (i30 != 1) {
                    if (i30 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                f3f f3fVar = qedVar.d;
                xi7Var.c = 2;
                Object objC03 = f3fVar.b.c0(xi7Var);
                if (objC03 != tb2Var26) {
                    objC03 = c1eVar;
                }
                if (objC03 != tb2Var26) {
                    return c1eVar;
                }
                return tb2Var26;
            case 26:
                tb2 tb2Var27 = tb2.COROUTINE_SUSPENDED;
                int i31 = xi7Var.c;
                if (i31 != 0) {
                    if (i31 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                il2 il2Var = (il2) obj2;
                xi7Var.c = 1;
                il2Var.getClass();
                Object objS2 = o7f.s(new rc0(il2Var, n92Var, 5), xi7Var);
                if (objS2 != tb2Var27) {
                    objS2 = c1eVar;
                }
                return objS2 == tb2Var27 ? tb2Var27 : c1eVar;
            case 27:
                tb2 tb2Var28 = tb2.COROUTINE_SUSPENDED;
                int i32 = xi7Var.c;
                if (i32 != 0) {
                    if (i32 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                p07 p07Var = (p07) obj2;
                xi7Var.c = 1;
                p07Var.getClass();
                Object objB2 = p07Var.a.a().b(new q9(new x68(), 22, p07Var), xi7Var);
                if (objB2 != tb2Var28) {
                    objB2 = c1eVar;
                }
                return objB2 == tb2Var28 ? tb2Var28 : c1eVar;
            case 28:
                tb2 tb2Var29 = tb2.COROUTINE_SUSPENDED;
                int i33 = xi7Var.c;
                if (i33 != 0) {
                    if (i33 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                nld nldVar = (nld) obj2;
                b55 b55Var = nldVar.d;
                xi7Var.c = 1;
                return b55Var.invoke(nldVar, xi7Var) == tb2Var29 ? tb2Var29 : c1eVar;
            default:
                tld tldVar = (tld) obj2;
                tb2 tb2Var30 = tb2.COROUTINE_SUSPENDED;
                int i34 = xi7Var.c;
                if (i34 != 0) {
                    if (i34 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                pya pyaVar = new pya();
                bo4 bo4VarA = tldVar.o.a();
                jo9 jo9Var = new jo9(pyaVar, 16, tldVar);
                xi7Var.c = 1;
                return bo4VarA.b(jo9Var, xi7Var) == tb2Var30 ? tb2Var30 : c1eVar;
        }
    }
}
