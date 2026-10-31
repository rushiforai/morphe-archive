package io.branch.requery.android.database.sqlite;

import android.text.TextUtils;
import b.c0;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public abstract class v {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f61868a = Pattern.compile("\\s*\\d+\\s*(,\\s*\\d+\\s*)?");

    public static void a(StringBuilder sb2, String str, String str2) {
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        sb2.append(str);
        sb2.append(str2);
    }

    public static String b(boolean z11, String str, String[] strArr, String str2, String str3, String str4, String str5, String str6) {
        if (TextUtils.isEmpty(str3) && !TextUtils.isEmpty(str4)) {
            throw new IllegalArgumentException("HAVING clauses are only permitted when using a groupBy clause");
        }
        if (!TextUtils.isEmpty(str6) && !f61868a.matcher(str6).matches()) {
            throw new IllegalArgumentException(c0.k("invalid LIMIT clauses:", str6));
        }
        StringBuilder sb2 = new StringBuilder(120);
        sb2.append("SELECT ");
        if (z11) {
            sb2.append("DISTINCT ");
        }
        if (strArr == null || strArr.length == 0) {
            sb2.append("* ");
        } else {
            int length = strArr.length;
            for (int i5 = 0; i5 < length; i5++) {
                String str7 = strArr[i5];
                if (str7 != null) {
                    if (i5 > 0) {
                        sb2.append(", ");
                    }
                    sb2.append(str7);
                }
            }
            sb2.append(' ');
        }
        sb2.append("FROM ");
        sb2.append(str);
        a(sb2, " WHERE ", str2);
        a(sb2, " GROUP BY ", str3);
        a(sb2, " HAVING ", str4);
        a(sb2, " ORDER BY ", str5);
        a(sb2, " LIMIT ", str6);
        return sb2.toString();
    }
}
