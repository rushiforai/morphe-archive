package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uh7 extends vh7 {
    public final LinkedHashMap a;
    public String b = null;

    public uh7(LinkedHashMap linkedHashMap) {
        this.a = linkedHashMap;
    }

    public final String toString() {
        return ev6.z(new StringBuilder("Map ("), this.b, ')');
    }
}
