package com.facebook.ads.redexgen.X;

import android.os.LocaleList;

/* renamed from: com.facebook.ads.redexgen.X.Ix, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0998Ix {
    public static String[] A00 = {"hShFbF6hG8ImEQ5DPZXC5XKuAhXIyncp", "I9sWkjvuMvTn2BSk1VupPxOE7tMJXDC3", "jvZ9kukavm9gISJAjesuIogrSe6UW7oe", "vvj60rUZ6GMsuV00tIvS0u9RB0u54Eat", "iuiVPPk2Xt0lcR5ydaMA5UH5HtWds2d8", "OkjMxBPJ4PHrPwFKwYEPmckln", "EpcXZq8SAgK8DFNaEWMdNLYJU3OqJ7Kz", "ICVT4efp2CZPZFo06BMbdapAf"};

    public static String A00() {
        LocaleList adjustedDefault = LocaleList.getAdjustedDefault();
        if (adjustedDefault.size() <= 0) {
            return null;
        }
        if (A00[1].charAt(4) == 'X') {
            throw new RuntimeException();
        }
        A00[5] = "kA8nO2oBTIQWJ09RhSoy1DRlK";
        return adjustedDefault.get(0).toLanguageTag();
    }
}
