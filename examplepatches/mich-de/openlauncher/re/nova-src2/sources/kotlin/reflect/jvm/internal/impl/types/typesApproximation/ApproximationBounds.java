package kotlin.reflect.jvm.internal.impl.types.typesApproximation;

import com.google.android.gms.internal.measurement.k2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class ApproximationBounds<T> {
    private final T lower;
    private final T upper;

    public ApproximationBounds(T t6, T t9) {
        this.lower = t6;
        this.upper = t9;
    }

    public final T component1() {
        return this.lower;
    }

    public final T component2() {
        return this.upper;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ApproximationBounds)) {
            return false;
        }
        ApproximationBounds approximationBounds = (ApproximationBounds) obj;
        return Intrinsics.b(this.lower, approximationBounds.lower) && Intrinsics.b(this.upper, approximationBounds.upper);
    }

    public final T getLower() {
        return this.lower;
    }

    public final T getUpper() {
        return this.upper;
    }

    public int hashCode() {
        T t6 = this.lower;
        int iHashCode = (t6 == null ? 0 : t6.hashCode()) * 31;
        T t9 = this.upper;
        return iHashCode + (t9 != null ? t9.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ApproximationBounds(lower=");
        sb2.append(this.lower);
        sb2.append(", upper=");
        return k2.j(sb2, this.upper, ')');
    }
}
