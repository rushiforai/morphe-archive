package defpackage;

import android.app.PendingIntent;
import android.app.RemoteAction;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.view.View;
import android.view.textclassifier.TextClassification;
import android.widget.Magnifier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ep6 implements ap6, ma9, db9 {
    public static final ep6 a = new ep6();
    public static final ep6 b = new ep6();
    public static final ep6 c = new ep6();

    public static Typeface f(String str, d05 d05Var, int i) {
        if (i == 0 && g76.L(d05Var, d05.f) && (str == null || str.length() == 0)) {
            return Typeface.DEFAULT;
        }
        return Typeface.create(str == null ? Typeface.DEFAULT : Typeface.create(str, 0), d05Var.a, i == 1);
    }

    public static void g(g92 g92Var, Context context, lhd lhdVar) {
        if (context == null) {
            return;
        }
        int i = lhdVar.c;
        TextClassification textClassification = lhdVar.b;
        if (i < 0) {
            h9b h9bVar = new h9b(24, textClassification);
            Drawable icon = textClassification.getIcon();
            g92.b(g92Var, h9bVar, icon != null ? new mz1(new m23(4, icon), true, -1123224187) : null, new nbb(context, 17, textClassification), 6);
        } else {
            RemoteAction remoteAction = textClassification.getActions().get(i);
            g92.b(g92Var, new h9b(25, remoteAction), ((i == 0) || remoteAction.shouldShowIcon()) ? new mz1(new ehd(remoteAction), true, -1261173016) : null, new doc(11, remoteAction), 6);
        }
    }

    public static final String h(TextClassification textClassification, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(950061013);
        String strValueOf = String.valueOf(textClassification.getLabel());
        p65Var.p(false);
        return strValueOf;
    }

    public static final String i(RemoteAction remoteAction, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-1376593684);
        String string = remoteAction.getTitle().toString();
        p65Var.p(false);
        return string;
    }

    public static final void j(RemoteAction remoteAction) {
        PendingIntent actionIntent = remoteAction.getActionIntent();
        if (Build.VERSION.SDK_INT >= 34) {
            m4.C(actionIntent);
        } else {
            actionIntent.send();
        }
    }

    @Override // defpackage.db9
    public Typeface a(d05 d05Var, int i) {
        return f(null, d05Var, i);
    }

    @Override // defpackage.ma9
    public boolean b() {
        return false;
    }

    @Override // defpackage.ma9
    public la9 c(View view, boolean z, long j, float f, float f2, boolean z2, m73 m73Var, float f3) {
        return new ke5(new Magnifier(view));
    }

    public void d(Drawable drawable, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(257732500);
        int i2 = (p65Var.h(drawable) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarL = jfc.l(o28.b, h92.e);
            boolean zH = p65Var.h(drawable);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new zzb(12, drawable);
                p65Var.j0(objM);
            }
            dy0.a(guc.A(r28VarL, (x45) objM), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(this, drawable, i, 13);
        }
    }

    public void e(final Icon icon, x12 x12Var, final int i) {
        mwa mwaVarS;
        b55 b55Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2116504409);
        int i2 = (p65Var.h(icon) ? 4 : 2) | i;
        final int i3 = 0;
        final int i4 = 1;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            Context context = (Context) p65Var.j(eo.b);
            boolean zF = p65Var.f(icon) | p65Var.f(context);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = icon.loadDrawable(context);
                p65Var.j0(objM);
            }
            Drawable drawable = (Drawable) objM;
            if (drawable == null) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    b55Var = new b55(this, icon, i, i3) { // from class: dhd
                        public final /* synthetic */ int a;
                        public final /* synthetic */ ep6 b;
                        public final /* synthetic */ Icon c;

                        {
                            this.a = i3;
                            this.b = this;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i5 = this.a;
                            c1e c1eVar = c1e.a;
                            Icon icon2 = this.c;
                            ep6 ep6Var = this.b;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i5) {
                                case 0:
                                    ep6Var.e(icon2, x12Var2, tr7.y(49));
                                    break;
                                default:
                                    ep6Var.e(icon2, x12Var2, tr7.y(49));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            d(drawable, p65Var, 48);
        } else {
            p65Var.S();
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            b55Var = new b55(this, icon, i, i4) { // from class: dhd
                public final /* synthetic */ int a;
                public final /* synthetic */ ep6 b;
                public final /* synthetic */ Icon c;

                {
                    this.a = i4;
                    this.b = this;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i5 = this.a;
                    c1e c1eVar = c1e.a;
                    Icon icon2 = this.c;
                    ep6 ep6Var = this.b;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i5) {
                        case 0:
                            ep6Var.e(icon2, x12Var2, tr7.y(49));
                            break;
                        default:
                            ep6Var.e(icon2, x12Var2, tr7.y(49));
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    @Override // defpackage.ap6
    public Object f0(of5 of5Var, n92 n92Var) {
        return Bitmap.createBitmap(new dp6(of5Var));
    }

    @Override // defpackage.db9
    public Typeface k(y75 y75Var, d05 d05Var, int i) {
        y75Var.getClass();
        return f("sans-serif", d05Var, i);
    }
}
