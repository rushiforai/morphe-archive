package a5;

import ai.o4;
import ai.x3;
import android.app.ActivityManager;
import android.content.ClipData;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.ContentInfo;
import android.view.View;
import android.view.Window;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import c0.m2;
import com.android.launcher3.widget.WidgetCell;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.v6;
import com.stripe.android.core.frauddetection.FraudDetectionData;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.ui.core.elements.AddressSpec;
import com.stripe.android.ui.core.elements.AffirmTextSpec;
import com.stripe.android.ui.core.elements.AfterpayClearpayTextSpec;
import com.stripe.android.ui.core.elements.AuBankAccountNumberSpec;
import com.stripe.android.ui.core.elements.AuBecsDebitMandateTextSpec;
import com.stripe.android.ui.core.elements.BacsDebitBankAccountSpec;
import com.stripe.android.ui.core.elements.BacsDebitConfirmSpec;
import com.stripe.android.ui.core.elements.BsbSpec;
import com.stripe.android.ui.core.elements.CashAppPayMandateTextSpec;
import com.stripe.android.ui.core.elements.CountrySpec;
import com.stripe.android.ui.core.elements.DropdownSpec;
import com.stripe.android.ui.core.elements.EmailSpec;
import com.stripe.android.ui.core.elements.EmptyFormSpec;
import com.stripe.android.ui.core.elements.FormItemSpec;
import com.stripe.android.ui.core.elements.IbanSpec;
import com.stripe.android.ui.core.elements.KlarnaHeaderStaticTextSpec;
import com.stripe.android.ui.core.elements.KlarnaMandateTextSpec;
import com.stripe.android.ui.core.elements.MandateTextSpec;
import com.stripe.android.ui.core.elements.NameSpec;
import com.stripe.android.ui.core.elements.OTPSpec;
import com.stripe.android.ui.core.elements.PhoneSpec;
import com.stripe.android.ui.core.elements.PlaceholderSpec;
import com.stripe.android.ui.core.elements.SepaMandateTextSpec;
import com.stripe.android.ui.core.elements.SimpleTextSpec;
import com.stripe.android.ui.core.elements.StaticTextSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.tiktok.util.TTConst;
import cw.l4;
import cw.t3;
import cw.v2;
import cw.w2;
import io.sentry.e3;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kw.q2;
import kw.t2;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class d implements e, g, z8.b, o4, androidx.recyclerview.widget.c1, dr.b, qx.f, c0.t, m2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f266a;

    /* renamed from: b, reason: collision with root package name */
    public Object f267b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f266a = i5;
        this.f267b = obj;
    }

    public static d O(String str) {
        return new d((TextUtils.isEmpty(str) || str.length() > 1) ? ai.x1.UNINITIALIZED : ai.a2.e(str.charAt(0)), 6);
    }

    public boolean A(int i5, int i11) {
        androidx.fragment.app.x1 x1Var = (androidx.fragment.app.x1) this.f267b;
        Object obj = x1Var.f14712c.get(i5);
        Object obj2 = x1Var.f14713d.get(i11);
        return (obj == null || obj2 == null) ? obj == null && obj2 == null : ((androidx.recyclerview.widget.t) ((androidx.recyclerview.widget.f) x1Var.f14715f).f14944b.f14915b).areItemsTheSame(obj, obj2);
    }

    public ar.f B(FraudDetectionData fraudDetectionData) {
        ar.g gVar = (ar.g) this.f267b;
        gVar.getClass();
        Pair pair = new Pair(com.moloco.sdk.internal.services.bidtoken.s.f37884a, 1);
        Pair pair2 = new Pair("tag", "22.7.0");
        Pair pair3 = new Pair("src", "android-sdk");
        String string = Locale.getDefault().toString();
        Intrinsics.f(string, "toString(...)");
        Pair pair4 = new Pair("a", MapsKt.j0(new Pair("c", a80.m.n("v", string)), new Pair("d", a80.m.n("v", gVar.f15568e)), new Pair(InneractiveMediationDefs.GENDER_FEMALE, a80.m.n("v", gVar.f15567d)), new Pair("g", a80.m.n("v", gVar.f15566c))));
        String str = fraudDetectionData != null ? fraudDetectionData.f42569b : null;
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair5 = new Pair("d", str);
        String str3 = fraudDetectionData != null ? fraudDetectionData.f42570c : null;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Map mapJ0 = MapsKt.j0(pair5, new Pair("e", str3), new Pair("k", gVar.f15564a), new Pair("o", Build.VERSION.RELEASE), new Pair("p", Integer.valueOf(Build.VERSION.SDK_INT)), new Pair("q", Build.MANUFACTURER), new Pair("r", Build.BRAND), new Pair("s", Build.MODEL), new Pair("t", Build.TAGS));
        String str4 = gVar.f15565b;
        Map mapN = str4 != null ? a80.m.n("l", str4) : null;
        if (mapN == null) {
            mapN = b70.h.f17594a;
        }
        Map mapJ02 = MapsKt.j0(pair, pair2, pair3, pair4, new Pair("b", MapsKt.m0(mapJ0, mapN)));
        String str5 = fraudDetectionData != null ? fraudDetectionData.f42568a : null;
        if (str5 != null) {
            str2 = str5;
        }
        return new ar.f(mapJ02, str2);
    }

    public Object C(int i5, int i11) {
        androidx.fragment.app.x1 x1Var = (androidx.fragment.app.x1) this.f267b;
        Object obj = x1Var.f14712c.get(i5);
        Object obj2 = x1Var.f14713d.get(i11);
        if (obj == null || obj2 == null) {
            throw new AssertionError();
        }
        return ((androidx.recyclerview.widget.t) ((androidx.recyclerview.widget.f) x1Var.f14715f).f14944b.f14915b).getChangePayload(obj, obj2);
    }

    public int D() {
        return ((androidx.fragment.app.x1) this.f267b).f14713d.size();
    }

    public int E() {
        return ((androidx.fragment.app.x1) this.f267b).f14712c.size();
    }

    public void F(int i5) {
        ((p10.c0) this.f267b).J(i5);
    }

    public void G(ah.c cVar) {
        ah.a aVar = (ah.a) this.f267b;
        aVar.f12803a = cVar;
        Iterator it = ((LinkedList) aVar.f12805c).iterator();
        while (it.hasNext()) {
            ((ah.j) it.next()).b();
        }
        ((LinkedList) aVar.f12805c).clear();
        aVar.f12804b = null;
    }

    @Override // dr.b
    /* renamed from: H, reason: merged with bridge method [inline-methods] */
    public FraudDetectionData s(JSONObject jSONObject) {
        String strN;
        String strN2;
        String strN3 = vh.a.N("guid", jSONObject);
        if (strN3 == null || (strN = vh.a.N("muid", jSONObject)) == null || (strN2 = vh.a.N("sid", jSONObject)) == null) {
            return null;
        }
        return new FraudDetectionData(strN3, strN, strN2, ((Number) ((a1.m) this.f267b).invoke()).longValue());
    }

    public void I() {
        ((p10.c0) this.f267b).Z();
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ArrayList J(PaymentMethodMetadata paymentMethodMetadata, List specs, List placeholderOverrideList, ou.w0 w0Var) {
        int i5;
        List listP;
        FormItemSpec formItemSpecS;
        Intrinsics.g(specs, "specs");
        Intrinsics.g(placeholderOverrideList, "placeholderOverrideList");
        ct.p pVar = (ct.p) this.f267b;
        String merchantName = pVar.f47884g;
        LinkedHashMap linkedHashMap = pVar.f47880c;
        PaymentSheet$BillingDetailsCollectionConfiguration configuration = pVar.f47886i;
        boolean z11 = pVar.f47887j;
        Intrinsics.g(configuration, "configuration");
        ArrayList arrayListT = ul.b.T(t3.f48310b, t3.f48311c, t3.f48312d, t3.f48313e);
        ArrayList arrayList = new ArrayList();
        Iterator it = specs.iterator();
        while (true) {
            i5 = 1;
            if (!it.hasNext()) {
                break;
            }
            FormItemSpec spec = (FormItemSpec) it.next();
            Intrinsics.g(spec, "spec");
            boolean z12 = spec instanceof NameSpec;
            if (z12) {
                arrayListT.remove(t3.f48310b);
            } else if (spec instanceof EmailSpec) {
                arrayListT.remove(t3.f48311c);
            } else if (spec instanceof PhoneSpec) {
                arrayListT.remove(t3.f48312d);
            } else if (spec instanceof AddressSpec) {
                arrayListT.remove(t3.f48313e);
            } else if (spec instanceof SepaMandateTextSpec) {
                arrayListT.remove(t3.f48314f);
            } else if (spec instanceof PlaceholderSpec) {
                t3 t3Var = ((PlaceholderSpec) spec).f45330b;
                if (uu.g.f91562a[t3Var.ordinal()] == 1) {
                    arrayListT.remove(t3.f48313e);
                } else {
                    arrayListT.remove(t3Var);
                }
            }
            if (z12) {
                formItemSpecS = configuration.f44513a == ou.n0.f80939b ? null : spec;
            } else if (spec instanceof EmailSpec) {
                if (configuration.f44515c == ou.n0.f80939b) {
                }
            } else if (spec instanceof PhoneSpec) {
                if (configuration.f44514b == ou.n0.f80939b) {
                }
            } else if (spec instanceof AddressSpec) {
                if (configuration.f44516d == ou.m0.f80932b) {
                }
            } else if (spec instanceof PlaceholderSpec) {
                formItemSpecS = ps.f.s(((PlaceholderSpec) spec).f45330b, placeholderOverrideList, z11, configuration, w0Var);
            } else if (spec instanceof SepaMandateTextSpec) {
                if (w0Var == ou.w0.f80998b) {
                }
            } else if (spec instanceof AuBecsDebitMandateTextSpec) {
                if (w0Var == ou.w0.f80998b) {
                }
            }
            if (formItemSpecS != null) {
                arrayList.add(formItemSpecS);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayListT.iterator();
        while (it2.hasNext()) {
            FormItemSpec formItemSpecS2 = ps.f.s((t3) it2.next(), placeholderOverrideList, z11, configuration, w0Var);
            if (formItemSpecS2 != null) {
                arrayList2.add(formItemSpecS2);
            }
        }
        List<FormItemSpec> listD1 = b70.g.D1(new ay.g(new t00.s(13), 9), b70.g.t1(arrayList2, arrayList));
        ArrayList arrayList3 = new ArrayList();
        for (FormItemSpec formItemSpec : listD1) {
            if (formItemSpec instanceof StaticTextSpec) {
                StaticTextSpec staticTextSpec = (StaticTextSpec) formItemSpec;
                listP = ul.b.P(new cw.o4(staticTextSpec.f45347b, staticTextSpec.f45346a));
            } else if (formItemSpec instanceof AfterpayClearpayTextSpec) {
                AfterpayClearpayTextSpec afterpayClearpayTextSpec = (AfterpayClearpayTextSpec) formItemSpec;
                StripeIntent stripeIntent = paymentMethodMetadata.f43092a;
                listP = ul.b.P(new cw.h(afterpayClearpayTextSpec.f45289a, stripeIntent != null ? ps.e0.o(stripeIntent) : null));
            } else if (formItemSpec instanceof AffirmTextSpec) {
                listP = ul.b.P(new cw.e(((AffirmTextSpec) formItemSpec).f45288a));
            } else if (formItemSpec instanceof EmptyFormSpec) {
                listP = ul.b.P(new cw.k2());
            } else if (formItemSpec instanceof MandateTextSpec) {
                listP = ul.b.P(((MandateTextSpec) formItemSpec).a(merchantName));
            } else if (formItemSpec instanceof AuBecsDebitMandateTextSpec) {
                Intrinsics.g(merchantName, "merchantName");
                listP = ul.b.P(new cw.n(((AuBecsDebitMandateTextSpec) formItemSpec).f45291a, merchantName));
            } else {
                int i11 = 4;
                if (formItemSpec instanceof BacsDebitBankAccountSpec) {
                    BacsDebitBankAccountSpec bacsDebitBankAccountSpec = (BacsDebitBankAccountSpec) formItemSpec;
                    IdentifierSpec identifierSpec = bacsDebitBankAccountSpec.f45292a;
                    iw.p pVar2 = null;
                    q2 q2Var = new q2(identifierSpec, new t2(new cw.r(i5), (String) linkedHashMap.get(identifierSpec), pVar2, i11));
                    IdentifierSpec identifierSpec2 = bacsDebitBankAccountSpec.f45293b;
                    List sectionFieldElements = ul.b.Q(q2Var, new q2(identifierSpec2, new t2(new cw.r(0), (String) linkedHashMap.get(identifierSpec2), pVar2, i11)));
                    IdentifierResolvableString identifierResolvableStringU = zg.a.U(2132019709, new Object[0], EmptyList.f71733a);
                    Intrinsics.g(sectionFieldElements, "sectionFieldElements");
                    listP = ul.b.P(kw.o0.b(identifierResolvableStringU, sectionFieldElements));
                } else if (formItemSpec instanceof BacsDebitConfirmSpec) {
                    Intrinsics.g(merchantName, "merchantName");
                    IdentifierSpec identifierSpec3 = ((BacsDebitConfirmSpec) formItemSpec).f45295a;
                    listP = ul.b.P(new kw.w(identifierSpec3, new kw.v(new je.f(new Object[]{merchantName}, 10), Boolean.parseBoolean((String) linkedHashMap.get(identifierSpec3)))));
                } else if (formItemSpec instanceof BsbSpec) {
                    IdentifierSpec identifierSpec4 = ((BsbSpec) formItemSpec).f45296a;
                    listP = ul.b.P(new cw.d0(identifierSpec4, cw.g0.f48152a, (String) linkedHashMap.get(identifierSpec4)));
                } else if (formItemSpec instanceof OTPSpec) {
                    OTPSpec oTPSpec = OTPSpec.INSTANCE;
                    IdentifierSpec.Companion.getClass();
                    listP = ul.b.P(new kw.g1(kw.z0.a("otp"), new kw.d1()));
                } else if (formItemSpec instanceof NameSpec) {
                    listP = ul.b.P(((NameSpec) formItemSpec).f45325c.a(linkedHashMap));
                } else if (formItemSpec instanceof EmailSpec) {
                    listP = ul.b.P(((EmailSpec) formItemSpec).a(linkedHashMap));
                } else if (formItemSpec instanceof PhoneSpec) {
                    listP = ul.b.P(((PhoneSpec) formItemSpec).a(linkedHashMap));
                } else if (formItemSpec instanceof SimpleTextSpec) {
                    listP = ul.b.P(((SimpleTextSpec) formItemSpec).a(linkedHashMap));
                } else if (formItemSpec instanceof AuBankAccountNumberSpec) {
                    IdentifierSpec identifierSpec5 = ((AuBankAccountNumberSpec) formItemSpec).f45290a;
                    listP = ul.b.P(kw.o0.c(new q2(identifierSpec5, new t2(new cw.k(), (String) linkedHashMap.get(identifierSpec5), null, i11)), null));
                } else if (formItemSpec instanceof IbanSpec) {
                    IdentifierSpec identifierSpec6 = ((IbanSpec) formItemSpec).f45315a;
                    listP = ul.b.P(kw.o0.c(new w2(identifierSpec6, new t2(new v2(), (String) linkedHashMap.get(identifierSpec6), null, i11)), null));
                } else if (formItemSpec instanceof KlarnaHeaderStaticTextSpec) {
                    listP = ul.b.P(new cw.o4(2132019820, ((KlarnaHeaderStaticTextSpec) formItemSpec).f45316a));
                } else if (formItemSpec instanceof DropdownSpec) {
                    DropdownSpec dropdownSpec = (DropdownSpec) formItemSpec;
                    IdentifierSpec identifierSpec7 = dropdownSpec.f45306a;
                    listP = ul.b.P(kw.o0.c(new l4(identifierSpec7, new kw.i0(new tm.o(zg.a.U(dropdownSpec.f45307b.f48303a, new Object[0], EmptyList.f71733a), dropdownSpec.f45308c), (String) linkedHashMap.get(identifierSpec7))), null));
                } else {
                    if (formItemSpec instanceof CountrySpec) {
                        CountrySpec countrySpec = (CountrySpec) formItemSpec;
                        IdentifierSpec identifierSpec8 = countrySpec.f45301a;
                        listP = ul.b.P(kw.o0.c(new kw.a0(identifierSpec8, new kw.i0(new bn.d1(countrySpec.f45302b, null, null, 62), (String) linkedHashMap.get(identifierSpec8))), null));
                    } else if (formItemSpec instanceof AddressSpec) {
                        listP = ((AddressSpec) formItemSpec).a(linkedHashMap, pVar.f47882e, pVar.o);
                    } else if (formItemSpec instanceof SepaMandateTextSpec) {
                        Intrinsics.g(merchantName, "merchantName");
                        listP = ul.b.P(((SepaMandateTextSpec) formItemSpec).f45335c.a(merchantName));
                    } else if (formItemSpec instanceof PlaceholderSpec) {
                        listP = EmptyList.f71733a;
                    } else if (formItemSpec instanceof CashAppPayMandateTextSpec) {
                        Intrinsics.g(merchantName, "merchantName");
                        listP = ul.b.P(((CashAppPayMandateTextSpec) formItemSpec).f45299c.a(merchantName, merchantName));
                    } else {
                        if (!(formItemSpec instanceof KlarnaMandateTextSpec)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        Intrinsics.g(merchantName, "merchantName");
                        listP = ul.b.P(((KlarnaMandateTextSpec) formItemSpec).f45319c.a(merchantName, merchantName));
                    }
                    b70.d.z0(listP, arrayList3);
                    i5 = 1;
                }
            }
            b70.d.z0(listP, arrayList3);
            i5 = 1;
        }
        return arrayList3;
    }

    public void K() {
        long jElapsedRealtime;
        x3 x3Var = (x3) this.f267b;
        x3Var.D();
        ai.m1 m1Var = (ai.m1) x3Var.f13368a;
        ai.z0 z0Var = m1Var.f13137e;
        ai.m1.j(z0Var);
        xg.a aVar = m1Var.f13143k;
        aVar.getClass();
        if (z0Var.M(System.currentTimeMillis())) {
            ai.z0 z0Var2 = m1Var.f13137e;
            ai.m1.j(z0Var2);
            z0Var2.f13495l.d(true);
            ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
            ActivityManager.getMyMemoryState(runningAppProcessInfo);
            if (runningAppProcessInfo.importance == 100) {
                ai.o0 o0Var = m1Var.f13138f;
                ai.m1.l(o0Var);
                o0Var.n.a("Detected application was in foreground");
                aVar.getClass();
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (m1Var.f13136d.O(null, ai.x.f13414e1)) {
                    aVar.getClass();
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                } else {
                    jElapsedRealtime = 0;
                }
                P(jCurrentTimeMillis, jElapsedRealtime);
            }
        }
    }

    public void L(int i5, String str, List list, boolean z11, boolean z12) {
        ai.m0 m0Var;
        ai.g1 g1Var = (ai.g1) this.f267b;
        int i11 = i5 - 1;
        if (i11 == 0) {
            ai.o0 o0Var = ((ai.m1) g1Var.f13368a).f13138f;
            ai.m1.l(o0Var);
            m0Var = o0Var.f13197m;
        } else if (i11 != 1) {
            if (i11 == 3) {
                ai.o0 o0Var2 = ((ai.m1) g1Var.f13368a).f13138f;
                ai.m1.l(o0Var2);
                m0Var = o0Var2.n;
            } else if (i11 != 4) {
                ai.o0 o0Var3 = ((ai.m1) g1Var.f13368a).f13138f;
                ai.m1.l(o0Var3);
                m0Var = o0Var3.f13196l;
            } else if (z11) {
                ai.o0 o0Var4 = ((ai.m1) g1Var.f13368a).f13138f;
                ai.m1.l(o0Var4);
                m0Var = o0Var4.f13194j;
            } else if (z12) {
                ai.o0 o0Var5 = ((ai.m1) g1Var.f13368a).f13138f;
                ai.m1.l(o0Var5);
                m0Var = o0Var5.f13193i;
            } else {
                ai.o0 o0Var6 = ((ai.m1) g1Var.f13368a).f13138f;
                ai.m1.l(o0Var6);
                m0Var = o0Var6.f13195k;
            }
        } else if (z11) {
            ai.o0 o0Var7 = ((ai.m1) g1Var.f13368a).f13138f;
            ai.m1.l(o0Var7);
            m0Var = o0Var7.f13191g;
        } else if (z12) {
            ai.o0 o0Var8 = ((ai.m1) g1Var.f13368a).f13138f;
            ai.m1.l(o0Var8);
            m0Var = o0Var8.f13190f;
        } else {
            ai.o0 o0Var9 = ((ai.m1) g1Var.f13368a).f13138f;
            ai.m1.l(o0Var9);
            m0Var = o0Var9.f13192h;
        }
        int size = list.size();
        if (size == 1) {
            m0Var.b(list.get(0), str);
            return;
        }
        if (size == 2) {
            m0Var.c(list.get(0), str, list.get(1));
        } else if (size != 3) {
            m0Var.a(str);
        } else {
            m0Var.d(str, list.get(0), list.get(1), list.get(2));
        }
    }

    public void M(long j11, long j12) {
        x3 x3Var = (x3) this.f267b;
        x3Var.D();
        x3Var.H();
        ai.m1 m1Var = (ai.m1) x3Var.f13368a;
        ai.z0 z0Var = m1Var.f13137e;
        ai.m1.j(z0Var);
        if (z0Var.M(j11)) {
            ai.m1.j(z0Var);
            z0Var.f13495l.d(true);
            m1Var.q().I();
        }
        ai.m1.j(z0Var);
        z0Var.f13497p.g(j11);
        if (z0Var.f13495l.c()) {
            P(j11, j12);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void N(ai.z1 z1Var, int i5) {
        ai.f fVar;
        if (i5 == -30) {
            fVar = ai.f.TCF;
        } else if (i5 == -20) {
            fVar = ai.f.API;
        } else if (i5 == -10) {
            fVar = ai.f.MANIFEST;
        } else if (i5 != 0) {
            fVar = i5 != 30 ? ai.f.UNSET : ai.f.INITIALIZATION;
        }
        ((EnumMap) this.f267b).put((EnumMap) z1Var, (ai.z1) fVar);
    }

    public void P(long j11, long j12) {
        x3 x3Var = (x3) this.f267b;
        x3Var.D();
        ai.m1 m1Var = (ai.m1) x3Var.f13368a;
        if (m1Var.f()) {
            ai.z0 z0Var = m1Var.f13137e;
            ai.m1.j(z0Var);
            z0Var.f13497p.g(j11);
            m1Var.f13143k.getClass();
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            ai.o0 o0Var = m1Var.f13138f;
            ai.m1.l(o0Var);
            o0Var.n.b(Long.valueOf(jElapsedRealtime), "Session started, time");
            long j13 = j11 / 1000;
            Long lValueOf = Long.valueOf(j13);
            ai.t2 t2Var = m1Var.f13145m;
            ai.m1.k(t2Var);
            t2Var.O(j11, lValueOf, TTConst.TRACK_TYPE_AUTO, "_sid");
            ai.m1.j(z0Var);
            z0Var.f13498q.g(j13);
            z0Var.f13495l.d(false);
            Bundle bundle = new Bundle();
            bundle.putLong("_sid", j13);
            ai.m1.k(t2Var);
            t2Var.L(j11, j12, bundle, TTConst.TRACK_TYPE_AUTO, "_s");
            String strR = z0Var.f13503v.R();
            if (TextUtils.isEmpty(strR)) {
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putString("_ffr", strR);
            ai.m1.k(t2Var);
            t2Var.L(j11, j12, bundle2, TTConst.TRACK_TYPE_AUTO, "_ssr");
        }
    }

    public void Q(ai.z1 z1Var, ai.f fVar) {
        ((EnumMap) this.f267b).put((EnumMap) z1Var, (ai.z1) fVar);
    }

    @Override // c0.m2, c0.j2
    public boolean a() {
        ((x7.n) this.f267b).getClass();
        return false;
    }

    @Override // c0.j2
    public long b(c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((x7.n) this.f267b).b(sVar, sVar2, sVar3);
    }

    @Override // a5.e
    public h build() {
        return new h(new d(((ContentInfo.Builder) this.f267b).build()));
    }

    @Override // ai.o4
    public void d(String str, String str2, Bundle bundle) {
        ai.t2 t2Var = (ai.t2) this.f267b;
        if (TextUtils.isEmpty(str)) {
            t2Var.H(TTConst.TRACK_TYPE_AUTO, "_err", bundle);
        } else {
            t2Var.getClass();
            throw new IllegalStateException("Unexpected call on client side");
        }
    }

    @Override // androidx.recyclerview.widget.c1
    public void e(int i5, int i11) {
        ((androidx.recyclerview.widget.b1) this.f267b).notifyItemRangeInserted(i5, i11);
    }

    @Override // a5.e
    public void f(Uri uri) {
        ((ContentInfo.Builder) this.f267b).setLinkUri(uri);
    }

    @Override // z8.b
    public void g(Drawable drawable) {
        int iK = w20.e.k(24);
        drawable.setBounds(0, 0, iK, iK);
        ((WidgetCell) this.f267b).f21327h.setCompoundDrawablesRelative(drawable, null, null, null);
    }

    @Override // c0.t
    public c0.d0 get(int i5) {
        switch (this.f266a) {
            case 24:
                return ((c0.e0[]) this.f267b)[i5];
            default:
                return (c0.e0) this.f267b;
        }
    }

    @Override // a5.g
    public int getSource() {
        return ((ContentInfo) this.f267b).getSource();
    }

    @Override // z8.b
    public void h(Drawable drawable) {
    }

    @Override // qx.f
    public void i(String str) {
        ((FrameLayout) this.f267b).setVisibility(0);
    }

    @Override // androidx.recyclerview.widget.c1
    public void j(int i5, int i11) {
        ((androidx.recyclerview.widget.b1) this.f267b).notifyItemRangeRemoved(i5, i11);
    }

    @Override // c0.j2
    public c0.s k(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((x7.n) this.f267b).k(j11, sVar, sVar2, sVar3);
    }

    @Override // a5.g
    public ContentInfo m() {
        return (ContentInfo) this.f267b;
    }

    @Override // androidx.recyclerview.widget.c1
    public void o(int i5, int i11, Object obj) {
        ((androidx.recyclerview.widget.b1) this.f267b).notifyItemRangeChanged(i5, i11, obj);
    }

    @Override // c0.j2
    public c0.s p(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((x7.n) this.f267b).p(j11, sVar, sVar2, sVar3);
    }

    @Override // a5.g
    public ClipData q() {
        return ((ContentInfo) this.f267b).getClip();
    }

    @Override // androidx.recyclerview.widget.c1
    public void r(int i5, int i11) {
        ((androidx.recyclerview.widget.b1) this.f267b).notifyItemMoved(i5, i11);
    }

    @Override // a5.e
    public void setExtras(Bundle bundle) {
        ((ContentInfo.Builder) this.f267b).setExtras(bundle);
    }

    @Override // c0.j2
    public c0.s t(c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((x7.n) this.f267b).t(sVar, sVar2, sVar3);
    }

    public String toString() {
        switch (this.f266a) {
            case 1:
                return "ContentInfoCompat{" + ((ContentInfo) this.f267b) + "}";
            case 5:
                StringBuilder sb2 = new StringBuilder("1");
                for (ai.z1 z1Var : ai.z1.values()) {
                    ai.f fVar = (ai.f) ((EnumMap) this.f267b).get(z1Var);
                    if (fVar == null) {
                        fVar = ai.f.UNSET;
                    }
                    sb2.append(fVar.f12928a);
                }
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    @Override // z8.b
    public void u(Drawable drawable) {
    }

    @Override // a5.e
    public void v(int i5) {
        ((ContentInfo.Builder) this.f267b).setFlags(i5);
    }

    @Override // a5.g
    public int w() {
        return ((ContentInfo) this.f267b).getFlags();
    }

    @Override // qx.f
    public void y() {
    }

    public boolean z(int i5, int i11) {
        androidx.fragment.app.x1 x1Var = (androidx.fragment.app.x1) this.f267b;
        Object obj = x1Var.f14712c.get(i5);
        Object obj2 = x1Var.f14713d.get(i11);
        if (obj != null && obj2 != null) {
            return ((androidx.recyclerview.widget.t) ((androidx.recyclerview.widget.f) x1Var.f14715f).f14944b.f14915b).areContentsTheSame(obj, obj2);
        }
        if (obj == null && obj2 == null) {
            return true;
        }
        throw new AssertionError();
    }

    public d() {
        this.f266a = 5;
        this.f267b = new EnumMap(ai.z1.class);
    }

    public d(EnumMap enumMap) {
        this.f266a = 5;
        EnumMap enumMap2 = new EnumMap(ai.z1.class);
        this.f267b = enumMap2;
        enumMap2.putAll(enumMap);
    }

    public d(Context context) {
        Object objA;
        String timeZone;
        this.f266a = 15;
        Intrinsics.g(context, "context");
        Intrinsics.g(context, "context");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        String packageName = context.getPackageName();
        packageName = packageName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : packageName;
        try {
            int i5 = Result.f71687b;
            objA = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        PackageInfo packageInfo = (PackageInfo) (objA instanceof Result.Failure ? null : objA);
        String str = packageInfo != null ? packageInfo.versionName : null;
        int iConvert = (int) TimeUnit.MINUTES.convert(TimeZone.getDefault().getRawOffset(), TimeUnit.MILLISECONDS);
        if (iConvert % 60 == 0) {
            timeZone = String.valueOf(iConvert / 60);
        } else {
            timeZone = new BigDecimal(iConvert).setScale(2, 6).divide(new BigDecimal(60), new MathContext(2)).setScale(2, 6).toString();
            Intrinsics.f(timeZone, "toString(...)");
        }
        Intrinsics.g(timeZone, "timeZone");
        ar.g gVar = new ar.g();
        gVar.f15564a = packageName;
        gVar.f15565b = str;
        gVar.f15566c = timeZone;
        gVar.f15567d = displayMetrics.widthPixels + "w_" + displayMetrics.heightPixels + "h_" + displayMetrics.densityDpi + "dpi";
        String str2 = Build.VERSION.RELEASE;
        String str3 = Build.VERSION.CODENAME;
        int i12 = Build.VERSION.SDK_INT;
        StringBuilder sbW = b.c0.w("Android ", str2, " ", str3, " ");
        sbW.append(i12);
        gVar.f15568e = sbW.toString();
        this.f267b = gVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002a A[PHI: r10
      0x002a: PHI (r10v1 int) = (r10v0 int), (r10v3 int), (r10v4 int) binds: [B:5:0x001a, B:10:0x0023, B:12:0x0026] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public d(int[] iArr, float[] fArr, float[][] fArr2) {
        int i5;
        this.f266a = 23;
        int i11 = 1;
        int length = fArr.length - 1;
        c0.u[][] uVarArr = new c0.u[length][];
        int i12 = 1;
        int i13 = 1;
        int i14 = 0;
        while (i14 < length) {
            int i15 = iArr[i14];
            int i16 = 3;
            if (i15 == 0) {
                i5 = i16;
            } else if (i15 == i11) {
                i12 = i11;
                i5 = i12;
            } else {
                if (i15 != 2) {
                    if (i15 != 3) {
                        i16 = 4;
                        if (i15 != 4) {
                            i16 = 5;
                            if (i15 != 5) {
                                i5 = i13;
                            }
                        }
                    } else {
                        if (i12 == i11) {
                        }
                        i5 = i12;
                    }
                }
                i12 = 2;
                i5 = i12;
            }
            float[] fArr3 = fArr2[i14];
            int i17 = i14 + 1;
            float[] fArr4 = fArr2[i17];
            float f11 = fArr[i14];
            float f12 = fArr[i17];
            int length2 = (fArr3.length % 2) + (fArr3.length / 2);
            c0.u[] uVarArr2 = new c0.u[length2];
            int i18 = 0;
            while (i18 < length2) {
                int i19 = i18 * 2;
                int i21 = i18;
                int i22 = i19 + 1;
                uVarArr2[i21] = new c0.u(i5, f11, f12, fArr3[i19], fArr3[i22], fArr4[i19], fArr4[i22]);
                i18 = i21 + 1;
            }
            uVarArr[i14] = uVarArr2;
            i14 = i17;
            i13 = i5;
            i11 = 1;
        }
        this.f267b = uVarArr;
    }

    public d(int i5) {
        this.f266a = 14;
        this.f267b = null;
    }

    public d(TextView textView) {
        this.f266a = 20;
        this.f267b = new b6.h(textView);
    }

    public d(EditText editText) {
        this.f266a = 19;
        this.f267b = new e3(editText);
    }

    public d(View view, Window window) {
        this.f266a = 2;
        v6 v6Var = new v6(view);
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 35) {
            this.f267b = new k2(window, v6Var);
        } else if (i5 >= 30) {
            this.f267b = new j2(window, v6Var);
        } else {
            this.f267b = new i2(window, v6Var);
        }
    }

    public d(ContentInfo contentInfo) {
        this.f266a = 1;
        contentInfo.getClass();
        this.f267b = c.i(contentInfo);
    }

    public d(ClipData clipData, int i5) {
        this.f266a = 0;
        this.f267b = c.g(clipData, i5);
    }

    public d(float f11, float f12, c0.s sVar) {
        d dVar;
        this.f266a = 26;
        int[] iArr = c0.k2.f18854a;
        if (sVar != null) {
            dVar = new d(sVar, f11, f12);
        } else {
            dVar = new d(f11, f12);
        }
        this.f267b = new x7.n(dVar);
    }

    public d(c0.s sVar, float f11, float f12) {
        this.f266a = 24;
        int iB = sVar.b();
        c0.e0[] e0VarArr = new c0.e0[iB];
        for (int i5 = 0; i5 < iB; i5++) {
            e0VarArr[i5] = new c0.e0(f11, f12, sVar.a(i5));
        }
        this.f267b = e0VarArr;
    }

    public d(float f11, float f12) {
        this.f266a = 25;
        this.f267b = new c0.e0(f11, f12, 0.01f);
    }
}
