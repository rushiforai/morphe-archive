package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nhe implements whe {
    public final String a;
    public final SourceParameter b;

    public nhe(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nhe)) {
            return false;
        }
        nhe nheVar = (nhe) obj;
        return g76.L(this.a, nheVar.a) && g76.L(this.b, nheVar.b);
    }

    public final int hashCode() {
        String str = this.a;
        return this.b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "Blocked(userName=" + this.a + ", sourceParameter=" + this.b + PqkdNGCEoxOKZk.VxgpOx;
    }
}
