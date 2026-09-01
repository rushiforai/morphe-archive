package defpackage;

import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yzf {
    public static final /* synthetic */ int a = 0;

    static {
        Charset.forName("UTF-8");
    }

    public static xsg a(ssg ssgVar) {
        wsg wsgVarV = xsg.v();
        int iZ = ssgVar.z();
        wsgVarV.c();
        ((xsg) wsgVarV.b).zze = iZ;
        for (qsg qsgVar : ssgVar.B()) {
            usg usgVarX = vsg.x();
            String strA = qsgVar.y().A();
            usgVarX.c();
            vsg.u((vsg) usgVarX.b, strA);
            dsg dsgVarZ = qsgVar.z();
            usgVarX.c();
            ((vsg) usgVarX.b).zzf = dsgVarZ.zza();
            ntg ntgVarB = qsgVar.B();
            usgVarX.c();
            ((vsg) usgVarX.b).zzh = ntgVarB.zza();
            int iT = qsgVar.t();
            usgVarX.c();
            ((vsg) usgVarX.b).zzg = iT;
            vsg vsgVar = (vsg) usgVarX.b();
            wsgVarV.c();
            xsg.u((xsg) wsgVarV.b, vsgVar);
        }
        return (xsg) wsgVarV.b();
    }
}
