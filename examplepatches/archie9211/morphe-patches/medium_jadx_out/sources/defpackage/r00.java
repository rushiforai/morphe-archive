package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class r00 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;

    public /* synthetic */ r00(int i, m45 m45Var) {
        this.a = i;
        this.b = m45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.b;
        switch (i) {
            case 0:
                ((tjb) obj).c(((Number) m45Var.invoke()).floatValue());
                return c1eVar;
            case 1:
                ho2.r((zl3) obj, ((uu1) m45Var.invoke()).a, 0L, 0L, 0.0f, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                return c1eVar;
            case 2:
                m45Var.invoke();
                return c1eVar;
            case 3:
                m45Var.invoke();
                return c1eVar;
            case 4:
                m45Var.invoke();
                return c1eVar;
            case 5:
                jyb jybVar = (jyb) obj;
                Object objInvoke = m45Var.invoke();
                Float f = (Float) (Float.isNaN(((Number) objInvoke).floatValue()) ? null : objInvoke);
                gyb.f(jybVar, new k3a(f != null ? f.floatValue() : 0.0f, new hp1(0.0f, 1.0f)));
                return c1eVar;
            case 6:
                jyb jybVar2 = (jyb) obj;
                Object objInvoke2 = m45Var.invoke();
                Float f2 = (Float) (Float.isNaN(((Number) objInvoke2).floatValue()) ? null : objInvoke2);
                gyb.f(jybVar2, new k3a(f2 != null ? f2.floatValue() : 0.0f, new hp1(0.0f, 1.0f)));
                return c1eVar;
            case 7:
                ((anb) obj).getClass();
                return m45Var.invoke();
            case 8:
                obj.getClass();
                return m45Var.invoke();
            case 9:
                ((Float) obj).floatValue();
                return Float.valueOf(((Number) m45Var.invoke()).floatValue());
            case 10:
                return new k46(((long) nk7.w0(((Number) m45Var.invoke()).floatValue())) << 32);
            default:
                return (ip8) m45Var.invoke();
        }
    }
}
