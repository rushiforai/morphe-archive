package t40;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Random;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final String f88523b = "UTF-8";

    /* renamed from: a, reason: collision with root package name */
    public final String f88524a;

    public a(long[] jArr) {
        int length = jArr.length;
        int i5 = (length - 1) * 8;
        byte[] bArr = new byte[i5];
        Random random = new Random(jArr[0]);
        for (int i11 = 1; i11 < length; i11++) {
            long jNextLong = random.nextLong() ^ jArr[i11];
            int i12 = (i11 - 1) * 8;
            int iMin = Math.min(i5, i12 + 8);
            while (i12 < iMin) {
                bArr[i12] = (byte) jNextLong;
                jNextLong >>= 8;
                i12++;
            }
        }
        try {
            String str = new String(bArr, f88523b);
            int iIndexOf = str.indexOf(0);
            this.f88524a = iIndexOf != -1 ? str.substring(0, iIndexOf) : str;
        } catch (UnsupportedEncodingException e3) {
            throw new AssertionError(e3);
        }
    }

    public static ArrayList a(String str) throws UnsupportedEncodingException {
        long jNextLong;
        int i5 = 0;
        if (str.indexOf(0) != -1) {
            throw new IllegalArgumentException(new a(new long[]{2598583114197433456L, -2532951909540716745L, 1850312903926917213L, -7324743161950196342L, 3319654553699491298L}).f88524a);
        }
        try {
            byte[] bytes = str.getBytes(f88523b);
            Random random = new Random();
            do {
                jNextLong = random.nextLong();
            } while (jNextLong == 0);
            Random random2 = new Random(jNextLong);
            ArrayList arrayList = new ArrayList();
            arrayList.add(Long.valueOf(jNextLong));
            int length = bytes.length;
            while (i5 < length) {
                long jNextLong2 = random2.nextLong();
                int i11 = i5 + 8;
                int iMin = Math.min(bytes.length, i11);
                long j11 = 0;
                while (true) {
                    iMin--;
                    if (iMin >= i5) {
                        j11 = (j11 << 8) | (bytes[iMin] & 255);
                    }
                }
                arrayList.add(Long.valueOf(jNextLong2 ^ j11));
                i5 = i11;
            }
            return arrayList;
        } catch (UnsupportedEncodingException e3) {
            throw new AssertionError(e3);
        }
    }

    public final String toString() {
        return this.f88524a;
    }
}
