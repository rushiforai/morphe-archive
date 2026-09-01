package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u2c implements v2c {
    public final DarkMode a;

    public u2c(DarkMode darkMode) {
        darkMode.getClass();
        this.a = darkMode;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u2c) && this.a == ((u2c) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Theme(actualTheme=" + this.a + ")";
    }
}
