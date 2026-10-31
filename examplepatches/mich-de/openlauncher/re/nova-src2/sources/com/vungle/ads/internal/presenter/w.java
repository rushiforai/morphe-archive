package com.vungle.ads.internal.presenter;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.ContextThemeWrapper;
import android.view.MotionEvent;
import android.view.View;
import b.z9;
import com.vungle.ads.PrivacyUrlError;
import com.vungle.ads.TpatError;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.o1;
import com.vungle.ads.internal.p0;
import com.vungle.ads.internal.privacy.PrivacyConsent;
import com.vungle.ads.internal.privacy.PrivacyManager;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47420a;

    /* renamed from: b, reason: collision with root package name */
    public final x f47421b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f47422c;

    /* renamed from: d, reason: collision with root package name */
    public final com.vungle.ads.internal.platform.f f47423d;

    /* renamed from: e, reason: collision with root package name */
    public Long f47424e;

    /* renamed from: f, reason: collision with root package name */
    public a f47425f;

    /* renamed from: g, reason: collision with root package name */
    public final Lazy f47426g;

    /* renamed from: h, reason: collision with root package name */
    public AlertDialog f47427h;

    /* renamed from: i, reason: collision with root package name */
    public final Lazy f47428i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f47429j;

    /* renamed from: k, reason: collision with root package name */
    public final Map f47430k;

    /* renamed from: l, reason: collision with root package name */
    public final LinkedHashMap f47431l;

    /* renamed from: m, reason: collision with root package name */
    public final Map f47432m;
    public com.vungle.ads.internal.omsdk.b n;
    public p0 o;

    public w(Context context, o1 delegate, i0 advertisement, com.vungle.ads.internal.platform.f platform) {
        Intrinsics.g(context, "context");
        Intrinsics.g(delegate, "delegate");
        Intrinsics.g(advertisement, "advertisement");
        Intrinsics.g(platform, "platform");
        this.f47420a = context;
        this.f47421b = delegate;
        this.f47422c = advertisement;
        this.f47423d = platform;
        this.f47426g = LazyKt.b(LazyThreadSafetyMode.f71679a, new v(context));
        this.f47428i = LazyKt.a(new t(this));
        this.f47429j = new LinkedHashMap();
        Boolean bool = Boolean.TRUE;
        this.f47430k = MapsKt.j0(new Pair("video.mute", bool), new Pair("video.unmute", bool));
        this.f47431l = new LinkedHashMap();
        this.f47432m = MapsKt.j0(new Pair(8, bool), new Pair(9, bool), new Pair(10, bool));
        this.o = new p0(context, advertisement);
    }

    public final com.vungle.ads.internal.util.s a() {
        return (com.vungle.ads.internal.util.s) this.f47428i.getValue();
    }

    public final com.vungle.ads.internal.network.r b() {
        return (com.vungle.ads.internal.network.r) this.f47426g.getValue();
    }

    public final void c() {
        ConfigManager.INSTANCE.getClass();
        if (ConfigManager.m()) {
            PrivacyManager.INSTANCE.getClass();
            if ("unknown".equals(PrivacyManager.b())) {
                d();
            }
        }
        a aVar = this.f47425f;
        if (aVar != null) {
            aVar.a("start", null, ((o1) this.f47421b).r());
        }
        this.f47424e = Long.valueOf(System.currentTimeMillis());
    }

    public final void d() {
        PrivacyManager.INSTANCE.getClass();
        PrivacyManager.a("opted_out_by_timeout", "vungle_modal", null);
        if (!(this.f47420a instanceof Activity)) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.c("NativeAdPresenter", "We can not show GDPR dialog with application context.");
            return;
        }
        int i5 = 3;
        z9 z9Var = new z9(this, i5);
        ConfigManager.INSTANCE.getClass();
        String strL = ConfigManager.l();
        String strK = ConfigManager.k();
        String strI = ConfigManager.i();
        String strJ = ConfigManager.j();
        Context context = this.f47420a;
        AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(context, ((Activity) context).getApplicationInfo().theme));
        if (strL != null && strL.length() != 0) {
            builder.setTitle(strL);
        }
        if (strK != null && strK.length() != 0) {
            builder.setMessage(strK);
        }
        builder.setPositiveButton(strI, z9Var);
        builder.setNegativeButton(strJ, z9Var);
        builder.setCancelable(false);
        AlertDialog alertDialogCreate = builder.create();
        alertDialogCreate.setOnDismissListener(new h10.q(this, i5));
        this.f47427h = alertDialogCreate;
        alertDialogCreate.show();
    }

    public final void a(a aVar) {
        this.f47425f = aVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x0109  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(String action, String str, String str2) {
        List listB;
        a aVar;
        Intrinsics.g(action, "action");
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        StringBuilder sbW = b.c0.w("processCommand: action=", action, " event=", str, " value=");
        sbW.append(str2);
        com.vungle.ads.internal.util.t.a("NativeAdPresenter", sbW.toString());
        int iHashCode = action.hashCode();
        if (iHashCode != -511324706) {
            if (iHashCode != 3566511) {
                if (iHashCode == 1427818632 && action.equals("download")) {
                    a("tpat", "clickUrl", (String) null);
                    a("tpat", "cta_url", str2);
                    com.vungle.ads.internal.model.i iVarK = this.f47422c.k();
                    String str3 = iVarK != null ? iVarK.f47026f : null;
                    boolean zA = com.vungle.ads.internal.util.l.a(str3, str2, this.f47420a, a(), new u(str3, this));
                    a aVar2 = this.f47425f;
                    if (aVar2 != null) {
                        aVar2.a("open", "adClick", ((o1) this.f47421b).r());
                    }
                    if (!zA || (aVar = this.f47425f) == null) {
                        return;
                    }
                    aVar.a("open", "adLeftApplication", ((o1) this.f47421b).r());
                    return;
                }
            } else if (action.equals("tpat")) {
                if (str != null && str.length() != 0) {
                    Object obj = this.f47430k.get(str);
                    Boolean bool = Boolean.TRUE;
                    if (!Intrinsics.b(obj, bool) && Intrinsics.b(this.f47429j.get(str), bool)) {
                        com.vungle.ads.internal.util.t.a("NativeAdPresenter", "Ignore this already fired TPAT: " + str);
                        return;
                    }
                    this.f47429j.put(str, bool);
                    int iHashCode2 = str.hashCode();
                    if (iHashCode2 != -2125915830) {
                        if (iHashCode2 != -747709511) {
                            if (iHashCode2 == 1082060480 && str.equals("cta_url")) {
                                listB = str2 != null ? ul.b.P(str2) : null;
                            } else {
                                listB = i0.a(this.f47422c, str, (String) null, 6);
                            }
                        } else if (str.equals("video.length")) {
                            listB = i0.a(this.f47422c, str, str2, 4);
                        }
                    } else if (str.equals("checkpoint.0")) {
                        listB = this.f47422c.b(str, ((com.vungle.ads.internal.platform.c) this.f47423d).e(), String.valueOf(((com.vungle.ads.internal.platform.c) this.f47423d).k()));
                    }
                    if (listB != null && !listB.isEmpty()) {
                        Iterator it = listB.iterator();
                        while (it.hasNext()) {
                            b().a(new com.vungle.ads.internal.network.p((String) it.next()).b(str).a(a()).a(), false);
                        }
                    } else {
                        new TpatError(Sdk.SDKError.Reason.INVALID_TPAT_KEY, b.c0.m("Empty urls for tpat: ", str, " value=", str2)).setLogEntry$vungle_ads_release(a()).logErrorNoReturnValue$vungle_ads_release();
                    }
                    if (str.equals("checkpoint.0")) {
                        AnalyticsClient.a(AnalyticsClient.INSTANCE, new k2(Sdk.SDKMetric.SDKMetricType.AD_START_EVENT), a(), 4);
                        a aVar3 = this.f47425f;
                        if (aVar3 != null) {
                            aVar3.a("adViewed", null, ((o1) this.f47421b).r());
                            return;
                        }
                        return;
                    }
                    return;
                }
                new TpatError(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR, "Empty tpat key").setLogEntry$vungle_ads_release(a()).logErrorNoReturnValue$vungle_ads_release();
                return;
            }
        } else if (action.equals("openPrivacy")) {
            AnalyticsClient.a(AnalyticsClient.INSTANCE, new k2(Sdk.SDKMetric.SDKMetricType.PRIVACY_URL_OPENED), a(), 4);
            if (str2 != null) {
                if (com.vungle.ads.internal.util.n.a(str2)) {
                    if (com.vungle.ads.internal.util.l.a(null, str2, this.f47420a, a(), null)) {
                        a aVar4 = this.f47425f;
                        if (aVar4 != null) {
                            aVar4.a("open", "adLeftApplication", ((o1) this.f47421b).r());
                            return;
                        }
                        return;
                    }
                    new PrivacyUrlError(str2).setLogEntry$vungle_ads_release(a()).logErrorNoReturnValue$vungle_ads_release();
                    return;
                }
                new PrivacyUrlError(str2).setLogEntry$vungle_ads_release(a()).logErrorNoReturnValue$vungle_ads_release();
                return;
            }
            return;
        }
        com.vungle.ads.internal.util.t.c("NativeAdPresenter", "Unknown native ad action: ".concat(action));
    }

    public final void a(MotionEvent motionEvent) {
        if (motionEvent != null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("NativeAdPresenter", "user interaction on Native ad");
            this.o.a(motionEvent);
        }
    }

    public static final void a(w this$0, DialogInterface dialogInterface, int i5) {
        String value;
        Intrinsics.g(this$0, "this$0");
        if (i5 == -2) {
            value = PrivacyConsent.OPT_OUT.getValue();
        } else if (i5 != -1) {
            value = "opted_out_by_timeout";
        } else {
            value = PrivacyConsent.OPT_IN.getValue();
        }
        PrivacyManager.INSTANCE.getClass();
        PrivacyManager.a(value, "vungle_modal", null);
        ConfigManager.INSTANCE.getClass();
        if (ConfigManager.m() && "unknown".equals(PrivacyManager.b())) {
            this$0.d();
        }
    }

    public static final void a(w this$0, DialogInterface dialogInterface) {
        Intrinsics.g(this$0, "this$0");
        this$0.f47427h = null;
    }

    public final void a(View view, String omSdkData) {
        Intrinsics.g(view, "view");
        Intrinsics.g(omSdkData, "omSdkData");
        boolean zC = this.f47422c.C();
        if (omSdkData.length() <= 0 || !zC) {
            return;
        }
        String strA = ((com.vungle.ads.internal.omsdk.c) LazyKt.b(LazyThreadSafetyMode.f71679a, new s(this.f47420a)).getValue()).a();
        if (strA != null) {
            com.vungle.ads.internal.omsdk.b bVar = new com.vungle.ads.internal.omsdk.b(omSdkData, strA, ((o1) this.f47421b).u());
            bVar.a(view);
            this.n = bVar;
        }
    }

    public final void a(int i5, Map map) {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("NativeAdPresenter", "onOMEvent: event=" + i5 + " value=" + map);
        Object obj = this.f47432m.get(Integer.valueOf(i5));
        Boolean bool = Boolean.TRUE;
        if (!Intrinsics.b(obj, bool) && Intrinsics.b(this.f47431l.get(Integer.valueOf(i5)), bool)) {
            com.vungle.ads.internal.util.t.a("NativeAdPresenter", "Ignore this already fired om event: " + i5);
        }
        this.f47431l.put(Integer.valueOf(i5), bool);
        switch (i5) {
            case 1:
                com.vungle.ads.internal.omsdk.b bVar = this.n;
                if (bVar != null) {
                    bVar.d();
                    break;
                }
                break;
            case 2:
                com.vungle.ads.internal.omsdk.b bVar2 = this.n;
                if (bVar2 != null) {
                    bVar2.c();
                    break;
                }
                break;
            case 3:
                com.vungle.ads.internal.omsdk.b bVar3 = this.n;
                if (bVar3 != null) {
                    bVar3.b();
                    break;
                }
                break;
            case 4:
                Object obj2 = map != null ? map.get("OM_KEY_DURATION") : null;
                Number number = obj2 instanceof Number ? (Number) obj2 : null;
                float fFloatValue = number != null ? number.floatValue() : 0.0f;
                Object obj3 = map != null ? map.get("OM_KEY_VOLUME") : null;
                Number number2 = obj3 instanceof Number ? (Number) obj3 : null;
                float fFloatValue2 = number2 != null ? number2.floatValue() : 0.0f;
                com.vungle.ads.internal.omsdk.b bVar4 = this.n;
                if (bVar4 != null) {
                    bVar4.a(fFloatValue, fFloatValue2);
                    break;
                }
                break;
            case 5:
            case 6:
            case 7:
                com.vungle.ads.internal.omsdk.b bVar5 = this.n;
                if (bVar5 != null) {
                    bVar5.a(i5);
                    break;
                }
                break;
            case 8:
                com.vungle.ads.internal.omsdk.b bVar6 = this.n;
                if (bVar6 != null) {
                    bVar6.e();
                    break;
                }
                break;
            case 9:
                com.vungle.ads.internal.omsdk.b bVar7 = this.n;
                if (bVar7 != null) {
                    bVar7.a(true);
                    break;
                }
                break;
            case 10:
                com.vungle.ads.internal.omsdk.b bVar8 = this.n;
                if (bVar8 != null) {
                    bVar8.a(false);
                    break;
                }
                break;
            case 11:
                com.vungle.ads.internal.omsdk.b bVar9 = this.n;
                if (bVar9 != null) {
                    bVar9.a();
                    break;
                }
                break;
        }
    }
}
