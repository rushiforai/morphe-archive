package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public class NQ extends IOException {
    public static final long serialVersionUID = 1;
    public final int A00;

    public NQ(int i5) {
        this.A00 = i5;
    }

    public NQ(String str, int i5) {
        super(str);
        this.A00 = i5;
    }

    public NQ(String str, Throwable th2, int i5) {
        super(str, th2);
        this.A00 = i5;
    }

    public NQ(Throwable th2, int i5) {
        super(th2);
        this.A00 = i5;
    }

    public static boolean A02(IOException iOException) {
        for (IOException cause = iOException; cause != null; cause = cause.getCause()) {
            if ((cause instanceof NQ) && ((NQ) cause).A00 == 2008) {
                return true;
            }
        }
        return false;
    }
}
