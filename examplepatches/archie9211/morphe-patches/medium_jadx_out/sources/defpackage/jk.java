package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jk extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ float d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jk(Object obj, float f, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.d = f;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new jk((tl) obj2, this.d, n92Var, 0);
            case 1:
                return new jk((sl) obj2, this.d, n92Var, 1);
            case 2:
                jk jkVar = new jk((l12) obj2, n92Var);
                jkVar.d = ((Number) obj).floatValue();
                return jkVar;
            default:
                return new jk((y23) obj2, this.d, n92Var, 3);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((jk) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((jk) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((jk) create(Float.valueOf(((Number) obj).floatValue()), (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((jk) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    float f = this.d;
                    this.c = 1;
                    return ((tl) obj2).n(f, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    float f2 = this.d;
                    this.c = 1;
                    return ((sl) obj2).h(f2, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 2:
                l12 l12Var = (l12) obj2;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    float f3 = this.d;
                    Object objG = l12Var.a.d.a.g(sxb.e);
                    b55 b55Var = (b55) (objG != null ? objG : null);
                    if (b55Var == null) {
                        throw lv8.v("Required value was null.");
                    }
                    ip8 ip8Var = new ip8((((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(f3)) & 4294967295L));
                    this.c = 1;
                    obj = b55Var.invoke(ip8Var, this);
                    if (obj == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return new Float(Float.intBitsToFloat((int) (((ip8) obj).a & 4294967295L)));
            default:
                float f4 = this.d;
                y23 y23Var = (y23) obj2;
                xpc xpcVar = y23Var.o;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (y23Var.a(this) == tb2Var4) {
                        return tb2Var4;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                wld.a.a("Seek: " + f4, new Object[0]);
                y23Var.c().stop();
                y23Var.j = f4;
                int i6 = (int) f4;
                if (i6 >= y23Var.i.size()) {
                    return c1eVar;
                }
                Iterator it2 = y23Var.i.subList(Math.max(i6, 0), y23Var.i.size()).iterator();
                while (it2.hasNext()) {
                    y23Var.i((aud) it2.next());
                }
                y23Var.f = i6 != y23Var.i.size() - 1;
                y23Var.n = y23Var.b();
                Object value = xpcVar.getValue();
                ytd ytdVar = value instanceof ytd ? (ytd) value : null;
                if (ytdVar == null) {
                    return c1eVar;
                }
                ytd ytdVarA = ytd.a(ytdVar, 0.0f, y23Var.f, 0.0f, PanasonicMakernoteDirectory.TAG_BURST_SPEED);
                xpcVar.getClass();
                xpcVar.m(null, ytdVarA);
                return c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jk(l12 l12Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.e = l12Var;
    }
}
