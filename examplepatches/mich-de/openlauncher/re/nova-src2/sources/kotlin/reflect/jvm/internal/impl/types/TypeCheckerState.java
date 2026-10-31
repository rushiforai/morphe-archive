package kotlin.reflect.jvm.internal.impl.types;

import java.util.ArrayDeque;
import java.util.Set;
import kotlin.Unit;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.types.model.CapturedTypeMarker;
import kotlin.reflect.jvm.internal.impl.types.model.KotlinTypeMarker;
import kotlin.reflect.jvm.internal.impl.types.model.SimpleTypeMarker;
import kotlin.reflect.jvm.internal.impl.types.model.TypeSystemContext;
import kotlin.reflect.jvm.internal.impl.utils.SmartSet;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public class TypeCheckerState {
    private final boolean allowedTypeVariable;
    private int argumentsDepth;
    private final boolean isErrorTypeEqualsToAnything;
    private final boolean isStubTypeEqualsToAnything;

    @NotNull
    private final AbstractTypePreparator kotlinTypePreparator;

    @NotNull
    private final AbstractTypeRefiner kotlinTypeRefiner;

    @Nullable
    private ArrayDeque<SimpleTypeMarker> supertypesDeque;
    private boolean supertypesLocked;

    @Nullable
    private Set<SimpleTypeMarker> supertypesSet;

    @NotNull
    private final TypeSystemContext typeSystemContext;

    public interface ForkPointContext {

        public static final class Default implements ForkPointContext {
            private boolean result;

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeCheckerState.ForkPointContext
            public void fork(@NotNull Function0<Boolean> block) {
                Intrinsics.g(block, "block");
                if (this.result) {
                    return;
                }
                this.result = ((Boolean) block.invoke()).booleanValue();
            }

            public final boolean getResult() {
                return this.result;
            }
        }

        void fork(@NotNull Function0<Boolean> function0);
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    public static final class LowerCapturedTypePolicy {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ LowerCapturedTypePolicy[] $VALUES;
        public static final LowerCapturedTypePolicy CHECK_ONLY_LOWER = new LowerCapturedTypePolicy("CHECK_ONLY_LOWER", 0);
        public static final LowerCapturedTypePolicy CHECK_SUBTYPE_AND_LOWER = new LowerCapturedTypePolicy("CHECK_SUBTYPE_AND_LOWER", 1);
        public static final LowerCapturedTypePolicy SKIP_LOWER = new LowerCapturedTypePolicy("SKIP_LOWER", 2);

        private static final /* synthetic */ LowerCapturedTypePolicy[] $values() {
            return new LowerCapturedTypePolicy[]{CHECK_ONLY_LOWER, CHECK_SUBTYPE_AND_LOWER, SKIP_LOWER};
        }

        static {
            LowerCapturedTypePolicy[] lowerCapturedTypePolicyArr$values = $values();
            $VALUES = lowerCapturedTypePolicyArr$values;
            $ENTRIES = EnumEntriesKt.a(lowerCapturedTypePolicyArr$values);
        }

        private LowerCapturedTypePolicy(String str, int i5) {
        }

        public static LowerCapturedTypePolicy valueOf(String str) {
            return (LowerCapturedTypePolicy) Enum.valueOf(LowerCapturedTypePolicy.class, str);
        }

        public static LowerCapturedTypePolicy[] values() {
            return (LowerCapturedTypePolicy[]) $VALUES.clone();
        }
    }

    public static abstract class SupertypesPolicy {

        public static abstract class DoCustomTransform extends SupertypesPolicy {
            public DoCustomTransform() {
                super(null);
            }
        }

        @SourceDebugExtension
        public static final class LowerIfFlexible extends SupertypesPolicy {

            @NotNull
            public static final LowerIfFlexible INSTANCE = new LowerIfFlexible();

            private LowerIfFlexible() {
                super(null);
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeCheckerState.SupertypesPolicy
            @NotNull
            /* renamed from: transformType */
            public SimpleTypeMarker mo361transformType(@NotNull TypeCheckerState state, @NotNull KotlinTypeMarker type) {
                Intrinsics.g(state, "state");
                Intrinsics.g(type, "type");
                return state.getTypeSystemContext().lowerBoundIfFlexible(type);
            }
        }

        public static final class None extends SupertypesPolicy {

            @NotNull
            public static final None INSTANCE = new None();

            private None() {
                super(null);
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeCheckerState.SupertypesPolicy
            /* renamed from: transformType, reason: collision with other method in class */
            public /* bridge */ /* synthetic */ SimpleTypeMarker mo361transformType(TypeCheckerState typeCheckerState, KotlinTypeMarker kotlinTypeMarker) {
                return (SimpleTypeMarker) transformType(typeCheckerState, kotlinTypeMarker);
            }

            @NotNull
            public Void transformType(@NotNull TypeCheckerState state, @NotNull KotlinTypeMarker type) {
                Intrinsics.g(state, "state");
                Intrinsics.g(type, "type");
                throw new UnsupportedOperationException("Should not be called");
            }
        }

        @SourceDebugExtension
        public static final class UpperIfFlexible extends SupertypesPolicy {

            @NotNull
            public static final UpperIfFlexible INSTANCE = new UpperIfFlexible();

            private UpperIfFlexible() {
                super(null);
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeCheckerState.SupertypesPolicy
            @NotNull
            /* renamed from: transformType */
            public SimpleTypeMarker mo361transformType(@NotNull TypeCheckerState state, @NotNull KotlinTypeMarker type) {
                Intrinsics.g(state, "state");
                Intrinsics.g(type, "type");
                return state.getTypeSystemContext().upperBoundIfFlexible(type);
            }
        }

        public /* synthetic */ SupertypesPolicy(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        /* renamed from: transformType */
        public abstract SimpleTypeMarker mo361transformType(@NotNull TypeCheckerState typeCheckerState, @NotNull KotlinTypeMarker kotlinTypeMarker);

        private SupertypesPolicy() {
        }
    }

    public TypeCheckerState(boolean z11, boolean z12, boolean z13, @NotNull TypeSystemContext typeSystemContext, @NotNull AbstractTypePreparator kotlinTypePreparator, @NotNull AbstractTypeRefiner kotlinTypeRefiner) {
        Intrinsics.g(typeSystemContext, "typeSystemContext");
        Intrinsics.g(kotlinTypePreparator, "kotlinTypePreparator");
        Intrinsics.g(kotlinTypeRefiner, "kotlinTypeRefiner");
        this.isErrorTypeEqualsToAnything = z11;
        this.isStubTypeEqualsToAnything = z12;
        this.allowedTypeVariable = z13;
        this.typeSystemContext = typeSystemContext;
        this.kotlinTypePreparator = kotlinTypePreparator;
        this.kotlinTypeRefiner = kotlinTypeRefiner;
    }

    public static /* synthetic */ Boolean addSubtypeConstraint$default(TypeCheckerState typeCheckerState, KotlinTypeMarker kotlinTypeMarker, KotlinTypeMarker kotlinTypeMarker2, boolean z11, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: addSubtypeConstraint");
        }
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        return typeCheckerState.addSubtypeConstraint(kotlinTypeMarker, kotlinTypeMarker2, z11);
    }

    @Nullable
    public Boolean addSubtypeConstraint(@NotNull KotlinTypeMarker subType, @NotNull KotlinTypeMarker superType, boolean z11) {
        Intrinsics.g(subType, "subType");
        Intrinsics.g(superType, "superType");
        return null;
    }

    public final void clear() {
        ArrayDeque<SimpleTypeMarker> arrayDeque = this.supertypesDeque;
        Intrinsics.d(arrayDeque);
        arrayDeque.clear();
        Set<SimpleTypeMarker> set = this.supertypesSet;
        Intrinsics.d(set);
        set.clear();
        this.supertypesLocked = false;
    }

    public boolean customIsSubtypeOf(@NotNull KotlinTypeMarker subType, @NotNull KotlinTypeMarker superType) {
        Intrinsics.g(subType, "subType");
        Intrinsics.g(superType, "superType");
        return true;
    }

    @NotNull
    public LowerCapturedTypePolicy getLowerCapturedTypePolicy(@NotNull SimpleTypeMarker subType, @NotNull CapturedTypeMarker superType) {
        Intrinsics.g(subType, "subType");
        Intrinsics.g(superType, "superType");
        return LowerCapturedTypePolicy.CHECK_SUBTYPE_AND_LOWER;
    }

    @Nullable
    public final ArrayDeque<SimpleTypeMarker> getSupertypesDeque() {
        return this.supertypesDeque;
    }

    @Nullable
    public final Set<SimpleTypeMarker> getSupertypesSet() {
        return this.supertypesSet;
    }

    @NotNull
    public final TypeSystemContext getTypeSystemContext() {
        return this.typeSystemContext;
    }

    public final void initialize() {
        this.supertypesLocked = true;
        if (this.supertypesDeque == null) {
            this.supertypesDeque = new ArrayDeque<>(4);
        }
        if (this.supertypesSet == null) {
            this.supertypesSet = SmartSet.Companion.create();
        }
    }

    public final boolean isAllowedTypeVariable(@NotNull KotlinTypeMarker type) {
        Intrinsics.g(type, "type");
        return this.allowedTypeVariable && this.typeSystemContext.isTypeVariableType(type);
    }

    public final boolean isErrorTypeEqualsToAnything() {
        return this.isErrorTypeEqualsToAnything;
    }

    public final boolean isStubTypeEqualsToAnything() {
        return this.isStubTypeEqualsToAnything;
    }

    @NotNull
    public final KotlinTypeMarker prepareType(@NotNull KotlinTypeMarker type) {
        Intrinsics.g(type, "type");
        return this.kotlinTypePreparator.prepareType(type);
    }

    @NotNull
    public final KotlinTypeMarker refineType(@NotNull KotlinTypeMarker type) {
        Intrinsics.g(type, "type");
        return this.kotlinTypeRefiner.refineType(type);
    }

    public boolean runForkingPoint(@NotNull Function1<? super ForkPointContext, Unit> block) {
        Intrinsics.g(block, "block");
        ForkPointContext.Default r02 = new ForkPointContext.Default();
        block.invoke(r02);
        return r02.getResult();
    }
}
