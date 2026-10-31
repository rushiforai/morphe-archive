package m;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.appcompat.widget.Toolbar;
import java.lang.ref.WeakReference;

/* loaded from: classes.dex */
public abstract class s {

    /* renamed from: a, reason: collision with root package name */
    public static final q f75338a = new q(new r(0));

    /* renamed from: b, reason: collision with root package name */
    public static int f75339b = -100;

    /* renamed from: c, reason: collision with root package name */
    public static w4.g f75340c = null;

    /* renamed from: d, reason: collision with root package name */
    public static w4.g f75341d = null;

    /* renamed from: e, reason: collision with root package name */
    public static Boolean f75342e = null;

    /* renamed from: f, reason: collision with root package name */
    public static boolean f75343f = false;

    /* renamed from: g, reason: collision with root package name */
    public static final z.f f75344g = new z.f(0);

    /* renamed from: h, reason: collision with root package name */
    public static final Object f75345h = new Object();

    /* renamed from: i, reason: collision with root package name */
    public static final Object f75346i = new Object();

    public static w4.g g() {
        Object systemService;
        Context contextH;
        if (Build.VERSION.SDK_INT >= 33) {
            z.f fVar = f75344g;
            fVar.getClass();
            z.a aVar = new z.a(fVar);
            while (true) {
                if (!aVar.hasNext()) {
                    systemService = null;
                    break;
                }
                s sVar = (s) ((WeakReference) aVar.next()).get();
                if (sVar != null && (contextH = sVar.h()) != null) {
                    systemService = contextH.getSystemService("locale");
                    break;
                }
            }
            if (systemService != null) {
                return w4.g.f(p.a(systemService));
            }
        } else {
            w4.g gVar = f75340c;
            if (gVar != null) {
                return gVar;
            }
        }
        return w4.g.c();
    }

    public static boolean n(Context context) {
        if (f75342e == null) {
            try {
                Bundle bundle = l0.a(context).metaData;
                if (bundle != null) {
                    f75342e = Boolean.valueOf(bundle.getBoolean("autoStoreLocales"));
                }
            } catch (PackageManager.NameNotFoundException unused) {
                f75342e = Boolean.FALSE;
            }
        }
        return f75342e.booleanValue();
    }

    public static void v(f0 f0Var) {
        synchronized (f75345h) {
            try {
                z.f fVar = f75344g;
                fVar.getClass();
                z.a aVar = new z.a(fVar);
                while (aVar.hasNext()) {
                    s sVar = (s) ((WeakReference) aVar.next()).get();
                    if (sVar == f0Var || sVar == null) {
                        aVar.remove();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public abstract void A(Toolbar toolbar);

    public abstract void B(int i5);

    public abstract void C(CharSequence charSequence);

    public abstract androidx.appcompat.view.b D(androidx.appcompat.view.a aVar);

    public abstract void b(View view, ViewGroup.LayoutParams layoutParams);

    public abstract boolean d();

    public abstract Context e(Context context);

    public abstract View f(int i5);

    public abstract Context h();

    public abstract br.a i();

    public abstract MenuInflater j();

    public abstract b k();

    public abstract void l();

    public abstract void m();

    public abstract void o(Configuration configuration);

    public abstract void p();

    public abstract void q();

    public abstract void r();

    public abstract void s();

    public abstract void t();

    public abstract void u();

    public abstract boolean w(int i5);

    public abstract void x(int i5);

    public abstract void y(View view);

    public abstract void z(View view, ViewGroup.LayoutParams layoutParams);
}
