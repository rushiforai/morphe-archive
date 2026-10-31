package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.v8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2706v8 implements Runnable {
    public static String[] A01 = {"ZvDtHAz5m48M18w3xVBvW9UUvAxUfTco", "Su9zcdtZ9ImnInrf0ILgVeApSeGsgvZI", "xXqvKIRF0PBjEGaR7TZ18ROMB", "m2Hewa3Z6gbURtNYV3SWt7DVdluwrYvz", "mWXUFmbAmKViJClAM9LXlAC", "0Y7AahKvzPLarINwhoocY8ezozCmsz", "5fBoxvqmYpNfoXwOAmWasRGE3QCsQXLn", "O4RwXCXfxOQMJWQD0Tqe5fA"};
    public final /* synthetic */ ET A00;

    public RunnableC2706v8(ET et2) {
        this.A00 = et2;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0M) {
                this.A00.A0K();
            }
        } catch (Throwable th2) {
            String[] strArr = A01;
            if (strArr[0].charAt(31) == strArr[6].charAt(31)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[7] = "0ZDTnX20ALQ1qRFYGfQrfbk";
            strArr2[4] = "BYw49wL2ISjP5kGNoOWH1Xi";
            AbstractC2311oi.A00(th2, this);
        }
    }
}
