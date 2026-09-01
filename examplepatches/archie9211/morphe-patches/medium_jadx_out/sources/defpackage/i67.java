package defpackage;

import android.os.Build;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class i67 {
    public static final i67 b = a(new Locale[0]);
    public final k67 a;

    public i67(k67 k67Var) {
        this.a = k67Var;
    }

    public static i67 a(Locale... localeArr) {
        return Build.VERSION.SDK_INT >= 24 ? new i67(new l67(o6.f(localeArr))) : new i67(new j67(localeArr));
    }

    public static i67 c() {
        return Build.VERSION.SDK_INT >= 24 ? new i67(new l67(o6.h())) : a(Locale.getDefault());
    }

    public final boolean equals(Object obj) {
        if (obj instanceof i67) {
            return this.a.equals(((i67) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return this.a.toString();
    }

    public static i67 b(String str) {
        if (str == null || str.isEmpty()) {
            return b;
        }
        String[] strArrSplit = str.split(mBTDfueQiGWRV.nvCzB, -1);
        int length = strArrSplit.length;
        Locale[] localeArr = new Locale[length];
        for (int i = 0; i < length; i++) {
            localeArr[i] = Locale.forLanguageTag(strArrSplit[i]);
        }
        return a(localeArr);
    }
}
