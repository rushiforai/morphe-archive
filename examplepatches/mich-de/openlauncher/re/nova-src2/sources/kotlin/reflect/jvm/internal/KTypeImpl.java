package kotlin.reflect.jvm.internal;

import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.List;
import kotlin.Metadata;
import kotlin.NotImplementedError;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.KTypeBase;
import kotlin.jvm.internal.PropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClassifier;
import kotlin.reflect.KProperty;
import kotlin.reflect.KTypeProjection;
import kotlin.reflect.jvm.KTypesJvm;
import kotlin.reflect.jvm.internal.ReflectProperties;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassifierDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeAliasDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure.ReflectClassUtilKt;
import kotlin.reflect.jvm.internal.impl.types.FlexibleTypesKt;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.TypeProjection;
import kotlin.reflect.jvm.internal.impl.types.TypeUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0002\u0010\u0007J\u0012\u0010 \u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0002\u001a\u00020\u0003H\u0002J\u0013\u0010!\u001a\u00020\u00192\b\u0010\"\u001a\u0004\u0018\u00010#H\u0096\u0002J\b\u0010$\u001a\u00020%H\u0016J\u0015\u0010&\u001a\u00020\u00002\u0006\u0010'\u001a\u00020\u0019H\u0000¢\u0006\u0002\b(J\b\u0010)\u001a\u00020*H\u0016R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\fR!\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\t8VX\u0096\u0084\u0002¢\u0006\f\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u000f\u0010\fR\u001d\u0010\u0012\u001a\u0004\u0018\u00010\u00138VX\u0096\u0084\u0002¢\u0006\f\n\u0004\b\u0016\u0010\u0011\u001a\u0004\b\u0014\u0010\u0015R\u0016\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0018\u001a\u00020\u00198VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u001aR\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00068VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006+²\u0006\u0010\u0010,\u001a\b\u0012\u0004\u0012\u00020\u00060\tX\u008a\u0084\u0002"}, d2 = {"Lkotlin/reflect/jvm/internal/KTypeImpl;", "Lkotlin/jvm/internal/KTypeBase;", TTConst.TRACK_TYPE, "Lkotlin/reflect/jvm/internal/impl/types/KotlinType;", "computeJavaType", "Lkotlin/Function0;", "Ljava/lang/reflect/Type;", "(Lorg/jetbrains/kotlin/types/KotlinType;Lkotlin/jvm/functions/Function0;)V", "annotations", b.f42142b, b.f42142b, "getAnnotations", "()Ljava/util/List;", "arguments", "Lkotlin/reflect/KTypeProjection;", "getArguments", "arguments$delegate", "Lkotlin/reflect/jvm/internal/ReflectProperties$LazySoftVal;", "classifier", "Lkotlin/reflect/KClassifier;", "getClassifier", "()Lkotlin/reflect/KClassifier;", "classifier$delegate", "Lkotlin/reflect/jvm/internal/ReflectProperties$LazySoftVal;", "isMarkedNullable", b.f42142b, "()Z", "javaType", "getJavaType", "()Ljava/lang/reflect/Type;", "getType", "()Lorg/jetbrains/kotlin/types/KotlinType;", "convert", "equals", InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "makeNullableAsSpecified", "nullable", "makeNullableAsSpecified$kotlin_reflection", "toString", b.f42142b, "kotlin-reflection", "parameterizedTypeArguments"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class KTypeImpl implements KTypeBase {
    static final /* synthetic */ KProperty<Object>[] $$delegatedProperties;

    /* renamed from: arguments$delegate, reason: from kotlin metadata */
    @NotNull
    private final ReflectProperties.LazySoftVal arguments;

    /* renamed from: classifier$delegate, reason: from kotlin metadata */
    @NotNull
    private final ReflectProperties.LazySoftVal classifier;

    @Nullable
    private final ReflectProperties.LazySoftVal<Type> computeJavaType;

    @NotNull
    private final KotlinType type;

    static {
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        $$delegatedProperties = new KProperty[]{reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(KTypeImpl.class), "classifier", "getClassifier()Lkotlin/reflect/KClassifier;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(KTypeImpl.class), "arguments", "getArguments()Ljava/util/List;"))};
    }

    public KTypeImpl(@NotNull KotlinType type, @Nullable Function0<? extends Type> function0) {
        Intrinsics.g(type, "type");
        this.type = type;
        ReflectProperties.LazySoftVal<Type> lazySoftValLazySoft = null;
        ReflectProperties.LazySoftVal<Type> lazySoftVal = function0 instanceof ReflectProperties.LazySoftVal ? (ReflectProperties.LazySoftVal) function0 : null;
        if (lazySoftVal != null) {
            lazySoftValLazySoft = lazySoftVal;
        } else if (function0 != null) {
            lazySoftValLazySoft = ReflectProperties.lazySoft(function0);
        }
        this.computeJavaType = lazySoftValLazySoft;
        this.classifier = ReflectProperties.lazySoft(new Function0<KClassifier>() { // from class: kotlin.reflect.jvm.internal.KTypeImpl$classifier$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @Nullable
            public final KClassifier invoke() {
                KTypeImpl kTypeImpl = this.this$0;
                return kTypeImpl.convert(kTypeImpl.getType());
            }
        });
        this.arguments = ReflectProperties.lazySoft(new KTypeImpl$arguments$2(this, function0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final KClassifier convert(KotlinType type) {
        KotlinType type2;
        ClassifierDescriptor classifierDescriptorMo357getDeclarationDescriptor = type.getConstructor().mo357getDeclarationDescriptor();
        if (!(classifierDescriptorMo357getDeclarationDescriptor instanceof ClassDescriptor)) {
            if (classifierDescriptorMo357getDeclarationDescriptor instanceof TypeParameterDescriptor) {
                return new KTypeParameterImpl(null, (TypeParameterDescriptor) classifierDescriptorMo357getDeclarationDescriptor);
            }
            if (classifierDescriptorMo357getDeclarationDescriptor instanceof TypeAliasDescriptor) {
                throw new NotImplementedError("An operation is not implemented: Type alias classifiers are not yet supported");
            }
            return null;
        }
        Class<?> javaClass = UtilKt.toJavaClass((ClassDescriptor) classifierDescriptorMo357getDeclarationDescriptor);
        if (javaClass == null) {
            return null;
        }
        if (!javaClass.isArray()) {
            if (TypeUtils.isNullableType(type)) {
                return new KClassImpl(javaClass);
            }
            Class<?> primitiveByWrapper = ReflectClassUtilKt.getPrimitiveByWrapper(javaClass);
            if (primitiveByWrapper != null) {
                javaClass = primitiveByWrapper;
            }
            return new KClassImpl(javaClass);
        }
        TypeProjection typeProjection = (TypeProjection) g.A1(type.getArguments());
        if (typeProjection == null || (type2 = typeProjection.getType()) == null) {
            return new KClassImpl(javaClass);
        }
        KClassifier kClassifierConvert = convert(type2);
        if (kClassifierConvert != null) {
            return new KClassImpl(UtilKt.createArrayType(JvmClassMappingKt.b(KTypesJvm.getJvmErasure(kClassifierConvert))));
        }
        throw new KotlinReflectionInternalError("Cannot determine classifier for array element type: " + this);
    }

    public boolean equals(@Nullable Object other) {
        if (!(other instanceof KTypeImpl)) {
            return false;
        }
        KTypeImpl kTypeImpl = (KTypeImpl) other;
        return Intrinsics.b(this.type, kTypeImpl.type) && Intrinsics.b(getF71875a(), kTypeImpl.getF71875a()) && Intrinsics.b(getF71876b(), kTypeImpl.getF71876b());
    }

    @Override // kotlin.reflect.KAnnotatedElement
    @NotNull
    public List<Annotation> getAnnotations() {
        return UtilKt.computeAnnotations(this.type);
    }

    @Override // kotlin.reflect.KType
    @NotNull
    /* renamed from: getArguments */
    public List<KTypeProjection> getF71876b() {
        T value = this.arguments.getValue(this, $$delegatedProperties[1]);
        Intrinsics.f(value, "getValue(...)");
        return (List) value;
    }

    @Override // kotlin.reflect.KType
    @Nullable
    /* renamed from: getClassifier */
    public KClassifier getF71875a() {
        return (KClassifier) this.classifier.getValue(this, $$delegatedProperties[0]);
    }

    @Override // kotlin.jvm.internal.KTypeBase
    @Nullable
    public Type getJavaType() {
        ReflectProperties.LazySoftVal<Type> lazySoftVal = this.computeJavaType;
        if (lazySoftVal != null) {
            return lazySoftVal.invoke();
        }
        return null;
    }

    @NotNull
    public final KotlinType getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        KClassifier f71875a = getF71875a();
        return getF71876b().hashCode() + ((iHashCode + (f71875a != null ? f71875a.hashCode() : 0)) * 31);
    }

    @Override // kotlin.reflect.KType
    public boolean isMarkedNullable() {
        return this.type.isMarkedNullable();
    }

    @NotNull
    public final KTypeImpl makeNullableAsSpecified$kotlin_reflection(boolean nullable) {
        if (!FlexibleTypesKt.isFlexible(this.type) && isMarkedNullable() == nullable) {
            return this;
        }
        KotlinType kotlinTypeMakeNullableAsSpecified = TypeUtils.makeNullableAsSpecified(this.type, nullable);
        Intrinsics.f(kotlinTypeMakeNullableAsSpecified, "makeNullableAsSpecified(...)");
        return new KTypeImpl(kotlinTypeMakeNullableAsSpecified, this.computeJavaType);
    }

    @NotNull
    public String toString() {
        return ReflectionObjectRenderer.INSTANCE.renderType(this.type);
    }

    public /* synthetic */ KTypeImpl(KotlinType kotlinType, Function0 function0, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(kotlinType, (i5 & 2) != 0 ? null : function0);
    }
}
