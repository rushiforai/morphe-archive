package e0;

import android.view.View;
import android.widget.Magnifier;

/* loaded from: classes2.dex */
public final class s1 implements q1 {

    /* renamed from: a, reason: collision with root package name */
    public static final s1 f50124a = new s1();

    @Override // e0.q1
    public final p1 a(View view, boolean z11, long j11, float f11, float f12, boolean z12, y3.c cVar, float f13) {
        return new r1(new Magnifier(view));
    }

    @Override // e0.q1
    public final boolean b() {
        return false;
    }
}
