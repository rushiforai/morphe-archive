package ads_mobile_sdk;

import b.e9;
import b.ob;
import b.r2;
import b.x4;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import hn.o;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public final class jn extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public static final jn f5311a;
    public static final jn a$1;
    public static final jn a$10;
    public static final jn a$11;
    public static final jn a$12;
    public static final jn a$13;
    public static final jn a$14;
    public static final jn a$15;
    public static final jn a$16;
    public static final jn a$17;
    public static final jn a$18;
    public static final jn a$19;
    public static final jn a$2;
    public static final jn a$20;
    public static final jn a$21;
    public static final jn a$22;
    public static final jn a$3;
    public static final jn a$4;
    public static final jn a$5;
    public static final jn a$6;
    public static final jn a$7;
    public static final jn a$8;
    public static final jn a$9;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f5312j;

    static {
        int i5 = 1;
        a$1 = new jn(i5, 1);
        a$2 = new jn(i5, 2);
        f5311a = new jn(i5, 0);
        a$3 = new jn(i5, 3);
        a$4 = new jn(i5, 4);
        a$5 = new jn(i5, 5);
        a$6 = new jn(i5, 6);
        a$7 = new jn(i5, 7);
        a$8 = new jn(i5, 8);
        a$9 = new jn(i5, 9);
        a$10 = new jn(i5, 10);
        a$11 = new jn(i5, 11);
        a$12 = new jn(i5, 12);
        a$13 = new jn(i5, 13);
        a$14 = new jn(i5, 14);
        a$15 = new jn(i5, 15);
        a$16 = new jn(i5, 16);
        a$17 = new jn(i5, 17);
        a$18 = new jn(i5, 18);
        a$19 = new jn(i5, 19);
        a$20 = new jn(i5, 20);
        a$21 = new jn(i5, 21);
        a$22 = new jn(i5, 22);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jn(int i5, int i11) {
        super(i5);
        this.f5312j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f5312j) {
            case 0:
                com.google.gson.p it = (com.google.gson.p) obj;
                Intrinsics.g(it, "it");
                return it.o();
            case 1:
                com.google.gson.p it2 = (com.google.gson.p) obj;
                Intrinsics.g(it2, "it");
                return Double.valueOf(it2.e());
            case 2:
                com.google.gson.p it3 = (com.google.gson.p) obj;
                Intrinsics.g(it3, "it");
                return Integer.valueOf(it3.g());
            case 3:
                com.google.gson.p it4 = (com.google.gson.p) obj;
                Intrinsics.g(it4, "it");
                return it4.o();
            case 4:
                g1 manifest = (g1) obj;
                Intrinsics.g(manifest, "manifest");
                Collection collectionValues = manifest.u().values();
                if ((collectionValues instanceof Collection) && collectionValues.isEmpty()) {
                    return manifest;
                }
                Iterator it5 = collectionValues.iterator();
                while (it5.hasNext()) {
                    Collection collectionValues2 = ((vr0) it5.next()).o().values();
                    if (!(collectionValues2 instanceof Collection) || !collectionValues2.isEmpty()) {
                        Iterator it6 = collectionValues2.iterator();
                        while (it6.hasNext()) {
                            e9 e9VarR = ((g6) it6.next()).r();
                            Intrinsics.f(e9VarR, "getResponsesList(...)");
                            if (!(e9VarR instanceof Collection) || !e9VarR.isEmpty()) {
                                Iterator<E> it7 = e9VarR.iterator();
                                while (it7.hasNext()) {
                                    z5 z5VarR = ((b6) it7.next()).r();
                                    z5 z5Var = z5.AVAILABLE;
                                    if (z5VarR != z5Var) {
                                        r2 r2Var = (r2) manifest.n();
                                        Map mapE = r2Var.e();
                                        Intrinsics.f(mapE, "getPoolsMap(...)");
                                        for (String key : b70.g.I1(new x4(mapE.keySet()))) {
                                            Map mapE2 = r2Var.e();
                                            Intrinsics.f(mapE2, "getPoolsMap(...)");
                                            vr0 vr0Var = (vr0) mapE2.get(key);
                                            if (vr0Var != null) {
                                                Intrinsics.f(r2Var.e(), "getPoolsMap(...)");
                                                ob obVar = (ob) vr0Var.n();
                                                Map mapE3 = obVar.e();
                                                Intrinsics.f(mapE3, "getAdResponseListsMap(...)");
                                                for (String key2 : b70.g.I1(new x4(mapE3.keySet()))) {
                                                    Map mapE4 = obVar.e();
                                                    Intrinsics.f(mapE4, "getAdResponseListsMap(...)");
                                                    g6 g6Var = (g6) mapE4.get(key2);
                                                    if (g6Var != null) {
                                                        Intrinsics.f(obVar.e(), "getAdResponseListsMap(...)");
                                                        b.u2 u2Var = (b.u2) g6Var.n();
                                                        List listF = u2Var.f();
                                                        Intrinsics.f(listF, "getResponsesList(...)");
                                                        Iterator delegate = listF.iterator();
                                                        Intrinsics.g(delegate, "delegate");
                                                        int i5 = 0;
                                                        while (delegate.hasNext()) {
                                                            int i11 = i5 + 1;
                                                            b6 b6Var = (b6) delegate.next();
                                                            if (b6Var.r() != z5Var) {
                                                                Intrinsics.f(u2Var.f(), "getResponsesList(...)");
                                                                b.k kVar = (b.k) b6Var.n();
                                                                kVar.c(z5Var);
                                                                Unit unit = Unit.f71706a;
                                                                b6 b6Var2 = (b6) kVar.a();
                                                                u2Var.b();
                                                                ((g6) u2Var.f1095b).a(i5, b6Var2);
                                                            }
                                                            i5 = i11;
                                                        }
                                                        g6 g6Var2 = (g6) u2Var.a();
                                                        Intrinsics.g(key2, "key");
                                                        obVar.d(key2, g6Var2);
                                                    }
                                                }
                                                vr0 vr0Var2 = (vr0) obVar.a();
                                                Intrinsics.g(key, "key");
                                                r2Var.d(key, vr0Var2);
                                            }
                                        }
                                        return (g1) r2Var.a();
                                    }
                                }
                            }
                        }
                    }
                }
                return manifest;
            case 5:
                com.google.gson.p it8 = (com.google.gson.p) obj;
                Intrinsics.g(it8, "it");
                return it8.o();
            case 6:
                com.google.gson.p it9 = (com.google.gson.p) obj;
                Intrinsics.g(it9, "it");
                return Boolean.valueOf(it9.d());
            case 7:
                com.google.gson.p it10 = (com.google.gson.p) obj;
                Intrinsics.g(it10, "it");
                return Integer.valueOf(it10.g());
            case 8:
                com.google.gson.p it11 = (com.google.gson.p) obj;
                Intrinsics.g(it11, "it");
                return it11.o();
            case 9:
                String str = (String) obj;
                return Boolean.valueOf(!(str == null || str.length() == 0));
            case 10:
                com.google.gson.p it12 = (com.google.gson.p) obj;
                Intrinsics.g(it12, "it");
                return Boolean.valueOf(it12.d());
            case 11:
                com.google.gson.p it13 = (com.google.gson.p) obj;
                Intrinsics.g(it13, "it");
                Duration.Companion companion = Duration.f72038b;
                return new Duration(DurationKt.g(it13.g(), DurationUnit.f72049h));
            case 12:
                com.google.gson.p it14 = (com.google.gson.p) obj;
                Intrinsics.g(it14, "it");
                return Double.valueOf(it14.e());
            case 13:
                com.google.gson.p it15 = (com.google.gson.p) obj;
                Intrinsics.g(it15, "it");
                o oVar = it15.j().f34795a;
                Intrinsics.f(oVar, "asMap(...)");
                LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(oVar.f59936d));
                for (Map.Entry entry : oVar.entrySet()) {
                    linkedHashMap.put(entry.getKey(), Double.valueOf(((com.google.gson.p) entry.getValue()).e()));
                }
                return linkedHashMap;
            case 14:
                com.google.gson.p it16 = (com.google.gson.p) obj;
                Intrinsics.g(it16, "it");
                return Float.valueOf(it16.f());
            case 15:
                com.google.gson.p it17 = (com.google.gson.p) obj;
                Intrinsics.g(it17, "it");
                return Integer.valueOf(it17.g());
            case 16:
                com.google.gson.p jsonElement = (com.google.gson.p) obj;
                Intrinsics.g(jsonElement, "jsonElement");
                String strO = jsonElement.o();
                Intrinsics.f(strO, "getAsString(...)");
                List listI1 = r70.k.i1(strO, new String[]{","}, 6);
                ArrayList arrayList = new ArrayList(b70.c.u0(listI1, 10));
                Iterator it18 = listI1.iterator();
                while (it18.hasNext()) {
                    arrayList.add(Integer.valueOf(Integer.parseInt((String) it18.next())));
                }
                return arrayList;
            case 17:
                od1 ad = (od1) obj;
                Intrinsics.g(ad, "ad");
                return new ls1(ad);
            case 18:
                Intrinsics.g((g1) obj, "<anonymous parameter 0>");
                g1 g1VarQ = g1.q();
                Intrinsics.f(g1VarQ, "getDefaultInstance(...)");
                return g1VarQ;
            case 19:
                com.google.gson.p it19 = (com.google.gson.p) obj;
                Intrinsics.g(it19, "it");
                return it19.j();
            case 20:
                com.google.gson.p it20 = (com.google.gson.p) obj;
                Intrinsics.g(it20, "it");
                String strO2 = it20.o();
                Intrinsics.f(strO2, "getAsString(...)");
                return r70.k.i1(strO2, new String[]{","}, 6);
            case 21:
                InternalNativeAd ad2 = (InternalNativeAd) obj;
                Intrinsics.g(ad2, "ad");
                return new ms1(ad2);
            default:
                s43 update = (s43) obj;
                Intrinsics.g(update, "$this$update");
                b.q4 q4Var = update.f9413a;
                q4Var.b();
                k43 k43Var = (k43) q4Var.f1095b;
                k43Var.bitField0_ |= 1;
                k43Var.isInstallReferrerReported_ = true;
                return Unit.f71706a;
        }
    }
}
