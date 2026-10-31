package androidx.fragment.app;

import android.animation.AnimatorSet;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f14597a = new j();

    public final long a(@NotNull AnimatorSet animatorSet) {
        Intrinsics.g(animatorSet, "animatorSet");
        return animatorSet.getTotalDuration();
    }
}
