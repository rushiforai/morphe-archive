package defpackage;

import android.content.Context;
import android.net.Uri;
import androidx.compose.ui.platform.ComposeView;
import androidx.work.impl.yX.VrhD;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.post.PostFragment;
import gen.model.SourceParameter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import kotlinx.serialization.json.internal.JsonException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ps5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ps5(ga8 ga8Var, ba8 ba8Var, boolean z) {
        this.a = 16;
        this.b = ga8Var;
        this.c = ba8Var;
    }

    private final Object a() {
        ga8 ga8Var = (ga8) this.b;
        ba8 ba8Var = (ba8) this.c;
        ba8Var.getClass();
        synchronized (ga8Var.a) {
            try {
                xpc xpcVar = ga8Var.b;
                Iterable iterable = (Iterable) xpcVar.getValue();
                ArrayList arrayList = new ArrayList();
                for (Object obj : iterable) {
                    if (g76.L((ba8) obj, ba8Var)) {
                        break;
                    }
                    arrayList.add(obj);
                }
                xpcVar.m(null, arrayList);
            } catch (Throwable th) {
                throw th;
            }
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0, types: [n92] */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v23 */
    @Override // defpackage.m45
    public final Object invoke() {
        long jA;
        String[] strArrNames;
        int i = 1;
        int i2 = 3;
        Object[] objArr = 0;
        Object obj = null;
        Object obj2 = null;
        objArr = 0;
        switch (this.a) {
            case 0:
                a3 a3Var = (a3) this.b;
                v1c v1cVar = (v1c) this.c;
                rya ryaVar = new rya();
                qs5 qs5Var = (qs5) a3Var.b;
                synchronized (qs5Var.w) {
                    synchronized (qs5Var) {
                        try {
                            v1c v1cVar2 = qs5Var.r;
                            v1c v1cVar3 = new v1c();
                            v1cVar2.getClass();
                            for (int i3 = 0; i3 < 10; i3++) {
                                if (((1 << i3) & v1cVar2.a) != 0) {
                                    v1cVar3.b(i3, v1cVar2.b[i3]);
                                }
                            }
                            for (int i4 = 0; i4 < 10; i4++) {
                                if (((1 << i4) & v1cVar.a) != 0) {
                                    v1cVar3.b(i4, v1cVar.b[i4]);
                                }
                            }
                            ryaVar.a = v1cVar3;
                            jA = ((long) v1cVar3.a()) - ((long) v1cVar2.a());
                            if (jA != 0 && !qs5Var.b.isEmpty()) {
                                objArr = (xs5[]) qs5Var.b.values().toArray(new xs5[0]);
                            }
                            v1c v1cVar4 = (v1c) ryaVar.a;
                            v1cVar4.getClass();
                            qs5Var.r = v1cVar4;
                            bgd.c(qs5Var.j, qs5Var.c + " onSettings", 0L, new ps5(qs5Var, i, ryaVar), 6);
                        } catch (Throwable th) {
                            throw th;
                        }
                    }
                    try {
                        qs5Var.w.f((v1c) ryaVar.a);
                    } catch (IOException e) {
                        b14 b14Var = b14.PROTOCOL_ERROR;
                        qs5Var.f(b14Var, b14Var, e);
                    }
                    break;
                }
                if (objArr != 0) {
                    int length = objArr.length;
                    while (i < length) {
                        xs5 xs5Var = objArr[i];
                        synchronized (xs5Var) {
                            xs5Var.e += jA;
                            if (jA > 0) {
                                xs5Var.notifyAll();
                            }
                        }
                        i++;
                    }
                }
                return c1e.a;
            case 1:
                qs5 qs5Var2 = (qs5) this.b;
                qs5Var2.a.a(qs5Var2, (v1c) ((rya) this.c).a);
                return c1e.a;
            case 2:
                xzb xzbVar = (xzb) this.b;
                fb6 fb6Var = (fb6) this.c;
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                bgf.D(fb6Var, xzbVar);
                int iE = xzbVar.e();
                for (int i5 = 0; i5 < iE; i5++) {
                    List listG = xzbVar.g(i5);
                    ArrayList arrayList = new ArrayList();
                    for (Object obj3 : listG) {
                        if (obj3 instanceof nc6) {
                            arrayList.add(obj3);
                        }
                    }
                    nc6 nc6Var = (nc6) bu1.c1(arrayList);
                    if (nc6Var != null && (strArrNames = nc6Var.names()) != null) {
                        for (String str : strArrNames) {
                            String str2 = g76.L(xzbVar.j(), b0c.f) ? "enum value" : "property";
                            if (linkedHashMap.containsKey(str)) {
                                throw new JsonException("The suggested name '" + str + "' for " + str2 + ' ' + xzbVar.f(i5) + " is already one of the names for " + str2 + ' ' + xzbVar.f(((Number) ei7.N(str, linkedHashMap)).intValue()) + VrhD.RyaQJTjHel + xzbVar);
                            }
                            linkedHashMap.put(str, Integer.valueOf(i5));
                        }
                    }
                }
                return linkedHashMap.isEmpty() ? fy3.a : linkedHashMap;
            case 3:
                j83 j83Var = (j83) this.b;
                ur6 ur6Var = (ur6) this.c;
                er6 er6Var = (er6) j83Var.getValue();
                return new fr6(ur6Var, er6Var, new xp((n46) ur6Var.d.f.getValue(), er6Var));
            case 4:
                j83 j83Var2 = (j83) this.b;
                gz8 gz8Var = (gz8) this.c;
                vy8 vy8Var = (vy8) j83Var2.getValue();
                return new wy8(gz8Var, vy8Var, new xp((n46) ((au6) gz8Var.d.f).getValue(), vy8Var));
            case 5:
                kv6 kv6Var = (kv6) this.b;
                x45 x45Var = (x45) this.c;
                Integer numValueOf = Integer.valueOf(kv6Var.j().n);
                int i6 = kv6Var.j().n;
                if (i6 != 0) {
                    List list = kv6Var.j().k;
                    ListIterator listIterator = list.listIterator(list.size());
                    while (true) {
                        if (listIterator.hasPrevious()) {
                            Object objPrevious = listIterator.previous();
                            if (((Boolean) x45Var.invoke(objPrevious)).booleanValue()) {
                                obj2 = objPrevious;
                            }
                        }
                    }
                    dv6 dv6Var = (dv6) obj2;
                    i = dv6Var == null ? i6 : i6 - (dv6Var.a + 1);
                }
                return new f09(numValueOf, Integer.valueOf(i));
            case 6:
                return new sv6((qob) this.b, fy3.a, (nob) this.c);
            case 7:
                j83 j83Var3 = (j83) this.b;
                pw6 pw6Var = (pw6) this.c;
                zv6 zv6Var = (zv6) j83Var3.getValue();
                return new aw6(pw6Var, zv6Var, new xp((n46) ((au6) pw6Var.c.h).getValue(), zv6Var));
            case 8:
                pw6 pw6Var2 = (pw6) this.b;
                vx5 vx5Var = (vx5) this.c;
                Integer numValueOf2 = Integer.valueOf(pw6Var2.g().l);
                int i7 = pw6Var2.g().l;
                if (i7 != 0) {
                    List list2 = pw6Var2.g().m;
                    ListIterator listIterator2 = list2.listIterator(list2.size());
                    while (true) {
                        if (listIterator2.hasPrevious()) {
                            Object objPrevious2 = listIterator2.previous();
                            vx5Var.invoke(objPrevious2);
                            if (Boolean.TRUE.booleanValue()) {
                                obj = objPrevious2;
                            }
                        }
                    }
                    lw6 lw6Var = (lw6) obj;
                    i = lw6Var == null ? i7 : i7 - (lw6Var.a + 1);
                }
                return new f09(numValueOf2, Integer.valueOf(i));
            case 9:
                u37 u37Var = (u37) this.b;
                String str3 = (String) this.c;
                str3.getClass();
                u37Var.a.g0().v.invoke(str3);
                return c1e.a;
            case 10:
                rd6 rd6Var = (rd6) this.b;
                yi7 yi7Var = (yi7) this.c;
                m73 m73Var = flb.v0(yi7Var).y;
                yi7Var.s.g();
                int iG = yi7Var.t.g();
                rd6Var.getClass();
                return Integer.valueOf(nk7.w0(0.33333334f * iG));
            case 11:
                vx0.c0((sb2) this.b, null, null, new xi7((nx0) this.c, objArr, i), 3);
                return c1e.a;
            case 12:
                cv9 cv9Var = (cv9) this.b;
                b08 b08Var = (b08) this.c;
                sw9 sw9Var = cv9Var.a;
                String strU = gp7.u(b08Var.b);
                sw9Var.p.e(b08Var.c, sw9Var.D0, strU, sw9Var.d);
                vx0.c0(f76.F(sw9Var), null, null, new mo5(sw9Var, b08Var, strU, null, 28), 3);
                return c1e.a;
            case 13:
                ub0 ub0Var = (ub0) this.b;
                ye7 ye7Var = (ye7) this.c;
                if (ub0Var.i) {
                    MainActivity mainActivity = ye7Var.a;
                    int i8 = MainActivity.H;
                    y23 y23Var = (y23) mainActivity.v().c;
                    vx0.c0(y23Var.e, null, null, new t23(y23Var, objArr, 4), 3);
                } else {
                    String strU2 = gp7.u(new SourceParameter("tts_mini_player", null, null, null, null, ub0Var.a, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null));
                    MainActivity mainActivity2 = ye7Var.a;
                    int i9 = MainActivity.H;
                    y23 y23Var2 = (y23) mainActivity2.v().c;
                    y23Var2.getClass();
                    vx0.c0(y23Var2.e, null, null, new ku2(y23Var2, "", strU2, false ? 1 : 0, 4), 3);
                }
                return c1e.a;
            case 14:
                b98 b98Var = (b98) this.b;
                String str4 = ((dce) this.c).a;
                i98 i98Var = (i98) b98Var;
                i98Var.getClass();
                str4.getClass();
                m98 m98Var = i98Var.a;
                m98Var.i();
                m98Var.e(str4);
                return c1e.a;
            case 15:
                b98 b98Var2 = (b98) this.b;
                rg1 rg1Var = ((mce) ((nce) this.c)).a;
                i98 i98Var2 = (i98) b98Var2;
                i98Var2.getClass();
                m98 m98Var2 = i98Var2.a;
                vx0.c0(f76.F(m98Var2), null, null, new fde(m98Var2, rg1Var, objArr, i), 3);
                return c1e.a;
            case 16:
                return a();
            case 17:
                ku3 ku3Var = (ku3) this.b;
                nwa nwaVar = (nwa) this.c;
                if (((x90) ku3Var.b).get() == 0) {
                    nwaVar.invoke();
                }
                return c1e.a;
            case 18:
                md5 md5Var = (md5) this.b;
                oh8 oh8Var = (oh8) this.c;
                sw9 sw9Var2 = (sw9) md5Var.b;
                String strU3 = gp7.u(oh8Var.e);
                sw9Var2.p.e(oh8Var.f, sw9Var2.D0, strU3, sw9Var2.d);
                vx0.c0(f76.F(sw9Var2), null, null, new mo5(sw9Var2, oh8Var, strU3, null, 29), 3);
                return c1e.a;
            case 19:
                ((vk8) this.b).a((NotificationFilterType) this.c);
                return c1e.a;
            case 20:
                vn8 vn8Var = (vn8) this.b;
                xn8 xn8Var = (xn8) this.c;
                vn8Var.a(xn8Var.e, xn8Var.f);
                return c1e.a;
            case 21:
                Integer num = (Integer) this.b;
                Integer num2 = (Integer) this.c;
                Float fValueOf = num != null ? Float.valueOf(num.intValue()) : null;
                if (g76.J(fValueOf, 0.0f)) {
                    fValueOf = null;
                }
                Float fValueOf2 = num2 != null ? Float.valueOf(num2.intValue()) : null;
                if (g76.J(fValueOf2, 0.0f)) {
                    fValueOf2 = null;
                }
                if (fValueOf == null || fValueOf2 == null) {
                    return null;
                }
                return Float.valueOf(fValueOf2.floatValue() / fValueOf.floatValue());
            case 22:
                return Integer.valueOf(nk7.w0((((Integer) this.b) != null ? r1.intValue() : 0) * ((Context) this.c).getResources().getDisplayMetrics().density));
            case 23:
                ((c39) this.b).i.b((String) this.c);
                return c1e.a;
            case 24:
                ((c39) this.b).i.a((Uri) this.c);
                return c1e.a;
            case 25:
                ((pkf) this.b).E((rn3) this.c);
                return c1e.a;
            case 26:
                ((pkf) this.b).E((n76) this.c);
                return c1e.a;
            case 27:
                te9 te9Var = (te9) this.b;
                cv7 cv7Var = (cv7) this.c;
                te9Var.a(cv7Var.c, cv7Var.a, cv7Var.b);
                return c1e.a;
            case 28:
                ((te9) this.b).b((tf9) this.c);
                return c1e.a;
            default:
                PostFragment postFragment = (PostFragment) this.b;
                jz1 jz1Var = (jz1) this.c;
                sw9 sw9VarK1 = postFragment.k1();
                vx0.c0(f76.F(sw9VarK1), null, null, new nr9(i2, objArr, sw9VarK1), 3);
                postFragment.x0.setValue(Boolean.FALSE);
                ((ComposeView) jz1Var.d).setVisibility(8);
                return c1e.a;
        }
    }

    public /* synthetic */ ps5(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
