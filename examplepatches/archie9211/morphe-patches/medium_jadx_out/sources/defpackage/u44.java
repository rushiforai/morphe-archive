package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import j$.util.DesugarCollections;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Executors;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class u44 implements g8a {
    public final /* synthetic */ int a;

    public /* synthetic */ u44(int i) {
        this.a = i;
    }

    @Override // defpackage.g8a
    public final Object get() {
        switch (this.a) {
            case 0:
                return new qa6(Executors.newSingleThreadExecutor(), 1);
            default:
                tz7 tz7Var = new tz7(25, false);
                HashMap map = new HashMap();
                z0a z0aVar = z0a.DEFAULT;
                Set set = Collections.EMPTY_SET;
                String str = HrUBqHumRuLe.hiwDCGwcVTVH;
                if (set == null) {
                    z72.c(str);
                    return null;
                }
                map.put(z0aVar, new dk0(30000L, 86400000L, set));
                z0a z0aVar2 = z0a.HIGHEST;
                if (set == null) {
                    z72.c(str);
                    return null;
                }
                map.put(z0aVar2, new dk0(1000L, 86400000L, set));
                z0a z0aVar3 = z0a.VERY_LOW;
                if (set == null) {
                    z72.c(str);
                    return null;
                }
                Set setUnmodifiableSet = DesugarCollections.unmodifiableSet(new HashSet(Arrays.asList(qqb.DEVICE_IDLE)));
                if (setUnmodifiableSet == null) {
                    z72.c(str);
                    return null;
                }
                map.put(z0aVar3, new dk0(86400000L, 86400000L, setUnmodifiableSet));
                if (map.keySet().size() >= z0a.values().length) {
                    new HashMap();
                    return new ck0(tz7Var, map);
                }
                ygf.f("Not all priorities have been configured");
                return null;
        }
    }
}
