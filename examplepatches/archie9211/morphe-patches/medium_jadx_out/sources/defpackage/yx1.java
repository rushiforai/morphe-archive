package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.concurrent.CompletableFuture;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yx1 extends w31 {
    @Override // defpackage.w31
    public final x31 a(Type type, Annotation[] annotationArr, kjb kjbVar) {
        if (vv2.L(type) != CompletableFuture.class) {
            return null;
        }
        if (!(type instanceof ParameterizedType)) {
            ygf.f("CompletableFuture return type must be parameterized as CompletableFuture<Foo> or CompletableFuture<? extends Foo>");
            return null;
        }
        Type typeK = vv2.K(0, (ParameterizedType) type);
        if (vv2.L(typeK) != zcb.class) {
            return new olb(8, typeK);
        }
        if (typeK instanceof ParameterizedType) {
            return new zg7(20, vv2.K(0, (ParameterizedType) typeK));
        }
        ygf.f("Response must be parameterized as Response<Foo> or Response<? extends Foo>");
        return null;
    }
}
