package m8;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import c9.m;
import coil.request.NullRequestDataException;
import h6.u;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.c0;
import t70.i2;
import t70.k0;
import t70.m0;
import t70.r1;
import t70.y0;
import x8.l;
import x8.q;
import x8.r;
import x8.t;
import x80.w;
import y70.o;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final Context f76075a;

    /* renamed from: b, reason: collision with root package name */
    public final x8.b f76076b;

    /* renamed from: c, reason: collision with root package name */
    public final a70.d f76077c;

    /* renamed from: d, reason: collision with root package name */
    public final y70.d f76078d;

    /* renamed from: e, reason: collision with root package name */
    public final i50.c f76079e;

    /* renamed from: f, reason: collision with root package name */
    public final b f76080f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f76081g;

    public k(Context context, x8.b bVar, a70.d dVar, a70.d dVar2, a70.d dVar3, b bVar2, lm.e eVar) {
        this.f76075a = context;
        this.f76076b = bVar;
        this.f76077c = dVar;
        i2 i2VarD = m0.d();
        a80.e eVar2 = y0.f88884a;
        this.f76078d = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, o.f96819a.f90673f).plus(new j(this)));
        eVar.getClass();
        m mVar = new m(this, context);
        i50.c cVar = new i50.c(this, mVar);
        this.f76079e = cVar;
        qp.i iVar = new qp.i(bVar2);
        int i5 = 2;
        iVar.i(new u8.a(i5), w.class);
        int i11 = 5;
        iVar.i(new u8.a(i11), String.class);
        int i12 = 1;
        iVar.i(new u8.a(i12), Uri.class);
        int i13 = 4;
        iVar.i(new u8.a(i13), Uri.class);
        int i14 = 3;
        iVar.i(new u8.a(i14), Integer.class);
        int i15 = 0;
        iVar.i(new u8.a(i15), byte[].class);
        t8.a aVar = new t8.a(1);
        ArrayList arrayList = (ArrayList) iVar.f84309c;
        arrayList.add(new Pair(aVar, Uri.class));
        arrayList.add(new Pair(new t8.a(0), File.class));
        iVar.h(new r8.j(dVar3, dVar2), Uri.class);
        iVar.h(new r8.a(i11), File.class);
        iVar.h(new r8.a(i15), Uri.class);
        iVar.h(new r8.a(i14), Uri.class);
        iVar.h(new r8.a(6), Uri.class);
        iVar.h(new r8.a(i13), Drawable.class);
        iVar.h(new r8.a(i12), Bitmap.class);
        iVar.h(new r8.a(i5), ByteBuffer.class);
        ((ArrayList) iVar.f84311e).add(new o8.b());
        b bVarK = iVar.k();
        this.f76080f = bVarK;
        this.f76081g = b70.g.u1(bVarK.f76047a, new s8.h(this, cVar));
        new AtomicBoolean(false);
        context.registerComponentCallbacks(mVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00de A[Catch: all -> 0x00db, PHI: r1 r2 r3 r4
      0x00de: PHI (r1v16 m8.k) = (r1v3 m8.k), (r1v0 m8.k), (r1v0 m8.k) binds: [B:28:0x0075, B:38:0x00c6, B:40:0x00d8] A[DONT_GENERATE, DONT_INLINE]
      0x00de: PHI (r2v17 m8.c) = (r2v5 m8.c), (r2v29 m8.c), (r2v30 m8.c) binds: [B:28:0x0075, B:38:0x00c6, B:40:0x00d8] A[DONT_GENERATE, DONT_INLINE]
      0x00de: PHI (r3v10 x8.k) = (r3v20 x8.k), (r3v21 x8.k), (r3v22 x8.k) binds: [B:28:0x0075, B:38:0x00c6, B:40:0x00d8] A[DONT_GENERATE, DONT_INLINE]
      0x00de: PHI (r4v10 x8.q) = (r4v12 x8.q), (r4v13 x8.q), (r4v14 x8.q) binds: [B:28:0x0075, B:38:0x00c6, B:40:0x00d8] A[DONT_GENERATE, DONT_INLINE], TryCatch #4 {all -> 0x00db, blocks: (B:44:0x00de, B:46:0x00e8, B:47:0x00eb, B:49:0x00fb, B:50:0x00fe, B:35:0x00bd, B:37:0x00c3, B:39:0x00c8, B:86:0x01a1, B:87:0x01a6), top: B:105:0x00bd }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00e8 A[Catch: all -> 0x00db, TryCatch #4 {all -> 0x00db, blocks: (B:44:0x00de, B:46:0x00e8, B:47:0x00eb, B:49:0x00fb, B:50:0x00fe, B:35:0x00bd, B:37:0x00c3, B:39:0x00c8, B:86:0x01a1, B:87:0x01a6), top: B:105:0x00bd }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00fb A[Catch: all -> 0x00db, TryCatch #4 {all -> 0x00db, blocks: (B:44:0x00de, B:46:0x00e8, B:47:0x00eb, B:49:0x00fb, B:50:0x00fe, B:35:0x00bd, B:37:0x00c3, B:39:0x00c8, B:86:0x01a1, B:87:0x01a6), top: B:105:0x00bd }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x014d A[Catch: all -> 0x0185, TryCatch #2 {all -> 0x0185, blocks: (B:60:0x0147, B:62:0x014d, B:65:0x015f, B:70:0x0177, B:72:0x017e, B:66:0x0163, B:69:0x0171, B:77:0x0187, B:79:0x018b), top: B:102:0x0147 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x017e A[Catch: all -> 0x0185, TryCatch #2 {all -> 0x0185, blocks: (B:60:0x0147, B:62:0x014d, B:65:0x015f, B:70:0x0177, B:72:0x017e, B:66:0x0163, B:69:0x0171, B:77:0x0187, B:79:0x018b), top: B:102:0x0147 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0187 A[Catch: all -> 0x0185, TryCatch #2 {all -> 0x0185, blocks: (B:60:0x0147, B:62:0x014d, B:65:0x015f, B:70:0x0177, B:72:0x017e, B:66:0x0163, B:69:0x0171, B:77:0x0187, B:79:0x018b), top: B:102:0x0147 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01ab A[Catch: all -> 0x01bd, TRY_LEAVE, TryCatch #6 {all -> 0x01bd, blocks: (B:88:0x01a7, B:90:0x01ab, B:95:0x01bf, B:96:0x01c7), top: B:108:0x01a7 }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01bf A[Catch: all -> 0x01bd, TRY_ENTER, TryCatch #6 {all -> 0x01bd, blocks: (B:88:0x01a7, B:90:0x01ab, B:95:0x01bf, B:96:0x01c7), top: B:108:0x01a7 }] */
    /* JADX WARN: Type inference failed for: r2v32 */
    /* JADX WARN: Type inference failed for: r2v33 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7, types: [java.lang.Object, m8.c] */
    /* JADX WARN: Type inference failed for: r3v25 */
    /* JADX WARN: Type inference failed for: r3v26 */
    /* JADX WARN: Type inference failed for: r3v27 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v5, types: [x8.k] */
    /* JADX WARN: Type inference failed for: r4v20 */
    /* JADX WARN: Type inference failed for: r4v21 */
    /* JADX WARN: Type inference failed for: r4v22 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v6, types: [x8.q] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(k kVar, x8.k kVar2, int i5, ContinuationImpl continuationImpl) {
        h hVar;
        ?? r22;
        c cVar;
        ?? r32;
        ?? r42;
        Bitmap bitmap;
        c cVar2;
        x8.k kVar3;
        q qVar;
        k kVar4;
        c cVar3;
        q qVar2;
        x8.k kVar5;
        c cVar4;
        q qVar3;
        x8.k kVar6;
        l lVar;
        x8.j jVar;
        c cVar5;
        Object objY;
        q qVar4;
        x8.k kVar7;
        z8.b bVar;
        Object objA;
        k kVar8 = kVar;
        x8.k kVar9 = kVar2;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i11 = hVar.A;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                hVar.A = i11 - Integer.MIN_VALUE;
            } else {
                hVar = new h(kVar8, continuationImpl);
            }
        }
        h hVar2 = hVar;
        Object obj = hVar2.f76065y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = hVar2.A;
        if (i12 != 0) {
            try {
                if (i12 == 1) {
                    c cVar6 = hVar2.f76063w;
                    x8.k kVar10 = hVar2.f76062v;
                    q qVar5 = hVar2.f76061u;
                    k kVar11 = hVar2.f76060t;
                    ResultKt.b(obj);
                    cVar = cVar6;
                    kVar8 = kVar11;
                    kVar7 = kVar10;
                    qVar4 = qVar5;
                    if (((v8.b) kVar8.f76077c.getValue()) != null) {
                        kVar7.getClass();
                    }
                    Drawable drawableB = c9.e.b(kVar7, kVar7.f95345v, kVar7.f95344u, kVar7.f95349z.f95289j);
                    bVar = kVar7.f95328c;
                    if (bVar != null) {
                        bVar.h(drawableB);
                    }
                    cVar.getClass();
                    y8.g gVar = kVar7.f95342s;
                    hVar2.f76060t = kVar8;
                    hVar2.f76061u = qVar4;
                    hVar2.f76062v = kVar7;
                    hVar2.f76063w = cVar;
                    hVar2.f76064x = null;
                    hVar2.A = 2;
                    objA = gVar.a(hVar2);
                    if (objA != coroutineSingletons) {
                        kVar4 = kVar8;
                        cVar2 = cVar;
                        kVar3 = kVar7;
                        obj = objA;
                        bitmap = null;
                        qVar = qVar4;
                        cVar2.getClass();
                        c0 c0Var = kVar3.n;
                        i iVar = new i(kVar3, kVar4, (y8.f) obj, cVar2, bitmap, null, 0);
                        cVar5 = cVar2;
                        hVar2.f76060t = kVar4;
                        hVar2.f76061u = qVar;
                        hVar2.f76062v = kVar3;
                        hVar2.f76063w = cVar5;
                        hVar2.f76064x = null;
                        hVar2.A = 3;
                        objY = m0.y(c0Var, iVar, hVar2);
                        if (objY != coroutineSingletons) {
                        }
                    }
                    return coroutineSingletons;
                }
                if (i12 == 2) {
                    Bitmap bitmap2 = hVar2.f76064x;
                    c cVar7 = hVar2.f76063w;
                    x8.k kVar12 = hVar2.f76062v;
                    q qVar6 = hVar2.f76061u;
                    k kVar13 = hVar2.f76060t;
                    try {
                        ResultKt.b(obj);
                        bitmap = bitmap2;
                        cVar2 = cVar7;
                        kVar3 = kVar12;
                        qVar = qVar6;
                        kVar4 = kVar13;
                        try {
                            cVar2.getClass();
                            c0 c0Var2 = kVar3.n;
                            i iVar2 = new i(kVar3, kVar4, (y8.f) obj, cVar2, bitmap, null, 0);
                            cVar5 = cVar2;
                            try {
                                hVar2.f76060t = kVar4;
                                hVar2.f76061u = qVar;
                                hVar2.f76062v = kVar3;
                                hVar2.f76063w = cVar5;
                                hVar2.f76064x = null;
                                hVar2.A = 3;
                                objY = m0.y(c0Var2, iVar2, hVar2);
                                if (objY != coroutineSingletons) {
                                    cVar3 = cVar5;
                                    kVar6 = kVar3;
                                    obj = objY;
                                    qVar3 = qVar;
                                    lVar = (l) obj;
                                    if (!(lVar instanceof r)) {
                                    }
                                    return lVar;
                                }
                                return coroutineSingletons;
                            } catch (Throwable th2) {
                                th = th2;
                                kVar5 = kVar3;
                                cVar4 = cVar5;
                                qVar2 = qVar;
                                kVar8 = kVar4;
                                r22 = cVar4;
                                r32 = kVar5;
                                r42 = qVar2;
                                if (th instanceof CancellationException) {
                                }
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            cVar5 = cVar2;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        r22 = cVar7;
                        r32 = kVar12;
                        r42 = qVar6;
                        kVar8 = kVar13;
                    }
                } else {
                    if (i12 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    cVar3 = hVar2.f76063w;
                    x8.k kVar14 = hVar2.f76062v;
                    q qVar7 = hVar2.f76061u;
                    k kVar15 = hVar2.f76060t;
                    ResultKt.b(obj);
                    kVar4 = kVar15;
                    kVar6 = kVar14;
                    qVar3 = qVar7;
                    try {
                        lVar = (l) obj;
                        if (!(lVar instanceof r)) {
                            r rVar = (r) lVar;
                            z8.b bVar2 = kVar6.f95328c;
                            kVar4.getClass();
                            x8.k kVar16 = rVar.f95368b;
                            Drawable drawable = rVar.f95367a;
                            if (bVar2 instanceof b9.g) {
                                b9.f fVarA = kVar16.f95332g.a((b9.g) bVar2, rVar);
                                if (fVarA instanceof b9.d) {
                                    bVar2.g(drawable);
                                    cVar3.getClass();
                                    jVar = kVar16.f95329d;
                                    if (jVar != null) {
                                    }
                                } else {
                                    cVar3.getClass();
                                    fVarA.a();
                                    cVar3.getClass();
                                    jVar = kVar16.f95329d;
                                    if (jVar != null) {
                                    }
                                }
                            } else {
                                if (bVar2 != null) {
                                    bVar2.g(drawable);
                                }
                                cVar3.getClass();
                                jVar = kVar16.f95329d;
                                if (jVar != null) {
                                    jVar.b(rVar);
                                }
                            }
                        } else if (lVar instanceof x8.e) {
                            z8.b bVar3 = kVar6.f95328c;
                            kVar4.getClass();
                            c((x8.e) lVar, bVar3, cVar3);
                        }
                        return lVar;
                    } catch (Throwable th5) {
                        th = th5;
                        cVar4 = cVar3;
                        kVar5 = kVar6;
                        qVar2 = qVar3;
                        kVar8 = kVar4;
                        r22 = cVar4;
                        r32 = kVar5;
                        r42 = qVar2;
                        if (th instanceof CancellationException) {
                        }
                    }
                }
            } catch (Throwable th6) {
                th = th6;
                r22 = kVar8;
                kVar8 = -2147483648;
                r32 = i12;
                r42 = kVar9;
            }
        } else {
            ResultKt.b(obj);
            i50.c cVar8 = kVar8.f76079e;
            r1 r1VarN = m0.n(hVar2.getContext());
            cVar8.getClass();
            u uVar = kVar9.f95341r;
            z8.b bVar4 = kVar9.f95328c;
            q tVar = bVar4 instanceof z8.c ? new t((k) cVar8.f61379b, kVar9, (z8.c) bVar4, uVar, r1VarN) : new x8.a(uVar, r1VarN);
            tVar.p();
            x8.i iVarA = x8.k.a(kVar2);
            iVarA.f95305b = kVar8.f76076b;
            iVarA.f95325x = 0;
            x8.k kVarA = iVarA.a();
            c cVar9 = c.f76052a;
            try {
                if (kVarA.f95327b == x8.m.f95350b) {
                    throw new NullRequestDataException();
                }
                tVar.start();
                cVar = cVar9;
                kVar7 = kVarA;
                qVar4 = tVar;
                if (i5 == 0) {
                    u uVar2 = kVarA.f95341r;
                    hVar2.f76060t = kVar8;
                    hVar2.f76061u = tVar;
                    hVar2.f76062v = kVarA;
                    hVar2.f76063w = cVar9;
                    hVar2.A = 1;
                    cVar = cVar9;
                    kVar7 = kVarA;
                    qVar4 = tVar;
                    if (c9.d.a(uVar2, hVar2) != coroutineSingletons) {
                        if (((v8.b) kVar8.f76077c.getValue()) != null) {
                        }
                        Drawable drawableB2 = c9.e.b(kVar7, kVar7.f95345v, kVar7.f95344u, kVar7.f95349z.f95289j);
                        bVar = kVar7.f95328c;
                        if (bVar != null) {
                        }
                        cVar.getClass();
                        y8.g gVar2 = kVar7.f95342s;
                        hVar2.f76060t = kVar8;
                        hVar2.f76061u = qVar4;
                        hVar2.f76062v = kVar7;
                        hVar2.f76063w = cVar;
                        hVar2.f76064x = null;
                        hVar2.A = 2;
                        objA = gVar2.a(hVar2);
                        if (objA != coroutineSingletons) {
                        }
                    }
                    return coroutineSingletons;
                }
            } catch (Throwable th7) {
                th = th7;
                r22 = cVar9;
                r32 = kVarA;
                r42 = tVar;
            }
        }
        try {
            if (th instanceof CancellationException) {
                kVar8.getClass();
                r22.getClass();
                x8.j jVar2 = r32.f95329d;
                throw th;
            }
            kVar8.f76079e.getClass();
            x8.e eVarI = i50.c.i(r32, th);
            c(eVarI, r32.f95328c, r22);
            return eVarI;
        } finally {
            r42.s();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void c(x8.e eVar, z8.b bVar, c cVar) {
        x8.k kVar = eVar.f95300b;
        Drawable drawable = eVar.f95299a;
        if (bVar instanceof b9.g) {
            b9.f fVarA = kVar.f95332g.a((b9.g) bVar, eVar);
            if (!(fVarA instanceof b9.d)) {
                cVar.getClass();
                fVarA.a();
            }
        } else if (bVar != null) {
            bVar.u(drawable);
        }
        cVar.getClass();
        x8.j jVar = kVar.f95329d;
    }

    public final x8.d b(x8.k kVar) {
        m0.e(this.f76078d, null, new g(this, kVar, null, 0), 3);
        z8.b bVar = kVar.f95328c;
        return bVar instanceof z8.c ? c9.g.c(((z8.c) bVar).c()).b() : new x8.m(1);
    }
}
