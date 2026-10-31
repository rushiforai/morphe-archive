package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\b\n\u0002\b\u0002\b\u0016\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/IntProgression;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public class IntProgression implements Iterable<Integer>, KMappedMarker {

    /* renamed from: d, reason: collision with root package name */
    public static final Companion f71905d = new Companion(0);

    /* renamed from: a, reason: collision with root package name */
    public final int f71906a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71907b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71908c;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/IntProgression$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    public IntProgression(int i5, int i11, int i12) {
        if (i12 == 0) {
            throw new IllegalArgumentException("Step must be non-zero.");
        }
        if (i12 == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("Step must be greater than Int.MIN_VALUE to avoid overflow on negation.");
        }
        this.f71906a = i5;
        this.f71907b = ProgressionUtilKt.a(i5, i11, i12);
        this.f71908c = i12;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof IntProgression)) {
            return false;
        }
        if (isEmpty() && ((IntProgression) obj).isEmpty()) {
            return true;
        }
        IntProgression intProgression = (IntProgression) obj;
        return this.f71906a == intProgression.f71906a && this.f71907b == intProgression.f71907b && this.f71908c == intProgression.f71908c;
    }

    @Override // java.lang.Iterable
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public final IntProgressionIterator iterator() {
        return new IntProgressionIterator(this.f71906a, this.f71907b, this.f71908c);
    }

    public int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (((this.f71906a * 31) + this.f71907b) * 31) + this.f71908c;
    }

    public boolean isEmpty() {
        int i5 = this.f71908c;
        int i11 = this.f71907b;
        int i12 = this.f71906a;
        return i5 > 0 ? i12 > i11 : i12 < i11;
    }

    public String toString() {
        StringBuilder sb2;
        int i5 = this.f71907b;
        int i11 = this.f71906a;
        int i12 = this.f71908c;
        if (i12 > 0) {
            sb2 = new StringBuilder();
            sb2.append(i11);
            sb2.append("..");
            sb2.append(i5);
            sb2.append(" step ");
            sb2.append(i12);
        } else {
            sb2 = new StringBuilder();
            sb2.append(i11);
            sb2.append(" downTo ");
            sb2.append(i5);
            sb2.append(" step ");
            sb2.append(-i12);
        }
        return sb2.toString();
    }
}
