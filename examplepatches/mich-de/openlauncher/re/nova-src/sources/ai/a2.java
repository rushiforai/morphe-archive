package ai;

import android.os.Bundle;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import java.util.EnumMap;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class a2 {

    /* renamed from: c, reason: collision with root package name */
    public static final a2 f12831c = new a2(100);

    /* renamed from: a, reason: collision with root package name */
    public final EnumMap f12832a;

    /* renamed from: b, reason: collision with root package name */
    public final int f12833b;

    public a2(int i5) {
        EnumMap enumMap = new EnumMap(z1.class);
        this.f12832a = enumMap;
        z1 z1Var = z1.AD_STORAGE;
        x1 x1Var = x1.UNINITIALIZED;
        enumMap.put((EnumMap) z1Var, (z1) x1Var);
        enumMap.put((EnumMap) z1.ANALYTICS_STORAGE, (z1) x1Var);
        this.f12833b = i5;
    }

    public static String a(int i5) {
        return i5 != -30 ? i5 != -20 ? i5 != -10 ? i5 != 0 ? i5 != 30 ? i5 != 90 ? i5 != 100 ? NativeAdContent.ViewTag.OTHER : "UNKNOWN" : "REMOTE_CONFIG" : "1P_INIT" : "1P_API" : "MANIFEST" : "API" : "TCF";
    }

    public static a2 b(int i5, Bundle bundle) {
        if (bundle == null) {
            return new a2(i5);
        }
        EnumMap enumMap = new EnumMap(z1.class);
        for (z1 z1Var : y1.STORAGE.f13481a) {
            enumMap.put((EnumMap) z1Var, (z1) d(bundle.getString(z1Var.f13512a)));
        }
        return new a2(enumMap, i5);
    }

    public static a2 c(int i5, String str) {
        EnumMap enumMap = new EnumMap(z1.class);
        z1[] z1VarArr = y1.STORAGE.f13481a;
        for (int i11 = 0; i11 < z1VarArr.length; i11++) {
            String str2 = str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
            z1 z1Var = z1VarArr[i11];
            int i12 = i11 + 2;
            if (i12 < str2.length()) {
                enumMap.put((EnumMap) z1Var, (z1) e(str2.charAt(i12)));
            } else {
                enumMap.put((EnumMap) z1Var, (z1) x1.UNINITIALIZED);
            }
        }
        return new a2(enumMap, i5);
    }

    public static x1 d(String str) {
        x1 x1Var = x1.UNINITIALIZED;
        return str == null ? x1Var : str.equals("granted") ? x1.GRANTED : str.equals("denied") ? x1.DENIED : x1Var;
    }

    public static x1 e(char c11) {
        return c11 != '+' ? c11 != '0' ? c11 != '1' ? x1.UNINITIALIZED : x1.GRANTED : x1.DENIED : x1.POLICY;
    }

    public static char h(x1 x1Var) {
        if (x1Var == null) {
            return '-';
        }
        int iOrdinal = x1Var.ordinal();
        if (iOrdinal == 1) {
            return '+';
        }
        if (iOrdinal != 2) {
            return iOrdinal != 3 ? '-' : '1';
        }
        return '0';
    }

    public static boolean l(int i5, int i11) {
        int i12 = -30;
        if (i5 == -20) {
            if (i11 == -30) {
                return true;
            }
            i5 = -20;
        }
        if (i5 != -30) {
            i12 = i5;
        } else if (i11 == -20) {
            return true;
        }
        return i12 == i11 || i5 < i11;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a2)) {
            return false;
        }
        a2 a2Var = (a2) obj;
        for (z1 z1Var : y1.STORAGE.f13481a) {
            if (this.f12832a.get(z1Var) != a2Var.f12832a.get(z1Var)) {
                return false;
            }
        }
        return this.f12833b == a2Var.f12833b;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String f() {
        int iOrdinal;
        StringBuilder sb2 = new StringBuilder("G1");
        for (z1 z1Var : y1.STORAGE.f13481a) {
            x1 x1Var = (x1) this.f12832a.get(z1Var);
            char c11 = '-';
            if (x1Var != null && (iOrdinal = x1Var.ordinal()) != 0) {
                if (iOrdinal == 1) {
                    c11 = '1';
                } else if (iOrdinal == 2) {
                    c11 = '0';
                } else if (iOrdinal != 3) {
                }
            }
            sb2.append(c11);
        }
        return sb2.toString();
    }

    public final String g() {
        StringBuilder sb2 = new StringBuilder("G1");
        for (z1 z1Var : y1.STORAGE.f13481a) {
            sb2.append(h((x1) this.f12832a.get(z1Var)));
        }
        return sb2.toString();
    }

    public final int hashCode() {
        Iterator it = this.f12832a.values().iterator();
        int iHashCode = this.f12833b * 17;
        while (it.hasNext()) {
            iHashCode = (iHashCode * 31) + ((x1) it.next()).hashCode();
        }
        return iHashCode;
    }

    public final boolean i(z1 z1Var) {
        return ((x1) this.f12832a.get(z1Var)) != x1.DENIED;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final a2 j(a2 a2Var) {
        EnumMap enumMap = new EnumMap(z1.class);
        for (z1 z1Var : y1.STORAGE.f13481a) {
            x1 x1Var = (x1) this.f12832a.get(z1Var);
            x1 x1Var2 = (x1) a2Var.f12832a.get(z1Var);
            if (x1Var != null) {
                if (x1Var2 != null) {
                    x1 x1Var3 = x1.UNINITIALIZED;
                    if (x1Var != x1Var3) {
                        if (x1Var2 != x1Var3) {
                            x1 x1Var4 = x1.POLICY;
                            if (x1Var == x1Var4) {
                                x1Var = x1Var2;
                            } else if (x1Var2 != x1Var4) {
                                x1 x1Var5 = x1.DENIED;
                                x1Var = (x1Var == x1Var5 || x1Var2 == x1Var5) ? x1Var5 : x1.GRANTED;
                            }
                        }
                    }
                }
            }
            if (x1Var != null) {
                enumMap.put((EnumMap) z1Var, (z1) x1Var);
            }
        }
        return new a2(enumMap, 100);
    }

    public final a2 k(a2 a2Var) {
        EnumMap enumMap = new EnumMap(z1.class);
        for (z1 z1Var : y1.STORAGE.f13481a) {
            x1 x1Var = (x1) this.f12832a.get(z1Var);
            if (x1Var == x1.UNINITIALIZED) {
                x1Var = (x1) a2Var.f12832a.get(z1Var);
            }
            if (x1Var != null) {
                enumMap.put((EnumMap) z1Var, (z1) x1Var);
            }
        }
        return new a2(enumMap, this.f12833b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("source=");
        sb2.append(a(this.f12833b));
        for (z1 z1Var : y1.STORAGE.f13481a) {
            sb2.append(",");
            sb2.append(z1Var.f13512a);
            sb2.append("=");
            x1 x1Var = (x1) this.f12832a.get(z1Var);
            if (x1Var == null) {
                x1Var = x1.UNINITIALIZED;
            }
            sb2.append(x1Var);
        }
        return sb2.toString();
    }

    public a2(EnumMap enumMap, int i5) {
        EnumMap enumMap2 = new EnumMap(z1.class);
        this.f12832a = enumMap2;
        enumMap2.putAll(enumMap);
        this.f12833b = i5;
    }
}
