package defpackage;

import java.io.Serializable;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v2b implements Serializable {
    public final String a;
    public final int b;

    public v2b(String str, int i) {
        this.a = str;
        this.b = i;
    }

    private final Object readResolve() {
        Pattern patternCompile = Pattern.compile(this.a, this.b);
        patternCompile.getClass();
        return new x2b(patternCompile);
    }
}
