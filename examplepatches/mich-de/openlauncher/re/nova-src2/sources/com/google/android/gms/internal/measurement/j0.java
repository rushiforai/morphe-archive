package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public enum j0 implements q1 {
    PURPOSE_RESTRICTION_NOT_ALLOWED(0),
    PURPOSE_RESTRICTION_REQUIRE_CONSENT(1),
    PURPOSE_RESTRICTION_REQUIRE_LEGITIMATE_INTEREST(2),
    PURPOSE_RESTRICTION_UNDEFINED(3),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f32673a;

    j0(int i5) {
        this.f32673a = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.f32673a);
    }

    @Override // com.google.android.gms.internal.measurement.q1
    public final int zza() {
        if (this != UNRECOGNIZED) {
            return this.f32673a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
