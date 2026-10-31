package kotlin.reflect.jvm.internal.impl.load.java.lazy.descriptors;

import b70.c;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.SourceElement;
import kotlin.reflect.jvm.internal.impl.descriptors.impl.AbstractLazyTypeParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.load.java.lazy.LazyJavaAnnotations;
import kotlin.reflect.jvm.internal.impl.load.java.lazy.LazyJavaResolverContext;
import kotlin.reflect.jvm.internal.impl.load.java.lazy.types.JavaTypeAttributesKt;
import kotlin.reflect.jvm.internal.impl.load.java.structure.JavaClassifierType;
import kotlin.reflect.jvm.internal.impl.load.java.structure.JavaTypeParameter;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.KotlinTypeFactory;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import kotlin.reflect.jvm.internal.impl.types.TypeUsage;
import kotlin.reflect.jvm.internal.impl.types.Variance;
import org.jetbrains.annotations.NotNull;
import ul.b;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class LazyJavaTypeParameterDescriptor extends AbstractLazyTypeParameterDescriptor {

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    private final LazyJavaResolverContext f71934c;

    @NotNull
    private final JavaTypeParameter javaTypeParameter;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LazyJavaTypeParameterDescriptor(@NotNull LazyJavaResolverContext c11, @NotNull JavaTypeParameter javaTypeParameter, int i5, @NotNull DeclarationDescriptor containingDeclaration) {
        super(c11.getStorageManager(), containingDeclaration, new LazyJavaAnnotations(c11, javaTypeParameter, false, 4, null), javaTypeParameter.getName(), Variance.INVARIANT, false, i5, SourceElement.NO_SOURCE, c11.getComponents().getSupertypeLoopChecker());
        Intrinsics.g(c11, "c");
        Intrinsics.g(javaTypeParameter, "javaTypeParameter");
        Intrinsics.g(containingDeclaration, "containingDeclaration");
        this.f71934c = c11;
        this.javaTypeParameter = javaTypeParameter;
    }

    private final List<KotlinType> computeNotEnhancedBounds() {
        Collection<JavaClassifierType> upperBounds = this.javaTypeParameter.getUpperBounds();
        if (upperBounds.isEmpty()) {
            SimpleType anyType = this.f71934c.getModule().getBuiltIns().getAnyType();
            Intrinsics.f(anyType, "getAnyType(...)");
            SimpleType nullableAnyType = this.f71934c.getModule().getBuiltIns().getNullableAnyType();
            Intrinsics.f(nullableAnyType, "getNullableAnyType(...)");
            return b.P(KotlinTypeFactory.flexibleType(anyType, nullableAnyType));
        }
        Collection<JavaClassifierType> collection = upperBounds;
        ArrayList arrayList = new ArrayList(c.u0(collection, 10));
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(this.f71934c.getTypeResolver().transformJavaType((JavaClassifierType) it.next(), JavaTypeAttributesKt.toAttributes$default(TypeUsage.COMMON, false, false, this, 3, null)));
        }
        return arrayList;
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.impl.AbstractTypeParameterDescriptor
    @NotNull
    public List<KotlinType> processBoundsWithoutCycles(@NotNull List<? extends KotlinType> bounds) {
        Intrinsics.g(bounds, "bounds");
        return this.f71934c.getComponents().getSignatureEnhancement().enhanceTypeParameterBounds(this, bounds, this.f71934c);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.impl.AbstractTypeParameterDescriptor
    /* renamed from: reportSupertypeLoopError */
    public void mo360reportSupertypeLoopError(@NotNull KotlinType type) {
        Intrinsics.g(type, "type");
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.impl.AbstractTypeParameterDescriptor
    @NotNull
    public List<KotlinType> resolveUpperBounds() {
        return computeNotEnhancedBounds();
    }
}
