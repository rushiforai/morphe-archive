package app.jofslash.extension.thecryptoapp;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Locale;

/**
 * One place that turns a price/target double into a human string, so the current-price line, the
 * rule label and the notification text all read the same and never show a non-zero price as
 * "$0.00".
 *
 * <ul>
 *   <li>&ge; 1 &rarr; thousands separators + 2 decimals, e.g. 61360.59 &rarr; "$61,360.59"</li>
 *   <li>0.01 .. 1 &rarr; 4 decimals, e.g. 0.905 &rarr; "$0.9050", 0.0312 &rarr; "$0.0312"</li>
 *   <li>1e-6 .. 0.01 &rarr; 4 significant figures, e.g. 0.0031099 &rarr; "$0.003110"</li>
 *   <li>&lt; 1e-6 &rarr; scientific, e.g. 1.44e-10 &rarr; "$1.44e-10"</li>
 * </ul>
 */
public final class PriceFormat {

    private PriceFormat() {
    }

    /** Display string with a leading "$". */
    public static String money(double v) {
        return "$" + format(v);
    }

    /** Display string without the currency symbol. */
    public static String format(double v) {
        if (Double.isNaN(v) || Double.isInfinite(v)) return "?";
        double a = Math.abs(v);
        if (a == 0d) return "0";

        if (a >= 1d) {
            return String.format(Locale.US, "%,.2f", v);
        }
        if (a >= 0.01d) {
            return String.format(Locale.US, "%.4f", v);
        }
        if (a >= 1e-6) {
            // 4 significant figures: decimals = 3 - floor(log10(a)).
            int decimals = 3 - (int) Math.floor(Math.log10(a));
            if (decimals < 2) decimals = 2;
            if (decimals > 12) decimals = 12;
            return String.format(Locale.US, "%." + decimals + "f", v);
        }
        // Extremely small: readable scientific form, e.g. "1.44e-10".
        return String.format(Locale.US, "%.2e", v);
    }

    /**
     * Full-precision plain-decimal string for prefilling the numeric input when editing (never
     * scientific, so the numeric EditText accepts it). E.g. 1.44e-10 -> "0.000000000144".
     */
    public static String editable(double v) {
        if (Double.isNaN(v) || Double.isInfinite(v)) return "";
        if (v == 0d) return "0";
        // Round to 8 significant figures to drop binary-float noise, then plain string.
        BigDecimal bd = new BigDecimal(v, new MathContext(8, RoundingMode.HALF_UP));
        return bd.stripTrailingZeros().toPlainString();
    }
}
