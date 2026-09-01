package defpackage;

import android.os.Handler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d2a implements iy6 {
    public static final d2a i = new d2a();
    public int a;
    public int b;
    public Handler e;
    public boolean c = true;
    public boolean d = true;
    public final ky6 f = new ky6(this, true);
    public final b2a g = new b2a(0, this);
    public final pkf h = new pkf(this);

    public final void a() {
        int i2 = this.b + 1;
        this.b = i2;
        if (i2 == 1) {
            if (this.c) {
                this.f.e(ux6.ON_RESUME);
                this.c = false;
            } else {
                Handler handler = this.e;
                handler.getClass();
                handler.removeCallbacks(this.g);
            }
        }
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return this.f;
    }
}
