package androidx.fragment.app;

import android.os.Handler;

/* loaded from: classes.dex */
public abstract class s0 extends p0 {

    /* renamed from: a, reason: collision with root package name */
    public final m0 f14681a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f14682b;

    /* renamed from: c, reason: collision with root package name */
    public final Handler f14683c;

    /* renamed from: d, reason: collision with root package name */
    public final i1 f14684d;

    public s0(m0 m0Var) {
        Handler handler = new Handler();
        this.f14681a = m0Var;
        this.f14682b = m0Var;
        this.f14683c = handler;
        this.f14684d = new i1();
    }
}
