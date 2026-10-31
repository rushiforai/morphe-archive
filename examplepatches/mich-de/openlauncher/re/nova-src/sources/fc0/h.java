package fc0;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes5.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final BigDecimal f54610a = new BigDecimal("2");

    /* renamed from: b, reason: collision with root package name */
    public static final BigDecimal f54611b = new BigDecimal("3");

    /* renamed from: c, reason: collision with root package name */
    public static final BigDecimal f54612c = new BigDecimal("4");

    /* renamed from: d, reason: collision with root package name */
    public static final BigDecimal f54613d = new BigDecimal("5");

    /* renamed from: e, reason: collision with root package name */
    public static final BigDecimal f54614e = new BigDecimal("239");

    public static BigDecimal a(BigDecimal bigDecimal, int i5) {
        BigDecimal bigDecimal2 = BigDecimal.ONE;
        RoundingMode roundingMode = RoundingMode.DOWN;
        BigDecimal bigDecimalDivide = bigDecimal2.setScale(i5, roundingMode).divide(bigDecimal, roundingMode);
        BigDecimal bigDecimal3 = new BigDecimal(bigDecimalDivide.toString());
        BigDecimal bigDecimalScaleByPowerOfTen = bigDecimal2.scaleByPowerOfTen(-i5);
        i.f54615a.log(Level.FINER, new aa.q(2, bigDecimal, bigDecimalScaleByPowerOfTen));
        BigDecimal bigDecimalDivide2 = null;
        boolean z11 = false;
        BigDecimal bigDecimalAdd = f54611b;
        int i11 = 0;
        while (true) {
            if ((bigDecimalDivide2 != null && bigDecimalDivide2.equals(BigDecimal.ZERO)) || (bigDecimalDivide2 != null && bigDecimalDivide2.compareTo(bigDecimalScaleByPowerOfTen) < 0)) {
                break;
            }
            BigDecimal bigDecimalPow = bigDecimal.pow(2);
            RoundingMode roundingMode2 = RoundingMode.DOWN;
            bigDecimal3 = bigDecimal3.divide(bigDecimalPow, roundingMode2);
            bigDecimalDivide2 = bigDecimal3.divide(bigDecimalAdd, roundingMode2);
            bigDecimalDivide = z11 ? bigDecimalDivide.add(bigDecimalDivide2) : bigDecimalDivide.subtract(bigDecimalDivide2);
            z11 = !z11;
            Logger logger = i.f54615a;
            Level level = Level.FINEST;
            if (logger.isLoggable(level)) {
                logger.log(level, "arccot: term=" + bigDecimalDivide2);
            }
            i11++;
            bigDecimalAdd = bigDecimalAdd.add(f54610a);
        }
        Logger logger2 = i.f54615a;
        if (logger2.isLoggable(Level.FINEST)) {
            logger2.log(Level.FINER, "arccot: done. nTerms=" + i11);
        }
        return bigDecimalDivide;
    }
}
