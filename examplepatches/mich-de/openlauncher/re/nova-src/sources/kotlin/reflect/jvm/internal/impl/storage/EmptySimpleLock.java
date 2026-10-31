package kotlin.reflect.jvm.internal.impl.storage;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class EmptySimpleLock implements SimpleLock {

    @NotNull
    public static final EmptySimpleLock INSTANCE = new EmptySimpleLock();

    private EmptySimpleLock() {
    }

    @Override // kotlin.reflect.jvm.internal.impl.storage.SimpleLock
    public void lock() {
    }

    @Override // kotlin.reflect.jvm.internal.impl.storage.SimpleLock
    public void unlock() {
    }
}
