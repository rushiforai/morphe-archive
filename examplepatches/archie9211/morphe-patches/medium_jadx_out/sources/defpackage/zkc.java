package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class zkc implements x45 {
    public static final zkc b = new zkc(0);
    public static final zkc c = new zkc(1);
    public static final zkc d = new zkc(2);
    public static final zkc e = new zkc(3);
    public static final zkc f = new zkc(4);
    public static final zkc g = new zkc(5);
    public static final zkc h = new zkc(6);
    public static final zkc i = new zkc(7);
    public static final zkc j = new zkc(8);
    public static final zkc k = new zkc(9);
    public static final zkc l = new zkc(10);
    public static final zkc m = new zkc(11);
    public static final zkc n = new zkc(12);
    public static final zkc o = new zkc(13);
    public static final zkc p = new zkc(14);
    public static final zkc q = new zkc(15);
    public static final zkc r = new zkc(16);
    public static final zkc s = new zkc(17);
    public static final zkc t = new zkc(18);
    public static final zkc u = new zkc(19);
    public static final zkc v = new zkc(20);
    public static final zkc w = new zkc(21);
    public final /* synthetic */ int a;

    public /* synthetic */ zkc(int i2) {
        this.a = i2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        f41 f41VarB;
        String strT;
        int i2 = this.a;
        boolean z = false;
        jlc jlcVar = null;
        int i3 = 1;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                f41 f41Var = (f41) obj;
                f41Var.getClass();
                return Boolean.valueOf(dm2.K(f93.i(f41Var)));
            case 1:
                f41 f41Var2 = (f41) obj;
                f41Var2.getClass();
                int i4 = z01.l;
                bec becVar = (bec) f41Var2;
                if (vm6.z(becVar) && f93.b(becVar, new z(9, becVar)) != null) {
                    z = true;
                }
                return Boolean.valueOf(z);
            case 2:
                f41 f41Var3 = (f41) obj;
                f41Var3.getClass();
                if (vm6.z(f41Var3)) {
                    int i5 = a11.l;
                    if (mlc.e.contains(f41Var3.getName()) && (f41VarB = f93.b(f41Var3, xx.i)) != null && (strT = vp7.t(f41VarB)) != null) {
                        jlcVar = mlc.b.contains(strT) ? jlc.ONE_COLLECTION_PARAMETER : ((llc) ei7.N(strT, mlc.d)) == llc.NULL ? jlc.OBJECT_PARAMETER_GENERIC : jlc.OBJECT_PARAMETER_NON_GENERIC;
                    }
                    if (jlcVar != null) {
                        z = true;
                    }
                }
                return Boolean.valueOf(z);
            case 3:
                h52 h52Var = (h52) obj;
                b09.G(h52Var, null, "spread");
                q52 q52Var = h52Var.e;
                i52 i52Var = h52Var.c;
                km4.o(q52Var, i52Var.d, 0.0f, 6);
                h52.c(h52Var, i52Var.c, i52Var.e, 24.0f, 24.0f, 0.0f, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                return c1eVar;
            case 4:
                h52 h52Var2 = (h52) obj;
                b09.G(h52Var2, null, "spread");
                i52 i52Var2 = h52Var2.c;
                h52.c(h52Var2, i52Var2.c, i52Var2.e, 24.0f, 24.0f, 0.0f, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                km4.o(h52Var2.g, i52Var2.f, 12.0f, 4);
                return c1eVar;
            case 5:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                q52 q52Var2 = h52Var3.d;
                i52 i52Var3 = h52Var3.c;
                wgd.k(q52Var2, i52Var3.c, 0.0f, 6);
                km4.o(h52Var3.e, i52Var3.d, 0.0f, 6);
                wgd.k(h52Var3.f, i52Var3.e, 2.0f, 4);
                ka1.A(h52Var3, null, "parent");
                return c1eVar;
            case 6:
                h52 h52Var4 = (h52) obj;
                h52Var4.getClass();
                q52 q52Var3 = h52Var4.e;
                i52 i52Var4 = h52Var4.c;
                km4.o(q52Var3, i52Var4.d, 0.0f, 6);
                wgd.k(h52Var4.d, i52Var4.c, 0.0f, 6);
                wgd.k(h52Var4.f, i52Var4.e, 0.0f, 6);
                return c1eVar;
            case 7:
                h52 h52Var5 = (h52) obj;
                h52Var5.getClass();
                i52 i52Var5 = h52Var5.c;
                h52.c(h52Var5, i52Var5.c, i52Var5.e, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                return c1eVar;
            case 8:
                bec becVar2 = (bec) obj;
                becVar2.getClass();
                return becVar2;
            case 9:
                q4a q4aVar = (q4a) obj;
                q4aVar.getClass();
                return q4aVar;
            case 10:
                c41 c41Var = (c41) obj;
                c41Var.getClass();
                return c41Var;
            case 11:
                yv2 yv2Var = (yv2) obj;
                yv2Var.getClass();
                return Boolean.valueOf(yv2Var instanceof c41);
            case 12:
                ((yv2) obj).getClass();
                return Boolean.valueOf(!(r0 instanceof p72));
            case 13:
                yv2 yv2Var2 = (yv2) obj;
                yv2Var2.getClass();
                List typeParameters = ((c41) yv2Var2).getTypeParameters();
                typeParameters.getClass();
                return new j80(i3, typeParameters);
            case 14:
                o3e o3eVar = (o3e) obj;
                o3eVar.getClass();
                co1 co1VarA = o3eVar.j0().a();
                if (co1VarA != null && (co1VarA instanceof swd) && (((swd) co1VarA).h() instanceof ha3)) {
                    z = true;
                }
                return Boolean.valueOf(z);
            case 15:
                o3e o3eVar2 = (o3e) obj;
                o3eVar2.getClass();
                co1 co1VarA2 = o3eVar2.j0().a();
                if (co1VarA2 != null && ((co1VarA2 instanceof ha3) || (co1VarA2 instanceof swd))) {
                    z = true;
                }
                return Boolean.valueOf(z);
            case 16:
                h52 h52Var6 = (h52) obj;
                h52Var6.getClass();
                i52 i52Var6 = h52Var6.c;
                h52.b(h52Var6, i52Var6.d, i52Var6.f, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                wgd.k(h52Var6.f, i52Var6.e, 0.0f, 6);
                return c1eVar;
            case 17:
                return null;
            case 18:
                h52 h52Var7 = (h52) obj;
                h52Var7.getClass();
                q52 q52Var4 = h52Var7.e;
                i52 i52Var7 = h52Var7.c;
                km4.o(q52Var4, i52Var7.d, 24.0f, 4);
                wgd.k(h52Var7.d, i52Var7.c, 24.0f, 4);
                return c1eVar;
            case 19:
                h52 h52Var8 = (h52) obj;
                h52Var8.getClass();
                q52 q52Var5 = h52Var8.e;
                i52 i52Var8 = h52Var8.c;
                km4.o(q52Var5, i52Var8.d, 2.0f, 4);
                wgd.k(h52Var8.f, i52Var8.e, 2.0f, 4);
                return c1eVar;
            case 20:
                h52 h52Var9 = (h52) obj;
                h52Var9.getClass();
                q52 q52Var6 = h52Var9.f;
                i52 i52Var9 = h52Var9.c;
                wgd.k(q52Var6, i52Var9.e, 0.0f, 6);
                km4.o(h52Var9.e, i52Var9.d, 0.0f, 6);
                km4.o(h52Var9.g, i52Var9.f, 0.0f, 6);
                return c1eVar;
            case 21:
                h52 h52Var10 = (h52) obj;
                b09.G(h52Var10, null, "parent");
                q52 q52Var7 = h52Var10.d;
                i52 i52Var10 = h52Var10.c;
                wgd.k(q52Var7, i52Var10.c, 0.0f, 6);
                wgd.k(h52Var10.f, i52Var10.e, 0.0f, 6);
                km4.o(h52Var10.g, i52Var10.f, 0.0f, 6);
                return c1eVar;
            case 22:
                ((sn6) obj).getClass();
                return null;
            case 23:
                f41 f41Var4 = (f41) obj;
                f41Var4.getClass();
                return f93.j(f41Var4);
            case 24:
                ((mn1) obj).getClass();
                return jkc.g0;
            case 25:
                f41 f41Var5 = (f41) obj;
                if (f41Var5.j() == e41.DECLARATION) {
                    yv2 yv2VarH = f41Var5.h();
                    yv2VarH.getClass();
                    String str = s96.a;
                    if (s96.j.containsKey(d93.g((y28) yv2VarH))) {
                        z = true;
                    }
                }
                return Boolean.valueOf(z);
            case 26:
                return ((s67) obj).b.invoke();
            case 27:
                return (f41) obj;
            case 28:
                return (f41) obj;
            default:
                h52 h52Var11 = (h52) obj;
                h52Var11.getClass();
                q52 q52Var8 = h52Var11.d;
                i52 i52Var11 = h52Var11.c;
                wgd.k(q52Var8, i52Var11.c, 0.0f, 6);
                wgd.k(h52Var11.f, i52Var11.e, 0.0f, 6);
                km4.o(h52Var11.g, i52Var11.f, 16.0f, 4);
                return c1eVar;
        }
    }

    public /* synthetic */ zkc(int i2, Object obj) {
        this.a = i2;
    }
}
