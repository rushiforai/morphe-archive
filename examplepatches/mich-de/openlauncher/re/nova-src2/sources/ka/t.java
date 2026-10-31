package ka;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import com.android.launcher3.shortcuts.DeepShortcutTextView;
import com.android.launcher3.util.InstantAppResolver;
import o9.n1;
import ya.g0;
import ya.l0;

/* loaded from: classes2.dex */
public abstract class t extends ga.e implements View.OnClickListener {

    /* renamed from: v, reason: collision with root package name */
    public static final p f71303v = new r() { // from class: ka.p

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ int f71301a = 2;

        @Override // ka.r
        public final t a(Context context, ga.e eVar) {
            switch (this.f71301a) {
                case 0:
                    n1 n1Var = (n1) context;
                    if ((eVar instanceof ga.c) || eVar.i() == null || n1Var.f80005f0.p(new g0(eVar.i().getPackageName(), eVar.o)).isEmpty()) {
                        return null;
                    }
                    return new s(2131231870, 2132020397, n1Var, eVar);
                case 1:
                    o9.l lVar = (o9.l) context;
                    if (eVar instanceof ga.c) {
                        return null;
                    }
                    return new q(2131231595, 2132017505, lVar, eVar, 0);
                default:
                    o9.l lVar2 = (o9.l) context;
                    boolean z11 = (eVar instanceof ga.j) && ((ga.j) eVar).O0(8);
                    if (eVar instanceof ga.a) {
                        ((InstantAppResolver) l0.e(InstantAppResolver.class, lVar2, 2132018044)).getClass();
                    }
                    if (z11) {
                        return new q(2131231597, 2132018043, lVar2, eVar, 1);
                    }
                    return null;
            }
        }
    };

    /* renamed from: r, reason: collision with root package name */
    public final int f71304r;

    /* renamed from: s, reason: collision with root package name */
    public final int f71305s;

    /* renamed from: t, reason: collision with root package name */
    public final Context f71306t;

    /* renamed from: u, reason: collision with root package name */
    public final ga.e f71307u;

    public t(int i5, int i11, Context context, ga.e eVar) {
        this.f71304r = i5;
        this.f71305s = i11;
        this.f71306t = context;
        this.f71307u = eVar;
    }

    public final void f0(ImageView imageView) {
        imageView.setImageResource(this.f71304r);
        imageView.setContentDescription(imageView.getContext().getText(this.f71305s));
    }

    public final void p0(View view, DeepShortcutTextView deepShortcutTextView) {
        view.setBackgroundResource(this.f71304r);
        deepShortcutTextView.setText(this.f71305s);
    }
}
