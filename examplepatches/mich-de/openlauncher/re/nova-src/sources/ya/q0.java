package ya;

import android.graphics.Insets;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.WindowInsets;
import android.view.WindowMetrics;
import java.util.Objects;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f97206a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f97207b;

    /* renamed from: c, reason: collision with root package name */
    public final Point f97208c;

    public q0(Rect rect, Rect rect2) {
        this.f97206a = rect;
        this.f97207b = rect2;
        this.f97208c = new Point((rect.width() - rect2.left) - rect2.right, (rect.height() - rect2.top) - rect2.bottom);
    }

    public static q0 a(WindowMetrics windowMetrics) {
        Insets insets = windowMetrics.getWindowInsets().getInsets(WindowInsets.Type.systemBars());
        return new q0(windowMetrics.getBounds(), new Rect(insets.left, insets.top, insets.right, insets.bottom));
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return q0Var.f97206a.equals(this.f97206a) && q0Var.f97207b.equals(this.f97207b);
    }

    public final int hashCode() {
        return Objects.hash(this.f97206a, this.f97207b);
    }

    public final String toString() {
        return "WindowBounds{bounds=" + this.f97206a + ", insets=" + this.f97207b + ", availableSize=" + this.f97208c + AbstractJsonLexerKt.END_OBJ;
    }

    public q0(int i5, int i11, int i12, int i13) {
        this.f97206a = new Rect(0, 0, i5, i11);
        this.f97208c = new Point(i12, i13);
        this.f97207b = new Rect(0, 0, i5 - i12, i11 - i13);
    }
}
