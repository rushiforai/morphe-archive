package defpackage;

import android.speech.tts.Voice;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.graphql.PubMonthlyStatsAndChartQuery;
import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class js4 implements Comparator {
    public static final js4 b = new js4(0);
    public static final js4 c = new js4(1);
    public static final js4 d = new js4(2);
    public static final js4 e = new js4(3);
    public static final js4 f = new js4(4);
    public static final js4 g = new js4(5);
    public final /* synthetic */ int a;

    public /* synthetic */ js4(int i) {
        this.a = i;
    }

    public static int a(yv2 yv2Var) {
        if (yv2Var == null) {
            d93.a(36);
            throw null;
        }
        if (d93.m(yv2Var, qn1.ENUM_ENTRY)) {
            return 8;
        }
        if (yv2Var instanceof p72) {
            return 7;
        }
        if (yv2Var instanceof q4a) {
            return ((q4a) yv2Var).P() == null ? 6 : 5;
        }
        if (yv2Var instanceof s55) {
            return ((s55) yv2Var).P() == null ? 4 : 3;
        }
        if (yv2Var instanceof y28) {
            return 2;
        }
        return yv2Var instanceof ha3 ? 1 : 0;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        Integer numValueOf;
        int iSignum;
        switch (this.a) {
            case 0:
                es4 es4Var = (es4) obj;
                es4 es4Var2 = (es4) obj2;
                if (rx0.Q(es4Var) && rx0.Q(es4Var2)) {
                    aq6 aq6VarV0 = flb.v0(es4Var);
                    aq6 aq6VarV02 = flb.v0(es4Var2);
                    if (!g76.L(aq6VarV0, aq6VarV02)) {
                        Object[] objArr = new aq6[16];
                        int i = 0;
                        while (aq6VarV0 != null) {
                            int i2 = i + 1;
                            if (objArr.length < i2) {
                                int length = objArr.length;
                                Object[] objArr2 = new Object[Math.max(i2, length * 2)];
                                System.arraycopy(objArr, 0, objArr2, 0, length);
                                objArr = objArr2;
                            }
                            if (i != 0) {
                                System.arraycopy(objArr, 0, objArr, 0 + 1, i + 0);
                            }
                            objArr[0] = aq6VarV0;
                            i++;
                            aq6VarV0 = aq6VarV0.v();
                        }
                        Object[] objArr3 = new aq6[16];
                        int i3 = 0;
                        while (aq6VarV02 != null) {
                            int i4 = i3 + 1;
                            if (objArr3.length < i4) {
                                int length2 = objArr3.length;
                                Object[] objArr4 = new Object[Math.max(i4, length2 * 2)];
                                System.arraycopy(objArr3, 0, objArr4, 0, length2);
                                objArr3 = objArr4;
                            }
                            if (i3 != 0) {
                                System.arraycopy(objArr3, 0, objArr3, 0 + 1, i3 + 0);
                            }
                            objArr3[0] = aq6VarV02;
                            i3++;
                            aq6VarV02 = aq6VarV02.v();
                        }
                        int iMin = Math.min(i - 1, i3 - 1);
                        if (iMin >= 0) {
                            int i5 = 0;
                            while (g76.L(objArr[i5], objArr3[i5])) {
                                if (i5 != iMin) {
                                    i5++;
                                }
                            }
                            return g76.Q(((aq6) objArr[i5]).w(), ((aq6) objArr3[i5]).w());
                        }
                        ygf.f("Could not find a common ancestor between the two FocusModifiers.");
                    }
                } else {
                    if (rx0.Q(es4Var)) {
                        return -1;
                    }
                    if (rx0.Q(es4Var2)) {
                        return 1;
                    }
                }
                return 0;
            case 1:
                zwa zwaVarH = ((zxb) obj).h();
                zwa zwaVarH2 = ((zxb) obj2).h();
                int iCompare = Float.compare(zwaVarH.a, zwaVarH2.a);
                if (iCompare != 0) {
                    return iCompare;
                }
                int iCompare2 = Float.compare(zwaVarH.b, zwaVarH2.b);
                if (iCompare2 != 0) {
                    return iCompare2;
                }
                int iCompare3 = Float.compare(zwaVarH.d, zwaVarH2.d);
                return iCompare3 != 0 ? iCompare3 : Float.compare(zwaVarH.c, zwaVarH2.c);
            case 2:
                yv2 yv2Var = (yv2) obj;
                yv2 yv2Var2 = (yv2) obj2;
                int iA = a(yv2Var2) - a(yv2Var);
                if (iA != 0) {
                    numValueOf = Integer.valueOf(iA);
                } else {
                    qn1 qn1Var = qn1.ENUM_ENTRY;
                    if (d93.m(yv2Var, qn1Var) && d93.m(yv2Var2, qn1Var)) {
                        numValueOf = 0;
                    } else {
                        int iCompareTo = yv2Var.getName().a.compareTo(yv2Var2.getName().a);
                        numValueOf = iCompareTo != 0 ? Integer.valueOf(iCompareTo) : null;
                    }
                }
                if (numValueOf != null) {
                    return numValueOf.intValue();
                }
                return 0;
            case 3:
                aq6 aq6Var = (aq6) obj;
                aq6 aq6Var2 = (aq6) obj2;
                int iQ = g76.Q(aq6Var2.p, aq6Var.p);
                return iQ != 0 ? iQ : g76.Q(aq6Var.hashCode(), aq6Var2.hashCode());
            case 4:
                zwa zwaVarH3 = ((zxb) obj).h();
                zwa zwaVarH4 = ((zxb) obj2).h();
                int iCompare4 = Float.compare(zwaVarH4.c, zwaVarH3.c);
                if (iCompare4 != 0) {
                    return iCompare4;
                }
                int iCompare5 = Float.compare(zwaVarH3.b, zwaVarH4.b);
                if (iCompare5 != 0) {
                    return iCompare5;
                }
                int iCompare6 = Float.compare(zwaVarH3.d, zwaVarH4.d);
                return iCompare6 != 0 ? iCompare6 : Float.compare(zwaVarH4.a, zwaVarH3.a);
            case 5:
                f09 f09Var = (f09) obj;
                f09 f09Var2 = (f09) obj2;
                int iCompare7 = Float.compare(((zwa) f09Var.a).b, ((zwa) f09Var2.a).b);
                return iCompare7 != 0 ? iCompare7 : Float.compare(((zwa) f09Var.a).d, ((zwa) f09Var2.a).d);
            case 6:
                return pwd.D(Integer.valueOf(((lx) obj).b), Integer.valueOf(((lx) obj2).b));
            case 7:
                return pwd.D(Integer.valueOf(((lx) obj).b), Integer.valueOf(((lx) obj2).b));
            case 8:
                return pwd.D(Long.valueOf(((a95) obj).c), Long.valueOf(((a95) obj2).c));
            case 9:
                return pwd.D(Long.valueOf(((rv2) obj2).a), Long.valueOf(((rv2) obj).a));
            case 10:
                String str = (String) obj;
                String str2 = (String) obj2;
                str.getClass();
                str2.getClass();
                int iMin2 = Math.min(str.length(), str2.length());
                int i6 = 4;
                while (true) {
                    if (i6 >= iMin2) {
                        int length3 = str.length();
                        int length4 = str2.length();
                        if (length3 == length4) {
                            return 0;
                        }
                        if (length3 >= length4) {
                            return 1;
                        }
                    } else {
                        char cCharAt = str.charAt(i6);
                        char cCharAt2 = str2.charAt(i6);
                        if (cCharAt == cCharAt2) {
                            i6++;
                        } else if (g76.Q(cCharAt, cCharAt2) >= 0) {
                            return 1;
                        }
                    }
                }
                return -1;
            case 11:
                return pwd.D(f93.g((y28) obj).a.a, f93.g((y28) obj2).a.a);
            case 12:
                return pwd.D((String) ((f09) obj).a, (String) ((f09) obj2).a);
            case 13:
                WeakHashMap weakHashMap = ute.a;
                float z = ((View) obj).getZ();
                float z2 = ((View) obj2).getZ();
                if (z > z2) {
                    return -1;
                }
                return z < z2 ? 1 : 0;
            case 14:
                bj2 bj2Var = (bj2) obj;
                bj2 bj2Var2 = (bj2) obj2;
                if ("Fallback-Cronet-Provider".equals(bj2Var.a.d())) {
                    return 1;
                }
                if ("Fallback-Cronet-Provider".equals(bj2Var2.a.d())) {
                    return -1;
                }
                String strE = bj2Var.a.e();
                String strE2 = bj2Var2.a.e();
                if (strE == null || strE2 == null) {
                    ay0.e("The input values cannot be null");
                    return 0;
                }
                String[] strArrSplit = strE.split("\\.");
                String[] strArrSplit2 = strE2.split("\\.");
                for (int i7 = 0; i7 < strArrSplit.length && i7 < strArrSplit2.length; i7++) {
                    try {
                        int i8 = Integer.parseInt(strArrSplit[i7]);
                        int i9 = Integer.parseInt(strArrSplit2[i7]);
                        if (i8 != i9) {
                            iSignum = Integer.signum(i8 - i9);
                            return -iSignum;
                        }
                    } catch (NumberFormatException e2) {
                        throw new IllegalArgumentException(lv8.r("Unable to convert version segments into integers: ", strArrSplit[i7], " & ", strArrSplit2[i7]), e2);
                    }
                }
                iSignum = Integer.signum(strArrSplit.length - strArrSplit2.length);
                return -iSignum;
            case 15:
                return pwd.D(Integer.valueOf(((Number) ((f09) obj).a).intValue()), Integer.valueOf(((Number) ((f09) obj2).a).intValue()));
            case 16:
                return pwd.D(((Voice) obj).getLocale().getDisplayCountry(), ((Voice) obj2).getLocale().getDisplayCountry());
            case 17:
                aq6 aq6Var3 = (aq6) obj;
                aq6 aq6Var4 = (aq6) obj2;
                int iQ2 = g76.Q(aq6Var3.p, aq6Var4.p);
                return iQ2 != 0 ? iQ2 : g76.Q(aq6Var3.hashCode(), aq6Var4.hashCode());
            case 18:
                return ((zb3) obj).a - ((zb3) obj2).a;
            case 19:
                u65 u65Var = (u65) obj;
                u65 u65Var2 = (u65) obj2;
                RecyclerView recyclerView = u65Var.d;
                if ((recyclerView == null) == (u65Var2.d == null)) {
                    boolean z3 = u65Var.a;
                    if (z3 == u65Var2.a) {
                        int i10 = u65Var2.b - u65Var.b;
                        if (i10 != 0) {
                            return i10;
                        }
                        int i11 = u65Var.c - u65Var2.c;
                        if (i11 != 0) {
                            return i11;
                        }
                        return 0;
                    }
                    if (!z3) {
                        return 1;
                    }
                } else if (recyclerView == null) {
                    return 1;
                }
                return -1;
            case 20:
                return ((spc) obj).d - ((spc) obj2).d;
            case 21:
                return pwd.D(((Method) obj).getName(), ((Method) obj2).getName());
            case 22:
                return pwd.D(((ri6) obj).getName(), ((ri6) obj2).getName());
            case 23:
                x2b x2bVar = ph6.a;
                Integer numB = h93.b((g93) obj, (g93) obj2);
                if (numB != null) {
                    return numB.intValue();
                }
                return 0;
            case 24:
                return ((Comparable) obj).compareTo((Comparable) obj2);
            case 25:
                return ((Comparable) obj).compareTo((Comparable) obj2);
            case 26:
                return pwd.D(Long.valueOf(((kb9) obj).b), Long.valueOf(((kb9) obj2).b));
            case 27:
                return ((gkc) obj).b - ((gkc) obj2).b;
            case 28:
                return pwd.D(Long.valueOf(((PubMonthlyStatsAndChartQuery.Point) obj).getMonthlyChartPostStatsPoint().getTimestamp()), Long.valueOf(((PubMonthlyStatsAndChartQuery.Point) obj2).getMonthlyChartPostStatsPoint().getTimestamp()));
            default:
                ((wp8) obj2).getClass();
                ((wp8) obj).getClass();
                return pwd.D(2, 2);
        }
    }
}
