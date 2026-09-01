package defpackage;

import com.android.billingclient.api.ProductDetails;
import com.android.billingclient.api.Purchase;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class x69 {
    public static final void a(b79 b79Var, r28 r28Var, x12 x12Var, int i) {
        String str;
        r28 r28Var2;
        boolean z;
        boolean z2;
        char c;
        String str2;
        r28 r28Var3 = r28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-688400314);
        int i2 = i | (p65Var.f(b79Var) ? 4 : 2);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z3 = b79Var instanceof z69;
            o28 o28Var = o28.b;
            if (z3) {
                p65Var.Y(-127731672);
                zk7 zk7VarC = dy0.c(z46.d, false);
                long j = p65Var.T;
                int i3 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28Var3);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, zk7VarC);
                tp7.B(p65Var, q12.e, i89VarL);
                tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR);
                xz5.o(iy0.a.a(o28Var, z46.h), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var = p65Var;
                p65Var.p(true);
                p65Var.p(false);
            } else if (b79Var instanceof a79) {
                p65Var.Y(-127719628);
                r28 r28VarR2 = wgf.R(r28Var3, wgf.K(p65Var), false, 14);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                long j2 = p65Var.T;
                int i4 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarR2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, wv1VarA);
                tp7.B(p65Var, q12.e, i89VarL2);
                tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR3);
                r28 r28VarD = w2g.D(o28Var, 24.0f, 12.0f);
                r28 r28VarD2 = w2g.D(o28Var, 24.0f, 6.0f);
                jjd.b("Membership status", r28VarD, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var).c, p65Var, 6, 0, 131068);
                mkd mkdVar = rz5.D(p65Var).m;
                a79 a79Var = (a79) b79Var;
                List list = a79Var.g.c;
                Set<Purchase> set = a79Var.h;
                jjd.b("Membership type: " + a79Var.a, r28VarD2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 131068);
                jjd.b("Membership product type: " + a79Var.b, r28VarD2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var).m, p65Var, 0, 0, 131068);
                mkd mkdVar2 = rz5.D(p65Var).m;
                String str3 = a79Var.c;
                if (str3 == null) {
                    str3 = "None";
                }
                jjd.b("Payment provider: ".concat(str3), r28VarD2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar2, p65Var, 0, 0, 131068);
                mkd mkdVar3 = rz5.D(p65Var).m;
                Object obj = a79Var.d;
                if (obj == null) {
                    obj = "N/A";
                }
                jjd.b(ka1.q("Is Canceled: ", obj), r28VarD2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar3, p65Var, 0, 0, 131068);
                mkd mkdVar4 = rz5.D(p65Var).m;
                String str4 = a79Var.e;
                if (str4 == null) {
                    str4 = "N/A";
                }
                jjd.b("Expires at: ".concat(str4), r28VarD2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar4, p65Var, 0, 0, 131068);
                jjd.b("Can upgrade or downgrade the tier: " + a79Var.f, r28VarD2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var).m, p65Var, 0, 0, 131068);
                r28 r28Var4 = r28VarD2;
                tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                r28 r28Var5 = r28VarD;
                jjd.b("Play Store Subscriptions", r28Var5, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var).c, p65Var, 6, 0, 131068);
                p65 p65Var2 = p65Var;
                String str5 = "Product ID: ";
                if (set == null || !(!set.isEmpty())) {
                    str = "Product ID: ";
                    r28Var2 = r28Var5;
                    if (set == null) {
                        p65Var2.Y(905054030);
                        jjd.b("Subscriptions not fetched", r28Var4, rz5.A(p65Var2).u, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var2).m, p65Var2, 6, 0, 131064);
                        p65Var2 = p65Var2;
                        p65Var2.p(false);
                        r28Var4 = r28Var4;
                    } else {
                        p65Var2.Y(905393635);
                        jjd.b("No subscriptions", r28Var4, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var2).m, p65Var2, 6, 0, 131068);
                        r28Var4 = r28Var4;
                        p65Var2 = p65Var2;
                        p65Var2.p(false);
                    }
                } else {
                    p65Var2.Y(903487414);
                    for (Purchase purchase : set) {
                        sn3 sn3Var = jt7.c;
                        String str6 = str5;
                        p65 p65Var3 = p65Var2;
                        r28 r28Var6 = r28Var4;
                        jjd.b(ka1.r("Order ", purchase.getOrderId()), r28Var5, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).d, p65Var3, 0, 0, 131068);
                        r28 r28Var7 = r28Var5;
                        int purchaseState = purchase.getPurchaseState();
                        if (purchaseState != 1) {
                            c = 2;
                            str2 = purchaseState != 2 ? "Unknown" : "Pending";
                        } else {
                            c = 2;
                            str2 = "Purchased";
                        }
                        jjd.b("State: ".concat(str2), r28Var6, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(sn3Var)).n, p65Var3, 0, 0, 131068);
                        jjd.b(ka1.r("Date: ", DateFormat.getDateInstance().format(new Date(purchase.getPurchaseTime()))), r28Var6, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(sn3Var)).n, p65Var3, 0, 0, 131068);
                        p65Var2 = p65Var3;
                        p65Var2.Y(860465226);
                        List<String> products = purchase.getProducts();
                        products.getClass();
                        Iterator<T> it2 = products.iterator();
                        while (it2.hasNext()) {
                            p65 p65Var4 = p65Var2;
                            jjd.b(ka1.r(str6, (String) it2.next()), r28Var6, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var4, 0, 0, 131068);
                            p65Var2 = p65Var4;
                        }
                        p65Var2.p(false);
                        str5 = str6;
                        r28Var4 = r28Var6;
                        r28Var5 = r28Var7;
                    }
                    str = str5;
                    r28Var2 = r28Var5;
                    p65Var2.p(false);
                }
                tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
                sn3 sn3Var2 = jt7.c;
                p65 p65Var5 = p65Var2;
                r28 r28Var8 = r28Var4;
                jjd.b("Play Store Products", r28Var2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var2)).c, p65Var5, 6, 0, 131068);
                p65Var = p65Var5;
                if (list.isEmpty()) {
                    p65Var.Y(908336744);
                    jjd.b("No products fetched", r28Var8, ((zo7) p65Var.j(kt7.b)).u, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var, 6, 0, 131064);
                    p65Var = p65Var;
                    z = false;
                    p65Var.p(false);
                } else {
                    p65Var.Y(905947760);
                    Iterator it3 = list.iterator();
                    while (it3.hasNext()) {
                        ecb ecbVar = (ecb) it3.next();
                        sn3 sn3Var3 = jt7.c;
                        mkd mkdVar5 = ((bu7) p65Var.j(sn3Var3)).n;
                        p65 p65Var6 = p65Var;
                        Iterator it4 = it3;
                        r28 r28Var9 = r28Var8;
                        jjd.b(ka1.r("Membership plan id: ", ecbVar.i), r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar5, p65Var6, 0, 0, 131068);
                        jjd.b("Billing Period: " + ecbVar.h, r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(sn3Var3)).n, p65Var6, 0, 0, 131068);
                        jjd.b(str.concat(ecbVar.a), r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(sn3Var3)).n, p65Var6, 0, 0, 131068);
                        jjd.b("Offer Token: ".concat(ecbVar.b), r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(sn3Var3)).n, p65Var6, 0, 0, 131068);
                        jjd.b("Trial Eligible: " + ecbVar.d, r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(sn3Var3)).n, p65Var6, 0, 0, 131068);
                        jjd.b(ka1.r("Trial Period: ", ecbVar.e), r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(sn3Var3)).n, p65Var6, 0, 0, 131068);
                        p65Var = p65Var6;
                        d("Regular pricing phase", ecbVar.c, r28Var9, p65Var, 6);
                        ProductDetails.PricingPhase pricingPhase = ecbVar.f;
                        if (pricingPhase == null) {
                            p65Var.Y(271847518);
                            z2 = false;
                        } else {
                            z2 = false;
                            p65Var.Y(271847519);
                            d("Intro offer / Free trial pricing phase", pricingPhase, r28Var9, p65Var, 6);
                        }
                        p65Var.p(z2);
                        kv7 kv7Var = ecbVar.j;
                        if (kv7Var == null) {
                            p65Var.Y(272163997);
                            p65Var.p(z2);
                            r28Var8 = r28Var9;
                        } else {
                            p65Var.Y(272163998);
                            jjd.b("Crossout plan: " + kv7Var.a + " x " + kv7Var.b, r28Var9, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var3)).n, p65Var, 0, 0, 131068);
                            r28Var8 = r28Var9;
                            p65Var = p65Var;
                            p65Var.p(false);
                        }
                        tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                        it3 = it4;
                    }
                    z = false;
                    p65Var.p(false);
                }
                p65Var.p(true);
                p65Var.p(z);
                r28Var3 = r28Var;
            } else {
                if (!g76.L(b79Var, y69.a)) {
                    throw ho2.L(p65Var, -127726498, false);
                }
                p65Var.Y(342623383);
                r28Var3 = r28Var;
                jjd.b("Unable to retrieve plans config", r28Var3, ((zo7) p65Var.j(kt7.b)).u, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 54, 0, 130040);
                p65Var = p65Var;
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(b79Var, r28Var3, i, 4);
        }
    }

    public static final void b(v69 v69Var, String str, r28 r28Var, c79 c79Var, x12 x12Var, int i) {
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-122449127);
        int i2 = (p65Var.f(v69Var) ? 4 : 2) | i | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var.U();
            int i3 = i & 1;
            uob uobVar = w12.a;
            if (i3 == 0 || p65Var.z()) {
                boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ov5(str, 14);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                c79Var = (c79) to7.z(n1b.a.b(c79.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
            }
            int i4 = i2 & (-7169);
            p65Var.q();
            l78 l78VarZ = guc.z(c79Var.j, p65Var, 0);
            boolean zH = p65Var.h(c79Var);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new lo5(c79Var, null, 14);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            c((b79) l78VarZ.getValue(), v69Var, r28Var, p65Var, (i4 & 896) | ((i4 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
        } else {
            p65Var.S();
        }
        c79 c79Var2 = c79Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(v69Var, str, r28Var, c79Var2, i, 16);
        }
    }

    public static final void c(b79 b79Var, v69 v69Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        b79Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(183236808);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(b79Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(v69Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var = p65Var2;
            pr7.b(r28Var.b(jfc.c), pxf.E(180255180, new v08(9, v69Var), p65Var2), null, null, null, 0, 0L, 0L, null, pxf.E(-2080154025, new so1(1, b79Var), p65Var2), p65Var, 805306416, 508);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 8, b79Var, v69Var, r28Var);
        }
    }

    public static final void d(String str, ProductDetails.PricingPhase pricingPhase, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1788913452);
        int i2 = i | (p65Var.h(pricingPhase) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = jt7.c;
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 6, 0, 131070);
            jjd.b(ka1.r("Price: ", pricingPhase.getFormattedPrice()), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131070);
            jjd.b(ka1.r("Billing Period: ", pricingPhase.getBillingPeriod()), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131070);
            jjd.b(b09.w(pricingPhase.getBillingCycleCount(), "Number of cycles for which the billing period is applied: "), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131070);
            int recurrenceMode = pricingPhase.getRecurrenceMode();
            jjd.b("Recurrence Mode: ".concat(recurrenceMode != 1 ? recurrenceMode != 2 ? recurrenceMode != 3 ? "N/A" : "Non recurring" : "Finite" : "Infinite"), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131070);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 25, str, pricingPhase, r28Var);
        }
    }
}
