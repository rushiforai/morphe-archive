package z6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final int f98261a;

    /* renamed from: b, reason: collision with root package name */
    public final int f98262b;

    /* renamed from: c, reason: collision with root package name */
    public final String f98263c;

    /* renamed from: d, reason: collision with root package name */
    public final String f98264d;

    public c(int i5, int i11, String str, String str2) {
        this.f98261a = i5;
        this.f98262b = i11;
        this.f98263c = str;
        this.f98264d = str2;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        c other = (c) obj;
        Intrinsics.g(other, "other");
        int i5 = this.f98261a - other.f98261a;
        return i5 == 0 ? this.f98262b - other.f98262b : i5;
    }
}
