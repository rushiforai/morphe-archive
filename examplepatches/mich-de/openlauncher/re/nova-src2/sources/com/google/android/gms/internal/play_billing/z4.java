package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public enum z4 implements z2 {
    BROADCAST_ACTION_UNSPECIFIED(0),
    PURCHASES_UPDATED_ACTION(1),
    LOCAL_PURCHASES_UPDATED_ACTION(2),
    ALTERNATIVE_BILLING_ACTION(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f33676a;

    z4(int i5) {
        this.f33676a = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.f33676a);
    }

    @Override // com.google.android.gms.internal.play_billing.z2
    public final int zza() {
        return this.f33676a;
    }
}
