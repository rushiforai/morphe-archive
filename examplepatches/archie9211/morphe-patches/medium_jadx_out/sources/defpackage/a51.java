package defpackage;

import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a51 extends b51 {
    public final /* synthetic */ int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a51(Field field, boolean z, int i) {
        super(field, z);
        this.e = i;
    }

    @Override // defpackage.l51
    public void d(Object[] objArr) {
        switch (this.e) {
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
