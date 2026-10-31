package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.WasExperimental;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00030\u00022\b\u0012\u0004\u0012\u00020\u00030\u0004:\u0001\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/ranges/ULongRange;", "Lkotlin/ranges/ULongProgression;", "Lkotlin/ranges/ClosedRange;", "Lkotlin/ULong;", "Lkotlin/ranges/OpenEndRange;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes4.dex */
public final class ULongRange extends ULongProgression implements ClosedRange<ULong>, OpenEndRange<ULong> {

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/ULongRange$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
        new ULongRange();
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable c() {
        return new ULong(-1L);
    }

    @Override // kotlin.ranges.ClosedRange
    public final boolean d(Comparable comparable) {
        throw null;
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable e() {
        return new ULong(this.f71924a);
    }

    @Override // kotlin.ranges.ULongProgression
    public final boolean equals(Object obj) {
        if (obj instanceof ULongRange) {
            return (isEmpty() && ((ULongRange) obj).isEmpty()) || this.f71924a == ((ULongRange) obj).f71924a;
        }
        return false;
    }

    @Override // kotlin.ranges.ULongProgression
    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        ULong.Companion companion = ULong.f71699b;
        long j11 = this.f71924a;
        return (((int) (-4294967296L)) * 31) + ((int) (j11 ^ (j11 >>> 32)));
    }

    @Override // kotlin.ranges.ULongProgression, kotlin.ranges.ClosedRange
    public final boolean isEmpty() {
        return Long.compareUnsigned(-1L, this.f71924a) > 0;
    }

    @Override // kotlin.ranges.ULongProgression
    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        ULong.Companion companion = ULong.f71699b;
        sb2.append((Object) UnsignedKt.c(10, -1L));
        sb2.append("..");
        sb2.append((Object) UnsignedKt.c(10, this.f71924a));
        return sb2.toString();
    }
}
