package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.text.TextUtils;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.4K, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4K extends C9J {
    public static byte[] A04;
    public static String[] A05 = {"Yc4WoaZdFJMJ9uTba3tQwWrY6eh33xr", "5u9VAsqQgD7mlDRuRSNULE8mOn0eCSCg", "7J4CRjncvNSgpi2BI", "PiLFj8GUqvFKlc1xVERBwXj", "zArSeAjUxVRmJ9PPxMGa9BQ3Fh66uXY2", "RfEK3IcwKyNQIjLi55njmQOR4", "Ol1KGNVkUDNpsZMjKv6JCJ3BA9AF9dzY", "Ew0ukZtT7"};
    public long A00;
    public Uri A01;
    public RandomAccessFile A02;
    public boolean A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ 97;
            if (A05[3].length() == 2) {
                throw new RuntimeException();
            }
            A05[1] = "BiFtKsTsKHuTzxx7WRivUc2wwuFB0nwx";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{34, 45, 40, 33, 23, 54, 39, 22, 33, 37, 32, 11, 52, 33, 42, 45, 34, 39, 46, 24, 57, 40, 25, 46, 42, 47, 25, 10, 13, 3, 92, 91, 64, 9, 65, 72, 90, 9, 88, 92, 76, 91, 80, 9, 72, 71, 77, 6, 70, 91, 9, 79, 91, 72, 78, 68, 76, 71, 93, 5, 9, 94, 65, 64, 74, 65, 9, 72, 91, 76, 9, 71, 70, 93, 9, 90, 92, 89, 89, 70, 91, 93, 76, 77, 7, 9, 109, 64, 77, 9, 80, 70, 92, 9, 74, 72, 69, 69, 9, 124, 91, 64, 7, 89, 72, 91, 90, 76, 1, 0, 9, 70, 71, 9, 72, 9, 90, 93, 91, 64, 71, 78, 9, 74, 70, 71, 93, 72, 64, 71, 64, 71, 78, 9, 14, 22, 14, 9, 70, 91, 9, 14, 10, 14, 22, 9, 124, 90, 76, 9, 124, 91, 64, 7, 79, 91, 70, 68, 111, 64, 69, 76, 1, 71, 76, 94, 9, 111, 64, 69, 76, 1, 89, 72, 93, 65, 0, 0, 9, 93, 70, 9, 72, 95, 70, 64, 77, 9, 93, 65, 64, 90, 7, 9, 89, 72, 93, 65, 20, 12, 90, 5, 88, 92, 76, 91, 80, 20, 12, 90, 5, 79, 91, 72, 78, 68, 76, 71, 93, 20, 12, 90};
        String[] strArr = A05;
        if (strArr[7].length() == strArr[2].length()) {
            throw new RuntimeException();
        }
        A05[1] = "s4LqZs2EifV3KCLXXJ3kh5WphwR6HAJv";
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.TE
    @MetaExoPlayerCustomization
    public final long AHv(NX nx2) throws T9 {
        AbstractC1093Mt.A02(A01(0, 15, 37));
        Uri uri = nx2.A06;
        this.A01 = uri;
        A0G(nx2);
        this.A02 = A00(uri);
        try {
            try {
                this.A02.seek(nx2.A04);
                this.A00 = nx2.A03 == -1 ? this.A02.length() - nx2.A04 : nx2.A03;
                AbstractC1093Mt.A00();
                if (this.A00 < 0) {
                    throw new T9(null, null, 2008);
                }
                this.A03 = true;
                A0H(nx2);
                return this.A00;
            } catch (IOException e3) {
                throw new T9(e3, 2000);
            }
        } catch (Throwable th2) {
            AbstractC1093Mt.A00();
            throw th2;
        }
    }

    static {
        A02();
    }

    public C4K() {
        super(false);
    }

    public static RandomAccessFile A00(Uri uri) throws T9 {
        try {
            return new RandomAccessFile((String) AbstractC1062Ln.A01(uri.getPath()), A01(29, 1, 16));
        } catch (FileNotFoundException e3) {
            if (TextUtils.isEmpty(uri.getQuery()) && TextUtils.isEmpty(uri.getFragment())) {
                throw new T9(e3, (N1.A02 < 21 || !NZ.A00(e3.getCause())) ? 2005 : 2006);
            }
            throw new T9(String.format(A01(30, 192, 72), uri.getPath(), uri.getQuery(), uri.getFragment()), e3, 1004);
        } catch (SecurityException e11) {
            throw new T9(e11, 2006);
        } catch (RuntimeException e12) {
            throw new T9(e12, 2000);
        }
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Uri AA2() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void close() throws T9 {
        this.A01 = null;
        try {
            try {
                if (this.A02 != null) {
                    this.A02.close();
                }
            } catch (IOException e3) {
                throw new T9(e3, 2000);
            }
        } finally {
            this.A02 = null;
            if (this.A03) {
                this.A03 = false;
                A0E();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.KR
    @MetaExoPlayerCustomization
    public final int read(byte[] bArr, int i5, int i11) throws T9 {
        if (i11 == 0) {
            return 0;
        }
        try {
            if (this.A00 == 0) {
                return -1;
            }
            try {
                AbstractC1093Mt.A02(A01(15, 14, 42));
                int i12 = ((RandomAccessFile) N1.A0f(this.A02)).read(bArr, i5, (int) Math.min(this.A00, i11));
                AbstractC1093Mt.A00();
                String[] strArr = A05;
                String str = strArr[7];
                String str2 = strArr[2];
                int length = str.length();
                int bytesRead = str2.length();
                if (length == bytesRead) {
                    throw new RuntimeException();
                }
                A05[6] = "ZcR3PPQ1h9JeS6ZEzkV1vzLetiegvzmd";
                if (i12 > 0) {
                    this.A00 -= i12;
                    A0F(i12);
                }
                return i12;
            } catch (IOException e3) {
                throw new T9(e3, 2000);
            }
        } catch (Throwable th2) {
            AbstractC1093Mt.A00();
            throw th2;
        }
    }
}
