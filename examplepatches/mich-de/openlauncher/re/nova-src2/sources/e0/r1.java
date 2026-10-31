package e0;

import android.widget.Magnifier;

/* loaded from: classes2.dex */
public class r1 implements p1 {

    /* renamed from: a, reason: collision with root package name */
    public final Magnifier f50115a;

    public r1(Magnifier magnifier) {
        this.f50115a = magnifier;
    }

    @Override // e0.p1
    public void a(float f11, long j11, long j12) {
        this.f50115a.show(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)));
    }

    public final void b() {
        this.f50115a.dismiss();
    }

    public final long c() {
        return (this.f50115a.getHeight() & 4294967295L) | (this.f50115a.getWidth() << 32);
    }

    public final void d() {
        this.f50115a.update();
    }
}
