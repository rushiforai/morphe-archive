package ads_mobile_sdk;

import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import b.o2;
import c0.d;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;
import kotlin.reflect.KProperty;
import kotlinx.coroutines.TimeoutCancellationException;
import ni.w;
import wi.f;

/* loaded from: classes2.dex */
public final class nj3 implements b.va, b.g6 {

    /* renamed from: a, reason: collision with root package name */
    public final kz2 f7606a;

    /* renamed from: b, reason: collision with root package name */
    public final zm1 f7607b;

    /* renamed from: c, reason: collision with root package name */
    public final k8 f7608c;

    /* renamed from: d, reason: collision with root package name */
    public final kx2 f7609d;

    /* renamed from: e, reason: collision with root package name */
    public final Optional f7610e;

    /* renamed from: f, reason: collision with root package name */
    public final d33 f7611f;

    /* renamed from: g, reason: collision with root package name */
    public final z1 f7612g;

    /* renamed from: h, reason: collision with root package name */
    public final mi3 f7613h;

    /* renamed from: i, reason: collision with root package name */
    public final int f7614i;

    /* renamed from: j, reason: collision with root package name */
    public final o2 f7615j;

    /* renamed from: k, reason: collision with root package name */
    public final a33 f7616k;

    /* renamed from: l, reason: collision with root package name */
    public final zm0 f7617l;

    /* renamed from: m, reason: collision with root package name */
    public final eg2 f7618m;
    public final b.m5 n;
    public final ck o;

    /* renamed from: p, reason: collision with root package name */
    public final Set f7619p;

    /* renamed from: q, reason: collision with root package name */
    public final jr0 f7620q;

    /* renamed from: r, reason: collision with root package name */
    public final m31 f7621r;

    /* renamed from: s, reason: collision with root package name */
    public final ft1 f7622s;

    public nj3(kz2 rootTraceCreator, zm1 macroExpander, k8 adSpamClient, kx2 retryingUrlPinger, Optional view, d33 serverTransaction, z1 adConfiguration, mi3 traceMetaSet, int i5, o2 clock, a33 serverSideVerificationOptionsHolder, zm0 firebaseAnalyticsEventHandler, eg2 placementIdWrapper, b.m5 adEventEmitterProvider, ck appStatsTracker, Set requestTypes, jr0 flags, m31 impressionDataWrapper) {
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(macroExpander, "macroExpander");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(retryingUrlPinger, "retryingUrlPinger");
        Intrinsics.g(view, "view");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(serverSideVerificationOptionsHolder, "serverSideVerificationOptionsHolder");
        Intrinsics.g(firebaseAnalyticsEventHandler, "firebaseAnalyticsEventHandler");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        Intrinsics.g(adEventEmitterProvider, "adEventEmitterProvider");
        Intrinsics.g(appStatsTracker, "appStatsTracker");
        Intrinsics.g(requestTypes, "requestTypes");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(impressionDataWrapper, "impressionDataWrapper");
        this.f7606a = rootTraceCreator;
        this.f7607b = macroExpander;
        this.f7608c = adSpamClient;
        this.f7609d = retryingUrlPinger;
        this.f7610e = view;
        this.f7611f = serverTransaction;
        this.f7612g = adConfiguration;
        this.f7613h = traceMetaSet;
        this.f7614i = i5;
        this.f7615j = clock;
        this.f7616k = serverSideVerificationOptionsHolder;
        this.f7617l = firebaseAnalyticsEventHandler;
        this.f7618m = placementIdWrapper;
        this.n = adEventEmitterProvider;
        this.o = appStatsTracker;
        this.f7619p = requestTypes;
        this.f7620q = flags;
        this.f7621r = impressionDataWrapper;
        this.f7622s = new ft1(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ni.s sVar, Continuation continuation) {
        hj3 hj3Var;
        nj3 nj3Var;
        if (continuation instanceof hj3) {
            hj3Var = (hj3) continuation;
            int i5 = hj3Var.f4417d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hj3Var.f4417d = i5 - Integer.MIN_VALUE;
            } else {
                hj3Var = new hj3(this, (ContinuationImpl) continuation);
            }
        }
        hj3 hj3Var2 = hj3Var;
        Object objA = hj3Var2.f4415b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hj3Var2.f4417d;
        if (i11 == 0) {
            ResultKt.b(objA);
            w wVar = sVar.f78324d;
            int iIntValue = wVar != null ? wVar.b0().intValue() : sVar.f78322b.f78321a;
            ArrayList arrayList = this.f7612g.W;
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String string = ((Uri) it.next()).toString();
                Intrinsics.f(string, "toString(...)");
                arrayList2.add(Uri.parse(r70.j.F0(string, "@gw_mpe@", "2." + iIntValue, false)));
            }
            Integer num = new Integer(this.f7614i);
            hj3Var2.f4414a = this;
            hj3Var2.f4417d = 1;
            objA = zm1.a(this.f7607b, arrayList2, this.f7611f, this.f7612g, num, null, null, null, null, null, null, hj3Var2, 1008);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            nj3Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nj3Var = hj3Var2.f4414a;
            ResultKt.b(objA);
        }
        a(nj3Var, (List) objA);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // b.g6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(Continuation continuation) {
        lj3 lj3Var;
        nj3 nj3Var;
        if (continuation instanceof lj3) {
            lj3Var = (lj3) continuation;
            int i5 = lj3Var.f6256d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lj3Var.f6256d = i5 - Integer.MIN_VALUE;
            } else {
                lj3Var = new lj3(this, (ContinuationImpl) continuation);
            }
        }
        lj3 lj3Var2 = lj3Var;
        Object objA = lj3Var2.f6254b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lj3Var2.f6256d;
        if (i11 == 0) {
            ResultKt.b(objA);
            z1 z1Var = this.f7612g;
            ArrayList arrayList = z1Var.f12384i0;
            Integer num = new Integer(this.f7614i);
            lj3Var2.f6253a = this;
            lj3Var2.f6256d = 1;
            objA = zm1.a(this.f7607b, arrayList, this.f7611f, z1Var, num, null, null, null, null, null, null, lj3Var2, 1008);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            nj3Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nj3Var = lj3Var2.f6253a;
            ResultKt.b(objA);
        }
        a(nj3Var, (List) objA);
        return Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0197 A[Catch: all -> 0x0171, TRY_LEAVE, TryCatch #1 {all -> 0x0171, blocks: (B:90:0x015e, B:92:0x0165, B:94:0x0169, B:96:0x016d, B:99:0x0174, B:101:0x0178, B:103:0x017c, B:105:0x0180, B:106:0x0181, B:107:0x0186, B:108:0x0187, B:109:0x018e, B:110:0x018f, B:111:0x0196, B:112:0x0197), top: B:119:0x015e }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d0 A[Catch: all -> 0x00dc, TryCatch #9 {all -> 0x00dc, blocks: (B:44:0x00c9, B:46:0x00d0, B:48:0x00d4, B:50:0x00d8, B:53:0x00df, B:55:0x00e3, B:57:0x00e7, B:59:0x00eb, B:60:0x00ec, B:61:0x00f1, B:62:0x00f2, B:63:0x00f9, B:64:0x00fa, B:65:0x0101, B:66:0x0102), top: B:134:0x00c9 }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0102 A[Catch: all -> 0x00dc, TRY_LEAVE, TryCatch #9 {all -> 0x00dc, blocks: (B:44:0x00c9, B:46:0x00d0, B:48:0x00d4, B:50:0x00d8, B:53:0x00df, B:55:0x00e3, B:57:0x00e7, B:59:0x00eb, B:60:0x00ec, B:61:0x00f1, B:62:0x00f2, B:63:0x00f9, B:64:0x00fa, B:65:0x0101, B:66:0x0102), top: B:134:0x00c9 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0165 A[Catch: all -> 0x0171, TryCatch #1 {all -> 0x0171, blocks: (B:90:0x015e, B:92:0x0165, B:94:0x0169, B:96:0x016d, B:99:0x0174, B:101:0x0178, B:103:0x017c, B:105:0x0180, B:106:0x0181, B:107:0x0186, B:108:0x0187, B:109:0x018e, B:110:0x018f, B:111:0x0196, B:112:0x0197), top: B:119:0x015e }] */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v21 */
    /* JADX WARN: Type inference failed for: r3v36, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v19, types: [ads_mobile_sdk.th3] */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(Continuation continuation) {
        jj3 jj3Var;
        Throwable th2;
        th3 th3Var;
        em2 em2Var;
        th3 th3Var2;
        Object objA;
        nj3 nj3Var;
        th3 th3Var3;
        em2 em2Var2;
        em2 em2Var3;
        em2 em2Var4;
        Throwable th3;
        Object objA2;
        nj3 nj3Var2;
        em2 em2Var5;
        if (continuation instanceof jj3) {
            jj3Var = (jj3) continuation;
            int i5 = jj3Var.f5274f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jj3Var.f5274f = i5 - Integer.MIN_VALUE;
            } else {
                jj3Var = new jj3(this, (ContinuationImpl) continuation);
            }
        }
        jj3 jj3Var2 = jj3Var;
        Object obj = jj3Var2.f5272d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jj3Var2.f5274f;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = this.f7606a;
            wv0 wv0Var = wv0.CUI_NAME_PRESENTATION;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = this.f7613h;
            if (ji3.b().f4777a == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    zm1 zm1Var = this.f7607b;
                    z1 z1Var = this.f7612g;
                    ArrayList arrayList = z1Var.U;
                    d33 d33Var = this.f7611f;
                    Integer num = new Integer(this.f7614i);
                    jj3Var2.f5269a = em2VarA;
                    jj3Var2.f5270b = em2VarA;
                    jj3Var2.f5271c = this;
                    jj3Var2.f5274f = 1;
                    th3 = null;
                    em2Var2 = em2VarA;
                    try {
                        objA2 = zm1.a(zm1Var, arrayList, d33Var, z1Var, num, null, null, null, null, null, null, jj3Var2, 1008);
                        if (objA2 != coroutineSingletons) {
                            nj3Var2 = this;
                            em2Var5 = em2Var2;
                            a(nj3Var2, (List) objA2);
                            Unit unit = Unit.f71706a;
                            CloseableKt.a(em2Var5, th3);
                            return Unit.f71706a;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        em2Var3 = em2Var2;
                        em2Var4 = em2Var3;
                        em2Var4.b(th);
                        if (th instanceof b.a4) {
                            throw th;
                        }
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            em2Var4.a(th);
                        }
                        if (th instanceof TimeoutCancellationException) {
                            throw new lw0(th);
                        }
                        if (th instanceof CancellationException) {
                            throw new du0(th);
                        }
                        if (th instanceof dv0) {
                            throw th;
                        }
                        throw new iu0(th);
                    }
                } catch (Throwable th5) {
                    th = th5;
                    em2Var2 = em2VarA;
                }
            } else {
                th2 = null;
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    zm1 zm1Var2 = this.f7607b;
                    z1 z1Var2 = this.f7612g;
                    ArrayList arrayList2 = z1Var2.U;
                    d33 d33Var2 = this.f7611f;
                    Integer num2 = new Integer(this.f7614i);
                    jj3Var2.f5269a = th3VarA;
                    jj3Var2.f5270b = th3VarA;
                    jj3Var2.f5271c = this;
                    jj3Var2.f5274f = 2;
                    th3Var = th3VarA;
                    try {
                        objA = zm1.a(zm1Var2, arrayList2, d33Var2, z1Var2, num2, null, null, null, null, null, null, jj3Var2, 1008);
                        if (objA != coroutineSingletons) {
                            nj3Var = this;
                            th3Var3 = th3Var;
                            a(nj3Var, (List) objA);
                            Unit unit2 = Unit.f71706a;
                            CloseableKt.a(th3Var3, th2);
                            return Unit.f71706a;
                        }
                    } catch (Throwable th6) {
                        th = th6;
                        em2Var = th3Var;
                        th3Var2 = em2Var;
                        th3Var2.b(th);
                        if (th instanceof b.a4) {
                            throw th;
                        }
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var2.a(th);
                        }
                        if (th instanceof TimeoutCancellationException) {
                            throw new lw0(th);
                        }
                        if (th instanceof CancellationException) {
                            throw new du0(th);
                        }
                        if (th instanceof dv0) {
                            throw th;
                        }
                        throw new iu0(th);
                    }
                } catch (Throwable th7) {
                    th = th7;
                    th3Var = th3VarA;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            nj3Var2 = jj3Var2.f5271c;
            ?? r32 = jj3Var2.f5270b;
            ?? r42 = jj3Var2.f5269a;
            try {
                ResultKt.b(obj);
                em2Var2 = r42;
                em2Var5 = r32;
                objA2 = obj;
                th3 = null;
            } catch (Throwable th8) {
                th = th8;
                em2Var3 = r32;
                em2Var4 = r42;
                try {
                    em2Var4.b(th);
                    if (th instanceof b.a4) {
                    }
                } finally {
                }
            }
            try {
                a(nj3Var2, (List) objA2);
                Unit unit3 = Unit.f71706a;
                CloseableKt.a(em2Var5, th3);
                return Unit.f71706a;
            } catch (Throwable th9) {
                th = th9;
                r32 = em2Var5;
                r42 = em2Var2;
                em2Var3 = r32;
                em2Var4 = r42;
                em2Var4.b(th);
                if (th instanceof b.a4) {
                }
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nj3Var = jj3Var2.f5271c;
            th3 th3Var4 = jj3Var2.f5270b;
            th3 th3Var5 = jj3Var2.f5269a;
            try {
                ResultKt.b(obj);
                th3Var = th3Var5;
                th3Var3 = th3Var4;
                objA = obj;
                th2 = null;
                try {
                    a(nj3Var, (List) objA);
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(th3Var3, th2);
                    return Unit.f71706a;
                } catch (Throwable th10) {
                    th = th10;
                    th3Var4 = th3Var3;
                    th3Var5 = th3Var;
                    em2Var = th3Var4;
                    th3Var2 = th3Var5;
                    try {
                        th3Var2.b(th);
                        if (th instanceof b.a4) {
                        }
                    } finally {
                        try {
                            throw th;
                        } finally {
                        }
                    }
                }
            } catch (Throwable th11) {
                th = th11;
                em2Var = th3Var4;
                th3Var2 = th3Var5;
                th3Var2.b(th);
                if (th instanceof b.a4) {
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // b.g6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Continuation continuation) {
        mj3 mj3Var;
        nj3 nj3Var;
        if (continuation instanceof mj3) {
            mj3Var = (mj3) continuation;
            int i5 = mj3Var.f7243d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mj3Var.f7243d = i5 - Integer.MIN_VALUE;
            } else {
                mj3Var = new mj3(this, (ContinuationImpl) continuation);
            }
        }
        mj3 mj3Var2 = mj3Var;
        Object objA = mj3Var2.f7241b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mj3Var2.f7243d;
        if (i11 == 0) {
            ResultKt.b(objA);
            z1 z1Var = this.f7612g;
            ArrayList arrayList = z1Var.f12386j0;
            Integer num = new Integer(this.f7614i);
            mj3Var2.f7240a = this;
            mj3Var2.f7243d = 1;
            objA = zm1.a(this.f7607b, arrayList, this.f7611f, z1Var, num, null, null, null, null, null, null, mj3Var2, 1008);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            nj3Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nj3Var = mj3Var2.f7240a;
            ResultKt.b(objA);
        }
        a(nj3Var, (List) objA);
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:61:0x014b, code lost:
    
        if (r0 == r3) goto L62;
     */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:58:0x0112 -> B:59:0x0116). Please report as a decompilation issue!!! */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object n(Continuation continuation) {
        gj3 gj3Var;
        String strA;
        Iterator it;
        Collection collection;
        String str;
        gj3 gj3Var2;
        nj3 nj3Var;
        if (continuation instanceof gj3) {
            gj3Var = (gj3) continuation;
            int i5 = gj3Var.f3877h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gj3Var.f3877h = i5 - Integer.MIN_VALUE;
            } else {
                gj3Var = new gj3(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = gj3Var.f3875f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gj3Var.f3877h;
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                nj3Var = gj3Var.f3870a;
                ResultKt.b(objA);
                a(nj3Var, (List) objA);
                return Unit.f71706a;
            }
            collection = gj3Var.f3874e;
            it = gj3Var.f3873d;
            Collection collection2 = gj3Var.f3872c;
            String str2 = gj3Var.f3871b;
            nj3 nj3Var2 = gj3Var.f3870a;
            ResultKt.b(objA);
            str = str2;
            collection.add((Uri) objA);
            gj3Var2 = gj3Var;
            collection = collection2;
            nj3Var = nj3Var2;
            if (it.hasNext()) {
                Uri uri = (Uri) it.next();
                zm0 zm0Var = nj3Var.f7617l;
                rm0 rm0Var = rm0.f9230b;
                Bundle bundle = nj3Var.f7612g.f12397q;
                gj3Var2.f3870a = nj3Var;
                gj3Var2.f3871b = str;
                gj3Var2.f3872c = collection;
                gj3Var2.f3873d = it;
                gj3Var2.f3874e = collection;
                gj3Var2.f3877h = 1;
                Comparable comparableA = zm0Var.a(uri, rm0Var, bundle, gj3Var2);
                if (comparableA != coroutineSingletons) {
                    nj3Var2 = nj3Var;
                    gj3Var = gj3Var2;
                    objA = comparableA;
                    collection2 = collection;
                    collection.add((Uri) objA);
                    gj3Var2 = gj3Var;
                    collection = collection2;
                    nj3Var = nj3Var2;
                    if (it.hasNext()) {
                        zm1 zm1Var = nj3Var.f7607b;
                        d33 d33Var = nj3Var.f7611f;
                        z1 z1Var = nj3Var.f7612g;
                        Integer num = new Integer(nj3Var.f7614i);
                        gj3Var2.f3870a = nj3Var;
                        gj3Var2.f3871b = null;
                        gj3Var2.f3872c = null;
                        gj3Var2.f3873d = null;
                        gj3Var2.f3874e = null;
                        gj3Var2.f3877h = 2;
                        objA = zm1.a(zm1Var, (List) collection, d33Var, z1Var, num, null, null, str, null, null, null, gj3Var2, 944);
                    }
                }
            }
            return coroutineSingletons;
        }
        ResultKt.b(objA);
        kz2 kz2Var = this.f7606a;
        wv0 wv0Var = wv0.CUI_NAME_CLICK;
        EmptyList emptyList = EmptyList.f71733a;
        mi3 mi3Var = this.f7613h;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                strA = this.f7608c.a((View) OptionalsKt.b(this.f7610e), this.f7612g.f12407v);
                em2VarA.close();
            } catch (Throwable th2) {
                try {
                    em2VarA.b(th2);
                    if (th2 instanceof b.a4) {
                        throw th2;
                    }
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        em2VarA.a(th2);
                    }
                    if (th2 instanceof TimeoutCancellationException) {
                        throw new lw0(th2);
                    }
                    if (th2 instanceof CancellationException) {
                        throw new du0(th2);
                    }
                    if (th2 instanceof dv0) {
                        throw th2;
                    }
                    throw new iu0(th2);
                } finally {
                }
            }
        } else {
            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
            try {
                strA = this.f7608c.a((View) OptionalsKt.b(this.f7610e), this.f7612g.f12407v);
                th3VarA.close();
            } catch (Throwable th3) {
                try {
                    th3VarA.b(th3);
                    if (th3 instanceof b.a4) {
                        throw th3;
                    }
                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                        th3VarA.a(th3);
                    }
                    if (th3 instanceof TimeoutCancellationException) {
                        throw new lw0(th3);
                    }
                    if (th3 instanceof CancellationException) {
                        throw new du0(th3);
                    }
                    if (th3 instanceof dv0) {
                        throw th3;
                    }
                    throw new iu0(th3);
                } finally {
                }
            }
        }
        ArrayList arrayList = this.f7612g.f12407v;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        it = arrayList.iterator();
        collection = arrayList2;
        str = strA;
        gj3Var2 = gj3Var;
        nj3Var = this;
        if (it.hasNext()) {
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:60:0x0147 -> B:61:0x014a). Please report as a decompilation issue!!! */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object q(Continuation continuation) {
        ij3 ij3Var;
        String strB;
        Iterator it;
        Collection collection;
        nj3 nj3Var;
        Integer num;
        zm1 zm1Var;
        nj3 nj3Var2;
        z1 z1Var;
        d33 d33Var;
        List list;
        String str;
        eg2 eg2Var;
        nj3 nj3Var3;
        if (continuation instanceof ij3) {
            ij3Var = (ij3) continuation;
            int i5 = ij3Var.f4811k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ij3Var.f4811k = i5 - Integer.MIN_VALUE;
            } else {
                ij3Var = new ij3(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = ij3Var.f4809i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ij3Var.f4811k;
        if (i11 == 0) {
            ResultKt.b(objA);
            kz2 kz2Var = this.f7606a;
            wv0 wv0Var = wv0.CUI_NAME_IMPRESSION;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = this.f7613h;
            if (ji3.b().f4777a == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    strB = this.f7608c.b((View) OptionalsKt.b(this.f7610e), this.f7612g.H);
                    em2VarA.close();
                } catch (Throwable th2) {
                    try {
                        em2VarA.b(th2);
                        if (th2 instanceof b.a4) {
                            throw th2;
                        }
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            em2VarA.a(th2);
                        }
                        if (th2 instanceof TimeoutCancellationException) {
                            throw new lw0(th2);
                        }
                        if (th2 instanceof CancellationException) {
                            throw new du0(th2);
                        }
                        if (th2 instanceof dv0) {
                            throw th2;
                        }
                        throw new iu0(th2);
                    } finally {
                    }
                }
            } else {
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    strB = this.f7608c.b((View) OptionalsKt.b(this.f7610e), this.f7612g.H);
                    th3VarA.close();
                } catch (Throwable th3) {
                    try {
                        th3VarA.b(th3);
                        if (th3 instanceof b.a4) {
                            throw th3;
                        }
                        if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                            th3VarA.a(th3);
                        }
                        if (th3 instanceof TimeoutCancellationException) {
                            throw new lw0(th3);
                        }
                        if (th3 instanceof CancellationException) {
                            throw new du0(th3);
                        }
                        if (th3 instanceof dv0) {
                            throw th3;
                        }
                        throw new iu0(th3);
                    } finally {
                    }
                }
            }
            ArrayList arrayList = this.f7612g.H;
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            it = arrayList.iterator();
            collection = arrayList2;
            nj3Var = this;
            if (it.hasNext()) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                nj3Var3 = ij3Var.f4801a;
                ResultKt.b(objA);
                List uris = (List) objA;
                y2 y2Var = (y2) nj3Var3.n.get();
                Boolean bool = Boolean.TRUE;
                kx2 kx2Var = nj3Var3.f7609d;
                kx2Var.getClass();
                Intrinsics.g(uris, "uris");
                jx2.a(kx2Var.f6014c, uris, kx2Var.f6012a, kx2Var.f6013b, y2Var, bool, 32);
                return Unit.f71706a;
            }
            eg2 eg2Var2 = ij3Var.f4808h;
            String str2 = ij3Var.f4807g;
            Integer num2 = ij3Var.f4806f;
            z1 z1Var2 = (z1) ij3Var.f4805e;
            d33 d33Var2 = (d33) ij3Var.f4804d;
            List list2 = (List) ij3Var.f4803c;
            zm1 zm1Var2 = (zm1) ij3Var.f4802b;
            nj3 nj3Var4 = ij3Var.f4801a;
            ResultKt.b(objA);
            z1Var = z1Var2;
            zm1Var = zm1Var2;
            d33Var = d33Var2;
            list = list2;
            eg2Var = eg2Var2;
            str = str2;
            nj3Var2 = nj3Var4;
            num = num2;
            p31 p31Var = (p31) objA;
            m31 m31Var = nj3Var2.f7621r;
            ij3Var.f4801a = nj3Var2;
            ij3Var.f4802b = null;
            ij3Var.f4803c = null;
            ij3Var.f4804d = null;
            ij3Var.f4805e = null;
            ij3Var.f4806f = null;
            ij3Var.f4807g = null;
            ij3Var.f4808h = null;
            ij3Var.f4811k = 3;
            objA = zm1.a(zm1Var, list, d33Var, z1Var, num, null, null, str, eg2Var, p31Var, m31Var, ij3Var, 48);
            if (objA != coroutineSingletons) {
                nj3Var3 = nj3Var2;
                List uris2 = (List) objA;
                y2 y2Var2 = (y2) nj3Var3.n.get();
                Boolean bool2 = Boolean.TRUE;
                kx2 kx2Var2 = nj3Var3.f7609d;
                kx2Var2.getClass();
                Intrinsics.g(uris2, "uris");
                jx2.a(kx2Var2.f6014c, uris2, kx2Var2.f6012a, kx2Var2.f6013b, y2Var2, bool2, 32);
                return Unit.f71706a;
            }
            return coroutineSingletons;
        }
        collection = (Collection) ij3Var.f4805e;
        it = (Iterator) ij3Var.f4804d;
        Collection collection2 = ij3Var.f4803c;
        String str3 = (String) ij3Var.f4802b;
        nj3Var = ij3Var.f4801a;
        ResultKt.b(objA);
        collection.add((Uri) objA);
        collection = collection2;
        strB = str3;
        if (it.hasNext()) {
            Uri uri = (Uri) it.next();
            zm0 zm0Var = nj3Var.f7617l;
            rm0 rm0Var = rm0.f9231c;
            Bundle bundle = nj3Var.f7612g.f12397q;
            ij3Var.f4801a = nj3Var;
            ij3Var.f4802b = strB;
            ij3Var.f4803c = collection;
            ij3Var.f4804d = it;
            ij3Var.f4805e = collection;
            ij3Var.f4811k = 1;
            Comparable comparableA = zm0Var.a(uri, rm0Var, bundle, ij3Var);
            if (comparableA != coroutineSingletons) {
                str3 = strB;
                objA = comparableA;
                collection2 = collection;
                collection.add((Uri) objA);
                collection = collection2;
                strB = str3;
                if (it.hasNext()) {
                    List list3 = (List) collection;
                    zm1 zm1Var3 = nj3Var.f7607b;
                    d33 d33Var3 = nj3Var.f7611f;
                    z1 z1Var3 = nj3Var.f7612g;
                    num = new Integer(nj3Var.f7614i);
                    eg2 eg2Var3 = nj3Var.f7618m;
                    ij3Var.f4801a = nj3Var;
                    ij3Var.f4802b = zm1Var3;
                    ij3Var.f4803c = list3;
                    ij3Var.f4804d = d33Var3;
                    ij3Var.f4805e = z1Var3;
                    ij3Var.f4806f = num;
                    ij3Var.f4807g = strB;
                    ij3Var.f4808h = eg2Var3;
                    ij3Var.f4811k = 2;
                    jr0 jr0Var = nj3Var.f7620q;
                    jr0Var.getClass();
                    Object objA2 = !((Boolean) jr0Var.a("gads:enable_impression_sequence:enabled", Boolean.FALSE, jn.a$10)).booleanValue() ? null : nj3Var.f7622s.a(u.a$6, new d(nj3Var, null, 1), ij3Var);
                    if (objA2 != coroutineSingletons) {
                        zm1Var = zm1Var3;
                        nj3Var2 = nj3Var;
                        z1Var = z1Var3;
                        d33Var = d33Var3;
                        list = list3;
                        str = strB;
                        objA = objA2;
                        eg2Var = eg2Var3;
                        p31 p31Var2 = (p31) objA;
                        m31 m31Var2 = nj3Var2.f7621r;
                        ij3Var.f4801a = nj3Var2;
                        ij3Var.f4802b = null;
                        ij3Var.f4803c = null;
                        ij3Var.f4804d = null;
                        ij3Var.f4805e = null;
                        ij3Var.f4806f = null;
                        ij3Var.f4807g = null;
                        ij3Var.f4808h = null;
                        ij3Var.f4811k = 3;
                        objA = zm1.a(zm1Var, list, d33Var, z1Var, num, null, null, str, eg2Var, p31Var2, m31Var2, ij3Var, 48);
                        if (objA != coroutineSingletons) {
                        }
                    }
                }
            }
        }
        return coroutineSingletons;
    }

    @Override // b.g6
    public final Unit a(wi.a rewardItem, Continuation continuation) {
        ArrayList arrayList = this.f7612g.f12378f0;
        this.f7615j.getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        a33 a33Var = this.f7616k;
        io.sentry.e3 e3Var = a33Var.f824a;
        KProperty[] kPropertyArr = a33.f823b;
        f fVar = (f) e3Var.getValue(a33Var, kPropertyArr[0]);
        String str = fVar != null ? fVar.f94395a : null;
        f fVar2 = (f) a33Var.f824a.getValue(a33Var, kPropertyArr[0]);
        String str2 = fVar2 != null ? fVar2.f94396b : null;
        zm1 zm1Var = this.f7607b;
        zm1Var.getClass();
        Intrinsics.g(rewardItem, "rewardItem");
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            String string = ((Uri) it.next()).toString();
            Intrinsics.f(string, "toString(...)");
            String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String strEncode = Uri.encode(str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str);
            Intrinsics.f(strEncode, "encode(...)");
            String strF0 = r70.j.F0(string, "@gw_rwd_userid@", strEncode, false);
            if (str2 != null) {
                str3 = str2;
            }
            String strEncode2 = Uri.encode(str3);
            Intrinsics.f(strEncode2, "encode(...)");
            String strF02 = r70.j.F0(r70.j.F0(strF0, "@gw_rwd_custom_data@", strEncode2, false), "@gw_tmstmp@", String.valueOf(jElapsedRealtime), false);
            String strEncode3 = Uri.encode(rewardItem.getType());
            Intrinsics.f(strEncode3, "encode(...)");
            arrayList2.add(Uri.parse(r70.j.F0(r70.j.F0(r70.j.F0(strF02, "@gw_rwd_itm@", strEncode3, false), "@gw_rwd_amt@", String.valueOf(rewardItem.getAmount()), false), "@gw_sdkver@", zm1Var.f12587b, false)));
        }
        a(this, arrayList2);
        return Unit.f71706a;
    }

    public static void a(nj3 nj3Var, List uris) {
        Boolean bool = Boolean.FALSE;
        kx2 kx2Var = nj3Var.f7609d;
        kx2Var.getClass();
        Intrinsics.g(uris, "uris");
        jx2.a(kx2Var.f6014c, uris, kx2Var.f6012a, kx2Var.f6013b, null, bool, 32);
    }
}
