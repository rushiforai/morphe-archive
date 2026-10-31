package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1304Vn {
    public static byte[] A00;
    public static String[] A01 = {"9N6fClpvr5LogfhEoC3Ym2ZOcMEkPqse", "x6vATfT7Vf", "aFaZ9dc", "0MkqZTlH9L2nw01RphYptsRi2kX68x5e", "l3MmWfWW1bK2VQW7K4iTAOafgi6wKvuU", "qUnT2LTLLCOBUNZqrcPphJ4Y9y0yxiuE", "FSwRZrZn60", "Ot1RG"};

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[6].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[4] = "e39X5axlEPHpWOZwt6dGSAqI6KpvofZo";
            strArr2[5] = "PyZJSPVIBtkFnrexwHSJUxDm1MLb3Emp";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 92);
            i13++;
        }
    }

    public static void A08() {
        A00 = new byte[]{49, 51, 38, 37, 42, 36, 34, 53, 38};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static <T> boolean A0B(Iterator<T> iterator, InterfaceC1334Wt<? super T> predicate) {
        return A00(iterator, predicate) != -1;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A0F(Iterator<?> iterator1, Iterator<?> iterator2) {
        while (iterator1.hasNext()) {
            if (!iterator2.hasNext() || !A6.A01(iterator1.next(), iterator2.next())) {
                return false;
            }
        }
        return !iterator2.hasNext();
    }

    static {
        A08();
    }

    /* JADX WARN: Code restructure failed: missing block: B:6:0x002a, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super T> */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static <T> int A00(Iterator<T> iterator, InterfaceC1334Wt<? super T> predicate) {
        AbstractC1335Wu.A05(predicate, A07(0, 9, 101));
        int i5 = 0;
        while (true) {
            boolean zHasNext = iterator.hasNext();
            String[] strArr = A01;
            String str = strArr[3];
            String str2 = strArr[0];
            int iCharAt = str.charAt(31);
            int i11 = str2.charAt(31);
            if (iCharAt != i11) {
                break;
            }
            A01[7] = "qkIcI";
            if (zHasNext) {
                boolean zA4d = predicate.A4d(iterator.next());
                if (A01[2].length() == 25) {
                    break;
                }
                String[] strArr2 = A01;
                strArr2[3] = "KgpdcHP4Qu3Yo9bGKYk4wIx2No7jT03e";
                strArr2[0] = "fT447mfK0jSIpwOFgxTZmIAvIDIY5xBe";
                if (zA4d) {
                    return i5;
                }
                i5++;
            } else {
                return -1;
            }
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super T> */
    public static <T> VV<T> A01(final Iterator<T> unfiltered, final InterfaceC1334Wt<? super T> retainIfTrue) {
        AbstractC1335Wu.A04(unfiltered);
        AbstractC1335Wu.A04(retainIfTrue);
        return new A2<T>() { // from class: com.facebook.ads.redexgen.X.4c
            public static String[] A02 = {"PY0ykusbaAzaA0tdkuvjz0VYH", "h7aoUrwlHY9NGl5V3azO8LhtwV4y8foG", "25zZmy69rHYb2WrLrifApLhpHCniZbXh", "f06ulwQ2X5IERHUfRYMq5r1GFhmBB2J1", b.f42142b, "LVKko7v5T", "6ykFsfQ2ClQma73S90yp2Rj3IMh9zHwC", "16ZsLBVPK0yZwF"};

            @Override // com.facebook.ads.redexgen.X.A2
            @CheckForNull
            public final T A02() {
                T t6;
                do {
                    boolean zHasNext = unfiltered.hasNext();
                    if (A02[5].length() == 3) {
                        throw new RuntimeException();
                    }
                    A02[6] = "Y0rbe9DkfNE9HDv49VA4209Q8w546LLU";
                    if (zHasNext) {
                        t6 = (T) unfiltered.next();
                    } else {
                        return A01();
                    }
                } while (!retainIfTrue.A4d(t6));
                return t6;
            }
        };
    }

    public static <T> Iterator<T> A02() {
        return EnumC1305Vo.A02;
    }

    public static <T> VV<T> A03(@ParametricNullness final T value) {
        return new VV<T>(value) { // from class: com.facebook.ads.redexgen.X.9j
            public boolean A00;
            public final T A01;

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9j != com.google.common.collect.Iterators$SingletonIterator<T> */
            {
                this.A01 = value;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9j != com.google.common.collect.Iterators$SingletonIterator<T> */
            @Override // java.util.Iterator
            public final boolean hasNext() {
                return !this.A00;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9j != com.google.common.collect.Iterators$SingletonIterator<T> */
            @Override // java.util.Iterator
            @ParametricNullness
            public final T next() {
                if (!this.A00) {
                    this.A00 = true;
                    return this.A01;
                }
                throw new NoSuchElementException();
            }
        };
    }

    @CheckForNull
    public static <T> T A04(Iterator<T> iterator) {
        if (iterator.hasNext()) {
            T result = iterator.next();
            iterator.remove();
            return result;
        }
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super T> */
    @ParametricNullness
    public static <T> T A05(Iterator<T> iterator, InterfaceC1334Wt<? super T> predicate) {
        AbstractC1335Wu.A04(iterator);
        AbstractC1335Wu.A04(predicate);
        while (iterator.hasNext()) {
            T next = iterator.next();
            boolean zA4d = predicate.A4d(next);
            String[] strArr = A01;
            if (strArr[6].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = "TLTDT0em8OPGsvbXN9kIxspoKISGsM7e";
            strArr2[0] = "UEE5niBFp0Eu5JfZ6Tbd8HeREOlvLCve";
            if (zA4d) {
                return next;
            }
        }
        throw new NoSuchElementException();
    }

    @ParametricNullness
    public static <T> T A06(@ParametricNullness Iterator<? extends T> iterator, T defaultValue) {
        if (!iterator.hasNext()) {
            return defaultValue;
        }
        T defaultValue2 = iterator.next();
        return defaultValue2;
    }

    public static void A09(Iterator<?> iterator) {
        AbstractC1335Wu.A04(iterator);
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static <T> boolean A0A(Collection<T> addTo, Iterator<? extends T> iterator) {
        AbstractC1335Wu.A04(addTo);
        AbstractC1335Wu.A04(iterator);
        boolean z11 = false;
        while (wasModified) {
            boolean wasModified = addTo.add(iterator.next());
            z11 |= wasModified;
        }
        return z11;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super T> */
    /* JADX WARN: Incorrect condition in loop: B:4:0x0008 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static <T> boolean A0C(Iterator<T> removeFrom, InterfaceC1334Wt<? super T> predicate) {
        AbstractC1335Wu.A04(predicate);
        boolean z11 = false;
        while (modified) {
            boolean modified = predicate.A4d(removeFrom.next());
            if (modified) {
                removeFrom.remove();
                if (A01[2].length() == 25) {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[3] = "sMZfE14AwjxZOYQOlM9o8PsdLIVrvXme";
                strArr[0] = "mLE0wws09Z1jmvTbLn99AUGk1x8kjTve";
                z11 = true;
            }
        }
        return z11;
    }

    public static boolean A0D(@CheckForNull Iterator<?> iterator, Object element) {
        if (element == null) {
            while (iterator.hasNext()) {
                if (iterator.next() == null) {
                    return true;
                }
            }
            return false;
        }
        while (iterator.hasNext()) {
            boolean zEquals = element.equals(iterator.next());
            String[] strArr = A01;
            if (strArr[6].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            A01[7] = "MSXYr";
            if (zEquals) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0008 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0E(Iterator<?> removeFrom, Collection<?> elementsToRemove) {
        AbstractC1335Wu.A04(elementsToRemove);
        boolean z11 = false;
        while (result) {
            Object next = removeFrom.next();
            String[] strArr = A01;
            if (strArr[3].charAt(31) != strArr[0].charAt(31)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[6] = "BHcJFk2XLj";
            strArr2[1] = "0i5THSQWJg";
            boolean result = elementsToRemove.contains(next);
            if (result) {
                removeFrom.remove();
                String[] strArr3 = A01;
                if (strArr3[4].charAt(13) != strArr3[5].charAt(13)) {
                    String[] strArr4 = A01;
                    strArr4[4] = "eL5kF2HBDH4ajEUG2G4UVtUleJgFeXO0";
                    strArr4[5] = "Y3CBehoSs3ZNPfORsVFCdKcVWTzjmRHZ";
                    z11 = true;
                } else {
                    String[] strArr5 = A01;
                    strArr5[4] = "tvqKMKL5Tu5RfYCa2YiDxaKi6ksjwumI";
                    strArr5[5] = "kw1WU0ltlxVitFrDWdz1MX63AdvZ1m2E";
                    z11 = false;
                }
            }
        }
        return z11;
    }
}
