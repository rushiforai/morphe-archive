package defpackage;

import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class g8c {
    public static final f8c a;
    public static final sn3 b;

    static {
        fm3 fm3Var = ao3.d;
        fm3Var.getClass();
        zk6 zk6Var = new zk6();
        Float fValueOf = Float.valueOf(0.0f);
        zk6Var.a(fValueOf, 0).b = fm3Var;
        Float fValueOf2 = Float.valueOf(1.0f);
        zk6Var.a(fValueOf2, LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE);
        zk6Var.a(fValueOf2, 2300);
        zk6Var.a = 2300;
        k16 k16VarG = f76.G(new al6(zk6Var), v4b.Restart, 0L, 4);
        long j = uu1.d;
        a = new f8c(k16VarG, d46.R(new uu1(uu1.b(0.25f, j)), new uu1(uu1.b(1.0f, j)), new uu1(uu1.b(0.25f, j))), d46.R(fValueOf, Float.valueOf(0.5f), fValueOf2));
        b = new sn3(1, new lg9(28));
    }
}
