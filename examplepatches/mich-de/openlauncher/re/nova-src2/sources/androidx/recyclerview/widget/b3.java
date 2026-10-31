package androidx.recyclerview.widget;

import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class b3 {

    /* renamed from: a, reason: collision with root package name */
    public Object f14914a;

    /* renamed from: b, reason: collision with root package name */
    public Object f14915b;

    public void a() {
        int[] iArr = (int[]) this.f14914a;
        if (iArr != null) {
            Arrays.fill(iArr, -1);
        }
        this.f14915b = null;
    }

    public void b(int i5) {
        int[] iArr = (int[]) this.f14914a;
        if (iArr == null) {
            int[] iArr2 = new int[Math.max(i5, 10) + 1];
            this.f14914a = iArr2;
            Arrays.fill(iArr2, -1);
        } else if (i5 >= iArr.length) {
            int length = iArr.length;
            while (length <= i5) {
                length *= 2;
            }
            int[] iArr3 = new int[length];
            this.f14914a = iArr3;
            System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
            int[] iArr4 = (int[]) this.f14914a;
            Arrays.fill(iArr4, iArr.length, iArr4.length, -1);
        }
    }

    public void c(int i5, int i11) {
        int[] iArr = (int[]) this.f14914a;
        if (iArr == null || i5 >= iArr.length) {
            return;
        }
        int i12 = i5 + i11;
        b(i12);
        int[] iArr2 = (int[]) this.f14914a;
        System.arraycopy(iArr2, i5, iArr2, i12, (iArr2.length - i5) - i11);
        Arrays.fill((int[]) this.f14914a, i5, i12, -1);
        ArrayList arrayList = (ArrayList) this.f14915b;
        if (arrayList == null) {
            return;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem staggeredGridLayoutManager$LazySpanLookup$FullSpanItem = (StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem) ((ArrayList) this.f14915b).get(size);
            int i13 = staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14859a;
            if (i13 >= i5) {
                staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14859a = i13 + i11;
            }
        }
    }

    public void d(int i5, int i11) {
        int[] iArr = (int[]) this.f14914a;
        if (iArr == null || i5 >= iArr.length) {
            return;
        }
        int i12 = i5 + i11;
        b(i12);
        int[] iArr2 = (int[]) this.f14914a;
        System.arraycopy(iArr2, i12, iArr2, i5, (iArr2.length - i5) - i11);
        int[] iArr3 = (int[]) this.f14914a;
        Arrays.fill(iArr3, iArr3.length - i11, iArr3.length, -1);
        ArrayList arrayList = (ArrayList) this.f14915b;
        if (arrayList == null) {
            return;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem staggeredGridLayoutManager$LazySpanLookup$FullSpanItem = (StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem) ((ArrayList) this.f14915b).get(size);
            int i13 = staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14859a;
            if (i13 >= i5) {
                if (i13 < i12) {
                    ((ArrayList) this.f14915b).remove(size);
                } else {
                    staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14859a = i13 - i11;
                }
            }
        }
    }
}
