package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class w13 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ upc b;

    public /* synthetic */ w13(upc upcVar, int i) {
        this.a = i;
        this.b = upcVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        upc upcVar = this.b;
        switch (i) {
            case 0:
                zl3 zl3Var = (zl3) obj;
                long j = ((uu1) upcVar.getValue()).a;
                if (!ezd.a(j, uu1.h)) {
                    ho2.r(zl3Var, j, 0L, 0L, 0.0f, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                }
                return c1eVar;
            case 1:
                ((tjb) obj).c(((Number) upcVar.getValue()).floatValue());
                return c1eVar;
            case 2:
                ((m73) obj).getClass();
                return new k46(((long) ((Number) upcVar.getValue()).intValue()) & 4294967295L);
            case 3:
                m73 m73Var = (m73) obj;
                m73Var.getClass();
                return new k46(((long) m73Var.i0(((vj3) upcVar.getValue()).a)) << 32);
            default:
                m73 m73Var2 = (m73) obj;
                m73Var2.getClass();
                return new k46(((long) m73Var2.i0(((vj3) upcVar.getValue()).a)) << 32);
        }
    }
}
