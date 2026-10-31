package g;

import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.Unit;
import kotlin.jvm.JvmName;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class s {

    @NotNull
    private final CopyOnWriteArrayList<c> cancellables = new CopyOnWriteArrayList<>();

    @Nullable
    private Function0<Unit> enabledChangedCallback;
    private boolean isEnabled;

    public s(boolean z11) {
        this.isEnabled = z11;
    }

    @JvmName
    public final void addCancellable(@NotNull c cancellable) {
        Intrinsics.g(cancellable, "cancellable");
        this.cancellables.add(cancellable);
    }

    @Nullable
    public final Function0<Unit> getEnabledChangedCallback$activity_release() {
        return this.enabledChangedCallback;
    }

    public void handleOnBackCancelled() {
    }

    public abstract void handleOnBackPressed();

    public void handleOnBackProgressed(@NotNull b backEvent) {
        Intrinsics.g(backEvent, "backEvent");
    }

    public void handleOnBackStarted(@NotNull b backEvent) {
        Intrinsics.g(backEvent, "backEvent");
    }

    public final boolean isEnabled() {
        return this.isEnabled;
    }

    public final void remove() {
        Iterator<T> it = this.cancellables.iterator();
        while (it.hasNext()) {
            ((c) it.next()).cancel();
        }
    }

    @JvmName
    public final void removeCancellable(@NotNull c cancellable) {
        Intrinsics.g(cancellable, "cancellable");
        this.cancellables.remove(cancellable);
    }

    public final void setEnabled(boolean z11) {
        this.isEnabled = z11;
        Function0<Unit> function0 = this.enabledChangedCallback;
        if (function0 != null) {
            function0.invoke();
        }
    }

    public final void setEnabledChangedCallback$activity_release(@Nullable Function0<Unit> function0) {
        this.enabledChangedCallback = function0;
    }
}
