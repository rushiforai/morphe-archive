package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00030\u00022\b\u0012\u0004\u0012\u00020\u00030\u0004:\u0001\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/ranges/IntRange;", "Lkotlin/ranges/IntProgression;", "Lkotlin/ranges/ClosedRange;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ranges/OpenEndRange;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IntRange extends IntProgression implements ClosedRange<Integer>, OpenEndRange<Integer> {

    /* renamed from: e, reason: collision with root package name */
    public static final Companion f71913e = new Companion(0);

    /* renamed from: f, reason: collision with root package name */
    public static final IntRange f71914f = new IntRange(1, 0, 1);

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/IntRange$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable c() {
        return Integer.valueOf(this.f71906a);
    }

    @Override // kotlin.ranges.ClosedRange
    public final /* bridge */ /* synthetic */ boolean d(Comparable comparable) {
        throw null;
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable e() {
        return Integer.valueOf(this.f71907b);
    }

    @Override // kotlin.ranges.IntProgression
    public final boolean equals(Object obj) {
        if (!(obj instanceof IntRange)) {
            return false;
        }
        if (isEmpty() && ((IntRange) obj).isEmpty()) {
            return true;
        }
        IntRange intRange = (IntRange) obj;
        return this.f71906a == intRange.f71906a && this.f71907b == intRange.f71907b;
    }

    public final boolean g(int i5) {
        return this.f71906a <= i5 && i5 <= this.f71907b;
    }

    @Override // kotlin.ranges.IntProgression
    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (this.f71906a * 31) + this.f71907b;
    }

    @Override // kotlin.ranges.IntProgression, kotlin.ranges.ClosedRange
    public final boolean isEmpty() {
        return this.f71906a > this.f71907b;
    }

    @Override // kotlin.ranges.IntProgression
    public final String toString() {
        return this.f71906a + ".." + this.f71907b;
    }
}
