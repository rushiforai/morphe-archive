package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.h0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1844h0<E> implements Cloneable {
    public static byte[] A04;
    public static final Object A05;
    public int A00;
    public boolean A01;
    public long[] A02;
    public Object[] A03;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 54);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A04 = new byte[]{19, 79, 83, 82, 72, 27, 118, 90, 75, 18, 91, 87, 51, 53};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A0B(long j11, E e3) {
        int iA03 = AbstractC1843gz.A03(this.A02, this.A00, j11);
        if (iA03 >= 0) {
            this.A03[iA03] = e3;
            return;
        }
        int i5 = ~iA03;
        if (i5 < this.A00 && this.A03[i5] == A05) {
            this.A02[i5] = j11;
            this.A03[i5] = e3;
            return;
        }
        if (this.A01 && this.A00 >= this.A02.length) {
            A04();
            i5 = ~AbstractC1843gz.A03(this.A02, this.A00, j11);
        }
        if (this.A00 >= this.A02.length) {
            int iA00 = AbstractC1843gz.A00(this.A00 + 1);
            long[] jArr = new long[iA00];
            Object[] objArr = new Object[iA00];
            System.arraycopy(this.A02, 0, jArr, 0, this.A02.length);
            System.arraycopy(this.A03, 0, objArr, 0, this.A03.length);
            this.A02 = jArr;
            this.A03 = objArr;
        }
        if (this.A00 - i5 != 0) {
            System.arraycopy(this.A02, i5, this.A02, i5 + 1, this.A00 - i5);
            System.arraycopy(this.A03, i5, this.A03, i5 + 1, this.A00 - i5);
        }
        this.A02[i5] = j11;
        this.A03[i5] = e3;
        this.A00++;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final String toString() {
        if (A06() <= 0) {
            return A03(12, 2, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        StringBuilder sb2 = new StringBuilder(this.A00 * 28);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        for (int i5 = 0; i5 < this.A00; i5++) {
            if (i5 > 0) {
                sb2.append(A03(10, 2, 65));
            }
            sb2.append(A00(i5));
            sb2.append('=');
            E eA07 = A07(i5);
            if (eA07 != this) {
                sb2.append(eA07);
            } else {
                sb2.append(A03(0, 10, 13));
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }

    static {
        A05();
        A05 = new Object();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public C1844h0() {
        this(10);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public C1844h0(int i5) {
        this.A01 = false;
        if (i5 == 0) {
            this.A02 = AbstractC1843gz.A01;
            this.A03 = AbstractC1843gz.A02;
        } else {
            int iA00 = AbstractC1843gz.A00(i5);
            this.A02 = new long[iA00];
            this.A03 = new Object[iA00];
        }
        this.A00 = 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    private final long A00(int i5) {
        if (this.A01) {
            A04();
        }
        return this.A02[i5];
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final C1844h0<E> clone() {
        C1844h0<E> c1844h0 = null;
        try {
            c1844h0 = (C1844h0) super.clone();
            c1844h0.A02 = (long[]) this.A02.clone();
            c1844h0.A03 = (Object[]) this.A03.clone();
            return c1844h0;
        } catch (CloneNotSupportedException unused) {
            return c1844h0;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    private final E A02(long j11, E e3) {
        int iA03 = AbstractC1843gz.A03(this.A02, this.A00, j11);
        if (iA03 < 0 || this.A03[iA03] == A05) {
            return e3;
        }
        return (E) this.A03[iA03];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    private void A04() {
        int i5 = this.A00;
        int i11 = 0;
        long[] jArr = this.A02;
        Object[] objArr = this.A03;
        for (int i12 = 0; i12 < i5; i12++) {
            Object obj = objArr[i12];
            if (obj != A05) {
                if (i12 != i11) {
                    jArr[i11] = jArr[i12];
                    objArr[i11] = obj;
                    objArr[i12] = null;
                }
                i11++;
            }
        }
        this.A01 = false;
        this.A00 = i11;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public final int A06() {
        if (this.A01) {
            A04();
        }
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public final E A07(int i5) {
        if (this.A01) {
            A04();
        }
        return (E) this.A03[i5];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public final E A08(long j11) {
        return A02(j11, null);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public final void A09() {
        int i5 = this.A00;
        Object[] objArr = this.A03;
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = null;
        }
        this.A00 = 0;
        this.A01 = false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h0 != com.facebook.ads.internal.androidx.support.v4.util.LongSparseArray<E> */
    public final void A0A(int i5) {
        if (this.A03[i5] != A05) {
            this.A03[i5] = A05;
            this.A01 = true;
        }
    }
}
