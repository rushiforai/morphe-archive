package kotlin.reflect.jvm.internal.impl.load.kotlin;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.NotFoundClasses;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization.JvmMetadataVersion;
import kotlin.reflect.jvm.internal.impl.storage.StorageManager;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class BinaryClassAnnotationAndConstantLoaderImplKt {
    @NotNull
    public static final BinaryClassAnnotationAndConstantLoaderImpl createBinaryClassAnnotationAndConstantLoader(@NotNull ModuleDescriptor module, @NotNull NotFoundClasses notFoundClasses, @NotNull StorageManager storageManager, @NotNull KotlinClassFinder kotlinClassFinder, @NotNull JvmMetadataVersion jvmMetadataVersion) {
        Intrinsics.g(module, "module");
        Intrinsics.g(notFoundClasses, "notFoundClasses");
        Intrinsics.g(storageManager, "storageManager");
        Intrinsics.g(kotlinClassFinder, "kotlinClassFinder");
        Intrinsics.g(jvmMetadataVersion, "jvmMetadataVersion");
        BinaryClassAnnotationAndConstantLoaderImpl binaryClassAnnotationAndConstantLoaderImpl = new BinaryClassAnnotationAndConstantLoaderImpl(module, notFoundClasses, storageManager, kotlinClassFinder);
        binaryClassAnnotationAndConstantLoaderImpl.setJvmMetadataVersion(jvmMetadataVersion);
        return binaryClassAnnotationAndConstantLoaderImpl;
    }
}
