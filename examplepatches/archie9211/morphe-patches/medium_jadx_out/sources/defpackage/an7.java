package defpackage;

import android.os.Build;
import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class an7 {
    public dn7 a;

    public an7(String str, int i, int i2) {
        if (str == null) {
            z72.c("package shouldn't be null");
            throw null;
        }
        if (TextUtils.isEmpty(str)) {
            ay0.e("packageName should be nonempty");
            throw null;
        }
        if (Build.VERSION.SDK_INT < 28) {
            this.a = new dn7(str, i, i2);
            return;
        }
        cn7 cn7Var = new cn7(str, i, i2);
        bn7.a(i, i2, str);
        this.a = cn7Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof an7) {
            return this.a.equals(((an7) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
