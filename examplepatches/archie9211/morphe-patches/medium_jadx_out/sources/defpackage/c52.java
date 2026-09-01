package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class c52 {
    public final File a;
    public final File b;

    public c52(File file, File file2) {
        this.a = file;
        this.b = file2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c52)) {
            return false;
        }
        c52 c52Var = (c52) obj;
        return this.a.equals(c52Var.a) && g76.L(this.b, c52Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        File file = this.b;
        return iHashCode + (file == null ? 0 : file.hashCode());
    }

    public final String toString() {
        return "Batch(file=" + this.a + ZVsviyDAr.wWFu + this.b + ")";
    }
}
