package ads_mobile_sdk;

import b.dc;
import b.h7;
import b.p5;
import b.t1;
import b.y4;
import java.io.Closeable;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes.dex */
public abstract class vm extends e2 implements y4 {

    /* renamed from: l, reason: collision with root package name */
    public final b.m5 f10821l;

    /* renamed from: m, reason: collision with root package name */
    public final x60 f10822m;
    public final sp3 n;
    public final t70.j0 o;

    /* renamed from: p, reason: collision with root package name */
    public final p01 f10823p;

    /* renamed from: q, reason: collision with root package name */
    public final ri f10824q;

    public /* synthetic */ vm(b.m5 m5Var, x60 x60Var, sp3 sp3Var, t70.j0 j0Var, p01 p01Var, ri riVar, mi3 mi3Var, ni.q qVar, qw2 qw2Var, long j11, int i5, z1 z1Var, hv hvVar, d33 d33Var, String str, eg2 eg2Var) {
        this(m5Var, x60Var, sp3Var, j0Var, p01Var, riVar, mi3Var, qVar, qw2Var, j11, i5, z1Var, hvVar, d33Var, str, eg2Var, new m31());
    }

    @Override // b.y4
    public final ri a() {
        return this.f10824q;
    }

    @Override // b.b
    public final boolean b() {
        k61 k61Var = this.f2711f.I;
        if ((k61Var != null ? k61Var.f5519a : null) == null) {
            return (k61Var != null ? k61Var.f5520b : null) != null;
        }
        return true;
    }

    @Override // ads_mobile_sdk.e2
    public final Object a(boolean z11, Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vm(b.m5 adComponentProvider, x60 x60Var, sp3 sp3Var, t70.j0 j0Var, p01 p01Var, ri riVar, mi3 mi3Var, ni.q qVar, qw2 qw2Var, long j11, int i5, z1 z1Var, hv hvVar, d33 d33Var, String str, eg2 eg2Var, m31 m31Var) {
        super(mi3Var, qVar, qw2Var, j11, i5, z1Var, hvVar, d33Var, str, eg2Var, m31Var);
        Intrinsics.g(adComponentProvider, "adComponentProvider");
        this.f10821l = adComponentProvider;
        this.f10822m = x60Var;
        this.n = sp3Var;
        this.o = j0Var;
        this.f10823p = p01Var;
        this.f10824q = riVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:108:0x02cb A[Catch: all -> 0x02a5, TRY_LEAVE, TryCatch #4 {all -> 0x02a5, blocks: (B:86:0x0292, B:88:0x0299, B:90:0x029d, B:92:0x02a1, B:95:0x02a8, B:97:0x02ac, B:99:0x02b0, B:101:0x02b4, B:102:0x02b5, B:103:0x02ba, B:104:0x02bb, B:105:0x02c2, B:106:0x02c3, B:107:0x02ca, B:108:0x02cb), top: B:150:0x0292 }] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02dc A[Catch: all -> 0x02e8, TryCatch #5 {all -> 0x02e8, blocks: (B:115:0x02d5, B:117:0x02dc, B:119:0x02e0, B:121:0x02e4, B:124:0x02eb, B:126:0x02ef, B:128:0x02f3, B:130:0x02f7, B:131:0x02f8, B:132:0x02fd, B:133:0x02fe, B:134:0x0305, B:135:0x0306, B:136:0x030d, B:137:0x030e), top: B:151:0x02d5 }] */
    /* JADX WARN: Removed duplicated region for block: B:137:0x030e A[Catch: all -> 0x02e8, TRY_LEAVE, TryCatch #5 {all -> 0x02e8, blocks: (B:115:0x02d5, B:117:0x02dc, B:119:0x02e0, B:121:0x02e4, B:124:0x02eb, B:126:0x02ef, B:128:0x02f3, B:130:0x02f7, B:131:0x02f8, B:132:0x02fd, B:133:0x02fe, B:134:0x0305, B:135:0x0306, B:136:0x030d, B:137:0x030e), top: B:151:0x02d5 }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0108 A[Catch: all -> 0x00c3, TRY_LEAVE, TryCatch #3 {all -> 0x00c3, blocks: (B:23:0x00bf, B:33:0x0102, B:35:0x0108), top: B:148:0x00bf }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0231  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0241 A[Catch: all -> 0x0061, TRY_LEAVE, TryCatch #1 {all -> 0x0061, blocks: (B:15:0x0056, B:72:0x023b, B:74:0x0241), top: B:144:0x0056 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x024e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x024f  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0299 A[Catch: all -> 0x02a5, TryCatch #4 {all -> 0x02a5, blocks: (B:86:0x0292, B:88:0x0299, B:90:0x029d, B:92:0x02a1, B:95:0x02a8, B:97:0x02ac, B:99:0x02b0, B:101:0x02b4, B:102:0x02b5, B:103:0x02ba, B:104:0x02bb, B:105:0x02c2, B:106:0x02c3, B:107:0x02ca, B:108:0x02cb), top: B:150:0x0292 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Type inference failed for: r3v12, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v46 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r3v6, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v31 */
    /* JADX WARN: Type inference failed for: r4v33 */
    /* JADX WARN: Type inference failed for: r4v36, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v37 */
    /* JADX WARN: Type inference failed for: r4v38 */
    /* JADX WARN: Type inference failed for: r4v41, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v42 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(vm vmVar, ContinuationImpl continuationImpl) throws Throwable {
        tm tmVar;
        ?? r32;
        th3 th3Var;
        b.a1 a1Var;
        tx0 tx0Var;
        b.pc pcVar;
        vm vmVar2;
        jy0 jy0Var;
        Ref.ObjectRef objectRef;
        tx0 tx0Var2;
        Ref.ObjectRef objectRef2;
        b.a1 a1Var2;
        Ref.ObjectRef objectRef3;
        jy0 jy0Var2;
        vm vmVar3;
        Object obj;
        b.pc pcVar2;
        tx0 tx0Var3;
        th3 th3VarA;
        Closeable closeable;
        ?? r42;
        Object objA;
        b.pc pcVar3;
        tx0 tx0Var4;
        jy0 jy0Var3;
        vm vmVar4;
        String strA;
        b.a1 a1Var3;
        b.pc pcVar4;
        vm vmVar5 = vmVar;
        if (continuationImpl instanceof tm) {
            tmVar = (tm) continuationImpl;
            int i5 = tmVar.f9999i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tmVar.f9999i = i5 - Integer.MIN_VALUE;
            } else {
                tmVar = new tm(vmVar5, continuationImpl);
            }
        }
        tm tmVar2 = tmVar;
        Object objA2 = tmVar2.f9997g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = 0;
        switch (tmVar2.f9999i) {
            case 0:
                ResultKt.b(objA2);
                WeakHashMap weakHashMap = ji3.f5253a;
                th3 th3VarA2 = ji3.a(wv0.CUI_NAME_CREATIVE_WEBVIEW_INITIALIZATION, EmptyList.f71733a, true);
                try {
                    sp3 sp3Var = vmVar5.n;
                    fs3 fs3Var = new fs3(es3.f2967d, i11, i11, 14);
                    mi3 mi3Var = vmVar5.f2706a;
                    x60 x60Var = vmVar5.f10822m;
                    eg2 eg2Var = vmVar5.f2715j;
                    m31 m31Var = vmVar5.f2716k;
                    tmVar2.f9991a = vmVar5;
                    tmVar2.f9992b = th3VarA2;
                    tmVar2.f9993c = th3VarA2;
                    tmVar2.f9999i = 1;
                    Object objA3 = sp3.a(sp3Var, fs3Var, mi3Var, x60Var, eg2Var, m31Var, tmVar2, 32);
                    tmVar2 = tmVar2;
                    if (objA3 != coroutineSingletons) {
                        th3Var = th3VarA2;
                        objA2 = objA3;
                        r32 = th3Var;
                        a1Var = (b.a1) objA2;
                        if (a1Var instanceof pu0) {
                            zi3.a((pu0) a1Var, false);
                        }
                        CloseableKt.a(r32, null);
                        if (!(a1Var instanceof pu0)) {
                            return (pu0) a1Var;
                        }
                        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                        jy0 jy0Var4 = (jy0) ((xu0) a1Var).f11834b;
                        tx0Var = jy0Var4.f5452a;
                        Object obj2 = vmVar5.f10821l.get();
                        Intrinsics.f(obj2, "get(...)");
                        pcVar = (b.pc) ((dc) ((dc) ((dc) ((dc) ((dc) vmVar5.a((h7) obj2, false)).a(tx0Var)).a(vmVar5.f10822m)).b(jy0Var4)).a(jy0Var4)).a();
                        t1 t1VarC = pcVar.c();
                        b.u7 u7VarC = tx0Var.c();
                        p5 nh0Var = u7VarC instanceof p5 ? (p5) u7VarC : null;
                        if (nh0Var == null) {
                            nh0Var = new nh0(tx0Var);
                        }
                        tmVar2.f9991a = vmVar5;
                        tmVar2.f9992b = jy0Var4;
                        tmVar2.f9993c = tx0Var;
                        tmVar2.f9994d = pcVar;
                        tmVar2.f9999i = 2;
                        if (t1VarC.a(nh0Var, tmVar2) != coroutineSingletons) {
                            vmVar2 = vmVar5;
                            jy0Var = jy0Var4;
                            objectRef = new Ref.ObjectRef();
                            tmVar2.f9991a = vmVar2;
                            tmVar2.f9992b = jy0Var;
                            tmVar2.f9993c = tx0Var;
                            tmVar2.f9994d = pcVar;
                            tmVar2.f9995e = objectRef;
                            tmVar2.f9996f = objectRef;
                            tmVar2.f9999i = 3;
                            objA2 = vmVar2.a(tmVar2);
                            if (objA2 != coroutineSingletons) {
                                tx0Var2 = tx0Var;
                                objectRef2 = objectRef;
                                a1Var2 = (b.a1) objA2;
                                if (!(a1Var2 instanceof pu0)) {
                                    return (pu0) a1Var2;
                                }
                                Intrinsics.e(a1Var2, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                                objectRef.f71863a = ((xu0) a1Var2).f11834b;
                                m72 m72VarE = pcVar.e();
                                tmVar2.f9991a = vmVar2;
                                tmVar2.f9992b = jy0Var;
                                tmVar2.f9993c = tx0Var2;
                                tmVar2.f9994d = pcVar;
                                tmVar2.f9995e = objectRef2;
                                tmVar2.f9996f = null;
                                tmVar2.f9999i = 4;
                                m72VarE.getClass();
                                Object objA4 = m72.a(m72VarE, tx0Var2, true, (ContinuationImpl) tmVar2);
                                if (objA4 != coroutineSingletons) {
                                    objectRef3 = objectRef2;
                                    jy0Var2 = jy0Var;
                                    vmVar3 = vmVar2;
                                    obj = objA4;
                                    pcVar2 = pcVar;
                                    tx0Var3 = tx0Var2;
                                    if (((Boolean) obj).booleanValue() && (strA = vmVar3.f10823p.a(vmVar3.f2711f)) != null) {
                                        p01 p01Var = vmVar3.f10823p;
                                        String html = (String) objectRef3.f71863a;
                                        p01Var.getClass();
                                        Intrinsics.g(html, "html");
                                        objectRef3.f71863a = p01.a(html, ul.b.P(strA));
                                    }
                                    WeakHashMap weakHashMap2 = ji3.f5253a;
                                    th3VarA = ji3.a(wv0.CUI_NAME_CREATIVE_WEBVIEW_LOAD, EmptyList.f71733a, true);
                                    try {
                                        String str = (String) objectRef3.f71863a;
                                        k61 k61Var = vmVar3.f2711f.I;
                                        Intrinsics.d(k61Var);
                                        String str2 = k61Var.f5521c;
                                        tmVar2.f9991a = vmVar3;
                                        tmVar2.f9992b = jy0Var2;
                                        tmVar2.f9993c = tx0Var3;
                                        tmVar2.f9994d = pcVar2;
                                        tmVar2.f9995e = th3VarA;
                                        tmVar2.f9996f = th3VarA;
                                        tmVar2.f9999i = 5;
                                        tx0 tx0Var5 = tx0Var3;
                                        objA = tx0.a(tx0Var5, str, str2, true, (ContinuationImpl) tmVar2, 12);
                                        if (objA != coroutineSingletons) {
                                            pcVar3 = pcVar2;
                                            tx0Var4 = tx0Var5;
                                            jy0Var3 = jy0Var2;
                                            vmVar4 = vmVar3;
                                            closeable = th3VarA;
                                            r42 = closeable;
                                            objA2 = objA;
                                            a1Var3 = (b.a1) objA2;
                                            if (a1Var3 instanceof pu0) {
                                                zi3.a((pu0) a1Var3, false);
                                            }
                                            CloseableKt.a(closeable, null);
                                            if (!(a1Var3 instanceof pu0)) {
                                                return a1Var3;
                                            }
                                            CoroutineContext coroutineContext = vmVar4.o.getCoroutineContext();
                                            b00.q qVar = new b00.q(vmVar4, jy0Var3, pcVar3, tx0Var4, null, 5);
                                            b.pc pcVar5 = pcVar3;
                                            tmVar2.f9991a = pcVar5;
                                            tmVar2.f9992b = null;
                                            tmVar2.f9993c = null;
                                            tmVar2.f9994d = null;
                                            tmVar2.f9995e = null;
                                            tmVar2.f9996f = null;
                                            tmVar2.f9999i = 6;
                                            if (m0.y(coroutineContext, qVar, tmVar2) != coroutineSingletons) {
                                                pcVar4 = pcVar5;
                                                return new xu0(new n8.q(new xu0(pcVar4.a()), 3));
                                            }
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        closeable = th3VarA;
                                        r42 = closeable;
                                        try {
                                            r42.b(th);
                                            if (th instanceof b.a4) {
                                            }
                                        } finally {
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    r32 = th3VarA2;
                    th3Var = r32;
                    try {
                        th3Var.b(th);
                        if (th instanceof b.a4) {
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                th3Var.a(th);
                            }
                            if (!(th instanceof TimeoutCancellationException)) {
                                if (!(th instanceof CancellationException)) {
                                    if (th instanceof dv0) {
                                        throw th;
                                    }
                                    throw new iu0(th);
                                }
                                throw new du0(th);
                            }
                            throw new lw0(th);
                        }
                        throw th;
                    } finally {
                        try {
                            throw th;
                        } finally {
                        }
                    }
                }
            case 1:
                r32 = (Closeable) tmVar2.f9993c;
                th3Var = (th3) tmVar2.f9992b;
                vmVar5 = (vm) tmVar2.f9991a;
                try {
                    ResultKt.b(objA2);
                    r32 = r32;
                    a1Var = (b.a1) objA2;
                    if (a1Var instanceof pu0) {
                    }
                    CloseableKt.a(r32, null);
                    if (!(a1Var instanceof pu0)) {
                    }
                } catch (Throwable th4) {
                    th = th4;
                    th3Var.b(th);
                    if (th instanceof b.a4) {
                    }
                }
                break;
            case 2:
                b.pc pcVar6 = tmVar2.f9994d;
                tx0Var = (tx0) tmVar2.f9993c;
                jy0 jy0Var5 = (jy0) tmVar2.f9992b;
                vm vmVar6 = (vm) tmVar2.f9991a;
                ResultKt.b(objA2);
                jy0Var = jy0Var5;
                vmVar2 = vmVar6;
                pcVar = pcVar6;
                objectRef = new Ref.ObjectRef();
                tmVar2.f9991a = vmVar2;
                tmVar2.f9992b = jy0Var;
                tmVar2.f9993c = tx0Var;
                tmVar2.f9994d = pcVar;
                tmVar2.f9995e = objectRef;
                tmVar2.f9996f = objectRef;
                tmVar2.f9999i = 3;
                objA2 = vmVar2.a(tmVar2);
                if (objA2 != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 3:
                objectRef = (Ref.ObjectRef) tmVar2.f9996f;
                objectRef2 = (Ref.ObjectRef) tmVar2.f9995e;
                pcVar = tmVar2.f9994d;
                tx0Var2 = (tx0) tmVar2.f9993c;
                jy0Var = (jy0) tmVar2.f9992b;
                vmVar2 = (vm) tmVar2.f9991a;
                ResultKt.b(objA2);
                a1Var2 = (b.a1) objA2;
                if (!(a1Var2 instanceof pu0)) {
                }
                break;
            case 4:
                objectRef3 = (Ref.ObjectRef) tmVar2.f9995e;
                b.pc pcVar7 = tmVar2.f9994d;
                tx0Var3 = (tx0) tmVar2.f9993c;
                jy0 jy0Var6 = (jy0) tmVar2.f9992b;
                vm vmVar7 = (vm) tmVar2.f9991a;
                ResultKt.b(objA2);
                obj = objA2;
                pcVar2 = pcVar7;
                jy0Var2 = jy0Var6;
                vmVar3 = vmVar7;
                if (((Boolean) obj).booleanValue()) {
                    p01 p01Var2 = vmVar3.f10823p;
                    String html2 = (String) objectRef3.f71863a;
                    p01Var2.getClass();
                    Intrinsics.g(html2, "html");
                    objectRef3.f71863a = p01.a(html2, ul.b.P(strA));
                    break;
                }
                WeakHashMap weakHashMap22 = ji3.f5253a;
                th3VarA = ji3.a(wv0.CUI_NAME_CREATIVE_WEBVIEW_LOAD, EmptyList.f71733a, true);
                String str3 = (String) objectRef3.f71863a;
                k61 k61Var2 = vmVar3.f2711f.I;
                Intrinsics.d(k61Var2);
                String str22 = k61Var2.f5521c;
                tmVar2.f9991a = vmVar3;
                tmVar2.f9992b = jy0Var2;
                tmVar2.f9993c = tx0Var3;
                tmVar2.f9994d = pcVar2;
                tmVar2.f9995e = th3VarA;
                tmVar2.f9996f = th3VarA;
                tmVar2.f9999i = 5;
                tx0 tx0Var52 = tx0Var3;
                objA = tx0.a(tx0Var52, str3, str22, true, (ContinuationImpl) tmVar2, 12);
                if (objA != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                closeable = (Closeable) tmVar2.f9996f;
                r42 = (th3) tmVar2.f9995e;
                b.pc pcVar8 = tmVar2.f9994d;
                tx0 tx0Var6 = (tx0) tmVar2.f9993c;
                jy0 jy0Var7 = (jy0) tmVar2.f9992b;
                vmVar4 = (vm) tmVar2.f9991a;
                try {
                    ResultKt.b(objA2);
                    pcVar3 = pcVar8;
                    tx0Var4 = tx0Var6;
                    jy0Var3 = jy0Var7;
                    r42 = r42;
                    a1Var3 = (b.a1) objA2;
                    if (a1Var3 instanceof pu0) {
                    }
                    CloseableKt.a(closeable, null);
                    if (!(a1Var3 instanceof pu0)) {
                    }
                } catch (Throwable th5) {
                    th = th5;
                    r42.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            r42.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
                break;
            case 6:
                pcVar4 = (b.pc) tmVar2.f9991a;
                ResultKt.b(objA2);
                return new xu0(new n8.q(new xu0(pcVar4.a()), 3));
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
