package defpackage;

import com.medium.android.graphql.OnboardingStarterPackQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ns8 implements os8 {
    public final OnboardingStarterPackQuery.OnStarterPack a;
    public final boolean b;

    public ns8(OnboardingStarterPackQuery.OnStarterPack onStarterPack, boolean z) {
        this.a = onStarterPack;
        this.b = z;
    }

    public static ns8 a(ns8 ns8Var, OnboardingStarterPackQuery.OnStarterPack onStarterPack, int i) {
        if ((i & 1) != 0) {
            onStarterPack = ns8Var.a;
        }
        boolean z = (i & 2) != 0 ? ns8Var.b : true;
        ns8Var.getClass();
        return new ns8(onStarterPack, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ns8)) {
            return false;
        }
        ns8 ns8Var = (ns8) obj;
        return this.a.equals(ns8Var.a) && this.b == ns8Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Success(starterPack=" + this.a + ", isRefreshing=" + this.b + ")";
    }
}
