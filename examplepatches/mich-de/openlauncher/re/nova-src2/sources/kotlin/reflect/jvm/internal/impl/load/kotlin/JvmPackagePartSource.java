package kotlin.reflect.jvm.internal.impl.load.kotlin;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.descriptors.SourceFile;
import kotlin.reflect.jvm.internal.impl.metadata.ProtoBuf;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.ProtoBufUtilKt;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.JvmProtoBuf;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization.JvmMetadataVersion;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.protobuf.GeneratedMessageLite;
import kotlin.reflect.jvm.internal.impl.resolve.jvm.JvmClassName;
import kotlin.reflect.jvm.internal.impl.serialization.deserialization.IncompatibleVersionErrorData;
import kotlin.reflect.jvm.internal.impl.serialization.deserialization.descriptors.DeserializedContainerAbiStability;
import kotlin.reflect.jvm.internal.impl.serialization.deserialization.descriptors.DeserializedContainerSource;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JvmPackagePartSource implements DeserializedContainerSource {

    @NotNull
    private final DeserializedContainerAbiStability abiStability;

    @NotNull
    private final JvmClassName className;

    @Nullable
    private final JvmClassName facadeClassName;

    @Nullable
    private final IncompatibleVersionErrorData<JvmMetadataVersion> incompatibility;
    private final boolean isPreReleaseInvisible;

    @Nullable
    private final KotlinJvmBinaryClass knownJvmBinaryClass;

    @NotNull
    private final String moduleName;

    public JvmPackagePartSource(@NotNull JvmClassName className, @Nullable JvmClassName jvmClassName, @NotNull ProtoBuf.Package packageProto, @NotNull NameResolver nameResolver, @Nullable IncompatibleVersionErrorData<JvmMetadataVersion> incompatibleVersionErrorData, boolean z11, @NotNull DeserializedContainerAbiStability abiStability, @Nullable KotlinJvmBinaryClass kotlinJvmBinaryClass) {
        String string;
        Intrinsics.g(className, "className");
        Intrinsics.g(packageProto, "packageProto");
        Intrinsics.g(nameResolver, "nameResolver");
        Intrinsics.g(abiStability, "abiStability");
        this.className = className;
        this.facadeClassName = jvmClassName;
        this.incompatibility = incompatibleVersionErrorData;
        this.isPreReleaseInvisible = z11;
        this.abiStability = abiStability;
        this.knownJvmBinaryClass = kotlinJvmBinaryClass;
        GeneratedMessageLite.GeneratedExtension<ProtoBuf.Package, Integer> packageModuleName = JvmProtoBuf.packageModuleName;
        Intrinsics.f(packageModuleName, "packageModuleName");
        Integer num = (Integer) ProtoBufUtilKt.getExtensionOrNull(packageProto, packageModuleName);
        this.moduleName = (num == null || (string = nameResolver.getString(num.intValue())) == null) ? "main" : string;
    }

    @NotNull
    public final ClassId getClassId() {
        return new ClassId(getClassName().getPackageFqName(), getSimpleName());
    }

    @NotNull
    public JvmClassName getClassName() {
        return this.className;
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.SourceElement
    @NotNull
    public SourceFile getContainingFile() {
        SourceFile NO_SOURCE_FILE = SourceFile.NO_SOURCE_FILE;
        Intrinsics.f(NO_SOURCE_FILE, "NO_SOURCE_FILE");
        return NO_SOURCE_FILE;
    }

    @Nullable
    public JvmClassName getFacadeClassName() {
        return this.facadeClassName;
    }

    @Nullable
    public final KotlinJvmBinaryClass getKnownJvmBinaryClass() {
        return this.knownJvmBinaryClass;
    }

    @Override // kotlin.reflect.jvm.internal.impl.serialization.deserialization.descriptors.DeserializedContainerSource
    @NotNull
    public String getPresentableString() {
        return "Class '" + getClassId().asSingleFqName().asString() + '\'';
    }

    @NotNull
    public final Name getSimpleName() {
        String internalName = getClassName().getInternalName();
        Intrinsics.f(internalName, "getInternalName(...)");
        Name nameIdentifier = Name.identifier(k.n1('/', internalName, internalName));
        Intrinsics.f(nameIdentifier, "identifier(...)");
        return nameIdentifier;
    }

    @NotNull
    public String toString() {
        return "JvmPackagePartSource: " + getClassName();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public JvmPackagePartSource(@NotNull KotlinJvmBinaryClass kotlinClass, @NotNull ProtoBuf.Package packageProto, @NotNull NameResolver nameResolver, @Nullable IncompatibleVersionErrorData<JvmMetadataVersion> incompatibleVersionErrorData, boolean z11, @NotNull DeserializedContainerAbiStability abiStability) {
        Intrinsics.g(kotlinClass, "kotlinClass");
        Intrinsics.g(packageProto, "packageProto");
        Intrinsics.g(nameResolver, "nameResolver");
        Intrinsics.g(abiStability, "abiStability");
        JvmClassName jvmClassNameByClassId = JvmClassName.byClassId(kotlinClass.getClassId());
        Intrinsics.f(jvmClassNameByClassId, "byClassId(...)");
        String multifileClassName = kotlinClass.getClassHeader().getMultifileClassName();
        JvmClassName jvmClassNameByInternalName = null;
        if (multifileClassName != null && multifileClassName.length() > 0) {
            jvmClassNameByInternalName = JvmClassName.byInternalName(multifileClassName);
        }
        this(jvmClassNameByClassId, jvmClassNameByInternalName, packageProto, nameResolver, incompatibleVersionErrorData, z11, abiStability, kotlinClass);
    }
}
