package hj;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import bk.g;
import bk.j;
import bk.u;
import com.google.android.material.button.MaterialButton;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final MaterialButton f59863a;

    /* renamed from: b, reason: collision with root package name */
    public j f59864b;

    /* renamed from: c, reason: collision with root package name */
    public int f59865c;

    /* renamed from: d, reason: collision with root package name */
    public int f59866d;

    /* renamed from: e, reason: collision with root package name */
    public int f59867e;

    /* renamed from: f, reason: collision with root package name */
    public int f59868f;

    /* renamed from: g, reason: collision with root package name */
    public int f59869g;

    /* renamed from: h, reason: collision with root package name */
    public int f59870h;

    /* renamed from: i, reason: collision with root package name */
    public PorterDuff.Mode f59871i;

    /* renamed from: j, reason: collision with root package name */
    public ColorStateList f59872j;

    /* renamed from: k, reason: collision with root package name */
    public ColorStateList f59873k;

    /* renamed from: l, reason: collision with root package name */
    public ColorStateList f59874l;

    /* renamed from: m, reason: collision with root package name */
    public g f59875m;

    /* renamed from: q, reason: collision with root package name */
    public boolean f59877q;

    /* renamed from: s, reason: collision with root package name */
    public RippleDrawable f59879s;

    /* renamed from: t, reason: collision with root package name */
    public int f59880t;
    public boolean n = false;
    public boolean o = false;

    /* renamed from: p, reason: collision with root package name */
    public boolean f59876p = false;

    /* renamed from: r, reason: collision with root package name */
    public boolean f59878r = true;

    public a(MaterialButton materialButton, j jVar) {
        this.f59863a = materialButton;
        this.f59864b = jVar;
    }

    public final u a() {
        RippleDrawable rippleDrawable = this.f59879s;
        if (rippleDrawable == null || rippleDrawable.getNumberOfLayers() <= 1) {
            return null;
        }
        return this.f59879s.getNumberOfLayers() > 2 ? (u) this.f59879s.getDrawable(2) : (u) this.f59879s.getDrawable(1);
    }

    public final g b(boolean z11) {
        RippleDrawable rippleDrawable = this.f59879s;
        if (rippleDrawable == null || rippleDrawable.getNumberOfLayers() <= 0) {
            return null;
        }
        return (g) ((LayerDrawable) ((InsetDrawable) this.f59879s.getDrawable(0)).getDrawable()).getDrawable(!z11 ? 1 : 0);
    }

    public final void c(j jVar) {
        this.f59864b = jVar;
        if (b(false) != null) {
            b(false).c(jVar);
        }
        if (b(true) != null) {
            b(true).c(jVar);
        }
        if (a() != null) {
            a().c(jVar);
        }
    }
}
