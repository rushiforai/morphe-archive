package defpackage;

import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e51 extends f51 {
    public final /* synthetic */ int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e51(Field field, boolean z, boolean z2, int i) {
        super(field, z, z2);
        this.g = i;
    }

    @Override // defpackage.f51, defpackage.l51
    public void d(Object[] objArr) {
        switch (this.g) {
            case 1:
                objArr.getClass();
                super.d(objArr);
                e(k80.u0(objArr));
                break;
            default:
                super.d(objArr);
                break;
        }
    }
}
