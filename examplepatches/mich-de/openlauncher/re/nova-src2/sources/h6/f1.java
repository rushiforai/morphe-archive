package h6;

import java.io.Closeable;
import java.util.Iterator;
import kotlin.Deprecated;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class f1 {

    @Nullable
    private final m6.c impl = new m6.c();

    public final void addCloseable(@NotNull String key, @NotNull AutoCloseable closeable) {
        AutoCloseable autoCloseable;
        Intrinsics.g(key, "key");
        Intrinsics.g(closeable, "closeable");
        m6.c cVar = this.impl;
        if (cVar != null) {
            if (cVar.f76018d) {
                m6.c.b(closeable);
                return;
            }
            synchronized (cVar.f76015a) {
                autoCloseable = (AutoCloseable) cVar.f76016b.put(key, closeable);
            }
            m6.c.b(autoCloseable);
        }
    }

    public final void clear$lifecycle_viewmodel_release() {
        m6.c cVar = this.impl;
        if (cVar != null && !cVar.f76018d) {
            cVar.f76018d = true;
            synchronized (cVar.f76015a) {
                try {
                    Iterator it = cVar.f76016b.values().iterator();
                    while (it.hasNext()) {
                        m6.c.b((AutoCloseable) it.next());
                    }
                    Iterator it2 = cVar.f76017c.iterator();
                    while (it2.hasNext()) {
                        m6.c.b((AutoCloseable) it2.next());
                    }
                    cVar.f76017c.clear();
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        onCleared();
    }

    @Nullable
    public final <T extends AutoCloseable> T getCloseable(@NotNull String key) {
        T t6;
        Intrinsics.g(key, "key");
        m6.c cVar = this.impl;
        if (cVar == null) {
            return null;
        }
        synchronized (cVar.f76015a) {
            t6 = (T) cVar.f76016b.get(key);
        }
        return t6;
    }

    public void onCleared() {
    }

    public void addCloseable(@NotNull AutoCloseable closeable) {
        Intrinsics.g(closeable, "closeable");
        m6.c cVar = this.impl;
        if (cVar != null) {
            cVar.a(closeable);
        }
    }

    @Deprecated
    public /* synthetic */ void addCloseable(Closeable closeable) {
        Intrinsics.g(closeable, "closeable");
        m6.c cVar = this.impl;
        if (cVar != null) {
            cVar.a(closeable);
        }
    }
}
