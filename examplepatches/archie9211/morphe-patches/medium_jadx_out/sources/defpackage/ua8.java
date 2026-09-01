package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ua8 implements Comparable {
    public final va8 a;
    public final Bundle b;
    public final boolean c;
    public final int d;
    public final boolean e;
    public final int f;

    public ua8(va8 va8Var, Bundle bundle, boolean z, int i, boolean z2, int i2) {
        this.a = va8Var;
        this.b = bundle;
        this.c = z;
        this.d = i;
        this.e = z2;
        this.f = i2;
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(ua8 ua8Var) {
        ua8Var.getClass();
        boolean z = ua8Var.e;
        boolean z2 = ua8Var.c;
        Bundle bundle = ua8Var.b;
        boolean z3 = this.c;
        if (z3 && !z2) {
            return 1;
        }
        if (!z3 && z2) {
            return -1;
        }
        int i = this.d - ua8Var.d;
        if (i > 0) {
            return 1;
        }
        if (i < 0) {
            return -1;
        }
        Bundle bundle2 = this.b;
        if (bundle2 != null && bundle == null) {
            return 1;
        }
        if (bundle2 == null && bundle != null) {
            return -1;
        }
        if (bundle2 != null) {
            bundle2.getClass();
            int size = bundle2.size();
            bundle.getClass();
            int size2 = size - bundle.size();
            if (size2 > 0) {
                return 1;
            }
            if (size2 < 0) {
                return -1;
            }
        }
        boolean z4 = this.e;
        if (z4 && !z) {
            return 1;
        }
        if (z4 || !z) {
            return this.f - ua8Var.f;
        }
        return -1;
    }
}
