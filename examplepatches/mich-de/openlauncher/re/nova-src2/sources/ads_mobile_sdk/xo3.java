package ads_mobile_sdk;

import b.k9;
import java.util.Locale;
import java.util.Optional;

/* loaded from: classes2.dex */
public final class xo3 extends Exception {
    /* JADX WARN: Illegal instructions before constructor call */
    public xo3(vo3 vo3Var, hm2 hm2Var, long j11) {
        int iC = k9.c(430548174, 1962777121, -1294155075, 737454769) ^ 129967840;
        Locale locale = Locale.US;
        Object[] objArr = new Object[iC];
        objArr[0] = Long.valueOf(vo3Var.f10847a);
        objArr[1] = Long.valueOf(hm2Var.f4462a);
        Long lValueOf = Long.valueOf(j11);
        objArr[2] = lValueOf;
        super(String.format(locale, xt3.a("bk3t6gFTc30="), objArr));
        Optional.of(hm2Var);
        Optional.of(lValueOf);
    }

    public xo3(vo3 vo3Var, Exception exc) {
        super(String.format(Locale.US, xt3.a("bk0="), Long.valueOf(vo3Var.f10847a)), exc);
        Optional.empty();
        Optional.empty();
    }
}
