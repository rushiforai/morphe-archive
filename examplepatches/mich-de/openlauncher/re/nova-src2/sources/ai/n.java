package ai;

import android.os.Bundle;
import com.vungle.ads.internal.protos.Sdk;
import java.util.EnumMap;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: f, reason: collision with root package name */
    public static final n f13165f = new n((Boolean) null, 100, (Boolean) null, (String) null);

    /* renamed from: a, reason: collision with root package name */
    public final int f13166a;

    /* renamed from: b, reason: collision with root package name */
    public final String f13167b;

    /* renamed from: c, reason: collision with root package name */
    public final Boolean f13168c;

    /* renamed from: d, reason: collision with root package name */
    public final String f13169d;

    /* renamed from: e, reason: collision with root package name */
    public final EnumMap f13170e;

    public n(Boolean bool, int i5, Boolean bool2, String str) {
        EnumMap enumMap = new EnumMap(z1.class);
        this.f13170e = enumMap;
        enumMap.put((EnumMap) z1.AD_USER_DATA, (z1) (bool == null ? x1.UNINITIALIZED : bool.booleanValue() ? x1.GRANTED : x1.DENIED));
        this.f13166a = i5;
        this.f13167b = d();
        this.f13168c = bool2;
        this.f13169d = str;
    }

    public static n b(String str) throws NumberFormatException {
        if (str == null || str.length() <= 0) {
            return f13165f;
        }
        String[] strArrSplit = str.split(":");
        int i5 = Integer.parseInt(strArrSplit[0]);
        EnumMap enumMap = new EnumMap(z1.class);
        z1[] z1VarArr = y1.DMA.f13481a;
        int length = z1VarArr.length;
        int i11 = 1;
        int i12 = 0;
        while (i12 < length) {
            enumMap.put((EnumMap) z1VarArr[i12], (z1) a2.e(strArrSplit[i11].charAt(0)));
            i12++;
            i11++;
        }
        return new n(enumMap, i5, (Boolean) null, (String) null);
    }

    public static n c(int i5, Bundle bundle) {
        if (bundle == null) {
            return new n((Boolean) null, i5, (Boolean) null, (String) null);
        }
        EnumMap enumMap = new EnumMap(z1.class);
        for (z1 z1Var : y1.DMA.f13481a) {
            enumMap.put((EnumMap) z1Var, (z1) a2.d(bundle.getString(z1Var.f13512a)));
        }
        return new n(enumMap, i5, bundle.containsKey("is_dma_region") ? Boolean.valueOf(bundle.getString("is_dma_region")) : null, bundle.getString("cps_display_str"));
    }

    public final x1 a() {
        x1 x1Var = (x1) this.f13170e.get(z1.AD_USER_DATA);
        return x1Var == null ? x1.UNINITIALIZED : x1Var;
    }

    public final String d() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f13166a);
        for (z1 z1Var : y1.DMA.f13481a) {
            sb2.append(":");
            sb2.append(a2.h((x1) this.f13170e.get(z1Var)));
        }
        return sb2.toString();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        if (this.f13167b.equalsIgnoreCase(nVar.f13167b) && Objects.equals(this.f13168c, nVar.f13168c)) {
            return Objects.equals(this.f13169d, nVar.f13169d);
        }
        return false;
    }

    public final int hashCode() {
        Boolean bool = this.f13168c;
        int i5 = bool == null ? 3 : true != bool.booleanValue() ? 13 : 7;
        String str = this.f13169d;
        return ((str == null ? 17 : str.hashCode()) * Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE) + this.f13167b.hashCode() + (i5 * 29);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("source=");
        sb2.append(a2.a(this.f13166a));
        for (z1 z1Var : y1.DMA.f13481a) {
            sb2.append(",");
            sb2.append(z1Var.f13512a);
            sb2.append("=");
            x1 x1Var = (x1) this.f13170e.get(z1Var);
            if (x1Var == null) {
                sb2.append("uninitialized");
            } else {
                int iOrdinal = x1Var.ordinal();
                if (iOrdinal == 0) {
                    sb2.append("uninitialized");
                } else if (iOrdinal == 1) {
                    sb2.append("eu_consent_policy");
                } else if (iOrdinal == 2) {
                    sb2.append("denied");
                } else if (iOrdinal == 3) {
                    sb2.append("granted");
                }
            }
        }
        Boolean bool = this.f13168c;
        if (bool != null) {
            sb2.append(",isDmaRegion=");
            sb2.append(bool);
        }
        String str = this.f13169d;
        if (str != null) {
            sb2.append(",cpsDisplayStr=");
            sb2.append(str);
        }
        return sb2.toString();
    }

    public n(EnumMap enumMap, int i5, Boolean bool, String str) {
        EnumMap enumMap2 = new EnumMap(z1.class);
        this.f13170e = enumMap2;
        enumMap2.putAll(enumMap);
        this.f13166a = i5;
        this.f13167b = d();
        this.f13168c = bool;
        this.f13169d = str;
    }
}
