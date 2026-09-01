package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class osd implements nsd {
    public final Set a;
    public final kk0 b;
    public final psd c;

    public osd(Set set, kk0 kk0Var, psd psdVar) {
        this.a = set;
        this.b = kk0Var;
        this.c = psdVar;
    }

    public final iq1 a(String str, wy3 wy3Var, qrd qrdVar) {
        Set set = this.a;
        if (set.contains(wy3Var)) {
            return new iq1(this.b, str, wy3Var, qrdVar, this.c, 17);
        }
        fm3.e("%s is not supported byt this factory. Supported encodings are: %s.", new Object[]{wy3Var, set});
        return null;
    }
}
