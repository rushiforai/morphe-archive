package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cy2 extends w31 {
    public final Executor a;

    public cy2(Executor executor) {
        this.a = executor;
    }

    @Override // defpackage.w31
    public final x31 a(Type type, Annotation[] annotationArr, kjb kjbVar) {
        if (vv2.L(type) != v31.class) {
            return null;
        }
        if (type instanceof ParameterizedType) {
            return new s26(vv2.K(0, (ParameterizedType) type), 18, vv2.P(annotationArr, nfc.class) ? null : this.a);
        }
        ay0.e("Call return type must be parameterized as Call<Foo> or Call<? extends Foo>");
        return null;
    }
}
