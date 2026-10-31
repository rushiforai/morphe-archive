package v;

import android.os.Looper;
import h6.f1;
import h6.m0;

/* loaded from: classes2.dex */
public class d extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public br.a f91813a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f91814b;

    /* renamed from: c, reason: collision with root package name */
    public m0 f91815c;

    /* renamed from: d, reason: collision with root package name */
    public m0 f91816d;

    /* renamed from: e, reason: collision with root package name */
    public m0 f91817e;

    /* renamed from: f, reason: collision with root package name */
    public m0 f91818f;

    /* renamed from: g, reason: collision with root package name */
    public m0 f91819g;

    /* renamed from: h, reason: collision with root package name */
    public m0 f91820h;

    /* renamed from: i, reason: collision with root package name */
    public int f91821i = 0;

    /* renamed from: j, reason: collision with root package name */
    public m0 f91822j;

    /* renamed from: k, reason: collision with root package name */
    public m0 f91823k;

    public static void g(m0 m0Var, Object obj) {
        if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
            m0Var.j(obj);
        } else {
            m0Var.k(obj);
        }
    }

    public final void e(CharSequence charSequence) {
        if (this.f91823k == null) {
            this.f91823k = new m0();
        }
        g(this.f91823k, charSequence);
    }

    public final void f(int i5) {
        if (this.f91822j == null) {
            this.f91822j = new m0();
        }
        g(this.f91822j, Integer.valueOf(i5));
    }
}
