package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.widget.FrameLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u60 implements a75 {
    public final /* synthetic */ int a = 2;
    public final Object b = new Object();
    public volatile z65 c;
    public final Object d;

    public u60(rz2 rz2Var) {
        this.d = rz2Var;
    }

    public static final Context d(Context context) {
        while ((context instanceof ContextWrapper) && !(context instanceof Activity)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        return context;
    }

    private final Object e() {
        if (((ko2) this.c) == null) {
            synchronized (this.b) {
                try {
                    if (((ko2) this.c) == null) {
                        this.c = new ko2(new v60((Context) ((rz2) this.d).b));
                    }
                } finally {
                }
            }
        }
        return (ko2) this.c;
    }

    private final Object f() {
        if (((fo2) this.c) == null) {
            synchronized (this.b) {
                try {
                    if (((fo2) this.c) == null) {
                        this.c = a();
                    }
                } finally {
                }
            }
        }
        return (fo2) this.c;
    }

    public fo2 a() {
        j15 j15Var = (j15) this.d;
        l15 l15Var = j15Var.t;
        if ((l15Var == null ? null : l15Var.z) == null) {
            z72.c("Hilt Fragments must be attached before creating the component.");
            return null;
        }
        gq7.l((l15Var == null ? null : l15Var.z) instanceof b75, "Hilt Fragments must be attached to an @AndroidEntryPoint Activity. Found: %s", (l15Var == null ? null : l15Var.z).getClass());
        l15 l15Var2 = j15Var.t;
        xm2 xm2Var = (xm2) ((o15) op8.V(o15.class, l15Var2 != null ? l15Var2.z : null));
        return new fo2(xm2Var.b, xm2Var.c, xm2Var.d, j15Var);
    }

    public go2 b() {
        FrameLayout frameLayout = (FrameLayout) this.d;
        Context context = frameLayout.getContext();
        while ((context instanceof ContextWrapper) && !a75.class.isInstance(context)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        Application applicationC = f76.C(context.getApplicationContext());
        Object obj = context;
        if (context == applicationC) {
            gq7.l(false, "%s, Hilt view cannot be created using the application context. Use a Hilt Fragment or Activity context.", frameLayout.getClass());
            obj = null;
        }
        if (obj instanceof a75) {
            return new go2(((xm2) ((wte) op8.V(wte.class, (a75) obj))).b);
        }
        throw new IllegalStateException(frameLayout.getClass() + ", Hilt view must be attached to an @AndroidEntryPoint Fragment or Activity.");
    }

    @Override // defpackage.a75
    public final Object c() {
        switch (this.a) {
            case 0:
                return e();
            case 1:
                return f();
            default:
                if (((go2) this.c) == null) {
                    synchronized (this.b) {
                        try {
                            if (((go2) this.c) == null) {
                                this.c = b();
                            }
                        } finally {
                        }
                        break;
                    }
                }
                return (go2) this.c;
        }
    }

    public u60(j15 j15Var) {
        this.d = j15Var;
    }

    public u60(FrameLayout frameLayout) {
        this.d = frameLayout;
    }
}
