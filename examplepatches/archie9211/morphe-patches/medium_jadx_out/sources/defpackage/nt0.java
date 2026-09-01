package defpackage;

import android.os.Bundle;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nt0 extends wb8 {
    public final /* synthetic */ int r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nt0(int i, boolean z) {
        super(z);
        this.r = i;
    }

    public static int[] g(String str) {
        str.getClass();
        return new int[]{((Number) wb8.b.c(str)).intValue()};
    }

    public static long[] h(String str) {
        str.getClass();
        return new long[]{((Number) wb8.f.c(str)).longValue()};
    }

    public static boolean[] i(String str) {
        str.getClass();
        return new boolean[]{((Boolean) wb8.l.c(str)).booleanValue()};
    }

    @Override // defpackage.wb8
    public final Object a(String str, Bundle bundle) {
        switch (this.r) {
            case 0:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                boolean[] booleanArray = bundle.getBooleanArray(str);
                if (booleanArray != null) {
                    return booleanArray;
                }
                wo7.q(str);
                throw null;
            case 1:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                boolean[] booleanArray2 = bundle.getBooleanArray(str);
                if (booleanArray2 != null) {
                    return k80.R0(booleanArray2);
                }
                wo7.q(str);
                throw null;
            case 2:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                float[] floatArray = bundle.getFloatArray(str);
                if (floatArray != null) {
                    return floatArray;
                }
                wo7.q(str);
                throw null;
            case 3:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                float[] floatArray2 = bundle.getFloatArray(str);
                if (floatArray2 != null) {
                    return k80.N0(floatArray2);
                }
                wo7.q(str);
                throw null;
            case 4:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                int[] intArray = bundle.getIntArray(str);
                if (intArray != null) {
                    return intArray;
                }
                wo7.q(str);
                throw null;
            case 5:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                int[] intArray2 = bundle.getIntArray(str);
                if (intArray2 != null) {
                    return k80.O0(intArray2);
                }
                wo7.q(str);
                throw null;
            case 6:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                long[] longArray = bundle.getLongArray(str);
                if (longArray != null) {
                    return longArray;
                }
                wo7.q(str);
                throw null;
            case 7:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                long[] longArray2 = bundle.getLongArray(str);
                if (longArray2 != null) {
                    return k80.P0(longArray2);
                }
                wo7.q(str);
                throw null;
            case 8:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                String[] stringArray = bundle.getStringArray(str);
                if (stringArray != null) {
                    return stringArray;
                }
                wo7.q(str);
                throw null;
            default:
                bundle.getClass();
                if (!bundle.containsKey(str) || vo7.B(str, bundle)) {
                    return null;
                }
                String[] stringArray2 = bundle.getStringArray(str);
                if (stringArray2 != null) {
                    return k80.Q0(stringArray2);
                }
                wo7.q(str);
                throw null;
        }
    }

    @Override // defpackage.wb8
    public final String b() {
        switch (this.r) {
            case 0:
                return "boolean[]";
            case 1:
                return "List<Boolean>";
            case 2:
                return "float[]";
            case 3:
                return "List<Float>";
            case 4:
                return "integer[]";
            case 5:
                return "List<Int>";
            case 6:
                return "long[]";
            case 7:
                return "List<Long>";
            case 8:
                return "string[]";
            default:
                return "List<String>";
        }
    }

    @Override // defpackage.wb8
    public final Object c(String str) {
        switch (this.r) {
            case 0:
                return i(str);
            case 1:
                str.getClass();
                return d46.Q(wb8.l.c(str));
            case 2:
                str.getClass();
                return new float[]{Float.parseFloat(str)};
            case 3:
                str.getClass();
                return d46.Q(Float.valueOf(Float.parseFloat(str)));
            case 4:
                return g(str);
            case 5:
                str.getClass();
                return d46.Q(wb8.b.c(str));
            case 6:
                return h(str);
            case 7:
                str.getClass();
                return d46.Q(wb8.f.c(str));
            case 8:
                str.getClass();
                return new String[]{str};
            default:
                str.getClass();
                return d46.Q(str);
        }
    }

    @Override // defpackage.wb8
    public final Object d(String str, Object obj) {
        switch (this.r) {
            case 0:
                boolean[] zArr = (boolean[]) obj;
                if (zArr == null) {
                    return i(str);
                }
                boolean[] zArrI = i(str);
                int length = zArr.length;
                boolean[] zArrCopyOf = Arrays.copyOf(zArr, length + 1);
                System.arraycopy(zArrI, 0, zArrCopyOf, length, 1);
                return zArrCopyOf;
            case 1:
                List list = (List) obj;
                ot0 ot0Var = wb8.l;
                return list != null ? bu1.Q0(d46.Q(ot0Var.c(str)), list) : d46.Q(ot0Var.c(str));
            case 2:
                float[] fArr = (float[]) obj;
                if (fArr == null) {
                    return new float[]{Float.parseFloat(str)};
                }
                float[] fArr2 = {Float.parseFloat(str)};
                int length2 = fArr.length;
                float[] fArrCopyOf = Arrays.copyOf(fArr, length2 + 1);
                System.arraycopy(fArr2, 0, fArrCopyOf, length2, 1);
                return fArrCopyOf;
            case 3:
                List list2 = (List) obj;
                return list2 != null ? bu1.Q0(d46.Q(Float.valueOf(Float.parseFloat(str))), list2) : d46.Q(Float.valueOf(Float.parseFloat(str)));
            case 4:
                int[] iArr = (int[]) obj;
                if (iArr == null) {
                    return g(str);
                }
                int[] iArrG = g(str);
                int length3 = iArr.length;
                int[] iArrCopyOf = Arrays.copyOf(iArr, length3 + 1);
                System.arraycopy(iArrG, 0, iArrCopyOf, length3, 1);
                return iArrCopyOf;
            case 5:
                List list3 = (List) obj;
                ot0 ot0Var2 = wb8.b;
                return list3 != null ? bu1.Q0(d46.Q(ot0Var2.c(str)), list3) : d46.Q(ot0Var2.c(str));
            case 6:
                long[] jArr = (long[]) obj;
                if (jArr == null) {
                    return h(str);
                }
                long[] jArrH = h(str);
                int length4 = jArr.length;
                long[] jArrCopyOf = Arrays.copyOf(jArr, length4 + 1);
                System.arraycopy(jArrH, 0, jArrCopyOf, length4, 1);
                return jArrCopyOf;
            case 7:
                List list4 = (List) obj;
                ot0 ot0Var3 = wb8.f;
                return list4 != null ? bu1.Q0(d46.Q(ot0Var3.c(str)), list4) : d46.Q(ot0Var3.c(str));
            case 8:
                String[] strArr = (String[]) obj;
                if (strArr == null) {
                    return new String[]{str};
                }
                String[] strArr2 = {str};
                int length5 = strArr.length;
                Object[] objArrCopyOf = Arrays.copyOf(strArr, length5 + 1);
                System.arraycopy(strArr2, 0, objArrCopyOf, length5, 1);
                return (String[]) objArrCopyOf;
            default:
                List list5 = (List) obj;
                return list5 != null ? bu1.Q0(d46.Q(str), list5) : d46.Q(str);
        }
    }

    @Override // defpackage.wb8
    public final void e(Bundle bundle, String str, Object obj) {
        int i = 0;
        switch (this.r) {
            case 0:
                boolean[] zArr = (boolean[]) obj;
                str.getClass();
                if (zArr == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putBooleanArray(str, zArr);
                }
                break;
            case 1:
                List list = (List) obj;
                str.getClass();
                if (list == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putBooleanArray(str, bu1.i1(list));
                }
                break;
            case 2:
                float[] fArr = (float[]) obj;
                str.getClass();
                if (fArr == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putFloatArray(str, fArr);
                }
                break;
            case 3:
                List list2 = (List) obj;
                str.getClass();
                if (list2 == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putFloatArray(str, bu1.k1(list2));
                }
                break;
            case 4:
                int[] iArr = (int[]) obj;
                str.getClass();
                if (iArr == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putIntArray(str, iArr);
                }
                break;
            case 5:
                List list3 = (List) obj;
                str.getClass();
                if (list3 != null) {
                    bundle.putIntArray(str, bu1.l1(list3));
                }
                break;
            case 6:
                long[] jArr = (long[]) obj;
                str.getClass();
                if (jArr == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putLongArray(str, jArr);
                }
                break;
            case 7:
                List list4 = (List) obj;
                str.getClass();
                if (list4 == null) {
                    bundle.putString(str, null);
                } else {
                    long[] jArr2 = new long[list4.size()];
                    Iterator it2 = list4.iterator();
                    while (it2.hasNext()) {
                        jArr2[i] = ((Number) it2.next()).longValue();
                        i++;
                    }
                    bundle.putLongArray(str, jArr2);
                }
                break;
            case 8:
                String[] strArr = (String[]) obj;
                str.getClass();
                if (strArr == null) {
                    bundle.putString(str, null);
                } else {
                    bundle.putStringArray(str, strArr);
                }
                break;
            default:
                List list5 = (List) obj;
                str.getClass();
                if (list5 == null) {
                    bundle.putString(str, null);
                } else {
                    String[] strArr2 = (String[]) list5.toArray(new String[0]);
                    strArr2.getClass();
                    bundle.putStringArray(str, strArr2);
                }
                break;
        }
    }
}
