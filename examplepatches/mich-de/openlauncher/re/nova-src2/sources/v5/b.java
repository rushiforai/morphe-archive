package v5;

import java.io.Closeable;
import java.io.FileNotFoundException;
import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import m90.d0;
import m90.m;
import m90.z;
import t5.a1;
import t5.c1;
import t5.o;

/* loaded from: classes2.dex */
public class b implements a1 {

    /* renamed from: a, reason: collision with root package name */
    public final m f92063a;

    /* renamed from: b, reason: collision with root package name */
    public final z f92064b;

    /* renamed from: c, reason: collision with root package name */
    public final q.c f92065c;

    /* renamed from: d, reason: collision with root package name */
    public final il.a f92066d;

    public b(m fileSystem, z path, q.c cVar) {
        Intrinsics.g(fileSystem, "fileSystem");
        Intrinsics.g(path, "path");
        this.f92063a = fileSystem;
        this.f92064b = path;
        this.f92065c = cVar;
        this.f92066d = new il.a(1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:54:0x00cf, code lost:
    
        if (r9 == r1) goto L55;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00a0 A[Catch: FileNotFoundException -> 0x009a, TryCatch #8 {FileNotFoundException -> 0x009a, blocks: (B:48:0x00a0, B:49:0x00a4, B:44:0x0096, B:41:0x0091), top: B:83:0x0091, inners: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00a4 A[Catch: FileNotFoundException -> 0x009a, TRY_LEAVE, TryCatch #8 {FileNotFoundException -> 0x009a, blocks: (B:48:0x00a0, B:49:0x00a4, B:44:0x0096, B:41:0x0091), top: B:83:0x0091, inners: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0080 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0091 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r8v0, types: [java.lang.Object, v5.b] */
    /* JADX WARN: Type inference failed for: r8v1, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v19, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r8v24 */
    /* JADX WARN: Type inference failed for: r8v25 */
    /* JADX WARN: Type inference failed for: r8v6, types: [v5.b] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object f(b bVar, ContinuationImpl continuationImpl) throws Throwable {
        a aVar;
        b bVar2;
        d0 d0Var;
        Throwable th2;
        Object from;
        m mVar;
        z zVar;
        Throwable th3;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f92062x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f92062x = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(bVar, continuationImpl);
            }
        }
        Object from2 = aVar.f92060v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f92062x;
        Throwable th4 = null;
        try {
            if (i11 == 0) {
                ResultKt.b(from2);
                if (bVar.f92066d.f61637a.get()) {
                    throw new IllegalStateException("This scope has already been closed.");
                }
                try {
                    d0 d0VarR = x7.f.r(bVar.f92063a.n(bVar.f92064b));
                    try {
                        q.c cVar = bVar.f92065c;
                        aVar.f92058t = bVar;
                        aVar.f92059u = d0VarR;
                        aVar.f92062x = 1;
                        from = ((c1) cVar.f83189b).readFrom(new a60.b(d0VarR, 5), aVar);
                    } catch (Throwable th5) {
                        bVar2 = bVar;
                        d0Var = d0VarR;
                        th2 = th5;
                        if (d0Var != null) {
                        }
                        th3 = th2;
                        from2 = null;
                        if (th3 == null) {
                        }
                    }
                    if (from != coroutineSingletons) {
                        d0Var = d0VarR;
                        from2 = from;
                        if (d0Var == null) {
                        }
                        if (th3 == null) {
                        }
                    }
                } catch (FileNotFoundException unused) {
                    mVar = bVar.f92063a;
                    c1 c1Var = (c1) bVar.f92065c.f83189b;
                    zVar = bVar.f92064b;
                    if (mVar.g(zVar)) {
                        return c1Var.getDefaultValue();
                    }
                    d0 d0VarR2 = x7.f.r(bVar.f92063a.n(zVar));
                    aVar.f92058t = d0VarR2;
                    aVar.f92059u = null;
                    aVar.f92062x = 2;
                    from2 = c1Var.readFrom(new a60.b(d0VarR2, 5), aVar);
                    bVar = d0VarR2;
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                d0Var = aVar.f92059u;
                bVar2 = (b) aVar.f92058t;
                try {
                    ResultKt.b(from2);
                    if (d0Var == null) {
                        try {
                            d0Var.close();
                            th3 = null;
                        } catch (Throwable th6) {
                            th3 = th6;
                        }
                    } else {
                        th3 = null;
                    }
                } catch (Throwable th7) {
                    th2 = th7;
                    if (d0Var != null) {
                        try {
                            try {
                                d0Var.close();
                            } catch (Throwable th8) {
                                ExceptionsKt.a(th2, th8);
                            }
                        } catch (FileNotFoundException unused2) {
                            bVar = bVar2;
                            mVar = bVar.f92063a;
                            c1 c1Var2 = (c1) bVar.f92065c.f83189b;
                            zVar = bVar.f92064b;
                            if (mVar.g(zVar)) {
                            }
                        }
                    }
                    th3 = th2;
                    from2 = null;
                    if (th3 == null) {
                    }
                }
                if (th3 == null) {
                    throw th3;
                }
                Intrinsics.d(from2);
                return from2;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Closeable closeable = (Closeable) aVar.f92058t;
            ResultKt.b(from2);
            bVar = closeable;
            if (bVar != 0) {
                try {
                    bVar.close();
                } catch (Throwable th9) {
                    th4 = th9;
                }
            }
        } catch (Throwable th10) {
            if (bVar != 0) {
                try {
                    bVar.close();
                } catch (Throwable th11) {
                    ExceptionsKt.a(th10, th11);
                }
            }
            th4 = th10;
            from2 = null;
        }
        if (th4 != null) {
            throw th4;
        }
        Intrinsics.d(from2);
        return from2;
    }

    @Override // t5.a
    public final void close() {
        this.f92066d.f61637a.set(true);
    }

    @Override // t5.a1
    public final Object e(o oVar) {
        return f(this, oVar);
    }
}
