package a90;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f509a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f510b;

    /* renamed from: c, reason: collision with root package name */
    public c f511c;

    /* renamed from: d, reason: collision with root package name */
    public long f512d;

    public a(String name, boolean z11) {
        Intrinsics.g(name, "name");
        this.f509a = name;
        this.f510b = z11;
        this.f512d = -1L;
    }

    public abstract long a();

    public final String toString() {
        return this.f509a;
    }
}
