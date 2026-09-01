package defpackage;

import android.content.Context;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fn extends co6 implements x45 {
    public static final fn A;
    public static final fn B;
    public static final fn C;
    public static final fn D;
    public static final fn E;
    public static final fn b;
    public static final fn c;
    public static final fn d;
    public static final fn e;
    public static final fn f;
    public static final fn g;
    public static final fn h;
    public static final fn i;
    public static final fn j;
    public static final fn k;
    public static final fn l;
    public static final fn m;
    public static final fn n;
    public static final fn o;
    public static final fn p;
    public static final fn q;
    public static final fn r;
    public static final fn s;
    public static final fn t;
    public static final fn u;
    public static final fn v;
    public static final fn w;
    public static final fn x;
    public static final fn y;
    public static final fn z;
    public final /* synthetic */ int a;

    static {
        int i2 = 1;
        b = new fn(i2, 0);
        c = new fn(i2, 1);
        d = new fn(i2, 2);
        e = new fn(i2, 3);
        f = new fn(i2, 4);
        g = new fn(i2, 5);
        h = new fn(i2, 6);
        i = new fn(i2, 7);
        j = new fn(i2, 8);
        k = new fn(i2, 9);
        l = new fn(i2, 10);
        m = new fn(i2, 11);
        n = new fn(i2, 12);
        o = new fn(i2, 13);
        p = new fn(i2, 14);
        q = new fn(i2, 15);
        r = new fn(i2, 16);
        s = new fn(i2, 17);
        t = new fn(i2, 18);
        u = new fn(i2, 19);
        v = new fn(i2, 20);
        w = new fn(i2, 21);
        x = new fn(i2, 22);
        y = new fn(i2, 23);
        z = new fn(i2, 24);
        A = new fn(i2, 25);
        B = new fn(i2, 26);
        C = new fn(i2, 27);
        D = new fn(i2, 28);
        E = new fn(i2, 29);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fn(int i2, int i3) {
        super(i2);
        this.a = i3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                return Boolean.TRUE;
            case 1:
                return Boolean.valueOf(((zxb) obj).k().a.c(eyb.B));
            case 2:
                t22 t22Var = (t22) obj;
                sn3 sn3Var = eo.a;
                i89 i89Var = (i89) t22Var;
                i89Var.getClass();
                m40.U(i89Var, sn3Var);
                return ((Context) m40.U((i89) t22Var, eo.b)).getResources();
            case 3:
                return Boolean.valueOf(((zxb) obj).k().a.c(eyb.B));
            case 4:
                fj6[] fj6VarArr = gyb.a;
                ((jyb) obj).d(eyb.y, c1eVar);
                return c1eVar;
            case 5:
                ((Number) obj).longValue();
                return c1eVar;
            case 6:
                return c1eVar;
            case 7:
                fj6[] fj6VarArr2 = gyb.a;
                ((jyb) obj).d(eyb.x, c1eVar);
                return c1eVar;
            case 8:
                return c1eVar;
            case 9:
                zt ztVar = (zt) obj;
                ztVar.getHandler().post(new wm(4, ztVar.r));
                return c1eVar;
            case 10:
                return c1eVar;
            case 11:
                return c1eVar;
            case 12:
                return c1eVar;
            case 13:
                return obj;
            case 14:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                return bool;
            case 15:
                Boolean bool2 = (Boolean) obj;
                bool2.booleanValue();
                return bool2;
            case 16:
                Boolean bool3 = (Boolean) obj;
                bool3.booleanValue();
                return bool3;
            case 17:
                long jA = uu1.a(((uu1) obj).a, lv1.x);
                return new cx(uu1.c(jA), uu1.g(jA), uu1.f(jA), uu1.d(jA));
            case 18:
                ((Number) obj).longValue();
                return c1eVar;
            case 19:
                r12 r12Var = (r12) obj;
                aq6 aq6Var = r12Var instanceof aq6 ? (aq6) r12Var : null;
                if (aq6Var != null && aq6Var.Q) {
                    b26.b("Apply is called on deactivated node " + r12Var);
                }
                return c1eVar;
            case 20:
                return Boolean.valueOf(!(((p28) obj) instanceof v12));
            case 21:
                sn3 sn3Var2 = z22.o;
                i89 i89Var2 = (i89) ((t22) obj);
                i89Var2.getClass();
                return (f67) bu1.w0((Iterable) m40.U(i89Var2, sn3Var2));
            case 22:
                obj.getClass();
                return c1eVar;
            case 23:
                obj.getClass();
                return c1eVar;
            case 24:
                return obj;
            case 25:
                float[] fArr = ((pk7) obj).a;
                return c1eVar;
            case 26:
                float[] fArr2 = ((pk7) obj).a;
                return c1eVar;
            case 27:
                l66 l66Var = (l66) obj;
                l66Var.getClass();
                return new nig(l66Var);
            case 28:
                String str = (String) obj;
                str.getClass();
                Locale locale = Locale.US;
                locale.getClass();
                String lowerCase = str.toLowerCase(locale);
                lowerCase.getClass();
                return lowerCase;
            default:
                String str2 = (String) obj;
                str2.getClass();
                rk1 rk1Var = new rk1('a', 'z');
                Character chValueOf = str2.length() > 0 ? Character.valueOf(str2.charAt(0)) : null;
                if (chValueOf == null) {
                    return null;
                }
                char cCharValue = chValueOf.charValue();
                if (g76.Q(97, cCharValue) > 0 || g76.Q(cCharValue, rk1Var.b) > 0) {
                    return null;
                }
                return str2;
        }
    }
}
