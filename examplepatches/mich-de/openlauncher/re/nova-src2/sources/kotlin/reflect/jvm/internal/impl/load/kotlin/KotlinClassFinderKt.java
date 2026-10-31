package kotlin.reflect.jvm.internal.impl.load.kotlin;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.load.java.structure.JavaClass;
import kotlin.reflect.jvm.internal.impl.load.kotlin.KotlinClassFinder;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization.JvmMetadataVersion;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class KotlinClassFinderKt {
    @Nullable
    public static final KotlinJvmBinaryClass findKotlinClass(@NotNull KotlinClassFinder kotlinClassFinder, @NotNull ClassId classId, @NotNull JvmMetadataVersion jvmMetadataVersion) {
        Intrinsics.g(kotlinClassFinder, "<this>");
        Intrinsics.g(classId, "classId");
        Intrinsics.g(jvmMetadataVersion, "jvmMetadataVersion");
        KotlinClassFinder.Result resultFindKotlinClassOrContent = kotlinClassFinder.findKotlinClassOrContent(classId, jvmMetadataVersion);
        if (resultFindKotlinClassOrContent != null) {
            return resultFindKotlinClassOrContent.toKotlinJvmBinaryClass();
        }
        return null;
    }

    @Nullable
    public static final KotlinJvmBinaryClass findKotlinClass(@NotNull KotlinClassFinder kotlinClassFinder, @NotNull JavaClass javaClass, @NotNull JvmMetadataVersion jvmMetadataVersion) {
        Intrinsics.g(kotlinClassFinder, "<this>");
        Intrinsics.g(javaClass, "javaClass");
        Intrinsics.g(jvmMetadataVersion, "jvmMetadataVersion");
        KotlinClassFinder.Result resultFindKotlinClassOrContent = kotlinClassFinder.findKotlinClassOrContent(javaClass, jvmMetadataVersion);
        if (resultFindKotlinClassOrContent != null) {
            return resultFindKotlinClassOrContent.toKotlinJvmBinaryClass();
        }
        return null;
    }
}
