package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ik0 {
    public final boolean a;

    public ik0(boolean z) {
        String str = Build.VERSION.RELEASE;
        String str2 = Build.VERSION.CODENAME;
        if (str == null) {
            z72.c("Null osRelease");
            throw null;
        }
        if (str2 != null) {
            this.a = z;
        } else {
            z72.c("Null osCodeName");
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ik0)) {
            return false;
        }
        ik0 ik0Var = (ik0) obj;
        String str = Build.VERSION.RELEASE;
        if (!str.equals(str)) {
            return false;
        }
        String str2 = Build.VERSION.CODENAME;
        return str2.equals(str2) && this.a == ik0Var.a;
    }

    public final int hashCode() {
        return (this.a ? 1231 : 1237) ^ ((((Build.VERSION.RELEASE.hashCode() ^ 1000003) * 1000003) ^ Build.VERSION.CODENAME.hashCode()) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("OsData{osRelease=");
        sb.append(Build.VERSION.RELEASE);
        sb.append(", osCodeName=");
        sb.append(Build.VERSION.CODENAME);
        sb.append(", isRooted=");
        return lv8.t(sb, this.a, "}");
    }
}
