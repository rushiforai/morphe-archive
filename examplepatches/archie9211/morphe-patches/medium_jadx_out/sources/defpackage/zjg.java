package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzqh;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zjg {
    public static final ujg a;
    public static final ujg b;
    public static final gjg c;

    static {
        tjg tjgVar = tjg.f;
        tjg tjgVar2 = tjg.d;
        sjg sjgVar = sjg.b;
        try {
            rjg rjgVarB = ujg.b();
            rjgVarB.a = 32;
            rjgVarB.b = 16;
            rjgVarB.d = sjgVar;
            rjgVarB.c = tjgVar2;
            a = rjgVarB.a();
            try {
                rjg rjgVarB2 = ujg.b();
                rjgVarB2.a = 32;
                rjgVarB2.b = 32;
                rjgVarB2.d = sjgVar;
                rjgVarB2.c = tjgVar2;
                rjgVarB2.a();
                try {
                    rjg rjgVarB3 = ujg.b();
                    rjgVarB3.a = 64;
                    rjgVarB3.b = 32;
                    rjgVarB3.d = sjgVar;
                    rjgVarB3.c = tjgVar;
                    rjgVarB3.a();
                    try {
                        rjg rjgVarB4 = ujg.b();
                        rjgVarB4.a = 64;
                        rjgVarB4.b = 64;
                        rjgVarB4.d = sjgVar;
                        rjgVarB4.c = tjgVar;
                        b = rjgVarB4.a();
                        try {
                            tag tagVarB = gjg.b();
                            tagVarB.f(32);
                            tagVarB.h(16);
                            tagVarB.b = zwf.l;
                            c = tagVarB.d();
                        } catch (Exception e) {
                            throw new zzqh(e);
                        }
                    } catch (Exception e2) {
                        throw new zzqh(e2);
                    }
                } catch (Exception e3) {
                    throw new zzqh(e3);
                }
            } catch (Exception e4) {
                throw new zzqh(e4);
            }
        } catch (Exception e5) {
            throw new zzqh(e5);
        }
    }
}
