package g;

import android.window.BackEvent;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f56394a = new a();

    @NotNull
    public final BackEvent a(float f11, float f12, float f13, int i5) {
        return new BackEvent(f11, f12, f13, i5);
    }

    public final float b(@NotNull BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        return backEvent.getProgress();
    }

    public final int c(@NotNull BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        return backEvent.getSwipeEdge();
    }

    public final float d(@NotNull BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        return backEvent.getTouchX();
    }

    public final float e(@NotNull BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        return backEvent.getTouchY();
    }
}
