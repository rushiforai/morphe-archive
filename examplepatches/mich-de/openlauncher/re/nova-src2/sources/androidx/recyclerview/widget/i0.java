package androidx.recyclerview.widget;

import android.util.SparseIntArray;

/* loaded from: classes.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final SparseIntArray f14998a = new SparseIntArray();

    /* renamed from: b, reason: collision with root package name */
    public final SparseIntArray f14999b = new SparseIntArray();

    /* renamed from: c, reason: collision with root package name */
    public boolean f15000c = false;

    public final int a(int i5, int i11) {
        int iC = c(i5);
        int i12 = 0;
        int i13 = 0;
        for (int i14 = 0; i14 < i5; i14++) {
            int iC2 = c(i14);
            i12 += iC2;
            if (i12 == i11) {
                i13++;
                i12 = 0;
            } else if (i12 > i11) {
                i13++;
                i12 = iC2;
            }
        }
        return i12 + iC > i11 ? i13 + 1 : i13;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0057  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x004f -> B:28:0x0054). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0051 -> B:28:0x0054). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0053 -> B:28:0x0054). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int b(int i5, int i11) {
        int iKeyAt;
        int iC;
        int iC2 = c(i5);
        if (iC2 != i11) {
            if (this.f15000c) {
                SparseIntArray sparseIntArray = this.f14998a;
                int size = sparseIntArray.size() - 1;
                int i12 = 0;
                while (i12 <= size) {
                    int i13 = (i12 + size) >>> 1;
                    if (sparseIntArray.keyAt(i13) < i5) {
                        i12 = i13 + 1;
                    } else {
                        size = i13 - 1;
                    }
                }
                int i14 = i12 - 1;
                iKeyAt = (i14 < 0 || i14 >= sparseIntArray.size()) ? -1 : sparseIntArray.keyAt(i14);
                if (iKeyAt >= 0) {
                    iC = c(iKeyAt) + sparseIntArray.get(iKeyAt);
                    iKeyAt++;
                    if (iKeyAt >= i5) {
                        int iC3 = c(iKeyAt);
                        iC += iC3;
                        if (iC == i11) {
                            iC = 0;
                        } else if (iC > i11) {
                            iC = iC3;
                        }
                        iKeyAt++;
                        if (iKeyAt >= i5) {
                            if (iC2 + iC <= i11) {
                                return iC;
                            }
                        }
                    }
                }
            }
            iKeyAt = 0;
            iC = 0;
            if (iKeyAt >= i5) {
            }
        }
        return 0;
    }

    public abstract int c(int i5);

    public final void d() {
        this.f14998a.clear();
    }
}
