package defpackage;

import android.content.res.Resources;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vcb {
    public final Resources a;
    public final Resources.Theme b;

    public vcb(Resources resources, Resources.Theme theme) {
        this.a = resources;
        this.b = theme;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && vcb.class == obj.getClass()) {
            vcb vcbVar = (vcb) obj;
            if (this.a.equals(vcbVar.a) && Objects.equals(this.b, vcbVar.b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b);
    }
}
