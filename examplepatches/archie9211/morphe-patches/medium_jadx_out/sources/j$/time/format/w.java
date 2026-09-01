package j$.time.format;

import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class w {
    public static final w a = new w();

    static {
        new ConcurrentHashMap(16, 0.75f, 2);
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof w);
    }

    public final int hashCode() {
        return 182;
    }

    public final String toString() {
        return "DecimalStyle[0+-.]";
    }
}
