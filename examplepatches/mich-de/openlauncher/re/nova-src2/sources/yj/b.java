package yj;

import android.content.Context;
import android.graphics.Typeface;
import android.text.TextPaint;
import ps.i0;

/* loaded from: classes3.dex */
public final class b extends i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f97349a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ TextPaint f97350b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i0 f97351c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c f97352d;

    public b(c cVar, Context context, TextPaint textPaint, i0 i0Var) {
        this.f97352d = cVar;
        this.f97349a = context;
        this.f97350b = textPaint;
        this.f97351c = i0Var;
    }

    @Override // ps.i0
    public final void l(int i5) {
        this.f97351c.l(i5);
    }

    @Override // ps.i0
    public final void m(Typeface typeface, boolean z11) {
        this.f97352d.g(this.f97349a, this.f97350b, typeface);
        this.f97351c.m(typeface, z11);
    }
}
