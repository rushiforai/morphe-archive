package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.UInt;
import kotlin.WasExperimental;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00030\u00022\b\u0012\u0004\u0012\u00020\u00030\u0004:\u0001\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/ranges/UIntRange;", "Lkotlin/ranges/UIntProgression;", "Lkotlin/ranges/ClosedRange;", "Lkotlin/UInt;", "Lkotlin/ranges/OpenEndRange;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes4.dex */
public final class UIntRange extends UIntProgression implements ClosedRange<UInt>, OpenEndRange<UInt> {

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/UIntRange$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
        new UIntRange();
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable c() {
        return new UInt(-1);
    }

    @Override // kotlin.ranges.ClosedRange
    public final boolean d(Comparable comparable) {
        throw null;
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable e() {
        return new UInt(this.f71922a);
    }

    @Override // kotlin.ranges.UIntProgression
    public final boolean equals(Object obj) {
        if (obj instanceof UIntRange) {
            return (isEmpty() && ((UIntRange) obj).isEmpty()) || this.f71922a == ((UIntRange) obj).f71922a;
        }
        return false;
    }

    @Override // kotlin.ranges.UIntProgression
    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (-31) + this.f71922a;
    }

    @Override // kotlin.ranges.UIntProgression, kotlin.ranges.ClosedRange
    public final boolean isEmpty() {
        return Integer.compareUnsigned(-1, this.f71922a) > 0;
    }

    @Override // kotlin.ranges.UIntProgression
    public final String toString() {
        return ((Object) UInt.a(-1)) + ".." + ((Object) UInt.a(this.f71922a));
    }
}
