package androidx.fragment.app;

import android.animation.AnimatorSet;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public static final k f14600a = new k();

    public final void a(@NotNull AnimatorSet animatorSet) {
        Intrinsics.g(animatorSet, "animatorSet");
        animatorSet.reverse();
    }

    public final void b(@NotNull AnimatorSet animatorSet, long j11) {
        Intrinsics.g(animatorSet, "animatorSet");
        animatorSet.setCurrentPlayTime(j11);
    }
}
