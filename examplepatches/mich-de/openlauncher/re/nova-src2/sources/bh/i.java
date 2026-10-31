package bh;

import android.os.Looper;
import android.view.Choreographer;
import c3.g1;

/* loaded from: classes.dex */
public final class i extends ThreadLocal {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17907a;

    public /* synthetic */ i(int i5) {
        this.f17907a = i5;
    }

    @Override // java.lang.ThreadLocal
    public final Object initialValue() {
        switch (this.f17907a) {
            case 0:
                return 0L;
            case 1:
                Choreographer choreographer = Choreographer.getInstance();
                Looper looperMyLooper = Looper.myLooper();
                if (looperMyLooper == null) {
                    throw new IllegalStateException("no Looper on this thread");
                }
                g1 g1Var = new g1(choreographer, w20.e.g(looperMyLooper));
                return g1Var.plus(g1Var.f19297l);
            default:
                return new char[256];
        }
    }
}
