package a40;

import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class v {
    public static w a() {
        return w.f241e;
    }

    public static k30.u b(int i5) {
        if (i5 == 1) {
            return k30.u.f71071k;
        }
        if (i5 == 2 || i5 == 3 || i5 == 4) {
            return k30.u.f71069i;
        }
        return null;
    }

    @NotNull
    public final KSerializer<w> serializer() {
        return u.f239a;
    }
}
