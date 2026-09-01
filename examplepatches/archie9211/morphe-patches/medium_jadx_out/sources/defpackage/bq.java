package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bq extends x55 implements x45 {
    public final /* synthetic */ fx6 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bq(fx6 fx6Var) {
        super(1, f76.class, "localToScreen", "startInput$localToScreen(Landroidx/compose/foundation/text/input/internal/LegacyPlatformTextInputServiceAdapter$LegacyPlatformTextInputNode;[F)V", 0);
        this.a = fx6Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        float[] fArr = ((pk7) obj).a;
        hp6 hp6Var = (hp6) this.a.r.getValue();
        if (hp6Var != null) {
            if (!hp6Var.m()) {
                hp6Var = null;
            }
            if (hp6Var != null) {
                hp6Var.h(fArr);
            }
        }
        return c1e.a;
    }
}
