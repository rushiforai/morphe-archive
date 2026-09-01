package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class me1 implements k90 {
    public final /* synthetic */ long a;

    public me1(long j) {
        this.a = j;
    }

    @Override // defpackage.k90
    public final Object a(gx5 gx5Var, rx5 rx5Var, n92 n92Var) {
        yu1 yu1Var = new yu1(op8.n0(this.a));
        return new e90(sgg.z(yu1Var, rx5Var.a, 1), new w0d(yu1Var, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
    }
}
