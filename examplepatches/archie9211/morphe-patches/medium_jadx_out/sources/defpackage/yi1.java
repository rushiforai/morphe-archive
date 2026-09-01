package defpackage;

import android.app.Activity;
import android.content.res.Resources;
import com.android.billingclient.api.BillingResult;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yi1 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public yi1(nhc nhcVar, sb2 sb2Var, zbe zbeVar, Resources resources, mya myaVar) {
        this.a = 9;
        this.b = nhcVar;
        this.c = sb2Var;
        this.e = zbeVar;
        this.d = resources;
        this.f = myaVar;
    }

    /* JADX WARN: Unexpected iteration count in SwitchBreakVisitor. Please report as an issue */
    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        Object objC;
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.f;
        Object obj3 = this.c;
        Object obj4 = this.b;
        Object obj5 = this.e;
        Object obj6 = this.d;
        switch (i) {
            case 0:
                bj1 bj1Var = (bj1) obj;
                ihc ihcVarA = ((nhc) obj4).a();
                if (ihcVarA != null) {
                    ihcVarA.a();
                }
                if (bj1Var == null) {
                    ygf.a();
                } else {
                    vx0.c0((sb2) obj3, null, null, new b9((Object) bj1Var, (nhc) obj4, (Resources) obj6, obj5, obj2, (n92) null, 11), 3);
                }
                break;
            case 1:
                sb2 sb2Var = (sb2) obj3;
                mi4 mi4Var = (mi4) obj;
                nhc nhcVar = (nhc) obj4;
                ihc ihcVarA2 = nhcVar.a();
                if (ihcVarA2 != null) {
                    ihcVarA2.a();
                }
                if (g76.L(mi4Var, ki4.a)) {
                    ((ug7) obj5).a("android.permission.READ_CONTACTS", null);
                } else if (mi4Var instanceof li4) {
                    vx0.c0(sb2Var, null, null, new fl2(mi4Var, (nhc) obj4, (Resources) obj6, (s26) obj2, null, 13), 3);
                } else if (!g76.L(mi4Var, ji4.a)) {
                    ygf.a();
                } else {
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, (Resources) obj6, null, 7), 3);
                }
                break;
            case 2:
                sb2 sb2Var2 = (sb2) obj3;
                m88 m88Var = (m88) obj;
                ihc ihcVarA3 = ((nhc) obj4).a();
                if (ihcVarA3 != null) {
                    ihcVarA3.a();
                }
                if (m88Var instanceof k88) {
                    vx0.c0(sb2Var2, null, null, new zo5(m88Var, (nhc) obj4, (Resources) obj6, (h88) obj5, null, 4), 3);
                } else if (!(m88Var instanceof l88)) {
                    ygf.a();
                } else {
                    vx0.c0(sb2Var2, null, null, new zo5(m88Var, (nhc) obj4, (Resources) obj6, (j88) obj2, null, 5), 3);
                }
                break;
            case 3:
                sb2 sb2Var3 = (sb2) obj3;
                sce sceVar = (sce) obj;
                Resources resources = (Resources) obj6;
                i98 i98Var = (i98) obj5;
                nhc nhcVar2 = (nhc) obj4;
                ihc ihcVarA4 = nhcVar2.a();
                if (ihcVarA4 != null) {
                    ihcVarA4.a();
                }
                if (!(sceVar instanceof qce)) {
                    n92 n92Var2 = null;
                    if (sceVar instanceof pce) {
                        vx0.c0(sb2Var3, null, null, new f98(nhcVar2, resources, sceVar, null, 0), 3);
                    } else if (sceVar instanceof rce) {
                        vx0.c0(sb2Var3, null, null, new mo5(nhcVar2, resources, i98Var, n92Var2, 13), 3);
                    } else if (!(sceVar instanceof oce)) {
                        ygf.a();
                    } else {
                        Object objK = vc2.K(((oce) sceVar).a, nhcVar2, (Resources) obj6, (h98) obj2, new k0(1, (i98) obj5, i98.class, "goToEditCatalog", "goToEditCatalog(Lcom/medium/android/listitems/catalogs/CatalogUiModel;)V", 0, 28), new k0(1, (i98) obj5, i98.class, ziYqbdHrAXvj.xVuMNw, "goToMakeCatalogPrivateConfirmation(Lcom/medium/android/listitems/catalogs/CatalogUiModel;)V", 0, 29), new xi1(2, (i98) obj5, i98.class, "goToDeleteCatalog", "goToDeleteCatalog(Ljava/lang/String;Ljava/lang/String;)V", 0, 12), n92Var);
                        if (objK == tb2.COROUTINE_SUSPENDED) {
                        }
                    }
                } else {
                    qce qceVar = (qce) sceVar;
                    String str = qceVar.a;
                    UpsellInfo upsellInfo = qceVar.b;
                    i98Var.getClass();
                    i98Var.b.s(upsellInfo, str);
                }
                break;
            case 4:
                hn9 hn9Var = (hn9) obj;
                boolean z = hn9Var.a;
                ((nya) obj4).a = z;
                rya ryaVar = (rya) obj3;
                ryaVar.a = hn9Var.b;
                rya ryaVar2 = (rya) obj6;
                iv0 iv0Var = (iv0) ryaVar2.a;
                zu0 zu0Var = iv0Var.c;
                if ((zu0Var instanceof yu0) || (zu0Var instanceof xu0)) {
                    int i2 = ((pya) obj5).a;
                    ryaVar2.a = iv0.a(iv0Var, z ? new yu0(new Integer(i2), true, (String) ryaVar.a) : new xu0(false, new Integer(i2), true), null, 251);
                }
                Object objA = ((sw9) obj2).B0.a(zr9.a, n92Var);
                if (objA == tb2.COROUTINE_SUSPENDED) {
                }
                break;
            case 5:
                mda mdaVar = (mda) obj2;
                sb2 sb2Var4 = (sb2) obj3;
                gga ggaVar = (gga) obj;
                fha fhaVar = (fha) obj5;
                Resources resources2 = (Resources) obj6;
                cqb cqbVar = (cqb) obj4;
                jhc jhcVar = (jhc) cqbVar.a.b.getValue();
                if (jhcVar != null) {
                    x51 x51Var = jhcVar.d;
                    if (x51Var.r() instanceof ai8) {
                        x51Var.resumeWith(bic.Dismissed);
                    }
                }
                ohc ohcVar = cqbVar.a;
                n92 n92Var3 = null;
                if (ggaVar instanceof sfa) {
                    vx0.c0(sb2Var4, null, null, new hea(ohcVar, (Resources) obj6, (fha) obj5, ggaVar, (n92) null, 3), 3);
                    break;
                } else {
                    if (ggaVar instanceof nfa) {
                        vx0.c0(sb2Var4, null, null, new hea(ohcVar, (Resources) obj6, (fha) obj5, ggaVar, (n92) null, 4), 3);
                    } else if (ggaVar instanceof vfa) {
                        vx0.c0(sb2Var4, null, null, new gea(ohcVar, resources2, fhaVar, n92Var3, 3), 3);
                    } else if (ggaVar instanceof aga) {
                        vx0.c0(sb2Var4, null, null, new hea(ohcVar, ggaVar, (Resources) obj6, (fha) obj5, (n92) null, 5), 3);
                    } else if (ggaVar instanceof bga) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 6), 3);
                    } else if (ggaVar instanceof cga) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 7), 3);
                    } else if (ggaVar instanceof dga) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 8), 3);
                    } else if (ggaVar instanceof yfa) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 9), 3);
                    } else if (ggaVar instanceof zfa) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 10), 3);
                    } else if (ggaVar instanceof ega) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 0), 3);
                    } else if (ggaVar instanceof hfa) {
                        vx0.c0(sb2Var4, null, null, new gea(ohcVar, resources2, fhaVar, n92Var3, 0), 3);
                    } else if (ggaVar instanceof ifa) {
                        vx0.c0(sb2Var4, null, null, new hea(ohcVar, ggaVar, (Resources) obj6, (fha) obj5, (n92) null, 0), 3);
                    } else if (ggaVar instanceof ufa) {
                        vx0.c0(sb2Var4, null, null, new zo5(ggaVar, ohcVar, (Resources) obj6, mdaVar, null, 24), 3);
                    } else if (ggaVar instanceof mfa) {
                        vx0.c0(sb2Var4, null, null, new mw9(ohcVar, resources2, mdaVar, n92Var3, 6), 3);
                    } else if (g76.L(ggaVar, ofa.a)) {
                        vx0.c0(sb2Var4, null, null, new gea(ohcVar, resources2, fhaVar, n92Var3, 1), 3);
                    } else if (g76.L(ggaVar, rfa.a)) {
                        vx0.c0(sb2Var4, null, null, new gea(ohcVar, resources2, fhaVar, n92Var3, 2), 3);
                    } else if (ggaVar instanceof pfa) {
                        vx0.c0(sb2Var4, null, null, new hea(ohcVar, (Resources) obj6, (fha) obj5, ggaVar, (n92) null, 1), 3);
                    } else if (ggaVar instanceof qfa) {
                        vx0.c0(sb2Var4, null, null, new hea(ohcVar, (Resources) obj6, (fha) obj5, ggaVar, (n92) null, 2), 3);
                    } else if (g76.L(ggaVar, jfa.a)) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 1), 3);
                    } else if (g76.L(ggaVar, wfa.a)) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 2), 3);
                    } else if (g76.L(ggaVar, xfa.a)) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 3), 3);
                    } else if (g76.L(ggaVar, tfa.a)) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 4), 3);
                    } else if (g76.L(ggaVar, kfa.a) || g76.L(ggaVar, lfa.a) || g76.L(ggaVar, fga.a)) {
                        vx0.c0(sb2Var4, null, null, new fea(ohcVar, resources2, null, 5), 3);
                    } else {
                        ygf.a();
                    }
                    break;
                }
                break;
            case 6:
                jbb jbbVar = (jbb) obj2;
                sb2 sb2Var5 = (sb2) obj3;
                xab xabVar = (xab) obj;
                nhc nhcVar3 = (nhc) obj4;
                ihc ihcVarA5 = nhcVar3.a();
                if (ihcVarA5 != null) {
                    ihcVarA5.a();
                }
                if (xabVar instanceof wab) {
                    vx0.c0(sb2Var5, null, null, new rna(xabVar, nhcVar3, (Resources) obj6, (oab) obj5, null, 10), 3);
                } else if (xabVar instanceof rab) {
                    vx0.c0(sb2Var5, null, null, new kab(nhcVar3, (Resources) obj6, jbbVar, xabVar, (n92) null, 0), 3);
                } else if (xabVar instanceof qab) {
                    vx0.c0(sb2Var5, null, null, new kab(xabVar, nhcVar3, (Resources) obj6, jbbVar, (n92) null, 1), 3);
                } else if (xabVar instanceof uab) {
                    vx0.c0(sb2Var5, null, null, new kab(nhcVar3, (Resources) obj6, jbbVar, xabVar, (n92) null, 2), 3);
                } else if (xabVar instanceof tab) {
                    vx0.c0(sb2Var5, null, null, new kab(xabVar, nhcVar3, (Resources) obj6, jbbVar, (n92) null, 3), 3);
                } else if (xabVar instanceof sab) {
                    vx0.c0(sb2Var5, null, null, new kab(xabVar, nhcVar3, (Resources) obj6, jbbVar, (n92) null, 4), 3);
                } else if (!(xabVar instanceof vab)) {
                    ygf.a();
                } else {
                    vx0.c0(sb2Var5, null, null, new kab(xabVar, nhcVar3, (Resources) obj6, jbbVar, (n92) null, 5), 3);
                }
                break;
            case 7:
                nhc nhcVar4 = (nhc) obj4;
                vyc vycVar = (vyc) obj;
                Resources resources3 = (Resources) obj6;
                SubscriptionViewModel subscriptionViewModel = (SubscriptionViewModel) obj3;
                if (vycVar instanceof tyc) {
                    String string = resources3.getString(R.string.subscription_error_already_owned);
                    string.getClass();
                    objC = nhc.c(nhcVar4, string, null, bhc.Long, n92Var, 6);
                    if (objC != tb2.COROUTINE_SUSPENDED) {
                    }
                } else if (vycVar instanceof uyc) {
                    String string2 = resources3.getString(R.string.subscription_error_unavailable);
                    string2.getClass();
                    objC = nhc.c(nhcVar4, string2, null, bhc.Long, n92Var, 6);
                    if (objC != tb2.COROUTINE_SUSPENDED) {
                    }
                } else if (!(vycVar instanceof syc)) {
                    ygf.a();
                    break;
                } else {
                    syc sycVar = (syc) vycVar;
                    String str2 = sycVar.a;
                    String str3 = sycVar.b;
                    BillingResult billingResultE = ((xx2) ((cr0) obj5)).e((Activity) obj2, str2, str3, subscriptionViewModel.c, subscriptionViewModel.f(), subscriptionViewModel.v, sycVar.c, sycVar.d);
                    int responseCode = billingResultE.getResponseCode();
                    if (responseCode != 0 && responseCode != 1) {
                        if (responseCode == 4) {
                            subscriptionViewModel.h(str2, str3);
                        } else if (responseCode == 7) {
                            subscriptionViewModel.g(str2, str3);
                        } else {
                            int responseCode2 = billingResultE.getResponseCode();
                            String debugMessage = billingResultE.getDebugMessage();
                            debugMessage.getClass();
                            if (muc.b0(debugMessage)) {
                                debugMessage = null;
                            }
                            if (debugMessage == null) {
                                debugMessage = "none";
                            }
                            String str4 = "launchBillingFlow. Response code: " + responseCode2 + ", Debug Message: " + debugMessage;
                            dh7 dh7VarT = wo7.t(hv2.RESULT, str2, new Integer(billingResultE.getResponseCode()), null, subscriptionViewModel.c, subscriptionViewModel.f(), subscriptionViewModel.v, null, 136);
                            wld.a.e(null, str4, new Object[0]);
                            hy2 hy2Var = g01.y;
                            if (hy2Var != null) {
                                hy2Var.a(str4, null, dh7VarT);
                            }
                        }
                        break;
                    }
                }
                break;
            case 8:
                sb2 sb2Var6 = (sb2) obj3;
                eed eedVar = (eed) obj;
                nhc nhcVar5 = (nhc) obj4;
                ihc ihcVarA6 = nhcVar5.a();
                if (ihcVarA6 != null) {
                    ihcVarA6.a();
                }
                if (eedVar instanceof ced) {
                    vx0.c0(sb2Var6, null, null, new gbd(eedVar, nhcVar5, (Resources) obj6, (zdd) obj5, null, 1), 3);
                } else if (!(eedVar instanceof ded)) {
                    ygf.a();
                } else {
                    vx0.c0(sb2Var6, null, null, new gbd(eedVar, nhcVar5, (Resources) obj6, (bed) obj2, null, 2), 3);
                }
                break;
            default:
                sb2 sb2Var7 = (sb2) obj3;
                sce sceVar2 = (sce) obj;
                zbe zbeVar = (zbe) obj5;
                Resources resources4 = (Resources) obj6;
                nhc nhcVar6 = (nhc) obj4;
                ihc ihcVarA7 = nhcVar6.a();
                if (ihcVarA7 != null) {
                    ihcVarA7.a();
                }
                n92 n92Var4 = null;
                if (sceVar2 instanceof pce) {
                    vx0.c0(sb2Var7, null, null, new f98(nhcVar6, resources4, sceVar2, null, 1), 3);
                } else if (sceVar2 instanceof qce) {
                    qce qceVar2 = (qce) sceVar2;
                    zbeVar.b.s(qceVar2.b, qceVar2.a);
                } else if (sceVar2 instanceof rce) {
                    vx0.c0(sb2Var7, null, null, new j5d(nhcVar6, resources4, zbeVar, n92Var4, 10), 3);
                } else if (!(sceVar2 instanceof oce)) {
                    ygf.a();
                } else {
                    vx0.c0(sb2Var7, null, null, new kyc(sceVar2, nhcVar6, (Resources) obj6, (mya) obj2, zbeVar, (n92) null, 6), 3);
                }
                break;
        }
        return null;
    }

    public yi1(nhc nhcVar, Resources resources, SubscriptionViewModel subscriptionViewModel, cr0 cr0Var, Activity activity) {
        this.a = 7;
        this.b = nhcVar;
        this.d = resources;
        this.c = subscriptionViewModel;
        this.e = cr0Var;
        this.f = activity;
    }

    public /* synthetic */ yi1(nhc nhcVar, Object obj, sb2 sb2Var, Resources resources, Object obj2, int i) {
        this.a = i;
        this.b = nhcVar;
        this.e = obj;
        this.c = sb2Var;
        this.d = resources;
        this.f = obj2;
    }

    public /* synthetic */ yi1(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
    }
}
