package ads_mobile_sdk;

import android.os.Handler;
import android.os.Looper;
import b.bd;
import bt.f;

/* loaded from: classes2.dex */
public final class p72 implements bd {

    /* renamed from: f, reason: collision with root package name */
    public static p72 f8122f;

    /* renamed from: a, reason: collision with root package name */
    public float f8123a = 0.0f;

    /* renamed from: c, reason: collision with root package name */
    public final f f8124c;

    /* renamed from: d, reason: collision with root package name */
    public si0 f8125d;

    /* renamed from: e, reason: collision with root package name */
    public n6 f8126e;

    public p72(f fVar, f fVar2) {
        this.f8124c = fVar2;
    }

    @Override // b.bd
    public final void a(boolean z11) {
        if (!z11) {
            tj3.f9961g.getClass();
            Handler handler = tj3.f9963i;
            if (handler != null) {
                handler.removeCallbacks(tj3.f9965k);
                tj3.f9963i = null;
                return;
            }
            return;
        }
        tj3.f9961g.getClass();
        if (tj3.f9963i == null) {
            Handler handler2 = new Handler(Looper.getMainLooper());
            tj3.f9963i = handler2;
            handler2.post(tj3.f9964j);
            tj3.f9963i.postDelayed(tj3.f9965k, 200L);
        }
    }

    public static p72 a() {
        if (f8122f == null) {
            f8122f = new p72(new f(28), new f(27));
        }
        return f8122f;
    }
}
