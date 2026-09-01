package defpackage;

import java.io.Serializable;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e89 implements Serializable {
    public final HashMap a;

    public e89(HashMap map) {
        this.a = map;
    }

    private final Object readResolve() {
        return new f89(this.a);
    }
}
