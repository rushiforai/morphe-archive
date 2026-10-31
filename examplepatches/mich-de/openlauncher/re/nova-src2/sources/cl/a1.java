package cl;

import java.util.concurrent.locks.AbstractOwnableSynchronizer;

/* loaded from: classes3.dex */
public final class a1 extends AbstractOwnableSynchronizer implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f19981a;

    public a1(c1 c1Var) {
        this.f19981a = c1Var;
    }

    public static void a(a1 a1Var, Thread thread) {
        a1Var.setExclusiveOwnerThread(thread);
    }

    @Override // java.lang.Runnable
    public final void run() {
    }

    public final String toString() {
        return this.f19981a.toString();
    }
}
