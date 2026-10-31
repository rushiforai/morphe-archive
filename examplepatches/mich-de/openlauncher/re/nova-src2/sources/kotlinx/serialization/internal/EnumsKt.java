package kotlinx.serialization.internal;

import java.lang.annotation.Annotation;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000$\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0004\n\u0002\u0010\u001b\n\u0002\b\u0006\u001a9\u0010\u0000\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u000e\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0007H\u0001¢\u0006\u0002\u0010\b\u001a_\u0010\t\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u000e\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00072\u000e\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00072\u0014\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u00070\u0007H\u0001¢\u0006\u0002\u0010\r\u001ao\u0010\u000e\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u000e\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00072\u000e\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00072\u0014\u0010\u000f\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u00070\u00072\u000e\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u0007H\u0001¢\u0006\u0002\u0010\u0011¨\u0006\u0012"}, d2 = {"createSimpleEnumSerializer", "Lkotlinx/serialization/KSerializer;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serialName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "values", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;[Ljava/lang/Enum;)Lkotlinx/serialization/KSerializer;", "createMarkedEnumSerializer", "names", "annotations", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;[Ljava/lang/Enum;[Ljava/lang/String;[[Ljava/lang/annotation/Annotation;)Lkotlinx/serialization/KSerializer;", "createAnnotatedEnumSerializer", "entryAnnotations", "classAnnotations", "(Ljava/lang/String;[Ljava/lang/Enum;[Ljava/lang/String;[[Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)Lkotlinx/serialization/KSerializer;", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class EnumsKt {
    @PublishedApi
    @NotNull
    public static final <T extends Enum<T>> KSerializer<T> createAnnotatedEnumSerializer(@NotNull String serialName, @NotNull T[] values, @NotNull String[] names, @NotNull Annotation[][] entryAnnotations, @Nullable Annotation[] annotationArr) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(values, "values");
        Intrinsics.g(names, "names");
        Intrinsics.g(entryAnnotations, "entryAnnotations");
        EnumDescriptor enumDescriptor = new EnumDescriptor(serialName, values.length);
        if (annotationArr != null) {
            for (Annotation annotation : annotationArr) {
                enumDescriptor.pushClassAnnotation(annotation);
            }
        }
        int length = values.length;
        int i5 = 0;
        int i11 = 0;
        while (i5 < length) {
            T t6 = values[i5];
            int i12 = i11 + 1;
            String strName = (String) kotlin.collections.c.E0(i11, names);
            if (strName == null) {
                strName = t6.name();
            }
            PluginGeneratedSerialDescriptor.addElement$default(enumDescriptor, strName, false, 2, null);
            Annotation[] annotationArr2 = (Annotation[]) kotlin.collections.c.E0(i11, entryAnnotations);
            if (annotationArr2 != null) {
                for (Annotation annotation2 : annotationArr2) {
                    enumDescriptor.pushAnnotation(annotation2);
                }
            }
            i5++;
            i11 = i12;
        }
        return new EnumSerializer(serialName, values, enumDescriptor);
    }

    @PublishedApi
    @NotNull
    public static final <T extends Enum<T>> KSerializer<T> createMarkedEnumSerializer(@NotNull String serialName, @NotNull T[] values, @NotNull String[] names, @NotNull Annotation[][] annotations) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(values, "values");
        Intrinsics.g(names, "names");
        Intrinsics.g(annotations, "annotations");
        EnumDescriptor enumDescriptor = new EnumDescriptor(serialName, values.length);
        int length = values.length;
        int i5 = 0;
        int i11 = 0;
        while (i5 < length) {
            T t6 = values[i5];
            int i12 = i11 + 1;
            String strName = (String) kotlin.collections.c.E0(i11, names);
            if (strName == null) {
                strName = t6.name();
            }
            PluginGeneratedSerialDescriptor.addElement$default(enumDescriptor, strName, false, 2, null);
            Annotation[] annotationArr = (Annotation[]) kotlin.collections.c.E0(i11, annotations);
            if (annotationArr != null) {
                for (Annotation annotation : annotationArr) {
                    enumDescriptor.pushAnnotation(annotation);
                }
            }
            i5++;
            i11 = i12;
        }
        return new EnumSerializer(serialName, values, enumDescriptor);
    }

    @PublishedApi
    @NotNull
    public static final <T extends Enum<T>> KSerializer<T> createSimpleEnumSerializer(@NotNull String serialName, @NotNull T[] values) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(values, "values");
        return new EnumSerializer(serialName, values);
    }
}
