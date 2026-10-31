package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0006\n\u0000\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b¨\u0006\t"}, d2 = {"Lcom/amplitude/core/utilities/Sample;", b.f42142b, "()V", "isInSample", b.f42142b, "seed", b.f42142b, "sampleRate", b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class Sample {

    @NotNull
    public static final Sample INSTANCE = new Sample();

    private Sample() {
    }

    public final boolean isInSample(@NotNull String seed, double sampleRate) {
        Intrinsics.g(seed, "seed");
        long jM128xxHash328fN1j4Y$default = Hash.m128xxHash328fN1j4Y$default(Hash.INSTANCE, seed, 0, 2, null) & 4294967295L;
        ULong.Companion companion = ULong.f71699b;
        return UnsignedKt.b(Long.remainderUnsigned(jM128xxHash328fN1j4Y$default * 31, 1000000L)) / 1000000.0d < sampleRate;
    }
}
