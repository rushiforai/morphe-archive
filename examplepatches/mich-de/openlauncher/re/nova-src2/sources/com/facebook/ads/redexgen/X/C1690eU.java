package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.eU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1690eU {
    public static byte[] A06;
    public static String[] A07 = {"uCLNqHbvUbwpkTMVOdq8Ax", "5gQ54", "yhjbU1", "eNcf7", "T0VlcLw5DR5PRhsfdvDAVu3stwC9yT9n", "4MdHmKt40ylS0JNbgRQnV7YVt1eOrGpS", "QCD5gpimh1JgBoNbXFIs8WNpeJpo1ZES", "jW155fMl75uIKo88X2q8iVtfsWToKp6t"};
    public InterfaceC1689eT A00;
    public InterfaceC1689eT A01;
    public final SparseArray<String> A02;
    public final SparseBooleanArray A03;
    public final SparseBooleanArray A04;
    public final HashMap<String, C1688eS> A05;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A07;
            if (strArr[5].charAt(20) != strArr[4].charAt(20)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[5] = "MgLVgui2fPxNExckRiC5VXYbEawkpgwZ";
            strArr2[4] = "qGMfynRLhhDVceSncoRPVQigUZh8yRBE";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 65);
            i13++;
        }
    }

    public static void A07() {
        A06 = new byte[]{-31, -27, -13, -49, -29, -30, -29, -49, -16, -21, -29, -13, -43, -16, -31, -28, -28, -23, -18, -25, -118, -117, -16, 21, 29, 8, 19, 16, 11, -57, 29, 8, 19, 28, 12, -57, 26, 16, 33, 12, -31, -57, 23, 21, 23, 28, 25, 24, 19, 23, 35, 34, 40, 25, 34, 40, 19, 29, 34, 24, 25, 44, -30, 25, 44, 29};
    }

    static {
        A07();
    }

    public C1690eU(ND nd2, File file, byte[] bArr, boolean z11, boolean z12) {
        AbstractC1062Ln.A08((nd2 == null && file == null) ? false : true);
        this.A05 = new HashMap<>();
        this.A02 = new SparseArray<>();
        this.A04 = new SparseBooleanArray();
        this.A03 = new SparseBooleanArray();
        C1081Mh c1081Mh = nd2 != null ? new C1081Mh(nd2) : null;
        InterfaceC1689eT databaseStorage = file != null ? new C1080Mg(new File(file, A04(42, 24, 115)), bArr, z11) : null;
        if (c1081Mh == null || (databaseStorage != null && z12)) {
            InterfaceC1689eT legacyStorage = (InterfaceC1689eT) N1.A0f(databaseStorage);
            this.A01 = legacyStorage;
            this.A00 = c1081Mh;
        } else {
            this.A01 = c1081Mh;
            this.A00 = databaseStorage;
        }
    }

    public static int A00(SparseArray<String> idToKey) {
        int id2;
        int size = idToKey.size();
        if (size == 0) {
            id2 = 0;
        } else {
            int size2 = size - 1;
            id2 = idToKey.keyAt(size2) + 1;
        }
        if (id2 < 0) {
            id2 = 0;
            while (id2 < size) {
                int size3 = idToKey.keyAt(id2);
                if (id2 != size3) {
                    break;
                }
                id2++;
            }
        }
        return id2;
    }

    private C1688eS A01(String str) {
        int iA00 = A00(this.A02);
        C1688eS c1688eS = new C1688eS(iA00, str);
        this.A05.put(str, c1688eS);
        this.A02.put(iA00, str);
        this.A03.put(iA00, true);
        this.A01.AHU(c1688eS);
        return c1688eS;
    }

    public static C1079Mf A02(DataInputStream dataInputStream) throws IOException {
        int i5 = dataInputStream.readInt();
        HashMap map = new HashMap();
        for (int nextBytesToRead = 0; nextBytesToRead < i5; nextBytesToRead++) {
            String utf = dataInputStream.readUTF();
            int bytesRead = dataInputStream.readInt();
            if (bytesRead >= 0) {
                int valueSize = 0;
                int i11 = Math.min(bytesRead, 10485760);
                byte[] bArrCopyOf = N1.A07;
                while (valueSize != bytesRead) {
                    int size = valueSize + i11;
                    bArrCopyOf = Arrays.copyOf(bArrCopyOf, size);
                    dataInputStream.readFully(bArrCopyOf, valueSize, i11);
                    valueSize += i11;
                    int size2 = bytesRead - valueSize;
                    i11 = Math.min(size2, 10485760);
                }
                map.put(utf, bArrCopyOf);
            } else {
                throw new IOException(A04(22, 20, 102) + bytesRead);
            }
        }
        return new C1079Mf(map);
    }

    public static Cipher A05() throws NoSuchPaddingException, NoSuchAlgorithmException {
        int i5 = N1.A02;
        String strA04 = A04(0, 20, 95);
        if (i5 == 18) {
            try {
                return Cipher.getInstance(strA04, A04(20, 2, 7));
            } catch (Throwable unused) {
            }
        }
        return Cipher.getInstance(strA04);
    }

    public static void A08(C1079Mf c1079Mf, DataOutputStream dataOutputStream) throws IOException {
        Set<Map.Entry<String, byte[]>> setA06 = c1079Mf.A06();
        dataOutputStream.writeInt(setA06.size());
        for (Map.Entry<String, byte[]> entry : setA06) {
            dataOutputStream.writeUTF(entry.getKey());
            byte[] value = entry.getValue();
            dataOutputStream.writeInt(value.length);
            dataOutputStream.write(value);
        }
    }

    public static boolean A0A(String str) {
        return str.startsWith(A04(42, 24, 115));
    }

    public final int A0B(String str) {
        return A0D(str).A01;
    }

    public final C1688eS A0C(String str) {
        return this.A05.get(str);
    }

    public final C1688eS A0D(String str) {
        C1688eS cachedContent = this.A05.get(str);
        return cachedContent == null ? A01(str) : cachedContent;
    }

    public final C1079Mf A0E(String str) {
        C1688eS cachedContent = A0C(str);
        return cachedContent != null ? cachedContent.A03() : C1079Mf.A03;
    }

    public final String A0F(int i5) {
        return this.A02.get(i5);
    }

    public final Collection<C1688eS> A0G() {
        return Collections.unmodifiableCollection(this.A05.values());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void A0H() {
        VV vvA0N = AbstractC07539k.A07(this.A05.keySet()).A0N();
        while (vvA0N.hasNext()) {
            A0K((String) vvA0N.next());
        }
    }

    public final void A0I() throws IOException {
        this.A01.ALc(this.A05);
        int size = this.A04.size();
        for (int i5 = 0; i5 < size; i5++) {
            SparseArray<String> sparseArray = this.A02;
            int removedIdCount = this.A04.keyAt(i5);
            sparseArray.remove(removedIdCount);
        }
        this.A04.clear();
        this.A03.clear();
    }

    public final void A0J(long j11) throws IOException {
        this.A01.AAt(j11);
        if (this.A00 != null) {
            this.A00.AAt(j11);
        }
        if (!this.A01.A71() && this.A00 != null && this.A00.A71()) {
            InterfaceC1689eT interfaceC1689eT = this.A00;
            String[] strArr = A07;
            if (strArr[3].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[3] = "RJ3xR";
            strArr2[1] = "XYRnk";
            interfaceC1689eT.ABa(this.A05, this.A02);
            this.A01.ALb(this.A05);
        } else {
            this.A01.ABa(this.A05, this.A02);
        }
        if (this.A00 != null) {
            this.A00.A6O();
            this.A00 = null;
        }
    }

    public final void A0K(String str) {
        C1688eS c1688eS = this.A05.get(str);
        if (c1688eS != null && c1688eS.A09() && c1688eS.A0A()) {
            this.A05.remove(str);
            int i5 = c1688eS.A01;
            boolean z11 = this.A03.get(i5);
            this.A01.AGk(c1688eS, z11);
            if (z11) {
                this.A02.remove(i5);
                this.A03.delete(i5);
            } else {
                this.A02.put(i5, null);
                this.A04.put(i5, true);
            }
        }
    }

    public final void A0L(String str, C1693eX c1693eX) {
        C1688eS c1688eSA0D = A0D(str);
        if (c1688eSA0D.A0E(c1693eX)) {
            this.A01.AHU(c1688eSA0D);
        }
    }
}
