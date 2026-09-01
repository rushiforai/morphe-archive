package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mn7 extends w31 {
    public final /* synthetic */ int a;

    public /* synthetic */ mn7(int i) {
        this.a = i;
    }

    @Override // defpackage.w31
    public final x31 a(Type type, Annotation[] annotationArr, kjb kjbVar) {
        int i = this.a;
        type.getClass();
        annotationArr.getClass();
        switch (i) {
            case 0:
                if (g76.L(vv2.L(type), v31.class)) {
                    if (!(type instanceof ParameterizedType)) {
                        ygf.f("return type must be parameterized as Call<Medium2ApiResponse<<Foo>> or Call<Medium2ApiResponse<out Foo>>");
                        break;
                    } else {
                        Type typeK = vv2.K(0, (ParameterizedType) type);
                        if (g76.L(vv2.L(typeK), jn7.class)) {
                            if (!(typeK instanceof ParameterizedType)) {
                                ygf.f("Medium2ApiResponse must be parameterized as Medium2ApiResponse<Foo> or Medium2ApiResponse<out Foo>");
                            }
                            break;
                        }
                    }
                }
                break;
            default:
                if (g76.L(vv2.L(type), v31.class)) {
                    if (!(type instanceof ParameterizedType)) {
                        ygf.f("return type must be parameterized as Call<Medium2ApiResponseWithPayload<<Foo>> or Call<Medium2ApiResponseWithPayload<out Foo>>");
                        break;
                    } else {
                        Type typeK2 = vv2.K(0, (ParameterizedType) type);
                        if (g76.L(vv2.L(typeK2), nn7.class)) {
                            if (!(typeK2 instanceof ParameterizedType)) {
                                ygf.f("Medium2ApiResponseWithPayload must be parameterized as Medium2ApiResponseWithPayload<Foo> or Medium2ApiResponseWithPayload<out Foo>");
                            }
                            break;
                        }
                    }
                }
                break;
        }
        return null;
    }
}
