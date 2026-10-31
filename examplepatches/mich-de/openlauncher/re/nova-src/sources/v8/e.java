package v8;

import java.lang.ref.WeakReference;
import java.util.Map;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f92211a;

    /* renamed from: b, reason: collision with root package name */
    public final WeakReference f92212b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f92213c;

    /* renamed from: d, reason: collision with root package name */
    public final int f92214d;

    public e(int i5, WeakReference weakReference, Map map, int i11) {
        this.f92211a = i5;
        this.f92212b = weakReference;
        this.f92213c = map;
        this.f92214d = i11;
    }

    public final WeakReference a() {
        return this.f92212b;
    }

    public final Map b() {
        return this.f92213c;
    }

    public final int c() {
        return this.f92211a;
    }

    public final int d() {
        return this.f92214d;
    }
}
