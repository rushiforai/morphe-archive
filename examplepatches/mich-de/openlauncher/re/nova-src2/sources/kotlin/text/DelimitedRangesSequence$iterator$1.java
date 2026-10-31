package kotlin.text;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.ranges.IntRange;
import r70.k;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010(\n\u0002\u0018\u0002\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"kotlin/text/DelimitedRangesSequence$iterator$1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ranges/IntRange;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class DelimitedRangesSequence$iterator$1 implements Iterator<IntRange>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public int f72004a = -1;

    /* renamed from: b, reason: collision with root package name */
    public int f72005b;

    /* renamed from: c, reason: collision with root package name */
    public int f72006c;

    /* renamed from: d, reason: collision with root package name */
    public IntRange f72007d;

    /* renamed from: e, reason: collision with root package name */
    public int f72008e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ r70.a f72009f;

    public DelimitedRangesSequence$iterator$1(r70.a aVar) {
        this.f72009f = aVar;
        int iE0 = kotlin.ranges.a.e0(0, 0, aVar.f85603a.length());
        this.f72005b = iE0;
        this.f72006c = iE0;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() {
        Pair pair;
        int i5 = this.f72006c;
        if (i5 < 0) {
            this.f72004a = 0;
            this.f72007d = null;
            return;
        }
        r70.a aVar = this.f72009f;
        int i11 = aVar.f85604b;
        if (i11 > 0) {
            int i12 = this.f72008e + 1;
            this.f72008e = i12;
            if (i12 >= i11) {
                this.f72007d = new IntRange(this.f72005b, k.O0(aVar.f85603a), 1);
                this.f72006c = -1;
            } else if (i5 <= aVar.f85603a.length() && (pair = (Pair) aVar.f85605c.invoke(aVar.f85603a, Integer.valueOf(this.f72006c))) != null) {
                int iIntValue = ((Number) pair.f71683a).intValue();
                int iIntValue2 = ((Number) pair.f71684b).intValue();
                this.f72007d = kotlin.ranges.a.m0(this.f72005b, iIntValue);
                int i13 = iIntValue + iIntValue2;
                this.f72005b = i13;
                this.f72006c = i13 + (iIntValue2 == 0 ? 1 : 0);
            } else {
                this.f72007d = new IntRange(this.f72005b, k.O0(aVar.f85603a), 1);
                this.f72006c = -1;
            }
        }
        this.f72004a = 1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.f72004a == -1) {
            a();
        }
        return this.f72004a == 1;
    }

    @Override // java.util.Iterator
    public final IntRange next() {
        if (this.f72004a == -1) {
            a();
        }
        if (this.f72004a == 0) {
            throw new NoSuchElementException();
        }
        IntRange intRange = this.f72007d;
        Intrinsics.e(intRange, "null cannot be cast to non-null type kotlin.ranges.IntRange");
        this.f72007d = null;
        this.f72004a = -1;
        return intRange;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
