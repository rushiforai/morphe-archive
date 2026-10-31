package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.WasExperimental;
import kotlin.jvm.internal.markers.KMappedMarker;
import p70.c;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/ULongProgression;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ULong;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes4.dex */
public class ULongProgression implements Iterable<ULong>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final long f71924a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71925b;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/ULongProgression$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
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

    public ULongProgression() {
        long j11 = 0;
        if (Long.compareUnsigned(-1L, 0L) < 0) {
            ULong.Companion companion = ULong.f71699b;
            long jRemainderUnsigned = Long.remainderUnsigned(0L, 1L);
            long jRemainderUnsigned2 = Long.remainderUnsigned(-1L, 1L);
            int iCompareUnsigned = Long.compareUnsigned(jRemainderUnsigned, jRemainderUnsigned2);
            long j12 = jRemainderUnsigned - jRemainderUnsigned2;
            j11 = 0 - (iCompareUnsigned < 0 ? j12 + 1 : j12);
        }
        this.f71924a = j11;
        this.f71925b = 1L;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof ULongProgression)) {
            return false;
        }
        if (isEmpty() && ((ULongProgression) obj).isEmpty()) {
            return true;
        }
        ULongProgression uLongProgression = (ULongProgression) obj;
        return this.f71924a == uLongProgression.f71924a && this.f71925b == uLongProgression.f71925b;
    }

    public int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        ULong.Companion companion = ULong.f71699b;
        long j11 = this.f71924a;
        int i5 = ((((int) (-4294967296L)) * 31) + ((int) (j11 ^ (j11 >>> 32)))) * 31;
        long j12 = this.f71925b;
        return i5 + ((int) (j12 ^ (j12 >>> 32)));
    }

    public boolean isEmpty() {
        long j11 = this.f71925b;
        long j12 = this.f71924a;
        return j11 > 0 ? Long.compareUnsigned(-1L, j12) > 0 : Long.compareUnsigned(-1L, j12) < 0;
    }

    @Override // java.lang.Iterable
    public final Iterator<ULong> iterator() {
        return new c(this.f71924a, this.f71925b);
    }

    public String toString() {
        StringBuilder sb2;
        long j11 = this.f71925b;
        long j12 = this.f71924a;
        if (j11 > 0) {
            sb2 = new StringBuilder();
            ULong.Companion companion = ULong.f71699b;
            sb2.append((Object) UnsignedKt.c(10, -1L));
            sb2.append("..");
            sb2.append((Object) UnsignedKt.c(10, j12));
            sb2.append(" step ");
            sb2.append(j11);
        } else {
            sb2 = new StringBuilder();
            ULong.Companion companion2 = ULong.f71699b;
            sb2.append((Object) UnsignedKt.c(10, -1L));
            sb2.append(" downTo ");
            sb2.append((Object) UnsignedKt.c(10, j12));
            sb2.append(" step ");
            sb2.append(-j11);
        }
        return sb2.toString();
    }
}
