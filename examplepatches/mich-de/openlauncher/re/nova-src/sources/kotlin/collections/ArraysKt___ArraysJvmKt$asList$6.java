package kotlin.collections;

import java.util.RandomAccess;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004¨\u0006\u0005"}, d2 = {"kotlin/collections/ArraysKt___ArraysJvmKt$asList$6", "Lkotlin/collections/AbstractList;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ArraysKt___ArraysJvmKt$asList$6 extends AbstractList<Double> implements RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ double[] f71727b;

    public ArraysKt___ArraysJvmKt$asList$6(double[] dArr) {
        this.f71727b = dArr;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f71727b.length;
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (!(obj instanceof Double)) {
            return false;
        }
        double dDoubleValue = ((Number) obj).doubleValue();
        for (double d5 : this.f71727b) {
            if (Double.doubleToLongBits(d5) == Double.doubleToLongBits(dDoubleValue)) {
                return true;
            }
        }
        return false;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        return Double.valueOf(this.f71727b[i5]);
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Double)) {
            return -1;
        }
        double dDoubleValue = ((Number) obj).doubleValue();
        double[] dArr = this.f71727b;
        int length = dArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (Double.doubleToLongBits(dArr[i5]) == Double.doubleToLongBits(dDoubleValue)) {
                return i5;
            }
        }
        return -1;
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        return this.f71727b.length == 0;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        if (!(obj instanceof Double)) {
            return -1;
        }
        double dDoubleValue = ((Number) obj).doubleValue();
        double[] dArr = this.f71727b;
        int length = dArr.length - 1;
        if (length >= 0) {
            while (true) {
                int i5 = length - 1;
                if (Double.doubleToLongBits(dArr[length]) == Double.doubleToLongBits(dDoubleValue)) {
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
