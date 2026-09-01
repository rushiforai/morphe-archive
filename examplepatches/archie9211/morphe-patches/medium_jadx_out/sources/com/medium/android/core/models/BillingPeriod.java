package com.medium.android.core.models;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/medium/android/core/models/BillingPeriod;", "", "<init>", "(Ljava/lang/String;I)V", "ONE_MONTH", "ONE_YEAR", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class BillingPeriod {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ BillingPeriod[] $VALUES;
    public static final BillingPeriod ONE_MONTH = new BillingPeriod("ONE_MONTH", 0);
    public static final BillingPeriod ONE_YEAR = new BillingPeriod("ONE_YEAR", 1);

    private static final /* synthetic */ BillingPeriod[] $values() {
        return new BillingPeriod[]{ONE_MONTH, ONE_YEAR};
    }

    static {
        BillingPeriod[] billingPeriodArr$values = $values();
        $VALUES = billingPeriodArr$values;
        $ENTRIES = rv8.x(billingPeriodArr$values);
    }

    private BillingPeriod(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static BillingPeriod valueOf(String str) {
        return (BillingPeriod) Enum.valueOf(BillingPeriod.class, str);
    }

    public static BillingPeriod[] values() {
        return (BillingPeriod[]) $VALUES.clone();
    }
}
