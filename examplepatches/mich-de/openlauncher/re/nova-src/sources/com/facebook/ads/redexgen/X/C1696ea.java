package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.BufferedOutputStream;
import java.io.OutputStream;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.ea, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1696ea extends BufferedOutputStream {
    public static String[] A01 = {"OMCUV4BNS6ZDsftWYBshJdh8sYGXPHnY", "7BRNYIkiVRf2OqQHVCiENrqgizTxeuGc", "v1UOxwJxtX0H84O4Raw", "kAW3", "cLgZ21ovzn", "cW4JMbx378o", "6JHLLS5lDXflDPvAtM4R0", "nyqhvn3a9sSdf6gJCtV5wYOBcjwo4ZU6"};
    public boolean A00;

    public C1696ea(OutputStream outputStream) {
        super(outputStream);
    }

    public C1696ea(OutputStream outputStream, int i5) {
        super(outputStream, i5);
    }

    public final void A00(OutputStream outputStream) {
        AbstractC1062Ln.A08(this.A00);
        this.out = outputStream;
        this.count = 0;
        this.A00 = false;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws Throwable {
        this.A00 = true;
        Throwable th2 = null;
        try {
            flush();
        } catch (Throwable th3) {
            th2 = th3;
            if (A01[2].length() != 19) {
                Throwable thrown = new RuntimeException();
                throw thrown;
            }
            String[] strArr = A01;
            strArr[1] = "5aWJgXei9p1IcKjmW6T9B6rAnZiFf6P7";
            strArr[0] = "kuv4vrsuqGW6AFu1fVIK0AHx0znQtC5F";
        }
        try {
            this.out.close();
        } catch (Throwable thrown2) {
            if (th2 == null) {
                th2 = thrown2;
            }
        }
        if (th2 != null) {
            N1.A11(th2);
            throw null;
        }
    }
}
