package op;

import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class f {
    public static g a() {
        return new g(1, 0);
    }

    public static g b() {
        return new g(0, 1);
    }

    @NotNull
    public final KSerializer<g> serializer() {
        return e.f80553a;
    }
}
