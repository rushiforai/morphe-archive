package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.util.NoSuchElementException;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: assets/audience_network/classes.dex */
public abstract class A2<T> extends VV<T> {
    public static String[] A02 = {"4RgbJV0qGf8SuHXq5JbmXVV5TyQTNBlb", "gkkZmAAR9MDQllnBNroz6VYWONmMQjLj", "AIiPPrPbjg7pikgxcl7OJblBXNBjo0Mx", "Uxxr4eTHNmfkI7zvU1LXwIl86PSmkM1a", "jdMA63Gsoe0x1K2j56kjKDqID9j7EL7f", "Cm8HYKLz5mThjHCwoFfqtsHmTVMIGWum", "HrfETukxqcJZpxzMZLOtzPP5sJCVTw", "w75sqtxTSmQjCV5Vlri8FwgUAw8RW0"};
    public WZ A00 = WZ.A05;

    @CheckForNull
    public T A01;

    @CheckForNull
    public abstract T A02();

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A2 != com.google.common.collect.AbstractIterator<T> */
    private boolean A00() {
        this.A00 = WZ.A04;
        this.A01 = A02();
        if (this.A00 != WZ.A03) {
            this.A00 = WZ.A06;
            return true;
        }
        String[] strArr = A02;
        if (strArr[5].charAt(21) == strArr[0].charAt(21)) {
            throw new RuntimeException();
        }
        A02[6] = "bB8pCNLXoRooIlg3oPZENNRQorRGEH";
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A2 != com.google.common.collect.AbstractIterator<T> */
    @CheckForNull
    public final T A01() {
        this.A00 = WZ.A03;
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A2 != com.google.common.collect.AbstractIterator<T> */
    @Override // java.util.Iterator
    public final boolean hasNext() {
        AbstractC1335Wu.A0D(this.A00 != WZ.A04);
        switch (this.A00) {
            case A06:
                return true;
            case A05:
            default:
                return A00();
            case A03:
                return false;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A2 != com.google.common.collect.AbstractIterator<T> */
    @Override // java.util.Iterator
    @ParametricNullness
    public final T next() {
        if (hasNext()) {
            this.A00 = WZ.A05;
            T t6 = (T) Ve.A01(this.A01);
            this.A01 = null;
            return t6;
        }
        throw new NoSuchElementException();
    }
}
