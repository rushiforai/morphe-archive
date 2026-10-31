package a80;

import ads_mobile_sdk.em2;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.rb1;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.fragment.app.h0;
import androidx.fragment.app.h1;
import b.c0;
import b.d0;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public abstract /* synthetic */ class m {
    public static int _a(int i5) {
        switch (i5) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 3;
            case 3:
                return 4;
            case 4:
                return 5;
            case 5:
                return 6;
            case 6:
                return 7;
            case 7:
                return 8;
            case 8:
                return 9;
            case 9:
                return 10;
            case 10:
                return 11;
            case 11:
                return 12;
            case 12:
                return 13;
            case 13:
                return 14;
            default:
                return 0;
        }
    }

    public static int _a$1(int i5) {
        if (i5 == 0) {
            return 1;
        }
        if (i5 == 1) {
            return 2;
        }
        if (i5 != 2) {
            return i5 != 1000 ? 0 : 4;
        }
        return 3;
    }

    public static int _a$2(int i5) {
        switch (i5) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 3;
            case 3:
                return 4;
            case 4:
                return 5;
            case 5:
                return 6;
            case 6:
                return 7;
            case 7:
                return 8;
            case 8:
                return 9;
            case 9:
                return 10;
            case 10:
                return 11;
            case 11:
                return 12;
            case 12:
                return 13;
            default:
                return 0;
        }
    }

    public static final int _getNumber(int i5) {
        if (i5 == 4) {
            byte[] bArr = rb1.f9048a;
            throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
        }
        if (i5 == 1) {
            return 0;
        }
        if (i5 == 2) {
            return 1;
        }
        if (i5 == 3) {
            return 2;
        }
        if (i5 == 4) {
            return -1;
        }
        throw null;
    }

    public static final int _getNumber$1(int i5) {
        if (i5 == 6) {
            byte[] bArr = rb1.f9048a;
            throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
        }
        switch (i5) {
            case 1:
                return 0;
            case 2:
                return 1;
            case 3:
                return 2;
            case 4:
                return 3;
            case 5:
                return 4;
            case 6:
                return -1;
            default:
                throw null;
        }
    }

    public static int[] _values() {
        return c0.G(4);
    }

    public static final void a(int i5, View view, ViewGroup container) {
        Intrinsics.g(view, "view");
        Intrinsics.g(container, "container");
        int iF = c0.F(i5);
        if (iF == 0) {
            ViewParent parent = view.getParent();
            ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            if (viewGroup != null) {
                if (h1.K(2)) {
                    view.toString();
                    viewGroup.toString();
                }
                viewGroup.removeView(view);
                return;
            }
            return;
        }
        if (iF == 1) {
            if (h1.K(2)) {
                view.toString();
            }
            ViewParent parent2 = view.getParent();
            if ((parent2 instanceof ViewGroup ? (ViewGroup) parent2 : null) == null) {
                if (h1.K(2)) {
                    view.toString();
                    container.toString();
                }
                container.addView(view);
            }
            view.setVisibility(0);
            return;
        }
        if (iF == 2) {
            if (h1.K(2)) {
                view.toString();
            }
            view.setVisibility(8);
        } else {
            if (iF != 3) {
                return;
            }
            if (h1.K(2)) {
                view.toString();
            }
            view.setVisibility(4);
        }
    }

    public static final int b(int i5) {
        if (i5 == 1) {
            return 40;
        }
        if (i5 == 2) {
            return 30;
        }
        if (i5 == 3) {
            return 20;
        }
        if (i5 == 4) {
            return 10;
        }
        if (i5 == 5) {
            return 0;
        }
        throw null;
    }

    public static /* synthetic */ int c(int i5) {
        if (i5 == 1) {
            return 0;
        }
        if (i5 == 2) {
            return 1;
        }
        if (i5 == 3) {
            return 2;
        }
        if (i5 == 4) {
            return 1000;
        }
        throw null;
    }

    public static int d(float f11, int i5, int i11) {
        return (Float.hashCode(f11) + i5) * i11;
    }

    public static int e(int i5, int i11, int i12, int i13, int i14) {
        return Math.max(((i5 * i11) / i12) + i13, i14);
    }

    public static String f(int i5, String str, String str2, String str3) {
        return str + i5 + str2 + str3;
    }

    public static String g(String str, h0 h0Var, String str2) {
        return str + h0Var + str2;
    }

    public static String h(String str, String str2, String str3, String str4) {
        return str + str2 + str3 + str4;
    }

    public static String i(String str, String str2, boolean z11) {
        return str + z11 + str2;
    }

    public static String j(StringBuilder sb2, List list, String str) {
        sb2.append(list);
        sb2.append(str);
        return sb2.toString();
    }

    public static String k(StringBuilder sb2, boolean z11, String str) {
        sb2.append(z11);
        sb2.append(str);
        return sb2.toString();
    }

    public static StringBuilder l(long j11, String str, String str2, String str3) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(j11);
        sb2.append(str2);
        sb2.append(str3);
        return sb2;
    }

    public static StringBuilder m(Class cls, String str) {
        StringBuilder sb2 = new StringBuilder(str);
        d0.n(cls, sb2);
        return sb2;
    }

    public static Map n(String str, String str2) {
        return b70.k.e0(new Pair(str, str2));
    }

    public static Map o(HashMap map) {
        return Collections.unmodifiableMap(new HashMap(map));
    }

    public static /* synthetic */ void p(AdaptiveIconDrawable adaptiveIconDrawable) {
        throw new ClassCastException();
    }

    public static void q(String str, String str2, String str3, StringBuilder sb2, boolean z11) {
        sb2.append(str);
        sb2.append(str2);
        sb2.append(z11);
        sb2.append(str3);
    }

    public static void r(String str, String str2, String str3, Throwable th2) {
        mu0.b(str + str2 + str3, th2);
    }

    public static void s(StringBuilder sb2, boolean z11, String str, boolean z12, String str2) {
        sb2.append(z11);
        sb2.append(str);
        sb2.append(z12);
        sb2.append(str2);
    }

    public static /* synthetic */ void t(List list) {
        if (list != null) {
            throw new ClassCastException();
        }
    }

    public static /* synthetic */ boolean u(AtomicReference atomicReference, em2 em2Var, em2 em2Var2) {
        while (!atomicReference.compareAndSet(em2Var, em2Var2)) {
            if (atomicReference.get() != em2Var) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean v(AtomicReferenceArray atomicReferenceArray, int i5, i iVar) {
        while (!atomicReferenceArray.compareAndSet(i5, iVar, null)) {
            if (atomicReferenceArray.get(i5) != iVar) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ String w(int i5) {
        if (i5 == 1) {
            return "NONE";
        }
        if (i5 == 2) {
            return "SHAKE";
        }
        if (i5 == 3) {
            return "FLICK";
        }
        if (i5 == 4) {
            return "UNRECOGNIZED";
        }
        throw null;
    }

    public static /* synthetic */ String x(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? AbstractJsonLexerKt.NULL : "TRACE" : "DEBUG" : "INFO" : "WARN" : "ERROR";
    }

    public static /* synthetic */ String y(int i5) {
        switch (i5) {
            case 1:
                return "BEGIN_ARRAY";
            case 2:
                return "END_ARRAY";
            case 3:
                return "BEGIN_OBJECT";
            case 4:
                return "END_OBJECT";
            case 5:
                return "NAME";
            case 6:
                return "STRING";
            case 7:
                return "NUMBER";
            case 8:
                return "BOOLEAN";
            case 9:
                return "NULL";
            case 10:
                return "END_DOCUMENT";
            default:
                return AbstractJsonLexerKt.NULL;
        }
    }
}
