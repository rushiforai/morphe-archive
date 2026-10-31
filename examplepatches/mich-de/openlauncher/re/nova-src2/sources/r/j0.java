package r;

import android.graphics.Typeface;
import android.os.Build;
import android.widget.TextView;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class j0 extends q4.b {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f84758h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f84759i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ WeakReference f84760j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ n0 f84761k;

    public j0(n0 n0Var, int i5, int i11, WeakReference weakReference) {
        this.f84761k = n0Var;
        this.f84758h = i5;
        this.f84759i = i11;
        this.f84760j = weakReference;
    }

    @Override // q4.b
    public final void f(int i5) {
    }

    @Override // q4.b
    public final void g(Typeface typeface) {
        int i5;
        if (Build.VERSION.SDK_INT >= 28 && (i5 = this.f84758h) != -1) {
            typeface = m0.a(typeface, i5, (this.f84759i & 2) != 0);
        }
        Typeface typeface2 = typeface;
        n0 n0Var = this.f84761k;
        if (n0Var.f84826m) {
            n0Var.f84825l = typeface2;
            TextView textView = (TextView) this.f84760j.get();
            if (textView != null) {
                if (textView.isAttachedToWindow()) {
                    textView.post(new androidx.recyclerview.widget.l0(textView, false, typeface2, n0Var.f84823j, 3));
                } else {
                    textView.setTypeface(typeface2, n0Var.f84823j);
                }
            }
        }
    }
}
