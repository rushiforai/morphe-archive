package kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure;

import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ReflectJavaAnnotationOwnerKt {
    @Nullable
    public static final ReflectJavaAnnotation findAnnotation(@NotNull Annotation[] annotationArr, @NotNull FqName fqName) {
        Annotation annotation;
        Intrinsics.g(annotationArr, "<this>");
        Intrinsics.g(fqName, "fqName");
        int length = annotationArr.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                annotation = null;
                break;
            }
            annotation = annotationArr[i5];
            if (Intrinsics.b(ReflectClassUtilKt.getClassId(JvmClassMappingKt.b(JvmClassMappingKt.a(annotation))).asSingleFqName(), fqName)) {
                break;
            }
            i5++;
        }
        if (annotation != null) {
            return new ReflectJavaAnnotation(annotation);
        }
        return null;
    }

    @NotNull
    public static final List<ReflectJavaAnnotation> getAnnotations(@NotNull Annotation[] annotationArr) {
        Intrinsics.g(annotationArr, "<this>");
        ArrayList arrayList = new ArrayList(annotationArr.length);
        for (Annotation annotation : annotationArr) {
            arrayList.add(new ReflectJavaAnnotation(annotation));
        }
        return arrayList;
    }
}
