package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.IOException;
import java.io.InputStream;

/* renamed from: com.facebook.ads.redexgen.X.e0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1660e0 extends InputStream {
    public static String[] A07 = {"bEzky2QjozAtm", "SFzbQHCgVaXzl5HZxUMeuUAzash8zace", "xJ59VLn5t0GKJrcJWDYRlEZJhy9Ayciy", "72dA8iSMeNH0GegXxdASbQ2n8A3mFblf", "ExLcXB5y5zBWtNE8ckh4Agh", "BjZ", "sGzGeJcI9Px", "jN0"};
    public int A00;
    public long A01;
    public TE A02;
    public final Uri A03;
    public final NN A04;
    public final C0957Hh A05;
    public final String A06;

    public C1660e0(C0957Hh c0957Hh, Uri uri, NN nn2) throws IOException {
        this.A05 = c0957Hh;
        this.A04 = nn2;
        this.A03 = uri;
        this.A06 = C1562cP.A09(this.A05, this.A03);
        A00(0);
    }

    private void A00(int i5) throws IOException {
        if (this.A02 != null) {
            this.A02.close();
        }
        this.A02 = this.A04.A5r();
        this.A01 = (int) this.A02.AHv(new NX(this.A03, i5, -1L, this.A06));
    }

    @Override // java.io.InputStream
    public final int available() {
        return ((int) this.A01) - this.A00;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.A02.close();
    }

    @Override // java.io.InputStream
    public final int read() throws IOException {
        byte[] b11 = new byte[1];
        return read(b11);
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.A02.read(bArr, i5, i11);
        int read = this.A00;
        this.A00 = read + i12;
        return i12;
    }

    @Override // java.io.InputStream
    public final long skip(long j11) throws IOException {
        long skipped = this.A01 - this.A00;
        if (skipped <= 0) {
            return 0L;
        }
        String[] strArr = A07;
        if (strArr[5].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A07;
        strArr2[5] = "M7q";
        strArr2[7] = "37t";
        if (j11 > skipped) {
            j11 = skipped;
        }
        this.A00 += (int) j11;
        A00(this.A00);
        return j11;
    }
}
