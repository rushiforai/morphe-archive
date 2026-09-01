package defpackage;

import j$.util.Optional;
import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o01 extends x92 {
    public final /* synthetic */ int a;

    public /* synthetic */ o01(int i) {
        this.a = i;
    }

    @Override // defpackage.x92
    public y92 a(Type type, Annotation[] annotationArr) {
        switch (this.a) {
            case 0:
                if (sbb.class.isAssignableFrom(vv2.L(type))) {
                    return no3.b;
                }
                return null;
            default:
                return super.a(type, annotationArr);
        }
    }

    @Override // defpackage.x92
    public final y92 b(Type type, Annotation[] annotationArr, kjb kjbVar) {
        switch (this.a) {
            case 0:
                if (type == fdb.class) {
                    return vv2.P(annotationArr, ttc.class) ? zi5.b : hpe.c;
                }
                if (type == Void.class) {
                    return uob.b;
                }
                if (vv2.n && type == c1e.class) {
                    return xsa.b;
                }
                return null;
            default:
                if (vv2.L(type) != Optional.class) {
                    return null;
                }
                return new olb(23, kjbVar.d(vv2.K(0, (ParameterizedType) type), annotationArr));
        }
    }
}
