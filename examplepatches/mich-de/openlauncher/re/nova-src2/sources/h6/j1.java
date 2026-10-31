package h6;

import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;

/* loaded from: classes.dex */
public interface j1 {
    default f1 create(Class cls) {
        throw new UnsupportedOperationException("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
    }

    default f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        return create(cls);
    }

    default f1 create(KClass modelClass, k6.c extras) {
        Intrinsics.g(modelClass, "modelClass");
        Intrinsics.g(extras, "extras");
        return create(JvmClassMappingKt.b(modelClass), extras);
    }
}
