package kotlin.reflect.jvm.internal.impl.types;

import kotlin.jvm.JvmField;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.Annotations;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public abstract class TypeSubstitution {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @JvmField
    @NotNull
    public static final TypeSubstitution EMPTY = new TypeSubstitution() { // from class: kotlin.reflect.jvm.internal.impl.types.TypeSubstitution$Companion$EMPTY$1
        @Nullable
        public Void get(@NotNull KotlinType key) {
            Intrinsics.g(key, "key");
            return null;
        }

        @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
        public boolean isEmpty() {
            return true;
        }

        @NotNull
        public String toString() {
            return "Empty TypeSubstitution";
        }

        @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
        /* renamed from: get, reason: collision with other method in class */
        public /* bridge */ /* synthetic */ TypeProjection mo362get(KotlinType kotlinType) {
            return (TypeProjection) get(kotlinType);
        }
    };

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public boolean approximateCapturedTypes() {
        return false;
    }

    public boolean approximateContravariantCapturedTypes() {
        return false;
    }

    @NotNull
    public final TypeSubstitutor buildSubstitutor() {
        TypeSubstitutor typeSubstitutorCreate = TypeSubstitutor.create(this);
        Intrinsics.f(typeSubstitutorCreate, "create(...)");
        return typeSubstitutorCreate;
    }

    @NotNull
    public Annotations filterAnnotations(@NotNull Annotations annotations) {
        Intrinsics.g(annotations, "annotations");
        return annotations;
    }

    @Nullable
    /* renamed from: get */
    public abstract TypeProjection mo362get(@NotNull KotlinType kotlinType);

    public boolean isEmpty() {
        return false;
    }

    @NotNull
    public KotlinType prepareTopLevelType(@NotNull KotlinType topLevelType, @NotNull Variance position) {
        Intrinsics.g(topLevelType, "topLevelType");
        Intrinsics.g(position, "position");
        return topLevelType;
    }

    @NotNull
    public final TypeSubstitution replaceWithNonApproximating() {
        return new TypeSubstitution() { // from class: kotlin.reflect.jvm.internal.impl.types.TypeSubstitution.replaceWithNonApproximating.1
            @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
            public boolean approximateCapturedTypes() {
                return false;
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
            public boolean approximateContravariantCapturedTypes() {
                return false;
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
            @NotNull
            public Annotations filterAnnotations(@NotNull Annotations annotations) {
                Intrinsics.g(annotations, "annotations");
                return TypeSubstitution.this.filterAnnotations(annotations);
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
            @Nullable
            /* renamed from: get */
            public TypeProjection mo362get(@NotNull KotlinType key) {
                Intrinsics.g(key, "key");
                return TypeSubstitution.this.mo362get(key);
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
            public boolean isEmpty() {
                return TypeSubstitution.this.isEmpty();
            }

            @Override // kotlin.reflect.jvm.internal.impl.types.TypeSubstitution
            @NotNull
            public KotlinType prepareTopLevelType(@NotNull KotlinType topLevelType, @NotNull Variance position) {
                Intrinsics.g(topLevelType, "topLevelType");
                Intrinsics.g(position, "position");
                return TypeSubstitution.this.prepareTopLevelType(topLevelType, position);
            }
        };
    }
}
