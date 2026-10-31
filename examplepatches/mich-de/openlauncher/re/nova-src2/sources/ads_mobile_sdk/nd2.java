package ads_mobile_sdk;

import android.content.Context;
import b.t4;
import b.x0;
import java.io.Closeable;
import java.io.File;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import w70.u1;

/* loaded from: classes.dex */
public final class nd2 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final j1 f7531c;

    /* renamed from: d, reason: collision with root package name */
    public final c6 f7532d;

    /* renamed from: e, reason: collision with root package name */
    public final Context f7533e;

    /* renamed from: f, reason: collision with root package name */
    public final t4 f7534f;

    /* renamed from: g, reason: collision with root package name */
    public pe2 f7535g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nd2(j1 dataStore, c6 fileStore, Context context, x0 flagValueProvider, t4 flags) {
        super((wv0) null, false);
        Intrinsics.g(dataStore, "dataStore");
        Intrinsics.g(fileStore, "fileStore");
        Intrinsics.g(context, "context");
        Intrinsics.g(flagValueProvider, "flagValueProvider");
        Intrinsics.g(flags, "flags");
        this.f7531c = dataStore;
        this.f7532d = fileStore;
        this.f7533e = context;
        this.f7534f = flags;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(nd2 nd2Var, ContinuationImpl continuationImpl) {
        ld2 ld2Var;
        LinkedHashSet linkedHashSet;
        Object objO;
        if (continuationImpl instanceof ld2) {
            ld2Var = (ld2) continuationImpl;
            int i5 = ld2Var.f6210e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ld2Var.f6210e = i5 - Integer.MIN_VALUE;
            } else {
                ld2Var = new ld2(nd2Var, continuationImpl);
            }
        }
        Object obj = ld2Var.f6208c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ld2Var.f6210e;
        if (i11 == 0) {
            ResultKt.b(obj);
            linkedHashSet = new LinkedHashSet();
            w70.m data = ((t5.g) nd2Var.f7531c.f5080a.get()).getData();
            ld2Var.f6206a = nd2Var;
            ld2Var.f6207b = linkedHashSet;
            ld2Var.f6210e = 1;
            objO = u1.o(data, ld2Var);
            if (objO == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            LinkedHashSet linkedHashSet2 = ld2Var.f6207b;
            nd2 nd2Var2 = ld2Var.f6206a;
            ResultKt.b(obj);
            linkedHashSet = linkedHashSet2;
            nd2Var = nd2Var2;
            objO = obj;
        }
        Iterator it = ((g1) objO).u().values().iterator();
        while (it.hasNext()) {
            Iterator it2 = ((vr0) it.next()).o().values().iterator();
            while (it2.hasNext()) {
                Iterator it3 = ((g6) it2.next()).r().iterator();
                while (it3.hasNext()) {
                    String strQ = ((b6) it3.next()).q();
                    Intrinsics.f(strQ, "getFilename(...)");
                    linkedHashSet.add(strQ);
                }
            }
        }
        for (File file : nd2Var.f7532d.a()) {
            String name = file.getName();
            Intrinsics.f(name, "getName(...)");
            if (r70.j.A0(name, ".tmp", false)) {
                file.delete();
            } else if (!linkedHashSet.contains(file.getName())) {
                file.delete();
            }
        }
        return new xu0(Unit.f71706a);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(4:(1:(1:(1:(10:13|155|14|94|(1:96)(1:97)|98|102|(3:104|105|106)|107|108)(2:20|21))(10:22|23|77|78|87|88|89|90|(8:93|94|(0)(0)|98|102|(0)|107|108)|92))(3:29|30|31))(2:32|(2:34|35)(4:141|36|(1:38)(1:39)|(5:46|157|47|(1:49)|58)(2:42|43)))|147|59|(5:61|102|(0)|107|108)(6:66|(3:68|(6:70|143|71|72|73|(8:76|77|78|87|88|89|90|(0)))(5:87|88|89|90|(0))|92)(0)|102|(0)|107|108)) */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00d3, code lost:
    
        if (ads_mobile_sdk.pe2.b(r2, r0) == r1) goto L92;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00fc, code lost:
    
        r11 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00fd, code lost:
    
        r10 = r12;
        r12 = r11;
        r11 = r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x012a, code lost:
    
        r0 = r12;
        r12 = r11;
        r11 = r0;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x016b A[Catch: all -> 0x00f7, TRY_LEAVE, TryCatch #11 {all -> 0x00f7, blocks: (B:102:0x0167, B:104:0x016b, B:87:0x0134, B:89:0x013a, B:59:0x00e2, B:61:0x00ee, B:66:0x0101, B:68:0x0109, B:70:0x010d, B:72:0x0113), top: B:147:0x00e2 }] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0185 A[Catch: all -> 0x0191, TryCatch #4 {all -> 0x0191, blocks: (B:112:0x017e, B:114:0x0185, B:116:0x0189, B:118:0x018d, B:121:0x0193, B:123:0x0197, B:125:0x019b, B:127:0x019f, B:128:0x01a0, B:129:0x01a5, B:130:0x01a6, B:131:0x01ad, B:132:0x01ae, B:133:0x01b5, B:134:0x01b6), top: B:146:0x017e }] */
    /* JADX WARN: Removed duplicated region for block: B:134:0x01b6 A[Catch: all -> 0x0191, TRY_LEAVE, TryCatch #4 {all -> 0x0191, blocks: (B:112:0x017e, B:114:0x0185, B:116:0x0189, B:118:0x018d, B:121:0x0193, B:123:0x0197, B:125:0x019b, B:127:0x019f, B:128:0x01a0, B:129:0x01a5, B:130:0x01a6, B:131:0x01ad, B:132:0x01ae, B:133:0x01b5, B:134:0x01b6), top: B:146:0x017e }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0134 A[Catch: all -> 0x00f7, Exception -> 0x00fc, PHI: r2 r11 r12
      0x0134: PHI (r2v24 ??) = (r2v37 ??), (r2v38 ??), (r2v39 ??) binds: [B:67:0x0107, B:69:0x010b, B:78:0x0122] A[DONT_GENERATE, DONT_INLINE]
      0x0134: PHI (r11v34 ads_mobile_sdk.nd2) = (r11v51 ads_mobile_sdk.nd2), (r11v52 ads_mobile_sdk.nd2), (r11v38 ads_mobile_sdk.nd2) binds: [B:67:0x0107, B:69:0x010b, B:78:0x0122] A[DONT_GENERATE, DONT_INLINE]
      0x0134: PHI (r12v41 ??) = (r12v37 ??), (r12v37 ??), (r12v45 ??) binds: [B:67:0x0107, B:69:0x010b, B:78:0x0122] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TRY_LEAVE, TryCatch #6 {Exception -> 0x00fc, blocks: (B:87:0x0134, B:89:0x013a, B:59:0x00e2, B:61:0x00ee, B:66:0x0101, B:68:0x0109, B:70:0x010d, B:72:0x0113), top: B:147:0x00e2 }] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0150  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0151 A[Catch: all -> 0x0036, Exception -> 0x0039, TRY_LEAVE, TryCatch #13 {Exception -> 0x0039, all -> 0x0036, blocks: (B:14:0x0031, B:94:0x014a, B:97:0x0151), top: B:155:0x0031 }] */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r11v46, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v14, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r12v22 */
    /* JADX WARN: Type inference failed for: r12v23 */
    /* JADX WARN: Type inference failed for: r12v24, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r12v34, types: [ads_mobile_sdk.th3, java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r12v37, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r12v40 */
    /* JADX WARN: Type inference failed for: r12v41, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r12v45 */
    /* JADX WARN: Type inference failed for: r12v48 */
    /* JADX WARN: Type inference failed for: r12v5 */
    /* JADX WARN: Type inference failed for: r12v53 */
    /* JADX WARN: Type inference failed for: r12v54 */
    /* JADX WARN: Type inference failed for: r12v6 */
    /* JADX WARN: Type inference failed for: r12v8 */
    /* JADX WARN: Type inference failed for: r12v9 */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v22, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v23 */
    /* JADX WARN: Type inference failed for: r2v24, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v25 */
    /* JADX WARN: Type inference failed for: r2v27 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v32 */
    /* JADX WARN: Type inference failed for: r2v35 */
    /* JADX WARN: Type inference failed for: r2v36 */
    /* JADX WARN: Type inference failed for: r2v37 */
    /* JADX WARN: Type inference failed for: r2v38 */
    /* JADX WARN: Type inference failed for: r2v39 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v40 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(nd2 nd2Var, ContinuationImpl continuationImpl) {
        md2 md2Var;
        ?? A;
        Exception e3;
        th3 th3Var;
        TimeoutCancellationException th2;
        Closeable closeable;
        ?? r02;
        TimeoutCancellationException th3;
        Object qu0Var;
        th3 th3Var2;
        boolean z11;
        nd2 nd2Var2;
        nd2 nd2Var3;
        nd2 nd2Var4;
        Object objA;
        Object xu0Var;
        if (continuationImpl instanceof md2) {
            md2Var = (md2) continuationImpl;
            int i5 = md2Var.f7149f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                md2Var.f7149f = i5 - Integer.MIN_VALUE;
            } else {
                md2Var = new md2(nd2Var, continuationImpl);
            }
        }
        Object obj = md2Var.f7147d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r22 = md2Var.f7149f;
        try {
        } catch (Exception e11) {
            e = e11;
        } catch (Throwable th4) {
            th = th4;
            r02 = nd2Var;
            th3 = th;
            th3Var2 = r22;
            A = th3Var2;
            try {
                A.b(th3);
                if (!(th3 instanceof b.a4)) {
                }
            } finally {
            }
        }
        try {
            if (r22 == 0) {
                ResultKt.b(obj);
                t4 t4Var = nd2Var.f7534f;
                t4Var.getClass();
                if (!((Boolean) t4Var.a("gads:pc:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                    return new xu0(Unit.f71706a);
                }
                try {
                    boolean zExists = e10.z2.S(nd2Var.f7533e, "google_mobile_ads_ad_cache_manifest.pb").exists();
                    c6 c6Var = nd2Var.f7532d;
                    if (c6Var.f1667b) {
                        z11 = true;
                    } else {
                        c6Var.f1667b = c6Var.f1666a.exists();
                        z11 = c6Var.f1667b;
                    }
                    if (!zExists && !z11) {
                        return new xu0(Unit.f71706a);
                    }
                    wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_INIT;
                    WeakHashMap weakHashMap = ji3.f5253a;
                    A = ji3.a(wv0Var, EmptyList.f71733a, true);
                    try {
                        pe2 pe2Var = nd2Var.f7535g;
                        if (pe2Var != null) {
                            md2Var.f7144a = nd2Var;
                            md2Var.f7145b = A;
                            md2Var.f7146c = A;
                            md2Var.f7149f = 1;
                        }
                        r22 = A;
                        nd2Var2 = nd2Var;
                    } catch (Exception e12) {
                        e3 = e12;
                        th3Var = A;
                        r22 = th3Var;
                        qu0Var = new qu0(e3, null, null, 6);
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(A, null);
                        return qu0Var;
                    } catch (Throwable th5) {
                        th3 = th5;
                        r02 = A;
                        A.b(th3);
                        if (!(th3 instanceof b.a4)) {
                        }
                    }
                } catch (Exception e13) {
                    return new qu0(e13, null, null, 6);
                }
            } else {
                if (r22 != 1) {
                    if (r22 == 2) {
                        ?? r11 = md2Var.f7146c;
                        th3 th3Var3 = (th3) md2Var.f7145b;
                        nd2Var3 = (nd2) md2Var.f7144a;
                        ResultKt.b(obj);
                        r22 = th3Var3;
                        nd2Var = r11;
                        A = nd2Var;
                        nd2Var4 = nd2Var3;
                        r22 = r22;
                        md2Var.f7144a = r22;
                        md2Var.f7145b = A;
                        md2Var.f7146c = null;
                        md2Var.f7149f = 3;
                        nd2Var4.getClass();
                        objA = a(nd2Var4, md2Var);
                        if (objA != coroutineSingletons) {
                            Closeable closeable2 = A;
                            obj = objA;
                            closeable = closeable2;
                            th3Var = r22;
                            xu0Var = (b.a1) obj;
                            if (xu0Var instanceof pu0) {
                            }
                            Object obj2 = xu0Var;
                            A = closeable;
                            qu0Var = obj2;
                            r22 = th3Var;
                            if (qu0Var instanceof pu0) {
                            }
                            CloseableKt.a(A, null);
                            return qu0Var;
                        }
                        return coroutineSingletons;
                    }
                    if (r22 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    closeable = md2Var.f7145b;
                    th3Var = (th3) md2Var.f7144a;
                    try {
                        ResultKt.b(obj);
                        closeable = closeable;
                        xu0Var = (b.a1) obj;
                        if (xu0Var instanceof pu0) {
                            xu0Var = new xu0(Unit.f71706a);
                        }
                        Object obj22 = xu0Var;
                        A = closeable;
                        qu0Var = obj22;
                        r22 = th3Var;
                    } catch (Exception e14) {
                        A = closeable;
                        e3 = e14;
                        try {
                            r22 = th3Var;
                            qu0Var = new qu0(e3, null, null, 6);
                            if (qu0Var instanceof pu0) {
                            }
                            CloseableKt.a(A, null);
                            return qu0Var;
                        } catch (Throwable th6) {
                            Closeable closeable3 = A;
                            th2 = th6;
                            closeable = closeable3;
                            th3 th3Var4 = th3Var;
                            r02 = closeable;
                            th3 = th2;
                            A = th3Var4;
                            A.b(th3);
                            if (!(th3 instanceof b.a4)) {
                            }
                        }
                    } catch (Throwable th7) {
                        th2 = th7;
                        th3 th3Var42 = th3Var;
                        r02 = closeable;
                        th3 = th2;
                        A = th3Var42;
                        A.b(th3);
                        if (!(th3 instanceof b.a4)) {
                        }
                    }
                    if (qu0Var instanceof pu0) {
                        zi3.a((pu0) qu0Var, false);
                    }
                    CloseableKt.a(A, null);
                    return qu0Var;
                }
                Closeable closeable4 = md2Var.f7146c;
                th3 th3Var5 = (th3) md2Var.f7145b;
                nd2 nd2Var5 = (nd2) md2Var.f7144a;
                ResultKt.b(obj);
                A = closeable4;
                nd2Var2 = nd2Var5;
                r22 = th3Var5;
            }
            if (nd2Var2.f7532d.a().isEmpty()) {
                qu0Var = new xu0(Unit.f71706a);
                r22 = r22;
                if (qu0Var instanceof pu0) {
                }
                CloseableKt.a(A, null);
                return qu0Var;
            }
            boolean zJ = nd2Var2.f7534f.j();
            r22 = r22;
            nd2Var4 = nd2Var2;
            if (zJ) {
                pe2 pe2Var2 = nd2Var2.f7535g;
                r22 = r22;
                nd2Var4 = nd2Var2;
                if (pe2Var2 != null) {
                    md2Var.f7144a = nd2Var2;
                    try {
                        try {
                            md2Var.f7145b = r22;
                            md2Var.f7146c = A;
                            md2Var.f7149f = 2;
                            Object objA2 = pe2.a(pe2Var2, md2Var);
                            if (objA2 != coroutineSingletons) {
                                nd2Var3 = nd2Var2;
                                nd2Var = A;
                                obj = objA2;
                                r22 = r22;
                                A = nd2Var;
                                nd2Var4 = nd2Var3;
                                r22 = r22;
                                md2Var.f7144a = r22;
                                md2Var.f7145b = A;
                                md2Var.f7146c = null;
                                md2Var.f7149f = 3;
                                nd2Var4.getClass();
                                objA = a(nd2Var4, md2Var);
                                if (objA != coroutineSingletons) {
                                }
                            }
                        } catch (Exception e15) {
                            e3 = e15;
                            th3Var = r22;
                            r22 = th3Var;
                            qu0Var = new qu0(e3, null, null, 6);
                            if (qu0Var instanceof pu0) {
                            }
                            CloseableKt.a(A, null);
                            return qu0Var;
                        }
                    } catch (Throwable th8) {
                        th3 = th8;
                        r02 = A;
                        th3Var2 = r22;
                        A = th3Var2;
                        A.b(th3);
                        if (!(th3 instanceof b.a4)) {
                            throw th3;
                        }
                        if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                            A.a(th3);
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
                    }
                } else {
                    md2Var.f7144a = r22;
                    md2Var.f7145b = A;
                    md2Var.f7146c = null;
                    md2Var.f7149f = 3;
                    nd2Var4.getClass();
                    objA = a(nd2Var4, md2Var);
                    if (objA != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            }
            if (qu0Var instanceof pu0) {
            }
            CloseableKt.a(A, null);
            return qu0Var;
        } catch (Throwable th9) {
            nd2 nd2Var6 = A;
            th = th9;
            nd2Var = nd2Var6;
            r02 = nd2Var;
            th3 = th;
            th3Var2 = r22;
            A = th3Var2;
            A.b(th3);
            if (!(th3 instanceof b.a4)) {
            }
        }
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }
}
