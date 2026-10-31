package ads_mobile_sdk;

import android.content.Context;
import android.os.Bundle;
import b.a6;
import b.ed;
import b.k9;
import b.o2;
import c80.d;
import java.io.Closeable;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.p2;

/* loaded from: classes2.dex */
public final class i03 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f4594a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f4595b;

    /* renamed from: c, reason: collision with root package name */
    public final wj f4596c;

    /* renamed from: d, reason: collision with root package name */
    public final g0 f4597d;

    /* renamed from: e, reason: collision with root package name */
    public final a6 f4598e;

    /* renamed from: f, reason: collision with root package name */
    public final t70.j0 f4599f;

    /* renamed from: g, reason: collision with root package name */
    public final kz2 f4600g;

    /* renamed from: h, reason: collision with root package name */
    public final sb f4601h;

    /* renamed from: i, reason: collision with root package name */
    public final ni.q f4602i;

    /* renamed from: j, reason: collision with root package name */
    public final ts2 f4603j;

    /* renamed from: k, reason: collision with root package name */
    public final long f4604k;

    /* renamed from: l, reason: collision with root package name */
    public final long f4605l;

    /* renamed from: m, reason: collision with root package name */
    public final d f4606m;
    public final ArrayList n;

    public i03(jr0 flags, Context context, o2 clock, wj appState, g0 activityTracker, a6 mediationAdapterProxyFactory, t70.j0 backgroundScope, kz2 rootTraceCreator, sb adapterInitializer, ni.q baseRequest, ts2 recursiveAdData) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(context, "context");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(mediationAdapterProxyFactory, "mediationAdapterProxyFactory");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(adapterInitializer, "adapterInitializer");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(recursiveAdData, "recursiveAdData");
        this.f4594a = context;
        this.f4595b = clock;
        this.f4596c = appState;
        this.f4597d = activityTracker;
        this.f4598e = mediationAdapterProxyFactory;
        this.f4599f = backgroundScope;
        this.f4600g = rootTraceCreator;
        this.f4601h = adapterInitializer;
        this.f4602i = baseRequest;
        this.f4603j = recursiveAdData;
        Duration.Companion companion = Duration.f72038b;
        this.f4604k = ((Duration) flags.a("(gads:rtb_v1_1:signal_timeout_ms", ed.k(900, DurationUnit.f72045d, "(gads:rtb_v1_1:signal_timeout_ms"), u.a$1)).f72041a;
        this.f4605l = Duration.o(u93.f10255e.f10257a, ((Number) flags.a("gads:rtb_timeout_multiplier", Double.valueOf(0.95d), jn.a$12)).doubleValue());
        this.f4606m = new d();
        this.n = new ArrayList();
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0068, code lost:
    
        if (r12.e(r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable a(mi.a aVar, qw2 qw2Var, ni.q qVar, ContinuationImpl continuationImpl) {
        c03 c03Var;
        i03 i03Var;
        d dVar;
        if (continuationImpl instanceof c03) {
            c03Var = (c03) continuationImpl;
            int i5 = c03Var.f1619e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c03Var.f1619e = i5 - Integer.MIN_VALUE;
            } else {
                c03Var = new c03(this, continuationImpl);
            }
        }
        Object obj = c03Var.f1617c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c03Var.f1619e;
        if (i11 == 0) {
            ResultKt.b(obj);
            b.i8 i8Var = rw0.f9327f;
            sx sxVar = new sx(this, qVar, qw2Var, aVar, null);
            c03Var.f1615a = this;
            c03Var.f1619e = 1;
            if (i8Var.n(this.f4605l, sxVar, c03Var) != coroutineSingletons) {
                i03Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = c03Var.f1616b;
            i03Var = c03Var.f1615a;
            ResultKt.b(obj);
            try {
                return i03Var.n;
            } finally {
                dVar.g(null);
            }
        }
        i03 i03Var2 = c03Var.f1615a;
        ResultKt.b(obj);
        i03Var = i03Var2;
        dVar = i03Var.f4606m;
        c03Var.f1615a = i03Var;
        c03Var.f1616b = dVar;
        c03Var.f1619e = 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x00e2, code lost:
    
        if (r1.e(r8) != r9) goto L49;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Bundle bundle, Bundle bundle2, mi.a aVar, String str, String str2, ContinuationImpl continuationImpl) {
        f03 f03Var;
        String str3;
        i03 i03Var;
        String str4;
        String str5;
        String str6;
        tz2 tz2Var;
        i03 i03Var2;
        tz2 tz2Var2;
        d dVar;
        if (continuationImpl instanceof f03) {
            f03Var = (f03) continuationImpl;
            int i5 = f03Var.f3125f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f03Var.f3125f = i5 - Integer.MIN_VALUE;
            } else {
                f03Var = new f03(this, continuationImpl);
            }
        }
        f03 f03Var2 = f03Var;
        Object objC = f03Var2.f3123d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f03Var2.f3125f;
        if (i11 == 0) {
            ResultKt.b(objC);
            try {
                long j11 = this.f4604k;
                str3 = str;
                try {
                    c0.g gVar = new c0.g(bundle2, bundle, aVar, this, str3, str2, (Continuation) null);
                    f03Var2.f3120a = this;
                    str3 = str;
                    f03Var2.f3121b = str3;
                    f03Var2.f3125f = 1;
                    objC = p2.c(j11, gVar, f03Var2);
                    if (objC != coroutineSingletons) {
                        i03Var = this;
                        str6 = str3;
                    }
                } catch (TimeoutCancellationException e3) {
                    e = e3;
                    i03Var = this;
                    str5 = str3;
                    th3 th3VarA = ji3.a();
                    th3VarA.e().f1799m = false;
                    th3VarA.a(e);
                    tz2Var = new tz2(str5, null, null, "Adapter timed out.", new Integer(3), 78);
                    i03Var2 = i03Var;
                    tz2Var2 = tz2Var;
                    dVar = i03Var2.f4606m;
                    f03Var2.f3120a = i03Var2;
                    f03Var2.f3121b = tz2Var2;
                    f03Var2.f3122c = dVar;
                    f03Var2.f3125f = 2;
                } catch (Exception e11) {
                    e = e11;
                    i03Var = this;
                    str4 = str3;
                    th3 th3VarA2 = ji3.a();
                    th3VarA2.e().f1799m = false;
                    th3VarA2.a(e);
                    tz2Var = new tz2(str4, null, null, "Adapter internal error.", new Integer(2), 78);
                    i03Var2 = i03Var;
                    tz2Var2 = tz2Var;
                    dVar = i03Var2.f4606m;
                    f03Var2.f3120a = i03Var2;
                    f03Var2.f3121b = tz2Var2;
                    f03Var2.f3122c = dVar;
                    f03Var2.f3125f = 2;
                }
            } catch (TimeoutCancellationException e12) {
                e = e12;
                str3 = str;
            } catch (Exception e13) {
                e = e13;
                str3 = str;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = f03Var2.f3122c;
            tz2Var2 = (tz2) f03Var2.f3121b;
            i03Var2 = f03Var2.f3120a;
            ResultKt.b(objC);
            try {
                i03Var2.n.add(tz2Var2);
                dVar.g(null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        str6 = (String) f03Var2.f3121b;
        i03Var = f03Var2.f3120a;
        try {
            ResultKt.b(objC);
        } catch (TimeoutCancellationException e14) {
            e = e14;
            str5 = str6;
            th3 th3VarA3 = ji3.a();
            th3VarA3.e().f1799m = false;
            th3VarA3.a(e);
            tz2Var = new tz2(str5, null, null, "Adapter timed out.", new Integer(3), 78);
            i03Var2 = i03Var;
            tz2Var2 = tz2Var;
            dVar = i03Var2.f4606m;
            f03Var2.f3120a = i03Var2;
            f03Var2.f3121b = tz2Var2;
            f03Var2.f3122c = dVar;
            f03Var2.f3125f = 2;
        } catch (Exception e15) {
            e = e15;
            str4 = str6;
            th3 th3VarA22 = ji3.a();
            th3VarA22.e().f1799m = false;
            th3VarA22.a(e);
            tz2Var = new tz2(str4, null, null, "Adapter internal error.", new Integer(2), 78);
            i03Var2 = i03Var;
            tz2Var2 = tz2Var;
            dVar = i03Var2.f4606m;
            f03Var2.f3120a = i03Var2;
            f03Var2.f3121b = tz2Var2;
            f03Var2.f3122c = dVar;
            f03Var2.f3125f = 2;
        }
        i03Var2 = i03Var;
        tz2Var2 = (tz2) objC;
        dVar = i03Var2.f4606m;
        f03Var2.f3120a = i03Var2;
        f03Var2.f3121b = tz2Var2;
        f03Var2.f3122c = dVar;
        f03Var2.f3125f = 2;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x023d A[Catch: all -> 0x02de, TRY_LEAVE, TryCatch #8 {all -> 0x02de, blocks: (B:102:0x0235, B:104:0x023d, B:107:0x0261, B:109:0x0271, B:110:0x0276, B:112:0x0286, B:114:0x028c, B:115:0x0294, B:117:0x029a, B:118:0x02b0, B:119:0x02b2), top: B:175:0x0235 }] */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0261 A[Catch: all -> 0x02de, TRY_ENTER, TryCatch #8 {all -> 0x02de, blocks: (B:102:0x0235, B:104:0x023d, B:107:0x0261, B:109:0x0271, B:110:0x0276, B:112:0x0286, B:114:0x028c, B:115:0x0294, B:117:0x029a, B:118:0x02b0, B:119:0x02b2), top: B:175:0x0235 }] */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02ea A[Catch: all -> 0x02f6, TryCatch #3 {all -> 0x02f6, blocks: (B:136:0x02e3, B:138:0x02ea, B:140:0x02ee, B:142:0x02f2, B:145:0x02f9, B:147:0x02fd, B:149:0x0301, B:151:0x0305, B:152:0x0306, B:153:0x030b, B:154:0x030c, B:155:0x0313, B:156:0x0314, B:157:0x031b, B:158:0x031c), top: B:169:0x02e3 }] */
    /* JADX WARN: Removed duplicated region for block: B:158:0x031c A[Catch: all -> 0x02f6, TRY_LEAVE, TryCatch #3 {all -> 0x02f6, blocks: (B:136:0x02e3, B:138:0x02ea, B:140:0x02ee, B:142:0x02f2, B:145:0x02f9, B:147:0x02fd, B:149:0x0301, B:151:0x0305, B:152:0x0306, B:153:0x030b, B:154:0x030c, B:155:0x0313, B:156:0x0314, B:157:0x031b, B:158:0x031c), top: B:169:0x02e3 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x010d A[Catch: all -> 0x01ae, TRY_LEAVE, TryCatch #7 {all -> 0x01ae, blocks: (B:41:0x0105, B:43:0x010d, B:46:0x0132, B:48:0x0143, B:49:0x0148, B:51:0x0156, B:53:0x015c, B:54:0x0164, B:56:0x016a, B:57:0x0180, B:58:0x0182), top: B:174:0x0105 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0132 A[Catch: all -> 0x01ae, TRY_ENTER, TryCatch #7 {all -> 0x01ae, blocks: (B:41:0x0105, B:43:0x010d, B:46:0x0132, B:48:0x0143, B:49:0x0148, B:51:0x0156, B:53:0x015c, B:54:0x0164, B:56:0x016a, B:57:0x0180, B:58:0x0182), top: B:174:0x0105 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01bb A[Catch: all -> 0x01c7, TryCatch #4 {all -> 0x01c7, blocks: (B:70:0x01b4, B:72:0x01bb, B:74:0x01bf, B:76:0x01c3, B:79:0x01ca, B:81:0x01ce, B:83:0x01d2, B:85:0x01d6, B:86:0x01d7, B:87:0x01dc, B:88:0x01dd, B:89:0x01e4, B:90:0x01e5, B:91:0x01ec, B:92:0x01ed), top: B:170:0x01b4 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0022  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01ed A[Catch: all -> 0x01c7, TRY_LEAVE, TryCatch #4 {all -> 0x01c7, blocks: (B:70:0x01b4, B:72:0x01bb, B:74:0x01bf, B:76:0x01c3, B:79:0x01ca, B:81:0x01ce, B:83:0x01d2, B:85:0x01d6, B:86:0x01d7, B:87:0x01dc, B:88:0x01dd, B:89:0x01e4, B:90:0x01e5, B:91:0x01ec, B:92:0x01ed), top: B:170:0x01b4 }] */
    /* JADX WARN: Type inference failed for: r2v0, types: [ni.q] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v25 */
    /* JADX WARN: Type inference failed for: r2v35, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v44 */
    /* JADX WARN: Type inference failed for: r2v53, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v63 */
    /* JADX WARN: Type inference failed for: r2v65 */
    /* JADX WARN: Type inference failed for: r3v39, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v12 */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r6v5 */
    /* JADX WARN: Type inference failed for: r6v6, types: [ads_mobile_sdk.em2, ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r6v7, types: [java.io.Closeable, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v8 */
    /* JADX WARN: Type inference failed for: r6v9, types: [ads_mobile_sdk.qw2, ads_mobile_sdk.th3, java.lang.Throwable, java.util.Map, mi.a, ni.q] */
    /* JADX WARN: Type inference failed for: r8v1, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r8v17, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v22 */
    /* JADX WARN: Type inference failed for: r8v4, types: [ads_mobile_sdk.th3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Map.Entry entry, ni.q qVar, Map map, qw2 qw2Var, mi.a aVar, ContinuationImpl continuationImpl) {
        h03 h03Var;
        ?? A;
        th3 th3Var;
        th3 th3Var2;
        Map mapA;
        ?? r62;
        Object objA;
        Map.Entry entry2;
        i03 i03Var;
        mi.a aVar2;
        Object objA2;
        Map.Entry entry3;
        i03 i03Var2;
        mi.a aVar3;
        th3 th3Var3;
        Map map2;
        ni.q qVar2;
        Throwable th2;
        Map mapQ;
        Map map3;
        ni.q qVar3;
        Map mapQ2;
        Throwable th3;
        ?? r22 = qVar;
        Map map4 = map;
        qw2 qw2Var2 = qw2Var;
        if (continuationImpl instanceof h03) {
            h03Var = (h03) continuationImpl;
            int i5 = h03Var.f4175k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h03Var.f4175k = i5 - Integer.MIN_VALUE;
            } else {
                h03Var = new h03(this, continuationImpl);
            }
        }
        h03 h03Var2 = h03Var;
        Object obj = h03Var2.f4173i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h03Var2.f4175k;
        try {
            try {
                if (i11 == 0) {
                    ResultKt.b(obj);
                    kz2 kz2Var = this.f4600g;
                    wv0 wv0Var = wv0.CUI_NAME_RTB_ADAPTER_SIGNALS;
                    EmptyList emptyList = EmptyList.f71733a;
                    mi3 mi3VarI = k9.i();
                    if (ji3.b().f4777a == null) {
                        A = kz2.a(kz2Var, wv0Var, emptyList, mi3VarI);
                        try {
                            ji3.a().f9923a.f7226c.f10107d = (String) entry.getKey();
                            sb sbVar = this.f4601h;
                            ni.q qVar4 = this.f4602i;
                            String str = (String) entry.getKey();
                            h03Var2.f4165a = this;
                            h03Var2.f4166b = entry;
                            h03Var2.f4167c = r22;
                            h03Var2.f4168d = map4;
                            h03Var2.f4169e = qw2Var2;
                            h03Var2.f4170f = aVar;
                            h03Var2.f4171g = A;
                            h03Var2.f4172h = A;
                            h03Var2.f4175k = 1;
                            sbVar.getClass();
                            objA2 = sb.a(sbVar, qVar4, str, h03Var2);
                            if (objA2 != coroutineSingletons) {
                                entry3 = entry;
                                i03Var2 = this;
                                aVar3 = aVar;
                                th3Var3 = A;
                                qVar2 = r22;
                                map2 = map4;
                                if (((Boolean) objA2).booleanValue()) {
                                }
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            th3Var2 = A;
                            A.b(th);
                            if (th instanceof b.a4) {
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    A.a(th);
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
                    } else {
                        r62 = 0;
                        mapA = ji3.a(wv0Var, emptyList, true);
                        try {
                            ji3.a().f9923a.f7226c.f10107d = (String) entry.getKey();
                            sb sbVar2 = this.f4601h;
                            ni.q qVar5 = this.f4602i;
                            String str2 = (String) entry.getKey();
                            h03Var2.f4165a = this;
                            h03Var2.f4166b = entry;
                            h03Var2.f4167c = r22;
                            h03Var2.f4168d = map4;
                            h03Var2.f4169e = qw2Var2;
                            h03Var2.f4170f = aVar;
                            h03Var2.f4171g = mapA;
                            h03Var2.f4172h = mapA;
                            h03Var2.f4175k = 3;
                            sbVar2.getClass();
                            objA = sb.a(sbVar2, qVar5, str2, h03Var2);
                            if (objA != coroutineSingletons) {
                                entry2 = entry;
                                i03Var = this;
                                aVar2 = aVar;
                                th3Var = mapA;
                                qVar3 = r22;
                                map3 = map4;
                                if (((Boolean) objA).booleanValue()) {
                                }
                            }
                        } catch (Throwable th5) {
                            th = th5;
                            th3Var = mapA;
                        }
                    }
                    return coroutineSingletons;
                }
                if (i11 != 1) {
                    if (i11 == 2) {
                        Closeable closeable = (Closeable) h03Var2.f4166b;
                        ResultKt.b(obj);
                        th2 = null;
                        r22 = closeable;
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(r22, th2);
                        return unit;
                    }
                    if (i11 != 3) {
                        if (i11 != 4) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        Closeable closeable2 = (Closeable) h03Var2.f4166b;
                        ?? r32 = (th3) h03Var2.f4165a;
                        ResultKt.b(obj);
                        th3 = null;
                        r22 = closeable2;
                        map4 = r32;
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(r22, th3);
                        return unit2;
                    }
                    th3 th3Var4 = h03Var2.f4172h;
                    th3 th3Var5 = h03Var2.f4171g;
                    aVar2 = h03Var2.f4170f;
                    qw2Var2 = h03Var2.f4169e;
                    Map map5 = h03Var2.f4168d;
                    ni.q qVar6 = h03Var2.f4167c;
                    entry2 = (Map.Entry) h03Var2.f4166b;
                    i03Var = (i03) h03Var2.f4165a;
                    ResultKt.b(obj);
                    th3Var = th3Var4;
                    qVar3 = qVar6;
                    mapA = th3Var5;
                    map3 = map5;
                    objA = obj;
                    r62 = 0;
                    try {
                        if (((Boolean) objA).booleanValue()) {
                            zi3.a((pu0) new tu0("The adapter requested for collecting bidding signals (" + entry2.getKey() + ") is not eligible because it was excluded by AdRequest.skipUninitializedAdapters and has not yet successfully initialized.", wd1.f11214b), false);
                            Unit unit3 = Unit.f71706a;
                            CloseableKt.a(th3Var, r62);
                            return unit3;
                        }
                        String str3 = (String) entry2.getKey();
                        Bundle bundle = (Bundle) qVar3.f78314g.get(str3);
                        if (bundle == null) {
                            bundle = new Bundle();
                        }
                        Bundle bundle2 = bundle;
                        ap apVar = (ap) map3.get(str3);
                        i03 i03Var3 = i03Var;
                        Bundle bundle3 = new Bundle();
                        if (apVar != null && (mapQ2 = apVar.q()) != null) {
                            for (Map.Entry entry4 : mapQ2.entrySet()) {
                                bundle3.putString((String) entry4.getKey(), (String) entry4.getValue());
                            }
                            Unit unit4 = Unit.f71706a;
                        }
                        String str4 = qw2Var2.f8869a;
                        h03Var2.f4165a = mapA;
                        h03Var2.f4166b = th3Var;
                        h03Var2.f4167c = r62;
                        h03Var2.f4168d = r62;
                        h03Var2.f4169e = r62;
                        h03Var2.f4170f = r62;
                        h03Var2.f4171g = r62;
                        h03Var2.f4172h = r62;
                        h03Var2.f4175k = 4;
                        map4 = mapA;
                        try {
                            if (i03Var3.a(bundle3, bundle2, aVar2, str3, str4, h03Var2) != coroutineSingletons) {
                                r22 = th3Var;
                                map4 = map4;
                                th3 = r62;
                                Unit unit22 = Unit.f71706a;
                                CloseableKt.a(r22, th3);
                                return unit22;
                            }
                            return coroutineSingletons;
                        } catch (Throwable th6) {
                            th = th6;
                            mapA = map4;
                            mapA.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                    } catch (Throwable th7) {
                        th = th7;
                        map4 = mapA;
                    }
                } else {
                    th3 th3Var6 = h03Var2.f4172h;
                    th3 th3Var7 = h03Var2.f4171g;
                    aVar3 = h03Var2.f4170f;
                    qw2Var2 = h03Var2.f4169e;
                    Map map6 = h03Var2.f4168d;
                    ni.q qVar7 = h03Var2.f4167c;
                    entry3 = (Map.Entry) h03Var2.f4166b;
                    i03Var2 = (i03) h03Var2.f4165a;
                    ResultKt.b(obj);
                    A = th3Var6;
                    qVar2 = qVar7;
                    objA2 = obj;
                    th3Var3 = th3Var7;
                    map2 = map6;
                    try {
                        if (((Boolean) objA2).booleanValue()) {
                            zi3.a((pu0) new tu0("The adapter requested for collecting bidding signals (" + entry3.getKey() + ") is not eligible because it was excluded by AdRequest.skipUninitializedAdapters and has not yet successfully initialized.", wd1.f11214b), false);
                            Unit unit5 = Unit.f71706a;
                            CloseableKt.a(A, null);
                            return unit5;
                        }
                        String str5 = (String) entry3.getKey();
                        Bundle bundle4 = (Bundle) qVar2.f78314g.get(str5);
                        if (bundle4 == null) {
                            bundle4 = new Bundle();
                        }
                        Bundle bundle5 = bundle4;
                        ap apVar2 = (ap) map2.get(str5);
                        Bundle bundle6 = new Bundle();
                        if (apVar2 != null && (mapQ = apVar2.q()) != null) {
                            for (Map.Entry entry5 : mapQ.entrySet()) {
                                bundle6.putString((String) entry5.getKey(), (String) entry5.getValue());
                            }
                            Unit unit6 = Unit.f71706a;
                        }
                        String str6 = qw2Var2.f8869a;
                        h03Var2.f4165a = th3Var3;
                        h03Var2.f4166b = A;
                        h03Var2.f4167c = null;
                        h03Var2.f4168d = null;
                        h03Var2.f4169e = null;
                        h03Var2.f4170f = null;
                        h03Var2.f4171g = null;
                        h03Var2.f4172h = null;
                        h03Var2.f4175k = 2;
                        mi.a aVar4 = aVar3;
                        th2 = null;
                        if (i03Var2.a(bundle6, bundle5, aVar4, str5, str6, h03Var2) != coroutineSingletons) {
                            r22 = A;
                            Unit unit7 = Unit.f71706a;
                            CloseableKt.a(r22, th2);
                            return unit7;
                        }
                        return coroutineSingletons;
                    } catch (Throwable th8) {
                        th = th8;
                        th3Var2 = A;
                        A = th3Var3;
                        try {
                            A.b(th);
                            if (th instanceof b.a4) {
                            }
                        } catch (Throwable th9) {
                            try {
                                throw th9;
                            } catch (Throwable th10) {
                                CloseableKt.a(th3Var2, th9);
                                throw th10;
                            }
                        }
                    }
                }
            } catch (Throwable th11) {
                th = th11;
                th3Var = r22;
            }
            try {
                mapA.b(th);
                if (th instanceof b.a4) {
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        mapA.a(th);
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
            } catch (Throwable th12) {
                try {
                    throw th12;
                } catch (Throwable th13) {
                    CloseableKt.a(th3Var, th12);
                    throw th13;
                }
            }
        } catch (Throwable th14) {
            th = th14;
            A = map4;
            th3Var2 = r22;
        }
    }
}
