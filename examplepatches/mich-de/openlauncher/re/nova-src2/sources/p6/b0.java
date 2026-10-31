package p6;

import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b0 implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f82136a;

    /* renamed from: b, reason: collision with root package name */
    public final Bundle f82137b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f82138c;

    /* renamed from: d, reason: collision with root package name */
    public final int f82139d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f82140e;

    public b0(e0 e0Var, Bundle bundle, boolean z11, int i5, boolean z12) {
        this.f82136a = e0Var;
        this.f82137b = bundle;
        this.f82138c = z11;
        this.f82139d = i5;
        this.f82140e = z12;
    }

    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(b0 other) {
        Intrinsics.g(other, "other");
        boolean z11 = other.f82140e;
        boolean z12 = other.f82138c;
        Bundle bundle = other.f82137b;
        boolean z13 = this.f82138c;
        if (z13 && !z12) {
            return 1;
        }
        if (!z13 && z12) {
            return -1;
        }
        int i5 = this.f82139d - other.f82139d;
        if (i5 > 0) {
            return 1;
        }
        if (i5 < 0) {
            return -1;
        }
        Bundle bundle2 = this.f82137b;
        if (bundle2 != null && bundle == null) {
            return 1;
        }
        if (bundle2 == null && bundle != null) {
            return -1;
        }
        if (bundle2 != null) {
            int size = bundle2.size();
            Intrinsics.d(bundle);
            int size2 = size - bundle.size();
            if (size2 > 0) {
                return 1;
            }
            if (size2 < 0) {
                return -1;
            }
        }
        boolean z14 = this.f82140e;
        if (!z14 || z11) {
            return (z14 || !z11) ? 0 : -1;
        }
        return 1;
    }
}
