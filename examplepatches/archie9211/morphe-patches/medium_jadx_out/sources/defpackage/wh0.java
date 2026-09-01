package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wh0 {
    public final vh0 a;
    public final String b;
    public final File c;

    public wh0(vh0 vh0Var, String str, File file) {
        this.a = vh0Var;
        if (str == null) {
            z72.c("Null sessionId");
            throw null;
        }
        this.b = str;
        this.c = file;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof wh0)) {
            return false;
        }
        wh0 wh0Var = (wh0) obj;
        return this.a.equals(wh0Var.a) && this.b.equals(wh0Var.b) && this.c.equals(wh0Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() ^ ((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003);
    }

    public final String toString() {
        return "CrashlyticsReportWithSessionId{report=" + this.a + ", sessionId=" + this.b + ", reportFile=" + this.c + "}";
    }
}
