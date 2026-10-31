package qg;

import a5.k1;
import ab.c0;
import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.internal.measurement.z6;
import fi.t;
import java.util.Collections;
import java.util.Objects;
import java.util.Set;
import rg.b0;
import rg.r;
import rg.s;
import rg.v;
import rg.y;
import rg.z;
import sg.w;
import x7.u;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public final Context f84052a;

    /* renamed from: b, reason: collision with root package name */
    public final String f84053b;

    /* renamed from: c, reason: collision with root package name */
    public final y90.f f84054c;

    /* renamed from: d, reason: collision with root package name */
    public final c0 f84055d;

    /* renamed from: e, reason: collision with root package name */
    public final b f84056e;

    /* renamed from: f, reason: collision with root package name */
    public final rg.a f84057f;

    /* renamed from: g, reason: collision with root package name */
    public final Looper f84058g;

    /* renamed from: h, reason: collision with root package name */
    public final int f84059h;

    /* renamed from: i, reason: collision with root package name */
    public final r f84060i;

    /* renamed from: j, reason: collision with root package name */
    public final o2.f f84061j;

    /* renamed from: k, reason: collision with root package name */
    public final rg.e f84062k;

    public f(Context context, Activity activity, c0 c0Var, b bVar, e eVar) {
        w.i(context, "Null context is not permitted.");
        w.i(c0Var, "Api must not be null.");
        w.i(eVar, "Settings must not be null; use Settings.DEFAULT_SETTINGS instead.");
        Context applicationContext = context.getApplicationContext();
        w.i(applicationContext, "The provided context did not have an application context.");
        this.f84052a = applicationContext;
        int i5 = Build.VERSION.SDK_INT;
        String strB = (i5 < 30 || i5 < 30) ? null : k1.b(context);
        this.f84053b = strB;
        this.f84054c = i5 >= 31 ? new y90.f(context.getAttributionSource()) : null;
        this.f84055d = c0Var;
        this.f84056e = bVar;
        this.f84058g = eVar.f84051b;
        rg.a aVar = new rg.a(c0Var, bVar, strB);
        this.f84057f = aVar;
        this.f84060i = new r(this);
        rg.e eVarD = rg.e.d(applicationContext);
        this.f84062k = eVarD;
        this.f84059h = eVarD.f85881h.getAndIncrement();
        this.f84061j = eVar.f84050a;
        if (activity != null && !(activity instanceof GoogleApiActivity) && Looper.myLooper() == Looper.getMainLooper()) {
            rg.n.d(activity, eVarD, aVar);
        }
        z6 z6Var = eVarD.n;
        z6Var.sendMessage(z6Var.obtainMessage(7, this));
    }

    public final u a() {
        u uVar = new u();
        Set set = Collections.EMPTY_SET;
        if (((z.f) uVar.f95208a) == null) {
            uVar.f95208a = new z.f(0);
        }
        ((z.f) uVar.f95208a).addAll(set);
        Context context = this.f84052a;
        uVar.f95210c = context.getClass().getName();
        uVar.f95209b = context.getPackageName();
        return uVar;
    }

    public final void b(int i5, mg.j jVar) {
        jVar.D();
        rg.e eVar = this.f84062k;
        eVar.getClass();
        v vVar = new v(new z(i5, jVar), eVar.f85882i.get(), this);
        z6 z6Var = eVar.n;
        z6Var.sendMessage(z6Var.obtainMessage(4, vVar));
    }

    public final t c(int i5, y yVar) {
        s sVarA;
        fi.j jVar = new fi.j();
        rg.e eVar = this.f84062k;
        eVar.getClass();
        z6 z6Var = eVar.n;
        int i11 = yVar.f85892a;
        t tVar = jVar.f55135a;
        if (i11 != 0 && (sVarA = s.a(eVar, i11, this.f84057f)) != null) {
            Objects.requireNonNull(z6Var);
            tVar.c(new androidx.recyclerview.widget.e(z6Var, 3), sVarA);
        }
        z6Var.sendMessage(z6Var.obtainMessage(4, new v(new b0(i5, yVar, jVar, this.f84061j), eVar.f85882i.get(), this)));
        return tVar;
    }
}
