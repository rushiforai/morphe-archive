package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class sx2 implements wi.a {

    /* renamed from: a, reason: collision with root package name */
    public final int f9719a;

    /* renamed from: b, reason: collision with root package name */
    public final String f9720b;

    public sx2(String str, int i5) {
        this.f9719a = i5;
        this.f9720b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sx2)) {
            return false;
        }
        sx2 sx2Var = (sx2) obj;
        return this.f9719a == sx2Var.f9719a && Intrinsics.b(this.f9720b, sx2Var.f9720b);
    }

    @Override // wi.a
    public final int getAmount() {
        return this.f9719a;
    }

    @Override // wi.a
    public final String getType() {
        return this.f9720b;
    }

    public final int hashCode() {
        return this.f9720b.hashCode() + (Integer.hashCode(this.f9719a) * 31);
    }

    public final String toString() {
        return "RewardItemImpl(amount=" + this.f9719a + ", type=" + this.f9720b + ")";
    }
}
