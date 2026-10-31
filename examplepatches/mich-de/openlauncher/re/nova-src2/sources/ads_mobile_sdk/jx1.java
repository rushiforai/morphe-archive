package ads_mobile_sdk;

import android.graphics.Color;
import android.net.Uri;
import b.ed;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.k0;
import t70.p0;

/* loaded from: classes2.dex */
public final class jx1 {

    /* renamed from: h, reason: collision with root package name */
    public static final int f5430h;

    /* renamed from: i, reason: collision with root package name */
    public static final int f5431i;

    /* renamed from: a, reason: collision with root package name */
    public final ui.q f5432a;

    /* renamed from: b, reason: collision with root package name */
    public final ep f5433b;

    /* renamed from: c, reason: collision with root package name */
    public final ci3 f5434c;

    /* renamed from: d, reason: collision with root package name */
    public final xy1 f5435d;

    /* renamed from: e, reason: collision with root package name */
    public final sp3 f5436e;

    /* renamed from: f, reason: collision with root package name */
    public final t70.j0 f5437f;

    /* renamed from: g, reason: collision with root package name */
    public final kz2 f5438g;

    static {
        int iRgb = Color.rgb(12, 174, Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE);
        f5430h = Color.rgb(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
        f5431i = iRgb;
    }

    public jx1(ui.q nativeRequest, ep bitmapLoader, ci3 traceLogger, xy1 nativeMediaAssetLoader, sp3 webViewFactory, CoroutineContext uiContext, t70.j0 uiScope, kz2 traceCreator) {
        Intrinsics.g(nativeRequest, "nativeRequest");
        Intrinsics.g(bitmapLoader, "bitmapLoader");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(nativeMediaAssetLoader, "nativeMediaAssetLoader");
        Intrinsics.g(webViewFactory, "webViewFactory");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(traceCreator, "traceCreator");
        this.f5432a = nativeRequest;
        this.f5433b = bitmapLoader;
        this.f5434c = traceLogger;
        this.f5435d = nativeMediaAssetLoader;
        this.f5436e = webViewFactory;
        this.f5437f = uiScope;
        this.f5438g = traceCreator;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(com.google.gson.r rVar, String str, ContinuationImpl continuationImpl) {
        bx1 bx1Var;
        com.google.gson.r rVar2;
        jx1 jx1Var;
        if (continuationImpl instanceof bx1) {
            bx1Var = (bx1) continuationImpl;
            int i5 = bx1Var.f1603e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bx1Var.f1603e = i5 - Integer.MIN_VALUE;
            } else {
                bx1Var = new bx1(this, continuationImpl);
            }
        }
        Object obj = bx1Var.f1601c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bx1Var.f1603e;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.google.gson.r rVarA = d62.a(rVar, str, (com.google.gson.r) null);
            if (rVarA != null) {
                com.google.gson.m mVarE = d62.e(rVarA, "images");
                com.google.gson.r rVarA2 = d62.a(rVarA, "image", (com.google.gson.r) null);
                if (mVarE == null && rVarA2 != null) {
                    mVarE = new com.google.gson.m();
                    mVarE.p(rVarA2);
                }
                bx1Var.f1599a = this;
                bx1Var.f1600b = rVarA;
                bx1Var.f1603e = 1;
                Object objA = a(mVarE, bx1Var);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                rVar2 = rVarA;
                obj = objA;
                jx1Var = this;
            }
            return null;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        rVar2 = bx1Var.f1600b;
        jx1Var = bx1Var.f1599a;
        ResultKt.b(obj);
        List list = (List) obj;
        jx1Var.getClass();
        if (!list.isEmpty()) {
            String strA = d62.a(rVar2, "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            Integer numF = ed.f(rVar2, "bg_color");
            Integer numF2 = ed.f(rVar2, "text_color");
            int iA = d62.a(rVar2, "text_size", -1);
            boolean zA = d62.a(rVar2, "allow_pub_rendering", false);
            Duration.Companion companion = Duration.f72038b;
            int iA2 = d62.a(rVar2, "animation_ms", 1000);
            DurationUnit durationUnit = DurationUnit.f72045d;
            long jG = DurationKt.g(iA2, durationUnit);
            long jG2 = DurationKt.g(d62.a(rVar2, "presentation_ms", 4000), durationUnit);
            int iIntValue = numF != null ? numF.intValue() : f5430h;
            int iIntValue2 = numF2 != null ? numF2.intValue() : f5431i;
            Integer numValueOf = iA > 0 ? Integer.valueOf(iA) : null;
            return new md1(strA, list, iIntValue, iIntValue2, numValueOf != null ? numValueOf.intValue() : 12, Duration.m(jG2, jG), jx1Var.f5432a.e(), zA);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0112 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(com.google.gson.r rVar, boolean z11, ContinuationImpl continuationImpl) {
        cx1 cx1Var;
        double dE;
        int i5;
        String str;
        String str2;
        double d5;
        jx1 jx1Var;
        int i11;
        ep epVar;
        b.a1 qu0Var;
        int i12;
        jx1 jx1Var2;
        int i13;
        String str3;
        double d11;
        boolean zD;
        com.google.gson.r rVar2 = rVar;
        if (continuationImpl instanceof cx1) {
            cx1Var = (cx1) continuationImpl;
            int i14 = cx1Var.f2100i;
            if ((i14 & Integer.MIN_VALUE) != 0) {
                cx1Var.f2100i = i14 - Integer.MIN_VALUE;
            } else {
                cx1Var = new cx1(this, continuationImpl);
            }
        }
        cx1 cx1Var2 = cx1Var;
        Object objA = cx1Var2.f2098g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = cx1Var2.f2100i;
        if (i15 == 0) {
            ResultKt.b(objA);
            if (rVar2 != null) {
                String strA = d62.a(rVar2, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                if (strA.length() != 0) {
                    try {
                        dE = rVar2.v("scale").e();
                    } catch (Exception unused) {
                        dE = 1.0d;
                    }
                    double d12 = dE;
                    boolean zA = d62.a(rVar2, "is_transparent", true);
                    int iA = d62.a(rVar2, "width", -1);
                    int iA2 = d62.a(rVar2, "height", -1);
                    if (z11) {
                        Uri uri = Uri.parse(strA);
                        Intrinsics.f(uri, "parse(...)");
                        return new wf1(null, uri, d12, iA, iA2);
                    }
                    i5 = iA2;
                    try {
                        epVar = this.f5433b;
                        cx1Var2.f2092a = this;
                        cx1Var2.f2093b = rVar2;
                        cx1Var2.f2094c = strA;
                        cx1Var2.f2095d = d12;
                        cx1Var2.f2096e = iA;
                        cx1Var2.f2097f = i5;
                        cx1Var2.f2100i = 1;
                        epVar.getClass();
                        str = strA;
                    } catch (Exception e3) {
                        e = e3;
                        str = strA;
                    }
                    try {
                        objA = ep.a(epVar, str, d12, zA, cx1Var2);
                        if (objA == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        str2 = str;
                        d5 = d12;
                        jx1Var = this;
                        i11 = iA;
                        qu0Var = (b.a1) objA;
                        str3 = str2;
                        d11 = d5;
                        i12 = i5;
                        jx1Var2 = jx1Var;
                        i13 = i11;
                    } catch (Exception e11) {
                        e = e11;
                        str2 = str;
                        d5 = d12;
                        jx1Var = this;
                        i11 = iA;
                        jx1Var.f5434c.a("Error loading bitmap.", (Throwable) e);
                        qu0Var = new qu0(e, null, null, 6);
                        i12 = i5;
                        jx1Var2 = jx1Var;
                        i13 = i11;
                        str3 = str2;
                        d11 = d5;
                        if (!(qu0Var instanceof xu0)) {
                        }
                        if (rVar2 != null) {
                        }
                        jx1Var2.getClass();
                        if (!(qu0Var instanceof xu0)) {
                        }
                    }
                }
            }
            return null;
        }
        if (i15 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        int i16 = cx1Var2.f2097f;
        i11 = cx1Var2.f2096e;
        d5 = cx1Var2.f2095d;
        str2 = cx1Var2.f2094c;
        com.google.gson.r rVar3 = cx1Var2.f2093b;
        jx1Var = cx1Var2.f2092a;
        try {
            ResultKt.b(objA);
            i5 = i16;
            rVar2 = rVar3;
        } catch (Exception e12) {
            e = e12;
            i5 = i16;
            rVar2 = rVar3;
            jx1Var.f5434c.a("Error loading bitmap.", (Throwable) e);
            qu0Var = new qu0(e, null, null, 6);
            i12 = i5;
            jx1Var2 = jx1Var;
            i13 = i11;
            str3 = str2;
            d11 = d5;
            if (!(qu0Var instanceof xu0)) {
            }
            if (rVar2 != null) {
            }
            jx1Var2.getClass();
            if (!(qu0Var instanceof xu0)) {
            }
        }
        try {
            qu0Var = (b.a1) objA;
            str3 = str2;
            d11 = d5;
            i12 = i5;
            jx1Var2 = jx1Var;
            i13 = i11;
        } catch (Exception e13) {
            e = e13;
            jx1Var.f5434c.a("Error loading bitmap.", (Throwable) e);
            qu0Var = new qu0(e, null, null, 6);
            i12 = i5;
            jx1Var2 = jx1Var;
            i13 = i11;
            str3 = str2;
            d11 = d5;
            if (!(qu0Var instanceof xu0)) {
            }
            if (rVar2 != null) {
            }
            jx1Var2.getClass();
            if (!(qu0Var instanceof xu0)) {
            }
        }
        if (!(qu0Var instanceof xu0)) {
            try {
                qu0Var = new xu0(new dx1((xu0) qu0Var, str3, d11, i13, i12).invoke());
            } catch (Exception e14) {
                qu0Var = new qu0(e14, null, null, 6);
            }
        } else if (!(qu0Var instanceof pu0)) {
            throw new NoWhenBranchMatchedException();
        }
        if (rVar2 != null) {
            zD = false;
        } else {
            try {
                zD = rVar2.v("require").d();
            } catch (Exception unused2) {
            }
        }
        jx1Var2.getClass();
        if (!(qu0Var instanceof xu0)) {
            return ((xu0) qu0Var).f11834b;
        }
        if (!(qu0Var instanceof pu0)) {
            throw new NoWhenBranchMatchedException();
        }
        if (!zD) {
            mu0.b("Error during loading assets.", null);
            return null;
        }
        throw new dv0((pu0) qu0Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0054, code lost:
    
        if (r7 == r1) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x007a, code lost:
    
        if (r7 == r1) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x007c, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x007a -> B:30:0x007d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(com.google.gson.m mVar, ContinuationImpl continuationImpl) {
        ex1 ex1Var;
        Collection arrayList;
        Iterator it;
        if (continuationImpl instanceof ex1) {
            ex1Var = (ex1) continuationImpl;
            int i5 = ex1Var.f3088e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ex1Var.f3088e = i5 - Integer.MIN_VALUE;
            } else {
                ex1Var = new ex1(this, continuationImpl);
            }
        }
        Object objD = ex1Var.f3086c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ex1Var.f3088e;
        if (i11 == 0) {
            ResultKt.b(objD);
            if (mVar != null && !mVar.f34793a.isEmpty()) {
                af afVar = new af(this, mVar, null);
                ex1Var.f3088e = 1;
                objD = k0.d(afVar, ex1Var);
            } else {
                return EmptyList.f71733a;
            }
        } else if (i11 == 1) {
            ResultKt.b(objD);
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = ex1Var.f3085b;
            arrayList = ex1Var.f3084a;
            ResultKt.b(objD);
            wf1 wf1Var = (wf1) objD;
            if (wf1Var != null) {
                arrayList.add(wf1Var);
            }
            if (!it.hasNext()) {
                p0 p0Var = (p0) it.next();
                ex1Var.f3084a = arrayList;
                ex1Var.f3085b = it;
                ex1Var.f3088e = 2;
                objD = p0Var.l(ex1Var);
            } else {
                return (List) arrayList;
            }
        }
        arrayList = new ArrayList();
        it = ((List) objD).iterator();
        if (!it.hasNext()) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a0, code lost:
    
        if (r3 == r6) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00f3, code lost:
    
        if (r3 == r6) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(com.google.gson.r rVar, eg2 eg2Var, ContinuationImpl continuationImpl) {
        hx1 hx1Var;
        u uVar = u.a$3;
        if (continuationImpl instanceof hx1) {
            hx1Var = (hx1) continuationImpl;
            int i5 = hx1Var.f4581c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hx1Var.f4581c = i5 - Integer.MIN_VALUE;
            } else {
                hx1Var = new hx1(this, continuationImpl);
            }
        }
        Object objN = hx1Var.f4579a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hx1Var.f4581c;
        if (i11 == 0) {
            ResultKt.b(objN);
            com.google.gson.r rVarA = d62.a(rVar, "html_config", (com.google.gson.r) null);
            boolean zContainsKey = rVarA != null ? rVarA.f34795a.containsKey("html") : false;
            com.google.gson.r rVarA2 = d62.a(rVar, "video", (com.google.gson.r) null);
            boolean z11 = d62.a(rVarA2, "vast_xml", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).length() > 0;
            ci3 ci3Var = this.f5434c;
            xy1 xy1Var = this.f5435d;
            if (rVarA != null) {
                if (zContainsKey) {
                    hx1Var.f4581c = 1;
                    xy1Var.getClass();
                    b.i8 i8Var = rw0.f9327f;
                    jr0 jr0Var = xy1Var.f11889e;
                    jr0Var.getClass();
                    Duration.Companion companion = Duration.f72038b;
                    objN = i8Var.n(((Duration) jr0Var.a("gads:native_video_load_timeout", ed.k(10, DurationUnit.f72046e, "gads:native_video_load_timeout"), uVar)).f72041a, new ry1(eg2Var, xy1Var, rVarA, null), hx1Var);
                } else {
                    mu0.b("Has 'html_config' but the html field is missing.", null);
                    ci3Var.a("loadMediaAsset", (Throwable) new IllegalStateException("Has 'html_config' but the html field is missing."));
                    return null;
                }
            } else if (rVarA2 != null) {
                if (z11) {
                    hx1Var.f4581c = 2;
                    xy1Var.getClass();
                    b.i8 i8Var2 = rw0.f9327f;
                    jr0 jr0Var2 = xy1Var.f11889e;
                    jr0Var2.getClass();
                    Duration.Companion companion2 = Duration.f72038b;
                    objN = i8Var2.n(((Duration) jr0Var2.a("gads:native_video_load_timeout", ed.k(10, DurationUnit.f72046e, "gads:native_video_load_timeout"), uVar)).f72041a, new vy1(eg2Var, xy1Var, rVarA2, null), hx1Var);
                } else {
                    mu0.b("Has video field but 'vast_xml' is missing.", null);
                    ci3Var.a("loadMediaAsset", (Throwable) new IllegalStateException("Has video field but 'vast_xml' is missing."));
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objN);
            b.a1 a1Var = (b.a1) objN;
            if (a1Var instanceof xu0) {
                return (tx0) ((xu0) a1Var).f11834b;
            }
            if (!(a1Var instanceof pu0)) {
                throw new NoWhenBranchMatchedException();
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objN);
            b.a1 a1Var2 = (b.a1) objN;
            if (a1Var2 instanceof xu0) {
                return (tx0) ((xu0) a1Var2).f11834b;
            }
            if (!(a1Var2 instanceof pu0)) {
                throw new NoWhenBranchMatchedException();
            }
        }
        return null;
    }
}
