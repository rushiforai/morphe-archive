package ai;

import android.text.TextUtils;
import android.util.Log;
import com.amplitude.core.events.Identify;

/* loaded from: classes3.dex */
public final class o0 extends v1 {

    /* renamed from: c, reason: collision with root package name */
    public char f13187c;

    /* renamed from: d, reason: collision with root package name */
    public long f13188d;

    /* renamed from: e, reason: collision with root package name */
    public String f13189e;

    /* renamed from: f, reason: collision with root package name */
    public final m0 f13190f;

    /* renamed from: g, reason: collision with root package name */
    public final m0 f13191g;

    /* renamed from: h, reason: collision with root package name */
    public final m0 f13192h;

    /* renamed from: i, reason: collision with root package name */
    public final m0 f13193i;

    /* renamed from: j, reason: collision with root package name */
    public final m0 f13194j;

    /* renamed from: k, reason: collision with root package name */
    public final m0 f13195k;

    /* renamed from: l, reason: collision with root package name */
    public final m0 f13196l;

    /* renamed from: m, reason: collision with root package name */
    public final m0 f13197m;
    public final m0 n;

    public o0(m1 m1Var) {
        super(m1Var);
        this.f13187c = (char) 0;
        this.f13188d = -1L;
        this.f13190f = new m0(this, 6, false, false);
        this.f13191g = new m0(this, 6, true, false);
        this.f13192h = new m0(this, 6, false, true);
        this.f13193i = new m0(this, 5, false, false);
        this.f13194j = new m0(this, 5, true, false);
        this.f13195k = new m0(this, 5, false, true);
        this.f13196l = new m0(this, 4, false, false);
        this.f13197m = new m0(this, 3, false, false);
        this.n = new m0(this, 2, false, false);
    }

    public static n0 L(String str) {
        if (str == null) {
            return null;
        }
        return new n0(str);
    }

    public static String O(boolean z11, String str, Object obj, Object obj2, Object obj3) {
        String strP = P(obj, z11);
        String strP2 = P(obj2, z11);
        String strP3 = P(obj3, z11);
        StringBuilder sb2 = new StringBuilder();
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (!TextUtils.isEmpty(str)) {
            sb2.append(str);
            str2 = ": ";
        }
        String str3 = ", ";
        if (!TextUtils.isEmpty(strP)) {
            sb2.append(str2);
            sb2.append(strP);
            str2 = ", ";
        }
        if (TextUtils.isEmpty(strP2)) {
            str3 = str2;
        } else {
            sb2.append(str2);
            sb2.append(strP2);
        }
        if (!TextUtils.isEmpty(strP3)) {
            sb2.append(str3);
            sb2.append(strP3);
        }
        return sb2.toString();
    }

    public static String P(Object obj, boolean z11) {
        int iLastIndexOf;
        String className;
        int iLastIndexOf2;
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (obj == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (obj instanceof Integer) {
            obj = Long.valueOf(((Integer) obj).intValue());
        }
        if (obj instanceof Long) {
            if (!z11) {
                return obj.toString();
            }
            Long l9 = (Long) obj;
            if (Math.abs(l9.longValue()) < 100) {
                return obj.toString();
            }
            char cCharAt = obj.toString().charAt(0);
            String strValueOf = String.valueOf(Math.abs(l9.longValue()));
            long jRound = Math.round(Math.pow(10.0d, strValueOf.length() - 1));
            long jRound2 = Math.round(Math.pow(10.0d, strValueOf.length()) - 1.0d);
            int length = String.valueOf(jRound).length();
            if (cCharAt == '-') {
                str = Identify.UNSET_VALUE;
            }
            StringBuilder sb2 = new StringBuilder(str.length() + str.length() + length + 3 + String.valueOf(jRound2).length());
            b.c0.B(sb2, str, jRound, "...");
            sb2.append(str);
            sb2.append(jRound2);
            return sb2.toString();
        }
        if (obj instanceof Boolean) {
            return obj.toString();
        }
        if (!(obj instanceof Throwable)) {
            return obj instanceof n0 ? ((n0) obj).f13171a : z11 ? Identify.UNSET_VALUE : obj.toString();
        }
        Throwable th2 = (Throwable) obj;
        StringBuilder sb3 = new StringBuilder(z11 ? th2.getClass().getName() : th2.toString());
        String canonicalName = m1.class.getCanonicalName();
        String strSubstring = (TextUtils.isEmpty(canonicalName) || (iLastIndexOf = canonicalName.lastIndexOf(46)) == -1) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : canonicalName.substring(0, iLastIndexOf);
        StackTraceElement[] stackTrace = th2.getStackTrace();
        int length2 = stackTrace.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length2) {
                break;
            }
            StackTraceElement stackTraceElement = stackTrace[i5];
            if (!stackTraceElement.isNativeMethod() && (className = stackTraceElement.getClassName()) != null) {
                if (((TextUtils.isEmpty(className) || (iLastIndexOf2 = className.lastIndexOf(46)) == -1) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : className.substring(0, iLastIndexOf2)).equals(strSubstring)) {
                    sb3.append(": ");
                    sb3.append(stackTraceElement);
                    break;
                }
            }
            i5++;
        }
        return sb3.toString();
    }

    @Override // ai.v1
    public final boolean E() {
        return false;
    }

    public final m0 H() {
        return this.f13190f;
    }

    public final m0 I() {
        return this.f13193i;
    }

    public final m0 J() {
        return this.f13197m;
    }

    public final m0 K() {
        return this.n;
    }

    public final void M(int i5, boolean z11, boolean z12, String str, Object obj, Object obj2, Object obj3) {
        if (!z11 && Log.isLoggable(N(), i5)) {
            Log.println(i5, N(), O(false, str, obj, obj2, obj3));
        }
        if (z12 || i5 < 5) {
            return;
        }
        sg.w.h(str);
        k1 k1Var = ((m1) this.f13368a).f13139g;
        if (k1Var == null) {
            Log.println(6, N(), "Scheduler not set. Not logging error/warn");
        } else {
            if (!k1Var.f13377b) {
                Log.println(6, N(), "Scheduler not initialized. Not logging error/warn");
                return;
            }
            if (i5 >= 9) {
                i5 = 8;
            }
            k1Var.M(new l0(this, i5, str, obj, obj2, obj3));
        }
    }

    public final String N() {
        String str;
        synchronized (this) {
            try {
                if (this.f13189e == null) {
                    ((m1) ((m1) this.f13368a).f13136d.f13368a).getClass();
                    this.f13189e = "FA";
                }
                sg.w.h(this.f13189e);
                str = this.f13189e;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return str;
    }
}
