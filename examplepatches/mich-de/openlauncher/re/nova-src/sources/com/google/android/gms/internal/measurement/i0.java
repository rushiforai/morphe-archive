package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public enum i0 implements q1 {
    /* JADX INFO: Fake field, exist only in values array */
    IAB_TCF_PURPOSE_UNKNOWN(0),
    IAB_TCF_PURPOSE_STORE_AND_ACCESS_INFORMATION_ON_A_DEVICE(1),
    IAB_TCF_PURPOSE_SELECT_BASIC_ADS(2),
    IAB_TCF_PURPOSE_CREATE_A_PERSONALISED_ADS_PROFILE(3),
    IAB_TCF_PURPOSE_SELECT_PERSONALISED_ADS(4),
    /* JADX INFO: Fake field, exist only in values array */
    IAB_TCF_PURPOSE_CREATE_A_PERSONALISED_CONTENT_PROFILE(5),
    /* JADX INFO: Fake field, exist only in values array */
    IAB_TCF_PURPOSE_SELECT_PERSONALISED_CONTENT(6),
    IAB_TCF_PURPOSE_MEASURE_AD_PERFORMANCE(7),
    /* JADX INFO: Fake field, exist only in values array */
    IAB_TCF_PURPOSE_MEASURE_CONTENT_PERFORMANCE(8),
    IAB_TCF_PURPOSE_APPLY_MARKET_RESEARCH_TO_GENERATE_AUDIENCE_INSIGHTS(9),
    IAB_TCF_PURPOSE_DEVELOP_AND_IMPROVE_PRODUCTS(10),
    /* JADX INFO: Fake field, exist only in values array */
    IAB_TCF_PURPOSE_USE_LIMITED_DATA_TO_SELECT_CONTENT(11),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f32629a;

    i0(int i5) {
        this.f32629a = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.f32629a);
    }

    @Override // com.google.android.gms.internal.measurement.q1
    public final int zza() {
        if (this != UNRECOGNIZED) {
            return this.f32629a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
