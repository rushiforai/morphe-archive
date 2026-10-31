package t5;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public class f0 implements a1 {

    /* renamed from: a, reason: collision with root package name */
    public final File f88581a;

    /* renamed from: b, reason: collision with root package name */
    public final c1 f88582b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f88583c;

    public f0(File file, c1 serializer) {
        Intrinsics.g(serializer, "serializer");
        this.f88581a = file;
        this.f88582b = serializer;
        this.f88583c = new AtomicBoolean(false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v11, types: [t5.f0] */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object f(f0 f0Var, ContinuationImpl continuationImpl) {
        e0 e0Var;
        Throwable th2;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2;
        Throwable th3;
        if (continuationImpl instanceof e0) {
            e0Var = (e0) continuationImpl;
            int i5 = e0Var.f88576x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.f88576x = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new e0(f0Var, continuationImpl);
            }
        }
        Object obj = e0Var.f88574v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r22 = e0Var.f88576x;
        try {
        } catch (FileNotFoundException unused) {
            f0Var = r22;
        }
        if (r22 != 0) {
            if (r22 == 1) {
                fileInputStream2 = e0Var.f88573u;
                r22 = (f0) e0Var.f88572t;
                try {
                    ResultKt.b(obj);
                    CloseableKt.a(fileInputStream2, null);
                    return obj;
                } catch (Throwable th4) {
                    th3 = th4;
                    try {
                        throw th2;
                    } finally {
                    }
                }
            }
            if (r22 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fileInputStream = (Closeable) e0Var.f88572t;
            try {
                ResultKt.b(obj);
                CloseableKt.a(fileInputStream, null);
                return obj;
            } catch (Throwable th5) {
                th2 = th5;
                try {
                    throw th2;
                } finally {
                }
            }
        }
        ResultKt.b(obj);
        if (f0Var.f88583c.get()) {
            throw new IllegalStateException("This scope has already been closed.");
        }
        try {
            FileInputStream fileInputStream3 = new FileInputStream(f0Var.f88581a);
            try {
                c1 c1Var = f0Var.f88582b;
                e0Var.f88572t = f0Var;
                e0Var.f88573u = fileInputStream3;
                e0Var.f88576x = 1;
                Object from = c1Var.readFrom(fileInputStream3, e0Var);
                if (from != coroutineSingletons) {
                    fileInputStream2 = fileInputStream3;
                    obj = from;
                    CloseableKt.a(fileInputStream2, null);
                    return obj;
                }
            } catch (Throwable th6) {
                r22 = f0Var;
                fileInputStream2 = fileInputStream3;
                th3 = th6;
                throw th2;
            }
        } catch (FileNotFoundException unused2) {
            File file = f0Var.f88581a;
            c1 c1Var2 = f0Var.f88582b;
            if (!file.exists()) {
                return c1Var2.getDefaultValue();
            }
            FileInputStream fileInputStream4 = new FileInputStream(f0Var.f88581a);
            try {
                e0Var.f88572t = fileInputStream4;
                e0Var.f88573u = null;
                e0Var.f88576x = 2;
                Object from2 = c1Var2.readFrom(fileInputStream4, e0Var);
                if (from2 != coroutineSingletons) {
                    obj = from2;
                    fileInputStream = fileInputStream4;
                    CloseableKt.a(fileInputStream, null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th7) {
                th2 = th7;
                fileInputStream = fileInputStream4;
                throw th2;
            }
        }
        return coroutineSingletons;
    }

    @Override // t5.a
    public final void close() {
        this.f88583c.set(true);
    }

    @Override // t5.a1
    public final Object e(o oVar) {
        return f(this, oVar);
    }
}
