package kotlin.math;

import androidx.compose.ui.node.LayoutNode;
import kotlin.Metadata;

@Metadata(d1 = {"kotlin/math/MathKt", "kotlin/math/MathKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class MathKt {
    private MathKt() {
    }

    public static int a(double d5) {
        if (Double.isNaN(d5)) {
            throw new IllegalArgumentException("Cannot round NaN value.");
        }
        if (d5 > 2.147483647E9d) {
            return LayoutNode.NotPlacedPlaceOrder;
        }
        if (d5 < -2.147483648E9d) {
            return Integer.MIN_VALUE;
        }
        return (int) Math.round(d5);
    }

    public static int b(float f11) {
        if (Float.isNaN(f11)) {
            throw new IllegalArgumentException("Cannot round NaN value.");
        }
        return Math.round(f11);
    }

    public static long c(double d5) {
        if (Double.isNaN(d5)) {
            throw new IllegalArgumentException("Cannot round NaN value.");
        }
        return Math.round(d5);
    }
}
