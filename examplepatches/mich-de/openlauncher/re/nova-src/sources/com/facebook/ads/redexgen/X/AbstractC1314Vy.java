package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.util.Comparator;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1314Vy {
    public static final AbstractC1314Vy A00 = new AbstractC1314Vy() { // from class: com.facebook.ads.redexgen.X.9q
        private final AbstractC1314Vy A00(int result) {
            if (result < 0) {
                return AbstractC1314Vy.A02;
            }
            if (result > 0) {
                return AbstractC1314Vy.A01;
            }
            return AbstractC1314Vy.A00;
        }

        @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
        public final int A05() {
            return 0;
        }

        @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
        public final AbstractC1314Vy A06(int left, int right) {
            return A00(Integer.compare(left, right));
        }

        @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
        public final AbstractC1314Vy A07(long left, long right) {
            return A00(Long.compare(left, right));
        }

        @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
        public final <T> AbstractC1314Vy A08(@ParametricNullness T left, @ParametricNullness T right, Comparator<T> comparator) {
            return A00(comparator.compare(left, right));
        }

        @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
        public final AbstractC1314Vy A09(boolean left, boolean right) {
            return A00(Boolean.compare(left, right));
        }

        @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
        public final AbstractC1314Vy A0A(boolean left, boolean right) {
            return A00(Boolean.compare(right, left));
        }
    };
    public static final AbstractC1314Vy A01;
    public static final AbstractC1314Vy A02;

    public abstract int A05();

    public abstract AbstractC1314Vy A06(int left, int right);

    public abstract AbstractC1314Vy A07(long left, long right);

    public abstract <T> AbstractC1314Vy A08(@ParametricNullness T left, @ParametricNullness T right, Comparator<T> comparator);

    public abstract AbstractC1314Vy A09(boolean left, boolean right);

    public abstract AbstractC1314Vy A0A(boolean left, boolean right);

    static {
        final int i5 = -1;
        A02 = new AbstractC1314Vy(i5) { // from class: com.facebook.ads.redexgen.X.9p
            public final int A00;

            {
                super();
                this.A00 = i5;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final int A05() {
                return this.A00;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A06(int left, int right) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A07(long left, long right) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final <T> AbstractC1314Vy A08(@ParametricNullness T left, @ParametricNullness T right, Comparator<T> comparator) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A09(boolean left, boolean right) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A0A(boolean left, boolean right) {
                return this;
            }
        };
        final int i11 = 1;
        A01 = new AbstractC1314Vy(i11) { // from class: com.facebook.ads.redexgen.X.9p
            public final int A00;

            {
                super();
                this.A00 = i11;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final int A05() {
                return this.A00;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A06(int left, int right) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A07(long left, long right) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final <T> AbstractC1314Vy A08(@ParametricNullness T left, @ParametricNullness T right, Comparator<T> comparator) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A09(boolean left, boolean right) {
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1314Vy
            public final AbstractC1314Vy A0A(boolean left, boolean right) {
                return this;
            }
        };
    }

    public AbstractC1314Vy() {
    }

    public static AbstractC1314Vy A01() {
        return A00;
    }
}
