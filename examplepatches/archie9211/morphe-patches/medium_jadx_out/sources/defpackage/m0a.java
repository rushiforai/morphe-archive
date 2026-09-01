package defpackage;

import com.android.billingclient.api.ProductDetails;
import j$.time.LocalDate;
import j$.time.Period;
import j$.time.temporal.ChronoUnit;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class m0a {
    public static final String a(ProductDetails.PricingPhase pricingPhase, Locale locale, double d, int i, boolean z) {
        Currency currency = Currency.getInstance(pricingPhase.getPriceCurrencyCode());
        currency.getClass();
        NumberFormat currencyInstance = NumberFormat.getCurrencyInstance(locale);
        currencyInstance.setCurrency(currency);
        currencyInstance.setMaximumFractionDigits(i);
        if (z) {
            String symbol = currency.getSymbol(locale);
            symbol.getClass();
            if (muc.Q(symbol, "$", false)) {
                DecimalFormat decimalFormat = currencyInstance instanceof DecimalFormat ? (DecimalFormat) currencyInstance : null;
                if (decimalFormat != null) {
                    DecimalFormatSymbols decimalFormatSymbols = ((DecimalFormat) currencyInstance).getDecimalFormatSymbols();
                    decimalFormatSymbols.setCurrencySymbol("$");
                    decimalFormat.setDecimalFormatSymbols(decimalFormatSymbols);
                }
            }
        }
        String str = currencyInstance.format(d);
        str.getClass();
        return str;
    }

    public static /* synthetic */ String b(ProductDetails.PricingPhase pricingPhase, Locale locale, double d, int i) {
        if ((i & 2) != 0) {
            d = pricingPhase.getPriceAmountMicros() / 1000000.0d;
        }
        double d2 = d;
        return a(pricingPhase, locale, d2, Double.valueOf(d2 % 1.0d).equals(Double.valueOf(0.0d)) ? 0 : 2, (i & 8) == 0);
    }

    public static final double c(String str) {
        double months;
        double d;
        Period period = Period.parse(str);
        if (period.getYears() > 0) {
            months = period.getYears();
            d = 1.0d;
        } else {
            if (period.getMonths() <= 0) {
                double dLengthOfYear = LocalDate.now().lengthOfYear();
                Period period2 = Period.parse(str);
                LocalDate localDateNow = LocalDate.now();
                long jBetween = ChronoUnit.DAYS.between(localDateNow, localDateNow.x(period2));
                if (jBetween > 0) {
                    return dLengthOfYear / jBetween;
                }
                lg8.i("Billing period not supported: ".concat(str));
                return 0.0d;
            }
            months = period.getMonths();
            d = 12.0d;
        }
        return d / months;
    }

    public static String d(ProductDetails.PricingPhase pricingPhase) {
        Locale locale = Locale.getDefault();
        locale.getClass();
        pricingPhase.getClass();
        return b(pricingPhase, locale, 0.0d, 14);
    }

    public static String e(ProductDetails.PricingPhase pricingPhase) {
        Locale locale = Locale.getDefault();
        locale.getClass();
        Currency currency = Currency.getInstance(pricingPhase.getPriceCurrencyCode());
        String strB = b(pricingPhase, locale, 0.0d, 6);
        currency.getClass();
        String symbol = currency.getSymbol(locale);
        symbol.getClass();
        return muc.Q(symbol, "$", false) ? ev6.x(strB, " ", currency.getCurrencyCode()) : strB;
    }
}
