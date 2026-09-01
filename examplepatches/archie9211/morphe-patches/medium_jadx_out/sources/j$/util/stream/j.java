package j$.util.stream;

import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class j {
    public static final /* synthetic */ int a = 0;

    static {
        h hVar = h.CONCURRENT;
        h hVar2 = h.UNORDERED;
        h hVar3 = h.IDENTITY_FINISH;
        Collections.unmodifiableSet(EnumSet.of(hVar, hVar2, hVar3));
        Collections.unmodifiableSet(EnumSet.of(hVar, hVar2));
        Collections.unmodifiableSet(EnumSet.of(hVar3));
        Collections.unmodifiableSet(EnumSet.of(hVar2, hVar3));
        Set set = Collections.EMPTY_SET;
        Collections.unmodifiableSet(EnumSet.of(hVar2));
    }

    public static void a(double[] dArr, double d) {
        double d2 = d - dArr[1];
        double d3 = dArr[0];
        double d4 = d3 + d2;
        dArr[1] = (d4 - d3) - d2;
        dArr[0] = d4;
    }
}
