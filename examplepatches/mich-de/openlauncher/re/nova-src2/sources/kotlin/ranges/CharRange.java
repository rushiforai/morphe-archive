package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\f\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00030\u00022\b\u0012\u0004\u0012\u00020\u00030\u0004:\u0001\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/ranges/CharRange;", "Lkotlin/ranges/CharProgression;", "Lkotlin/ranges/ClosedRange;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ranges/OpenEndRange;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CharRange extends CharProgression implements ClosedRange<Character>, OpenEndRange<Character> {

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/CharRange$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
        new CharRange((char) 1, (char) 0);
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable c() {
        return Character.valueOf(this.f71898a);
    }

    @Override // kotlin.ranges.ClosedRange
    public final /* bridge */ /* synthetic */ boolean d(Comparable comparable) {
        throw null;
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable e() {
        return Character.valueOf(this.f71899b);
    }

    @Override // kotlin.ranges.CharProgression
    public final boolean equals(Object obj) {
        if (!(obj instanceof CharRange)) {
            return false;
        }
        if (isEmpty() && ((CharRange) obj).isEmpty()) {
            return true;
        }
        CharRange charRange = (CharRange) obj;
        return this.f71898a == charRange.f71898a && this.f71899b == charRange.f71899b;
    }

    public final boolean f(char c11) {
        return Intrinsics.h(this.f71898a, c11) <= 0 && Intrinsics.h(c11, this.f71899b) <= 0;
    }

    @Override // kotlin.ranges.CharProgression
    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (this.f71898a * 31) + this.f71899b;
    }

    @Override // kotlin.ranges.CharProgression, kotlin.ranges.ClosedRange
    public final boolean isEmpty() {
        return Intrinsics.h(this.f71898a, this.f71899b) > 0;
    }

    @Override // kotlin.ranges.CharProgression
    public final String toString() {
        return this.f71898a + ".." + this.f71899b;
    }
}
