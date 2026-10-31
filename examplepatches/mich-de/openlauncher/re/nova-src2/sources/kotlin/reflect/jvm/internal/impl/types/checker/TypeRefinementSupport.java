package kotlin.reflect.jvm.internal.impl.types.checker;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public abstract class TypeRefinementSupport {
    private final boolean isEnabled;

    public static final class Enabled extends TypeRefinementSupport {

        @NotNull
        private final KotlinTypeRefiner typeRefiner;

        @NotNull
        public final KotlinTypeRefiner getTypeRefiner() {
            return this.typeRefiner;
        }
    }

    public final boolean isEnabled() {
        return this.isEnabled;
    }
}
