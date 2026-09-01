package defpackage;

import java.util.EnumSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum ygc {
    None(0),
    Enabled(1),
    RequireConfirm(2);

    public static final xgc Companion = new xgc();
    public static final EnumSet b;
    public final long a;

    static {
        EnumSet enumSetAllOf = EnumSet.allOf(ygc.class);
        enumSetAllOf.getClass();
        b = enumSetAllOf;
    }

    ygc(long j) {
        this.a = j;
    }

    public static final EnumSet<ygc> parseOptions(long j) {
        Companion.getClass();
        return xgc.a(j);
    }

    public final long getValue() {
        return this.a;
    }
}
