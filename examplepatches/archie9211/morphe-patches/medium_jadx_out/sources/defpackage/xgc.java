package defpackage;

import java.util.EnumSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xgc {
    public static EnumSet a(long j) {
        EnumSet enumSetNoneOf = EnumSet.noneOf(ygc.class);
        for (ygc ygcVar : ygc.b) {
            if ((ygcVar.getValue() & j) != 0) {
                enumSetNoneOf.add(ygcVar);
            }
        }
        enumSetNoneOf.getClass();
        return enumSetNoneOf;
    }
}
