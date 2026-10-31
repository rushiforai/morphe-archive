package kotlin.reflect.jvm.internal.impl.types;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
final class SimpleTypeWithAttributes extends DelegatingSimpleTypeImpl {

    @NotNull
    private final TypeAttributes attributes;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SimpleTypeWithAttributes(@NotNull SimpleType delegate, @NotNull TypeAttributes attributes) {
        super(delegate);
        Intrinsics.g(delegate, "delegate");
        Intrinsics.g(attributes, "attributes");
        this.attributes = attributes;
    }

    @Override // kotlin.reflect.jvm.internal.impl.types.DelegatingSimpleType, kotlin.reflect.jvm.internal.impl.types.KotlinType
    @NotNull
    public TypeAttributes getAttributes() {
        return this.attributes;
    }

    @Override // kotlin.reflect.jvm.internal.impl.types.DelegatingSimpleType
    @NotNull
    public SimpleTypeWithAttributes replaceDelegate(@NotNull SimpleType delegate) {
        Intrinsics.g(delegate, "delegate");
        return new SimpleTypeWithAttributes(delegate, getAttributes());
    }
}
