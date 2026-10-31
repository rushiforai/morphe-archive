package ads_mobile_sdk;

import android.content.Context;
import android.content.Intent;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.TableRow;
import android.widget.TextView;
import b.a7;
import b.e0;
import c80.d;
import com.google.android.libraries.ads.mobile.sdk.common.AdActivity;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import wi.f;

/* loaded from: classes.dex */
public final class ca2 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f1747a;

    /* renamed from: b, reason: collision with root package name */
    public final rw0 f1748b;

    /* renamed from: c, reason: collision with root package name */
    public final g0 f1749c;

    /* renamed from: d, reason: collision with root package name */
    public final w81 f1750d;

    /* renamed from: e, reason: collision with root package name */
    public final cb0 f1751e;

    /* renamed from: f, reason: collision with root package name */
    public final cb0 f1752f;

    /* renamed from: g, reason: collision with root package name */
    public final cb0 f1753g;

    /* renamed from: h, reason: collision with root package name */
    public final cb0 f1754h;

    /* renamed from: i, reason: collision with root package name */
    public final cb0 f1755i;

    /* renamed from: j, reason: collision with root package name */
    public final d f1756j;

    /* renamed from: k, reason: collision with root package name */
    public final LinkedHashMap f1757k;

    public ca2(Context applicationContext, rw0 gmaUtil, g0 activityTracker, w81 inspectorManager, cb0 appOpenComponentProvider, cb0 bannerComponentProvider, cb0 interstitialComponentProvider, cb0 nativeComponentProvider, cb0 cb0Var) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(inspectorManager, "inspectorManager");
        Intrinsics.g(appOpenComponentProvider, "appOpenComponentProvider");
        Intrinsics.g(bannerComponentProvider, "bannerComponentProvider");
        Intrinsics.g(interstitialComponentProvider, "interstitialComponentProvider");
        Intrinsics.g(nativeComponentProvider, "nativeComponentProvider");
        this.f1747a = applicationContext;
        this.f1748b = gmaUtil;
        this.f1749c = activityTracker;
        this.f1750d = inspectorManager;
        this.f1751e = appOpenComponentProvider;
        this.f1752f = bannerComponentProvider;
        this.f1753g = interstitialComponentProvider;
        this.f1754h = nativeComponentProvider;
        this.f1755i = cb0Var;
        this.f1756j = new d();
        this.f1757k = new LinkedHashMap();
    }

    public static void a(ni.k kVar, ni.p pVar) {
        for (String keyword : kVar.f78312e) {
            Intrinsics.g(keyword, "keyword");
            pVar.f78304f.add(keyword);
        }
        pVar.b(kVar.f78311d);
        for (Map.Entry entry : kVar.f78310c.entrySet()) {
            String key = (String) entry.getKey();
            String value = (String) entry.getValue();
            Intrinsics.g(key, "key");
            Intrinsics.g(value, "value");
            pVar.f78302d.put(key, value);
        }
        String str = kVar.f78309b;
        if (str != null) {
            if (str.length() <= 0) {
                throw new IllegalArgumentException("Content URL must be non-empty.");
            }
            pVar.f78301c = str;
            pVar.a();
        }
        pVar.c(kVar.f78313f);
        String str2 = kVar.f78315h;
        if (str2 != null) {
            pVar.f78307i = str2;
            pVar.a();
        }
        for (String categoryExclusion : kVar.f78308a) {
            Intrinsics.g(categoryExclusion, "categoryExclusion");
            pVar.f78300b.add(categoryExclusion);
        }
    }

    public static final TextView b(ca2 ca2Var, AdActivity adActivity, String str, String str2) {
        TextView textView = new TextView(adActivity);
        textView.setTag(str2);
        textView.setText(str);
        textView.setTextAppearance(16973892);
        textView.setTextColor(-16777216);
        ViewGroup.LayoutParams layoutParams = textView.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = new TableRow.LayoutParams();
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(layoutParams);
        marginLayoutParams.width = -2;
        marginLayoutParams.height = -2;
        marginLayoutParams.bottomMargin = (int) TypedValue.applyDimension(1, 12.0f, textView.getResources().getDisplayMetrics());
        textView.setLayoutParams(marginLayoutParams);
        return textView;
    }

    public static final TextView a(ca2 ca2Var, AdActivity adActivity, String str, String str2) {
        TextView textView = new TextView(adActivity);
        textView.setTag(str2);
        textView.setText(str);
        textView.setTextAppearance(16973894);
        textView.setTextColor(-9210245);
        ViewGroup.LayoutParams layoutParams = textView.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = new TableRow.LayoutParams();
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(layoutParams);
        marginLayoutParams.width = -2;
        marginLayoutParams.height = -2;
        marginLayoutParams.bottomMargin = (int) TypedValue.applyDimension(1, 0.0f, textView.getResources().getDisplayMetrics());
        textView.setLayoutParams(marginLayoutParams);
        return textView;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x0118, code lost:
    
        if (ads_mobile_sdk.w81.d(r11, r0) == r1) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(a7 a7Var, ea2 ea2Var, Continuation continuation) throws Throwable {
        y92 y92Var;
        ca2 ca2Var;
        a7 a7Var2;
        d dVar;
        ea2 ea2Var2;
        b.pd pdVar;
        if (continuation instanceof y92) {
            y92Var = (y92) continuation;
            int i5 = y92Var.f11981h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y92Var.f11981h = i5 - Integer.MIN_VALUE;
            } else {
                y92Var = new y92(this, continuation);
            }
        }
        Object objA = y92Var.f11979f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = y92Var.f11981h;
        if (i11 == 0) {
            ResultKt.b(objA);
            wo2 wo2VarA = a7Var.a();
            y92Var.f11974a = this;
            y92Var.f11975b = a7Var;
            y92Var.f11976c = ea2Var;
            y92Var.f11981h = 1;
            wo2VarA.getClass();
            objA = wo2.a(wo2VarA, y92Var);
            if (objA != coroutineSingletons) {
                ca2Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ea2Var = y92Var.f11976c;
            a7Var = y92Var.f11975b;
            ca2 ca2Var2 = y92Var.f11974a;
            ResultKt.b(objA);
            ca2Var = ca2Var2;
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
                return Unit.f71706a;
            }
            dVar = y92Var.f11978e;
            pdVar = y92Var.f11977d;
            ea2Var2 = y92Var.f11976c;
            a7Var2 = y92Var.f11975b;
            ca2Var = y92Var.f11974a;
            ResultKt.b(objA);
            try {
                ca2Var.f1757k.put(ea2Var2.a(), new Pair(a7Var2.b(), ((yo2) pdVar).a()));
                if ((((yo2) pdVar).a() instanceof gh1) && ea2Var2.b() != null) {
                    Object objA2 = ((yo2) pdVar).a();
                    Intrinsics.e(objA2, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.rewarded.InternalRewardedAd");
                    f options = ea2Var2.b();
                    Intrinsics.g(options, "options");
                    a33 a33Var = ((gh1) objA2).f3849p;
                    a33Var.f824a.setValue(a33Var, a33.f823b[0], options);
                }
                Unit unit = Unit.f71706a;
                dVar.g(null);
                w81 w81Var = ca2Var.f1750d;
                y92Var.f11974a = null;
                y92Var.f11975b = null;
                y92Var.f11976c = null;
                y92Var.f11977d = null;
                y92Var.f11978e = null;
                y92Var.f11981h = 3;
                w81Var.getClass();
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        b.pd pdVar2 = (b.pd) objA;
        if (pdVar2 instanceof yo2) {
            d dVar2 = ca2Var.f1756j;
            y92Var.f11974a = ca2Var;
            y92Var.f11975b = a7Var;
            y92Var.f11976c = ea2Var;
            y92Var.f11977d = (yo2) pdVar2;
            y92Var.f11978e = dVar2;
            y92Var.f11981h = 2;
            if (dVar2.e(y92Var) != coroutineSingletons) {
                a7Var2 = a7Var;
                dVar = dVar2;
                ea2Var2 = ea2Var;
                pdVar = pdVar2;
                ca2Var.f1757k.put(ea2Var2.a(), new Pair(a7Var2.b(), ((yo2) pdVar).a()));
                if (((yo2) pdVar).a() instanceof gh1) {
                    Object objA22 = ((yo2) pdVar).a();
                    Intrinsics.e(objA22, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.rewarded.InternalRewardedAd");
                    f options2 = ea2Var2.b();
                    Intrinsics.g(options2, "options");
                    a33 a33Var2 = ((gh1) objA22).f3849p;
                    a33Var2.f824a.setValue(a33Var2, a33.f823b[0], options2);
                }
                Unit unit2 = Unit.f71706a;
                dVar.g(null);
                w81 w81Var2 = ca2Var.f1750d;
                y92Var.f11974a = null;
                y92Var.f11975b = null;
                y92Var.f11976c = null;
                y92Var.f11977d = null;
                y92Var.f11978e = null;
                y92Var.f11981h = 3;
                w81Var2.getClass();
            }
            return coroutineSingletons;
        }
        if (pdVar2 instanceof xo2) {
            zi3.a(6, "OOCT request failed to load: " + ((xo2) pdVar2).a(), null);
        }
        w81 w81Var22 = ca2Var.f1750d;
        y92Var.f11974a = null;
        y92Var.f11975b = null;
        y92Var.f11976c = null;
        y92Var.f11977d = null;
        y92Var.f11978e = null;
        y92Var.f11981h = 3;
        w81Var22.getClass();
    }

    public final Object a(ea2 ea2Var, Continuation continuation) throws Throwable {
        qw2 qw2Var = ea2Var.f2811b;
        ni.k kVarD = ea2Var.f2813d;
        if (kVarD == null) {
            kVarD = new ni.j(ea2Var.f2810a).d();
        }
        rd0 rd0Var = (rd0) ((b.rd) this.f1755i.get());
        rd0Var.a(qw2Var);
        rd0Var.a(kVarD);
        rd0Var.f9117c = kVarD;
        rd0Var.b(true);
        rd0Var.a(false);
        Object objA = a(rd0Var.b(), ea2Var, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:61:0x0156, code lost:
    
        if (ads_mobile_sdk.w81.d(r10, r0) != r1) goto L63;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r10v23, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(ca2 ca2Var, ea2 ea2Var, Continuation continuation) {
        z92 z92Var;
        d dVar;
        ca2 ca2Var2;
        Object obj;
        Context contextB;
        if (continuation instanceof z92) {
            z92Var = (z92) continuation;
            int i5 = z92Var.f12490f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z92Var.f12490f = i5 - Integer.MIN_VALUE;
            } else {
                z92Var = new z92(ca2Var, continuation);
            }
        }
        Object obj2 = z92Var.f12488d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z92Var.f12490f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                dVar = ca2Var.f1756j;
                z92Var.f12485a = ca2Var;
                z92Var.f12486b = ea2Var;
                z92Var.f12487c = dVar;
                z92Var.f12490f = 1;
                if (dVar.e(z92Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                ?? r102 = (c80.a) z92Var.f12487c;
                ea2Var = z92Var.f12486b;
                ca2 ca2Var3 = z92Var.f12485a;
                ResultKt.b(obj2);
                dVar = r102;
                ca2Var = ca2Var3;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                    return Unit.f71706a;
                }
                obj = z92Var.f12487c;
                ea2Var = z92Var.f12486b;
                ca2Var2 = z92Var.f12485a;
                ResultKt.b(obj2);
                if (obj instanceof io) {
                    io ioVar = (io) obj;
                    ioVar.n = ea2Var.f2822m;
                    ioVar.o = true;
                }
                g0 g0Var = ca2Var2.f1749c;
                rw0 rw0Var = ca2Var2.f1748b;
                contextB = g0Var.b();
                if (contextB == null) {
                    contextB = ca2Var2.f1747a;
                }
                if (!(obj instanceof ed1)) {
                    ((ed1) obj).a(contextB);
                } else if (obj instanceof e0) {
                    ((e0) obj).a(contextB);
                } else if (obj instanceof gh1) {
                    ((gh1) obj).a(contextB);
                } else if (obj instanceof od1) {
                    Intent intentA = rw0Var.a(contextB, new aa2(ea2Var, (od1) obj));
                    intentA.addFlags(524288);
                    intentA.addFlags(134217728);
                    rw0Var.a(intentA);
                } else if (obj instanceof InternalNativeAd) {
                    Intent intentA2 = rw0Var.a(contextB, new ba2(contextB, ca2Var2, (InternalNativeAd) obj, ea2Var.n));
                    intentA2.addFlags(524288);
                    intentA2.addFlags(134217728);
                    rw0Var.a(intentA2);
                } else if (obj instanceof ms1) {
                    Intent intentA3 = rw0Var.a(contextB, new ba2(contextB, ca2Var2, ((ms1) obj).f7330a, ea2Var.n));
                    intentA3.addFlags(524288);
                    intentA3.addFlags(134217728);
                    rw0Var.a(intentA3);
                } else if (obj instanceof ls1) {
                    Intent intentA4 = rw0Var.a(contextB, new aa2(ea2Var, ((ls1) obj).f6942a));
                    intentA4.addFlags(524288);
                    intentA4.addFlags(134217728);
                    rw0Var.a(intentA4);
                }
                w81 w81Var = ca2Var2.f1750d;
                z92Var.f12485a = null;
                z92Var.f12486b = null;
                z92Var.f12487c = null;
                z92Var.f12490f = 3;
                w81Var.getClass();
            }
            Pair pair = (Pair) ca2Var.f1757k.remove(ea2Var.f2810a);
            if (pair == null) {
                return Unit.f71706a;
            }
            dVar.g(null);
            b71 b71Var = (b71) pair.f71683a;
            Object obj3 = pair.f71684b;
            z92Var.f12485a = ca2Var;
            z92Var.f12486b = ea2Var;
            z92Var.f12487c = obj3;
            z92Var.f12490f = 2;
            b71Var.getClass();
            if (b71.a(b71Var, z92Var) != coroutineSingletons) {
                ca2Var2 = ca2Var;
                obj = obj3;
                if (obj instanceof io) {
                }
                g0 g0Var2 = ca2Var2.f1749c;
                rw0 rw0Var2 = ca2Var2.f1748b;
                contextB = g0Var2.b();
                if (contextB == null) {
                }
                if (!(obj instanceof ed1)) {
                }
                w81 w81Var2 = ca2Var2.f1750d;
                z92Var.f12485a = null;
                z92Var.f12486b = null;
                z92Var.f12487c = null;
                z92Var.f12490f = 3;
                w81Var2.getClass();
            }
            return coroutineSingletons;
        } finally {
            dVar.g(null);
        }
    }
}
