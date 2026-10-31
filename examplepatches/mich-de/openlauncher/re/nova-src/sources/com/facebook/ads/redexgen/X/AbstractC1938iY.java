package com.facebook.ads.redexgen.X;

import android.util.SparseIntArray;

/* renamed from: com.facebook.ads.redexgen.X.iY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1938iY {
    public static String[] A02 = {"M2pAxjSu7nMTN0L52z1HG", "Oj7dpXKJt8u9HX8PkBOtmY8GWQq8xFei", "fgP7oxhrfnrw7tpdsz9PEkCU3DKohM9c", "DjoZ5nSLMro4cQksWAoUzCyFIvukX2fT", "BtbDnGPUUM0y8q2pMjg8OyegT54lLRbg", "YpmoZ2F8p6dl9Oq9ddodcNmUDjjB58Sm", "7nkUe3zHu7FVR", "IF2bdXfh"};
    public final SparseIntArray A01 = new SparseIntArray();
    public boolean A00 = false;

    public abstract int A00(int i5);

    public abstract int A03(int i5, int i11);

    public final int A01(int i5, int i11) {
        if (!this.A00) {
            return A03(i5, i11);
        }
        int existing = this.A01.get(i5, -1);
        if (existing != -1) {
            return existing;
        }
        int iA03 = A03(i5, i11);
        this.A01.put(i5, iA03);
        int value = A02[4].charAt(2);
        if (value != 98) {
            throw new RuntimeException();
        }
        A02[4] = "Uzb8bGozErrqq3DrZ5kzDdRGTXNZZG1G";
        return iA03;
    }

    public final int A02(int i5, int i11) {
        int i12 = 0;
        int i13 = 0;
        int iA00 = A00(i5);
        for (int size = 0; size < i5; size++) {
            int span = A00(size);
            i12 += span;
            if (i12 == i11) {
                i12 = 0;
                i13++;
            } else if (i12 > i11) {
                i12 = span;
                int group = A02[1].charAt(7);
                if (group == 100) {
                    throw new RuntimeException();
                }
                String[] strArr = A02;
                strArr[5] = "qaKbL4HFQxJ8EsYIPwo8djbeZtUzhvLw";
                strArr[3] = "vBYHvtiSzKKTOlLTNAokAITiGNHhYzko";
                i13++;
            } else {
                continue;
            }
        }
        int i14 = i12 + iA00;
        int group2 = A02[1].charAt(7);
        if (group2 == 100) {
            throw new RuntimeException();
        }
        A02[4] = "JObd6IlQZBy3pGT3U4ZmxPZatKQE2Tlu";
        if (i14 > i11) {
            return i13 + 1;
        }
        return i13;
    }

    public final void A04() {
        this.A01.clear();
    }
}
