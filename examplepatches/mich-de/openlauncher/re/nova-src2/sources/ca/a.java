package ca;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import o9.g3;
import o9.s2;

/* loaded from: classes.dex */
public final class a extends e implements View.OnFocusChangeListener {

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ int f19901r;

    /* renamed from: s, reason: collision with root package name */
    public final Object f19902s;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(View view) {
        this(view, (byte) 0);
        this.f19901r = 1;
        this.f19902s = view;
    }

    @Override // ca.e
    public boolean d(Object obj) {
        switch (this.f19901r) {
        }
        return ((View) obj).isAttachedToWindow();
    }

    @Override // ca.e
    public final void e(Object obj, Rect rect) {
        switch (this.f19901r) {
            case 0:
                float[] fArr = (float[]) this.f19902s;
                fArr[0] = 0.0f;
                fArr[1] = 0.0f;
                g3.i((View) obj, this.f19912a, fArr, true, false);
                float f11 = fArr[0];
                rect.set((int) f11, (int) fArr[1], (int) (f11 + r7.getWidth()), (int) (fArr[1] + r7.getHeight()));
                break;
            default:
                View view = (View) obj;
                rect.left = 0;
                rect.top = 0;
                f(view, rect);
                rect.left = (int) ((((1.0f - view.getScaleX()) * view.getWidth()) / 2.0f) + rect.left);
                rect.top = (int) ((((1.0f - view.getScaleY()) * view.getHeight()) / 2.0f) + rect.top);
                rect.right = rect.left + ((int) (view.getScaleX() * view.getWidth()));
                rect.bottom = rect.top + ((int) (view.getScaleY() * view.getHeight()));
                break;
        }
    }

    public void f(View view, Rect rect) {
        View view2 = (View) view.getParent();
        rect.left = (int) (view.getX() + rect.left);
        rect.top = (int) (view.getY() + rect.top);
        if (view2 != ((View) this.f19902s)) {
            if (view2 instanceof s2) {
                s2 s2Var = (s2) view2;
                rect.left -= s2Var.N(s2Var.indexOfChild(view));
            }
            f(view2, rect);
        }
    }

    public a(View view, byte b11) {
        super(view, view.getResources().getColor(2131099924));
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(ViewGroup viewGroup) {
        this(viewGroup, (byte) 0);
        this.f19901r = 0;
        this.f19902s = new float[2];
    }
}
