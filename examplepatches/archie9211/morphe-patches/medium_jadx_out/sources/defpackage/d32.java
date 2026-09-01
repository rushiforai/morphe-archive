package defpackage;

import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class d32 extends oqb {
    public static final b32 b;
    public static final zmb c;
    public static final int d;
    public static final c32 e;
    public final AtomicReference a;

    static {
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        int iIntValue = Integer.getInteger("rx2.computation-threads", 0).intValue();
        if (iIntValue > 0 && iIntValue <= iAvailableProcessors) {
            iAvailableProcessors = iIntValue;
        }
        d = iAvailableProcessors;
        c32 c32Var = new c32(new zmb("RxComputationShutdown"));
        e = c32Var;
        c32Var.dispose();
        zmb zmbVar = new zmb(Math.max(1, Math.min(10, Integer.getInteger("rx2.computation-priority", 5).intValue())), "RxComputationThreadPool", true);
        c = zmbVar;
        b32 b32Var = new b32(0, zmbVar);
        b = b32Var;
        for (c32 c32Var2 : b32Var.b) {
            c32Var2.dispose();
        }
    }

    public d32() {
        b32 b32Var = b;
        AtomicReference atomicReference = new AtomicReference(b32Var);
        this.a = atomicReference;
        b32 b32Var2 = new b32(d, c);
        while (!atomicReference.compareAndSet(b32Var, b32Var2)) {
            if (atomicReference.get() != b32Var) {
                for (c32 c32Var : b32Var2.b) {
                    c32Var.dispose();
                }
                return;
            }
        }
    }

    @Override // defpackage.oqb
    public final nqb a() {
        c32 c32Var;
        b32 b32Var = (b32) this.a.get();
        int i = b32Var.a;
        if (i == 0) {
            c32Var = e;
        } else {
            c32[] c32VarArr = b32Var.b;
            long j = b32Var.c;
            b32Var.c = 1 + j;
            c32Var = c32VarArr[(int) (j % ((long) i))];
        }
        return new a32(c32Var);
    }

    @Override // defpackage.oqb
    public final sh3 b(p0g p0gVar) {
        c32 c32Var;
        b32 b32Var = (b32) this.a.get();
        int i = b32Var.a;
        if (i == 0) {
            c32Var = e;
        } else {
            c32[] c32VarArr = b32Var.b;
            long j = b32Var.c;
            b32Var.c = 1 + j;
            c32Var = c32VarArr[(int) (j % ((long) i))];
        }
        c32Var.getClass();
        kqb kqbVar = new kqb(p0gVar);
        try {
            kqbVar.a(c32Var.a.submit(kqbVar));
            return kqbVar;
        } catch (RejectedExecutionException e2) {
            ok7.H(e2);
            return ay3.INSTANCE;
        }
    }
}
