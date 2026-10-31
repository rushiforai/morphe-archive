package r60;

import android.graphics.Paint;
import l60.j;

/* loaded from: classes4.dex */
public final class f extends j {
    @Override // l60.j
    public final int a(Paint paint) {
        int i5 = this.f74776c;
        return i5 < 0 ? (int) (paint.getStrokeWidth() + 0.5f) : i5;
    }

    @Override // l60.j
    public final int b() {
        return this.f74774a;
    }
}
