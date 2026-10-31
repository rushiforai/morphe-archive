package c3;

import android.content.Context;
import android.view.PointerIcon;
import android.view.View;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes2.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final r0 f19414a = new r0();

    public static PointerIcon b(Context context, v2.q qVar) {
        return qVar instanceof v2.a ? PointerIcon.getSystemIcon(context, ((v2.a) qVar).f91908b) : PointerIcon.getSystemIcon(context, 1000);
    }

    public final void a(@NotNull View view, @Nullable v2.q qVar) {
        PointerIcon pointerIconB = b(view.getContext(), qVar);
        if (Intrinsics.b(view.getPointerIcon(), pointerIconB)) {
            return;
        }
        view.setPointerIcon(pointerIconB);
    }
}
