package kotlin.reflect.jvm.internal.impl.descriptors;

import java.util.Collection;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.TypeConstructor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public interface SupertypeLoopChecker {

    public static final class EMPTY implements SupertypeLoopChecker {

        @NotNull
        public static final EMPTY INSTANCE = new EMPTY();

        private EMPTY() {
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // kotlin.reflect.jvm.internal.impl.descriptors.SupertypeLoopChecker
        @NotNull
        public Collection<KotlinType> findLoopsInSupertypesAndDisconnect(@NotNull TypeConstructor currentTypeConstructor, @NotNull Collection<? extends KotlinType> superTypes, @NotNull Function1<? super TypeConstructor, ? extends Iterable<? extends KotlinType>> neighbors, @NotNull Function1<? super KotlinType, Unit> reportLoop) {
            Intrinsics.g(currentTypeConstructor, "currentTypeConstructor");
            Intrinsics.g(superTypes, "superTypes");
            Intrinsics.g(neighbors, "neighbors");
            Intrinsics.g(reportLoop, "reportLoop");
            return superTypes;
        }
    }

    @NotNull
    Collection<KotlinType> findLoopsInSupertypesAndDisconnect(@NotNull TypeConstructor typeConstructor, @NotNull Collection<? extends KotlinType> collection, @NotNull Function1<? super TypeConstructor, ? extends Iterable<? extends KotlinType>> function1, @NotNull Function1<? super KotlinType, Unit> function12);
}
