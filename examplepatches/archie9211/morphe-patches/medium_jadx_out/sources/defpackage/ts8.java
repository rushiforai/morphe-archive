package defpackage;

import com.medium.android.graphql.OnboardingStarterPackQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ts8 {
    public final hs8 a;
    public final ft8 b;
    public final r6c c;

    public ts8(hs8 hs8Var, ft8 ft8Var) {
        ft8Var.getClass();
        this.a = hs8Var;
        this.b = ft8Var;
        this.c = k40.x(0, 7, null);
    }

    public static os8 a(Object obj) {
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            return new ls8(thB);
        }
        OnboardingStarterPackQuery.OnStarterPack onStarterPack = (OnboardingStarterPackQuery.OnStarterPack) obj;
        return onStarterPack == null ? new ls8(new IllegalStateException("Starter pack not found")) : new ns8(onStarterPack, false);
    }
}
