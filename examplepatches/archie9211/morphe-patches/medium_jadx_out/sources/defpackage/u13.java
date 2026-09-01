package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u13 implements xrb {
    public final /* synthetic */ v13 a;

    public u13(v13 v13Var) {
        this.a = v13Var;
    }

    @Override // defpackage.xrb
    public final float a(float f) {
        if (Float.isNaN(f)) {
            return 0.0f;
        }
        v13 v13Var = this.a;
        float fFloatValue = ((Number) v13Var.a.invoke(Float.valueOf(f))).floatValue();
        v13Var.e.setValue(Boolean.valueOf(fFloatValue > 0.0f));
        v13Var.f.setValue(Boolean.valueOf(fFloatValue < 0.0f));
        return fFloatValue;
    }
}
