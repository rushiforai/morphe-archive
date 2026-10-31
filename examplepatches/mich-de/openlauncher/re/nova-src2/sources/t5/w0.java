package t5;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileLock;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes2.dex */
public final class w0 implements p0 {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f88731a;

    /* renamed from: b, reason: collision with root package name */
    public final File f88732b;

    /* renamed from: c, reason: collision with root package name */
    public final w70.h f88733c;

    /* renamed from: d, reason: collision with root package name */
    public final String f88734d;

    /* renamed from: e, reason: collision with root package name */
    public final String f88735e;

    /* renamed from: f, reason: collision with root package name */
    public final String f88736f;

    /* renamed from: g, reason: collision with root package name */
    public final c80.d f88737g;

    /* renamed from: h, reason: collision with root package name */
    public final a70.d f88738h;

    /* renamed from: i, reason: collision with root package name */
    public final a70.d f88739i;

    public w0(CoroutineContext context, File file) {
        Intrinsics.g(context, "context");
        Intrinsics.g(file, "file");
        this.f88731a = context;
        this.f88732b = file;
        Object obj = y0.f88753b;
        this.f88733c = u1.h(new pu.h(file, (Continuation) null, 10));
        this.f88734d = ".lock";
        this.f88735e = ".version";
        this.f88736f = "fcntl failed: EAGAIN";
        this.f88737g = new c80.d();
        this.f88738h = LazyKt.a(new t0(this, 2));
        this.f88739i = LazyKt.a(new t0(this, 1));
    }

    public static final void f(w0 w0Var, File file) {
        File parentFile = file.getCanonicalFile().getParentFile();
        if (parentFile != null) {
            parentFile.mkdirs();
            if (!parentFile.isDirectory()) {
                throw new IOException(h6.c1.q(file, "Unable to create parent directories of "));
            }
        }
        if (file.exists()) {
            return;
        }
        file.createNewFile();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00de A[Catch: all -> 0x00e2, TRY_ENTER, TRY_LEAVE, TryCatch #1 {all -> 0x00e2, blocks: (B:60:0x00de, B:72:0x00f9, B:73:0x00fc), top: B:85:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f9 A[Catch: all -> 0x00e2, TRY_ENTER, TryCatch #1 {all -> 0x00e2, blocks: (B:60:0x00de, B:72:0x00f9, B:73:0x00fc), top: B:85:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0108  */
    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, t5.v0] */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v5, types: [c80.d] */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r5v0, types: [int, java.io.Closeable] */
    @Override // t5.p0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Function2 function2, ContinuationImpl continuationImpl) throws Throwable {
        ?? v0Var;
        String message;
        FileLock fileLockTryLock;
        FileLock fileLock;
        c80.d dVar;
        boolean z11;
        FileInputStream fileInputStream;
        c80.d dVar2;
        boolean z12;
        ?? r22 = function2;
        if (continuationImpl instanceof v0) {
            v0 v0Var2 = (v0) continuationImpl;
            int i5 = v0Var2.f88723z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v0Var2.f88723z = i5 - Integer.MIN_VALUE;
                v0Var = v0Var2;
            } else {
                v0Var = new v0(this, continuationImpl);
            }
        }
        Object objInvoke = v0Var.f88721x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r52 = v0Var.f88723z;
        try {
            try {
                if (r52 != 0) {
                    if (r52 == 1) {
                        z12 = v0Var.f88720w;
                        dVar2 = v0Var.f88717t;
                        ResultKt.b(objInvoke);
                        if (z12) {
                            dVar2.g(null);
                        }
                        return objInvoke;
                    }
                    if (r52 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    z11 = v0Var.f88720w;
                    fileLock = v0Var.f88719v;
                    fileInputStream = v0Var.f88718u;
                    dVar = v0Var.f88717t;
                    try {
                        ResultKt.b(objInvoke);
                        if (fileLock != null) {
                            fileLock.release();
                        }
                        CloseableKt.a(fileInputStream, null);
                        if (z11) {
                            dVar.g(null);
                        }
                        return objInvoke;
                    } catch (Throwable th2) {
                        th = th2;
                        if (fileLock != null) {
                        }
                        throw th;
                    }
                }
                ResultKt.b(objInvoke);
                c80.d dVar3 = this.f88737g;
                boolean zF = dVar3.f();
                try {
                    if (zF) {
                        FileInputStream fileInputStream2 = new FileInputStream((File) this.f88738h.getValue());
                        try {
                            try {
                                fileLockTryLock = fileInputStream2.getChannel().tryLock(0L, Long.MAX_VALUE, true);
                            } catch (Throwable th3) {
                                th = th3;
                                fileLock = null;
                                if (fileLock != null) {
                                }
                                throw th;
                            }
                        } catch (IOException e3) {
                            String message2 = e3.getMessage();
                            if ((message2 == null || !r70.j.I0(message2, this.f88736f, false)) && ((message = e3.getMessage()) == null || !r70.j.I0(message, "Resource deadlock would occur", false))) {
                                throw e3;
                            }
                            fileLockTryLock = null;
                        }
                        try {
                            Boolean boolValueOf = Boolean.valueOf(fileLockTryLock != null);
                            v0Var.f88717t = dVar3;
                            v0Var.f88718u = fileInputStream2;
                            v0Var.f88719v = fileLockTryLock;
                            v0Var.f88720w = zF;
                            v0Var.f88723z = 2;
                            objInvoke = r22.invoke(boolValueOf, v0Var);
                            if (objInvoke != coroutineSingletons) {
                                dVar = dVar3;
                                z11 = zF;
                                fileInputStream = fileInputStream2;
                                fileLock = fileLockTryLock;
                                if (fileLock != null) {
                                }
                                CloseableKt.a(fileInputStream, null);
                                if (z11) {
                                }
                                return objInvoke;
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            fileLock = fileLockTryLock;
                            if (fileLock != null) {
                                fileLock.release();
                            }
                            throw th;
                        }
                    } else {
                        Boolean bool = Boolean.FALSE;
                        v0Var.f88717t = dVar3;
                        v0Var.f88720w = zF;
                        v0Var.f88723z = 1;
                        objInvoke = r22.invoke(bool, v0Var);
                        if (objInvoke != coroutineSingletons) {
                            dVar2 = dVar3;
                            z12 = zF;
                            if (z12) {
                            }
                            return objInvoke;
                        }
                    }
                    return coroutineSingletons;
                } catch (Throwable th5) {
                    th = th5;
                    v0Var = dVar3;
                    r22 = zF;
                    if (r22 != 0) {
                        v0Var.g(null);
                    }
                    throw th;
                }
            } catch (Throwable th6) {
                Object obj = v0Var;
                try {
                    throw th6;
                } catch (Throwable th7) {
                    try {
                        CloseableKt.a(r52, th6);
                        throw th7;
                    } catch (Throwable th8) {
                        th = th8;
                        r22 = r22;
                        v0Var = obj;
                        if (r22 != 0) {
                        }
                        throw th;
                    }
                }
            }
        } catch (Throwable th9) {
            th = th9;
        }
    }

    @Override // t5.p0
    public final w70.m b() {
        return this.f88733c;
    }

    @Override // t5.p0
    public final Object c(b0 b0Var) {
        a70.d dVar = this.f88739i;
        if (dVar.isInitialized()) {
            return new Integer(d1.f88563b.nativeIncrementAndGetCounterValue(((d1) dVar.getValue()).f88564a));
        }
        return t70.m0.y(this.f88731a, new s0(this, null, 1), b0Var);
    }

    @Override // t5.p0
    public final Object d(ContinuationImpl continuationImpl) {
        a70.d dVar = this.f88739i;
        if (dVar.isInitialized()) {
            return new Integer(d1.f88563b.nativeGetCounterValue(((d1) dVar.getValue()).f88564a));
        }
        return t70.m0.y(this.f88731a, new s0(this, null, 0), continuationImpl);
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00bb A[Catch: all -> 0x00bf, TRY_ENTER, TRY_LEAVE, TryCatch #7 {all -> 0x00bf, blocks: (B:42:0x00bb, B:56:0x00db, B:57:0x00de), top: B:78:0x0022, outer: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00db A[Catch: all -> 0x00bf, TRY_ENTER, TryCatch #7 {all -> 0x00bf, blocks: (B:42:0x00bb, B:56:0x00db, B:57:0x00de), top: B:78:0x0022, outer: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.io.Closeable, java.lang.Object, kotlin.coroutines.intrinsics.CoroutineSingletons] */
    @Override // t5.p0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(Function1 function1, ContinuationImpl continuationImpl) throws Throwable {
        u0 u0Var;
        w0 w0Var;
        FileOutputStream fileOutputStream;
        Throwable th2;
        Function1 function12;
        Closeable closeable;
        Object obj;
        Object obj2;
        FileLock fileLock;
        FileLock fileLock2;
        Object objInvoke;
        Closeable closeable2;
        Object obj3;
        Object obj4;
        if (continuationImpl instanceof u0) {
            u0Var = (u0) continuationImpl;
            int i5 = u0Var.f88710y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u0Var.f88710y = i5 - Integer.MIN_VALUE;
            } else {
                u0Var = new u0(this, continuationImpl);
            }
        }
        Object obj5 = u0Var.f88708w;
        ?? r12 = CoroutineSingletons.f71806a;
        int i11 = u0Var.f88710y;
        try {
            try {
                try {
                    if (i11 == 0) {
                        ResultKt.b(obj5);
                        u0Var.f88705t = this;
                        u0Var.f88706u = function1;
                        c80.d dVar = this.f88737g;
                        u0Var.f88707v = dVar;
                        u0Var.f88710y = 1;
                        if (dVar.e(u0Var) != r12) {
                            w0Var = this;
                            obj5 = dVar;
                        }
                        return r12;
                    }
                    if (i11 != 1) {
                        if (i11 != 2) {
                            if (i11 != 3) {
                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            fileLock = (FileLock) u0Var.f88707v;
                            closeable2 = (Closeable) u0Var.f88706u;
                            obj4 = (c80.a) u0Var.f88705t;
                            try {
                                ResultKt.b(obj5);
                                obj3 = obj5;
                                if (fileLock != null) {
                                    fileLock.release();
                                }
                                try {
                                    CloseableKt.a(closeable2, null);
                                    ((c80.d) obj4).g(null);
                                    return obj3;
                                } catch (Throwable th3) {
                                    th = th3;
                                    obj5 = obj4;
                                    ((c80.d) obj5).g(null);
                                    throw th;
                                }
                            } catch (Throwable th4) {
                                th2 = th4;
                                if (fileLock != null) {
                                }
                                throw th2;
                            }
                        }
                        closeable = (Closeable) u0Var.f88707v;
                        obj = (c80.a) u0Var.f88706u;
                        function12 = (Function1) u0Var.f88705t;
                        try {
                            ResultKt.b(obj5);
                            obj2 = obj5;
                            fileLock2 = (FileLock) obj2;
                        } catch (Throwable th5) {
                            th2 = th5;
                            fileLock = null;
                            if (fileLock != null) {
                            }
                            throw th2;
                        }
                        try {
                            u0Var.f88705t = obj;
                            u0Var.f88706u = closeable;
                            u0Var.f88707v = fileLock2;
                            u0Var.f88710y = 3;
                            objInvoke = function12.invoke(u0Var);
                            if (objInvoke != r12) {
                                closeable2 = closeable;
                                fileLock = fileLock2;
                                obj3 = objInvoke;
                                obj4 = obj;
                                if (fileLock != null) {
                                }
                                CloseableKt.a(closeable2, null);
                                ((c80.d) obj4).g(null);
                                return obj3;
                            }
                            return r12;
                        } catch (Throwable th6) {
                            fileLock = fileLock2;
                            th2 = th6;
                            if (fileLock != null) {
                            }
                            throw th2;
                        }
                    }
                    c80.a aVar = (c80.a) u0Var.f88707v;
                    Function1 function13 = (Function1) u0Var.f88706u;
                    w0Var = (w0) u0Var.f88705t;
                    ResultKt.b(obj5);
                    obj5 = aVar;
                    function1 = function13;
                    u0Var.f88705t = function1;
                    u0Var.f88706u = obj5;
                    u0Var.f88707v = fileOutputStream;
                    u0Var.f88710y = 2;
                    Object objG = br.c.g(fileOutputStream, u0Var);
                    if (objG != r12) {
                        function12 = function1;
                        closeable = fileOutputStream;
                        obj = obj5;
                        obj2 = objG;
                        fileLock2 = (FileLock) obj2;
                        u0Var.f88705t = obj;
                        u0Var.f88706u = closeable;
                        u0Var.f88707v = fileLock2;
                        u0Var.f88710y = 3;
                        objInvoke = function12.invoke(u0Var);
                        if (objInvoke != r12) {
                        }
                    }
                    return r12;
                } catch (Throwable th7) {
                    th2 = th7;
                    fileLock = null;
                    if (fileLock != null) {
                        fileLock.release();
                    }
                    throw th2;
                }
                fileOutputStream = new FileOutputStream((File) w0Var.f88738h.getValue());
            } catch (Throwable th8) {
                th = th8;
                ((c80.d) obj5).g(null);
                throw th;
            }
        } catch (Throwable th9) {
            obj5 = u0Var;
            try {
                throw th9;
            } catch (Throwable th10) {
                CloseableKt.a(r12, th9);
                throw th10;
            }
        }
    }
}
