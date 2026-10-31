package ads_mobile_sdk;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import androidx.recyclerview.widget.c0;
import b.e9;
import b.ed;
import b.h6;
import b.n7;
import b.o2;
import b.ob;
import b.r2;
import b.t2;
import b.t4;
import b.x0;
import b0.x;
import c80.d;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.Charsets;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import oi.f;
import t70.m0;
import t70.s1;
import ui.o;
import w70.u1;

/* loaded from: classes.dex */
public final class pe2 {

    /* renamed from: a, reason: collision with root package name */
    public final j1 f8231a;

    /* renamed from: b, reason: collision with root package name */
    public final c6 f8232b;

    /* renamed from: c, reason: collision with root package name */
    public final t4 f8233c;

    /* renamed from: d, reason: collision with root package name */
    public final o2 f8234d;

    /* renamed from: e, reason: collision with root package name */
    public final Context f8235e;

    /* renamed from: f, reason: collision with root package name */
    public final x0 f8236f;

    /* renamed from: g, reason: collision with root package name */
    public final kz2 f8237g;

    /* renamed from: h, reason: collision with root package name */
    public final rg0 f8238h;

    /* renamed from: i, reason: collision with root package name */
    public final b.m5 f8239i;

    /* renamed from: j, reason: collision with root package name */
    public final d f8240j;

    /* renamed from: k, reason: collision with root package name */
    public volatile boolean f8241k;

    /* renamed from: l, reason: collision with root package name */
    public final ConcurrentHashMap f8242l;

    public pe2(j1 dataStore, c6 fileStore, t4 flags, o2 clock, Context context, x0 flagValueProvider, kz2 rootTraceCreator, rg0 consentStringsProvider, b.m5 persistentCacheAutoRefreshManager) {
        Intrinsics.g(dataStore, "dataStore");
        Intrinsics.g(fileStore, "fileStore");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(context, "context");
        Intrinsics.g(flagValueProvider, "flagValueProvider");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(consentStringsProvider, "consentStringsProvider");
        Intrinsics.g(persistentCacheAutoRefreshManager, "persistentCacheAutoRefreshManager");
        this.f8231a = dataStore;
        this.f8232b = fileStore;
        this.f8233c = flags;
        this.f8234d = clock;
        this.f8235e = context;
        this.f8236f = flagValueProvider;
        this.f8237g = rootTraceCreator;
        this.f8238h = consentStringsProvider;
        this.f8239i = persistentCacheAutoRefreshManager;
        this.f8240j = new d();
        this.f8242l = new ConcurrentHashMap();
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x00c0, code lost:
    
        if (r0 == r11) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x00c0 -> B:27:0x00c3). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable a(qw2 qw2Var, String str, boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        sd2 sd2Var;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        pe2 pe2Var;
        Collection collection;
        Iterator it;
        if (continuationImpl instanceof sd2) {
            sd2Var = (sd2) continuationImpl;
            int i5 = sd2Var.f9537g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sd2Var.f9537g = i5 - Integer.MIN_VALUE;
            } else {
                sd2Var = new sd2(this, continuationImpl);
            }
        }
        sd2 sd2Var2 = sd2Var;
        Object objY = sd2Var2.f9535e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sd2Var2.f9537g;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = b.u4.l(objY);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            this.f8234d.getClass();
            long jCurrentTimeMillis = System.currentTimeMillis();
            ArrayList arrayList = new ArrayList();
            ud2 ud2Var = new ud2(arrayList, objectRefL, objectRef3, qw2Var, str, this, jCurrentTimeMillis, z11);
            sd2Var2.f9531a = this;
            sd2Var2.f9532b = objectRefL;
            sd2Var2.f9533c = objectRef3;
            sd2Var2.f9534d = arrayList;
            sd2Var2.f9537g = 1;
            if (this.f8231a.a(ud2Var, sd2Var2) != coroutineSingletons) {
                objectRef = objectRefL;
                objectRef2 = objectRef3;
                pe2Var = this;
                collection = arrayList;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            Collection collection2 = (List) sd2Var2.f9534d;
            objectRef2 = sd2Var2.f9533c;
            objectRef = sd2Var2.f9532b;
            pe2Var = sd2Var2.f9531a;
            ResultKt.b(objY);
            collection = collection2;
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = (Iterator) sd2Var2.f9534d;
            objectRef2 = sd2Var2.f9533c;
            objectRef = sd2Var2.f9532b;
            pe2Var = sd2Var2.f9531a;
            ResultKt.b(objY);
            if (it.hasNext()) {
                return new Pair(objectRef.f71863a, objectRef2.f71863a);
            }
            String str2 = (String) it.next();
            sd2Var2.f9531a = pe2Var;
            sd2Var2.f9532b = objectRef;
            sd2Var2.f9533c = objectRef2;
            sd2Var2.f9534d = it;
            sd2Var2.f9537g = 2;
            ((mc2) pe2Var.f8239i.get()).a(str2);
            objY = m0.y(t70.c2.f88780b, new mx.e(pe2Var, str2, (Continuation) null, 11), sd2Var2);
        }
        it = b70.g.P0(collection).iterator();
        if (it.hasNext()) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x009b A[Catch: all -> 0x0046, TryCatch #1 {all -> 0x0046, blocks: (B:21:0x0042, B:40:0x007e, B:42:0x009b, B:44:0x00a3, B:43:0x00a0), top: B:60:0x0042 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00a0 A[Catch: all -> 0x0046, TryCatch #1 {all -> 0x0046, blocks: (B:21:0x0042, B:40:0x007e, B:42:0x009b, B:44:0x00a3, B:43:0x00a0), top: B:60:0x0042 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v8, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) throws Throwable {
        be2 be2Var;
        pe2 pe2Var;
        d dVar;
        Object obj;
        pe2 pe2Var2;
        c80.a aVar;
        String packageName;
        int i5;
        long longVersionCode;
        pe2 pe2Var3;
        Object obj2;
        if (continuationImpl instanceof be2) {
            be2Var = (be2) continuationImpl;
            int i11 = be2Var.f1389e;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                be2Var.f1389e = i11 - Integer.MIN_VALUE;
            } else {
                be2Var = new be2(this, continuationImpl);
            }
        }
        Object obj3 = be2Var.f1387c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = be2Var.f1389e;
        try {
            if (i12 == 0) {
                ResultKt.b(obj3);
                if (this.f8241k) {
                    return Unit.f71706a;
                }
                d dVar2 = this.f8240j;
                be2Var.f1385a = this;
                be2Var.f1386b = dVar2;
                be2Var.f1389e = 1;
                if (dVar2.e(be2Var) != coroutineSingletons) {
                    pe2Var = this;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (i12 != 1) {
                if (i12 != 2) {
                    if (i12 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    obj = be2Var.f1386b;
                    pe2Var3 = be2Var.f1385a;
                    try {
                        ResultKt.b(obj3);
                        pe2Var3.f8241k = true;
                        Unit unit = Unit.f71706a;
                        ((d) obj).g(null);
                        return unit;
                    } catch (Throwable th2) {
                        th = th2;
                        obj2 = obj;
                        ((d) obj2).g(null);
                        throw th;
                    }
                }
                aVar = be2Var.f1386b;
                pe2Var2 = be2Var.f1385a;
                try {
                    ResultKt.b(obj3);
                    aVar = aVar;
                    be2Var.f1385a = pe2Var2;
                    be2Var.f1386b = aVar;
                    be2Var.f1389e = 3;
                    packageName = pe2Var2.f8235e.getPackageName();
                    PackageInfo packageInfo = pe2Var2.f8235e.getPackageManager().getPackageInfo(packageName, 0);
                    i5 = Build.VERSION.SDK_INT;
                    longVersionCode = i5 < 28 ? packageInfo.getLongVersionCode() : packageInfo.versionCode;
                    Intrinsics.d(packageName);
                    String MODEL = Build.MODEL;
                    Intrinsics.f(MODEL, "MODEL");
                    if (pe2Var2.a(new wk0(packageName, longVersionCode, i5), be2Var) != coroutineSingletons) {
                        obj = aVar;
                        pe2Var3 = pe2Var2;
                        pe2Var3.f8241k = true;
                        Unit unit2 = Unit.f71706a;
                        ((d) obj).g(null);
                        return unit2;
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    obj = aVar;
                    obj2 = obj;
                    ((d) obj2).g(null);
                    throw th;
                }
            }
            ?? r22 = be2Var.f1386b;
            pe2Var = be2Var.f1385a;
            ResultKt.b(obj3);
            dVar = r22;
            if (pe2Var.f8241k) {
                obj = dVar;
                Unit unit22 = Unit.f71706a;
                ((d) obj).g(null);
                return unit22;
            }
            be2Var.f1385a = pe2Var;
            be2Var.f1386b = dVar;
            be2Var.f1389e = 2;
            if (b(pe2Var, be2Var) != coroutineSingletons) {
                pe2Var2 = pe2Var;
                aVar = dVar;
                be2Var.f1385a = pe2Var2;
                be2Var.f1386b = aVar;
                be2Var.f1389e = 3;
                packageName = pe2Var2.f8235e.getPackageName();
                PackageInfo packageInfo2 = pe2Var2.f8235e.getPackageManager().getPackageInfo(packageName, 0);
                i5 = Build.VERSION.SDK_INT;
                if (i5 < 28) {
                }
                Intrinsics.d(packageName);
                String MODEL2 = Build.MODEL;
                Intrinsics.f(MODEL2, "MODEL");
                if (pe2Var2.a(new wk0(packageName, longVersionCode, i5), be2Var) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            th = th4;
            obj2 = dVar;
            ((d) obj2).g(null);
            throw th;
        }
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0276 A[Catch: all -> 0x0250, TRY_LEAVE, TryCatch #0 {all -> 0x0250, blocks: (B:85:0x023d, B:87:0x0244, B:89:0x0248, B:91:0x024c, B:94:0x0253, B:96:0x0257, B:98:0x025b, B:100:0x025f, B:101:0x0260, B:102:0x0265, B:103:0x0266, B:104:0x026d, B:105:0x026e, B:106:0x0275, B:107:0x0276), top: B:165:0x023d }] */
    /* JADX WARN: Removed duplicated region for block: B:112:0x027d  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x02f7  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x031d A[Catch: all -> 0x004f, LOOP:0: B:128:0x0317->B:130:0x031d, LOOP_END, TryCatch #9 {all -> 0x004f, blocks: (B:15:0x004a, B:127:0x030d, B:128:0x0317, B:130:0x031d, B:131:0x0327), top: B:183:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:140:0x033a A[Catch: all -> 0x0346, TryCatch #5 {all -> 0x0346, blocks: (B:138:0x0333, B:140:0x033a, B:142:0x033e, B:144:0x0342, B:147:0x0349, B:149:0x034d, B:151:0x0351, B:153:0x0355, B:154:0x0356, B:155:0x035b, B:156:0x035c, B:157:0x0363, B:158:0x0364, B:159:0x036b, B:160:0x036c), top: B:175:0x0333 }] */
    /* JADX WARN: Removed duplicated region for block: B:160:0x036c A[Catch: all -> 0x0346, TRY_LEAVE, TryCatch #5 {all -> 0x0346, blocks: (B:138:0x0333, B:140:0x033a, B:142:0x033e, B:144:0x0342, B:147:0x0349, B:149:0x034d, B:151:0x0351, B:153:0x0355, B:154:0x0356, B:155:0x035b, B:156:0x035c, B:157:0x0363, B:158:0x0364, B:159:0x036b, B:160:0x036c), top: B:175:0x0333 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0228 A[Catch: all -> 0x0081, LOOP:1: B:77:0x0222->B:79:0x0228, LOOP_END, TryCatch #3 {all -> 0x0081, blocks: (B:27:0x007c, B:76:0x0218, B:77:0x0222, B:79:0x0228, B:80:0x0232), top: B:171:0x007c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0244 A[Catch: all -> 0x0250, TryCatch #0 {all -> 0x0250, blocks: (B:85:0x023d, B:87:0x0244, B:89:0x0248, B:91:0x024c, B:94:0x0253, B:96:0x0257, B:98:0x025b, B:100:0x025f, B:101:0x0260, B:102:0x0265, B:103:0x0266, B:104:0x026d, B:105:0x026e, B:106:0x0275, B:107:0x0276), top: B:165:0x023d }] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v10, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v11, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v14, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v18, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v20 */
    /* JADX WARN: Type inference failed for: r2v21, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v22, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v25, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v26 */
    /* JADX WARN: Type inference failed for: r2v27 */
    /* JADX WARN: Type inference failed for: r2v28, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v30 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v8, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r5v30 */
    /* JADX WARN: Type inference failed for: r5v33 */
    /* JADX WARN: Type inference failed for: r5v34, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v36, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r6v10, types: [ads_mobile_sdk.j1] */
    /* JADX WARN: Type inference failed for: r6v13, types: [ads_mobile_sdk.j1] */
    /* JADX WARN: Type inference failed for: r7v8, types: [kotlin.jvm.functions.Function1, l1.a3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(pe2 pe2Var, qc2 qc2Var, boolean z11, ContinuationImpl continuationImpl) {
        vd2 vd2Var;
        int i5;
        Object obj;
        qc2 value;
        Iterator it;
        th3 th3VarA;
        ?? r22;
        th3 th3Var;
        th3 th3Var2;
        em2 em2VarA;
        ?? r23;
        em2 em2Var;
        ?? r52;
        Object objA;
        Closeable closeable;
        ?? r24;
        pe2 pe2Var2;
        em2 em2Var2;
        Iterator it2;
        Object objA2;
        Closeable closeable2;
        th3 th3Var3;
        pe2 pe2Var3;
        th3 th3Var4;
        Iterator it3;
        pe2 pe2Var4 = pe2Var;
        jn jnVar = jn.a$18;
        if (continuationImpl instanceof vd2) {
            vd2Var = (vd2) continuationImpl;
            int i11 = vd2Var.f10744g;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                vd2Var.f10744g = i11 - Integer.MIN_VALUE;
            } else {
                vd2Var = new vd2(pe2Var4, continuationImpl);
            }
        }
        Object objA3 = vd2Var.f10742e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (vd2Var.f10744g) {
            case 0:
                ResultKt.b(objA3);
                mc2 mc2Var = (mc2) pe2Var4.f8239i.get();
                Iterator it4 = mc2Var.f7105g.values().iterator();
                while (it4.hasNext()) {
                    ((sk) it4.next()).f9593h.c(null);
                }
                mc2Var.f7105g.clear();
                i5 = (z11 && ((iz) ((pn) pe2Var4.f8236f).f8335k.get()).p().p().contains(yw.API_PERSISTENT_CACHE)) ? 1 : 0;
                w70.m data = ((t5.g) pe2Var4.f8231a.f5080a.get()).getData();
                vd2Var.f10738a = pe2Var4;
                vd2Var.f10739b = qc2Var;
                vd2Var.f10741d = i5;
                vd2Var.f10744g = 1;
                Object objO = u1.o(data, vd2Var);
                if (objO != coroutineSingletons) {
                    obj = objO;
                    value = qc2Var;
                    pe2Var4.getClass();
                    it = ((g1) obj).u().values().iterator();
                    int i12 = 0;
                    while (it.hasNext()) {
                        Iterator it5 = ((vr0) it.next()).o().values().iterator();
                        int iQ = 0;
                        while (it5.hasNext()) {
                            iQ += ((g6) it5.next()).q();
                        }
                        i12 += iQ;
                    }
                    kz2 kz2Var = pe2Var4.f8237g;
                    wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_CLEAR;
                    EmptyList emptyList = EmptyList.f71733a;
                    mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                    if (ji3.b().f4777a != null) {
                        em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                        try {
                            cc2 cc2VarE = ji3.a().e();
                            n7 n7VarO = rc2.o();
                            Intrinsics.f(n7VarO, "newBuilder(...)");
                            Intrinsics.g(value, "value");
                            n7VarO.b();
                            rc2 rc2Var = (rc2) n7VarO.f1095b;
                            rc2Var.getClass();
                            rc2Var.clearReason_ = value.getNumber();
                            rc2Var.bitField0_ |= 1;
                            n7VarO.b();
                            rc2 rc2Var2 = (rc2) n7VarO.f1095b;
                            rc2Var2.bitField0_ |= 2;
                            rc2Var2.numAdsCleared_ = i12;
                            cc2VarE.N = (rc2) n7VarO.a();
                            if (i5 != 0) {
                                vd2Var.f10738a = pe2Var4;
                                vd2Var.f10739b = em2VarA;
                                vd2Var.f10740c = em2VarA;
                                vd2Var.f10744g = 2;
                                objA3 = pe2Var4.a(vd2Var);
                                em2VarA = em2VarA;
                                if (objA3 != coroutineSingletons) {
                                    r23 = em2VarA;
                                    r52 = r23;
                                    ?? r62 = pe2Var4.f8231a;
                                    l1.a3 a3Var = new l1.a3((String) objA3, 1);
                                    vd2Var.f10738a = pe2Var4;
                                    vd2Var.f10739b = r52;
                                    vd2Var.f10740c = r23;
                                    vd2Var.f10744g = 3;
                                    objA = r62.a(a3Var, vd2Var);
                                    em2VarA = r62;
                                    if (objA != coroutineSingletons) {
                                        em2Var = r52;
                                        it2 = pe2Var4.f8232b.a().iterator();
                                        while (it2.hasNext()) {
                                            ((File) it2.next()).delete();
                                        }
                                        Unit unit = Unit.f71706a;
                                        CloseableKt.a(r23, null);
                                        return Unit.f71706a;
                                    }
                                }
                            } else {
                                j1 j1Var = pe2Var4.f8231a;
                                vd2Var.f10738a = pe2Var4;
                                vd2Var.f10739b = em2VarA;
                                vd2Var.f10740c = em2VarA;
                                vd2Var.f10744g = 4;
                                em2VarA = em2VarA;
                                if (j1Var.a(jnVar, vd2Var) != coroutineSingletons) {
                                    r23 = em2VarA;
                                    em2Var = r23;
                                    it2 = pe2Var4.f8232b.a().iterator();
                                    while (it2.hasNext()) {
                                    }
                                    Unit unit2 = Unit.f71706a;
                                    CloseableKt.a(r23, null);
                                    return Unit.f71706a;
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            r23 = em2VarA;
                            em2Var2 = em2VarA;
                            try {
                                em2Var2.b(th);
                                if (!(th instanceof b.a4)) {
                                }
                            } finally {
                            }
                        }
                    } else {
                        th3VarA = ji3.a(wv0Var, emptyList, true);
                        try {
                            cc2 cc2VarE2 = ji3.a().e();
                            n7 n7VarO2 = rc2.o();
                            Intrinsics.f(n7VarO2, "newBuilder(...)");
                            Intrinsics.g(value, "value");
                            n7VarO2.b();
                            rc2 rc2Var3 = (rc2) n7VarO2.f1095b;
                            rc2Var3.getClass();
                            rc2Var3.clearReason_ = value.getNumber();
                            rc2Var3.bitField0_ |= 1;
                            n7VarO2.b();
                            rc2 rc2Var4 = (rc2) n7VarO2.f1095b;
                            rc2Var4.bitField0_ |= 2;
                            rc2Var4.numAdsCleared_ = i12;
                            cc2VarE2.N = (rc2) n7VarO2.a();
                            if (i5 != 0) {
                                vd2Var.f10738a = pe2Var4;
                                vd2Var.f10739b = th3VarA;
                                vd2Var.f10740c = th3VarA;
                                vd2Var.f10744g = 5;
                                objA3 = pe2Var4.a(vd2Var);
                                th3VarA = th3VarA;
                                if (objA3 != coroutineSingletons) {
                                    r22 = th3VarA;
                                    th3Var2 = r22;
                                    ?? r63 = pe2Var4.f8231a;
                                    ?? a3Var2 = new l1.a3((String) objA3, 1);
                                    vd2Var.f10738a = pe2Var4;
                                    vd2Var.f10739b = th3Var2;
                                    vd2Var.f10740c = r22;
                                    vd2Var.f10744g = 6;
                                    objA2 = r63.a(a3Var2, vd2Var);
                                    th3VarA = a3Var2;
                                    if (objA2 != coroutineSingletons) {
                                        th3Var = th3Var2;
                                        it3 = pe2Var4.f8232b.a().iterator();
                                        while (it3.hasNext()) {
                                            ((File) it3.next()).delete();
                                        }
                                        Unit unit3 = Unit.f71706a;
                                        CloseableKt.a(r22, null);
                                        return Unit.f71706a;
                                    }
                                }
                            } else {
                                j1 j1Var2 = pe2Var4.f8231a;
                                vd2Var.f10738a = pe2Var4;
                                vd2Var.f10739b = th3VarA;
                                vd2Var.f10740c = th3VarA;
                                vd2Var.f10744g = 7;
                                th3VarA = th3VarA;
                                if (j1Var2.a(jnVar, vd2Var) != coroutineSingletons) {
                                    r22 = th3VarA;
                                    th3Var = r22;
                                    it3 = pe2Var4.f8232b.a().iterator();
                                    while (it3.hasNext()) {
                                    }
                                    Unit unit32 = Unit.f71706a;
                                    CloseableKt.a(r22, null);
                                    return Unit.f71706a;
                                }
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            r22 = th3VarA;
                            th3Var4 = th3VarA;
                            try {
                                th3Var4.b(th);
                                if (!(th instanceof b.a4)) {
                                }
                            } catch (Throwable th4) {
                                try {
                                    throw th4;
                                } finally {
                                }
                            }
                        }
                    }
                }
                return coroutineSingletons;
            case 1:
                int i13 = vd2Var.f10741d;
                value = (qc2) vd2Var.f10739b;
                pe2 pe2Var5 = vd2Var.f10738a;
                ResultKt.b(objA3);
                i5 = i13;
                pe2Var4 = pe2Var5;
                obj = objA3;
                pe2Var4.getClass();
                it = ((g1) obj).u().values().iterator();
                int i122 = 0;
                while (it.hasNext()) {
                }
                kz2 kz2Var2 = pe2Var4.f8237g;
                wv0 wv0Var2 = wv0.CUI_NAME_PERSISTENT_CACHE_CLEAR;
                EmptyList emptyList2 = EmptyList.f71733a;
                mi3 mi3Var2 = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a != null) {
                }
                break;
            case 2:
                r23 = vd2Var.f10740c;
                r52 = (th3) vd2Var.f10739b;
                pe2Var4 = vd2Var.f10738a;
                try {
                    ResultKt.b(objA3);
                    ?? r622 = pe2Var4.f8231a;
                    l1.a3 a3Var3 = new l1.a3((String) objA3, 1);
                    vd2Var.f10738a = pe2Var4;
                    vd2Var.f10739b = r52;
                    vd2Var.f10740c = r23;
                    vd2Var.f10744g = 3;
                    objA = r622.a(a3Var3, vd2Var);
                    em2VarA = r622;
                    if (objA != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                } catch (Throwable th5) {
                    th = th5;
                    em2Var = r52;
                    em2Var2 = em2Var;
                    em2Var2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
                break;
            case 3:
                closeable = vd2Var.f10740c;
                r24 = (th3) vd2Var.f10739b;
                pe2Var2 = vd2Var.f10738a;
                em2 em2Var3 = r24;
                r23 = closeable;
                pe2Var4 = pe2Var2;
                em2Var = em2Var3;
                try {
                    ResultKt.b(objA3);
                    it2 = pe2Var4.f8232b.a().iterator();
                    while (it2.hasNext()) {
                    }
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(r23, null);
                    return Unit.f71706a;
                } catch (Throwable th6) {
                    th = th6;
                    em2Var2 = em2Var;
                    em2Var2.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            em2Var2.a(th);
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
            case 4:
                closeable = vd2Var.f10740c;
                r24 = (th3) vd2Var.f10739b;
                pe2Var2 = vd2Var.f10738a;
                em2 em2Var32 = r24;
                r23 = closeable;
                pe2Var4 = pe2Var2;
                em2Var = em2Var32;
                ResultKt.b(objA3);
                it2 = pe2Var4.f8232b.a().iterator();
                while (it2.hasNext()) {
                }
                Unit unit222 = Unit.f71706a;
                CloseableKt.a(r23, null);
                return Unit.f71706a;
            case 5:
                r22 = vd2Var.f10740c;
                th3Var2 = (th3) vd2Var.f10739b;
                pe2Var4 = vd2Var.f10738a;
                try {
                    ResultKt.b(objA3);
                    ?? r632 = pe2Var4.f8231a;
                    ?? a3Var22 = new l1.a3((String) objA3, 1);
                    vd2Var.f10738a = pe2Var4;
                    vd2Var.f10739b = th3Var2;
                    vd2Var.f10740c = r22;
                    vd2Var.f10744g = 6;
                    objA2 = r632.a(a3Var22, vd2Var);
                    th3VarA = a3Var22;
                    if (objA2 != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                } catch (Throwable th7) {
                    th = th7;
                    th3Var = th3Var2;
                    th3Var4 = th3Var;
                    th3Var4.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var4.a(th);
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
            case 6:
                closeable2 = vd2Var.f10740c;
                th3Var3 = (th3) vd2Var.f10739b;
                pe2Var3 = vd2Var.f10738a;
                th3 th3Var5 = th3Var3;
                r22 = closeable2;
                pe2Var4 = pe2Var3;
                th3Var = th3Var5;
                try {
                    ResultKt.b(objA3);
                    it3 = pe2Var4.f8232b.a().iterator();
                    while (it3.hasNext()) {
                    }
                    Unit unit322 = Unit.f71706a;
                    CloseableKt.a(r22, null);
                    return Unit.f71706a;
                } catch (Throwable th8) {
                    th = th8;
                    th3Var4 = th3Var;
                    th3Var4.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
                break;
            case 7:
                closeable2 = vd2Var.f10740c;
                th3Var3 = (th3) vd2Var.f10739b;
                pe2Var3 = vd2Var.f10738a;
                th3 th3Var52 = th3Var3;
                r22 = closeable2;
                pe2Var4 = pe2Var3;
                th3Var = th3Var52;
                ResultKt.b(objA3);
                it3 = pe2Var4.f8232b.a().iterator();
                while (it3.hasNext()) {
                }
                Unit unit3222 = Unit.f71706a;
                CloseableKt.a(r22, null);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0046 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(ni.k kVar, qw2 requestType) {
        int iOrdinal;
        boolean z11;
        Intrinsics.g(requestType, "requestType");
        t4 t4Var = this.f8233c;
        t4Var.getClass();
        if (((Boolean) t4Var.a("gads:pc:enabled", Boolean.TRUE, jn.a$10)).booleanValue() && (iOrdinal = requestType.ordinal()) != 1) {
            if (iOrdinal == 3) {
                if ((kVar instanceof f ? (f) kVar : null) != null) {
                    z11 = false;
                    if (!z11) {
                    }
                }
            } else if (iOrdinal == 5) {
                o oVar = kVar instanceof o ? (o) kVar : null;
                if (oVar != null) {
                    z11 = oVar.f91305v;
                    if (!z11) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0248 A[Catch: all -> 0x028f, TRY_ENTER, TRY_LEAVE, TryCatch #10 {all -> 0x028f, blocks: (B:84:0x01ed, B:86:0x01f1, B:88:0x01f9, B:90:0x0210, B:91:0x0222, B:95:0x0235, B:100:0x0248, B:48:0x00fd), top: B:168:0x01ed }] */
    /* JADX WARN: Removed duplicated region for block: B:124:0x029a A[Catch: all -> 0x02a6, TryCatch #4 {all -> 0x02a6, blocks: (B:122:0x0293, B:124:0x029a, B:126:0x029e, B:128:0x02a2, B:131:0x02a9, B:133:0x02ad, B:135:0x02b1, B:137:0x02b5, B:138:0x02b6, B:139:0x02bb, B:140:0x02bc, B:141:0x02c3, B:142:0x02c4, B:143:0x02cb, B:144:0x02cc), top: B:158:0x0293, outer: #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:144:0x02cc A[Catch: all -> 0x02a6, TRY_LEAVE, TryCatch #4 {all -> 0x02a6, blocks: (B:122:0x0293, B:124:0x029a, B:126:0x029e, B:128:0x02a2, B:131:0x02a9, B:133:0x02ad, B:135:0x02b1, B:137:0x02b5, B:138:0x02b6, B:139:0x02bb, B:140:0x02bc, B:141:0x02c3, B:142:0x02c4, B:143:0x02cb, B:144:0x02cc), top: B:158:0x0293, outer: #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0144 A[Catch: all -> 0x0251, TryCatch #1 {all -> 0x0251, blocks: (B:52:0x0122, B:56:0x0132, B:58:0x0136, B:59:0x0144, B:63:0x0166, B:76:0x01a0, B:80:0x01ab, B:106:0x0257, B:110:0x0262), top: B:153:0x0122 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01f1 A[Catch: all -> 0x028f, TryCatch #10 {all -> 0x028f, blocks: (B:84:0x01ed, B:86:0x01f1, B:88:0x01f9, B:90:0x0210, B:91:0x0222, B:95:0x0235, B:100:0x0248, B:48:0x00fd), top: B:168:0x01ed }] */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v16, types: [int] */
    /* JADX WARN: Type inference failed for: r0v21 */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v18, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v2, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:83:0x01e1 -> B:24:0x007d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(qw2 qw2Var, String str, ContinuationImpl continuationImpl) throws Throwable {
        ce2 ce2Var;
        qw2 qw2Var2;
        String str2;
        pe2 pe2Var;
        boolean z11;
        ?? A;
        th3 th3Var;
        int i5;
        pe2 pe2Var2;
        th3 th3Var2;
        se2 se2Var;
        Closeable closeable;
        int i11;
        String str3;
        qw2 qw2Var3;
        ce2 ce2Var2;
        th3 th3Var3;
        Object obj;
        b6 b6Var;
        ue2 ue2Var;
        long jCurrentTimeMillis;
        int i12;
        long jP;
        int i13;
        ue2 ue2Var2;
        Closeable closeable2;
        pe2 pe2Var3;
        qw2 qw2Var4;
        int i14;
        long j11;
        xu0 xu0Var;
        Throwable th2;
        Closeable closeable3;
        Serializable serializableA;
        ue2 ue2Var3;
        if (continuationImpl instanceof ce2) {
            ce2Var = (ce2) continuationImpl;
            int i15 = ce2Var.n;
            if ((i15 & Integer.MIN_VALUE) != 0) {
                ce2Var.n = i15 - Integer.MIN_VALUE;
            } else {
                ce2Var = new ce2(this, continuationImpl);
            }
        }
        Object obj2 = ce2Var.f1838l;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i16 = ce2Var.n;
        try {
            try {
                if (i16 == 0) {
                    ResultKt.b(obj2);
                    ce2Var.f1827a = this;
                    qw2Var2 = qw2Var;
                    ce2Var.f1828b = qw2Var2;
                    str2 = str;
                    ce2Var.f1829c = str2;
                    ce2Var.n = 1;
                    if (b(ce2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    pe2Var = this;
                } else if (i16 == 1) {
                    String str4 = (String) ce2Var.f1829c;
                    qw2 qw2Var5 = (qw2) ce2Var.f1828b;
                    pe2Var = (pe2) ce2Var.f1827a;
                    ResultKt.b(obj2);
                    str2 = str4;
                    qw2Var2 = qw2Var5;
                } else if (i16 == 2) {
                    int i17 = ce2Var.f1835i;
                    se2 se2Var2 = (se2) ce2Var.f1832f;
                    closeable = ce2Var.f1831e;
                    th3 th3Var4 = ce2Var.f1830d;
                    str3 = (String) ce2Var.f1829c;
                    qw2 qw2Var6 = (qw2) ce2Var.f1828b;
                    pe2Var2 = (pe2) ce2Var.f1827a;
                    try {
                        ResultKt.b(obj2);
                        i11 = i17;
                        se2Var = se2Var2;
                        obj = obj2;
                        ce2Var2 = ce2Var;
                        th3Var3 = th3Var4;
                        qw2Var3 = qw2Var6;
                        z11 = true;
                        Pair pair = (Pair) obj;
                        b6Var = (b6) pair.f71683a;
                        se2 se2Var3 = (se2) pair.f71684b;
                        if (b6Var != null) {
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        th3Var = th3Var4;
                        A = closeable;
                        th3Var.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                } else if (i16 == 3) {
                    long j12 = ce2Var.f1837k;
                    int i18 = ce2Var.f1836j;
                    int i19 = ce2Var.f1835i;
                    Ref.ObjectRef objectRef = ce2Var.f1834h;
                    ue2 ue2Var4 = ce2Var.f1833g;
                    b6 b6Var2 = (b6) ce2Var.f1832f;
                    A = ce2Var.f1831e;
                    th3Var = ce2Var.f1830d;
                    String str5 = (String) ce2Var.f1829c;
                    qw2 qw2Var7 = (qw2) ce2Var.f1828b;
                    pe2 pe2Var4 = (pe2) ce2Var.f1827a;
                    try {
                        ResultKt.b(obj2);
                        i14 = i18;
                        qw2Var4 = qw2Var7;
                        str2 = str5;
                        j11 = j12;
                        pe2Var2 = pe2Var4;
                        b6Var = b6Var2;
                        th3Var2 = th3Var;
                        i5 = i19;
                        A = A;
                        ue2Var3 = ue2Var4;
                    } catch (Throwable th4) {
                        th = th4;
                        th3Var.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                    try {
                        if (objectRef.f71863a == null) {
                            if (pe2Var2.f8233c.j()) {
                                t4 t4Var = pe2Var2.f8233c;
                                t4Var.getClass();
                                if (!((Boolean) t4Var.a("gads:pc:enable_auto_refresh_on_claimed_ad", Boolean.TRUE, jn.a$10)).booleanValue()) {
                                    mc2 mc2Var = (mc2) pe2Var2.f8239i.get();
                                    String strQ = b6Var.q();
                                    Intrinsics.f(strQ, "getFilename(...)");
                                    mc2Var.a(strQ);
                                }
                            }
                            th2 = null;
                            xu0Var = new xu0(new tq(new bm1((String) objectRef.f71863a, ue2Var3, i14 != 0, j11), null));
                            closeable = A;
                            CloseableKt.a(closeable, th2);
                            return xu0Var;
                        }
                        se2Var = se2.MISS_REASON_CORRUPTED;
                        qw2Var2 = qw2Var4;
                        z11 = true;
                        closeable3 = A;
                        boolean z12 = i5 == 0 ? z11 : false;
                        ce2Var.f1827a = pe2Var2;
                        ce2Var.f1828b = qw2Var2;
                        ce2Var.f1829c = str2;
                        ce2Var.f1830d = th3Var2;
                        ce2Var.f1831e = closeable3;
                        ce2Var.f1832f = se2Var;
                        ce2Var.f1833g = null;
                        ce2Var.f1834h = null;
                        ce2Var.f1835i = i5;
                        ce2Var.n = 2;
                        serializableA = pe2Var2.a(qw2Var2, str2, z12, ce2Var);
                        if (serializableA != coroutineSingletons) {
                            i11 = i5;
                            str3 = str2;
                            ce2Var2 = ce2Var;
                            th3Var3 = th3Var2;
                            closeable = closeable3;
                            qw2Var3 = qw2Var2;
                            obj = serializableA;
                            try {
                                Pair pair2 = (Pair) obj;
                                b6Var = (b6) pair2.f71683a;
                                se2 se2Var32 = (se2) pair2.f71684b;
                                if (b6Var != null) {
                                    if (se2Var == null) {
                                        se2Var = se2Var32 == null ? se2.MISS_REASON_EMPTY : se2Var32;
                                    }
                                    xu0Var = new xu0(new tq(null, se2Var));
                                    th2 = null;
                                    CloseableKt.a(closeable, th2);
                                    return xu0Var;
                                }
                                try {
                                    try {
                                        String strQ2 = b6Var.q();
                                        Intrinsics.f(strQ2, "getFilename(...)");
                                        ue2Var = new ue2(strQ2, qw2Var3, str3);
                                        pe2Var2.f8234d.getClass();
                                        jCurrentTimeMillis = System.currentTimeMillis();
                                        ?? r02 = b6Var.p() < t2.f15989f ? z11 : 0;
                                        c6 c6Var = pe2Var2.f8232b;
                                        String strQ3 = b6Var.q();
                                        Intrinsics.f(strQ3, "getFilename(...)");
                                        b.a1 a1VarA = c6Var.a(strQ3, b6Var.o());
                                        xu0 xu0Var2 = a1VarA instanceof xu0 ? (xu0) a1VarA : null;
                                        objectRef.f71863a = xu0Var2 != null ? (String) xu0Var2.f11834b : null;
                                        t70.c2 c2Var = t70.c2.f88780b;
                                        de2 de2Var = new de2(i12 != 0, objectRef, pe2Var3, ue2Var, null);
                                        pe2Var2 = pe2Var3;
                                        ue2Var4 = ue2Var;
                                        ce2Var2.f1827a = pe2Var2;
                                        ce2Var2.f1828b = qw2Var3;
                                        ce2Var2.f1829c = str3;
                                        ce2Var2.f1830d = th3Var3;
                                        ce2Var2.f1831e = closeable;
                                        ce2Var2.f1832f = b6Var;
                                        ce2Var2.f1833g = ue2Var4;
                                        ce2Var2.f1834h = objectRef;
                                        qw2Var4 = qw2Var3;
                                        ce2Var2.f1835i = i12;
                                        ce2Var2.f1836j = r02;
                                        ce2Var2.f1837k = jP;
                                        i14 = r02;
                                        ce2Var2.n = 3;
                                        if (m0.y(c2Var, de2Var, ce2Var2) != coroutineSingletons) {
                                            Closeable closeable4 = closeable;
                                            th3Var2 = th3Var3;
                                            ce2Var = ce2Var2;
                                            str2 = str3;
                                            i5 = i12;
                                            A = closeable4;
                                            j11 = jP;
                                            ue2Var3 = ue2Var4;
                                            if (objectRef.f71863a == null) {
                                            }
                                        }
                                    } catch (Throwable th5) {
                                        th = th5;
                                        i13 = i12;
                                        ue2Var2 = ue2Var;
                                    }
                                    i12 = i11;
                                    jP = jCurrentTimeMillis - b6Var.p();
                                    objectRef = new Ref.ObjectRef();
                                } catch (Throwable th6) {
                                    th = th6;
                                    i13 = i12;
                                    ue2Var2 = ue2Var;
                                    pe2Var2 = pe2Var3;
                                    t70.c2 c2Var2 = t70.c2.f88780b;
                                    de2 de2Var2 = new de2(i13 != 0, objectRef, pe2Var2, ue2Var2, null);
                                    ce2Var2.f1827a = th3Var3;
                                    ce2Var2.f1828b = closeable;
                                    ce2Var2.f1829c = th;
                                    ce2Var2.f1830d = null;
                                    ce2Var2.f1831e = null;
                                    ce2Var2.f1832f = null;
                                    ce2Var2.n = 4;
                                    if (m0.y(c2Var2, de2Var2, ce2Var2) != coroutineSingletons) {
                                        closeable2 = closeable;
                                        throw th;
                                    }
                                    return coroutineSingletons;
                                }
                                pe2Var3 = pe2Var2;
                            } catch (Throwable th7) {
                                th = th7;
                                th3Var = th3Var3;
                                A = closeable;
                                th3Var.b(th);
                                if (th instanceof b.a4) {
                                }
                            }
                        }
                        return coroutineSingletons;
                    } catch (Throwable th8) {
                        th = th8;
                        th3Var = th3Var2;
                        th3Var.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                } else {
                    if (i16 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    Throwable th9 = (Throwable) ce2Var.f1829c;
                    closeable2 = (Closeable) ce2Var.f1828b;
                    th3Var3 = (th3) ce2Var.f1827a;
                    try {
                        ResultKt.b(obj2);
                        throw th9;
                    } catch (Throwable th10) {
                        th = th10;
                        th3Var = th3Var3;
                        A = closeable2;
                        try {
                            th3Var.b(th);
                            if (th instanceof b.a4) {
                            }
                        } finally {
                        }
                    }
                }
                i5 = !pe2Var.f8233c.j() ? 1 : 0;
                pe2Var2 = pe2Var;
                th3Var2 = A;
                se2Var = null;
                closeable3 = A;
                if (i5 == 0) {
                }
                ce2Var.f1827a = pe2Var2;
                ce2Var.f1828b = qw2Var2;
                ce2Var.f1829c = str2;
                ce2Var.f1830d = th3Var2;
                ce2Var.f1831e = closeable3;
                ce2Var.f1832f = se2Var;
                ce2Var.f1833g = null;
                ce2Var.f1834h = null;
                ce2Var.f1835i = i5;
                ce2Var.n = 2;
                serializableA = pe2Var2.a(qw2Var2, str2, z12, ce2Var);
                if (serializableA != coroutineSingletons) {
                }
                return coroutineSingletons;
            } catch (Throwable th11) {
                th = th11;
                th3Var = A;
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
            }
            wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_LOAD;
            WeakHashMap weakHashMap = ji3.f5253a;
            z11 = true;
            A = ji3.a(wv0Var, EmptyList.f71733a, true);
        } catch (Exception e3) {
            return new qu0(e3, null, null, 6);
        }
    }

    /*  JADX ERROR: Type inference failed
        jadx.core.utils.exceptions.JadxOverflowException: Type inference error: updates count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:77)
        */
    public static java.lang.Object b(ads_mobile_sdk.pe2 r16, ads_mobile_sdk.ue2 r17, kotlin.coroutines.jvm.internal.ContinuationImpl r18) {
        /*
            Method dump skipped, instructions count: 558
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ads_mobile_sdk.pe2.b(ads_mobile_sdk.pe2, ads_mobile_sdk.ue2, kotlin.coroutines.jvm.internal.ContinuationImpl):java.lang.Object");
    }

    public final pc2 a(ni.k adRequest, qw2 requestType) {
        Intrinsics.g(adRequest, "adRequest");
        Intrinsics.g(requestType, "requestType");
        b.i8 i8Var = rw0.f9327f;
        String str = adRequest.f78283i;
        String strR = b.i8.r(str);
        if (strR != null) {
            str = strR;
        }
        if (Intrinsics.b(this.f8242l.get(str), Boolean.FALSE)) {
            return pc2.FILL_DISABLED_REASON_WEB_PROPERTY_DISABLED;
        }
        if (!((iz) ((pn) this.f8236f).f8335k.get()).p().p().contains(yw.API_PERSISTENT_CACHE)) {
            return pc2.FILL_DISABLED_REASON_CONSENT_NOT_ALLOWED;
        }
        if (a(requestType) > 0) {
            t4 t4Var = this.f8233c;
            t4Var.getClass();
            jn jnVar = jn.a$15;
            if (((Number) t4Var.a("gads:pc:max_total_cached_ads", 10, jnVar)).intValue() > 0 && ((Number) t4Var.a("gads:pc:cache_fill_count_per_request", 2, jnVar)).intValue() > 0) {
                return null;
            }
        }
        return pc2.FILL_DISABLED_REASON_NO_CAPACITY;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) throws NoSuchAlgorithmException, IOException {
        zd2 zd2Var;
        pe2 pe2Var;
        pe2 pe2Var2;
        if (continuationImpl instanceof zd2) {
            zd2Var = (zd2) continuationImpl;
            int i5 = zd2Var.f12524d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zd2Var.f12524d = i5 - Integer.MIN_VALUE;
            } else {
                zd2Var = new zd2(this, continuationImpl);
            }
        }
        Object objD = zd2Var.f12522b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zd2Var.f12524d;
        if (i11 == 0) {
            ResultKt.b(objD);
            s1 s1Var = ((fz) ((h6) this.f8238h.get())).B;
            zd2Var.f12521a = this;
            zd2Var.f12524d = 1;
            if (s1Var.K(zd2Var) != coroutineSingletons) {
                pe2Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            pe2Var2 = zd2Var.f12521a;
            ResultKt.b(objD);
            com.google.gson.r json = (com.google.gson.r) objD;
            pe2Var2.getClass();
            Intrinsics.g(json, "json");
            String strF1 = b70.g.f1(b70.g.D1(new c0(2), json.f34795a.entrySet()), ",", null, null, 0, u.a$10, 30);
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = strF1.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            byte[] bArrDigest = messageDigest.digest(bytes);
            Intrinsics.d(bArrDigest);
            return kotlin.collections.c.M0(bArrDigest, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, u.a$9, 30);
        }
        pe2Var = zd2Var.f12521a;
        ResultKt.b(objD);
        h6 h6Var = (h6) pe2Var.f8238h.get();
        zd2Var.f12521a = pe2Var;
        zd2Var.f12524d = 2;
        fz fzVar = (fz) h6Var;
        fzVar.getClass();
        objD = fz.d(fzVar, zd2Var);
        if (objD != coroutineSingletons) {
            pe2Var2 = pe2Var;
            com.google.gson.r json2 = (com.google.gson.r) objD;
            pe2Var2.getClass();
            Intrinsics.g(json2, "json");
            String strF12 = b70.g.f1(b70.g.D1(new c0(2), json2.f34795a.entrySet()), ",", null, null, 0, u.a$10, 30);
            MessageDigest messageDigest2 = MessageDigest.getInstance("SHA-256");
            byte[] bytes2 = strF12.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes2, "getBytes(...)");
            byte[] bArrDigest2 = messageDigest2.digest(bytes2);
            Intrinsics.d(bArrDigest2);
            return kotlin.collections.c.M0(bArrDigest2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, u.a$9, 30);
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00c4, code lost:
    
        if (a(r0, ads_mobile_sdk.qc2.CLEAR_REASON_CONSENT_DENIED, false, (kotlin.coroutines.jvm.internal.ContinuationImpl) r3) == r4) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x019e, code lost:
    
        if (a(r15, r0, false, (kotlin.coroutines.jvm.internal.ContinuationImpl) r3) == r4) goto L71;
     */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(pe2 pe2Var, ContinuationImpl continuationImpl) throws PackageManager.NameNotFoundException, NoSuchAlgorithmException, IOException {
        oe2 oe2Var;
        long longVersionCode;
        String strT;
        String strR;
        pe2 pe2Var2;
        int i5;
        wk0 wk0Var;
        int i11;
        String str;
        long j11;
        boolean zB;
        qc2 qc2Var;
        pe2 pe2Var3 = pe2Var;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof oe2) {
            oe2Var = (oe2) continuationImpl;
            int i12 = oe2Var.f7881k;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                oe2Var.f7881k = i12 - Integer.MIN_VALUE;
            } else {
                oe2Var = new oe2(pe2Var3, continuationImpl);
            }
        }
        Object objO = oe2Var.f7879i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = oe2Var.f7881k;
        if (i13 == 0) {
            ResultKt.b(objO);
            w70.m data = ((t5.g) pe2Var3.f8231a.f5080a.get()).getData();
            oe2Var.f7871a = pe2Var3;
            oe2Var.f7881k = 1;
            objO = u1.o(data, oe2Var);
            if (objO != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i13 == 1) {
            pe2Var3 = oe2Var.f7871a;
            ResultKt.b(objO);
        } else {
            if (i13 == 2) {
                ResultKt.b(objO);
                return Unit.f71706a;
            }
            if (i13 != 3) {
                if (i13 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objO);
                return Unit.f71706a;
            }
            i5 = oe2Var.f7877g;
            j11 = oe2Var.f7878h;
            i11 = oe2Var.f7876f;
            str = oe2Var.f7875e;
            strR = oe2Var.f7874d;
            strT = oe2Var.f7873c;
            wk0Var = oe2Var.f7872b;
            pe2Var2 = oe2Var.f7871a;
            ResultKt.b(objO);
            zB = Intrinsics.b(str, objO);
            if (!zB) {
                t4 t4Var = pe2Var2.f8233c;
                t4Var.getClass();
                ((Boolean) t4Var.a("gads:pc:enable_consent_hash_validation", Boolean.TRUE, jnVar)).getClass();
            }
            if (Intrinsics.b(strT, wk0Var.f11313a)) {
                qc2Var = qc2.CLEAR_REASON_PACKAGE_NAME_CHANGE;
            } else {
                String str2 = strR;
                if (j11 != wk0Var.f11314b) {
                    qc2Var = qc2.CLEAR_REASON_VERSION_CODE_CHANGE;
                } else if (!Intrinsics.b(str2, Build.MODEL)) {
                    qc2Var = qc2.CLEAR_REASON_DEVICE_MODEL_CHANGE;
                } else if (i5 != wk0Var.f11315d) {
                    qc2Var = qc2.CLEAR_REASON_API_VERSION_CHANGE;
                } else {
                    t4 t4Var2 = pe2Var2.f8233c;
                    t4Var2.getClass();
                    qc2Var = (!((Boolean) t4Var2.a("gads:pc:enable_consent_hash_validation", Boolean.TRUE, jnVar)).booleanValue() || zB) ? null : qc2.CLEAR_REASON_CONSENT_HASH_CHANGED;
                }
            }
            if (qc2Var == null && i11 == 0) {
                oe2Var.f7871a = null;
                oe2Var.f7872b = null;
                oe2Var.f7873c = null;
                oe2Var.f7874d = null;
                oe2Var.f7875e = null;
                oe2Var.f7881k = 4;
                pe2Var2.getClass();
            } else {
                return Unit.f71706a;
            }
        }
        g1 g1Var = (g1) objO;
        int i14 = (Intrinsics.b(g1Var, g1.q()) && pe2Var3.f8232b.a().isEmpty()) ? 1 : 0;
        if (i14 != 0) {
            return Unit.f71706a;
        }
        x0 x0Var = pe2Var3.f8236f;
        Context context = pe2Var3.f8235e;
        if (!((iz) ((pn) x0Var).f8335k.get()).p().p().contains(yw.API_PERSISTENT_CACHE)) {
            oe2Var.f7871a = null;
            oe2Var.f7881k = 2;
        } else {
            String packageName = context.getPackageName();
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
            int i15 = Build.VERSION.SDK_INT;
            if (i15 >= 28) {
                longVersionCode = packageInfo.getLongVersionCode();
            } else {
                longVersionCode = packageInfo.versionCode;
            }
            Intrinsics.d(packageName);
            String MODEL = Build.MODEL;
            Intrinsics.f(MODEL, "MODEL");
            wk0 wk0Var2 = new wk0(packageName, longVersionCode, i15);
            strT = g1Var.t();
            long jV = g1Var.v();
            strR = g1Var.r();
            int iO = g1Var.o();
            String strP = g1Var.p();
            oe2Var.f7871a = pe2Var3;
            oe2Var.f7872b = wk0Var2;
            oe2Var.f7873c = strT;
            oe2Var.f7874d = strR;
            oe2Var.f7875e = strP;
            oe2Var.f7876f = i14;
            oe2Var.f7878h = jV;
            oe2Var.f7877g = iO;
            oe2Var.f7881k = 3;
            Object objA = pe2Var3.a(oe2Var);
            if (objA != coroutineSingletons) {
                pe2Var2 = pe2Var3;
                i5 = iO;
                wk0Var = wk0Var2;
                i11 = i14;
                str = strP;
                objO = objA;
                j11 = jV;
                zB = Intrinsics.b(str, objO);
                if (!zB) {
                }
                if (Intrinsics.b(strT, wk0Var.f11313a)) {
                }
                if (qc2Var == null) {
                }
                return Unit.f71706a;
            }
        }
        return coroutineSingletons;
    }

    public final int a(qw2 format) {
        jn jnVar = jn.a$15;
        Intrinsics.g(format, "format");
        int iOrdinal = format.ordinal();
        t4 t4Var = this.f8233c;
        switch (iOrdinal) {
            case 1:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_app_open_ads", 2, jnVar)).intValue();
            case 2:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_banner_ads", 0, jnVar)).intValue();
            case 3:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_icon_ads", 2, jnVar)).intValue();
            case 4:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_interstitial_ads", 0, jnVar)).intValue();
            case 5:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_native_ads", 2, jnVar)).intValue();
            case 6:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_rewarded_ads", 0, jnVar)).intValue();
            case 7:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_rewarded_interstitial_ads", 0, jnVar)).intValue();
            case 8:
                t4Var.getClass();
                return ((Number) t4Var.a("gads:pc:max_swipeable_interstitial_ads", 0, jnVar)).intValue();
            default:
                return 0;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(qw2 qw2Var, String str, ContinuationImpl continuationImpl) {
        ae2 ae2Var;
        pe2 pe2Var;
        if (continuationImpl instanceof ae2) {
            ae2Var = (ae2) continuationImpl;
            int i5 = ae2Var.f943f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ae2Var.f943f = i5 - Integer.MIN_VALUE;
            } else {
                ae2Var = new ae2(this, continuationImpl);
            }
        }
        Object objO = ae2Var.f941d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ae2Var.f943f;
        if (i11 == 0) {
            ResultKt.b(objO);
            w70.m data = ((t5.g) this.f8231a.f5080a.get()).getData();
            ae2Var.f938a = this;
            ae2Var.f939b = qw2Var;
            ae2Var.f940c = str;
            ae2Var.f943f = 1;
            objO = u1.o(data, ae2Var);
            if (objO == coroutineSingletons) {
                return coroutineSingletons;
            }
            pe2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = ae2Var.f940c;
            qw2Var = ae2Var.f939b;
            pe2Var = ae2Var.f938a;
            ResultKt.b(objO);
        }
        vr0 vr0Var = (vr0) ((g1) objO).u().get(qw2Var.name());
        int i12 = 0;
        if (vr0Var == null) {
            return new Integer(0);
        }
        g6 g6Var = (g6) vr0Var.o().get(str);
        if (g6Var == null) {
            return new Integer(0);
        }
        pe2Var.f8234d.getClass();
        List<b6> list = (List) pe2Var.a(g6Var, System.currentTimeMillis()).f71683a;
        boolean zJ = pe2Var.f8233c.j();
        z5 z5Var = z5.AVAILABLE;
        if (zJ) {
            if (!(list instanceof Collection) || !list.isEmpty()) {
                for (b6 b6Var : list) {
                    if (b6Var.r() == z5Var || b6Var.r() == z5.READ) {
                        i12++;
                        if (i12 < 0) {
                            ul.b.d0();
                            throw null;
                        }
                    }
                }
            }
        } else if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                if (((b6) it.next()).r() == z5Var && (i12 = i12 + 1) < 0) {
                    ul.b.d0();
                    throw null;
                }
            }
        }
        return new Integer(i12);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:118:0x017b A[Catch: all -> 0x0155, TRY_LEAVE, TryCatch #3 {all -> 0x0155, blocks: (B:96:0x0142, B:98:0x0149, B:100:0x014d, B:102:0x0151, B:105:0x0158, B:107:0x015c, B:109:0x0160, B:111:0x0164, B:112:0x0165, B:113:0x016a, B:114:0x016b, B:115:0x0172, B:116:0x0173, B:117:0x017a, B:118:0x017b), top: B:124:0x0142 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b4 A[Catch: all -> 0x004e, TRY_LEAVE, TryCatch #10 {all -> 0x004e, blocks: (B:22:0x004a, B:35:0x0099, B:44:0x00af, B:46:0x00b4, B:43:0x00a9), top: B:132:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0137 A[Catch: all -> 0x0038, TRY_LEAVE, TryCatch #5 {all -> 0x0038, blocks: (B:13:0x0033, B:81:0x011c, B:90:0x0132, B:92:0x0137, B:89:0x012c), top: B:125:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0149 A[Catch: all -> 0x0155, TryCatch #3 {all -> 0x0155, blocks: (B:96:0x0142, B:98:0x0149, B:100:0x014d, B:102:0x0151, B:105:0x0158, B:107:0x015c, B:109:0x0160, B:111:0x0164, B:112:0x0165, B:113:0x016a, B:114:0x016b, B:115:0x0172, B:116:0x0173, B:117:0x017a, B:118:0x017b), top: B:124:0x0142 }] */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v12, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v25 */
    /* JADX WARN: Type inference failed for: r1v26 */
    /* JADX WARN: Type inference failed for: r2v13, types: [ads_mobile_sdk.em2, ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v23, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r3v29 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(pe2 pe2Var, ue2 ue2Var, ContinuationImpl continuationImpl) {
        ee2 ee2Var;
        ?? A;
        Closeable closeable;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        j1 j1Var;
        x xVar;
        th3 th3Var3;
        ?? r32;
        j1 j1Var2;
        x xVar2;
        Object qu0Var;
        ?? r12 = ue2Var;
        if (continuationImpl instanceof ee2) {
            ee2 ee2Var2 = (ee2) continuationImpl;
            int i5 = ee2Var2.f2853e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ee2Var2.f2853e = i5 - Integer.MIN_VALUE;
                ee2Var = ee2Var2;
            } else {
                ee2Var = new ee2(pe2Var, continuationImpl);
            }
        }
        Object obj = ee2Var.f2851c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ee2Var.f2853e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                kz2 kz2Var = pe2Var.f8237g;
                wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_METADATA_WRITE;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a == null) {
                    A = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        j1Var2 = pe2Var.f8231a;
                        xVar2 = new x(r12, 4);
                        ee2Var.f2849a = A;
                        ee2Var.f2850b = A;
                        ee2Var.f2853e = 1;
                    } catch (Exception e3) {
                        e = e3;
                        th3Var3 = A;
                        r32 = th3Var3;
                        qu0Var = new qu0(e, null, null, 6);
                        r12 = th3Var3;
                        ee2Var = r32;
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(r12, null);
                        return qu0Var;
                    } catch (Throwable th2) {
                        th = th2;
                        closeable = A;
                        try {
                            A.b(th);
                            if (!(th instanceof b.a4)) {
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
                        } finally {
                        }
                    }
                    if (j1Var2.a(xVar2, ee2Var) != coroutineSingletons) {
                        th3 th3Var4 = A;
                        r32 = th3Var4;
                        th3Var3 = th3Var4;
                        qu0Var = new xu0(Unit.f71706a);
                        r12 = th3Var3;
                        ee2Var = r32;
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(r12, null);
                    }
                } else {
                    th3VarA = ji3.a(wv0Var, emptyList, true);
                    try {
                        j1Var = pe2Var.f8231a;
                        xVar = new x(r12, 4);
                        ee2Var.f2849a = th3VarA;
                        ee2Var.f2850b = th3VarA;
                        ee2Var.f2853e = 2;
                    } catch (Exception e11) {
                        e = e11;
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        qu0Var = new qu0(e, null, null, 6);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                        return qu0Var;
                    } catch (Throwable th3) {
                        th = th3;
                        th3Var = th3VarA;
                        th3VarA.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                    if (j1Var.a(xVar, ee2Var) != coroutineSingletons) {
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        qu0Var = new xu0(Unit.f71706a);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                    }
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                th3Var3 = ee2Var.f2850b;
                r32 = ee2Var.f2849a;
                try {
                    ResultKt.b(obj);
                    th3Var3 = th3Var3;
                    r32 = r32;
                    qu0Var = new xu0(Unit.f71706a);
                    r12 = th3Var3;
                    ee2Var = r32;
                } catch (Exception e12) {
                    e = e12;
                    qu0Var = new qu0(e, null, null, 6);
                    r12 = th3Var3;
                    ee2Var = r32;
                    if (qu0Var instanceof pu0) {
                    }
                    CloseableKt.a(r12, null);
                    return qu0Var;
                }
                if (qu0Var instanceof pu0) {
                    zi3.a((pu0) qu0Var, false);
                }
                CloseableKt.a(r12, null);
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                th3Var = ee2Var.f2850b;
                th3Var2 = ee2Var.f2849a;
                try {
                    try {
                        ResultKt.b(obj);
                        qu0Var = new xu0(Unit.f71706a);
                    } catch (Exception e13) {
                        e = e13;
                        qu0Var = new qu0(e, null, null, 6);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                        return qu0Var;
                    }
                    if (qu0Var instanceof pu0) {
                        zi3.a((pu0) qu0Var, false);
                    }
                    CloseableKt.a(th3Var, null);
                } catch (Throwable th4) {
                    th = th4;
                    th3VarA = th3Var2;
                    try {
                        th3VarA.b(th);
                        if (th instanceof b.a4) {
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                th3VarA.a(th);
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
            }
            return qu0Var;
        } catch (Throwable th5) {
            th = th5;
            A = ee2Var;
            closeable = r12;
        }
    }

    public final Pair a(g6 g6Var, long j11) {
        t4 t4Var = this.f8233c;
        t4Var.getClass();
        Duration.Companion companion = Duration.f72038b;
        long j12 = ((Duration) t4Var.a("gads:pc:ad_ttl_ms", ed.k(24, DurationUnit.f72048g, "gads:pc:ad_ttl_ms"), u.a$1)).f72041a;
        long jH = DurationKt.h(j11, DurationUnit.f72045d);
        e9 e9VarR = g6Var.r();
        Intrinsics.f(e9VarR, "getResponsesList(...)");
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : e9VarR) {
            Duration.Companion companion2 = Duration.f72038b;
            if (Duration.c(Duration.l(jH, DurationKt.h(((b6) obj).p(), DurationUnit.f72045d)), j12) <= 0) {
                arrayList.add(obj);
            } else {
                arrayList2.add(obj);
            }
        }
        return new Pair(arrayList, arrayList2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x013d, code lost:
    
        if (r1 == r3) goto L47;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:45:0x010f A[Catch: all -> 0x0045, TryCatch #1 {all -> 0x0045, blocks: (B:14:0x0040, B:48:0x0140, B:43:0x0109, B:45:0x010f, B:49:0x0143, B:50:0x014d, B:52:0x0151, B:21:0x0062, B:42:0x0101), top: B:88:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0143 A[Catch: all -> 0x0045, TryCatch #1 {all -> 0x0045, blocks: (B:14:0x0040, B:48:0x0140, B:43:0x0109, B:45:0x010f, B:49:0x0143, B:50:0x014d, B:52:0x0151, B:21:0x0062, B:42:0x0101), top: B:88:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0151 A[Catch: all -> 0x0045, TRY_LEAVE, TryCatch #1 {all -> 0x0045, blocks: (B:14:0x0040, B:48:0x0140, B:43:0x0109, B:45:0x010f, B:49:0x0143, B:50:0x014d, B:52:0x0151, B:21:0x0062, B:42:0x0101), top: B:88:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v10, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v11, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v17 */
    /* JADX WARN: Type inference failed for: r6v7, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v19 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x013d -> B:48:0x0140). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(pe2 pe2Var, qw2 qw2Var, String str, String str2, ContinuationImpl continuationImpl) {
        ge2 ge2Var;
        th3 th3VarA;
        th3 th3Var;
        String str3;
        pe2 pe2Var2;
        qw2 qw2Var2;
        String str4;
        String str5;
        String str6;
        String str7;
        th3 th3Var2;
        List list;
        pe2 pe2Var3;
        qw2 qw2Var3;
        Object xu0Var;
        th3 th3Var3;
        Iterator it;
        th3 th3Var4;
        th3 th3Var5;
        if (continuationImpl instanceof ge2) {
            ge2Var = (ge2) continuationImpl;
            int i5 = ge2Var.f3828j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ge2Var.f3828j = i5 - Integer.MIN_VALUE;
            } else {
                ge2Var = new ge2(pe2Var, continuationImpl);
            }
        }
        Object objY = ge2Var.f3826h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ge2Var.f3828j;
        ?? r62 = 2;
        ?? r72 = 1;
        Continuation continuation = null;
        try {
            try {
            } catch (Throwable th2) {
                th = th2;
                th3VarA = r72;
                th3Var = r62;
            }
            try {
                if (i11 == 0) {
                    ResultKt.b(objY);
                    ge2Var.f3819a = pe2Var;
                    ge2Var.f3820b = qw2Var;
                    str3 = str;
                    ge2Var.f3821c = str3;
                    ge2Var.f3822d = str2;
                    ge2Var.f3828j = 1;
                    if (pe2Var.b(ge2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    pe2Var2 = pe2Var;
                    qw2Var2 = qw2Var;
                    str4 = str2;
                } else if (i11 == 1) {
                    str4 = (String) ge2Var.f3822d;
                    str3 = ge2Var.f3821c;
                    qw2 qw2Var4 = ge2Var.f3820b;
                    pe2 pe2Var4 = ge2Var.f3819a;
                    ResultKt.b(objY);
                    qw2Var2 = qw2Var4;
                    pe2Var2 = pe2Var4;
                } else if (i11 == 2) {
                    list = (List) ge2Var.f3825g;
                    str7 = ge2Var.f3824f;
                    ?? r63 = ge2Var.f3823e;
                    th3 th3Var6 = (th3) ge2Var.f3822d;
                    str6 = ge2Var.f3821c;
                    qw2Var3 = ge2Var.f3820b;
                    pe2Var3 = ge2Var.f3819a;
                    ResultKt.b(objY);
                    th3Var3 = r63;
                    th3Var2 = th3Var6;
                    it = b70.g.P0(list).iterator();
                    th3Var5 = th3Var3;
                    th3Var4 = th3Var2;
                    if (it.hasNext()) {
                    }
                } else {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    it = (Iterator) ge2Var.f3825g;
                    str7 = ge2Var.f3824f;
                    ?? r64 = ge2Var.f3823e;
                    th3 th3Var7 = (th3) ge2Var.f3822d;
                    str6 = ge2Var.f3821c;
                    qw2Var3 = ge2Var.f3820b;
                    pe2Var3 = ge2Var.f3819a;
                    ResultKt.b(objY);
                    th3 th3Var8 = r64;
                    th3 th3Var9 = th3Var7;
                    th3Var5 = th3Var8;
                    th3Var4 = th3Var9;
                    if (it.hasNext()) {
                        String str8 = (String) it.next();
                        ge2Var.f3819a = pe2Var3;
                        ge2Var.f3820b = qw2Var3;
                        ge2Var.f3821c = str6;
                        ge2Var.f3822d = th3Var4;
                        ge2Var.f3823e = th3Var5;
                        ge2Var.f3824f = str7;
                        ge2Var.f3825g = it;
                        ge2Var.f3828j = 3;
                        ((mc2) pe2Var3.f8239i.get()).a(str8);
                        objY = m0.y(t70.c2.f88780b, new mx.e(pe2Var3, str8, continuation, 11), ge2Var);
                        th3Var8 = th3Var5;
                        th3Var9 = th3Var4;
                    } else {
                        xu0Var = new xu0(new ue2(str7, qw2Var3, str6));
                        r62 = th3Var5;
                        r72 = th3Var4;
                        if (xu0Var instanceof pu0) {
                            zi3.a((pu0) xu0Var, false);
                        }
                        CloseableKt.a(r62, null);
                        return xu0Var;
                    }
                }
                String string = UUID.randomUUID().toString();
                Intrinsics.f(string, "toString(...)");
                b.a1 a1VarB = pe2Var2.f8232b.b(string, str4);
                if (!(a1VarB instanceof pu0)) {
                    String str9 = (String) ((xu0) a1VarB).f11834b;
                    pe2Var2.f8234d.getClass();
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    ArrayList arrayList = new ArrayList();
                    j1 j1Var = pe2Var2.f8231a;
                    he2 he2Var = new he2(arrayList, pe2Var2, qw2Var2, jCurrentTimeMillis, str5, string, str9);
                    str6 = str5;
                    str7 = string;
                    ge2Var.f3819a = pe2Var2;
                    ge2Var.f3820b = qw2Var2;
                    ge2Var.f3821c = str6;
                    ge2Var.f3822d = th3VarA;
                    ge2Var.f3823e = th3VarA;
                    ge2Var.f3824f = str7;
                    ge2Var.f3825g = arrayList;
                    ge2Var.f3828j = 2;
                    if (j1Var.a(he2Var, ge2Var) != coroutineSingletons) {
                        th3 th3Var10 = th3VarA;
                        th3Var2 = th3Var10;
                        list = arrayList;
                        pe2Var3 = pe2Var2;
                        qw2Var3 = qw2Var2;
                        th3Var3 = th3Var10;
                        it = b70.g.P0(list).iterator();
                        th3Var5 = th3Var3;
                        th3Var4 = th3Var2;
                        if (it.hasNext()) {
                        }
                    }
                    return coroutineSingletons;
                }
                xu0Var = (pu0) a1VarB;
                th3 th3Var11 = th3VarA;
                r72 = th3Var11;
                r62 = th3Var11;
                if (xu0Var instanceof pu0) {
                }
                CloseableKt.a(r62, null);
                return xu0Var;
            } catch (Throwable th3) {
                th = th3;
                th3Var = th3VarA;
                try {
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA.a(th);
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
                }
            }
            str5 = str3;
            wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_PUT;
            WeakHashMap weakHashMap = ji3.f5253a;
            th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
        } catch (Exception e3) {
            return new qu0(e3, null, null, 6);
        }
    }

    public final LinkedHashMap a(Map map, long j11, ArrayList arrayList) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            g6 g6Var = (g6) entry.getValue();
            Pair pairA = a(g6Var, j11);
            List list = (List) pairA.f71683a;
            for (b6 b6Var : (List) pairA.f71684b) {
                WeakHashMap weakHashMap = ji3.f5253a;
                th3 th3VarA = ji3.a(wv0.CUI_NAME_PERSISTENT_CACHE_EXPIRE, EmptyList.f71733a, true);
                try {
                    String strQ = b6Var.q();
                    Intrinsics.f(strQ, "getFilename(...)");
                    arrayList.add(strQ);
                    th3VarA.close();
                } catch (Throwable th2) {
                    try {
                        th3VarA.b(th2);
                        if (!(th2 instanceof b.a4)) {
                            if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                th3VarA.a(th2);
                            }
                            if (!(th2 instanceof TimeoutCancellationException)) {
                                if (!(th2 instanceof CancellationException)) {
                                    if (th2 instanceof dv0) {
                                        throw th2;
                                    }
                                    throw new iu0(th2);
                                }
                                throw new du0(th2);
                            }
                            throw new lw0(th2);
                        }
                        throw th2;
                    } finally {
                    }
                }
            }
            if (!list.isEmpty()) {
                b.u2 u2Var = (b.u2) g6Var.n();
                Intrinsics.f(u2Var.f(), "getResponsesList(...)");
                u2Var.e();
                Intrinsics.f(u2Var.f(), "getResponsesList(...)");
                u2Var.d(list);
                linkedHashMap.put(str, (g6) u2Var.a());
            }
        }
        return linkedHashMap;
    }

    public static g1 a(g1 g1Var, String key, String key2, String str) {
        g6 g6Var;
        vr0 vr0Var = (vr0) g1Var.u().get(key);
        if (vr0Var == null || (g6Var = (g6) vr0Var.o().get(key2)) == null) {
            return g1Var;
        }
        e9 e9VarR = g6Var.r();
        Intrinsics.f(e9VarR, "getResponsesList(...)");
        ArrayList arrayList = new ArrayList();
        for (Object obj : e9VarR) {
            if (!Intrinsics.b(((b6) obj).q(), str)) {
                arrayList.add(obj);
            }
        }
        r2 r2Var = (r2) g1Var.n();
        if (arrayList.isEmpty()) {
            ob obVar = (ob) vr0Var.n();
            Intrinsics.f(obVar.e(), "getAdResponseListsMap(...)");
            Intrinsics.g(key2, "key");
            obVar.c(key2);
            vr0 vr0Var2 = (vr0) obVar.a();
            if (vr0Var2.o().isEmpty()) {
                Intrinsics.f(r2Var.e(), "getPoolsMap(...)");
                Intrinsics.g(key, "key");
                r2Var.c(key);
            } else {
                Intrinsics.f(r2Var.e(), "getPoolsMap(...)");
                Intrinsics.g(key, "key");
                r2Var.d(key, vr0Var2);
            }
        } else {
            Intrinsics.f(r2Var.e(), "getPoolsMap(...)");
            ob obVar2 = (ob) vr0Var.n();
            Intrinsics.f(obVar2.e(), "getAdResponseListsMap(...)");
            b.u2 u2Var = (b.u2) g6Var.n();
            Intrinsics.f(u2Var.f(), "getResponsesList(...)");
            u2Var.e();
            Intrinsics.f(u2Var.f(), "getResponsesList(...)");
            u2Var.d(arrayList);
            g6 g6Var2 = (g6) u2Var.a();
            Intrinsics.g(key2, "key");
            obVar2.d(key2, g6Var2);
            vr0 vr0Var3 = (vr0) obVar2.a();
            Intrinsics.g(key, "key");
            r2Var.d(key, vr0Var3);
        }
        return (g1) r2Var.a();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:118:0x016f A[Catch: all -> 0x0149, TRY_LEAVE, TryCatch #7 {all -> 0x0149, blocks: (B:96:0x0136, B:98:0x013d, B:100:0x0141, B:102:0x0145, B:105:0x014c, B:107:0x0150, B:109:0x0154, B:111:0x0158, B:112:0x0159, B:113:0x015e, B:114:0x015f, B:115:0x0166, B:116:0x0167, B:117:0x016e, B:118:0x016f), top: B:130:0x0136 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00ae A[Catch: all -> 0x004e, TRY_LEAVE, TryCatch #10 {all -> 0x004e, blocks: (B:22:0x004a, B:35:0x0093, B:44:0x00a9, B:46:0x00ae, B:43:0x00a3), top: B:132:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x012b A[Catch: all -> 0x0038, TRY_LEAVE, TryCatch #6 {all -> 0x0038, blocks: (B:13:0x0033, B:81:0x0110, B:90:0x0126, B:92:0x012b, B:89:0x0120), top: B:127:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x013d A[Catch: all -> 0x0149, TryCatch #7 {all -> 0x0149, blocks: (B:96:0x0136, B:98:0x013d, B:100:0x0141, B:102:0x0145, B:105:0x014c, B:107:0x0150, B:109:0x0154, B:111:0x0158, B:112:0x0159, B:113:0x015e, B:114:0x015f, B:115:0x0166, B:116:0x0167, B:117:0x016e, B:118:0x016f), top: B:130:0x0136 }] */
    /* JADX WARN: Type inference failed for: r0v13, types: [ads_mobile_sdk.j1] */
    /* JADX WARN: Type inference failed for: r0v9, types: [ads_mobile_sdk.j1] */
    /* JADX WARN: Type inference failed for: r1v13, types: [ads_mobile_sdk.em2, ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v0, types: [ads_mobile_sdk.jn, kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v11, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v23 */
    /* JADX WARN: Type inference failed for: r2v24 */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v23, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r3v29 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(pe2 pe2Var, ContinuationImpl continuationImpl) {
        ke2 ke2Var;
        ?? A;
        Closeable closeable;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        ?? r02;
        th3 th3Var3;
        ?? r32;
        ?? r03;
        Object qu0Var;
        ?? r22 = jn.a$4;
        if (continuationImpl instanceof ke2) {
            ke2 ke2Var2 = (ke2) continuationImpl;
            int i5 = ke2Var2.f5718e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ke2Var2.f5718e = i5 - Integer.MIN_VALUE;
                ke2Var = ke2Var2;
            } else {
                ke2Var = new ke2(pe2Var, continuationImpl);
            }
        }
        Object obj = ke2Var.f5716c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ke2Var.f5718e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                kz2 kz2Var = pe2Var.f8237g;
                wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_METADATA_WRITE;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a == null) {
                    A = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        r03 = pe2Var.f8231a;
                        ke2Var.f5714a = A;
                        ke2Var.f5715b = A;
                        ke2Var.f5718e = 1;
                    } catch (Exception e3) {
                        e = e3;
                        th3Var3 = A;
                        r32 = th3Var3;
                        qu0Var = new qu0(e, null, null, 6);
                        r22 = th3Var3;
                        ke2Var = r32;
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(r22, null);
                        return qu0Var;
                    } catch (Throwable th2) {
                        th = th2;
                        closeable = A;
                        try {
                            A.b(th);
                            if (!(th instanceof b.a4)) {
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
                        } finally {
                        }
                    }
                    if (r03.a(r22, ke2Var) != coroutineSingletons) {
                        th3 th3Var4 = A;
                        r32 = th3Var4;
                        th3Var3 = th3Var4;
                        qu0Var = new xu0(Unit.f71706a);
                        r22 = th3Var3;
                        ke2Var = r32;
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(r22, null);
                    }
                } else {
                    th3VarA = ji3.a(wv0Var, emptyList, true);
                    try {
                        r02 = pe2Var.f8231a;
                        ke2Var.f5714a = th3VarA;
                        ke2Var.f5715b = th3VarA;
                        ke2Var.f5718e = 2;
                    } catch (Exception e11) {
                        e = e11;
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        qu0Var = new qu0(e, null, null, 6);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                        return qu0Var;
                    } catch (Throwable th3) {
                        th = th3;
                        th3Var = th3VarA;
                        th3VarA.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                    if (r02.a(r22, ke2Var) != coroutineSingletons) {
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        qu0Var = new xu0(Unit.f71706a);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                    }
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                th3Var3 = ke2Var.f5715b;
                r32 = ke2Var.f5714a;
                try {
                    ResultKt.b(obj);
                    th3Var3 = th3Var3;
                    r32 = r32;
                    qu0Var = new xu0(Unit.f71706a);
                    r22 = th3Var3;
                    ke2Var = r32;
                } catch (Exception e12) {
                    e = e12;
                    qu0Var = new qu0(e, null, null, 6);
                    r22 = th3Var3;
                    ke2Var = r32;
                    if (qu0Var instanceof pu0) {
                    }
                    CloseableKt.a(r22, null);
                    return qu0Var;
                }
                if (qu0Var instanceof pu0) {
                    zi3.a((pu0) qu0Var, false);
                }
                CloseableKt.a(r22, null);
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                th3Var = ke2Var.f5715b;
                th3Var2 = ke2Var.f5714a;
                try {
                    try {
                        ResultKt.b(obj);
                        qu0Var = new xu0(Unit.f71706a);
                    } catch (Exception e13) {
                        e = e13;
                        qu0Var = new qu0(e, null, null, 6);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                        return qu0Var;
                    }
                    if (qu0Var instanceof pu0) {
                        zi3.a((pu0) qu0Var, false);
                    }
                    CloseableKt.a(th3Var, null);
                } catch (Throwable th4) {
                    th = th4;
                    th3VarA = th3Var2;
                    try {
                        th3VarA.b(th);
                        if (th instanceof b.a4) {
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                th3VarA.a(th);
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
            }
            return qu0Var;
        } catch (Throwable th5) {
            th = th5;
            A = ke2Var;
            closeable = r22;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0060, code lost:
    
        if (r2.a(r4, r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(wk0 wk0Var, ContinuationImpl continuationImpl) throws NoSuchAlgorithmException, IOException {
        me2 me2Var;
        pe2 pe2Var;
        if (continuationImpl instanceof me2) {
            me2Var = (me2) continuationImpl;
            int i5 = me2Var.f7185e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                me2Var.f7185e = i5 - Integer.MIN_VALUE;
            } else {
                me2Var = new me2(this, continuationImpl);
            }
        }
        Object objA = me2Var.f7183c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = me2Var.f7185e;
        if (i11 == 0) {
            ResultKt.b(objA);
            me2Var.f7181a = this;
            me2Var.f7182b = wk0Var;
            me2Var.f7185e = 1;
            objA = a(me2Var);
            if (objA != coroutineSingletons) {
                pe2Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        wk0Var = me2Var.f7182b;
        pe2Var = me2Var.f7181a;
        ResultKt.b(objA);
        j1 j1Var = pe2Var.f8231a;
        b4.d dVar = new b4.d(2, wk0Var, (String) objA);
        me2Var.f7181a = null;
        me2Var.f7182b = null;
        me2Var.f7185e = 2;
    }
}
