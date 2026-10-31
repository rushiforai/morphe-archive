package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;
import java.util.Spliterator;
import java.util.Spliterators;
import javax.annotation.CheckForNull;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.39, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class AnonymousClass39 extends AbstractList<Integer> implements RandomAccess, Serializable {
    public static byte[] A03;
    public static final long serialVersionUID = 0;
    public final int A00;
    public final int A01;
    public final int[] A02;

    static {
        A04();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 89);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A03 = new byte[]{22, 26};
    }

    public AnonymousClass39(int[] array) {
        this(array, 0, array.length);
    }

    public AnonymousClass39(int[] array, int start, int end) {
        this.A02 = array;
        this.A01 = start;
        this.A00 = end;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.AbstractList, java.util.List
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final Integer get(int index) {
        AbstractC1335Wu.A00(index, size());
        return Integer.valueOf(this.A02[this.A01 + index]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.AbstractList, java.util.List
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final Integer set(int index, Integer element) {
        AbstractC1335Wu.A00(index, size());
        int i5 = this.A02[this.A01 + index];
        int[] iArr = this.A02;
        int i11 = this.A01 + index;
        int oldValue = ((Integer) AbstractC1335Wu.A04(element)).intValue();
        iArr[i11] = oldValue;
        return Integer.valueOf(i5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.Collection, java.lang.Iterable, java.util.List
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public final Spliterator.OfInt spliterator() {
        return Spliterators.spliterator(this.A02, this.A01, this.A00, 0);
    }

    public final int[] A05() {
        return Arrays.copyOfRange(this.A02, this.A01, this.A00);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(@CheckForNull Object target) {
        return (target instanceof Integer) && AnonymousClass19.A04(this.A02, ((Integer) target).intValue(), this.A01, this.A00) != -1;
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(@CheckForNull Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof AnonymousClass39) {
            AnonymousClass39 anonymousClass39 = (AnonymousClass39) object;
            int size = size();
            if (anonymousClass39.size() != size) {
                return false;
            }
            for (int i5 = 0; i5 < size; i5++) {
                int size2 = this.A02[this.A01 + i5];
                if (size2 != anonymousClass39.A02[anonymousClass39.A01 + i5]) {
                    return false;
                }
            }
            return true;
        }
        return super.equals(object);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = this.A01; i11 < result; i11++) {
            int result = this.A02[i11];
            i5 = (i5 * 31) + AnonymousClass19.A00(result);
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(@CheckForNull Object target) {
        int iA04;
        if ((target instanceof Integer) && (iA04 = AnonymousClass19.A04(this.A02, ((Integer) target).intValue(), this.A01, this.A00)) >= 0) {
            int i5 = this.A01;
            return iA04 - i5;
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(@CheckForNull Object target) {
        int iA05;
        if ((target instanceof Integer) && (iA05 = AnonymousClass19.A05(this.A02, ((Integer) target).intValue(), this.A01, this.A00)) >= 0) {
            int i5 = this.A01;
            return iA05 - i5;
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.A00 - this.A01;
    }

    @Override // java.util.AbstractList, java.util.List
    public final List<Integer> subList(int fromIndex, int toIndex) {
        int size = size();
        AbstractC1335Wu.A0B(fromIndex, toIndex, size);
        if (fromIndex == toIndex) {
            return Collections.emptyList();
        }
        return new AnonymousClass39(this.A02, this.A01 + fromIndex, this.A01 + toIndex);
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        StringBuilder sb2 = new StringBuilder(size() * 5);
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST).append(this.A02[this.A01]);
        for (int i5 = this.A01 + 1; i5 < this.A00; i5++) {
            sb2.append(A02(0, 2, 99)).append(this.A02[i5]);
        }
        StringBuilder builder = sb2.append(AbstractJsonLexerKt.END_LIST);
        return builder.toString();
    }
}
