package h6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class q {
    public static s a(t state) {
        Intrinsics.g(state, "state");
        int iOrdinal = state.ordinal();
        if (iOrdinal == 2) {
            return s.ON_DESTROY;
        }
        if (iOrdinal == 3) {
            return s.ON_STOP;
        }
        if (iOrdinal != 4) {
            return null;
        }
        return s.ON_PAUSE;
    }

    public static s b(t state) {
        Intrinsics.g(state, "state");
        int iOrdinal = state.ordinal();
        if (iOrdinal == 2) {
            return s.ON_CREATE;
        }
        if (iOrdinal == 3) {
            return s.ON_START;
        }
        if (iOrdinal != 4) {
            return null;
        }
        return s.ON_RESUME;
    }
}
