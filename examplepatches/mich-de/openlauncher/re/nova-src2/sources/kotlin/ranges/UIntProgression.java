package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.UInt;
import kotlin.WasExperimental;
import kotlin.jvm.internal.markers.KMappedMarker;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/UIntProgression;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/UInt;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes4.dex */
public class UIntProgression implements Iterable<UInt>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final int f71922a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71923b;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/UIntProgression$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
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

    public UIntProgression() {
        int i5 = 0;
        if (Integer.compareUnsigned(-1, 0) < 0) {
            UInt.Companion companion = UInt.f71696b;
            int iRemainderUnsigned = Integer.remainderUnsigned(0, 1);
            int iRemainderUnsigned2 = Integer.remainderUnsigned(-1, 1);
            int iCompareUnsigned = Integer.compareUnsigned(iRemainderUnsigned, iRemainderUnsigned2);
            int i11 = iRemainderUnsigned - iRemainderUnsigned2;
            i5 = 0 - (iCompareUnsigned < 0 ? i11 + 1 : i11);
        }
        this.f71922a = i5;
        this.f71923b = 1;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof UIntProgression)) {
            return false;
        }
        if (isEmpty() && ((UIntProgression) obj).isEmpty()) {
            return true;
        }
        UIntProgression uIntProgression = (UIntProgression) obj;
        return this.f71922a == uIntProgression.f71922a && this.f71923b == uIntProgression.f71923b;
    }

    public int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (((-31) + this.f71922a) * 31) + this.f71923b;
    }

    public boolean isEmpty() {
        int i5 = this.f71923b;
        int i11 = this.f71922a;
        return i5 > 0 ? Integer.compareUnsigned(-1, i11) > 0 : Integer.compareUnsigned(-1, i11) < 0;
    }

    @Override // java.lang.Iterable
    public final Iterator<UInt> iterator() {
        return new p70.b(this.f71922a, this.f71923b);
    }

    public String toString() {
        StringBuilder sb2;
        int i5 = this.f71922a;
        int i11 = this.f71923b;
        if (i11 > 0) {
            sb2 = new StringBuilder();
            sb2.append((Object) UInt.a(-1));
            sb2.append("..");
            sb2.append((Object) UInt.a(i5));
            sb2.append(" step ");
            sb2.append(i11);
        } else {
            sb2 = new StringBuilder();
            sb2.append((Object) UInt.a(-1));
            sb2.append(" downTo ");
            sb2.append((Object) UInt.a(i5));
            sb2.append(" step ");
            sb2.append(-i11);
        }
        return sb2.toString();
    }
}
