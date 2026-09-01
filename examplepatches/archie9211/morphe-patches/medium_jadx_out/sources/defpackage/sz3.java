package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class sz3 {
    public static final hud a = new hud(zu2.f, zu2.g);
    public static final wlc b = f76.P(0.0f, 400.0f, null, 5);
    public static final wlc c;
    public static final wlc d;

    static {
        f76.P(0.0f, 400.0f, null, 5);
        Map map = qwe.a;
        c = f76.P(0.0f, 400.0f, new k46(4294967297L), 1);
        d = f76.P(0.0f, 400.0f, new s46(4294967297L), 1);
    }

    public static final zz3 a(xd xdVar, tj4 tj4Var, x45 x45Var) {
        return new zz3(new esd((i94) null, (pfc) null, new uj1(xdVar, tj4Var, x45Var), (gp7) null, (LinkedHashMap) null, 123));
    }

    public static zz3 b(cud cudVar, int i) {
        zq0 zq0Var = z46.o;
        tj4 tj4VarP = cudVar;
        if ((i & 1) != 0) {
            Map map = qwe.a;
            tj4VarP = f76.P(0.0f, 400.0f, new s46(4294967297L), 1);
        }
        return a(g76.L(zq0Var, z46.m) ? z46.e : g76.L(zq0Var, zq0Var) ? z46.k : z46.h, tj4VarP, new ox8(1, 14));
    }

    public static zz3 c(cud cudVar, int i) {
        tj4 tj4VarP = cudVar;
        if ((i & 1) != 0) {
            tj4VarP = f76.P(0.0f, 400.0f, null, 5);
        }
        return new zz3(new esd(new i94(tj4VarP), (pfc) null, (uj1) null, (gp7) null, (LinkedHashMap) null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER));
    }

    public static k54 d(cud cudVar, int i) {
        tj4 tj4VarP = cudVar;
        if ((i & 1) != 0) {
            tj4VarP = f76.P(0.0f, 400.0f, null, 5);
        }
        return new k54(new esd(new i94(tj4VarP), (pfc) null, (uj1) null, (gp7) null, (LinkedHashMap) null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER));
    }

    public static final k54 e(tj4 tj4Var, ar0 ar0Var, x45 x45Var) {
        return new k54(new esd((i94) null, (pfc) null, new uj1(ar0Var, tj4Var, x45Var), (gp7) null, (LinkedHashMap) null, 123));
    }

    public static k54 f(tjd tjdVar, int i) {
        Map map = qwe.a;
        wlc wlcVarP = f76.P(0.0f, 400.0f, new s46(4294967297L), 1);
        ar0 ar0Var = z46.l;
        x45 x45Var = tjdVar;
        if ((i & 8) != 0) {
            x45Var = zu2.j;
        }
        return e(wlcVarP, ar0Var, x45Var);
    }

    public static k54 g(cud cudVar, int i) {
        zq0 zq0Var = z46.o;
        tj4 tj4VarP = cudVar;
        if ((i & 1) != 0) {
            Map map = qwe.a;
            tj4VarP = f76.P(0.0f, 400.0f, new s46(4294967297L), 1);
        }
        return e(tj4VarP, g76.L(zq0Var, z46.m) ? z46.e : g76.L(zq0Var, zq0Var) ? z46.k : z46.h, new ox8(1, 15));
    }
}
