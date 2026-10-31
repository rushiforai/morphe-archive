package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class vv1 {

    /* renamed from: a, reason: collision with root package name */
    public final com.google.gson.r f10912a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.gson.r f10913b;

    /* renamed from: c, reason: collision with root package name */
    public final com.google.gson.r f10914c;

    /* renamed from: d, reason: collision with root package name */
    public final com.google.gson.r f10915d;

    /* renamed from: e, reason: collision with root package name */
    public final com.google.gson.r f10916e;

    public vv1(com.google.gson.r rVar, com.google.gson.r rVar2, com.google.gson.r rVar3, com.google.gson.r rVar4, com.google.gson.r rVar5) {
        this.f10912a = rVar;
        this.f10913b = rVar2;
        this.f10914c = rVar3;
        this.f10915d = rVar4;
        this.f10916e = rVar5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vv1)) {
            return false;
        }
        vv1 vv1Var = (vv1) obj;
        return Intrinsics.b(this.f10912a, vv1Var.f10912a) && Intrinsics.b(this.f10913b, vv1Var.f10913b) && Intrinsics.b(this.f10914c, vv1Var.f10914c) && Intrinsics.b(this.f10915d, vv1Var.f10915d) && Intrinsics.b(this.f10916e, vv1Var.f10916e);
    }

    public final int hashCode() {
        return this.f10916e.f34795a.hashCode() + ((this.f10915d.f34795a.hashCode() + ((this.f10914c.f34795a.hashCode() + ((this.f10913b.f34795a.hashCode() + (this.f10912a.f34795a.hashCode() * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "NativeAdSignals(assetViewsSignal=" + this.f10912a + ", nativeAdViewSignal=" + this.f10913b + ", scrollViewSignal=" + this.f10914c + ", lockScreenSignal=" + this.f10915d + ", adScreenSignal=" + this.f10916e + ")";
    }
}
