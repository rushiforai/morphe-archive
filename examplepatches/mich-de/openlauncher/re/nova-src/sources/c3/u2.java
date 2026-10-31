package c3;

import android.view.MotionEvent;
import androidx.compose.ui.node.LayoutNode;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class u2 {

    /* renamed from: a, reason: collision with root package name */
    public static final u2 f19443a = new u2();

    public final boolean a(@NotNull MotionEvent motionEvent, int i5) {
        return (Float.floatToRawIntBits(motionEvent.getRawX(i5)) & LayoutNode.NotPlacedPlaceOrder) < 2139095040 && (Float.floatToRawIntBits(motionEvent.getRawY(i5)) & LayoutNode.NotPlacedPlaceOrder) < 2139095040;
    }
}
