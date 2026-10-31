package o50;

import java.util.ArrayList;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

@Serializable(with = g0.class)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class f0 implements java.io.Serializable {

    @NotNull
    public static final e0 Companion = new e0();

    /* renamed from: a, reason: collision with root package name */
    public final String f79556a;

    /* renamed from: b, reason: collision with root package name */
    public final int f79557b;

    /* renamed from: c, reason: collision with root package name */
    public final String f79558c;

    /* renamed from: d, reason: collision with root package name */
    public final String f79559d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f79560e;

    /* renamed from: f, reason: collision with root package name */
    public final String f79561f;

    /* renamed from: g, reason: collision with root package name */
    public final c0 f79562g;

    /* renamed from: h, reason: collision with root package name */
    public final c0 f79563h;

    /* renamed from: i, reason: collision with root package name */
    public final a70.d f79564i;

    /* renamed from: j, reason: collision with root package name */
    public final a70.d f79565j;

    /* renamed from: k, reason: collision with root package name */
    public final a70.d f79566k;

    /* renamed from: l, reason: collision with root package name */
    public final a70.d f79567l;

    /* renamed from: m, reason: collision with root package name */
    public final a70.d f79568m;

    public f0(c0 c0Var, String host, int i5, ArrayList arrayList, w parameters, String fragment, String str, String str2, boolean z11, String str3) {
        Intrinsics.g(host, "host");
        Intrinsics.g(parameters, "parameters");
        Intrinsics.g(fragment, "fragment");
        this.f79556a = host;
        this.f79557b = i5;
        this.f79558c = str;
        this.f79559d = str2;
        this.f79560e = z11;
        this.f79561f = str3;
        if (i5 < 0 || i5 >= 65536) {
            throw new IllegalArgumentException(b.c0.h(i5, "Port must be between 0 and 65535, or 0 if not set. Provided: ").toString());
        }
        LazyKt.a(new a7.f(arrayList, 22));
        this.f79562g = c0Var;
        this.f79563h = c0Var == null ? c0.f79545c : c0Var;
        this.f79564i = LazyKt.a(new b00.c(11, arrayList, this));
        final int i11 = 0;
        this.f79565j = LazyKt.a(new Function0(this) { // from class: o50.d0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f0 f79551b;

            {
                this.f79551b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i12 = i11;
                f0 f0Var = this.f79551b;
                switch (i12) {
                    case 0:
                        String str4 = f0Var.f79561f;
                        int iR0 = r70.k.R0('?', 0, 6, str4) + 1;
                        if (iR0 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR02 = r70.k.R0('#', iR0, 4, str4);
                        if (iR02 == -1) {
                            String strSubstring = str4.substring(iR0);
                            Intrinsics.f(strSubstring, "substring(...)");
                            return strSubstring;
                        }
                        String strSubstring2 = str4.substring(iR0, iR02);
                        Intrinsics.f(strSubstring2, "substring(...)");
                        return strSubstring2;
                    case 1:
                        String str5 = f0Var.f79561f;
                        int iR03 = r70.k.R0('/', f0Var.f79563h.f79547a.length() + 3, 4, str5);
                        if (iR03 == -1) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR04 = r70.k.R0('#', iR03, 4, str5);
                        if (iR04 == -1) {
                            String strSubstring3 = str5.substring(iR03);
                            Intrinsics.f(strSubstring3, "substring(...)");
                            return strSubstring3;
                        }
                        String strSubstring4 = str5.substring(iR03, iR04);
                        Intrinsics.f(strSubstring4, "substring(...)");
                        return strSubstring4;
                    case 2:
                        String str6 = f0Var.f79561f;
                        String str7 = f0Var.f79558c;
                        if (str7 == null) {
                            return null;
                        }
                        if (str7.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int length = f0Var.f79563h.f79547a.length() + 3;
                        String strSubstring5 = str6.substring(length, r70.k.T0(str6, new char[]{AbstractJsonLexerKt.COLON, '@'}, length, false));
                        Intrinsics.f(strSubstring5, "substring(...)");
                        return strSubstring5;
                    case 3:
                        String str8 = f0Var.f79561f;
                        String str9 = f0Var.f79559d;
                        if (str9 == null) {
                            return null;
                        }
                        if (str9.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring6 = str8.substring(r70.k.R0(AbstractJsonLexerKt.COLON, f0Var.f79563h.f79547a.length() + 3, 4, str8) + 1, r70.k.R0('@', 0, 6, str8));
                        Intrinsics.f(strSubstring6, "substring(...)");
                        return strSubstring6;
                    default:
                        String str10 = f0Var.f79561f;
                        int iR05 = r70.k.R0('#', 0, 6, str10) + 1;
                        if (iR05 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring7 = str10.substring(iR05);
                        Intrinsics.f(strSubstring7, "substring(...)");
                        return strSubstring7;
                }
            }
        });
        final int i12 = 1;
        LazyKt.a(new Function0(this) { // from class: o50.d0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f0 f79551b;

            {
                this.f79551b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i122 = i12;
                f0 f0Var = this.f79551b;
                switch (i122) {
                    case 0:
                        String str4 = f0Var.f79561f;
                        int iR0 = r70.k.R0('?', 0, 6, str4) + 1;
                        if (iR0 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR02 = r70.k.R0('#', iR0, 4, str4);
                        if (iR02 == -1) {
                            String strSubstring = str4.substring(iR0);
                            Intrinsics.f(strSubstring, "substring(...)");
                            return strSubstring;
                        }
                        String strSubstring2 = str4.substring(iR0, iR02);
                        Intrinsics.f(strSubstring2, "substring(...)");
                        return strSubstring2;
                    case 1:
                        String str5 = f0Var.f79561f;
                        int iR03 = r70.k.R0('/', f0Var.f79563h.f79547a.length() + 3, 4, str5);
                        if (iR03 == -1) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR04 = r70.k.R0('#', iR03, 4, str5);
                        if (iR04 == -1) {
                            String strSubstring3 = str5.substring(iR03);
                            Intrinsics.f(strSubstring3, "substring(...)");
                            return strSubstring3;
                        }
                        String strSubstring4 = str5.substring(iR03, iR04);
                        Intrinsics.f(strSubstring4, "substring(...)");
                        return strSubstring4;
                    case 2:
                        String str6 = f0Var.f79561f;
                        String str7 = f0Var.f79558c;
                        if (str7 == null) {
                            return null;
                        }
                        if (str7.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int length = f0Var.f79563h.f79547a.length() + 3;
                        String strSubstring5 = str6.substring(length, r70.k.T0(str6, new char[]{AbstractJsonLexerKt.COLON, '@'}, length, false));
                        Intrinsics.f(strSubstring5, "substring(...)");
                        return strSubstring5;
                    case 3:
                        String str8 = f0Var.f79561f;
                        String str9 = f0Var.f79559d;
                        if (str9 == null) {
                            return null;
                        }
                        if (str9.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring6 = str8.substring(r70.k.R0(AbstractJsonLexerKt.COLON, f0Var.f79563h.f79547a.length() + 3, 4, str8) + 1, r70.k.R0('@', 0, 6, str8));
                        Intrinsics.f(strSubstring6, "substring(...)");
                        return strSubstring6;
                    default:
                        String str10 = f0Var.f79561f;
                        int iR05 = r70.k.R0('#', 0, 6, str10) + 1;
                        if (iR05 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring7 = str10.substring(iR05);
                        Intrinsics.f(strSubstring7, "substring(...)");
                        return strSubstring7;
                }
            }
        });
        final int i13 = 2;
        this.f79566k = LazyKt.a(new Function0(this) { // from class: o50.d0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f0 f79551b;

            {
                this.f79551b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i122 = i13;
                f0 f0Var = this.f79551b;
                switch (i122) {
                    case 0:
                        String str4 = f0Var.f79561f;
                        int iR0 = r70.k.R0('?', 0, 6, str4) + 1;
                        if (iR0 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR02 = r70.k.R0('#', iR0, 4, str4);
                        if (iR02 == -1) {
                            String strSubstring = str4.substring(iR0);
                            Intrinsics.f(strSubstring, "substring(...)");
                            return strSubstring;
                        }
                        String strSubstring2 = str4.substring(iR0, iR02);
                        Intrinsics.f(strSubstring2, "substring(...)");
                        return strSubstring2;
                    case 1:
                        String str5 = f0Var.f79561f;
                        int iR03 = r70.k.R0('/', f0Var.f79563h.f79547a.length() + 3, 4, str5);
                        if (iR03 == -1) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR04 = r70.k.R0('#', iR03, 4, str5);
                        if (iR04 == -1) {
                            String strSubstring3 = str5.substring(iR03);
                            Intrinsics.f(strSubstring3, "substring(...)");
                            return strSubstring3;
                        }
                        String strSubstring4 = str5.substring(iR03, iR04);
                        Intrinsics.f(strSubstring4, "substring(...)");
                        return strSubstring4;
                    case 2:
                        String str6 = f0Var.f79561f;
                        String str7 = f0Var.f79558c;
                        if (str7 == null) {
                            return null;
                        }
                        if (str7.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int length = f0Var.f79563h.f79547a.length() + 3;
                        String strSubstring5 = str6.substring(length, r70.k.T0(str6, new char[]{AbstractJsonLexerKt.COLON, '@'}, length, false));
                        Intrinsics.f(strSubstring5, "substring(...)");
                        return strSubstring5;
                    case 3:
                        String str8 = f0Var.f79561f;
                        String str9 = f0Var.f79559d;
                        if (str9 == null) {
                            return null;
                        }
                        if (str9.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring6 = str8.substring(r70.k.R0(AbstractJsonLexerKt.COLON, f0Var.f79563h.f79547a.length() + 3, 4, str8) + 1, r70.k.R0('@', 0, 6, str8));
                        Intrinsics.f(strSubstring6, "substring(...)");
                        return strSubstring6;
                    default:
                        String str10 = f0Var.f79561f;
                        int iR05 = r70.k.R0('#', 0, 6, str10) + 1;
                        if (iR05 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring7 = str10.substring(iR05);
                        Intrinsics.f(strSubstring7, "substring(...)");
                        return strSubstring7;
                }
            }
        });
        final int i14 = 3;
        this.f79567l = LazyKt.a(new Function0(this) { // from class: o50.d0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f0 f79551b;

            {
                this.f79551b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i122 = i14;
                f0 f0Var = this.f79551b;
                switch (i122) {
                    case 0:
                        String str4 = f0Var.f79561f;
                        int iR0 = r70.k.R0('?', 0, 6, str4) + 1;
                        if (iR0 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR02 = r70.k.R0('#', iR0, 4, str4);
                        if (iR02 == -1) {
                            String strSubstring = str4.substring(iR0);
                            Intrinsics.f(strSubstring, "substring(...)");
                            return strSubstring;
                        }
                        String strSubstring2 = str4.substring(iR0, iR02);
                        Intrinsics.f(strSubstring2, "substring(...)");
                        return strSubstring2;
                    case 1:
                        String str5 = f0Var.f79561f;
                        int iR03 = r70.k.R0('/', f0Var.f79563h.f79547a.length() + 3, 4, str5);
                        if (iR03 == -1) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR04 = r70.k.R0('#', iR03, 4, str5);
                        if (iR04 == -1) {
                            String strSubstring3 = str5.substring(iR03);
                            Intrinsics.f(strSubstring3, "substring(...)");
                            return strSubstring3;
                        }
                        String strSubstring4 = str5.substring(iR03, iR04);
                        Intrinsics.f(strSubstring4, "substring(...)");
                        return strSubstring4;
                    case 2:
                        String str6 = f0Var.f79561f;
                        String str7 = f0Var.f79558c;
                        if (str7 == null) {
                            return null;
                        }
                        if (str7.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int length = f0Var.f79563h.f79547a.length() + 3;
                        String strSubstring5 = str6.substring(length, r70.k.T0(str6, new char[]{AbstractJsonLexerKt.COLON, '@'}, length, false));
                        Intrinsics.f(strSubstring5, "substring(...)");
                        return strSubstring5;
                    case 3:
                        String str8 = f0Var.f79561f;
                        String str9 = f0Var.f79559d;
                        if (str9 == null) {
                            return null;
                        }
                        if (str9.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring6 = str8.substring(r70.k.R0(AbstractJsonLexerKt.COLON, f0Var.f79563h.f79547a.length() + 3, 4, str8) + 1, r70.k.R0('@', 0, 6, str8));
                        Intrinsics.f(strSubstring6, "substring(...)");
                        return strSubstring6;
                    default:
                        String str10 = f0Var.f79561f;
                        int iR05 = r70.k.R0('#', 0, 6, str10) + 1;
                        if (iR05 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring7 = str10.substring(iR05);
                        Intrinsics.f(strSubstring7, "substring(...)");
                        return strSubstring7;
                }
            }
        });
        final int i15 = 4;
        this.f79568m = LazyKt.a(new Function0(this) { // from class: o50.d0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f0 f79551b;

            {
                this.f79551b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i122 = i15;
                f0 f0Var = this.f79551b;
                switch (i122) {
                    case 0:
                        String str4 = f0Var.f79561f;
                        int iR0 = r70.k.R0('?', 0, 6, str4) + 1;
                        if (iR0 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR02 = r70.k.R0('#', iR0, 4, str4);
                        if (iR02 == -1) {
                            String strSubstring = str4.substring(iR0);
                            Intrinsics.f(strSubstring, "substring(...)");
                            return strSubstring;
                        }
                        String strSubstring2 = str4.substring(iR0, iR02);
                        Intrinsics.f(strSubstring2, "substring(...)");
                        return strSubstring2;
                    case 1:
                        String str5 = f0Var.f79561f;
                        int iR03 = r70.k.R0('/', f0Var.f79563h.f79547a.length() + 3, 4, str5);
                        if (iR03 == -1) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int iR04 = r70.k.R0('#', iR03, 4, str5);
                        if (iR04 == -1) {
                            String strSubstring3 = str5.substring(iR03);
                            Intrinsics.f(strSubstring3, "substring(...)");
                            return strSubstring3;
                        }
                        String strSubstring4 = str5.substring(iR03, iR04);
                        Intrinsics.f(strSubstring4, "substring(...)");
                        return strSubstring4;
                    case 2:
                        String str6 = f0Var.f79561f;
                        String str7 = f0Var.f79558c;
                        if (str7 == null) {
                            return null;
                        }
                        if (str7.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        int length = f0Var.f79563h.f79547a.length() + 3;
                        String strSubstring5 = str6.substring(length, r70.k.T0(str6, new char[]{AbstractJsonLexerKt.COLON, '@'}, length, false));
                        Intrinsics.f(strSubstring5, "substring(...)");
                        return strSubstring5;
                    case 3:
                        String str8 = f0Var.f79561f;
                        String str9 = f0Var.f79559d;
                        if (str9 == null) {
                            return null;
                        }
                        if (str9.length() == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring6 = str8.substring(r70.k.R0(AbstractJsonLexerKt.COLON, f0Var.f79563h.f79547a.length() + 3, 4, str8) + 1, r70.k.R0('@', 0, 6, str8));
                        Intrinsics.f(strSubstring6, "substring(...)");
                        return strSubstring6;
                    default:
                        String str10 = f0Var.f79561f;
                        int iR05 = r70.k.R0('#', 0, 6, str10) + 1;
                        if (iR05 == 0) {
                            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        String strSubstring7 = str10.substring(iR05);
                        Intrinsics.f(strSubstring7, "substring(...)");
                        return strSubstring7;
                }
            }
        });
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || f0.class != obj.getClass()) {
            return false;
        }
        return Intrinsics.b(this.f79561f, ((f0) obj).f79561f);
    }

    public final int hashCode() {
        return this.f79561f.hashCode();
    }

    public final String toString() {
        return this.f79561f;
    }
}
