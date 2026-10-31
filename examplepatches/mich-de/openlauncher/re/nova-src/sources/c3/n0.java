package c3;

import android.view.View;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final n0 f19385a = new n0();

    public final void a(@NotNull View view, boolean z11) {
        if (z11) {
            view.setContentSensitivity(1);
        } else {
            view.setContentSensitivity(0);
        }
    }
}
