package kotlin.reflect.jvm.internal.impl.types;

import com.tiktok.util.TTConst;
import fq.c;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function1;
import kotlin.reflect.jvm.internal.impl.builtins.KotlinBuiltIns;
import kotlin.reflect.jvm.internal.impl.builtins.StandardNames;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.Annotations;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.CompositeAnnotations;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.FilteredAnnotations;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.resolve.calls.inference.CapturedTypeConstructorKt;
import kotlin.reflect.jvm.internal.impl.types.checker.NewCapturedTypeConstructor;
import kotlin.reflect.jvm.internal.impl.types.error.ErrorType;
import kotlin.reflect.jvm.internal.impl.types.error.ErrorTypeKind;
import kotlin.reflect.jvm.internal.impl.types.error.ErrorUtils;
import kotlin.reflect.jvm.internal.impl.types.typeUtil.TypeUtilsKt;
import kotlin.reflect.jvm.internal.impl.types.typesApproximation.CapturedTypeApproximationKt;
import kotlin.reflect.jvm.internal.impl.utils.ExceptionUtilsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public class TypeSubstitutor {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final TypeSubstitutor EMPTY = create(TypeSubstitution.EMPTY);

    @NotNull
    private final TypeSubstitution substitution;

    /* renamed from: kotlin.reflect.jvm.internal.impl.types.TypeSubstitutor$2, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$org$jetbrains$kotlin$types$TypeSubstitutor$VarianceConflictType;

        static {
            int[] iArr = new int[VarianceConflictType.values().length];
            $SwitchMap$org$jetbrains$kotlin$types$TypeSubstitutor$VarianceConflictType = iArr;
            try {
                iArr[VarianceConflictType.OUT_IN_IN_POSITION.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$org$jetbrains$kotlin$types$TypeSubstitutor$VarianceConflictType[VarianceConflictType.IN_IN_OUT_POSITION.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$org$jetbrains$kotlin$types$TypeSubstitutor$VarianceConflictType[VarianceConflictType.NO_CONFLICT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public static final class SubstitutionException extends Exception {
        public SubstitutionException(String str) {
            super(str);
        }
    }

    public enum VarianceConflictType {
        NO_CONFLICT,
        IN_IN_OUT_POSITION,
        OUT_IN_IN_POSITION
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0021 A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x003b A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00b8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static /* synthetic */ void $$$reportNull$$$0(int i5) {
        String str;
        int i11;
        if (i5 != 1 && i5 != 2 && i5 != 8 && i5 != 34 && i5 != 37) {
            switch (i5) {
                default:
                    switch (i5) {
                        default:
                            switch (i5) {
                                default:
                                    switch (i5) {
                                        case 40:
                                        case 41:
                                        case 42:
                                            break;
                                        default:
                                            str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                                            break;
                                    }
                                case 29:
                                case 30:
                                case 31:
                                case 32:
                                    break;
                            }
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                            break;
                    }
                case 11:
                case 12:
                case 13:
                    break;
            }
        } else {
            str = "@NotNull method %s.%s must not return null";
        }
        if (i5 != 1 && i5 != 2 && i5 != 8 && i5 != 34 && i5 != 37) {
            switch (i5) {
                default:
                    switch (i5) {
                        default:
                            switch (i5) {
                                default:
                                    switch (i5) {
                                        case 40:
                                        case 41:
                                        case 42:
                                            break;
                                        default:
                                            i11 = 3;
                                            break;
                                    }
                                case 29:
                                case 30:
                                case 31:
                                case 32:
                                    break;
                            }
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                            break;
                    }
                case 11:
                case 12:
                case 13:
                    break;
            }
        } else {
            i11 = 2;
        }
        Object[] objArr = new Object[i11];
        switch (i5) {
            case 1:
            case 2:
            case 8:
            case 11:
            case 12:
            case 13:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 29:
            case 30:
            case 31:
            case 32:
            case 34:
            case 37:
            case 40:
            case 41:
            case 42:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/types/TypeSubstitutor";
                break;
            case 3:
                objArr[0] = "first";
                break;
            case 4:
                objArr[0] = "second";
                break;
            case 5:
                objArr[0] = "substitutionContext";
                break;
            case 6:
                objArr[0] = "context";
                break;
            case 7:
            default:
                objArr[0] = "substitution";
                break;
            case 9:
            case 14:
                objArr[0] = TTConst.TRACK_TYPE;
                break;
            case 10:
            case 15:
                objArr[0] = "howThisTypeIsUsed";
                break;
            case 16:
            case 17:
            case 36:
                objArr[0] = "typeProjection";
                break;
            case 18:
            case 28:
                objArr[0] = "originalProjection";
                break;
            case 26:
                objArr[0] = "originalType";
                break;
            case 27:
                objArr[0] = "substituted";
                break;
            case 33:
                objArr[0] = "annotations";
                break;
            case 35:
            case 38:
                objArr[0] = "typeParameterVariance";
                break;
            case 39:
                objArr[0] = "projectionKind";
                break;
        }
        if (i5 == 1) {
            objArr[1] = "replaceWithNonApproximatingSubstitution";
        } else if (i5 == 2) {
            objArr[1] = "replaceWithContravariantApproximatingSubstitution";
        } else if (i5 == 8) {
            objArr[1] = "getSubstitution";
        } else if (i5 == 34) {
            objArr[1] = "filterOutUnsafeVariance";
        } else if (i5 != 37) {
            switch (i5) {
                case 11:
                case 12:
                case 13:
                    objArr[1] = "safeSubstitute";
                    break;
                default:
                    switch (i5) {
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                            objArr[1] = "unsafeSubstitute";
                            break;
                        default:
                            switch (i5) {
                                case 29:
                                case 30:
                                case 31:
                                case 32:
                                    objArr[1] = "projectedTypeForConflictedTypeWithUnsafeVariance";
                                    break;
                                default:
                                    switch (i5) {
                                        case 40:
                                        case 41:
                                        case 42:
                                            objArr[1] = "combine";
                                            break;
                                        default:
                                            objArr[1] = "kotlin/reflect/jvm/internal/impl/types/TypeSubstitutor";
                                            break;
                                    }
                            }
                    }
            }
        }
        switch (i5) {
            case 1:
            case 2:
            case 8:
            case 11:
            case 12:
            case 13:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 29:
            case 30:
            case 31:
            case 32:
            case 34:
            case 37:
            case 40:
            case 41:
            case 42:
                break;
            case 3:
            case 4:
                objArr[2] = "createChainedSubstitutor";
                break;
            case 5:
            case 6:
            default:
                objArr[2] = "create";
                break;
            case 7:
                objArr[2] = "<init>";
                break;
            case 9:
            case 10:
                objArr[2] = "safeSubstitute";
                break;
            case 14:
            case 15:
            case 16:
                objArr[2] = "substitute";
                break;
            case 17:
                objArr[2] = "substituteWithoutApproximation";
                break;
            case 18:
                objArr[2] = "unsafeSubstitute";
                break;
            case 26:
            case 27:
            case 28:
                objArr[2] = "projectedTypeForConflictedTypeWithUnsafeVariance";
                break;
            case 33:
                objArr[2] = "filterOutUnsafeVariance";
                break;
            case 35:
            case 36:
            case 38:
            case 39:
                objArr[2] = "combine";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i5 != 1 && i5 != 2 && i5 != 8 && i5 != 34 && i5 != 37) {
            switch (i5) {
                case 11:
                case 12:
                case 13:
                    break;
                default:
                    switch (i5) {
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                            break;
                        default:
                            switch (i5) {
                                case 29:
                                case 30:
                                case 31:
                                case 32:
                                    break;
                                default:
                                    switch (i5) {
                                        case 40:
                                        case 41:
                                        case 42:
                                            break;
                                        default:
                                            throw new IllegalArgumentException(str2);
                                    }
                            }
                    }
            }
        }
        throw new IllegalStateException(str2);
    }

    public TypeSubstitutor(@NotNull TypeSubstitution typeSubstitution) {
        if (typeSubstitution == null) {
            $$$reportNull$$$0(7);
        }
        this.substitution = typeSubstitution;
    }

    private static void assertRecursionDepth(int i5, TypeProjection typeProjection, TypeSubstitution typeSubstitution) {
        if (i5 <= 100) {
            return;
        }
        throw new IllegalStateException("Recursion too deep. Most likely infinite loop while substituting " + safeToString(typeProjection) + "; substitution: " + safeToString(typeSubstitution));
    }

    @NotNull
    public static Variance combine(@NotNull Variance variance, @NotNull TypeProjection typeProjection) {
        if (variance == null) {
            $$$reportNull$$$0(35);
        }
        if (typeProjection == null) {
            $$$reportNull$$$0(36);
        }
        if (!typeProjection.isStarProjection()) {
            return combine(variance, typeProjection.getProjectionKind());
        }
        Variance variance2 = Variance.OUT_VARIANCE;
        if (variance2 == null) {
            $$$reportNull$$$0(37);
        }
        return variance2;
    }

    private static VarianceConflictType conflictType(Variance variance, Variance variance2) {
        Variance variance3 = Variance.IN_VARIANCE;
        return (variance == variance3 && variance2 == Variance.OUT_VARIANCE) ? VarianceConflictType.OUT_IN_IN_POSITION : (variance == Variance.OUT_VARIANCE && variance2 == variance3) ? VarianceConflictType.IN_IN_OUT_POSITION : VarianceConflictType.NO_CONFLICT;
    }

    @NotNull
    public static TypeSubstitutor create(@NotNull TypeSubstitution typeSubstitution) {
        if (typeSubstitution == null) {
            $$$reportNull$$$0(0);
        }
        return new TypeSubstitutor(typeSubstitution);
    }

    @NotNull
    public static TypeSubstitutor createChainedSubstitutor(@NotNull TypeSubstitution typeSubstitution, @NotNull TypeSubstitution typeSubstitution2) {
        if (typeSubstitution == null) {
            $$$reportNull$$$0(3);
        }
        if (typeSubstitution2 == null) {
            $$$reportNull$$$0(4);
        }
        return create(DisjointKeysUnionTypeSubstitution.create(typeSubstitution, typeSubstitution2));
    }

    @NotNull
    private static Annotations filterOutUnsafeVariance(@NotNull Annotations annotations) {
        if (annotations == null) {
            $$$reportNull$$$0(33);
        }
        return !annotations.hasAnnotation(StandardNames.FqNames.unsafeVariance) ? annotations : new FilteredAnnotations(annotations, new Function1<FqName, Boolean>() { // from class: kotlin.reflect.jvm.internal.impl.types.TypeSubstitutor.1
            private static /* synthetic */ void $$$reportNull$$$0(int i5) {
                throw new IllegalArgumentException("Argument for @NotNull parameter 'name' of kotlin/reflect/jvm/internal/impl/types/TypeSubstitutor$1.invoke must not be null");
            }

            @Override // kotlin.jvm.functions.Function1
            public Boolean invoke(@NotNull FqName fqName) {
                if (fqName == null) {
                    $$$reportNull$$$0(0);
                }
                return Boolean.valueOf(!fqName.equals(StandardNames.FqNames.unsafeVariance));
            }
        });
    }

    @NotNull
    private static TypeProjection projectedTypeForConflictedTypeWithUnsafeVariance(@NotNull KotlinType kotlinType, @NotNull TypeProjection typeProjection, @Nullable TypeParameterDescriptor typeParameterDescriptor, @NotNull TypeProjection typeProjection2) {
        if (kotlinType == null) {
            $$$reportNull$$$0(26);
        }
        if (typeProjection == null) {
            $$$reportNull$$$0(27);
        }
        if (typeProjection2 == null) {
            $$$reportNull$$$0(28);
        }
        if (!kotlinType.getAnnotations().hasAnnotation(StandardNames.FqNames.unsafeVariance)) {
            if (typeProjection == null) {
                $$$reportNull$$$0(29);
            }
            return typeProjection;
        }
        TypeConstructor constructor = typeProjection.getType().getConstructor();
        if (!(constructor instanceof NewCapturedTypeConstructor)) {
            return typeProjection;
        }
        TypeProjection projection = ((NewCapturedTypeConstructor) constructor).getProjection();
        Variance projectionKind = projection.getProjectionKind();
        VarianceConflictType varianceConflictTypeConflictType = conflictType(typeProjection2.getProjectionKind(), projectionKind);
        VarianceConflictType varianceConflictType = VarianceConflictType.OUT_IN_IN_POSITION;
        return varianceConflictTypeConflictType == varianceConflictType ? new TypeProjectionImpl(projection.getType()) : (typeParameterDescriptor != null && conflictType(typeParameterDescriptor.getVariance(), projectionKind) == varianceConflictType) ? new TypeProjectionImpl(projection.getType()) : typeProjection;
    }

    private static String safeToString(Object obj) {
        try {
            return obj.toString();
        } catch (Throwable th2) {
            if (ExceptionUtilsKt.isProcessCanceledException(th2)) {
                throw th2;
            }
            return c.d("[Exception while computing toString(): ", "]", th2);
        }
    }

    private TypeProjection substituteCompoundType(TypeProjection typeProjection, int i5) throws SubstitutionException {
        KotlinType type = typeProjection.getType();
        Variance projectionKind = typeProjection.getProjectionKind();
        if (type.getConstructor().mo357getDeclarationDescriptor() instanceof TypeParameterDescriptor) {
            return typeProjection;
        }
        SimpleType abbreviation = SpecialTypesKt.getAbbreviation(type);
        KotlinType kotlinTypeSubstitute = abbreviation != null ? replaceWithNonApproximatingSubstitution().substitute(abbreviation, Variance.INVARIANT) : null;
        KotlinType kotlinTypeReplace = TypeSubstitutionKt.replace(type, substituteTypeArguments(type.getConstructor().getParameters(), type.getArguments(), i5), this.substitution.filterAnnotations(type.getAnnotations()));
        if ((kotlinTypeReplace instanceof SimpleType) && (kotlinTypeSubstitute instanceof SimpleType)) {
            kotlinTypeReplace = SpecialTypesKt.withAbbreviation((SimpleType) kotlinTypeReplace, (SimpleType) kotlinTypeSubstitute);
        }
        return new TypeProjectionImpl(projectionKind, kotlinTypeReplace);
    }

    private List<TypeProjection> substituteTypeArguments(List<TypeParameterDescriptor> list, List<TypeProjection> list2, int i5) throws SubstitutionException {
        ArrayList arrayList = new ArrayList(list.size());
        boolean z11 = false;
        for (int i11 = 0; i11 < list.size(); i11++) {
            TypeParameterDescriptor typeParameterDescriptor = list.get(i11);
            TypeProjection typeProjection = list2.get(i11);
            TypeProjection typeProjectionUnsafeSubstitute = unsafeSubstitute(typeProjection, typeParameterDescriptor, i5 + 1);
            int i12 = AnonymousClass2.$SwitchMap$org$jetbrains$kotlin$types$TypeSubstitutor$VarianceConflictType[conflictType(typeParameterDescriptor.getVariance(), typeProjectionUnsafeSubstitute.getProjectionKind()).ordinal()];
            if (i12 == 1 || i12 == 2) {
                typeProjectionUnsafeSubstitute = TypeUtils.makeStarProjection(typeParameterDescriptor);
            } else if (i12 == 3) {
                Variance variance = typeParameterDescriptor.getVariance();
                Variance variance2 = Variance.INVARIANT;
                if (variance != variance2 && !typeProjectionUnsafeSubstitute.isStarProjection()) {
                    typeProjectionUnsafeSubstitute = new TypeProjectionImpl(variance2, typeProjectionUnsafeSubstitute.getType());
                }
            }
            if (typeProjectionUnsafeSubstitute != typeProjection) {
                z11 = true;
            }
            arrayList.add(typeProjectionUnsafeSubstitute);
        }
        return !z11 ? list2 : arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    private TypeProjection unsafeSubstitute(@NotNull TypeProjection typeProjection, @Nullable TypeParameterDescriptor typeParameterDescriptor, int i5) throws SubstitutionException {
        if (typeProjection == null) {
            $$$reportNull$$$0(18);
        }
        assertRecursionDepth(i5, typeProjection, this.substitution);
        if (!typeProjection.isStarProjection()) {
            KotlinType type = typeProjection.getType();
            if (type instanceof TypeWithEnhancement) {
                TypeWithEnhancement typeWithEnhancement = (TypeWithEnhancement) type;
                UnwrappedType origin = typeWithEnhancement.getOrigin();
                KotlinType enhancement = typeWithEnhancement.getEnhancement();
                TypeProjection typeProjectionUnsafeSubstitute = unsafeSubstitute(new TypeProjectionImpl(typeProjection.getProjectionKind(), origin), typeParameterDescriptor, i5 + 1);
                return typeProjectionUnsafeSubstitute.isStarProjection() ? typeProjectionUnsafeSubstitute : new TypeProjectionImpl(typeProjectionUnsafeSubstitute.getProjectionKind(), TypeWithEnhancementKt.wrapEnhancement(typeProjectionUnsafeSubstitute.getType().unwrap(), substitute(enhancement, typeProjection.getProjectionKind())));
            }
            if (!DynamicTypesKt.isDynamic(type) && !(type.unwrap() instanceof RawType)) {
                TypeProjection typeProjectionMo362get = this.substitution.mo362get(type);
                TypeProjection typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance = typeProjectionMo362get != null ? projectedTypeForConflictedTypeWithUnsafeVariance(type, typeProjectionMo362get, typeParameterDescriptor, typeProjection) : null;
                Variance projectionKind = typeProjection.getProjectionKind();
                if (typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance == null && FlexibleTypesKt.isFlexible(type) && !TypeCapabilitiesKt.isCustomTypeParameter(type)) {
                    FlexibleType flexibleTypeAsFlexibleType = FlexibleTypesKt.asFlexibleType(type);
                    int i11 = i5 + 1;
                    TypeProjection typeProjectionUnsafeSubstitute2 = unsafeSubstitute(new TypeProjectionImpl(projectionKind, flexibleTypeAsFlexibleType.getLowerBound()), typeParameterDescriptor, i11);
                    TypeProjection typeProjectionUnsafeSubstitute3 = unsafeSubstitute(new TypeProjectionImpl(projectionKind, flexibleTypeAsFlexibleType.getUpperBound()), typeParameterDescriptor, i11);
                    Variance projectionKind2 = typeProjectionUnsafeSubstitute2.getProjectionKind();
                    if (typeProjectionUnsafeSubstitute2.getType() != flexibleTypeAsFlexibleType.getLowerBound() || typeProjectionUnsafeSubstitute3.getType() != flexibleTypeAsFlexibleType.getUpperBound()) {
                        return new TypeProjectionImpl(projectionKind2, KotlinTypeFactory.flexibleType(TypeSubstitutionKt.asSimpleType(typeProjectionUnsafeSubstitute2.getType()), TypeSubstitutionKt.asSimpleType(typeProjectionUnsafeSubstitute3.getType())));
                    }
                } else if (!KotlinBuiltIns.isNothing(type) && !KotlinTypeKt.isError(type)) {
                    if (typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance != null) {
                        VarianceConflictType varianceConflictTypeConflictType = conflictType(projectionKind, typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance.getProjectionKind());
                        if (!CapturedTypeConstructorKt.isCaptured(type)) {
                            int i12 = AnonymousClass2.$SwitchMap$org$jetbrains$kotlin$types$TypeSubstitutor$VarianceConflictType[varianceConflictTypeConflictType.ordinal()];
                            if (i12 == 1) {
                                throw new SubstitutionException("Out-projection in in-position");
                            }
                            if (i12 == 2) {
                                return new TypeProjectionImpl(Variance.OUT_VARIANCE, type.getConstructor().getBuiltIns().getNullableAnyType());
                            }
                        }
                        CustomTypeParameter customTypeParameter = TypeCapabilitiesKt.getCustomTypeParameter(type);
                        if (typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance.isStarProjection()) {
                            return typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance;
                        }
                        KotlinType kotlinTypeSubstitutionResult = customTypeParameter != null ? customTypeParameter.substitutionResult(typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance.getType()) : TypeUtils.makeNullableIfNeeded(typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance.getType(), type.isMarkedNullable());
                        if (!type.getAnnotations().isEmpty()) {
                            kotlinTypeSubstitutionResult = TypeUtilsKt.replaceAnnotations(kotlinTypeSubstitutionResult, new CompositeAnnotations(kotlinTypeSubstitutionResult.getAnnotations(), filterOutUnsafeVariance(this.substitution.filterAnnotations(type.getAnnotations()))));
                        }
                        if (varianceConflictTypeConflictType == VarianceConflictType.NO_CONFLICT) {
                            projectionKind = combine(projectionKind, typeProjectionProjectedTypeForConflictedTypeWithUnsafeVariance.getProjectionKind());
                        }
                        return new TypeProjectionImpl(projectionKind, kotlinTypeSubstitutionResult);
                    }
                    typeProjection = substituteCompoundType(typeProjection, i5);
                    if (typeProjection == null) {
                        $$$reportNull$$$0(25);
                    }
                }
            }
        }
        return typeProjection;
    }

    @NotNull
    public TypeSubstitution getSubstitution() {
        TypeSubstitution typeSubstitution = this.substitution;
        if (typeSubstitution == null) {
            $$$reportNull$$$0(8);
        }
        return typeSubstitution;
    }

    public boolean isEmpty() {
        return this.substitution.isEmpty();
    }

    @NotNull
    public TypeSubstitutor replaceWithNonApproximatingSubstitution() {
        TypeSubstitution typeSubstitution = this.substitution;
        return ((typeSubstitution instanceof IndexedParametersSubstitution) && typeSubstitution.approximateContravariantCapturedTypes()) ? new TypeSubstitutor(new IndexedParametersSubstitution(((IndexedParametersSubstitution) this.substitution).getParameters(), ((IndexedParametersSubstitution) this.substitution).getArguments(), false)) : this;
    }

    @NotNull
    public KotlinType safeSubstitute(@NotNull KotlinType kotlinType, @NotNull Variance variance) {
        if (kotlinType == null) {
            $$$reportNull$$$0(9);
        }
        if (variance == null) {
            $$$reportNull$$$0(10);
        }
        if (isEmpty()) {
            if (kotlinType == null) {
                $$$reportNull$$$0(11);
            }
            return kotlinType;
        }
        try {
            KotlinType type = unsafeSubstitute(new TypeProjectionImpl(variance, kotlinType), null, 0).getType();
            if (type == null) {
                $$$reportNull$$$0(12);
            }
            return type;
        } catch (SubstitutionException e3) {
            ErrorType errorTypeCreateErrorType = ErrorUtils.createErrorType(ErrorTypeKind.UNABLE_TO_SUBSTITUTE_TYPE, e3.getMessage());
            if (errorTypeCreateErrorType == null) {
                $$$reportNull$$$0(13);
            }
            return errorTypeCreateErrorType;
        }
    }

    @Nullable
    public KotlinType substitute(@NotNull KotlinType kotlinType, @NotNull Variance variance) {
        if (kotlinType == null) {
            $$$reportNull$$$0(14);
        }
        if (variance == null) {
            $$$reportNull$$$0(15);
        }
        TypeProjection typeProjectionSubstitute = substitute(new TypeProjectionImpl(variance, getSubstitution().prepareTopLevelType(kotlinType, variance)));
        if (typeProjectionSubstitute == null) {
            return null;
        }
        return typeProjectionSubstitute.getType();
    }

    @Nullable
    public TypeProjection substituteWithoutApproximation(@NotNull TypeProjection typeProjection) {
        if (typeProjection == null) {
            $$$reportNull$$$0(17);
        }
        if (isEmpty()) {
            return typeProjection;
        }
        try {
            return unsafeSubstitute(typeProjection, null, 0);
        } catch (SubstitutionException unused) {
            return null;
        }
    }

    @NotNull
    public static TypeSubstitutor create(@NotNull KotlinType kotlinType) {
        if (kotlinType == null) {
            $$$reportNull$$$0(6);
        }
        return create(TypeConstructorSubstitution.create(kotlinType.getConstructor(), kotlinType.getArguments()));
    }

    @NotNull
    public static Variance combine(@NotNull Variance variance, @NotNull Variance variance2) {
        if (variance == null) {
            $$$reportNull$$$0(38);
        }
        if (variance2 == null) {
            $$$reportNull$$$0(39);
        }
        Variance variance3 = Variance.INVARIANT;
        if (variance == variance3) {
            if (variance2 == null) {
                $$$reportNull$$$0(40);
            }
            return variance2;
        }
        if (variance2 == variance3) {
            if (variance == null) {
                $$$reportNull$$$0(41);
            }
            return variance;
        }
        if (variance == variance2) {
            if (variance2 == null) {
                $$$reportNull$$$0(42);
            }
            return variance2;
        }
        throw new AssertionError("Variance conflict: type parameter variance '" + variance + "' and projection kind '" + variance2 + "' cannot be combined");
    }

    @Nullable
    public TypeProjection substitute(@NotNull TypeProjection typeProjection) {
        if (typeProjection == null) {
            $$$reportNull$$$0(16);
        }
        TypeProjection typeProjectionSubstituteWithoutApproximation = substituteWithoutApproximation(typeProjection);
        return (this.substitution.approximateCapturedTypes() || this.substitution.approximateContravariantCapturedTypes()) ? CapturedTypeApproximationKt.approximateCapturedTypesIfNecessary(typeProjectionSubstituteWithoutApproximation, this.substitution.approximateContravariantCapturedTypes()) : typeProjectionSubstituteWithoutApproximation;
    }
}
