package kotlin.reflect.jvm.internal.impl.descriptors;

import java.util.Map;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class Visibilities {

    @NotNull
    private static final Public DEFAULT_VISIBILITY;

    @NotNull
    public static final Visibilities INSTANCE = new Visibilities();

    @NotNull
    private static final Map<Visibility, Integer> ORDERED_VISIBILITIES;

    public static final class Inherited extends Visibility {

        @NotNull
        public static final Inherited INSTANCE = new Inherited();

        private Inherited() {
            super("inherited", false);
        }
    }

    public static final class Internal extends Visibility {

        @NotNull
        public static final Internal INSTANCE = new Internal();

        private Internal() {
            super("internal", false);
        }
    }

    public static final class InvisibleFake extends Visibility {

        @NotNull
        public static final InvisibleFake INSTANCE = new InvisibleFake();

        private InvisibleFake() {
            super("invisible_fake", false);
        }
    }

    public static final class Local extends Visibility {

        @NotNull
        public static final Local INSTANCE = new Local();

        private Local() {
            super("local", false);
        }
    }

    public static final class Private extends Visibility {

        @NotNull
        public static final Private INSTANCE = new Private();

        private Private() {
            super("private", false);
        }
    }

    public static final class PrivateToThis extends Visibility {

        @NotNull
        public static final PrivateToThis INSTANCE = new PrivateToThis();

        private PrivateToThis() {
            super("private_to_this", false);
        }

        @Override // kotlin.reflect.jvm.internal.impl.descriptors.Visibility
        @NotNull
        public String getInternalDisplayName() {
            return "private/*private to this*/";
        }
    }

    public static final class Protected extends Visibility {

        @NotNull
        public static final Protected INSTANCE = new Protected();

        private Protected() {
            super("protected", true);
        }
    }

    public static final class Public extends Visibility {

        @NotNull
        public static final Public INSTANCE = new Public();

        private Public() {
            super("public", true);
        }
    }

    public static final class Unknown extends Visibility {

        @NotNull
        public static final Unknown INSTANCE = new Unknown();

        private Unknown() {
            super("unknown", false);
        }
    }

    static {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(PrivateToThis.INSTANCE, 0);
        mapBuilder.put(Private.INSTANCE, 0);
        mapBuilder.put(Internal.INSTANCE, 1);
        mapBuilder.put(Protected.INSTANCE, 1);
        Public r12 = Public.INSTANCE;
        mapBuilder.put(r12, 2);
        ORDERED_VISIBILITIES = mapBuilder.b();
        DEFAULT_VISIBILITY = r12;
    }

    private Visibilities() {
    }

    @Nullable
    public final Integer compareLocal$compiler_common(@NotNull Visibility first, @NotNull Visibility second) {
        Intrinsics.g(first, "first");
        Intrinsics.g(second, "second");
        if (first == second) {
            return 0;
        }
        Map<Visibility, Integer> map = ORDERED_VISIBILITIES;
        Integer num = map.get(first);
        Integer num2 = map.get(second);
        if (num == null || num2 == null || num.equals(num2)) {
            return null;
        }
        return Integer.valueOf(num.intValue() - num2.intValue());
    }

    public final boolean isPrivate(@NotNull Visibility visibility) {
        Intrinsics.g(visibility, "visibility");
        return visibility == Private.INSTANCE || visibility == PrivateToThis.INSTANCE;
    }
}
