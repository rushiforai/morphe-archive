package com.facebook.ads.redexgen.X;

import com.google.common.base.ParametricNullness;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.annotation.CheckForNull;

/* loaded from: assets/audience_network/classes.dex */
public class A5<T> implements InterfaceC1334Wt<T>, Serializable {
    public static byte[] A01;
    public static final long serialVersionUID = 0;
    public final List<? extends InterfaceC1334Wt<? super T>> A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 123);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{71, 84, 74};
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A5 != com.google.common.base.Predicates$AndPredicate<T> */
    public A5(List<? extends InterfaceC1334Wt<? super T>> components) {
        this.A00 = components;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A5 != com.google.common.base.Predicates$AndPredicate<T> */
    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1334Wt
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A4d(@ParametricNullness T t6) {
        for (int i5 = 0; i5 < i; i5++) {
            if (!this.A00.get(i5).A4d(t6)) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A5 != com.google.common.base.Predicates$AndPredicate<?> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A5 != com.google.common.base.Predicates$AndPredicate<T> */
    public final boolean equals(@CheckForNull Object obj) {
        if (obj instanceof A5) {
            return this.A00.equals(((A5) obj).A00);
        }
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A5 != com.google.common.base.Predicates$AndPredicate<T> */
    public final int hashCode() {
        return this.A00.hashCode() + 306654252;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A5 != com.google.common.base.Predicates$AndPredicate<T> */
    public final String toString() {
        return AbstractC1328Wn.A02(A00(0, 3, 107), this.A00);
    }
}
