package xf;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.view.Surface;
import android.view.WindowManager;
import t5.d0;
import wf.v;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final c f95808a;

    /* renamed from: b, reason: collision with root package name */
    public final k f95809b;

    /* renamed from: c, reason: collision with root package name */
    public final m f95810c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f95811d;

    /* renamed from: e, reason: collision with root package name */
    public Surface f95812e;

    /* renamed from: f, reason: collision with root package name */
    public float f95813f;

    /* renamed from: g, reason: collision with root package name */
    public float f95814g;

    /* renamed from: h, reason: collision with root package name */
    public float f95815h;

    /* renamed from: i, reason: collision with root package name */
    public float f95816i;

    /* renamed from: j, reason: collision with root package name */
    public int f95817j;

    /* renamed from: k, reason: collision with root package name */
    public long f95818k;

    /* renamed from: l, reason: collision with root package name */
    public long f95819l;

    /* renamed from: m, reason: collision with root package name */
    public long f95820m;
    public long n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public long f95821p;

    /* renamed from: q, reason: collision with root package name */
    public long f95822q;

    /* JADX WARN: Removed duplicated region for block: B:14:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public n(Context context) {
        k lVar;
        DisplayManager displayManager;
        c cVar = new c();
        cVar.f95774a = new b();
        cVar.f95775b = new b();
        cVar.f95777d = -9223372036854775807L;
        this.f95808a = cVar;
        if (context != null) {
            Context applicationContext = context.getApplicationContext();
            lVar = (v.f94376a < 17 || (displayManager = (DisplayManager) applicationContext.getSystemService("display")) == null) ? null : new l(displayManager);
            if (lVar == null) {
                WindowManager windowManager = (WindowManager) applicationContext.getSystemService("window");
                lVar = windowManager != null ? new d0(windowManager, 25) : null;
            }
        }
        this.f95809b = lVar;
        this.f95810c = lVar != null ? m.f95803e : null;
        this.f95818k = -9223372036854775807L;
        this.f95819l = -9223372036854775807L;
        this.f95813f = -1.0f;
        this.f95816i = 1.0f;
        this.f95817j = 0;
    }

    public final void a() {
        Surface surface;
        if (v.f94376a < 30 || (surface = this.f95812e) == null || this.f95817j == Integer.MIN_VALUE || this.f95815h == 0.0f) {
            return;
        }
        this.f95815h = 0.0f;
        j.a(surface, 0.0f);
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:45:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b() {
        float f11;
        float f12;
        if (v.f94376a < 30 || this.f95812e == null) {
            return;
        }
        c cVar = this.f95808a;
        if (!cVar.f95774a.a()) {
            f11 = this.f95813f;
        } else if (cVar.f95774a.a()) {
            f11 = (float) (1.0E9d / (cVar.f95774a.f95770e != 0 ? r2.f95771f / r4 : 0L));
        } else {
            f11 = -1.0f;
        }
        float f13 = this.f95814g;
        if (f11 == f13) {
            return;
        }
        if (f11 == -1.0f || f13 == -1.0f) {
            if (f11 == -1.0f && cVar.f95778e < 30) {
                return;
            }
        } else if (cVar.f95774a.a()) {
            if ((cVar.f95774a.a() ? cVar.f95774a.f95771f : -9223372036854775807L) >= 5000000000L) {
                f12 = 0.02f;
            }
            if (Math.abs(f11 - this.f95814g) < f12) {
            }
        } else {
            f12 = 1.0f;
            if (Math.abs(f11 - this.f95814g) < f12) {
                return;
            }
        }
        this.f95814g = f11;
        c(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(boolean z11) {
        Surface surface;
        float f11;
        if (v.f94376a < 30 || (surface = this.f95812e) == null || this.f95817j == Integer.MIN_VALUE) {
            return;
        }
        if (this.f95811d) {
            float f12 = this.f95814g;
            f11 = f12 != -1.0f ? f12 * this.f95816i : 0.0f;
        }
        if (z11 || this.f95815h != f11) {
            this.f95815h = f11;
            j.a(surface, f11);
        }
    }
}
