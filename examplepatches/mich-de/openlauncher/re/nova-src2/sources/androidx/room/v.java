package androidx.room;

import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class v {

    @NotNull
    private final o database;

    @NotNull
    private final AtomicBoolean lock;

    @NotNull
    private final Lazy stmt$delegate;

    public v(o database) {
        Intrinsics.g(database, "database");
        this.database = database;
        this.lock = new AtomicBoolean(false);
        this.stmt$delegate = LazyKt.a(new a3.e(this, 11));
    }

    @NotNull
    public d7.g acquire() {
        assertNotMainThread();
        if (this.lock.compareAndSet(false, true)) {
            return (d7.g) this.stmt$delegate.getValue();
        }
        return this.database.compileStatement(createQuery());
    }

    public void assertNotMainThread() {
        this.database.assertNotMainThread();
    }

    public abstract String createQuery();

    public void release(@NotNull d7.g statement) {
        Intrinsics.g(statement, "statement");
        if (statement == ((d7.g) this.stmt$delegate.getValue())) {
            this.lock.set(false);
        }
    }
}
