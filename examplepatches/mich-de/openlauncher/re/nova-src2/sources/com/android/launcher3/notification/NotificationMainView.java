package com.android.launcher3.notification;

import aa.p;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.LinearLayout;
import android.widget.TextView;
import bh.g;
import bm.t;
import com.teslacoilsw.launcher.NovaLauncher;
import ea.d;
import g30.b;
import ga.e;
import ha.c;
import ha.h;
import kl.q0;
import o9.g3;
import o9.k;
import o9.n1;
import r4.a;

@TargetApi(24)
/* loaded from: classes2.dex */
public class NotificationMainView extends LinearLayout {
    public static final e n = new e();

    /* renamed from: a, reason: collision with root package name */
    public c f21186a;

    /* renamed from: b, reason: collision with root package name */
    public int f21187b;

    /* renamed from: c, reason: collision with root package name */
    public TextView f21188c;

    /* renamed from: d, reason: collision with root package name */
    public TextView f21189d;

    /* renamed from: e, reason: collision with root package name */
    public View f21190e;

    /* renamed from: f, reason: collision with root package name */
    public View f21191f;

    /* renamed from: g, reason: collision with root package name */
    public View f21192g;

    /* renamed from: h, reason: collision with root package name */
    public TextView f21193h;

    /* renamed from: i, reason: collision with root package name */
    public final Rect f21194i;

    /* renamed from: j, reason: collision with root package name */
    public final int f21195j;

    /* renamed from: k, reason: collision with root package name */
    public final int f21196k;

    /* renamed from: l, reason: collision with root package name */
    public final int f21197l;

    /* renamed from: m, reason: collision with root package name */
    public final GradientDrawable f21198m;

    public NotificationMainView(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0, 0);
        this.f21194i = new Rect();
        float fM = g.M(context, 8);
        GradientDrawable gradientDrawable = new GradientDrawable();
        this.f21198m = gradientDrawable;
        gradientDrawable.setColor(p.b(context, 2130969823));
        gradientDrawable.setCornerRadius(fM);
        setBackground(gradientDrawable);
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131165365);
        this.f21197l = dimensionPixelSize;
        setElevation(dimensionPixelSize);
        this.f21196k = getResources().getDimensionPixelSize(2131166291);
        this.f21195j = getResources().getDimensionPixelSize(2131166299);
        setClipToOutline(true);
        setOutlineProvider(new h(this, fM, 0));
    }

    public final void a(c cVar) {
        this.f21186a = cVar;
        if (cVar == null) {
            return;
        }
        ha.g gVarA = ha.g.a();
        if (gVarA != null) {
            gVarA.setNotificationsShown(new String[]{this.f21186a.f59567b});
        }
        c cVar2 = this.f21186a;
        CharSequence charSequence = cVar2.f59568c;
        CharSequence charSequence2 = cVar2.f59569d;
        if (TextUtils.isEmpty(charSequence) || TextUtils.isEmpty(charSequence2)) {
            this.f21188c.setMaxLines(2);
            this.f21188c.setText(TextUtils.isEmpty(charSequence) ? charSequence2.toString() : charSequence.toString());
            this.f21189d.setVisibility(8);
        } else {
            this.f21188c.setText(charSequence.toString());
            this.f21189d.setText(charSequence2.toString());
        }
        View view = this.f21190e;
        c cVar3 = this.f21186a;
        Context context = getContext();
        int iJ = a.j(this.f21187b, ((b) b.f57016l.h(getContext())).f57020d);
        Drawable drawableMutate = cVar3.f59574i;
        if (!cVar3.f59576k) {
            int color = cVar3.f59575j;
            if (color == 0) {
                color = context.getColor(2131100650);
            }
            cVar3.f59575j = v30.e.e(color, iJ);
            drawableMutate = drawableMutate.mutate();
            drawableMutate.setTintList(null);
            drawableMutate.setTint(cVar3.f59575j);
        }
        view.setBackground(drawableMutate);
        c cVar4 = this.f21186a;
        if (cVar4.f59570e != null) {
            setOnClickListener(cVar4);
            setOnLongClickListener(this.f21186a);
        }
        setTag(n);
    }

    public final void b() {
        Context context = getContext();
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        t tVar = novaLauncher.f80005f0;
        String str = this.f21186a.f59567b;
        tVar.getClass();
        ha.g gVarA = ha.g.a();
        if (gVarA != null) {
            gVarA.f59583a.obtainMessage(4, str).sendToTarget();
        }
        novaLauncher.O().a().b(d.LAUNCHER_NOTIFICATION_DISMISSED);
    }

    public final void c(float f11) {
        float fAbs = Math.abs(f11);
        int width = getWidth();
        int i5 = this.f21197l;
        if (fAbs < 0.4f) {
            setAlpha(1.0f);
            e(1.0f);
            setElevation(i5);
        } else if (fAbs < 0.6f) {
            setAlpha(1.0f);
            LinearInterpolator linearInterpolator = s9.k.f86788a;
            e(g3.r(fAbs, 0.4f, 0.6f, 1.0f, 0.0f, linearInterpolator));
            setElevation(g3.r(fAbs, 0.4f, 0.6f, i5, 0.0f, linearInterpolator));
        } else {
            setAlpha(g3.r(fAbs, 0.6f, 0.7f, 1.0f, 0.0f, s9.k.f86788a));
            e(0.0f);
            setElevation(0.0f);
        }
        setTranslationX(width * f11);
    }

    public final void d(float f11) {
        float fAbs = Math.abs(f11);
        if (fAbs < 0.3f) {
            setAlpha(0.0f);
            e(0.0f);
            setElevation(0.0f);
        } else if (fAbs < 0.5f) {
            setAlpha(g3.r(fAbs, 0.3f, 0.5f, 0.0f, 1.0f, s9.k.f86788a));
            e(0.0f);
            setElevation(0.0f);
        } else {
            setAlpha(1.0f);
            e(fAbs > 0.6f ? 1.0f : g3.r(fAbs, 0.5f, 0.6f, 0.0f, 1.0f, s9.k.f86788a));
            setElevation(g3.r(fAbs, 0.5f, 1.0f, 0.0f, this.f21197l, s9.k.f86788a));
        }
        int width = (int) (getWidth() * fAbs);
        int i5 = this.f21195j;
        int iR = (int) (fAbs > 0.7f ? g3.r(fAbs, 0.7f, 1.0f, i5, 0.0f, s9.k.f86788a) : i5);
        Rect rect = this.f21194i;
        if (f11 < 0.0f) {
            rect.left = Math.max(0, (getWidth() - width) + iR);
            rect.right = getWidth();
        } else {
            rect.right = Math.min(getWidth(), width - iR);
            rect.left = 0;
        }
        float f12 = (1.0f - fAbs) * this.f21196k;
        if (f11 >= 0.0f) {
            f12 = -f12;
        }
        this.f21191f.setTranslationX(f12);
        this.f21192g.setTranslationX(f12);
        invalidateOutline();
    }

    public final void e(float f11) {
        this.f21191f.setAlpha(f11);
        this.f21192g.setAlpha(f11);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewGroup viewGroup = (ViewGroup) getParent();
        if (!(viewGroup instanceof ka.c)) {
            viewGroup = (ViewGroup) viewGroup.getParent();
        }
        e10.n1 n1Var = ((ka.c) viewGroup).L;
        int i5 = n1Var.f51699k;
        this.f21187b = i5;
        if (i5 == 0) {
            this.f21187b = n1Var.f51690b;
        }
        if (this.f21187b == 0) {
            this.f21187b = -65281;
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        ViewGroup viewGroup = (ViewGroup) findViewById(2131429007);
        this.f21188c = (TextView) viewGroup.findViewById(2131429031);
        this.f21189d = (TextView) viewGroup.findViewById(2131428999);
        this.f21190e = findViewById(2131428589);
        this.f21193h = (TextView) findViewById(2131428459);
        this.f21191f = findViewById(2131428131);
        this.f21192g = findViewById(2131428303);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        this.f21194i.set(0, 0, getWidth(), getHeight());
        invalidateOutline();
    }
}
