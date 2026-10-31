package kotlin.reflect.jvm.internal.impl.types.checker;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.resolve.OverridingUtil;
import kotlin.reflect.jvm.internal.impl.types.AbstractTypeChecker;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.TypeCheckerState;
import kotlin.reflect.jvm.internal.impl.types.UnwrappedType;
import kotlin.reflect.jvm.internal.impl.types.checker.KotlinTypePreparator;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class NewKotlinTypeCheckerImpl implements NewKotlinTypeChecker {

    @NotNull
    private final KotlinTypePreparator kotlinTypePreparator;

    @NotNull
    private final KotlinTypeRefiner kotlinTypeRefiner;

    @NotNull
    private final OverridingUtil overridingUtil;

    public NewKotlinTypeCheckerImpl(@NotNull KotlinTypeRefiner kotlinTypeRefiner, @NotNull KotlinTypePreparator kotlinTypePreparator) {
        Intrinsics.g(kotlinTypeRefiner, "kotlinTypeRefiner");
        Intrinsics.g(kotlinTypePreparator, "kotlinTypePreparator");
        this.kotlinTypeRefiner = kotlinTypeRefiner;
        this.kotlinTypePreparator = kotlinTypePreparator;
        OverridingUtil overridingUtilCreateWithTypeRefiner = OverridingUtil.createWithTypeRefiner(getKotlinTypeRefiner());
        Intrinsics.f(overridingUtilCreateWithTypeRefiner, "createWithTypeRefiner(...)");
        this.overridingUtil = overridingUtilCreateWithTypeRefiner;
    }

    @Override // kotlin.reflect.jvm.internal.impl.types.checker.KotlinTypeChecker
    public boolean equalTypes(@NotNull KotlinType a11, @NotNull KotlinType b11) {
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        return equalTypes(ClassicTypeCheckerStateKt.createClassicTypeCheckerState$default(false, false, null, getKotlinTypePreparator(), getKotlinTypeRefiner(), 6, null), a11.unwrap(), b11.unwrap());
    }

    @NotNull
    public KotlinTypePreparator getKotlinTypePreparator() {
        return this.kotlinTypePreparator;
    }

    @Override // kotlin.reflect.jvm.internal.impl.types.checker.NewKotlinTypeChecker
    @NotNull
    public KotlinTypeRefiner getKotlinTypeRefiner() {
        return this.kotlinTypeRefiner;
    }

    @Override // kotlin.reflect.jvm.internal.impl.types.checker.NewKotlinTypeChecker
    @NotNull
    public OverridingUtil getOverridingUtil() {
        return this.overridingUtil;
    }

    @Override // kotlin.reflect.jvm.internal.impl.types.checker.KotlinTypeChecker
    public boolean isSubtypeOf(@NotNull KotlinType subtype, @NotNull KotlinType supertype) {
        Intrinsics.g(subtype, "subtype");
        Intrinsics.g(supertype, "supertype");
        return isSubtypeOf(ClassicTypeCheckerStateKt.createClassicTypeCheckerState$default(true, false, null, getKotlinTypePreparator(), getKotlinTypeRefiner(), 6, null), subtype.unwrap(), supertype.unwrap());
    }

    public final boolean equalTypes(@NotNull TypeCheckerState typeCheckerState, @NotNull UnwrappedType a11, @NotNull UnwrappedType b11) {
        Intrinsics.g(typeCheckerState, "<this>");
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        return AbstractTypeChecker.INSTANCE.equalTypes(typeCheckerState, a11, b11);
    }

    public final boolean isSubtypeOf(@NotNull TypeCheckerState typeCheckerState, @NotNull UnwrappedType subType, @NotNull UnwrappedType superType) {
        Intrinsics.g(typeCheckerState, "<this>");
        Intrinsics.g(subType, "subType");
        Intrinsics.g(superType, "superType");
        return AbstractTypeChecker.isSubtypeOf$default(AbstractTypeChecker.INSTANCE, typeCheckerState, subType, superType, false, 8, null);
    }

    public /* synthetic */ NewKotlinTypeCheckerImpl(KotlinTypeRefiner kotlinTypeRefiner, KotlinTypePreparator kotlinTypePreparator, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(kotlinTypeRefiner, (i5 & 2) != 0 ? KotlinTypePreparator.Default.INSTANCE : kotlinTypePreparator);
    }
}
