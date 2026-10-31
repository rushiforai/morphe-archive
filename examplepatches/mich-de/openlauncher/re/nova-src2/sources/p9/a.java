package p9;

import android.content.Context;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.android.launcher3.CellLayout;
import com.android.launcher3.dragndrop.DragLayer;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.ArrayList;
import kl.q0;
import o9.k;
import o9.n1;

/* loaded from: classes2.dex */
public abstract class a extends r5.b implements View.OnClickListener, View.OnHoverListener {
    public final Rect o;

    /* renamed from: p, reason: collision with root package name */
    public final int[] f82457p;

    /* renamed from: q, reason: collision with root package name */
    public final CellLayout f82458q;

    /* renamed from: r, reason: collision with root package name */
    public final Context f82459r;

    /* renamed from: s, reason: collision with root package name */
    public final e f82460s;

    /* renamed from: t, reason: collision with root package name */
    public final DragLayer f82461t;

    public a(CellLayout cellLayout) {
        super(cellLayout);
        this.o = new Rect();
        this.f82457p = new int[2];
        this.f82458q = cellLayout;
        Context context = cellLayout.getContext();
        this.f82459r = context;
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        this.f82460s = novaLauncher.f80004e0;
        this.f82461t = novaLauncher.P;
    }

    @Override // r5.b
    public final int k(float f11, float f12) {
        if (f11 < 0.0f || f12 < 0.0f) {
            return Integer.MIN_VALUE;
        }
        CellLayout cellLayout = this.f82458q;
        if (f11 > cellLayout.getMeasuredWidth() || f12 > cellLayout.getMeasuredHeight()) {
            return Integer.MIN_VALUE;
        }
        int paddingLeft = cellLayout.getPaddingLeft();
        int paddingTop = cellLayout.getPaddingTop();
        int i5 = (((int) f11) - paddingLeft) / cellLayout.f20893b;
        int[] iArr = this.f82457p;
        iArr[0] = i5;
        int i11 = (((int) f12) - paddingTop) / cellLayout.f20895c;
        iArr[1] = i11;
        int i12 = cellLayout.f20903g;
        int i13 = cellLayout.f20904h;
        if (i5 < 0) {
            iArr[0] = 0;
        }
        if (iArr[0] >= i12) {
            iArr[0] = i12 - 1;
        }
        if (i11 < 0) {
            iArr[1] = 0;
        }
        if (iArr[1] >= i13) {
            iArr[1] = i13 - 1;
        }
        return w((iArr[1] * cellLayout.f20903g) + iArr[0]);
    }

    @Override // r5.b
    public final void l(ArrayList arrayList) {
        CellLayout cellLayout = this.f82458q;
        int i5 = cellLayout.f20903g * cellLayout.f20904h;
        for (int i11 = 0; i11 < i5; i11++) {
            if (w(i11) == i11) {
                arrayList.add(Integer.valueOf(i11));
            }
        }
    }

    @Override // r5.b
    public final boolean n(int i5, int i11) {
        if (i11 != 16 || i5 == Integer.MIN_VALUE) {
            return false;
        }
        String strT = t(i5);
        this.f82460s.e(this.f82458q, u(i5), strT);
        return true;
    }

    @Override // r5.b
    public final void o(int i5, AccessibilityEvent accessibilityEvent) {
        if (i5 == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("Invalid virtual view id");
        }
        accessibilityEvent.setContentDescription(this.f82459r.getString(2132017215));
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        n(this.f85502k, 16);
    }

    @Override // android.view.View.OnHoverListener
    public final boolean onHover(View view, MotionEvent motionEvent) {
        return j(motionEvent);
    }

    @Override // r5.b
    public final void q(int i5, b5.g gVar) {
        if (i5 == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("Invalid virtual view id");
        }
        gVar.C(v(i5));
        gVar.f17551a.setBoundsInParent(u(i5));
        int[] iArr = this.f82457p;
        iArr[1] = 0;
        iArr[0] = 0;
        float fG = this.f82461t.g(this.f82458q, iArr);
        int i11 = iArr[0];
        Rect rect = this.o;
        rect.left = ((int) (r7.left * fG)) + i11;
        rect.right = i11 + ((int) (r7.right * fG));
        int i12 = iArr[1];
        rect.top = ((int) (r7.top * fG)) + i12;
        rect.bottom = i12 + ((int) (r7.bottom * fG));
        gVar.v(rect);
        gVar.a(16);
        gVar.z(true);
        gVar.I(true);
    }

    public abstract String t(int i5);

    public final Rect u(int i5) {
        CellLayout cellLayout = this.f82458q;
        int i11 = cellLayout.f20903g;
        int i12 = i5 % i11;
        int i13 = i5 / i11;
        ga.e eVar = (ga.e) this.f82460s.f82474c.f19045c;
        n30.b bVar = eVar.f57295g;
        n30.b bVar2 = eVar.f57296h;
        cellLayout.getClass();
        cellLayout.j(i12, i13, bVar.c(cellLayout), bVar2.c(cellLayout), this.o);
        return this.o;
    }

    public abstract String v(int i5);

    public abstract int w(int i5);
}
