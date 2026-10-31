package kotlin.reflect.jvm.internal.impl.descriptors.runtime.components;

import java.io.InputStream;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.builtins.StandardNames;
import kotlin.reflect.jvm.internal.impl.load.java.structure.JavaClass;
import kotlin.reflect.jvm.internal.impl.load.kotlin.KotlinClassFinder;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization.JvmMetadataVersion;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.serialization.deserialization.builtins.BuiltInSerializerProtocol;
import kotlin.reflect.jvm.internal.impl.serialization.deserialization.builtins.BuiltInsResourceLoader;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ReflectKotlinClassFinder implements KotlinClassFinder {

    @NotNull
    private final BuiltInsResourceLoader builtInsResourceLoader;

    @NotNull
    private final ClassLoader classLoader;

    public ReflectKotlinClassFinder(@NotNull ClassLoader classLoader) {
        Intrinsics.g(classLoader, "classLoader");
        this.classLoader = classLoader;
        this.builtInsResourceLoader = new BuiltInsResourceLoader();
    }

    private final KotlinClassFinder.Result findKotlinClass(String str) {
        ReflectKotlinClass reflectKotlinClassCreate;
        Class<?> clsTryLoadClass = ReflectJavaClassFinderKt.tryLoadClass(this.classLoader, str);
        if (clsTryLoadClass == null || (reflectKotlinClassCreate = ReflectKotlinClass.Factory.create(clsTryLoadClass)) == null) {
            return null;
        }
        return new KotlinClassFinder.Result.KotlinClass(reflectKotlinClassCreate, null, 2, null);
    }

    @Override // kotlin.reflect.jvm.internal.impl.serialization.deserialization.KotlinMetadataFinder
    @Nullable
    public InputStream findBuiltInsData(@NotNull FqName packageFqName) {
        Intrinsics.g(packageFqName, "packageFqName");
        if (packageFqName.startsWith(StandardNames.BUILT_INS_PACKAGE_NAME)) {
            return this.builtInsResourceLoader.loadResource(BuiltInSerializerProtocol.INSTANCE.getBuiltInsFilePath(packageFqName));
        }
        return null;
    }

    @Override // kotlin.reflect.jvm.internal.impl.load.kotlin.KotlinClassFinder
    @Nullable
    public KotlinClassFinder.Result findKotlinClassOrContent(@NotNull ClassId classId, @NotNull JvmMetadataVersion jvmMetadataVersion) {
        Intrinsics.g(classId, "classId");
        Intrinsics.g(jvmMetadataVersion, "jvmMetadataVersion");
        return findKotlinClass(ReflectKotlinClassFinderKt.toRuntimeFqName(classId));
    }

    @Override // kotlin.reflect.jvm.internal.impl.load.kotlin.KotlinClassFinder
    @Nullable
    public KotlinClassFinder.Result findKotlinClassOrContent(@NotNull JavaClass javaClass, @NotNull JvmMetadataVersion jvmMetadataVersion) {
        String strAsString;
        Intrinsics.g(javaClass, "javaClass");
        Intrinsics.g(jvmMetadataVersion, "jvmMetadataVersion");
        FqName fqName = javaClass.getFqName();
        if (fqName == null || (strAsString = fqName.asString()) == null) {
            return null;
        }
        return findKotlinClass(strAsString);
    }
}
