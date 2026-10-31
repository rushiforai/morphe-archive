package androidx.fragment.app;

import android.view.ViewGroup;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class c2 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f14505a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f14506b;

    public boolean a() {
        return this instanceof i;
    }

    public abstract void b(ViewGroup viewGroup);

    public abstract void c(ViewGroup viewGroup);

    public void d(g.b backEvent, ViewGroup container) {
        Intrinsics.g(backEvent, "backEvent");
        Intrinsics.g(container, "container");
    }

    public void e(ViewGroup container) {
        Intrinsics.g(container, "container");
    }
}
