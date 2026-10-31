package p6;

import android.os.Bundle;
import com.amplitude.android.migration.DatabaseConstants;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class q0 extends x0 {

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f82241l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q0(boolean z11, int i5) {
        super(z11);
        this.f82241l = i5;
    }

    public static float[] f(String str) {
        return new float[]{Float.valueOf(Float.parseFloat(str)).floatValue()};
    }

    public static int[] g(String str) {
        return new int[]{((Number) x0.f82286b.d(str)).intValue()};
    }

    public static long[] h(String str) {
        return new long[]{((Number) x0.f82288d.d(str)).longValue()};
    }

    public static boolean[] i(String str) {
        return new boolean[]{((Boolean) x0.f82292h.d(str)).booleanValue()};
    }

    @Override // p6.x0
    public final Object a(String str, Bundle bundle) {
        switch (this.f82241l) {
            case 0:
                return (boolean[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
            case 1:
                return (float[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
            case 2:
                return (int[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
            case 3:
                return (long[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
            default:
                return (String[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
        }
    }

    @Override // p6.x0
    public final String b() {
        switch (this.f82241l) {
            case 0:
                return "boolean[]";
            case 1:
                return "float[]";
            case 2:
                return "integer[]";
            case 3:
                return "long[]";
            default:
                return "string[]";
        }
    }

    @Override // p6.x0
    public final Object c(Object obj, String str) {
        switch (this.f82241l) {
            case 0:
                boolean[] zArr = (boolean[]) obj;
                if (zArr == null) {
                    return i(str);
                }
                boolean[] zArrI = i(str);
                int length = zArr.length;
                boolean[] zArrCopyOf = Arrays.copyOf(zArr, length + 1);
                System.arraycopy(zArrI, 0, zArrCopyOf, length, 1);
                Intrinsics.d(zArrCopyOf);
                return zArrCopyOf;
            case 1:
                float[] fArr = (float[]) obj;
                if (fArr == null) {
                    return f(str);
                }
                float[] fArrF = f(str);
                int length2 = fArr.length;
                float[] fArrCopyOf = Arrays.copyOf(fArr, length2 + 1);
                System.arraycopy(fArrF, 0, fArrCopyOf, length2, 1);
                Intrinsics.d(fArrCopyOf);
                return fArrCopyOf;
            case 2:
                int[] iArr = (int[]) obj;
                if (iArr == null) {
                    return g(str);
                }
                int[] iArrG = g(str);
                int length3 = iArr.length;
                int[] iArrCopyOf = Arrays.copyOf(iArr, length3 + 1);
                System.arraycopy(iArrG, 0, iArrCopyOf, length3, 1);
                Intrinsics.d(iArrCopyOf);
                return iArrCopyOf;
            case 3:
                long[] jArr = (long[]) obj;
                return jArr != null ? u90.b.X(jArr, h(str)) : h(str);
            default:
                String[] strArr = (String[]) obj;
                return strArr != null ? (String[]) u90.b.Y(strArr, new String[]{str}) : new String[]{str};
        }
    }

    @Override // p6.x0
    public final Object d(String str) {
        switch (this.f82241l) {
            case 0:
                return i(str);
            case 1:
                return f(str);
            case 2:
                return g(str);
            case 3:
                return h(str);
            default:
                return new String[]{str};
        }
    }

    @Override // p6.x0
    public final void e(Bundle bundle, String key, Object obj) {
        switch (this.f82241l) {
            case 0:
                Intrinsics.g(key, "key");
                bundle.putBooleanArray(key, (boolean[]) obj);
                break;
            case 1:
                Intrinsics.g(key, "key");
                bundle.putFloatArray(key, (float[]) obj);
                break;
            case 2:
                Intrinsics.g(key, "key");
                bundle.putIntArray(key, (int[]) obj);
                break;
            case 3:
                Intrinsics.g(key, "key");
                bundle.putLongArray(key, (long[]) obj);
                break;
            default:
                Intrinsics.g(key, "key");
                bundle.putStringArray(key, (String[]) obj);
                break;
        }
    }
}
