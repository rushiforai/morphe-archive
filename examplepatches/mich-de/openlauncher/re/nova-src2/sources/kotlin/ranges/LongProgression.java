package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\t\n\u0002\b\u0002\b\u0016\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/LongProgression;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public class LongProgression implements Iterable<Long>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final long f71915a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71916b;

    /* renamed from: c, reason: collision with root package name */
    public final long f71917c;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/LongProgression$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
    }

    public LongProgression(long j11, long j12) {
        this.f71915a = j11;
        if (j11 < j12) {
            long j13 = j12 % 1;
            long j14 = j11 % 1;
            long j15 = ((j13 < 0 ? j13 + 1 : j13) - (j14 < 0 ? j14 + 1 : j14)) % 1;
            j12 -= j15 < 0 ? j15 + 1 : j15;
        }
        this.f71916b = j12;
        this.f71917c = 1L;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof LongProgression)) {
            return false;
        }
        if (isEmpty() && ((LongProgression) obj).isEmpty()) {
            return true;
        }
        LongProgression longProgression = (LongProgression) obj;
        return this.f71915a == longProgression.f71915a && this.f71916b == longProgression.f71916b && this.f71917c == longProgression.f71917c;
    }

    public int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        long j11 = 31;
        long j12 = this.f71915a;
        long j13 = this.f71916b;
        long j14 = (((j12 ^ (j12 >>> 32)) * j11) + (j13 ^ (j13 >>> 32))) * j11;
        long j15 = this.f71917c;
        return (int) (j14 + (j15 ^ (j15 >>> 32)));
    }

    public boolean isEmpty() {
        long j11 = this.f71917c;
        long j12 = this.f71916b;
        long j13 = this.f71915a;
        return j11 > 0 ? j13 > j12 : j13 < j12;
    }

    @Override // java.lang.Iterable
    public final Iterator<Long> iterator() {
        return new LongProgressionIterator(this.f71915a, this.f71916b, this.f71917c);
    }

    public String toString() {
        StringBuilder sb2;
        long j11 = this.f71917c;
        long j12 = this.f71916b;
        long j13 = this.f71915a;
        if (j11 > 0) {
            sb2 = new StringBuilder();
            sb2.append(j13);
            sb2.append("..");
            sb2.append(j12);
            sb2.append(" step ");
            sb2.append(j11);
        } else {
            sb2 = new StringBuilder();
            sb2.append(j13);
            sb2.append(" downTo ");
            sb2.append(j12);
            sb2.append(" step ");
            sb2.append(-j11);
        }
        return sb2.toString();
    }
}
