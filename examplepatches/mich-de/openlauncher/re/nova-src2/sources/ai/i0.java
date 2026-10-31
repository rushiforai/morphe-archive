package ai;

import android.os.Bundle;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;
import java.util.ArrayList;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class i0 {

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicReference f13003b = new AtomicReference();

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicReference f13004c = new AtomicReference();

    /* renamed from: d, reason: collision with root package name */
    public static final AtomicReference f13005d = new AtomicReference();

    /* renamed from: a, reason: collision with root package name */
    public final b1 f13006a;

    public i0(b1 b1Var) {
        this.f13006a = b1Var;
    }

    public static final String g(String str, String[] strArr, String[] strArr2, AtomicReference atomicReference) {
        String str2;
        sg.w.h(atomicReference);
        sg.w.c(strArr.length == strArr2.length);
        for (int i5 = 0; i5 < strArr.length; i5++) {
            if (Objects.equals(str, strArr[i5])) {
                synchronized (atomicReference) {
                    try {
                        String[] strArr3 = (String[]) atomicReference.get();
                        if (strArr3 == null) {
                            strArr3 = new String[strArr2.length];
                            atomicReference.set(strArr3);
                        }
                        str2 = strArr3[i5];
                        if (str2 == null) {
                            str2 = strArr2[i5] + "(" + strArr[i5] + ")";
                            strArr3[i5] = str2;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return str2;
            }
        }
        return str;
    }

    public final String a(String str) {
        if (str == null) {
            return null;
        }
        return !this.f13006a.b() ? str : g(str, b2.f12859f, b2.f12854a, f13003b);
    }

    public final String b(String str) {
        if (str == null) {
            return null;
        }
        return !this.f13006a.b() ? str : g(str, b2.f12862i, b2.f12861h, f13004c);
    }

    public final String c(String str) {
        if (str == null) {
            return null;
        }
        return !this.f13006a.b() ? str : str.startsWith("_exp_") ? b.c0.l("experiment_id(", str, ")") : g(str, b2.f12866m, b2.f12865l, f13005d);
    }

    public final String d(zzbh zzbhVar) {
        b1 b1Var = this.f13006a;
        if (!b1Var.b()) {
            return zzbhVar.toString();
        }
        StringBuilder sb2 = new StringBuilder("origin=");
        sb2.append(zzbhVar.f33770h);
        sb2.append(",name=");
        sb2.append(a(zzbhVar.f33768f));
        sb2.append(",params=");
        zzbf zzbfVar = zzbhVar.f33769g;
        sb2.append(zzbfVar == null ? null : !b1Var.b() ? zzbfVar.f33767f.toString() : e(zzbfVar.p()));
        return sb2.toString();
    }

    public final String e(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        if (!this.f13006a.b()) {
            return bundle.toString();
        }
        StringBuilder sbQ = a2.c.q("Bundle[{");
        for (String str : bundle.keySet()) {
            if (sbQ.length() != 8) {
                sbQ.append(", ");
            }
            sbQ.append(b(str));
            sbQ.append("=");
            Object obj = bundle.get(str);
            sbQ.append(obj instanceof Bundle ? f(new Object[]{obj}) : obj instanceof Object[] ? f((Object[]) obj) : obj instanceof ArrayList ? f(((ArrayList) obj).toArray()) : String.valueOf(obj));
        }
        sbQ.append("}]");
        return sbQ.toString();
    }

    public final String f(Object[] objArr) {
        if (objArr == null) {
            return "[]";
        }
        StringBuilder sbQ = a2.c.q("[");
        for (Object obj : objArr) {
            String strE = obj instanceof Bundle ? e((Bundle) obj) : String.valueOf(obj);
            if (strE != null) {
                if (sbQ.length() != 1) {
                    sbQ.append(", ");
                }
                sbQ.append(strE);
            }
        }
        sbQ.append("]");
        return sbQ.toString();
    }
}
