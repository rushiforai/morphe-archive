package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t23 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ y23 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t23(y23 y23Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = y23Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        y23 y23Var = this.d;
        switch (i) {
            case 0:
                return new t23(y23Var, n92Var, 0);
            case 1:
                return new t23(y23Var, n92Var, 1);
            case 2:
                return new t23(y23Var, n92Var, 2);
            case 3:
                return new t23(y23Var, n92Var, 3);
            case 4:
                return new t23(y23Var, n92Var, 4);
            case 5:
                return new t23(y23Var, n92Var, 5);
            default:
                return new t23(y23Var, n92Var, 6);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((t23) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        y23 y23Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                wld.a.a("Close", new Object[0]);
                y23Var.c().stop();
                xpc xpcVar = y23Var.o;
                xpcVar.getClass();
                xpcVar.m(null, xtd.a);
                y23Var.f = false;
                y23Var.g = null;
                y23Var.h = null;
                y23Var.i = ey3.a;
                y23Var.j = 0.0f;
                y23Var.k = 0;
                return c1eVar;
            case 1:
                xpc xpcVar2 = y23Var.o;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                wld.a.a("Fast forward", new Object[0]);
                y23Var.c().stop();
                float f = y23Var.j + 1.0f;
                float size = y23Var.i.size();
                if (f > size) {
                    f = size;
                }
                y23Var.j = f;
                int i4 = (int) f;
                y23Var.f = i4 != y23Var.i.size();
                Iterator it2 = bu1.s0(y23Var.i, i4).iterator();
                while (it2.hasNext()) {
                    y23Var.i((aud) it2.next());
                }
                y23Var.n = y23Var.b();
                Object value = xpcVar2.getValue();
                ytd ytdVar = value instanceof ytd ? (ytd) value : null;
                if (ytdVar == null) {
                    return c1eVar;
                }
                ytd ytdVarA = ytd.a(ytdVar, y23Var.j, y23Var.f, 0.0f, 117);
                xpcVar2.getClass();
                xpcVar2.m(null, ytdVarA);
                return c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return (nm.a(y23Var.a, "android.permission.POST_NOTIFICATIONS") == 0 && new mj8(y23Var.a).a()) ? y23Var.d().isEmpty() ? std.a : rtd.a : ttd.a;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var4) {
                        return tb2Var4;
                    }
                } else {
                    if (i6 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return y23Var.d();
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var5) {
                        return tb2Var5;
                    }
                } else {
                    if (i7 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                y23Var.h();
                return c1eVar;
            case 5:
                xpc xpcVar3 = y23Var.o;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var6) {
                        return tb2Var6;
                    }
                } else {
                    if (i8 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                wld.a.a("Rewind", new Object[0]);
                y23Var.c().stop();
                float f2 = y23Var.j - 1.0f;
                if (f2 < 0.0f) {
                    f2 = 0.0f;
                }
                y23Var.j = f2;
                Iterator it3 = bu1.s0(y23Var.i, (int) f2).iterator();
                while (it3.hasNext()) {
                    y23Var.i((aud) it3.next());
                }
                y23Var.n = y23Var.b();
                Object value2 = xpcVar3.getValue();
                ytd ytdVar2 = value2 instanceof ytd ? (ytd) value2 : null;
                if (ytdVar2 == null) {
                    return c1eVar;
                }
                ytd ytdVarA2 = ytd.a(ytdVar2, y23Var.j, false, 0.0f, 125);
                xpcVar3.getClass();
                xpcVar3.m(null, ytdVarA2);
                return c1eVar;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var7) {
                        return tb2Var7;
                    }
                } else {
                    if (i9 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                wld.a.a("Toggle play/pause", new Object[0]);
                ztd ztdVar = (ztd) bo.A(y23Var.o).a.getValue();
                if (!(ztdVar instanceof ytd)) {
                    return c1eVar;
                }
                boolean z = ((ytd) ztdVar).d;
                if (z) {
                    y23Var.f("", "tts_notification", true);
                    return c1eVar;
                }
                if (z) {
                    ygf.a();
                    return null;
                }
                y23Var.h();
                return c1eVar;
        }
    }
}
