package r;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.appcompat.widget.Toolbar;

/* loaded from: classes2.dex */
public final class l2 {

    /* renamed from: a, reason: collision with root package name */
    public final Toolbar f84789a;

    /* renamed from: b, reason: collision with root package name */
    public int f84790b;

    /* renamed from: c, reason: collision with root package name */
    public View f84791c;

    /* renamed from: d, reason: collision with root package name */
    public final Drawable f84792d;

    /* renamed from: e, reason: collision with root package name */
    public final Drawable f84793e;

    /* renamed from: f, reason: collision with root package name */
    public Drawable f84794f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f84795g;

    /* renamed from: h, reason: collision with root package name */
    public CharSequence f84796h;

    /* renamed from: i, reason: collision with root package name */
    public CharSequence f84797i;

    /* renamed from: j, reason: collision with root package name */
    public final CharSequence f84798j;

    /* renamed from: k, reason: collision with root package name */
    public Window.Callback f84799k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f84800l;

    /* renamed from: m, reason: collision with root package name */
    public i f84801m;
    public final int n;
    public final Drawable o;

    public l2(Toolbar toolbar, boolean z11) {
        Drawable drawable;
        this.n = 0;
        this.f84789a = toolbar;
        CharSequence charSequence = toolbar.f13821x;
        this.f84796h = charSequence;
        this.f84797i = toolbar.f13822y;
        this.f84795g = charSequence != null;
        s sVar = toolbar.f13803d;
        this.f84794f = sVar != null ? sVar.getDrawable() : null;
        x7.u uVarR = x7.u.r(toolbar.getContext(), null, l.a.f72888a, 2130968585);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        int i5 = 15;
        this.o = uVarR.l(15);
        if (z11) {
            CharSequence text = typedArray.getText(27);
            if (!TextUtils.isEmpty(text)) {
                this.f84795g = true;
                this.f84796h = text;
                if ((this.f84790b & 8) != 0) {
                    toolbar.A(text);
                    if (this.f84795g) {
                        a5.a1.l(toolbar.getRootView(), text);
                    }
                }
            }
            CharSequence text2 = typedArray.getText(25);
            if (!TextUtils.isEmpty(text2)) {
                c(text2);
            }
            Drawable drawableL = uVarR.l(20);
            if (drawableL != null) {
                this.f84793e = drawableL;
                e();
            }
            Drawable drawableL2 = uVarR.l(17);
            if (drawableL2 != null) {
                this.f84792d = drawableL2;
                e();
            }
            if (this.f84794f == null && (drawable = this.o) != null) {
                this.f84794f = drawable;
                if ((this.f84790b & 4) != 0) {
                    toolbar.x(drawable);
                } else {
                    toolbar.x(null);
                }
            }
            b(typedArray.getInt(10, 0));
            int resourceId = typedArray.getResourceId(9, 0);
            if (resourceId != 0) {
                a(LayoutInflater.from(toolbar.getContext()).inflate(resourceId, (ViewGroup) toolbar, false));
                b(this.f84790b | 16);
            }
            int layoutDimension = typedArray.getLayoutDimension(13, 0);
            if (layoutDimension > 0) {
                ViewGroup.LayoutParams layoutParams = toolbar.getLayoutParams();
                layoutParams.height = layoutDimension;
                toolbar.setLayoutParams(layoutParams);
            }
            int dimensionPixelOffset = typedArray.getDimensionPixelOffset(7, -1);
            int dimensionPixelOffset2 = typedArray.getDimensionPixelOffset(3, -1);
            if (dimensionPixelOffset >= 0 || dimensionPixelOffset2 >= 0) {
                int iMax = Math.max(dimensionPixelOffset, 0);
                int iMax2 = Math.max(dimensionPixelOffset2, 0);
                toolbar.c();
                toolbar.f13817t.a(iMax, iMax2);
            }
            int resourceId2 = typedArray.getResourceId(28, 0);
            if (resourceId2 != 0) {
                Context context = toolbar.getContext();
                toolbar.f13811l = resourceId2;
                AppCompatTextView appCompatTextView = toolbar.f13801b;
                if (appCompatTextView != null) {
                    appCompatTextView.setTextAppearance(context, resourceId2);
                }
            }
            int resourceId3 = typedArray.getResourceId(26, 0);
            if (resourceId3 != 0) {
                Context context2 = toolbar.getContext();
                toolbar.f13812m = resourceId3;
                AppCompatTextView appCompatTextView2 = toolbar.f13802c;
                if (appCompatTextView2 != null) {
                    appCompatTextView2.setTextAppearance(context2, resourceId3);
                }
            }
            int resourceId4 = typedArray.getResourceId(22, 0);
            if (resourceId4 != 0 && toolbar.f13810k != resourceId4) {
                toolbar.f13810k = resourceId4;
                if (resourceId4 == 0) {
                    toolbar.f13809j = toolbar.getContext();
                } else {
                    toolbar.f13809j = new ContextThemeWrapper(toolbar.getContext(), resourceId4);
                }
            }
        } else {
            s sVar2 = toolbar.f13803d;
            if ((sVar2 != null ? sVar2.getDrawable() : null) != null) {
                s sVar3 = toolbar.f13803d;
                this.o = sVar3 != null ? sVar3.getDrawable() : null;
            } else {
                i5 = 11;
            }
            this.f84790b = i5;
        }
        uVarR.s();
        if (2132017163 != this.n) {
            this.n = 2132017163;
            s sVar4 = toolbar.f13803d;
            if (TextUtils.isEmpty(sVar4 != null ? sVar4.getContentDescription() : null)) {
                int i11 = this.n;
                this.f84798j = i11 == 0 ? null : toolbar.getContext().getString(i11);
                d();
            }
        }
        s sVar5 = toolbar.f13803d;
        this.f84798j = sVar5 != null ? sVar5.getContentDescription() : null;
        toolbar.y(new k2(this));
    }

    public final void a(View view) {
        View view2 = this.f84791c;
        Toolbar toolbar = this.f84789a;
        if (view2 != null && (this.f84790b & 16) != 0) {
            toolbar.removeView(view2);
        }
        this.f84791c = view;
        if (view == null || (this.f84790b & 16) == 0) {
            return;
        }
        toolbar.addView(view);
    }

    public final void b(int i5) {
        View view;
        int i11 = this.f84790b ^ i5;
        this.f84790b = i5;
        if (i11 != 0) {
            int i12 = i11 & 4;
            Toolbar toolbar = this.f84789a;
            if (i12 != 0) {
                if ((i5 & 4) != 0) {
                    d();
                }
                if ((this.f84790b & 4) != 0) {
                    Drawable drawable = this.f84794f;
                    if (drawable == null) {
                        drawable = this.o;
                    }
                    toolbar.x(drawable);
                } else {
                    toolbar.x(null);
                }
            }
            if ((i11 & 3) != 0) {
                e();
            }
            if ((i11 & 8) != 0) {
                if ((i5 & 8) != 0) {
                    toolbar.A(this.f84796h);
                    toolbar.z(this.f84797i);
                } else {
                    toolbar.A(null);
                    toolbar.z(null);
                }
            }
            if ((i11 & 16) == 0 || (view = this.f84791c) == null) {
                return;
            }
            if ((i5 & 16) != 0) {
                toolbar.addView(view);
            } else {
                toolbar.removeView(view);
            }
        }
    }

    public final void c(CharSequence charSequence) {
        this.f84797i = charSequence;
        if ((this.f84790b & 8) != 0) {
            this.f84789a.z(charSequence);
        }
    }

    public final void d() {
        if ((this.f84790b & 4) != 0) {
            boolean zIsEmpty = TextUtils.isEmpty(this.f84798j);
            Toolbar toolbar = this.f84789a;
            if (!zIsEmpty) {
                toolbar.w(this.f84798j);
            } else {
                int i5 = this.n;
                toolbar.w(i5 != 0 ? toolbar.getContext().getText(i5) : null);
            }
        }
    }

    public final void e() {
        Drawable drawable;
        int i5 = this.f84790b;
        if ((i5 & 2) == 0) {
            drawable = null;
        } else if ((i5 & 1) == 0 || (drawable = this.f84793e) == null) {
            drawable = this.f84792d;
        }
        this.f84789a.v(drawable);
    }
}
