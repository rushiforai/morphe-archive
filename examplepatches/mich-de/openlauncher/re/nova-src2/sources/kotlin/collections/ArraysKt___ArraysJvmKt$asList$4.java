package kotlin.collections;

import java.util.RandomAccess;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004¨\u0006\u0005"}, d2 = {"kotlin/collections/ArraysKt___ArraysJvmKt$asList$4", "Lkotlin/collections/AbstractList;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ArraysKt___ArraysJvmKt$asList$4 extends AbstractList<Long> implements RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long[] f71726b;

    public ArraysKt___ArraysJvmKt$asList$4(long[] jArr) {
        this.f71726b = jArr;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f71726b.length;
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (!(obj instanceof Long)) {
            return false;
        }
        return c.s0(this.f71726b, ((Number) obj).longValue());
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        return Long.valueOf(this.f71726b[i5]);
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        return c.J0(this.f71726b, ((Number) obj).longValue());
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        return this.f71726b.length == 0;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Number) obj).longValue();
        long[] jArr = this.f71726b;
        int length = jArr.length - 1;
        if (length >= 0) {
            while (true) {
                int i5 = length - 1;
                if (jLongValue == jArr[length]) {
                    return length;
                }
                if (i5 < 0) {
                    break;
                }
                length = i5;
            }
        }
        return -1;
    }
}
