package yj;

import android.graphics.Typeface;
import ps.i0;

/* loaded from: classes3.dex */
public final class a extends i0 {

    /* renamed from: a, reason: collision with root package name */
    public final Typeface f97346a;

    /* renamed from: b, reason: collision with root package name */
    public final tj.a f97347b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97348c;

    public a(tj.a aVar, Typeface typeface) {
        this.f97346a = typeface;
        this.f97347b = aVar;
    }

    @Override // ps.i0
    public final void l(int i5) {
        if (this.f97348c) {
            return;
        }
        this.f97347b.a(this.f97346a);
    }

    @Override // ps.i0
    public final void m(Typeface typeface, boolean z11) {
        if (this.f97348c) {
            return;
        }
        this.f97347b.a(typeface);
    }
}
