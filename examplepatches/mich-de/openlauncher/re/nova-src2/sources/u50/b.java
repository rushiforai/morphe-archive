package u50;

import b70.h;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.jvm.internal.Intrinsics;
import lm.e;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class b {

    @NotNull
    private volatile /* synthetic */ Object current = h.f17594a;

    static {
        AtomicReferenceFieldUpdater.newUpdater(b.class, Object.class, "current");
    }

    public final Object a(e key) {
        Intrinsics.g(key, "key");
        return ((Map) this.current).get(key);
    }
}
