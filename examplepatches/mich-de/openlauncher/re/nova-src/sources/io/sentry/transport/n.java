package io.sentry.transport;

import java.util.concurrent.locks.AbstractQueuedSynchronizer;

/* loaded from: classes4.dex */
public final class n extends AbstractQueuedSynchronizer {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f67819a = 0;

    public n() {
        setState(0);
    }

    public static int a(n nVar) {
        return nVar.getState();
    }

    public static void b(n nVar) {
        int state;
        do {
            state = nVar.getState();
        } while (!nVar.compareAndSetState(state, state + 1));
    }

    @Override // java.util.concurrent.locks.AbstractQueuedSynchronizer
    public final int tryAcquireShared(int i5) {
        return getState() == 0 ? 1 : -1;
    }

    @Override // java.util.concurrent.locks.AbstractQueuedSynchronizer
    public final boolean tryReleaseShared(int i5) {
        int state;
        int i11;
        do {
            state = getState();
            if (state == 0) {
                return false;
            }
            i11 = state - 1;
        } while (!compareAndSetState(state, i11));
        return i11 == 0;
    }
}
