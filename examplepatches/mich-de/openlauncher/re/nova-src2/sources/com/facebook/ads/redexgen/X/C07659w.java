package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.io.Serializable;
import java.util.Arrays;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9w, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07659w<F, T> extends AbstractC1294Vc<F> implements Serializable {
    public static byte[] A02;
    public static final long serialVersionUID = 0;
    public final InterfaceC1338Wy<F, ? extends T> A00;
    public final AbstractC1294Vc<T> A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 13);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{109, 21, 84, 85, 105, 94, 72, 78, 87, 79, 116, 93, 19};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Comparator
    public final boolean equals(@CheckForNull Object object) {
        if (object == this) {
            return true;
        }
        if (!(object instanceof C07659w)) {
            return false;
        }
        C07659w c07659w = (C07659w) object;
        return this.A00.equals(c07659w.A00) && this.A01.equals(c07659w.A01);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9w != com.google.common.collect.ByFunctionOrdering<F, T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vc != com.google.common.collect.Ordering<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wy != com.google.common.base.Function<F, ? extends T> */
    public C07659w(InterfaceC1338Wy<F, ? extends T> function, AbstractC1294Vc<T> ordering) {
        this.A00 = (InterfaceC1338Wy) AbstractC1335Wu.A04(function);
        this.A01 = (AbstractC1294Vc) AbstractC1335Wu.A04(ordering);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9w != com.google.common.collect.ByFunctionOrdering<F, T> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc, java.util.Comparator
    public final int compare(@ParametricNullness F f11, @ParametricNullness F f12) {
        return this.A01.compare(this.A00.A4c(f11), this.A00.A4c(f12));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9w != com.google.common.collect.ByFunctionOrdering<F, T> */
    public final int hashCode() {
        return A6.A00(this.A00, this.A01);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9w != com.google.common.collect.ByFunctionOrdering<F, T> */
    public final String toString() {
        return this.A01 + A00(1, 12, 54) + this.A00 + A00(0, 1, 73);
    }
}
