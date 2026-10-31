package tj;

import android.text.TextPaint;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: c, reason: collision with root package name */
    public float f89390c;

    /* renamed from: e, reason: collision with root package name */
    public final WeakReference f89392e;

    /* renamed from: f, reason: collision with root package name */
    public yj.c f89393f;

    /* renamed from: a, reason: collision with root package name */
    public final TextPaint f89388a = new TextPaint(1);

    /* renamed from: b, reason: collision with root package name */
    public final lj.a f89389b = new lj.a(this, 1);

    /* renamed from: d, reason: collision with root package name */
    public boolean f89391d = true;

    public g(lj.d dVar) {
        this.f89392e = new WeakReference(null);
        this.f89392e = new WeakReference(dVar);
    }

    public final float a(String str) {
        if (!this.f89391d) {
            return this.f89390c;
        }
        TextPaint textPaint = this.f89388a;
        this.f89390c = str == null ? 0.0f : textPaint.measureText((CharSequence) str, 0, str.length());
        if (str != null) {
            float f11 = textPaint.getFontMetrics().ascent;
        }
        this.f89391d = false;
        return this.f89390c;
    }
}
