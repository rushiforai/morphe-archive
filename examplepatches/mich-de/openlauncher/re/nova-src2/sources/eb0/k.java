package eb0;

import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.concurrent.CompletableFuture;

/* loaded from: classes.dex */
public final class k extends e {
    @Override // eb0.e
    public final f a(Type type, Annotation[] annotationArr) {
        if (w0.h(type) != CompletableFuture.class) {
            return null;
        }
        if (!(type instanceof ParameterizedType)) {
            throw new IllegalStateException("CompletableFuture return type must be parameterized as CompletableFuture<Foo> or CompletableFuture<? extends Foo>");
        }
        Type typeG = w0.g(0, (ParameterizedType) type);
        if (w0.h(typeG) != p0.class) {
            return new i(0, typeG);
        }
        if (!(typeG instanceof ParameterizedType)) {
            throw new IllegalStateException("Response must be parameterized as Response<Foo> or Response<? extends Foo>");
        }
        return new i(1, w0.g(0, (ParameterizedType) typeG));
    }
}
