package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.mo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2196mo implements Closeable {
    public static byte[] A03;
    public static String[] A04 = {"Gii7pzXwK3MpiHC8B9NJqbzL", "8Pqq6WSNf8vKrPOx7XSY9C7", "LI4waC8pDZc7B2Ob9Mw4umyD0YVp7Iep", "HQVOS1q9k5iJuCSZxlwiHtDpSPIo2CAf", "0wBrPWYDPAFL7IDgbo0bQ8s", "e5cW7wYXRGqKaYX8", "aNUR51q123XM3tsFczjtkJvp", "F8bzMC9kGkJ5CLi2olbpsia5Bq7Sq0"};
    public final C2186me A01;
    public final Deque<C2195mn> A02 = new LinkedList();
    public boolean A00 = false;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A04[5].length() != 16) {
                throw new RuntimeException();
            }
            String[] strArr = A04;
            strArr[0] = "u097qyCEcqL0dCUFF3RqUSqj";
            strArr[6] = "TBb0mUAcLDsBFXHpNBOq9rzF";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 113);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        byte[] bArr = {5, 41, 51, 42, 34, 102, 40, 41, 50, 102, 39, 34, 34, 102, 52, 35, 37, 41, 52, 34, 102, 50, 41, 102, 40, 35, 49, 42, 63, 102, 39, 34, 34, 35, 34, 102, 32, 47, 42, 35, 42, 13, 5, 0, 9, 8, 76, 24, 3, 76, 8, 9, 0, 9, 24, 9, 76, 10, 5, 0, 9, 76, 75, 73, 31, 75, 106, 77, 69, 64, 73, 72, 12, 88, 67, 12, 64, 69, 95, 88, 12, 74, 69, 64, 73, 72, 12, 69, 66, 12, 72, 69, 94, 73, 79, 88, 67, 94, 85, 12, 11, 9, 95, 11, 28, 59, 51, 54, 63, 62, 122, 46, 53, 122, 54, 53, 59, 62, 122, 60, 51, 54, 63, 122, 125, AbstractJsonLexerKt.TC_INVALID, 41, 125, 118, 122, 41, 49, 51, 42, 42, 51, 52, 61, 122, 59, 54, 54, 122, 42, 40, 63, 44, 51, 53, 47, 41, 122, 60, 51, 54, 63, 41, 122, 47, 52, 46, 51, 54, 122, AbstractJsonLexerKt.TC_INVALID, 62, 61, 28, 29, 94, 16, 28, 29, 7, 26, 20, 6, 28, 6, 0, 83, 29, 18, 30, 22, 23, 83, 21, 26, 31, 22, 83, 26, 29, 83, 31, 28, 20, 20, 26, 29, 20, 83, 23, 26, 1, 22, 16, 7, 28, 1, 10, 73, 83, 86, 23, 95, 83, 30, 26, 29, 83, 26, 0, 83, 86, 23, 29, 42, 44, 32, 61, 43, 9, 38, 35, 42, 28, 42, 62, 58, 42, 33, 44, 42, 111, 46, 35, 61, 42, 46, 43, 54, 111, 44, 35, 32, 60, 42, 43, 107, 80, 85, 80, 81, 73, 80, 30, 88, 87, 82, 91, 30, 87, 80, 30, 82, 81, 89, 89, 87, 80, 89, 30, 90, 87, 76, 91, 93, 74, 81, 76, 71, 4, 30, 25, 27, 77, 25};
        String[] strArr = A04;
        if (strArr[3].charAt(18) != strArr[2].charAt(18)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[3] = "rXUNYUFSY3Wwjf0Rt9wI3pKgcM0mrVi5";
        strArr2[2] = "NbfmFkvRWQfztm8Xt0wszzyUhHEjBSFU";
        A03 = bArr;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized int A09() throws IOException {
        int iA01;
        if (this.A00) {
            throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
        }
        iA01 = 0;
        Iterator<C2195mn> it = this.A02.iterator();
        while (it.hasNext()) {
            iA01 += it.next().A01();
        }
        return iA01;
    }

    static {
        A03();
    }

    public C2196mo(C2186me c2186me, InterfaceC2194mm interfaceC2194mm) throws NumberFormatException, IOException {
        this.A01 = c2186me;
        A05(c2186me, interfaceC2194mm);
        if (this.A02.isEmpty()) {
            A00();
        }
    }

    private C2195mn A00() throws IOException {
        int iA00 = -1;
        if (!this.A02.isEmpty()) {
            iA00 = this.A02.getLast().A00();
        }
        int i5 = iA00 + 1;
        this.A02.add(new C2195mn(i5, new C2192mk(new File(this.A01.A05(), A01(i5)))));
        return this.A02.getLast();
    }

    public static String A01(int i5) {
        return Integer.toString(i5);
    }

    private void A04(int i5, File file) throws IOException {
        C2192mk c2192mk = new C2192mk(file);
        c2192mk.A05();
        this.A02.addFirst(new C2195mn(i5, c2192mk));
    }

    private void A05(C2186me c2186me, InterfaceC2194mm interfaceC2194mm) throws NumberFormatException, IOException {
        File[] fileArrListFiles = c2186me.A05().listFiles();
        if (fileArrListFiles != null) {
            HashMap map = new HashMap();
            HashSet<File> hashSet = new HashSet();
            int fileNumberToLoad = -1;
            for (File file : fileArrListFiles) {
                try {
                    int i5 = Integer.parseInt(file.getName());
                    map.put(Integer.valueOf(i5), file);
                    if (i5 > fileNumberToLoad) {
                        fileNumberToLoad = i5;
                    }
                } catch (NumberFormatException unused) {
                    hashSet.add(file);
                    interfaceC2194mm.AJu(String.format(Locale.US, A02(260, 39, 79), file.getCanonicalPath()));
                }
            }
            if (!map.isEmpty()) {
                int minFileNumber = fileNumberToLoad;
                while (map.containsKey(Integer.valueOf(minFileNumber - 1))) {
                    minFileNumber--;
                }
                Iterator it = new HashSet(map.keySet()).iterator();
                while (it.hasNext()) {
                    int maxFileNumber = ((Integer) it.next()).intValue();
                    if (maxFileNumber < minFileNumber) {
                        interfaceC2194mm.AJu(String.format(Locale.US, A02(166, 61, 2), Integer.valueOf(maxFileNumber), Integer.valueOf(minFileNumber)));
                        hashSet.add((File) map.remove(Integer.valueOf(maxFileNumber)));
                    }
                }
                while (fileNumberToLoad >= minFileNumber) {
                    Integer numValueOf = Integer.valueOf(fileNumberToLoad);
                    if (A04[7].length() == 23) {
                        throw new RuntimeException();
                    }
                    A04[5] = "fmCLvQkSN3nY4ZJN";
                    File file2 = (File) map.get(numValueOf);
                    try {
                        A04(fileNumberToLoad, file2);
                        map.remove(Integer.valueOf(fileNumberToLoad));
                        fileNumberToLoad--;
                    } catch (IOException e3) {
                        interfaceC2194mm.AJv(String.format(Locale.US, A02(104, 62, 43), file2.getCanonicalPath(), Integer.valueOf(fileNumberToLoad)), e3);
                        hashSet.addAll(map.values());
                    }
                }
            }
            for (File file3 : hashSet) {
                if (!file3.delete()) {
                    interfaceC2194mm.AJu(String.format(Locale.US, A02(40, 26, 29), file3.getCanonicalPath()));
                }
            }
            return;
        }
        IOException e11 = new IOException(String.format(Locale.US, A02(66, 38, 93), c2186me.A05().getCanonicalPath()));
        throw e11;
    }

    public final synchronized int A06() throws IOException {
        if (!this.A00) {
            if (this.A02.isEmpty()) {
                return -1;
            }
            return this.A02.getFirst().A00();
        }
        throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
    }

    public final synchronized int A07() throws IOException {
        if (!this.A00) {
            if (this.A02.isEmpty()) {
                return 0;
            }
            return this.A02.getFirst().A01();
        }
        throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
    }

    public final synchronized int A08() throws IOException {
        if (!this.A00) {
        } else {
            throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
        }
        return this.A02.size();
    }

    public final synchronized C2184mc A0A(int i5, int i11, byte[] bArr, int i12, int[] iArr, int i13) throws IOException {
        if (!this.A00) {
            for (C2195mn file : this.A02) {
                if (file.A00() == i5) {
                    return new C2184mc(i5, file.A02(i11, bArr, i12, iArr, i13));
                }
            }
            return new C2184mc(-1, new C2183mb(EnumC2182ma.A04, -1, -1, 0));
        }
        throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
    }

    public final synchronized void A0B() throws IOException {
        if (!this.A00) {
            Iterator<C2195mn> it = this.A02.iterator();
            while (it.hasNext()) {
                it.next().A04();
            }
            this.A02.clear();
            A00();
        } else {
            throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
        }
    }

    public final synchronized void A0C(byte[] bArr) throws IOException {
        if (!this.A00) {
            if ((this.A02.isEmpty() || !this.A02.getLast().A05(bArr)) && !A00().A05(bArr)) {
                throw new IOException(A02(0, 40, 55));
            }
        } else {
            throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
        }
    }

    public final synchronized boolean A0D() throws IOException {
        if (!this.A00) {
            if (this.A02.size() <= 1) {
                return false;
            }
            C2195mn first = this.A02.getFirst();
            this.A02.removeFirst();
            first.A04();
            return true;
        }
        throw new IOException(A02(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 33, 62));
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() throws IOException {
        if (this.A00) {
            return;
        }
        this.A00 = true;
        Iterator<C2195mn> it = this.A02.iterator();
        while (it.hasNext()) {
            it.next().A03();
        }
    }
}
