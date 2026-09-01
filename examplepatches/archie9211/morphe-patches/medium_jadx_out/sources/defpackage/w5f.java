package defpackage;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w5f implements rf4 {
    public static final Locale a = Locale.US;

    @Override // defpackage.rf4
    public final List alternateNames(Field field) {
        return Collections.EMPTY_LIST;
    }

    @Override // defpackage.rf4
    public final String translateName(Field field) throws IOException {
        String name = field.getName();
        name.getClass();
        if (!muc.Q(name, "_", false)) {
            return name;
        }
        String strF0 = bu1.F0(muc.p0(name, new String[]{"_"}, 0, 6), "", null, null, new sqe(23), 30);
        if (strF0.length() <= 0) {
            return strF0;
        }
        StringBuilder sb = new StringBuilder();
        char cCharAt = strF0.charAt(0);
        Locale locale = a;
        locale.getClass();
        String strValueOf = String.valueOf(cCharAt);
        strValueOf.getClass();
        String lowerCase = strValueOf.toLowerCase(locale);
        lowerCase.getClass();
        sb.append((Object) lowerCase);
        sb.append(strF0.substring(1));
        return sb.toString();
    }
}
