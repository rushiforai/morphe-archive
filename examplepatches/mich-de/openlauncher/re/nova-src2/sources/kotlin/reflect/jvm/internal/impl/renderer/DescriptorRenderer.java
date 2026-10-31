package kotlin.reflect.jvm.internal.impl.renderer;

import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.collections.EmptySet;
import kotlin.jvm.JvmField;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.builtins.KotlinBuiltIns;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassKind;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassifierDescriptorWithTypeParameters;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeAliasDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ValueParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.AnnotationDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.AnnotationUseSiteTarget;
import kotlin.reflect.jvm.internal.impl.name.FqNameUnsafe;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.renderer.ClassifierNamePolicy;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.TypeProjection;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public abstract class DescriptorRenderer {

    @JvmField
    @NotNull
    public static final DescriptorRenderer COMPACT;

    @JvmField
    @NotNull
    public static final DescriptorRenderer COMPACT_WITHOUT_SUPERTYPES;

    @JvmField
    @NotNull
    public static final DescriptorRenderer COMPACT_WITH_MODIFIERS;

    @JvmField
    @NotNull
    public static final DescriptorRenderer COMPACT_WITH_SHORT_TYPES;

    @NotNull
    public static final Companion Companion;

    @JvmField
    @NotNull
    public static final DescriptorRenderer DEBUG_TEXT;

    @JvmField
    @NotNull
    public static final DescriptorRenderer FQ_NAMES_IN_TYPES;

    @JvmField
    @NotNull
    public static final DescriptorRenderer FQ_NAMES_IN_TYPES_WITH_ANNOTATIONS;

    @JvmField
    @NotNull
    public static final DescriptorRenderer HTML;

    @JvmField
    @NotNull
    public static final DescriptorRenderer ONLY_NAMES_WITH_SHORT_TYPES;

    @JvmField
    @NotNull
    public static final DescriptorRenderer SHORT_NAMES_IN_TYPES;

    public static final class Companion {

        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[ClassKind.values().length];
                try {
                    iArr[ClassKind.CLASS.ordinal()] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    iArr[ClassKind.INTERFACE.ordinal()] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                try {
                    iArr[ClassKind.ENUM_CLASS.ordinal()] = 3;
                } catch (NoSuchFieldError unused3) {
                }
                try {
                    iArr[ClassKind.OBJECT.ordinal()] = 4;
                } catch (NoSuchFieldError unused4) {
                }
                try {
                    iArr[ClassKind.ANNOTATION_CLASS.ordinal()] = 5;
                } catch (NoSuchFieldError unused5) {
                }
                try {
                    iArr[ClassKind.ENUM_ENTRY.ordinal()] = 6;
                } catch (NoSuchFieldError unused6) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final String getClassifierKindPrefix(@NotNull ClassifierDescriptorWithTypeParameters classifier) {
            Intrinsics.g(classifier, "classifier");
            if (classifier instanceof TypeAliasDescriptor) {
                return "typealias";
            }
            if (!(classifier instanceof ClassDescriptor)) {
                throw new AssertionError("Unexpected classifier: " + classifier);
            }
            ClassDescriptor classDescriptor = (ClassDescriptor) classifier;
            if (classDescriptor.isCompanionObject()) {
                return "companion object";
            }
            switch (WhenMappings.$EnumSwitchMapping$0[classDescriptor.getKind().ordinal()]) {
                case 1:
                    return "class";
                case 2:
                    return "interface";
                case 3:
                    return "enum class";
                case 4:
                    return "object";
                case 5:
                    return "annotation class";
                case 6:
                    return "enum entry";
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }

        @NotNull
        public final DescriptorRenderer withOptions(@NotNull Function1<? super DescriptorRendererOptions, Unit> changeOptions) {
            Intrinsics.g(changeOptions, "changeOptions");
            DescriptorRendererOptionsImpl descriptorRendererOptionsImpl = new DescriptorRendererOptionsImpl();
            changeOptions.invoke(descriptorRendererOptionsImpl);
            descriptorRendererOptionsImpl.lock();
            return new DescriptorRendererImpl(descriptorRendererOptionsImpl);
        }

        private Companion() {
        }
    }

    public interface ValueParametersHandler {

        public static final class DEFAULT implements ValueParametersHandler {

            @NotNull
            public static final DEFAULT INSTANCE = new DEFAULT();

            private DEFAULT() {
            }

            @Override // kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer.ValueParametersHandler
            public void appendAfterValueParameter(@NotNull ValueParameterDescriptor parameter, int i5, int i11, @NotNull StringBuilder builder) {
                Intrinsics.g(parameter, "parameter");
                Intrinsics.g(builder, "builder");
                if (i5 != i11 - 1) {
                    builder.append(", ");
                }
            }

            @Override // kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer.ValueParametersHandler
            public void appendAfterValueParameters(int i5, @NotNull StringBuilder builder) {
                Intrinsics.g(builder, "builder");
                builder.append(")");
            }

            @Override // kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer.ValueParametersHandler
            public void appendBeforeValueParameter(@NotNull ValueParameterDescriptor parameter, int i5, int i11, @NotNull StringBuilder builder) {
                Intrinsics.g(parameter, "parameter");
                Intrinsics.g(builder, "builder");
            }

            @Override // kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer.ValueParametersHandler
            public void appendBeforeValueParameters(int i5, @NotNull StringBuilder builder) {
                Intrinsics.g(builder, "builder");
                builder.append("(");
            }
        }

        void appendAfterValueParameter(@NotNull ValueParameterDescriptor valueParameterDescriptor, int i5, int i11, @NotNull StringBuilder sb2);

        void appendAfterValueParameters(int i5, @NotNull StringBuilder sb2);

        void appendBeforeValueParameter(@NotNull ValueParameterDescriptor valueParameterDescriptor, int i5, int i11, @NotNull StringBuilder sb2);

        void appendBeforeValueParameters(int i5, @NotNull StringBuilder sb2);
    }

    static {
        Companion companion = new Companion(null);
        Companion = companion;
        COMPACT_WITH_MODIFIERS = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$COMPACT_WITH_MODIFIERS$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setWithDefinedIn(false);
            }
        });
        COMPACT = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$COMPACT$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setWithDefinedIn(false);
                withOptions.setModifiers(EmptySet.f71734a);
            }
        });
        COMPACT_WITHOUT_SUPERTYPES = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$COMPACT_WITHOUT_SUPERTYPES$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setWithDefinedIn(false);
                withOptions.setModifiers(EmptySet.f71734a);
                withOptions.setWithoutSuperTypes(true);
            }
        });
        COMPACT_WITH_SHORT_TYPES = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$COMPACT_WITH_SHORT_TYPES$1
            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setModifiers(EmptySet.f71734a);
                withOptions.setClassifierNamePolicy(ClassifierNamePolicy.SHORT.INSTANCE);
                withOptions.setParameterNameRenderingPolicy(ParameterNameRenderingPolicy.ONLY_NON_SYNTHESIZED);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }
        });
        ONLY_NAMES_WITH_SHORT_TYPES = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$ONLY_NAMES_WITH_SHORT_TYPES$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setWithDefinedIn(false);
                withOptions.setModifiers(EmptySet.f71734a);
                withOptions.setClassifierNamePolicy(ClassifierNamePolicy.SHORT.INSTANCE);
                withOptions.setWithoutTypeParameters(true);
                withOptions.setParameterNameRenderingPolicy(ParameterNameRenderingPolicy.NONE);
                withOptions.setReceiverAfterName(true);
                withOptions.setRenderCompanionObjectName(true);
                withOptions.setWithoutSuperTypes(true);
                withOptions.setStartFromName(true);
            }
        });
        FQ_NAMES_IN_TYPES = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$FQ_NAMES_IN_TYPES$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setModifiers(DescriptorRendererModifier.ALL_EXCEPT_ANNOTATIONS);
            }
        });
        FQ_NAMES_IN_TYPES_WITH_ANNOTATIONS = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$FQ_NAMES_IN_TYPES_WITH_ANNOTATIONS$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setModifiers(DescriptorRendererModifier.ALL);
            }
        });
        SHORT_NAMES_IN_TYPES = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$SHORT_NAMES_IN_TYPES$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setClassifierNamePolicy(ClassifierNamePolicy.SHORT.INSTANCE);
                withOptions.setParameterNameRenderingPolicy(ParameterNameRenderingPolicy.ONLY_NON_SYNTHESIZED);
            }
        });
        DEBUG_TEXT = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$DEBUG_TEXT$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setDebugMode(true);
                withOptions.setClassifierNamePolicy(ClassifierNamePolicy.FULLY_QUALIFIED.INSTANCE);
                withOptions.setModifiers(DescriptorRendererModifier.ALL);
            }
        });
        HTML = companion.withOptions(new Function1<DescriptorRendererOptions, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.renderer.DescriptorRenderer$Companion$HTML$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DescriptorRendererOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DescriptorRendererOptions withOptions) {
                Intrinsics.g(withOptions, "$this$withOptions");
                withOptions.setTextFormat(RenderingFormat.HTML);
                withOptions.setModifiers(DescriptorRendererModifier.ALL);
            }
        });
    }

    public static /* synthetic */ String renderAnnotation$default(DescriptorRenderer descriptorRenderer, AnnotationDescriptor annotationDescriptor, AnnotationUseSiteTarget annotationUseSiteTarget, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: renderAnnotation");
        }
        if ((i5 & 2) != 0) {
            annotationUseSiteTarget = null;
        }
        return descriptorRenderer.renderAnnotation(annotationDescriptor, annotationUseSiteTarget);
    }

    @NotNull
    public abstract String render(@NotNull DeclarationDescriptor declarationDescriptor);

    @NotNull
    public abstract String renderAnnotation(@NotNull AnnotationDescriptor annotationDescriptor, @Nullable AnnotationUseSiteTarget annotationUseSiteTarget);

    @NotNull
    public abstract String renderFlexibleType(@NotNull String str, @NotNull String str2, @NotNull KotlinBuiltIns kotlinBuiltIns);

    @NotNull
    public abstract String renderFqName(@NotNull FqNameUnsafe fqNameUnsafe);

    @NotNull
    public abstract String renderName(@NotNull Name name, boolean z11);

    @NotNull
    public abstract String renderType(@NotNull KotlinType kotlinType);

    @NotNull
    public abstract String renderTypeProjection(@NotNull TypeProjection typeProjection);

    @NotNull
    public final DescriptorRenderer withOptions(@NotNull Function1<? super DescriptorRendererOptions, Unit> changeOptions) {
        Intrinsics.g(changeOptions, "changeOptions");
        DescriptorRendererOptionsImpl descriptorRendererOptionsImplCopy = ((DescriptorRendererImpl) this).getOptions().copy();
        changeOptions.invoke(descriptorRendererOptionsImplCopy);
        descriptorRendererOptionsImplCopy.lock();
        return new DescriptorRendererImpl(descriptorRendererOptionsImplCopy);
    }
}
