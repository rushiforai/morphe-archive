package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p79 implements x45 {
    public final /* synthetic */ int a;
    public static final p79 b = new p79(0);
    public static final p79 c = new p79(1);
    public static final p79 d = new p79(2);
    public static final p79 e = new p79(3);
    public static final p79 f = new p79(4);
    public static final p79 g = new p79(5);
    public static final p79 h = new p79(6);
    public static final p79 i = new p79(7);
    public static final p79 j = new p79(8);
    public static final p79 k = new p79(9);
    public static final p79 l = new p79(10);
    public static final p79 m = new p79(11);
    public static final p79 n = new p79(12);
    public static final p79 o = new p79(13);
    public static final p79 p = new p79(14);
    public static final p79 q = new p79(15);
    public static final p79 r = new p79(16);
    public static final p79 s = new p79(17);
    public static final p79 t = new p79(18);
    public static final p79 u = new p79(19);
    public static final p79 v = new p79(20);
    public static final p79 w = new p79(21);
    public static final p79 x = new p79(22);
    public static final p79 y = new p79(23);
    public static final p79 z = new p79(24);
    public static final p79 A = new p79(25);
    public static final p79 B = new p79(26);
    public static final p79 C = new p79(27);
    public static final p79 D = new p79(28);
    public static final p79 E = new p79(29);

    public /* synthetic */ p79(int i2) {
        this.a = i2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                h52 h52Var = (h52) obj;
                b09.G(h52Var, null, "spread");
                q52 q52Var = h52Var.d;
                i52 i52Var = h52Var.c;
                wgd.k(q52Var, i52Var.c, 0.0f, 6);
                wgd.k(h52Var.f, i52Var.e, 0.0f, 6);
                km4.o(h52Var.g, i52Var.f, 0.0f, 6);
                return c1eVar;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                q52 q52Var2 = h52Var2.d;
                i52 i52Var2 = h52Var2.c;
                wgd.k(q52Var2, i52Var2.c, 0.0f, 6);
                km4.o(h52Var2.g, i52Var2.f, 18.0f, 4);
                wgd.k(h52Var2.f, i52Var2.e, 0.0f, 6);
                km4.o(h52Var2.e, i52Var2.d, 0.0f, 6);
                return c1eVar;
            case 2:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                q52 q52Var3 = h52Var3.e;
                i52 i52Var3 = h52Var3.c;
                km4.o(q52Var3, i52Var3.d, 0.0f, 6);
                wgd.k(h52Var3.d, i52Var3.c, 0.0f, 6);
                return c1eVar;
            case 3:
                h52 h52Var4 = (h52) obj;
                h52Var4.getClass();
                q52 q52Var4 = h52Var4.d;
                i52 i52Var4 = h52Var4.c;
                wgd.k(q52Var4, i52Var4.c, 20.0f, 4);
                km4.o(h52Var4.e, i52Var4.d, 20.0f, 4);
                wgd.k(h52Var4.f, i52Var4.e, 20.0f, 4);
                ka1.A(h52Var4, null, "spread");
                return c1eVar;
            case 4:
                String str = (String) obj;
                str.getClass();
                return "(raw) ".concat(str);
            case 5:
                ParameterizedType parameterizedType = (ParameterizedType) obj;
                List list = e0b.a;
                parameterizedType.getClass();
                Type ownerType = parameterizedType.getOwnerType();
                if (ownerType instanceof ParameterizedType) {
                    return (ParameterizedType) ownerType;
                }
                return null;
            case 6:
                ParameterizedType parameterizedType2 = (ParameterizedType) obj;
                List list2 = e0b.a;
                parameterizedType2.getClass();
                Type[] actualTypeArguments = parameterizedType2.getActualTypeArguments();
                actualTypeArguments.getClass();
                return k80.b0(actualTypeArguments);
            case 7:
                return Boolean.valueOf(((Class) obj).getSimpleName().length() == 0);
            case 8:
                String simpleName = ((Class) obj).getSimpleName();
                if (!n98.f(simpleName)) {
                    simpleName = null;
                }
                if (simpleName != null) {
                    return n98.e(simpleName);
                }
                return null;
            case 9:
                ri6 ri6Var = (ri6) obj;
                ri6Var.getClass();
                String name = ri6Var.getName();
                if (name == null) {
                    name = "_";
                }
                return name + ": " + ri6Var.e();
            case 10:
                ri6 ri6Var2 = (ri6) obj;
                ri6Var2.getClass();
                return vo7.L(ri6Var2.e());
            case 11:
                ri6 ri6Var3 = (ri6) obj;
                ri6Var3.getClass();
                return vo7.L(ri6Var3.e());
            case 12:
                n98 n98Var = (n98) obj;
                n98Var.getClass();
                return aq7.z(n98Var);
            case 13:
                String str2 = (String) obj;
                str2.getClass();
                return str2;
            case 14:
                vm6 vm6Var = (vm6) obj;
                ojb ojbVar = ojb.c;
                vm6Var.getClass();
                return vm6Var.s(x0a.BOOLEAN);
            case 15:
                vm6 vm6Var2 = (vm6) obj;
                pjb pjbVar = pjb.c;
                vm6Var2.getClass();
                return vm6Var2.s(x0a.INT);
            case 16:
                vm6 vm6Var3 = (vm6) obj;
                qjb qjbVar = qjb.c;
                vm6Var3.getClass();
                return vm6Var3.w();
            case 17:
                Class cls = (Class) obj;
                cls.getClass();
                return e0b.b(cls);
            case 18:
                if (g76.L(obj, Boolean.FALSE)) {
                    return new uu1(uu1.h);
                }
                obj.getClass();
                return new uu1(op8.j(((Integer) obj).intValue()));
            case 19:
                h52 h52Var5 = (h52) obj;
                h52Var5.getClass();
                q52 q52Var5 = h52Var5.f;
                i52 i52Var5 = h52Var5.c;
                wgd.k(q52Var5, i52Var5.e, 0.0f, 6);
                km4.o(h52Var5.e, i52Var5.d, 0.0f, 6);
                km4.o(h52Var5.g, i52Var5.f, 0.0f, 6);
                return c1eVar;
            case 20:
                h52 h52Var6 = (h52) obj;
                h52Var6.getClass();
                q52 q52Var6 = h52Var6.f;
                i52 i52Var6 = h52Var6.c;
                wgd.k(q52Var6, i52Var6.e, 0.0f, 6);
                h52.b(h52Var6, i52Var6.d, i52Var6.f, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                return c1eVar;
            case 21:
                h52 h52Var7 = (h52) obj;
                h52Var7.getClass();
                h52Var7.f(new ze3(null, "spread"));
                h52Var7.d(new ze3(new vj3(40.0f), null));
                q52 q52Var7 = h52Var7.d;
                i52 i52Var7 = h52Var7.c;
                wgd.k(q52Var7, i52Var7.c, 0.0f, 6);
                km4.o(h52Var7.e, i52Var7.d, 0.0f, 6);
                wgd.k(h52Var7.f, i52Var7.e, 0.0f, 6);
                return c1eVar;
            case 22:
                h52 h52Var8 = (h52) obj;
                h52Var8.getClass();
                q52 q52Var8 = h52Var8.e;
                i52 i52Var8 = h52Var8.c;
                km4.o(q52Var8, i52Var8.d, 4.0f, 4);
                wgd.k(h52Var8.f, i52Var8.e, 4.0f, 4);
                return c1eVar;
            case 23:
                h52 h52Var9 = (h52) obj;
                h52Var9.getClass();
                h52Var9.f(new ze3(null, "spread"));
                h52Var9.d(new ze3(new vj3(40.0f), null));
                q52 q52Var9 = h52Var9.d;
                i52 i52Var9 = h52Var9.c;
                wgd.k(q52Var9, i52Var9.c, 0.0f, 6);
                km4.o(h52Var9.e, i52Var9.d, 0.0f, 6);
                wgd.k(h52Var9.f, i52Var9.e, 0.0f, 6);
                return c1eVar;
            case 24:
                h52 h52Var10 = (h52) obj;
                h52Var10.getClass();
                q52 q52Var10 = h52Var10.e;
                i52 i52Var10 = h52Var10.c;
                km4.o(q52Var10, i52Var10.d, 4.0f, 4);
                wgd.k(h52Var10.f, i52Var10.e, 4.0f, 4);
                return c1eVar;
            case 25:
                String str3 = (String) obj;
                str3.getClass();
                return str3.length() > 1 ? wgd.t(';', "L", str3) : str3;
            case 26:
                f41 f41Var = (f41) obj;
                f41Var.getClass();
                yq6 yq6VarP = f41Var.P();
                yq6VarP.getClass();
                return yq6VarP.getType();
            case 27:
                f41 f41Var2 = (f41) obj;
                f41Var2.getClass();
                mn6 returnType = f41Var2.getReturnType();
                returnType.getClass();
                return returnType;
            case 28:
                o3e o3eVar = (o3e) obj;
                o3eVar.getClass();
                return Boolean.valueOf(o3eVar instanceof wsa);
            default:
                co1 co1VarA = ((o3e) obj).j0().a();
                if (co1VarA == null) {
                    return Boolean.FALSE;
                }
                n98 name2 = co1VarA.getName();
                y05 y05Var = s96.f;
                if (g76.L(name2, y05Var.a.g()) && g76.L(f93.c(co1VarA), y05Var)) {
                    z = true;
                }
                return Boolean.valueOf(z);
        }
    }
}
