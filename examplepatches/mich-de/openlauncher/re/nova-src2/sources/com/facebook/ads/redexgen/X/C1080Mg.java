package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.HashMap;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* renamed from: com.facebook.ads.redexgen.X.Mg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1080Mg implements InterfaceC1689eT {
    public static byte[] A07;
    public static String[] A08 = {"up2AOcmrZREHDxdj67mNYlCiqY6MOCkr", "MrVhD", "YB8zrrYuiQdrneSqVSuLE58BIE8o", "a3p0MIH4BRaaoJqPup79hVrU10OeInBc", "7q", "zDKXvav2c0FGmpNau7mYQqRI5RJE", "jjaPw1TJvdRGmbQdEGTa", "Uk14HWnJofQ5Vu8u1YMXRt4ec7aeqrZb"};
    public C1696ea A00;
    public boolean A01;
    public final C1064Lp A02;
    public final SecureRandom A03;
    public final Cipher A04;
    public final SecretKeySpec A05;
    public final boolean A06;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 21);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A07 = new byte[]{116, 112, 102};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A05(HashMap<String, C1688eS> map) throws IOException {
        try {
            C1063Lo c1063LoA03 = this.A02.A03();
            if (this.A00 == null) {
                this.A00 = new C1696ea(c1063LoA03);
            } else {
                this.A00.A00(c1063LoA03);
            }
            C1696ea c1696ea = this.A00;
            DataOutputStream dataOutputStream = new DataOutputStream(c1696ea);
            dataOutputStream.writeInt(2);
            boolean z11 = this.A06;
            String[] strArr = A08;
            if (strArr[2].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            A08[0] = "s6X4iwLzIFCe9a27shE2xSLZq3LHRue5";
            dataOutputStream.writeInt(z11 ? 1 : 0);
            if (this.A06) {
                byte[] bArr = new byte[16];
                ((SecureRandom) N1.A0f(this.A03)).nextBytes(bArr);
                dataOutputStream.write(bArr);
                try {
                    ((Cipher) N1.A0f(this.A04)).init(1, (Key) N1.A0f(this.A05), new IvParameterSpec(bArr));
                    dataOutputStream.flush();
                    dataOutputStream = new DataOutputStream(new CipherOutputStream(c1696ea, this.A04));
                } catch (InvalidAlgorithmParameterException | InvalidKeyException e3) {
                    throw new IllegalStateException(e3);
                }
            }
            dataOutputStream.writeInt(map.size());
            int iA00 = 0;
            for (C1688eS c1688eS : map.values()) {
                A04(c1688eS, dataOutputStream);
                iA00 += A00(c1688eS, 2);
            }
            dataOutputStream.writeInt(iA00);
            this.A02.A06(dataOutputStream);
            N1.A10(null);
            if (A08[3].charAt(6) == 'T') {
                A08[7] = "R5LZO5VIHgrfDlBJEtmXqlugOWywlIRG";
                return;
            }
            String[] strArr2 = A08;
            strArr2[1] = "siPqO";
            strArr2[4] = "eE";
        } catch (Throwable th2) {
            N1.A10(null);
            throw th2;
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private boolean A06(HashMap<String, C1688eS> map, SparseArray<String> sparseArray) throws IOException {
        if (!this.A02.A07()) {
            return true;
        }
        try {
            BufferedInputStream bufferedInputStream = new BufferedInputStream(this.A02.A04());
            DataInputStream dataInputStream = new DataInputStream(bufferedInputStream);
            int i5 = dataInputStream.readInt();
            if (i5 < 0 || i5 > 2) {
                N1.A10(dataInputStream);
                return false;
            }
            int i11 = dataInputStream.readInt() & 1;
            String[] strArr = A08;
            if (strArr[1].length() != strArr[4].length()) {
                A08[3] = "HENQbDXTJbDHz9MUXAcxyEoaFS93HXII";
                if (i11 != 0) {
                    if (this.A04 == null) {
                        N1.A10(dataInputStream);
                        return false;
                    }
                    byte[] bArr = new byte[16];
                    dataInputStream.readFully(bArr);
                    try {
                        this.A04.init(2, (Key) N1.A0f(this.A05), new IvParameterSpec(bArr));
                        dataInputStream = new DataInputStream(new CipherInputStream(bufferedInputStream, this.A04));
                    } catch (InvalidAlgorithmParameterException | InvalidKeyException e3) {
                        throw new IllegalStateException(e3);
                    }
                } else if (this.A06) {
                    this.A01 = true;
                }
                int i12 = dataInputStream.readInt();
                int iA00 = 0;
                for (int i13 = 0; i13 < i12; i13++) {
                    C1688eS c1688eSA01 = A01(i5, dataInputStream);
                    map.put(c1688eSA01.A02, c1688eSA01);
                    sparseArray.put(c1688eSA01.A01, c1688eSA01.A02);
                    iA00 += A00(c1688eSA01, i5);
                }
                int i14 = dataInputStream.readInt();
                int i15 = dataInputStream.read();
                if (A08[0].charAt(12) != 'f') {
                    A08[0] = "omDuhpAZ4cJA3bGyTkFBWnjxD6fHcmkv";
                    boolean z11 = i15 == -1;
                    if (i14 == iA00 && z11) {
                        N1.A10(dataInputStream);
                        return true;
                    }
                    N1.A10(dataInputStream);
                    return false;
                }
            }
            throw new RuntimeException();
        } catch (IOException unused) {
            if (0 != 0) {
                N1.A10(null);
            }
            return false;
        } catch (Throwable th2) {
            if (0 != 0) {
                N1.A10(null);
            }
            throw th2;
        }
    }

    static {
        A03();
    }

    public C1080Mg(File file, byte[] bArr, boolean z11) {
        AbstractC1062Ln.A08((bArr == null && z11) ? false : true);
        Cipher cipherA05 = null;
        SecretKeySpec secretKeySpec = null;
        if (bArr != null) {
            AbstractC1062Ln.A07(bArr.length == 16);
            try {
                cipherA05 = C1690eU.A05();
                secretKeySpec = new SecretKeySpec(bArr, A02(0, 3, 32));
            } catch (NoSuchAlgorithmException | NoSuchPaddingException e3) {
                throw new IllegalStateException(e3);
            }
        } else {
            AbstractC1062Ln.A07(!z11);
        }
        this.A06 = z11;
        this.A04 = cipherA05;
        this.A05 = secretKeySpec;
        this.A03 = z11 ? new SecureRandom() : null;
        this.A02 = new C1064Lp(file);
    }

    private int A00(C1688eS c1688eS, int i5) {
        int result = c1688eS.A01;
        int i11 = result * 31;
        int result2 = c1688eS.A02.hashCode();
        int result3 = i11 + result2;
        if (i5 < 2) {
            long jA00 = AbstractC1691eV.A00(c1688eS.A03());
            return (result3 * 31) + ((int) ((jA00 >>> 32) ^ jA00));
        }
        return (result3 * 31) + c1688eS.A03().hashCode();
    }

    private C1688eS A01(int i5, DataInputStream dataInputStream) throws IOException {
        C1079Mf c1079MfA02;
        int i11 = dataInputStream.readInt();
        String utf = dataInputStream.readUTF();
        if (i5 < 2) {
            long length = dataInputStream.readLong();
            C1693eX c1693eX = new C1693eX();
            C1693eX.A00(c1693eX, length);
            c1079MfA02 = C1079Mf.A03.A05(c1693eX);
        } else {
            c1079MfA02 = C1690eU.A02(dataInputStream);
        }
        return new C1688eS(i11, utf, c1079MfA02);
    }

    private void A04(C1688eS c1688eS, DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeInt(c1688eS.A01);
        dataOutputStream.writeUTF(c1688eS.A02);
        C1690eU.A08(c1688eS.A03(), dataOutputStream);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void A6O() {
        this.A02.A05();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final boolean A71() {
        return this.A02.A07();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void AAt(long j11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void ABa(HashMap<String, C1688eS> map, SparseArray<String> idToKey) {
        AbstractC1062Ln.A08(!this.A01);
        if (!A06(map, idToKey)) {
            map.clear();
            idToKey.clear();
            this.A02.A05();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void AGk(C1688eS c1688eS, boolean z11) {
        this.A01 = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void AHU(C1688eS c1688eS) {
        this.A01 = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void ALb(HashMap<String, C1688eS> map) throws IOException {
        A05(map);
        this.A01 = false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void ALc(HashMap<String, C1688eS> map) throws IOException {
        if (!this.A01) {
            return;
        }
        ALb(map);
    }
}
