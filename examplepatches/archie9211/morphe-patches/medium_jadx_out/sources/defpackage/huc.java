package defpackage;

import android.content.res.Resources;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.reader.R;
import java.util.Locale;
import java.util.regex.Pattern;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class huc {
    public static final x2b a = new x2b("^P(\\d+)([DWMY])$");
    public static final Pattern b = Pattern.compile("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+");

    public static final boolean b(String str) {
        str.getClass();
        return str.length() > 0 && b.matcher(str).matches();
    }

    public static final f09 c(String str) {
        str.getClass();
        String upperCase = muc.y0(str).toString().toUpperCase(Locale.ROOT);
        upperCase.getClass();
        ij7 ij7VarB = a.b(upperCase);
        if (ij7VarB != null) {
            return new f09(Integer.valueOf(Integer.parseInt((String) ((gj7) ij7VarB.a()).get(1))), ((gj7) ij7VarB.a()).get(2));
        }
        ay0.e("Unsupported ISO-8601 period: ".concat(upperCase));
        return null;
    }

    public static final String d(String str) {
        String strL = tuc.L(str, "<p></p>", "");
        if (muc.b0(strL)) {
            return null;
        }
        return strL;
    }

    public static final String a(String str) {
        str.getClass();
        String str2 = ziYqbdHrAXvj.FsLzNhxwytwHcc;
        if (tuc.N(str, str2, false)) {
            return tuc.L(str, str2, "https://");
        }
        if (!tuc.N(str, "https://", false)) {
            return "https://".concat(str);
        }
        return str;
    }

    public static final String e(String str, x12 x12Var) {
        str.getClass();
        Resources resources = (Resources) ((p65) x12Var).j(eo.c);
        resources.getClass();
        f09 f09VarC = c(str);
        int iIntValue = ((Number) f09VarC.a).intValue();
        String str2 = (String) f09VarC.b;
        int iHashCode = str2.hashCode();
        if (iHashCode != 68) {
            if (iHashCode != 77) {
                if (iHashCode != 87) {
                    if (iHashCode == 89 && str2.equals("Y")) {
                        String quantityString = resources.getQuantityString(R.plurals.period_years, iIntValue, Integer.valueOf(iIntValue));
                        quantityString.getClass();
                        return quantityString;
                    }
                } else if (str2.equals("W")) {
                    String quantityString2 = resources.getQuantityString(R.plurals.period_weeks, iIntValue, Integer.valueOf(iIntValue));
                    quantityString2.getClass();
                    return quantityString2;
                }
            } else if (str2.equals("M")) {
                String quantityString3 = resources.getQuantityString(R.plurals.period_months, iIntValue, Integer.valueOf(iIntValue));
                quantityString3.getClass();
                return quantityString3;
            }
        } else if (str2.equals("D")) {
            String quantityString4 = resources.getQuantityString(R.plurals.period_days, iIntValue, Integer.valueOf(iIntValue));
            quantityString4.getClass();
            return quantityString4;
        }
        ay0.e(fiHTiFJ.iunqsTTmZWsyF.concat(str));
        return null;
    }
}
