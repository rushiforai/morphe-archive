package v5;

import java.io.IOException;
import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import m90.m;
import m90.z;
import t5.b0;
import t5.k1;
import t5.o;
import t5.p0;

/* loaded from: classes2.dex */
public final class h implements k1 {

    /* renamed from: a, reason: collision with root package name */
    public final m f92090a;

    /* renamed from: b, reason: collision with root package name */
    public final z f92091b;

    /* renamed from: c, reason: collision with root package name */
    public final q.c f92092c;

    /* renamed from: d, reason: collision with root package name */
    public final p0 f92093d;

    /* renamed from: e, reason: collision with root package name */
    public final d f92094e;

    /* renamed from: f, reason: collision with root package name */
    public final il.a f92095f;

    /* renamed from: g, reason: collision with root package name */
    public final c80.d f92096g;

    public h(m fileSystem, z path, q.c cVar, p0 coordinator, d dVar) {
        Intrinsics.g(fileSystem, "fileSystem");
        Intrinsics.g(path, "path");
        Intrinsics.g(coordinator, "coordinator");
        this.f92090a = fileSystem;
        this.f92091b = path;
        this.f92092c = cVar;
        this.f92093d = coordinator;
        this.f92094e = dVar;
        this.f92095f = new il.a(1);
        this.f92096g = new c80.d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x007e A[Catch: all -> 0x007f, TRY_ENTER, TRY_LEAVE, TryCatch #5 {all -> 0x007f, blocks: (B:33:0x007e, B:42:0x008f, B:41:0x008c, B:38:0x0087), top: B:60:0x0020, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v13, types: [v5.h] */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, v5.f] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4, types: [v5.h] */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r9v0, types: [t5.o] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v11 */
    /* JADX WARN: Type inference failed for: r9v15, types: [boolean] */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v8 */
    @Override // t5.k1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(o oVar, ContinuationImpl continuationImpl) throws Throwable {
        ?? fVar;
        Throwable th2;
        b bVar;
        boolean z11;
        h hVar;
        if (continuationImpl instanceof f) {
            f fVar2 = (f) continuationImpl;
            int i5 = fVar2.f92082y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar2.f92082y = i5 - Integer.MIN_VALUE;
                fVar = fVar2;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f92080w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f92082y;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                oVar = fVar.f92079v;
                bVar = fVar.f92078u;
                fVar = fVar.f92077t;
                try {
                    ResultKt.b(obj);
                    hVar = fVar;
                    z11 = oVar;
                    try {
                        bVar.close();
                        th = null;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                    if (th == null) {
                        throw th;
                    }
                    if (z11) {
                        hVar.f92096g.g(null);
                    }
                    return obj;
                } catch (Throwable th4) {
                    th2 = th4;
                    try {
                        bVar.close();
                    } catch (Throwable th5) {
                        ExceptionsKt.a(th2, th5);
                    }
                    throw th2;
                }
            }
            ResultKt.b(obj);
            if (this.f92095f.f61637a.get()) {
                throw new IllegalStateException("StorageConnection has already been disposed.");
            }
            boolean zF = this.f92096g.f();
            try {
                b bVar2 = new b(this.f92090a, this.f92091b, this.f92092c);
                try {
                    Boolean boolValueOf = Boolean.valueOf(zF);
                    fVar.f92077t = this;
                    fVar.f92078u = bVar2;
                    fVar.f92079v = zF;
                    fVar.f92082y = 1;
                    Object objInvoke = oVar.invoke(bVar2, boolValueOf, fVar);
                    if (objInvoke == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    obj = objInvoke;
                    z11 = zF;
                    hVar = this;
                    bVar = bVar2;
                    bVar.close();
                    th = null;
                    if (th == null) {
                    }
                } catch (Throwable th6) {
                    th2 = th6;
                    oVar = zF;
                    fVar = this;
                    bVar = bVar2;
                    bVar.close();
                    throw th2;
                }
            } catch (Throwable th7) {
                th = th7;
                oVar = zF;
                fVar = this;
                if (oVar != 0) {
                    fVar.f92096g.g(null);
                }
                throw th;
            }
        } catch (Throwable th8) {
            th = th8;
            if (oVar != 0) {
            }
            throw th;
        }
    }

    @Override // t5.k1
    public final p0 c() {
        return this.f92093d;
    }

    @Override // t5.a
    public final void close() {
        this.f92095f.f61637a.set(true);
        this.f92094e.invoke();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bd A[Catch: all -> 0x00cd, IOException -> 0x00d0, TRY_ENTER, TryCatch #5 {IOException -> 0x00d0, blocks: (B:39:0x00bd, B:41:0x00c5, B:50:0x00de, B:57:0x00ec, B:56:0x00e9), top: B:82:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00de A[Catch: all -> 0x00cd, IOException -> 0x00d0, TRY_ENTER, TRY_LEAVE, TryCatch #5 {IOException -> 0x00d0, blocks: (B:39:0x00bd, B:41:0x00c5, B:50:0x00de, B:57:0x00ec, B:56:0x00e9), top: B:82:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r0v3, types: [m90.z] */
    @Override // t5.k1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(b0 b0Var, ContinuationImpl continuationImpl) throws Throwable {
        g gVar;
        Object obj;
        h hVar;
        z zVarC;
        Function2 function2;
        m mVar;
        j jVar;
        Throwable th2;
        t5.a aVar;
        Object obj2;
        h hVar2;
        z zVar;
        z zVarG = ".tmp";
        if (continuationImpl instanceof g) {
            g gVar2 = (g) continuationImpl;
            int i5 = gVar2.f92089z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar2.f92089z = i5 - Integer.MIN_VALUE;
                gVar = gVar2;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj3 = gVar.f92087x;
        Object obj4 = CoroutineSingletons.f71806a;
        int i11 = gVar.f92089z;
        try {
            try {
                try {
                    try {
                        try {
                            if (i11 == 0) {
                                ResultKt.b(obj3);
                                if (this.f92095f.f61637a.get()) {
                                    throw new IllegalStateException("StorageConnection has already been disposed.");
                                }
                                zVarC = this.f92091b.c();
                                if (zVarC == null) {
                                    throw new IllegalStateException("must have a parent path");
                                }
                                this.f92090a.c(zVarC);
                                gVar.f92083t = this;
                                gVar.f92084u = b0Var;
                                gVar.f92085v = zVarC;
                                c80.d dVar = this.f92096g;
                                gVar.f92086w = dVar;
                                gVar.f92089z = 1;
                                if (dVar.e(gVar) != obj4) {
                                    hVar = this;
                                    function2 = b0Var;
                                    obj = dVar;
                                }
                                return obj4;
                            }
                            if (i11 != 1) {
                                if (i11 != 2) {
                                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                }
                                aVar = (t5.a) gVar.f92086w;
                                z zVar2 = gVar.f92085v;
                                obj2 = (c80.a) gVar.f92084u;
                                hVar2 = gVar.f92083t;
                                try {
                                    ResultKt.b(obj3);
                                    zVar = zVar2;
                                    Unit unit = Unit.f71706a;
                                    try {
                                        aVar.close();
                                        th = null;
                                    } catch (Throwable th3) {
                                        th = th3;
                                    }
                                    if (th == null) {
                                        throw th;
                                    }
                                    if (hVar2.f92090a.g(zVar)) {
                                        hVar2.f92090a.b(zVar, hVar2.f92091b);
                                    }
                                    Unit unit2 = Unit.f71706a;
                                    ((c80.d) obj2).g(null);
                                    return Unit.f71706a;
                                } catch (Throwable th4) {
                                    th2 = th4;
                                    try {
                                        aVar.close();
                                    } catch (Throwable th5) {
                                        ExceptionsKt.a(th2, th5);
                                    }
                                    throw th2;
                                }
                            }
                            Object obj5 = (c80.a) gVar.f92086w;
                            zVarC = gVar.f92085v;
                            Function2 function22 = (Function2) gVar.f92084u;
                            hVar = gVar.f92083t;
                            ResultKt.b(obj3);
                            obj = obj5;
                            function2 = function22;
                            gVar.f92083t = hVar;
                            gVar.f92084u = obj;
                            gVar.f92085v = zVarG;
                            gVar.f92086w = jVar;
                            gVar.f92089z = 2;
                            if (function2.invoke(jVar, gVar) != obj4) {
                                obj2 = obj;
                                aVar = jVar;
                                hVar2 = hVar;
                                zVar = zVarG;
                                Unit unit3 = Unit.f71706a;
                                aVar.close();
                                th = null;
                                if (th == null) {
                                }
                            }
                            return obj4;
                        } catch (Throwable th6) {
                            th2 = th6;
                            aVar = jVar;
                            aVar.close();
                            throw th2;
                        }
                        mVar.e(zVarG);
                        jVar = new j(mVar, zVarG, hVar.f92092c);
                    } catch (IOException e3) {
                        e = e3;
                        if (hVar.f92090a.g(zVarG)) {
                            try {
                                m mVar2 = hVar.f92090a;
                                mVar2.getClass();
                                mVar2.e(zVarG);
                            } catch (IOException unused) {
                            }
                        }
                        throw e;
                    }
                    z zVar3 = hVar.f92091b;
                    mVar = hVar.f92090a;
                    zVarG = zVarC.g(zVar3.b().concat(".tmp"));
                } catch (Throwable th7) {
                    th = th7;
                    ((c80.d) obj).g(null);
                    throw th;
                }
            } catch (IOException e11) {
                e = e11;
                hVar = gVar;
                obj = obj4;
            }
        } catch (Throwable th8) {
            th = th8;
            obj = obj4;
            ((c80.d) obj).g(null);
            throw th;
        }
    }
}
