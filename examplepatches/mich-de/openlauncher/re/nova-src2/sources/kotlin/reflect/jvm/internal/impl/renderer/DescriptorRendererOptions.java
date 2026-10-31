package kotlin.reflect.jvm.internal.impl.renderer;

import java.util.Set;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public interface DescriptorRendererOptions {

    public static final class DefaultImpls {
        public static boolean getIncludeAnnotationArguments(@NotNull DescriptorRendererOptions descriptorRendererOptions) {
            return descriptorRendererOptions.getAnnotationArgumentsRenderingPolicy().getIncludeAnnotationArguments();
        }

        public static boolean getIncludeEmptyAnnotationArguments(@NotNull DescriptorRendererOptions descriptorRendererOptions) {
            return descriptorRendererOptions.getAnnotationArgumentsRenderingPolicy().getIncludeEmptyAnnotationArguments();
        }
    }

    @NotNull
    AnnotationArgumentsRenderingPolicy getAnnotationArgumentsRenderingPolicy();

    boolean getDebugMode();

    boolean getEnhancedTypes();

    @NotNull
    Set<FqName> getExcludedTypeAnnotationClasses();

    void setAnnotationArgumentsRenderingPolicy(@NotNull AnnotationArgumentsRenderingPolicy annotationArgumentsRenderingPolicy);

    void setClassifierNamePolicy(@NotNull ClassifierNamePolicy classifierNamePolicy);

    void setDebugMode(boolean z11);

    void setExcludedTypeAnnotationClasses(@NotNull Set<FqName> set);

    void setModifiers(@NotNull Set<? extends DescriptorRendererModifier> set);

    void setParameterNameRenderingPolicy(@NotNull ParameterNameRenderingPolicy parameterNameRenderingPolicy);

    void setReceiverAfterName(boolean z11);

    void setRenderCompanionObjectName(boolean z11);

    void setStartFromName(boolean z11);

    void setTextFormat(@NotNull RenderingFormat renderingFormat);

    void setVerbose(boolean z11);

    void setWithDefinedIn(boolean z11);

    void setWithoutSuperTypes(boolean z11);

    void setWithoutTypeParameters(boolean z11);
}
