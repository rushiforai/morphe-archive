package com.bytedance.adsdk.ugeno.sya;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import h6.c1;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.AttributedCharacterIterator;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Currency;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/* loaded from: classes2.dex */
public class ycx {
    public static String ycx(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        try {
            return ycx(Currency.getInstance(str), locale, i5, i11, i12).format(bigDecimal);
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static List<sya> zb(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        try {
            DecimalFormat decimalFormatYcx = ycx(Currency.getInstance(str), locale, i5, i11, i12);
            return ycx(decimalFormatYcx.format(bigDecimal), decimalFormatYcx.formatToCharacterIterator(bigDecimal));
        } catch (Throwable unused) {
            return Collections.EMPTY_LIST;
        }
    }

    private static DecimalFormat ycx(Currency currency, Locale locale, int i5, int i11, int i12) {
        DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getCurrencyInstance(locale);
        decimalFormat.setCurrency(currency);
        if (i5 == 1) {
            DecimalFormatSymbols decimalFormatSymbols = decimalFormat.getDecimalFormatSymbols();
            decimalFormatSymbols.setCurrencySymbol(currency.getCurrencyCode());
            decimalFormat.setDecimalFormatSymbols(decimalFormatSymbols);
            String pattern = decimalFormat.toPattern();
            if (pattern.contains("¤#") || pattern.contains("¤0")) {
                pattern = pattern.replace("¤#", "¤ #").replace("¤0", "¤ 0");
            }
            if (pattern.contains("#¤") || pattern.contains("0¤")) {
                pattern = pattern.replace("#¤", "# ¤").replace("0¤", "0 ¤");
            }
            if (pattern.contains("¤-#") || pattern.contains("¤-0")) {
                pattern = pattern.replace("¤-#", "¤ -#").replace("¤-0", "¤ -0");
            }
            if (pattern.contains("-¤#") || pattern.contains("-¤0")) {
                pattern = pattern.replace("-¤#", "- ¤#").replace("-¤0", "- ¤0");
            }
            decimalFormat.applyPattern(pattern);
        } else if (i5 == 4) {
            String displayName = currency.getDisplayName(locale);
            try {
                decimalFormat.applyPattern(((android.icu.text.DecimalFormat) android.icu.text.NumberFormat.getInstance(locale, 6)).toPattern().replace("¤¤¤", "¤").replace("¤¤", "¤"));
            } catch (Throwable unused) {
            }
            DecimalFormatSymbols decimalFormatSymbols2 = decimalFormat.getDecimalFormatSymbols();
            decimalFormatSymbols2.setCurrencySymbol(displayName);
            decimalFormat.setDecimalFormatSymbols(decimalFormatSymbols2);
        }
        decimalFormat.setMaximumFractionDigits(i12);
        decimalFormat.setMinimumFractionDigits(0);
        decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
        return decimalFormat;
    }

    private static List<sya> ycx(String str, AttributedCharacterIterator attributedCharacterIterator) {
        String strYcx;
        ArrayList arrayList = new ArrayList();
        String str2 = null;
        int i5 = -1;
        for (int beginIndex = attributedCharacterIterator.getBeginIndex(); beginIndex < attributedCharacterIterator.getEndIndex(); beginIndex++) {
            attributedCharacterIterator.setIndex(beginIndex);
            Set<AttributedCharacterIterator.Attribute> setKeySet = attributedCharacterIterator.getAttributes().keySet();
            if (!setKeySet.isEmpty()) {
                strYcx = ycx((NumberFormat.Field) setKeySet.iterator().next());
            } else {
                strYcx = "literal";
            }
            if (!strYcx.equals(str2)) {
                if (str2 != null) {
                    arrayList.add(new sya(str2, str.substring(i5, beginIndex), i5, beginIndex));
                }
                i5 = beginIndex;
                str2 = strYcx;
            }
        }
        if (str2 != null) {
            arrayList.add(new sya(str2, str.substring(i5, attributedCharacterIterator.getEndIndex()), i5, attributedCharacterIterator.getEndIndex()));
        }
        return ycx(arrayList);
    }

    private static String ycx(NumberFormat.Field field) {
        if (field.equals(NumberFormat.Field.CURRENCY)) {
            return TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY;
        }
        return (field.equals(NumberFormat.Field.INTEGER) || field.equals(NumberFormat.Field.GROUPING_SEPARATOR) || field.equals(NumberFormat.Field.SIGN)) ? "integer" : (field.equals(NumberFormat.Field.FRACTION) || field.equals(NumberFormat.Field.DECIMAL_SEPARATOR)) ? "fraction" : "integer";
    }

    private static List<sya> ycx(List<sya> list) {
        sya syaVar;
        ArrayList arrayList = new ArrayList();
        loop0: while (true) {
            syaVar = null;
            for (sya syaVar2 : list) {
                if ("literal".equals(syaVar2.ycx())) {
                    syaVar = syaVar2;
                } else if (syaVar != null) {
                    if (TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY.equals(syaVar2.ycx())) {
                        arrayList.add(new sya(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, syaVar.zb() + syaVar2.zb(), syaVar.sya(), syaVar2.dj()));
                    } else {
                        if (!arrayList.isEmpty() && TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY.equals(((sya) c1.l(arrayList, 1)).ycx())) {
                            sya syaVar3 = (sya) arrayList.remove(arrayList.size() - 1);
                            arrayList.add(new sya(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, syaVar3.zb() + syaVar.zb(), syaVar3.sya(), syaVar.dj()));
                        } else {
                            arrayList.add(new sya("integer", syaVar.zb(), syaVar.sya(), syaVar.dj()));
                        }
                        arrayList.add(syaVar2);
                    }
                } else {
                    arrayList.add(syaVar2);
                }
            }
            break loop0;
        }
        if (syaVar != null && !arrayList.isEmpty()) {
            sya syaVar4 = (sya) arrayList.remove(arrayList.size() - 1);
            if (TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY.equals(syaVar4.ycx())) {
                arrayList.add(new sya(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, syaVar4.zb() + syaVar.zb(), syaVar4.sya(), syaVar.dj()));
                return arrayList;
            }
            arrayList.add(syaVar4);
            arrayList.add(new sya("integer", syaVar.zb(), syaVar.sya(), syaVar.dj()));
        }
        return arrayList;
    }
}
