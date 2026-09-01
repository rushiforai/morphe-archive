package defpackage;

import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y41 extends b51 implements tx0 {
    public final Object e;

    public y41(Field field, Object obj) {
        super(field, false);
        this.e = obj;
    }

    @Override // defpackage.b51, defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        return ((Field) this.a).get(this.e);
    }
}
