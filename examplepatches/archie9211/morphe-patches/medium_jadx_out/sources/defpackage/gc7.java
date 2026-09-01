package defpackage;

import android.graphics.Rect;
import java.io.EOFException;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gc7 {
    public static final hx4 a = hx4.d1("w", "h", "ip", "op", "fr", "v", "layers", "assets", "fonts", "chars", "markers");
    public static final hx4 b = hx4.d1("id", "layers", "w", "h", "p", "u");
    public static final hx4 c = hx4.d1("list");
    public static final hx4 d = hx4.d1("cm", "tm", "dr");

    /* JADX WARN: Failed to find 'out' block for switch in B:6:0x0045. Please report as an issue. */
    public static bc7 a(td6 td6Var) throws EOFException, kc6 {
        bc7 bc7Var;
        float f;
        bc7 bc7Var2;
        float f2;
        bc7 bc7Var3;
        int i;
        float f3;
        bc7 bc7Var4;
        int i2;
        float f4;
        float f5;
        float fC = gpe.c();
        ab7 ab7Var = new ab7((Object) null);
        ArrayList arrayList = new ArrayList();
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        HashMap map3 = new HashMap();
        ArrayList arrayList2 = new ArrayList();
        xkc xkcVar = new xkc(0);
        bc7 bc7Var5 = new bc7();
        td6Var.m();
        int iNextDouble = 0;
        int iNextDouble2 = 0;
        float fNextDouble = 0.0f;
        float fNextDouble2 = 0.0f;
        float fNextDouble3 = 0.0f;
        while (td6Var.hasNext()) {
            switch (td6Var.N(a)) {
                case 0:
                    bc7Var = bc7Var5;
                    iNextDouble = (int) td6Var.nextDouble();
                    bc7Var5 = bc7Var;
                    break;
                case 1:
                    bc7Var = bc7Var5;
                    iNextDouble2 = (int) td6Var.nextDouble();
                    bc7Var5 = bc7Var;
                    break;
                case 2:
                    bc7Var = bc7Var5;
                    fNextDouble2 = (float) td6Var.nextDouble();
                    bc7Var5 = bc7Var;
                    break;
                case 3:
                    f = fC;
                    bc7Var2 = bc7Var5;
                    fNextDouble = ((float) td6Var.nextDouble()) - 0.01f;
                    bc7Var5 = bc7Var2;
                    fC = f;
                    break;
                case 4:
                    f = fC;
                    bc7Var2 = bc7Var5;
                    fNextDouble3 = (float) td6Var.nextDouble();
                    bc7Var5 = bc7Var2;
                    fC = f;
                    break;
                case 5:
                    f2 = fC;
                    bc7Var3 = bc7Var5;
                    i = iNextDouble2;
                    f3 = fNextDouble2;
                    String[] strArrSplit = td6Var.q().split("\\.");
                    int i3 = Integer.parseInt(strArrSplit[0]);
                    int i4 = Integer.parseInt(strArrSplit[1]);
                    int i5 = Integer.parseInt(strArrSplit[2]);
                    if (i3 < 4 || (i3 <= 4 && (i4 < 4 || (i4 <= 4 && i5 < 0)))) {
                        bc7Var3.a("Lottie only supports bodymovin >= 4.4.0");
                    }
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
                case 6:
                    f2 = fC;
                    bc7 bc7Var6 = bc7Var5;
                    i = iNextDouble2;
                    f3 = fNextDouble2;
                    td6Var.f();
                    int i6 = 0;
                    while (td6Var.hasNext()) {
                        bc7 bc7Var7 = bc7Var6;
                        wo6 wo6VarA = yo6.a(td6Var, bc7Var7);
                        if (wo6VarA.e == uo6.IMAGE) {
                            i6++;
                        }
                        arrayList.add(wo6VarA);
                        ab7Var.i(wo6VarA.d, wo6VarA);
                        if (i6 > 4) {
                            h87.a("You have " + i6 + " images. Lottie should primarily be used with shapes. If you are using Adobe Illustrator, convert the Illustrator layers to shape layers.");
                        }
                        bc7Var6 = bc7Var7;
                    }
                    bc7Var3 = bc7Var6;
                    td6Var.p();
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
                case 7:
                    f2 = fC;
                    i = iNextDouble2;
                    f3 = fNextDouble2;
                    td6Var.f();
                    while (td6Var.hasNext()) {
                        ArrayList arrayList3 = new ArrayList();
                        ab7 ab7Var2 = new ab7((Object) null);
                        td6Var.m();
                        String strQ = null;
                        String strQ2 = null;
                        String strQ3 = null;
                        int iNextInt = 0;
                        int iNextInt2 = 0;
                        while (td6Var.hasNext()) {
                            int iN = td6Var.N(b);
                            if (iN != 0) {
                                if (iN == 1) {
                                    td6Var.f();
                                    while (td6Var.hasNext()) {
                                        wo6 wo6VarA2 = yo6.a(td6Var, bc7Var5);
                                        ab7Var2.i(wo6VarA2.d, wo6VarA2);
                                        arrayList3.add(wo6VarA2);
                                        bc7Var5 = bc7Var5;
                                    }
                                    bc7Var4 = bc7Var5;
                                    td6Var.p();
                                } else if (iN == 2) {
                                    iNextInt = td6Var.nextInt();
                                } else if (iN == 3) {
                                    iNextInt2 = td6Var.nextInt();
                                } else if (iN == 4) {
                                    strQ2 = td6Var.q();
                                } else if (iN != 5) {
                                    td6Var.Q();
                                    td6Var.v();
                                    bc7Var4 = bc7Var5;
                                } else {
                                    strQ3 = td6Var.q();
                                }
                                bc7Var5 = bc7Var4;
                            } else {
                                strQ = td6Var.q();
                            }
                        }
                        bc7 bc7Var8 = bc7Var5;
                        td6Var.B();
                        if (strQ2 != null) {
                            map2.put(strQ, new tc7(iNextInt, iNextInt2, strQ, strQ2, strQ3));
                        } else {
                            map.put(strQ, arrayList3);
                        }
                        bc7Var5 = bc7Var8;
                    }
                    td6Var.p();
                    bc7Var3 = bc7Var5;
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
                case 8:
                    f2 = fC;
                    int i7 = iNextDouble2;
                    float f6 = fNextDouble2;
                    td6Var.m();
                    while (td6Var.hasNext()) {
                        if (td6Var.N(c) != 0) {
                            td6Var.Q();
                            td6Var.v();
                        } else {
                            td6Var.f();
                            while (td6Var.hasNext()) {
                                hx4 hx4Var = hz4.a;
                                td6Var.m();
                                String strQ4 = null;
                                String strQ5 = null;
                                String strQ6 = null;
                                while (td6Var.hasNext()) {
                                    int i8 = i7;
                                    int iN2 = td6Var.N(hz4.a);
                                    if (iN2 != 0) {
                                        float f7 = f6;
                                        if (iN2 == 1) {
                                            strQ5 = td6Var.q();
                                        } else if (iN2 == 2) {
                                            strQ6 = td6Var.q();
                                        } else if (iN2 != 3) {
                                            td6Var.Q();
                                            td6Var.v();
                                        } else {
                                            td6Var.nextDouble();
                                        }
                                        i7 = i8;
                                        f6 = f7;
                                    } else {
                                        strQ4 = td6Var.q();
                                        i7 = i8;
                                    }
                                }
                                td6Var.B();
                                map3.put(strQ5, new vy4(strQ4, strQ5, strQ6));
                                i7 = i7;
                            }
                            td6Var.p();
                        }
                    }
                    i = i7;
                    f3 = f6;
                    td6Var.B();
                    bc7Var3 = bc7Var5;
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
                case 9:
                    f2 = fC;
                    i2 = iNextDouble2;
                    f4 = fNextDouble2;
                    td6Var.f();
                    while (td6Var.hasNext()) {
                        hx4 hx4Var2 = xy4.a;
                        ArrayList arrayList4 = new ArrayList();
                        td6Var.m();
                        double dNextDouble = 0.0d;
                        char cCharAt = 0;
                        String strQ7 = null;
                        String strQ8 = null;
                        while (td6Var.hasNext()) {
                            int iN3 = td6Var.N(xy4.a);
                            if (iN3 == 0) {
                                cCharAt = td6Var.q().charAt(0);
                            } else if (iN3 == 1) {
                                td6Var.nextDouble();
                            } else if (iN3 == 2) {
                                dNextDouble = td6Var.nextDouble();
                            } else if (iN3 == 3) {
                                strQ7 = td6Var.q();
                            } else if (iN3 == 4) {
                                strQ8 = td6Var.q();
                            } else if (iN3 != 5) {
                                td6Var.Q();
                                td6Var.v();
                            } else {
                                td6Var.m();
                                while (td6Var.hasNext()) {
                                    if (td6Var.N(xy4.b) != 0) {
                                        td6Var.Q();
                                        td6Var.v();
                                    } else {
                                        td6Var.f();
                                        while (td6Var.hasNext()) {
                                            arrayList4.add((x3c) s82.a(td6Var, bc7Var5));
                                        }
                                        td6Var.p();
                                    }
                                }
                                td6Var.B();
                            }
                        }
                        td6Var.B();
                        wy4 wy4Var = new wy4(arrayList4, cCharAt, dNextDouble, strQ7, strQ8);
                        xkcVar.d(wy4Var.hashCode(), wy4Var);
                    }
                    td6Var.p();
                    i = i2;
                    f3 = f4;
                    bc7Var3 = bc7Var5;
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
                case 10:
                    td6Var.f();
                    while (td6Var.hasNext()) {
                        td6Var.m();
                        String strQ9 = null;
                        float fNextDouble4 = 0.0f;
                        while (td6Var.hasNext()) {
                            int iN4 = td6Var.N(d);
                            if (iN4 != 0) {
                                f5 = fC;
                                if (iN4 == 1) {
                                    fNextDouble2 = fNextDouble2;
                                    fNextDouble4 = (float) td6Var.nextDouble();
                                    iNextDouble2 = iNextDouble2;
                                } else if (iN4 != 2) {
                                    td6Var.Q();
                                    td6Var.v();
                                } else {
                                    td6Var.nextDouble();
                                }
                            } else {
                                f5 = fC;
                                strQ9 = td6Var.q();
                            }
                            fC = f5;
                        }
                        td6Var.B();
                        arrayList2.add(new ki7(fNextDouble4, strQ9));
                        iNextDouble2 = iNextDouble2;
                        fNextDouble2 = fNextDouble2;
                        fC = fC;
                    }
                    f2 = fC;
                    i2 = iNextDouble2;
                    f4 = fNextDouble2;
                    td6Var.p();
                    i = i2;
                    f3 = f4;
                    bc7Var3 = bc7Var5;
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
                default:
                    td6Var.Q();
                    td6Var.v();
                    f2 = fC;
                    bc7Var3 = bc7Var5;
                    i = iNextDouble2;
                    f3 = fNextDouble2;
                    bc7Var5 = bc7Var3;
                    iNextDouble2 = i;
                    fC = f2;
                    fNextDouble2 = f3;
                    break;
            }
        }
        float f8 = fC;
        bc7 bc7Var9 = bc7Var5;
        Rect rect = new Rect(0, 0, (int) (iNextDouble * f8), (int) (iNextDouble2 * f8));
        float fC2 = gpe.c();
        bc7Var9.k = rect;
        bc7Var9.l = fNextDouble2;
        bc7Var9.m = fNextDouble;
        bc7Var9.n = fNextDouble3;
        bc7Var9.j = arrayList;
        bc7Var9.i = ab7Var;
        bc7Var9.c = map;
        bc7Var9.d = map2;
        bc7Var9.e = fC2;
        bc7Var9.h = xkcVar;
        bc7Var9.f = map3;
        bc7Var9.g = arrayList2;
        return bc7Var9;
    }
}
