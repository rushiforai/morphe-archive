package cy;

import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;

/* loaded from: classes4.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Regex f48495a = new Regex("P(\\d+)([YMWD])");

    public static final Integer a(String str) {
        if (str == null) {
            return null;
        }
        switch (str.hashCode()) {
            case 99228:
                return !str.equals("day") ? null : 2132019078;
            case 3645428:
                return !str.equals("week") ? null : 2132019080;
            case 3704893:
                return !str.equals("year") ? null : 2132019081;
            case 104080000:
                return !str.equals("month") ? null : 2132019079;
            default:
                return null;
        }
    }

    public static final int b(String str) {
        String str2;
        Integer numU0;
        kotlin.text.b bVarB = f48495a.b(str);
        if (bVarB == null || (str2 = (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1)) == null || (numU0 = r70.i.u0(str2)) == null) {
            return 1;
        }
        return numU0.intValue();
    }

    public static final String c(String str) {
        kotlin.text.b bVarB = f48495a.b(str);
        String str2 = bVarB != null ? (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(2) : null;
        if (str2 != null) {
            int iHashCode = str2.hashCode();
            if (iHashCode != 68) {
                if (iHashCode != 77) {
                    if (iHashCode != 87) {
                        if (iHashCode == 89 && str2.equals("Y")) {
                            return "year";
                        }
                    } else if (str2.equals("W")) {
                        return "week";
                    }
                } else if (str2.equals("M")) {
                    return "month";
                }
            } else if (str2.equals("D")) {
                return "day";
            }
        }
        return null;
    }
}
