package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear;

import androidx.compose.ui.node.LayoutNode;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d;
import kotlin.NoWhenBranchMatchedException;
import kotlin.UInt;
import kotlin.UnsignedKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.ranges.LongRange;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.r1;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final long f41837a = 1000;

    public static final boolean b(r1 r1Var) {
        return r1Var == null || r1Var.isCancelled() || r1Var.isCompleted();
    }

    public static final d.a b(int i5) {
        return i5 == 0 ? d.a.C0283a.f41609b : new d.a.b(i5, null);
    }

    public static final long b(long j11) {
        return j11 / 1000;
    }

    @NotNull
    public static final g a(@Nullable Boolean bool, int i5, @Nullable r rVar) {
        if (Intrinsics.b(bool, Boolean.FALSE)) {
            rVar = null;
        } else if (Intrinsics.b(bool, Boolean.TRUE)) {
            rVar = new r.b(i5 * 1000);
        } else if (bool != null) {
            throw new NoWhenBranchMatchedException();
        }
        return new h(rVar);
    }

    public static final int b(IntRange intRange, int i5) {
        int i11 = intRange.f71907b - intRange.f71906a;
        if (i11 < 0) {
            i11 = 0;
        }
        double d5 = ((i11 * i5) / 100.0d) / 1000;
        if (d5 < 0.0d) {
            d5 = 0.0d;
        }
        if (Double.isNaN(d5) || d5 <= UnsignedKt.a(0)) {
            return 0;
        }
        if (d5 >= UnsignedKt.a(-1)) {
            return -1;
        }
        if (d5 <= 2.147483647E9d) {
            int i12 = (int) d5;
            UInt.Companion companion = UInt.f71696b;
            return i12;
        }
        int i13 = (int) (d5 - LayoutNode.NotPlacedPlaceOrder);
        UInt.Companion companion2 = UInt.f71696b;
        return i13 + LayoutNode.NotPlacedPlaceOrder;
    }

    public static final int a(LongRange longRange) {
        long j11 = (longRange.f71916b - longRange.f71915a) / 1000;
        if (j11 < 0) {
            j11 = 0;
        }
        int i5 = (int) j11;
        UInt.Companion companion = UInt.f71696b;
        return i5;
    }
}
