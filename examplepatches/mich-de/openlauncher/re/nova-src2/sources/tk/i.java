package tk;

import java.util.Objects;
import ps.f0;

/* loaded from: classes3.dex */
public final class i extends g {

    /* renamed from: d, reason: collision with root package name */
    public static final i f89424d = new i(new Object[0]);

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f89425c;

    public i(Object[] objArr) {
        this.f89425c = objArr;
    }

    @Override // tk.g, tk.d
    public final int b(Object[] objArr) {
        System.arraycopy(this.f89425c, 0, objArr, 0, 0);
        return 0;
    }

    @Override // tk.d
    public final int c() {
        return 0;
    }

    @Override // tk.d
    public final int d() {
        return 0;
    }

    @Override // tk.d
    public final Object[] e() {
        return this.f89425c;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        f0.g(i5, 0);
        Object obj = this.f89425c[i5];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return 0;
    }
}
