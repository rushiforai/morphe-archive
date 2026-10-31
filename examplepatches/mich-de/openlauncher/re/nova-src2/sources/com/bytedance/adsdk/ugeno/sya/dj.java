package com.bytedance.adsdk.ugeno.sya;

import android.icu.number.FormattedNumber;
import android.icu.number.LocalizedNumberFormatter;
import android.icu.number.Notation;
import android.icu.number.NumberFormatter;
import android.icu.number.Precision;
import android.icu.text.NumberFormat;
import android.icu.util.Currency;
import android.os.Build;
import b.w2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.AttributedCharacterIterator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* loaded from: classes2.dex */
public class dj {
    private static FormattedNumber sya(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        LocalizedNumberFormatter localizedNumberFormatterG;
        int i13 = Build.VERSION.SDK_INT;
        if (i13 < 30) {
            return null;
        }
        Currency currency = Currency.getInstance(str);
        Notation notationSimple = Notation.simple();
        if (i11 == 1) {
            notationSimple = Notation.simple();
        } else if (i11 == 2) {
            notationSimple = i13 == 30 ? Notation.simple() : Notation.compactShort();
        }
        LocalizedNumberFormatter localizedNumberFormatterG2 = w2.g(w2.g(w2.g(NumberFormatter.withLocale(locale).unit(currency)).notation(notationSimple)).precision(Precision.maxFraction(i12)));
        RoundingMode roundingMode = RoundingMode.HALF_UP;
        LocalizedNumberFormatter localizedNumberFormatterG3 = w2.g(localizedNumberFormatterG2.roundingMode(RoundingMode.HALF_UP));
        if (i5 == 1) {
            NumberFormatter.UnitWidth unused = NumberFormatter.UnitWidth.ISO_CODE;
            localizedNumberFormatterG = w2.g(localizedNumberFormatterG3.unitWidth(NumberFormatter.UnitWidth.ISO_CODE));
        } else if (i5 == 3) {
            NumberFormatter.UnitWidth unused2 = NumberFormatter.UnitWidth.NARROW;
            localizedNumberFormatterG = w2.g(localizedNumberFormatterG3.unitWidth(NumberFormatter.UnitWidth.NARROW));
        } else if (i5 != 4) {
            NumberFormatter.UnitWidth unused3 = NumberFormatter.UnitWidth.SHORT;
            localizedNumberFormatterG = w2.g(localizedNumberFormatterG3.unitWidth(NumberFormatter.UnitWidth.SHORT));
        } else {
            NumberFormatter.UnitWidth unused4 = NumberFormatter.UnitWidth.FULL_NAME;
            localizedNumberFormatterG = w2.g(localizedNumberFormatterG3.unitWidth(NumberFormatter.UnitWidth.FULL_NAME));
        }
        return localizedNumberFormatterG.format(bigDecimal);
    }

    public static String ycx(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        try {
            FormattedNumber formattedNumberSya = sya(bigDecimal, str, locale, i5, i11, i12);
            return formattedNumberSya != null ? formattedNumberSya.toString() : b.f42142b;
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static List<sya> zb(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        try {
            FormattedNumber formattedNumberSya = sya(bigDecimal, str, locale, i5, i11, i12);
            if (formattedNumberSya != null) {
                return ycx(formattedNumberSya);
            }
        } catch (Throwable unused) {
        }
        return Collections.EMPTY_LIST;
    }

    private static List<sya> ycx(FormattedNumber formattedNumber) {
        NumberFormat.Field field;
        if (Build.VERSION.SDK_INT < 30) {
            return Collections.EMPTY_LIST;
        }
        if (formattedNumber == null) {
            return Collections.EMPTY_LIST;
        }
        String string = formattedNumber.toString();
        if (string.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        AttributedCharacterIterator characterIterator = formattedNumber.toCharacterIterator();
        ArrayList arrayList = new ArrayList();
        int beginIndex = characterIterator.getBeginIndex();
        while (beginIndex < characterIterator.getEndIndex()) {
            characterIterator.setIndex(beginIndex);
            int runStart = characterIterator.getRunStart();
            int runLimit = characterIterator.getRunLimit();
            Iterator<AttributedCharacterIterator.Attribute> it = characterIterator.getAttributes().keySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    field = null;
                    break;
                }
                AttributedCharacterIterator.Attribute next = it.next();
                if (next instanceof NumberFormat.Field) {
                    field = (NumberFormat.Field) next;
                    break;
                }
            }
            arrayList.add(new sya(ycx(field), string.substring(runStart, runLimit), runStart, runLimit));
            beginIndex = runLimit;
        }
        return ycx(arrayList);
    }

    private static String ycx(NumberFormat.Field field) {
        if (field == null) {
            return "literal";
        }
        if (field.toString().toLowerCase().contains("compact")) {
            return "compact";
        }
        if (field.equals(NumberFormat.Field.CURRENCY)) {
            return TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY;
        }
        if (!field.equals(NumberFormat.Field.INTEGER) && !field.equals(NumberFormat.Field.GROUPING_SEPARATOR) && !field.equals(NumberFormat.Field.SIGN)) {
            if (!field.equals(NumberFormat.Field.FRACTION) && !field.equals(NumberFormat.Field.DECIMAL_SEPARATOR)) {
                return "literal";
            }
            return "fraction";
        }
        return "integer";
    }

    private static List<sya> ycx(List<sya> list) {
        if (list != null && !list.isEmpty()) {
            ArrayList arrayList = new ArrayList();
            sya syaVar = list.get(0);
            sya syaVar2 = new sya(syaVar.ycx(), syaVar.zb(), syaVar.sya(), syaVar.dj());
            for (int i5 = 1; i5 < list.size(); i5++) {
                sya syaVar3 = list.get(i5);
                boolean z11 = syaVar2.dj() == syaVar3.sya();
                boolean zEquals = syaVar2.ycx().equals(syaVar3.ycx());
                String strYcx = syaVar2.ycx();
                String strYcx2 = TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY;
                boolean z12 = (strYcx.equals(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY) && syaVar3.ycx().equals("literal")) || (syaVar2.ycx().equals("literal") && syaVar3.ycx().equals(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY));
                boolean z13 = (syaVar2.ycx().equals("compact") && syaVar3.ycx().equals("literal")) || (syaVar2.ycx().equals("literal") && syaVar3.ycx().equals("compact"));
                if (z11 && (zEquals || z12 || z13)) {
                    if (!z12) {
                        strYcx2 = z13 ? "compact" : syaVar2.ycx();
                    }
                    syaVar2.ycx(strYcx2);
                    syaVar2.zb(syaVar2.zb() + syaVar3.zb());
                    syaVar2.ycx(syaVar3.dj());
                } else {
                    arrayList.add(syaVar2);
                    syaVar2 = new sya(syaVar3.ycx(), syaVar3.zb(), syaVar3.sya(), syaVar3.dj());
                }
            }
            arrayList.add(syaVar2);
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                sya syaVar4 = (sya) it.next();
                if (!"literal".equals(syaVar4.ycx())) {
                    arrayList2.add(syaVar4);
                }
            }
            return arrayList2;
        }
        return Collections.EMPTY_LIST;
    }
}
