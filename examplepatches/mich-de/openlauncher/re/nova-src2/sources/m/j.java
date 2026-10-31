package m;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.text.Spanned;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AlertController$RecycleListView;

/* loaded from: classes2.dex */
public class j {

    /* renamed from: a, reason: collision with root package name */
    public final g f75297a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75298b;

    public j(Context context) {
        this(context, k.f(context, 0));
    }

    public final void a(Spanned spanned) {
        this.f75297a.f75249f = spanned;
    }

    public final void b(int i5) {
        g gVar = this.f75297a;
        gVar.f75247d = gVar.f75244a.getText(i5);
    }

    public final k c() {
        k kVarCreate = create();
        kVarCreate.show();
        return kVarCreate;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v14 */
    /* JADX WARN: Type inference failed for: r1v16, types: [android.widget.ListAdapter] */
    /* JADX WARN: Type inference failed for: r1v25, types: [m.d] */
    public k create() {
        ?? dVar;
        g gVar = this.f75297a;
        ContextThemeWrapper contextThemeWrapper = gVar.f75244a;
        ContextThemeWrapper contextThemeWrapper2 = gVar.f75244a;
        k kVar = new k(contextThemeWrapper, this.f75298b);
        View view = gVar.f75248e;
        i iVar = kVar.f75307f;
        if (view != null) {
            iVar.f75289w = view;
        } else {
            CharSequence charSequence = gVar.f75247d;
            if (charSequence != null) {
                iVar.f75272d = charSequence;
                TextView textView = iVar.f75287u;
                if (textView != null) {
                    textView.setText(charSequence);
                }
            }
            Drawable drawable = gVar.f75246c;
            if (drawable != null) {
                iVar.f75285s = drawable;
                ImageView imageView = iVar.f75286t;
                if (imageView != null) {
                    imageView.setVisibility(0);
                    iVar.f75286t.setImageDrawable(drawable);
                }
            }
        }
        CharSequence charSequence2 = gVar.f75249f;
        if (charSequence2 != null) {
            iVar.f75273e = charSequence2;
            TextView textView2 = iVar.f75288v;
            if (textView2 != null) {
                textView2.setText(charSequence2);
            }
        }
        CharSequence charSequence3 = gVar.f75250g;
        if (charSequence3 != null) {
            iVar.c(-1, charSequence3, gVar.f75251h);
        }
        CharSequence charSequence4 = gVar.f75252i;
        if (charSequence4 != null) {
            iVar.c(-2, charSequence4, gVar.f75253j);
        }
        if (gVar.n != null || gVar.o != null) {
            AlertController$RecycleListView alertController$RecycleListView = (AlertController$RecycleListView) gVar.f75245b.inflate(iVar.A, (ViewGroup) null);
            if (gVar.f75260s) {
                dVar = new d(gVar, contextThemeWrapper2, iVar.B, gVar.n, alertController$RecycleListView);
            } else {
                int i5 = gVar.f75261t ? iVar.C : iVar.D;
                Object obj = gVar.o;
                Object mVar = obj;
                if (obj == null) {
                    mVar = new kz.m(contextThemeWrapper2, i5, 16908308, gVar.n);
                }
                dVar = mVar;
            }
            iVar.f75290x = dVar;
            iVar.f75291y = gVar.f75262u;
            if (gVar.f75257p != null) {
                alertController$RecycleListView.setOnItemClickListener(new e(gVar, iVar));
            } else if (gVar.f75263v != null) {
                alertController$RecycleListView.setOnItemClickListener(new f(gVar, alertController$RecycleListView, iVar));
            }
            if (gVar.f75261t) {
                alertController$RecycleListView.setChoiceMode(1);
            } else if (gVar.f75260s) {
                alertController$RecycleListView.setChoiceMode(2);
            }
            iVar.f75274f = alertController$RecycleListView;
        }
        View view2 = gVar.f75258q;
        if (view2 != null) {
            iVar.f75275g = view2;
            iVar.f75276h = false;
        }
        kVar.setCancelable(true);
        kVar.setCanceledOnTouchOutside(true);
        kVar.setOnCancelListener(gVar.f75254k);
        kVar.setOnDismissListener(gVar.f75255l);
        q.l lVar = gVar.f75256m;
        if (lVar != null) {
            kVar.setOnKeyListener(lVar);
        }
        return kVar;
    }

    public Context getContext() {
        return this.f75297a.f75244a;
    }

    public j setNegativeButton(int i5, DialogInterface.OnClickListener onClickListener) {
        g gVar = this.f75297a;
        gVar.f75252i = gVar.f75244a.getText(i5);
        gVar.f75253j = onClickListener;
        return this;
    }

    public j setPositiveButton(int i5, DialogInterface.OnClickListener onClickListener) {
        g gVar = this.f75297a;
        gVar.f75250g = gVar.f75244a.getText(i5);
        gVar.f75251h = onClickListener;
        return this;
    }

    public j setTitle(CharSequence charSequence) {
        this.f75297a.f75247d = charSequence;
        return this;
    }

    public j setView(View view) {
        this.f75297a.f75258q = view;
        return this;
    }

    public j(Context context, int i5) {
        this.f75297a = new g(new ContextThemeWrapper(context, k.f(context, i5)));
        this.f75298b = i5;
    }
}
