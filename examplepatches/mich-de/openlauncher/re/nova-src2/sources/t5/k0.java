package t5;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class k0 implements k1 {

    /* renamed from: a, reason: collision with root package name */
    public final File f88632a;

    /* renamed from: b, reason: collision with root package name */
    public final c1 f88633b;

    /* renamed from: c, reason: collision with root package name */
    public final p0 f88634c;

    /* renamed from: d, reason: collision with root package name */
    public final c3.c1 f88635d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f88636e;

    /* renamed from: f, reason: collision with root package name */
    public final c80.d f88637f;

    public k0(File file, c1 serializer, p0 coordinator, c3.c1 c1Var) {
        Intrinsics.g(serializer, "serializer");
        Intrinsics.g(coordinator, "coordinator");
        this.f88632a = file;
        this.f88633b = serializer;
        this.f88634c = coordinator;
        this.f88635d = c1Var;
        this.f88636e = new AtomicBoolean(false);
        this.f88637f = new c80.d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x007a A[Catch: all -> 0x007b, TRY_ENTER, TRY_LEAVE, TryCatch #1 {all -> 0x007b, blocks: (B:33:0x007a, B:42:0x008b, B:41:0x0088, B:38:0x0083), top: B:52:0x0020, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v13, types: [t5.k0] */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, t5.i0] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4, types: [t5.k0] */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r8v0, types: [t5.o] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v15, types: [boolean] */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v6 */
    /* JADX WARN: Type inference failed for: r8v8 */
    @Override // t5.k1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(o oVar, ContinuationImpl continuationImpl) throws Throwable {
        ?? i0Var;
        Throwable th2;
        f0 f0Var;
        boolean z11;
        k0 k0Var;
        if (continuationImpl instanceof i0) {
            i0 i0Var2 = (i0) continuationImpl;
            int i5 = i0Var2.f88612y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i0Var2.f88612y = i5 - Integer.MIN_VALUE;
                i0Var = i0Var2;
            } else {
                i0Var = new i0(this, continuationImpl);
            }
        }
        Object obj = i0Var.f88610w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = i0Var.f88612y;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                oVar = i0Var.f88609v;
                f0Var = i0Var.f88608u;
                i0Var = i0Var.f88607t;
                try {
                    ResultKt.b(obj);
                    k0Var = i0Var;
                    z11 = oVar;
                    try {
                        f0Var.close();
                        th = null;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                    if (th == null) {
                        throw th;
                    }
                    if (z11) {
                        k0Var.f88637f.g(null);
                    }
                    return obj;
                } catch (Throwable th4) {
                    th2 = th4;
                    try {
                        f0Var.close();
                    } catch (Throwable th5) {
                        ExceptionsKt.a(th2, th5);
                    }
                    throw th2;
                }
            }
            ResultKt.b(obj);
            if (this.f88636e.get()) {
                throw new IllegalStateException("StorageConnection has already been disposed.");
            }
            boolean zF = this.f88637f.f();
            try {
                f0 f0Var2 = new f0(this.f88632a, this.f88633b);
                try {
                    Boolean boolValueOf = Boolean.valueOf(zF);
                    i0Var.f88607t = this;
                    i0Var.f88608u = f0Var2;
                    i0Var.f88609v = zF;
                    i0Var.f88612y = 1;
                    Object objInvoke = oVar.invoke(f0Var2, boolValueOf, i0Var);
                    if (objInvoke == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    obj = objInvoke;
                    z11 = zF;
                    k0Var = this;
                    f0Var = f0Var2;
                    f0Var.close();
                    th = null;
                    if (th == null) {
                    }
                } catch (Throwable th6) {
                    th2 = th6;
                    oVar = zF;
                    i0Var = this;
                    f0Var = f0Var2;
                    f0Var.close();
                    throw th2;
                }
            } catch (Throwable th7) {
                th = th7;
                oVar = zF;
                i0Var = this;
                if (oVar != 0) {
                }
                throw th;
            }
        } catch (Throwable th8) {
            th = th8;
            if (oVar != 0) {
                i0Var.f88637f.g(null);
            }
            throw th;
        }
    }

    @Override // t5.k1
    public final p0 c() {
        return this.f88634c;
    }

    @Override // t5.a
    public final void close() {
        this.f88636e.set(true);
        this.f88635d.invoke();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00dc A[Catch: all -> 0x011c, IOException -> 0x011e, TRY_ENTER, TryCatch #6 {all -> 0x011c, blocks: (B:44:0x00dc, B:46:0x00e2, B:48:0x00e5, B:53:0x00fb, B:54:0x011b, B:59:0x0121, B:62:0x012b, B:71:0x013a, B:73:0x0140, B:74:0x0143, B:69:0x0138, B:68:0x0135, B:33:0x0096, B:34:0x00b2), top: B:91:0x0096 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x012b A[Catch: all -> 0x011c, IOException -> 0x011e, TRY_ENTER, TRY_LEAVE, TryCatch #6 {all -> 0x011c, blocks: (B:44:0x00dc, B:46:0x00e2, B:48:0x00e5, B:53:0x00fb, B:54:0x011b, B:59:0x0121, B:62:0x012b, B:71:0x013a, B:73:0x0140, B:74:0x0143, B:69:0x0138, B:68:0x0135, B:33:0x0096, B:34:0x00b2), top: B:91:0x0096 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Override // t5.k1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(b0 b0Var, ContinuationImpl continuationImpl) throws IOException {
        j0 j0Var;
        File file;
        k0 k0Var;
        c80.a aVar;
        Function2 function2;
        m0 m0Var;
        Throwable th2;
        m0 m0Var2;
        File file2;
        k0 k0Var2;
        if (continuationImpl instanceof j0) {
            j0Var = (j0) continuationImpl;
            int i5 = j0Var.f88627z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j0Var.f88627z = i5 - Integer.MIN_VALUE;
            } else {
                j0Var = new j0(this, continuationImpl);
            }
        }
        Object obj = j0Var.f88625x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j0Var.f88627z;
        boolean z11 = true;
        try {
            try {
                try {
                    try {
                        if (i11 == 0) {
                            ResultKt.b(obj);
                            if (this.f88636e.get()) {
                                throw new IllegalStateException("StorageConnection has already been disposed.");
                            }
                            File file3 = this.f88632a;
                            File parentFile = file3.getCanonicalFile().getParentFile();
                            if (parentFile != null) {
                                parentFile.mkdirs();
                                if (!parentFile.isDirectory()) {
                                    throw new IOException(h6.c1.q(file3, "Unable to create parent directories of "));
                                }
                            }
                            j0Var.f88621t = this;
                            j0Var.f88622u = b0Var;
                            c80.d dVar = this.f88637f;
                            j0Var.f88623v = dVar;
                            j0Var.f88627z = 1;
                            if (dVar.e(j0Var) != coroutineSingletons) {
                                k0Var = this;
                                aVar = dVar;
                                function2 = b0Var;
                            }
                            return coroutineSingletons;
                        }
                        if (i11 != 1) {
                            if (i11 != 2) {
                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            m0Var2 = j0Var.f88624w;
                            file2 = (File) j0Var.f88623v;
                            aVar = (c80.a) j0Var.f88622u;
                            k0Var2 = j0Var.f88621t;
                            try {
                                ResultKt.b(obj);
                                Unit unit = Unit.f71706a;
                                try {
                                    m0Var2.close();
                                    th = null;
                                } catch (Throwable th3) {
                                    th = th3;
                                }
                                if (th == null) {
                                    throw th;
                                }
                                if (file2.exists()) {
                                    try {
                                        Files.move(file2.toPath(), k0Var2.f88632a.toPath(), StandardCopyOption.REPLACE_EXISTING);
                                    } catch (IOException unused) {
                                        z11 = false;
                                    }
                                    if (!z11) {
                                        throw new IOException("Unable to rename " + file2 + " to " + k0Var2.f88632a + ". This likely means that there are multiple instances of DataStore for this file. Ensure that you are only creating a single instance of datastore for this file.");
                                    }
                                }
                                Unit unit2 = Unit.f71706a;
                                ((c80.d) aVar).g(null);
                                return Unit.f71706a;
                            } catch (Throwable th4) {
                                th2 = th4;
                                try {
                                    m0Var2.close();
                                } catch (Throwable th5) {
                                    ExceptionsKt.a(th2, th5);
                                }
                                throw th2;
                            }
                        }
                        c80.a aVar2 = (c80.a) j0Var.f88623v;
                        Function2 function22 = (Function2) j0Var.f88622u;
                        k0Var = j0Var.f88621t;
                        ResultKt.b(obj);
                        aVar = aVar2;
                        function2 = function22;
                        j0Var.f88621t = k0Var;
                        j0Var.f88622u = aVar;
                        j0Var.f88623v = file;
                        j0Var.f88624w = m0Var;
                        j0Var.f88627z = 2;
                        if (function2.invoke(m0Var, j0Var) != coroutineSingletons) {
                            file2 = file;
                            k0Var2 = k0Var;
                            m0Var2 = m0Var;
                            Unit unit3 = Unit.f71706a;
                            m0Var2.close();
                            th = null;
                            if (th == null) {
                            }
                        }
                        return coroutineSingletons;
                    } catch (Throwable th6) {
                        th2 = th6;
                        m0Var2 = m0Var;
                        m0Var2.close();
                        throw th2;
                    }
                    c1 serializer = k0Var.f88633b;
                    Intrinsics.g(serializer, "serializer");
                    m0Var = new m0(file, serializer);
                } catch (IOException e3) {
                    e = e3;
                    if (file.exists()) {
                        file.delete();
                    }
                    throw e;
                }
                file = new File(k0Var.f88632a.getAbsolutePath() + ".tmp");
            } catch (Throwable th7) {
                ((c80.d) aVar).g(null);
                throw th7;
            }
        } catch (IOException e11) {
            e = e11;
            file = coroutineSingletons;
        }
    }
}
