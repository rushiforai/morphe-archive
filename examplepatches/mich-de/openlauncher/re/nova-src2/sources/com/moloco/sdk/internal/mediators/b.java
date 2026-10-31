package com.moloco.sdk.internal.mediators;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b {
    public static final long a(@Nullable String str) {
        if (str != null) {
            int iHashCode = str.hashCode();
            if (iHashCode != 76100) {
                if (iHashCode != 63085501) {
                    if (iHashCode == 347625656 && str.equals("LevelPlay")) {
                        return DurationKt.g(8, DurationUnit.f72046e);
                    }
                } else if (str.equals(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME)) {
                    return DurationKt.g(8, DurationUnit.f72046e);
                }
            } else if (str.equals("MAX")) {
                return DurationKt.g(8, DurationUnit.f72046e);
            }
        }
        return DurationKt.g(60, DurationUnit.f72046e);
    }

    public static final long b(@Nullable String str) {
        if (str != null) {
            int iHashCode = str.hashCode();
            if (iHashCode != 76100) {
                if (iHashCode != 63085501) {
                    if (iHashCode == 347625656 && str.equals("LevelPlay")) {
                        return DurationKt.g(26, DurationUnit.f72046e);
                    }
                } else if (str.equals(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME)) {
                    return DurationKt.g(26, DurationUnit.f72046e);
                }
            } else if (str.equals("MAX")) {
                return DurationKt.g(26, DurationUnit.f72046e);
            }
        }
        return DurationKt.g(60, DurationUnit.f72046e);
    }

    public static final long c(@Nullable String str) {
        return a(str);
    }

    public static final long d(@Nullable String str) {
        return Intrinsics.b(str, "MAX") ? DurationKt.g(8, DurationUnit.f72046e) : Intrinsics.b(str, MolocoMediationAdapter.MEDIATION_PLATFORM_NAME) ? DurationKt.g(58, DurationUnit.f72046e) : DurationKt.g(60, DurationUnit.f72046e);
    }
}
