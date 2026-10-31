package py;

import android.content.Context;
import android.os.Looper;
import b.c0;
import e10.e1;
import e10.y2;
import h6.c1;
import java.lang.ref.WeakReference;
import java.text.DateFormat;
import java.util.Date;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import lh.i;
import m.s;
import t70.j0;
import t70.k0;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class c implements j0 {

    /* renamed from: b, reason: collision with root package name */
    public static final c f83128b = new c();

    /* renamed from: c, reason: collision with root package name */
    public static int f83129c;

    /* renamed from: d, reason: collision with root package name */
    public static boolean f83130d;

    /* renamed from: e, reason: collision with root package name */
    public static f f83131e;

    /* renamed from: f, reason: collision with root package name */
    public static final wb0.a f83132f;

    /* renamed from: g, reason: collision with root package name */
    public static final i2 f83133g;

    /* renamed from: h, reason: collision with root package name */
    public static final i2 f83134h;

    /* renamed from: i, reason: collision with root package name */
    public static boolean f83135i;

    /* renamed from: j, reason: collision with root package name */
    public static final i f83136j;

    /* renamed from: k, reason: collision with root package name */
    public static final b f83137k;

    /* renamed from: l, reason: collision with root package name */
    public static final ao.c f83138l;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y70.d f83139a = k0.b();

    static {
        wb0.d dVar = new wb0.d(wb0.b.f94172e);
        dVar.f94181b = true;
        dVar.f94182c = mb0.d.f76202a;
        vm.c cVar = new vm.c(dVar, 25);
        dVar.f94183d = cVar;
        dVar.f94184e = cVar;
        f83132f = new wb0.a(dVar, dVar);
        i2 i2VarC = u1.c(Boolean.FALSE);
        f83133g = i2VarC;
        f83134h = i2VarC;
        f83136j = new i(Looper.getMainLooper(), 1);
        f83137k = new b();
        f83138l = new ao.c(3);
    }

    public static void a() {
        long jCurrentTimeMillis;
        boolean zD = c().d();
        if (zD != f83130d) {
            f83130d = zD;
        }
        boolean z11 = f83130d;
        int i5 = s.f75339b;
        y2.f51877a.getClass();
        e1 e1Var = (e1) y2.N0().l();
        int i11 = (e1Var != e1.f51480d && (e1Var == e1.f51479c || !((e1Var.g() && z11) || (e1Var == e1.f51478b && f83129c == 32)))) ? 1 : 2;
        if ((i11 == 1 || i11 == 2) && s.f75339b != i11) {
            s.f75339b = i11;
            synchronized (s.f75345h) {
                try {
                    z.f fVar = s.f75344g;
                    fVar.getClass();
                    z.a aVar = new z.a(fVar);
                    while (aVar.hasNext()) {
                        s sVar = (s) ((WeakReference) aVar.next()).get();
                        if (sVar != null) {
                            sVar.d();
                        }
                    }
                } finally {
                }
            }
        }
        if (i5 != i11 || !f83135i) {
            f83132f.c(Boolean.valueOf(i11 == 2));
            c1.B(i11 == 2, f83133g, null);
            f83135i = true;
        }
        i iVar = f83136j;
        iVar.removeMessages(1);
        f fVarC = c();
        y2.f51877a.getClass();
        if (y2.N0().l() == e1.f51482f) {
            jCurrentTimeMillis = System.currentTimeMillis() + 20000;
        } else {
            fVarC.a();
            jCurrentTimeMillis = f.f83151d.f83149f;
        }
        iVar.sendEmptyMessageDelayed(1, jCurrentTimeMillis - System.currentTimeMillis());
    }

    public static String b(Context context) {
        f fVarC = c();
        y2.f51877a.getClass();
        if (y2.N0().l() == e1.f51482f) {
            return "Every Minute!";
        }
        fVarC.a();
        DateFormat timeFormat = android.text.format.DateFormat.getTimeFormat(context);
        e eVar = f.f83151d;
        return c0.m("Day: ", timeFormat.format(new Date(eVar.f83146c)), "\nNight: ", timeFormat.format(new Date(eVar.f83147d)));
    }

    public static f c() {
        f fVar = f83131e;
        if (fVar != null) {
            return fVar;
        }
        Intrinsics.m("twilightManager");
        throw null;
    }

    public static boolean d() {
        return s.f75339b == 2;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f83139a.f96790a;
    }
}
