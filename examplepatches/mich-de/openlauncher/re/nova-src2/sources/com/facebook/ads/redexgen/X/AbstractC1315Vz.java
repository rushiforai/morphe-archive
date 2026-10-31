package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1315Vz {
    public static byte[] A00;
    public static String[] A01 = {"zBmpvFh5L8hFLKhmuaIFuJbG4blHASwK", "36OcPr1vue", "PyZWi5qqlEvHNZundVaO8tNzy4Zvs7vW", "oQy2wC5BESVA1KPeLLFlD7lrEfkT5mlJ", "c76oENASBGNcoZuqdldaO", "5Ec5aPb6ZN4lztoIgv8H6tVzA6lwMksY", "7ORF3ukj5Iy", "pobdu"};

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A00 = new byte[]{45, 53, 51, 52, -32, 34, 37, -32, 48, 47, 55, 37, 50, -32, 47, 38, -32, -14, -32, 34, 37, 52, 55, 37, 37, 46, -32, -14, 30, -15, -32, 33, 46, 36, -32, -14, 30, -13, -16, -6, -32};
    }

    static {
        A09();
    }

    public static int A00(int mask) {
        return (mask < 32 ? 4 : 2) * (mask + 1);
    }

    public static int A01(int expectedSize) {
        return Math.max(4, AbstractC1312Vv.A01(expectedSize + 1, 1.0d));
    }

    public static int A02(int value, int mask) {
        return (~mask) & value;
    }

    public static int A03(int entry, int mask) {
        return entry & mask;
    }

    public static int A04(int prefix, int suffix, int mask) {
        return ((~mask) & prefix) | (suffix & mask);
    }

    public static int A05(Object table, int index) {
        if (table instanceof byte[]) {
            return ((byte[]) table)[index] & 255;
        }
        if (table instanceof short[]) {
            return ((short[]) table)[index] & 65535;
        }
        return ((int[]) table)[index];
    }

    public static int A06(@CheckForNull Object key, @CheckForNull Object value, @CheckForNull int mask, Object table, int[] entries, Object[] keys, Object[] values) {
        int hash = AbstractC1312Vv.A02(key);
        int hashPrefix = hash & mask;
        int entryIndex = A05(table, hashPrefix);
        if (entryIndex == 0) {
            return -1;
        }
        int lastEntryIndex = A02(hash, mask);
        int tableIndex = A01[4].length();
        if (tableIndex != 21) {
            throw new RuntimeException();
        }
        A01[4] = "5R5dORbzDzi4uIBMBVlti";
        int hash2 = -1;
        do {
            int entryIndex2 = entryIndex - 1;
            int next = entries[entryIndex2];
            int tableIndex2 = A02(next, mask);
            if (tableIndex2 == lastEntryIndex && A6.A01(key, keys[entryIndex2]) && (values == null || A6.A01(value, values[entryIndex2]))) {
                int next2 = A03(next, mask);
                if (hash2 == -1) {
                    A0B(table, hashPrefix, next2);
                } else {
                    int tableIndex3 = entries[hash2];
                    entries[hash2] = A04(tableIndex3, next2, mask);
                }
                return entryIndex2;
            }
            hash2 = entryIndex2;
            entryIndex = A03(next, mask);
        } while (entryIndex != 0);
        return -1;
    }

    public static Object A07(int buckets) {
        if (buckets >= 2 && buckets <= 1073741824 && Integer.highestOneBit(buckets) == buckets) {
            if (buckets <= 256) {
                byte[] bArr = new byte[buckets];
                if (A01[7].length() == 8) {
                    throw new RuntimeException();
                }
                A01[7] = "qgtA4";
                return bArr;
            }
            if (buckets <= 65536) {
                return new short[buckets];
            }
            return new int[buckets];
        }
        throw new IllegalArgumentException(A08(0, 41, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + buckets);
    }

    public static void A0A(Object table) {
        if (table instanceof byte[]) {
            Arrays.fill((byte[]) table, (byte) 0);
        } else if (table instanceof short[]) {
            Arrays.fill((short[]) table, (short) 0);
        } else {
            Arrays.fill((int[]) table, 0);
        }
    }

    public static void A0B(Object table, int index, int entry) {
        if (table instanceof byte[]) {
            byte[] bArr = (byte[]) table;
            if (A01[2].charAt(0) == 'm') {
                throw new RuntimeException();
            }
            A01[4] = "yRBzgKgf39J0pWEvhQ3tH";
            bArr[index] = (byte) entry;
            return;
        }
        if (table instanceof short[]) {
            ((short[]) table)[index] = (short) entry;
        } else {
            ((int[]) table)[index] = entry;
        }
    }
}
