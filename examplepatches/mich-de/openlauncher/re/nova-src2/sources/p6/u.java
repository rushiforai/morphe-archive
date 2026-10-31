package p6;

import android.graphics.Path;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.os.Build;
import androidx.compose.foundation.layout.FillElement;
import b.u4;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.ke;
import com.google.zxing.WriterException;
import com.stripe.android.core.exception.APIConnectionException;
import com.stripe.android.core.exception.APIException;
import com.stripe.android.core.exception.GenericStripeException;
import com.stripe.android.core.exception.InvalidRequestException;
import com.stripe.android.core.exception.StripeException;
import com.vungle.ads.internal.protos.Sdk;
import e10.m3;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;
import k0.c1;
import k0.v1;
import k0.x1;
import kotlin.Unit;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import l1.d1;
import l1.g1;
import l1.s1;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import org.json.JSONArray;
import org.json.JSONException;
import p1.k2;
import p1.n1;
import p1.t1;
import p1.z2;

/* loaded from: classes2.dex */
public abstract class u {
    public static final void a(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-2075150636);
        if (((i5 | 6) & 3) == 2 && tVar.E()) {
            tVar.V();
        } else {
            lb0.b.e(null, x7.f.Y(tVar, 2132017929), null, null, null, x1.f.d(-638033843, new b20.j(2, ul.b.Q(new i2.s(u90.b.l(tVar, 2131100661)), new i2.s(u90.b.l(tVar, 2131100662)))), tVar), null, tVar, 14155776, Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new t00.s(i5, 23);
        }
    }

    public static final void b(b2.t tVar, Function2 function2, Function2 function22, boolean z11, Function0 function0, p1.o oVar, int i5, int i11) {
        boolean z12;
        b2.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-738571822);
        int i12 = i5 | 6;
        if ((i11 & 8) != 0) {
            i12 = i5 | 3078;
        } else if ((i5 & 3072) == 0) {
            i12 |= tVar3.h(null) ? 2048 : 1024;
        }
        if (((i12 | 221184 | (tVar3.h(function0) ? 1048576 : 524288)) & 599187) == 599186 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
            z12 = z11;
        } else {
            s0.g gVarC = s0.h.c(8);
            b2.r rVar = b2.r.f17024a;
            b2.t tVarD = androidx.compose.foundation.c.d(fg.a.g(rVar, gVarC), false, null, null, function0, 15);
            k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.f17009m, tVar3, 0);
            int iHashCode = Long.hashCode(tVar3.T);
            n1 n1VarL = tVar3.l();
            b2.t tVarI = fg.a.I(tVarD, tVar3);
            b3.l.Po.getClass();
            Function0 function02 = b3.k.f17270b;
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function02);
            } else {
                tVar3.p0();
            }
            b3.i iVar = b3.k.f17275g;
            p1.a0.j(xVarA, iVar, tVar3);
            b3.i iVar2 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar2, tVar3);
            b3.i iVar3 = b3.k.f17278j;
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar3, iHashCode, iVar3);
            }
            b3.i iVar4 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar4, tVar3);
            b2.t tVarB = androidx.compose.foundation.layout.a.b(rVar, c1.f70578b);
            FillElement fillElement = androidx.compose.foundation.layout.e.f13973c;
            b2.t tVarThen = tVarB.then(fillElement);
            x1 x1VarA = v1.a(k0.k.f70655a, b2.d.f17006j, tVar3, 0);
            int iHashCode2 = Long.hashCode(tVar3.T);
            n1 n1VarL2 = tVar3.l();
            b2.t tVarI2 = fg.a.I(tVarThen, tVar3);
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function02);
            } else {
                tVar3.p0();
            }
            p1.a0.j(x1VarA, iVar, tVar3);
            p1.a0.j(n1VarL2, iVar2, tVar3);
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode2))) {
                a2.c.u(iHashCode2, tVar3, iHashCode2, iVar3);
            }
            p1.a0.j(tVarI2, iVar4, tVar3);
            tVar3.b0(953174152);
            if (function2 != null) {
                z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
                int iHashCode3 = Long.hashCode(tVar3.T);
                n1 n1VarL3 = tVar3.l();
                b2.t tVarI3 = fg.a.I(rVar, tVar3);
                tVar3.f0();
                if (tVar3.S) {
                    tVar3.k(function02);
                } else {
                    tVar3.p0();
                }
                p1.a0.j(r0VarD, iVar, tVar3);
                p1.a0.j(n1VarL3, iVar2, tVar3);
                if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode3))) {
                    a2.c.u(iHashCode3, tVar3, iHashCode3, iVar3);
                }
                p1.a0.j(tVarI3, iVar4, tVar3);
                function2.invoke(tVar3, 6);
                tVar3.b0(1806523256);
                tVar3.p(false);
                tVar3.p(true);
                Unit unit = Unit.f71706a;
            }
            tVar3.p(false);
            tVar3.b0(953187143);
            tVar3.p(false);
            tVar3.b0(953192437);
            z2 z2Var = g1.f73330a;
            b2.t tVarB2 = androidx.compose.foundation.a.b(rVar, ((d1) tVar3.j(z2Var)).f73166u, i2.r0.f61135a);
            tVar3.p(false);
            b2.t tVarThen2 = tVarB2.then(fillElement);
            z2.r0 r0VarD2 = k0.p.d(b2.d.f17000d, false);
            int iHashCode4 = Long.hashCode(tVar3.T);
            n1 n1VarL4 = tVar3.l();
            b2.t tVarI4 = fg.a.I(tVarThen2, tVar3);
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function02);
            } else {
                tVar3.p0();
            }
            p1.a0.j(r0VarD2, iVar, tVar3);
            p1.a0.j(n1VarL4, iVar2, tVar3);
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode4))) {
                a2.c.u(iHashCode4, tVar3, iHashCode4, iVar3);
            }
            p1.a0.j(tVarI4, iVar4, tVar3);
            p1.a0.a(a2.c.t(((d1) tVar3.j(z2Var)).f73167v, s1.f73932a), x1.f.d(247172530, new b20.i(function22, 10), tVar3), tVar3, 56);
            tVar3.p(true);
            tVar3.p(true);
            tVar3.b0(2111467006);
            tVar3.p(false);
            tVar3.p(true);
            z12 = true;
            tVar2 = rVar;
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new com.instabridge.mobilesdk.internal.ui.screens.m0(tVar2, function2, function22, z12, function0, i5, i11, 6);
        }
    }

    public static final long c(float f11, float f12) {
        return (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
    }

    public static final void d(b2.t tVar, Function2 function2, Function2 function22, boolean z11, Function0 function0, p1.o oVar, int i5) {
        Function2 function23;
        b2.t tVar2;
        boolean z12;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(841279268);
        if (((i5 | 224262 | (tVar3.h(function0) ? 1048576 : 524288)) & 599187) == 599186 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
            function23 = function22;
            z12 = z11;
        } else {
            c1 c1Var = c1.f70578b;
            b2.r rVar = b2.r.f17024a;
            b2.t tVarD = androidx.compose.foundation.c.d(fg.a.g(androidx.compose.foundation.layout.a.d(rVar, c1Var), s0.h.c(8)), false, null, null, function0, 15);
            k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.f17009m, tVar3, 0);
            int iHashCode = Long.hashCode(tVar3.T);
            n1 n1VarL = tVar3.l();
            b2.t tVarI = fg.a.I(tVarD, tVar3);
            b3.l.Po.getClass();
            Function0 function02 = b3.k.f17270b;
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function02);
            } else {
                tVar3.p0();
            }
            b3.i iVar = b3.k.f17275g;
            p1.a0.j(xVarA, iVar, tVar3);
            b3.i iVar2 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar2, tVar3);
            b3.i iVar3 = b3.k.f17278j;
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar3, iHashCode, iVar3);
            }
            b3.i iVar4 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar4, tVar3);
            tVar3.b0(283232779);
            b2.k kVar = b2.d.f16997a;
            if (function2 != null) {
                z2.r0 r0VarD = k0.p.d(kVar, false);
                int iHashCode2 = Long.hashCode(tVar3.T);
                n1 n1VarL2 = tVar3.l();
                b2.t tVarI2 = fg.a.I(rVar, tVar3);
                tVar3.f0();
                if (tVar3.S) {
                    tVar3.k(function02);
                } else {
                    tVar3.p0();
                }
                p1.a0.j(r0VarD, iVar, tVar3);
                p1.a0.j(n1VarL2, iVar2, tVar3);
                if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode2))) {
                    a2.c.u(iHashCode2, tVar3, iHashCode2, iVar3);
                }
                p1.a0.j(tVarI2, iVar4, tVar3);
                function2.invoke(tVar3, 6);
                tVar3.b0(491327523);
                tVar3.p(false);
                tVar3.p(true);
                Unit unit = Unit.f71706a;
            }
            tVar3.p(false);
            tVar3.b0(283245576);
            z2 z2Var = g1.f73330a;
            b2.t tVarB = androidx.compose.foundation.a.b(rVar, ((d1) tVar3.j(z2Var)).f73166u, i2.r0.f61135a);
            tVar3.p(false);
            b2.t tVarE = androidx.compose.foundation.layout.e.e(tVarB, 1.0f);
            z2.r0 r0VarD2 = k0.p.d(kVar, false);
            int iHashCode3 = Long.hashCode(tVar3.T);
            n1 n1VarL3 = tVar3.l();
            b2.t tVarI3 = fg.a.I(tVarE, tVar3);
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function02);
            } else {
                tVar3.p0();
            }
            p1.a0.j(r0VarD2, iVar, tVar3);
            p1.a0.j(n1VarL3, iVar2, tVar3);
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode3))) {
                a2.c.u(iHashCode3, tVar3, iHashCode3, iVar3);
            }
            p1.a0.j(tVarI3, iVar4, tVar3);
            function23 = function22;
            p1.a0.a(a2.c.t(((d1) tVar3.j(z2Var)).f73167v, s1.f73932a), x1.f.d(498812520, new b20.i(function23, 11), tVar3), tVar3, 56);
            tVar3.p(true);
            tVar3.b0(283258352);
            tVar3.p(false);
            tVar3.p(true);
            tVar2 = rVar;
            z12 = true;
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new m3(tVar2, function2, function23, z12, function0, i5);
        }
    }

    public static final void e(Throwable th2, q1.k0 k0Var, k2 k2Var, p1.a aVar) {
        if (k0Var == null) {
            return;
        }
        a2.e.b(th2, new p1.p(5, aVar, k2Var, k0Var));
    }

    public static final int f(int i5, int i11) {
        return (int) ((i11 * 0.0f) + ((1 - 0.0f) * i5));
    }

    public static final m.w g(q1.k0 k0Var, k2 k2Var) {
        return new m.w(k0Var, k2Var, false, 10);
    }

    public static d4.k h(t70.q0 q0Var) {
        return bh.g.V(new k30.e(q0Var, 22));
    }

    public static StripeException i(Throwable throwable) {
        Intrinsics.g(throwable, "throwable");
        if (throwable instanceof StripeException) {
            return (StripeException) throwable;
        }
        if (throwable instanceof JSONException) {
            return new APIException(0, 7, null, null, throwable.getMessage(), throwable);
        }
        if (throwable instanceof IOException) {
            int i5 = APIConnectionException.f42558f;
            return f.w(null, (IOException) throwable);
        }
        if (throwable instanceof IllegalArgumentException) {
            return new InvalidRequestException(0, 7, null, null, throwable.getMessage(), throwable);
        }
        Class<?> cls = throwable.getClass();
        return new GenericStripeException((r70.j.I0(cls.getName(), "android.", false) || r70.j.I0(cls.getName(), "java.", false)) ? cls.getName() : null, throwable);
    }

    public static u60.a j(u60.g gVar) {
        u60.a aVarB = f.B(f.L(gVar, "clike"), "groovy", u60.g.g("keyword", u60.g.c(Pattern.compile("\\b(?:as|def|in|abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|native|new|package|private|protected|public|return|short|static|strictfp|super|switch|synchronized|this|throw|throws|trait|transient|try|void|volatile|while)\\b"))), u60.g.g("string", u60.g.d(Pattern.compile("(\"\"\"|''')[\\s\\S]*?\\1|(?:\\$\\/)(?:\\$\\/\\$|[\\s\\S])*?\\/\\$"), false), u60.g.d(Pattern.compile("([\"'\\/])(?:\\\\.|(?!\\1)[^\\\\\\r\\n])*\\1"), false)), u60.g.g("number", u60.g.c(Pattern.compile("\\b(?:0b[01_]+|0x[\\da-f_]+(?:\\.[\\da-f_p\\-]+)?|[\\d_]+(?:\\.[\\d_]+)?(?:e[+-]?[\\d]+)?)[glidf]?\\b", 2))), u60.g.g("operator", u60.g.f(Pattern.compile("(^|[^.])(?:~|==?~?|\\?[.:]?|\\*(?:[.=]|\\*=?)?|\\.[@&]|\\.\\.<|\\.{1,2}(?!\\.)|-[-=>]?|\\+[+=]?|!=?|<(?:<=?|=>?)?|>(?:>>?=?|=)?|&[&=]?|\\|[|=]?|\\/=?|\\^=?|%=?)"))), u60.g.g("punctuation", u60.g.c(Pattern.compile("\\.+|[{}\\[\\];(),:$]"))));
        f.G(aVarB, "string", u60.g.g("shebang", u60.g.e(Pattern.compile("#!.+"), false, false, "comment")));
        f.G(aVarB, "punctuation", u60.g.g("spock-block", u60.g.c(Pattern.compile("\\b(?:setup|given|when|then|and|cleanup|expect|where):"))));
        f.G(aVarB, "function", u60.g.g("annotation", u60.g.e(Pattern.compile("(^|[^.])@\\w+"), true, false, "punctuation")));
        return aVarB;
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x00b0 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b1 A[Catch: NumberFormatException -> 0x00c4, LOOP:3: B:28:0x007b->B:47:0x00b1, LOOP_END, TryCatch #1 {NumberFormatException -> 0x00c4, blocks: (B:25:0x0062, B:28:0x007b, B:30:0x0081, B:34:0x008d, B:47:0x00b1, B:49:0x00b6, B:54:0x00ca, B:58:0x00d3, B:59:0x00dd, B:60:0x00e2, B:61:0x00e3, B:62:0x00e8), top: B:84:0x0062 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b6 A[Catch: NumberFormatException -> 0x00c4, TryCatch #1 {NumberFormatException -> 0x00c4, blocks: (B:25:0x0062, B:28:0x007b, B:30:0x0081, B:34:0x008d, B:47:0x00b1, B:49:0x00b6, B:54:0x00ca, B:58:0x00d3, B:59:0x00dd, B:60:0x00e2, B:61:0x00e3, B:62:0x00e8), top: B:84:0x0062 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x00ca A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x00c8 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Path k(String str) {
        Path path;
        to.b[] bVarArr;
        String strTrim;
        float[] fArr;
        Path path2 = new Path();
        if (str == null) {
            bVarArr = null;
            path = null;
        } else {
            ArrayList arrayList = new ArrayList();
            int i5 = 0;
            int i11 = 1;
            while (i11 < str.length()) {
                while (i11 < str.length()) {
                    char cCharAt = str.charAt(i11);
                    if ((cCharAt - 'Z') * (cCharAt - 'A') > 0) {
                        if ((cCharAt - 'z') * (cCharAt - 'a') > 0) {
                            continue;
                        }
                        i11++;
                    }
                    if (cCharAt == 'e' || cCharAt == 'E') {
                        i11++;
                    } else {
                        strTrim = str.substring(i5, i11).trim();
                        if (strTrim.length() > 0) {
                            if (strTrim.charAt(0) == 'z' || strTrim.charAt(0) == 'Z') {
                                fArr = new float[0];
                            } else {
                                try {
                                    int length = strTrim.length();
                                    float[] fArr2 = new float[length];
                                    int length2 = strTrim.length();
                                    int i12 = 0;
                                    int i13 = 1;
                                    while (i13 < length2) {
                                        boolean z11 = false;
                                        boolean z12 = false;
                                        boolean z13 = false;
                                        boolean z14 = false;
                                        for (int i14 = i13; i14 < strTrim.length(); i14++) {
                                            char cCharAt2 = strTrim.charAt(i14);
                                            if (cCharAt2 == ' ') {
                                                z11 = false;
                                                z13 = true;
                                                if (z13) {
                                                }
                                            } else {
                                                if (cCharAt2 != 'E' && cCharAt2 != 'e') {
                                                    switch (cCharAt2) {
                                                        case ',':
                                                            break;
                                                        case '-':
                                                            if (i14 != i13 && !z11) {
                                                                z11 = false;
                                                                z13 = true;
                                                                z14 = true;
                                                                break;
                                                            }
                                                            z11 = false;
                                                            break;
                                                        case '.':
                                                            if (z12) {
                                                                z11 = false;
                                                                z13 = true;
                                                                z14 = true;
                                                                break;
                                                            } else {
                                                                z11 = false;
                                                                z12 = true;
                                                                break;
                                                            }
                                                        default:
                                                            z11 = false;
                                                            break;
                                                    }
                                                } else {
                                                    z11 = true;
                                                }
                                                if (z13) {
                                                }
                                            }
                                            if (i13 < i14) {
                                                fArr2[i12] = Float.parseFloat(strTrim.substring(i13, i14));
                                                i12++;
                                            }
                                            i13 = !z14 ? i14 : i14 + 1;
                                        }
                                        if (i13 < i14) {
                                        }
                                        if (!z14) {
                                        }
                                    }
                                    if (i12 < 0) {
                                        throw new IllegalArgumentException();
                                    }
                                    if (length < 0) {
                                        throw new ArrayIndexOutOfBoundsException();
                                    }
                                    fArr = new float[i12];
                                    System.arraycopy(fArr2, 0, fArr, 0, Math.min(i12, length));
                                } catch (NumberFormatException e3) {
                                    throw new RuntimeException(b.c0.l("error in parsing \"", strTrim, "\""), e3);
                                }
                            }
                            char cCharAt3 = strTrim.charAt(0);
                            to.b bVar = new to.b();
                            bVar.f89552a = cCharAt3;
                            bVar.f89553b = fArr;
                            arrayList.add(bVar);
                        }
                        i5 = i11;
                        i11++;
                    }
                }
                strTrim = str.substring(i5, i11).trim();
                if (strTrim.length() > 0) {
                }
                i5 = i11;
                i11++;
            }
            path = null;
            if (i11 - i5 == 1 && i5 < str.length()) {
                char cCharAt4 = str.charAt(i5);
                to.b bVar2 = new to.b();
                bVar2.f89552a = cCharAt4;
                bVar2.f89553b = new float[0];
                arrayList.add(bVar2);
            }
            bVarArr = (to.b[]) arrayList.toArray(new to.b[arrayList.size()]);
        }
        if (bVarArr == null) {
            return path;
        }
        try {
            to.b.b(bVarArr, path2);
            return path2;
        } catch (RuntimeException e11) {
            throw new RuntimeException(b.c0.k("Error in parsing ", str), e11);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:341:0x073b  */
    /* JADX WARN: Removed duplicated region for block: B:394:0x07e0  */
    /* JADX WARN: Removed duplicated region for block: B:412:0x0807  */
    /* JADX WARN: Removed duplicated region for block: B:438:0x0855  */
    /* JADX WARN: Removed duplicated region for block: B:451:0x0879  */
    /* JADX WARN: Removed duplicated region for block: B:453:0x087e  */
    /* JADX WARN: Removed duplicated region for block: B:607:0x0880 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static on.b n(String str, int i5, int i11, Map map) throws NumberFormatException, WriterException {
        int i12;
        Charset charsetForName;
        int i13;
        rn.a aVar;
        int i14;
        rn.b bVarA;
        on.a aVar2;
        rn.b bVar;
        on.c cVar;
        int i15;
        int i16;
        int i17;
        int i18;
        boolean z11;
        boolean z12;
        boolean z13;
        boolean z14;
        char c11;
        pn.b bVar2;
        int i19;
        pn.b bVar3;
        pn.b bVar4;
        int i21;
        int i22;
        int i23;
        char c12;
        pn.b bVar5;
        if (str.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        }
        if (i5 < 0 || i11 < 0) {
            throw new IllegalArgumentException("Requested dimensions are too small: " + i5 + 'x' + i11);
        }
        nn.a aVar3 = nn.a.f78360a;
        if (map.containsKey(aVar3)) {
            String string = map.get(aVar3).toString();
            if (string == null) {
                throw new NullPointerException("Name is null");
            }
            if (!string.equals("L")) {
                if (string.equals("M")) {
                    i12 = 2;
                } else if (string.equals("Q")) {
                    i12 = 3;
                } else {
                    if (!string.equals("H")) {
                        throw new IllegalArgumentException("No enum constant com.google.zxing.qrcode.decoder.ErrorCorrectionLevel.".concat(string));
                    }
                    i12 = 4;
                }
            }
        } else {
            i12 = 1;
        }
        nn.a aVar4 = nn.a.f78362c;
        int i24 = 4;
        int i25 = map.containsKey(aVar4) ? Integer.parseInt(map.get(aVar4).toString()) : 4;
        Charset charset = sn.b.f87546b;
        nn.a aVar5 = nn.a.f78366g;
        boolean z15 = map.containsKey(aVar5) && Boolean.parseBoolean(map.get(aVar5).toString());
        nn.a aVar6 = nn.a.f78365f;
        boolean z16 = map.containsKey(aVar6) && Boolean.parseBoolean(map.get(aVar6).toString());
        nn.a aVar7 = nn.a.f78361b;
        boolean zContainsKey = map.containsKey(aVar7);
        if (zContainsKey) {
            try {
                charsetForName = Charset.forName(map.get(aVar7).toString());
            } catch (UnsupportedCharsetException unused) {
            }
        } else {
            charsetForName = charset;
        }
        int i26 = 8;
        int i27 = 1;
        int i28 = 2;
        if (z16) {
            if (charsetForName.equals(charset)) {
                charsetForName = null;
            }
            ck.e eVar = new ck.e(str, charsetForName, z15, i12);
            int i29 = eVar.f19977b;
            rn.b[] bVarArr = {ck.e.k(1), ck.e.k(2), ck.e.k(3)};
            i13 = 0;
            mh.c[] cVarArr = {eVar.j(bVarArr[0]), eVar.j(bVarArr[1]), eVar.j(bVarArr[2])};
            int i31 = Integer.MAX_VALUE;
            int i32 = 0;
            int i33 = -1;
            for (int i34 = 3; i32 < i34; i34 = 3) {
                mh.c cVar2 = cVarArr[i32];
                int iC = cVar2.C((rn.b) cVar2.f76324c);
                if (sn.b.c(iC, bVarArr[i32], i29) && iC < i31) {
                    i31 = iC;
                    i33 = i32;
                }
                i32++;
            }
            if (i33 < 0) {
                throw new WriterException("Data too big for any version");
            }
            mh.c cVar3 = cVarArr[i33];
            on.a aVar8 = new on.a();
            Iterator it = ((ArrayList) cVar3.f76323b).iterator();
            while (it.hasNext()) {
                sn.e eVar2 = (sn.e) it.next();
                int i35 = eVar2.f87559c;
                mh.c cVar4 = eVar2.f87561e;
                ck.e eVar3 = (ck.e) cVar4.f76325d;
                rn.a aVar9 = eVar2.f87557a;
                aVar8.c(aVar9.f86122b, i24);
                int i36 = eVar2.f87560d;
                if (i36 > 0) {
                    aVar8.c(eVar2.a(), aVar9.a((rn.b) cVar4.f76324c));
                }
                if (aVar9 == rn.a.ECI) {
                    aVar8.c(((on.c) on.c.f80539d.get(((on.d) eVar3.f19980e).f80544a[i35].charset().name())).f80541a[0], 8);
                } else if (i36 > 0) {
                    String str2 = (String) eVar3.f19979d;
                    int i37 = eVar2.f87558b;
                    sn.b.a(str2.substring(i37, i36 + i37), aVar9, aVar8, ((on.d) eVar3.f19980e).f80544a[i35].charset());
                }
                i24 = 4;
            }
            bVar = (rn.b) cVar3.f76324c;
            aVar2 = aVar8;
        } else {
            i13 = 0;
            Charset charset2 = on.e.f80547b;
            rn.a aVar10 = rn.a.BYTE;
            if (charset2 != null && charset2.equals(charsetForName) && sn.b.b(str)) {
                aVar = rn.a.KANJI;
            } else {
                boolean z17 = false;
                boolean z18 = false;
                int i38 = 0;
                while (true) {
                    if (i38 < str.length()) {
                        char cCharAt = str.charAt(i38);
                        if (cCharAt < '0' || cCharAt > '9') {
                            if ((cCharAt < '`' ? sn.b.f87545a[cCharAt] : -1) == -1) {
                                break;
                            }
                            z17 = true;
                        } else {
                            z18 = true;
                        }
                        i38++;
                    } else if (z17) {
                        aVar = rn.a.ALPHANUMERIC;
                    } else if (z18) {
                        aVar = rn.a.NUMERIC;
                    }
                }
                aVar = aVar10;
            }
            on.a aVar11 = new on.a();
            if (aVar == aVar10 && zContainsKey && (cVar = (on.c) on.c.f80539d.get(charsetForName.name())) != null) {
                i14 = 4;
                aVar11.c(7, 4);
                aVar11.c(cVar.f80541a[0], 8);
            } else {
                i14 = 4;
            }
            if (z15) {
                aVar11.c(5, i14);
            }
            aVar11.c(aVar.f86122b, i14);
            on.a aVar12 = new on.a();
            sn.b.a(str, aVar, aVar12, charsetForName);
            nn.a aVar13 = nn.a.f78363d;
            if (!map.containsKey(aVar13)) {
                int iA = aVar.a(rn.b.a(1)) + aVar11.f80533b + aVar12.f80533b;
                int i39 = 1;
                while (i39 <= 40) {
                    rn.b bVarA2 = rn.b.a(i39);
                    if (sn.b.c(iA, bVarA2, i12)) {
                        int iA2 = aVar.a(bVarA2) + aVar11.f80533b + aVar12.f80533b;
                        int i40 = 1;
                        while (i40 <= 40) {
                            bVarA = rn.b.a(i40);
                            if (!sn.b.c(iA2, bVarA, i12)) {
                                i40++;
                                i25 = i25;
                                i12 = i12;
                                i26 = 8;
                            }
                        }
                        throw new WriterException("Data too big");
                    }
                    i39++;
                    i25 = i25;
                    i12 = i12;
                    i26 = 8;
                }
                throw new WriterException("Data too big");
            }
            rn.b bVarA3 = rn.b.a(Integer.parseInt(map.get(aVar13).toString()));
            if (!sn.b.c(aVar.a(bVarA3) + aVar11.f80533b + aVar12.f80533b, bVarA3, i12)) {
                throw new WriterException("Data too big for requested version");
            }
            bVarA = bVarA3;
            on.a aVar14 = new on.a();
            int i41 = aVar11.f80533b;
            aVar14.d(i41);
            for (int i42 = 0; i42 < i41; i42++) {
                aVar14.a(aVar11.e(i42));
            }
            int iF = aVar == aVar10 ? aVar12.f() : str.length();
            int iA3 = aVar.a(bVarA);
            int i43 = 1 << iA3;
            if (iF >= i43) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(iF);
                sb2.append(" is bigger than ");
                sb2.append(i43 - 1);
                throw new WriterException(sb2.toString());
            }
            aVar14.c(iF, iA3);
            int i44 = aVar12.f80533b;
            aVar14.d(aVar14.f80533b + i44);
            for (int i45 = 0; i45 < i44; i45++) {
                aVar14.a(aVar12.e(i45));
            }
            aVar2 = aVar14;
            bVar = bVarA;
        }
        ag agVar = bVar.f86125b[b.c0.F(i12)];
        int i46 = bVar.f86126c;
        int i47 = agVar.f32385a;
        ke[] keVarArr = (ke[]) agVar.f32386b;
        int length = keVarArr.length;
        int i48 = i13;
        int i49 = i48;
        while (i48 < length) {
            i49 += keVarArr[i48].f32738b;
            i48++;
        }
        int i51 = i46 - (i49 * i47);
        int i52 = i51 * 8;
        if (aVar2.f80533b > i52) {
            throw new WriterException("data bits cannot fit in the QR Code" + aVar2.f80533b + " > " + i52);
        }
        for (int i53 = i13; i53 < 4 && aVar2.f80533b < i52; i53++) {
            aVar2.a(i13);
        }
        boolean z19 = i13;
        int i54 = aVar2.f80533b & 7;
        if (i54 > 0) {
            while (i54 < i26) {
                aVar2.a(z19);
                i54++;
                z19 = 0;
            }
        }
        int iF2 = i51 - aVar2.f();
        for (int i55 = 0; i55 < iF2; i55++) {
            aVar2.c((i55 & 1) == 0 ? 236 : 17, i26);
        }
        if (aVar2.f80533b != i52) {
            throw new WriterException("Bits size does not equal capacity");
        }
        int i56 = 0;
        for (ke keVar : keVarArr) {
            i56 += keVar.f32738b;
        }
        if (aVar2.f() != i51) {
            throw new WriterException("Number of bits and data bytes does not match");
        }
        ArrayList arrayList = new ArrayList(i56);
        int i57 = 0;
        int i58 = 0;
        int iMax = 0;
        int iMax2 = 0;
        on.a aVar15 = aVar2;
        while (i57 < i56) {
            int i59 = i25;
            int i61 = i27;
            int[] iArr = new int[i61];
            int[] iArr2 = new int[i61];
            if (i57 >= i56) {
                throw new WriterException("Block ID too large");
            }
            int i62 = i46 % i56;
            int i63 = i56 - i62;
            int i64 = i46 / i56;
            int i65 = i51 / i56;
            int i66 = i65 + 1;
            int i67 = i64 - i65;
            int i68 = (i64 + 1) - i66;
            if (i67 != i68) {
                throw new WriterException("EC bytes mismatch");
            }
            if (i56 != i63 + i62) {
                throw new WriterException("RS blocks mismatch");
            }
            if (i46 != ((i66 + i68) * i62) + ((i65 + i67) * i63)) {
                throw new WriterException("Total bytes mismatch");
            }
            if (i57 < i63) {
                c11 = 0;
                iArr[0] = i65;
                iArr2[0] = i67;
            } else {
                c11 = 0;
                iArr[0] = i66;
                iArr2[0] = i68;
            }
            int i69 = iArr[c11];
            byte[] bArr = new byte[i69];
            int i71 = i58 * 8;
            int i72 = i57;
            int i73 = 0;
            while (i73 < i69) {
                int i74 = i73;
                int i75 = i56;
                int i76 = 0;
                for (int i77 = 0; i77 < 8; i77++) {
                    if (aVar15.e(i71)) {
                        i76 = (1 << (7 - i77)) | i76;
                    }
                    i71++;
                }
                bArr[i74] = (byte) i76;
                i73 = i74 + 1;
                i56 = i75;
            }
            int i78 = i56;
            int i79 = iArr2[0];
            int i81 = i69 + i79;
            int[] iArr3 = new int[i81];
            int i82 = 0;
            while (i82 < i69) {
                iArr3[i82] = bArr[i82] & 255;
                i82++;
                i81 = i81;
            }
            int i83 = i81;
            pn.a aVar16 = pn.a.f82677g;
            ArrayList arrayList2 = new ArrayList();
            on.a aVar17 = aVar15;
            int i84 = i12;
            arrayList2.add(new pn.b(aVar16, new int[]{1}));
            if (i79 == 0) {
                throw new IllegalArgumentException("No error correction bytes");
            }
            int i85 = i83 - i79;
            if (i85 <= 0) {
                throw new IllegalArgumentException("No data bytes provided");
            }
            if (i79 >= arrayList2.size()) {
                pn.b bVar6 = (pn.b) h6.c1.l(arrayList2, 1);
                int size = arrayList2.size();
                while (size <= i79) {
                    int i86 = size;
                    rn.b bVar7 = bVar;
                    int[] iArr4 = {1, aVar16.f82678a[(size - 1) + aVar16.f82683f]};
                    if (iArr4[0] == 0) {
                        i21 = i46;
                        int i87 = i28;
                        int i88 = 1;
                        while (i88 < i87 && iArr4[i88] == 0) {
                            i88++;
                        }
                        if (i88 == i87) {
                            c12 = 0;
                            iArr4 = new int[]{0};
                            i22 = i51;
                            i23 = i58;
                        } else {
                            c12 = 0;
                            i22 = i51;
                            int i89 = 2 - i88;
                            i23 = i58;
                            int[] iArr5 = new int[i89];
                            System.arraycopy(iArr4, i88, iArr5, 0, i89);
                            iArr4 = iArr5;
                        }
                    } else {
                        i21 = i46;
                        i22 = i51;
                        i23 = i58;
                        c12 = 0;
                    }
                    pn.b bVar8 = bVar6;
                    pn.a aVar18 = bVar8.f82684a;
                    if (!aVar18.equals(aVar16)) {
                        throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
                    }
                    if (bVar8.c() || iArr4[c12] == 0) {
                        bVar5 = aVar18.f82680c;
                    } else {
                        int[] iArr6 = bVar8.f82685b;
                        int length2 = iArr6.length;
                        int length3 = iArr4.length;
                        int[] iArr7 = new int[(length2 + length3) - 1];
                        int[] iArr8 = iArr4;
                        int i91 = 0;
                        while (i91 < length2) {
                            int i92 = i91;
                            int i93 = iArr6[i92];
                            int i94 = length2;
                            int i95 = 0;
                            while (i95 < length3) {
                                int i96 = i92 + i95;
                                int i97 = i95;
                                iArr7[i96] = iArr7[i96] ^ aVar18.a(i93, iArr8[i97]);
                                i95 = i97 + 1;
                            }
                            i91 = i92 + 1;
                            length2 = i94;
                        }
                        bVar5 = new pn.b(aVar18, iArr7);
                    }
                    arrayList2.add(bVar5);
                    size = i86 + 1;
                    bVar6 = bVar5;
                    bVar = bVar7;
                    i46 = i21;
                    i51 = i22;
                    i58 = i23;
                    i28 = 2;
                }
            }
            rn.b bVar9 = bVar;
            int i98 = i46;
            int i99 = i51;
            int i100 = i58;
            pn.b bVar10 = (pn.b) arrayList2.get(i79);
            int[] iArr9 = new int[i85];
            System.arraycopy(iArr3, 0, iArr9, 0, i85);
            if (i85 == 0) {
                throw new IllegalArgumentException();
            }
            if (i85 > 1 && iArr9[0] == 0) {
                int i101 = 1;
                while (i101 < i85 && iArr9[i101] == 0) {
                    i101++;
                }
                if (i101 == i85) {
                    iArr9 = new int[]{0};
                } else {
                    int i102 = i85 - i101;
                    int[] iArr10 = new int[i102];
                    System.arraycopy(iArr9, i101, iArr10, 0, i102);
                    iArr9 = iArr10;
                }
            }
            if (i79 < 0) {
                throw new IllegalArgumentException();
            }
            int length4 = iArr9.length;
            int[] iArr11 = new int[length4 + i79];
            int i103 = 0;
            while (i103 < length4) {
                iArr11[i103] = aVar16.a(iArr9[i103], 1);
                i103++;
                i85 = i85;
            }
            int i104 = i85;
            pn.b bVar11 = new pn.b(aVar16, iArr11);
            pn.a aVar19 = bVar10.f82684a;
            int[] iArr12 = bVar10.f82685b;
            boolean zEquals = aVar16.equals(aVar19);
            pn.b bVar12 = aVar16.f82680c;
            if (!zEquals) {
                throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
            }
            if (bVar10.c()) {
                throw new IllegalArgumentException("Divide by 0");
            }
            if (iArr12[(iArr12.length - 1) - bVar10.b()] == 0) {
                throw new ArithmeticException();
            }
            int i105 = aVar16.f82678a[(aVar16.f82681d - aVar16.f82679b[r3]) - 1];
            pn.b bVarA4 = bVar12;
            while (bVar11.b() >= bVar10.b() && !bVar11.c()) {
                int iB = bVar11.b() - bVar10.b();
                pn.b bVar13 = bVar12;
                int iA4 = aVar16.a(bVar11.f82685b[(r9.length - 1) - bVar11.b()], i105);
                pn.a aVar20 = bVar10.f82684a;
                if (iB < 0) {
                    throw new IllegalArgumentException();
                }
                if (iA4 == 0) {
                    bVar3 = aVar20.f82680c;
                    bVar2 = bVar10;
                    i19 = i105;
                } else {
                    int length5 = iArr12.length;
                    bVar2 = bVar10;
                    int[] iArr13 = new int[length5 + iB];
                    i19 = i105;
                    int i106 = 0;
                    while (i106 < length5) {
                        int i107 = i106;
                        iArr13[i107] = aVar20.a(iArr12[i107], iA4);
                        i106 = i107 + 1;
                    }
                    bVar3 = new pn.b(aVar20, iArr13);
                }
                if (iB < 0) {
                    throw new IllegalArgumentException();
                }
                if (iA4 == 0) {
                    bVar4 = bVar13;
                } else {
                    int[] iArr14 = new int[iB + 1];
                    iArr14[0] = iA4;
                    bVar4 = new pn.b(aVar16, iArr14);
                }
                bVarA4 = bVarA4.a(bVar4);
                bVar11 = bVar11.a(bVar3);
                bVar12 = bVar13;
                bVar10 = bVar2;
                i105 = i19;
            }
            int[] iArr15 = new pn.b[]{bVarA4, bVar11}[1].f82685b;
            int length6 = i79 - iArr15.length;
            for (int i108 = 0; i108 < length6; i108++) {
                iArr3[i104 + i108] = 0;
            }
            System.arraycopy(iArr15, 0, iArr3, i104 + length6, iArr15.length);
            byte[] bArr2 = new byte[i79];
            for (int i109 = 0; i109 < i79; i109++) {
                bArr2[i109] = (byte) iArr3[i69 + i109];
            }
            arrayList.add(new sn.a(bArr, bArr2));
            iMax2 = Math.max(iMax2, i69);
            iMax = Math.max(iMax, i79);
            i58 = i100 + iArr[0];
            i57 = i72 + 1;
            i25 = i59;
            bVar = bVar9;
            aVar15 = aVar17;
            i56 = i78;
            i12 = i84;
            i46 = i98;
            i51 = i99;
            i27 = 1;
            i28 = 2;
        }
        rn.b bVar14 = bVar;
        int i110 = i12;
        int i111 = i25;
        int i112 = i46;
        if (i51 != i58) {
            throw new WriterException("Data bytes does not match offset");
        }
        on.a aVar21 = new on.a();
        for (int i113 = 0; i113 < iMax2; i113++) {
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                byte[] bArr3 = ((sn.a) it2.next()).f87543a;
                if (i113 < bArr3.length) {
                    aVar21.c(bArr3[i113], 8);
                }
            }
        }
        for (int i114 = 0; i114 < iMax; i114++) {
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                byte[] bArr4 = ((sn.a) it3.next()).f87544b;
                if (i114 < bArr4.length) {
                    aVar21.c(bArr4[i114], 8);
                }
            }
        }
        if (i112 != aVar21.f()) {
            StringBuilder sbJ = u4.j(i112, "Interleaving error: ", " and ");
            sbJ.append(aVar21.f());
            sbJ.append(" differ.");
            throw new WriterException(sbJ.toString());
        }
        int i115 = (bVar14.f86124a * 4) + 17;
        com.google.android.gms.internal.consent_sdk.a aVar22 = new com.google.android.gms.internal.consent_sdk.a(i115, i115);
        int i116 = aVar22.f31985c;
        int i117 = aVar22.f31984b;
        nn.a aVar23 = nn.a.f78364e;
        if (map.containsKey(aVar23)) {
            i15 = Integer.parseInt(map.get(aVar23).toString());
            if (!(i15 >= 0 && i15 < 8)) {
            }
        } else {
            i15 = -1;
        }
        int i118 = -1;
        if (i15 == -1) {
            int i119 = Integer.MAX_VALUE;
            int i120 = 0;
            while (i120 < 8) {
                int i121 = i110;
                sn.c.b(aVar21, i121, bVar14, i120, aVar22);
                int i122 = 0;
                int iA5 = sn.c.a(aVar22, false) + sn.c.a(aVar22, true);
                byte[][] bArr5 = (byte[][]) aVar22.f31986d;
                int i123 = 0;
                int i124 = 0;
                while (i123 < i116 - 1) {
                    byte[] bArr6 = bArr5[i123];
                    while (i122 < i117 - 1) {
                        byte b11 = bArr6[i122];
                        int i125 = i122 + 1;
                        int i126 = i118;
                        if (b11 == bArr6[i125]) {
                            byte[] bArr7 = bArr5[i123 + 1];
                            if (b11 == bArr7[i122] && b11 == bArr7[i125]) {
                                i124++;
                            }
                        }
                        i118 = i126;
                        i122 = i125;
                    }
                    i123++;
                    i122 = 0;
                }
                int i127 = i118;
                int i128 = (i124 * 3) + iA5;
                int i129 = 0;
                int i130 = 0;
                while (i129 < i116) {
                    int i131 = 0;
                    while (i131 < i117) {
                        byte[] bArr8 = bArr5[i129];
                        int i132 = i131 + 6;
                        if (i132 < i117) {
                            i16 = i130;
                            byte b12 = 1;
                            if (bArr8[i131] == 1 && bArr8[i131 + 1] == 0 && bArr8[i131 + 2] == 1 && bArr8[i131 + 3] == 1 && bArr8[i131 + 4] == 1 && bArr8[i131 + 5] == 0 && bArr8[i132] == 1) {
                                int i133 = i131 - 4;
                                if (i133 < 0 || bArr8.length < i131) {
                                    z13 = false;
                                    if (!z13) {
                                        int i134 = i131 + 7;
                                        int i135 = i131 + 11;
                                        if (i134 < 0 || bArr8.length < i135) {
                                            z14 = false;
                                            if (!z14) {
                                            }
                                        } else {
                                            while (i134 < i135) {
                                                int i136 = i134;
                                                if (bArr8[i134] == 1) {
                                                    z14 = false;
                                                    break;
                                                }
                                                i134 = i136 + 1;
                                            }
                                            z14 = true;
                                            if (!z14) {
                                            }
                                        }
                                    }
                                    i130 = i16 + 1;
                                } else {
                                    while (i133 < i131) {
                                        if (bArr8[i133] == b12) {
                                            z13 = false;
                                            break;
                                        }
                                        i133++;
                                        b12 = 1;
                                    }
                                    z13 = true;
                                    if (!z13) {
                                    }
                                    i130 = i16 + 1;
                                }
                            }
                            i17 = i129 + 6;
                            if (i17 >= i116) {
                                byte b13 = 1;
                                if (bArr5[i129][i131] == 1 && bArr5[i129 + 1][i131] == 0 && bArr5[i129 + 2][i131] == 1 && bArr5[i129 + 3][i131] == 1 && bArr5[i129 + 4][i131] == 1 && bArr5[i129 + 5][i131] == 0 && bArr5[i17][i131] == 1) {
                                    int i137 = i129 - 4;
                                    if (i137 < 0 || bArr5.length < i129) {
                                        z11 = false;
                                        if (z11) {
                                            int i138 = i129 + 7;
                                            int i139 = i129 + 11;
                                            if (i138 < 0 || bArr5.length < i139) {
                                                i18 = i129;
                                            } else {
                                                while (i138 < i139) {
                                                    i18 = i129;
                                                    if (bArr5[i138][i131] != 1) {
                                                        i138++;
                                                        i129 = i18;
                                                    }
                                                }
                                                i18 = i129;
                                                z12 = true;
                                                if (!z12) {
                                                }
                                            }
                                            z12 = false;
                                            if (!z12) {
                                            }
                                        } else {
                                            i18 = i129;
                                        }
                                        i130++;
                                    } else {
                                        while (i137 < i129) {
                                            if (bArr5[i137][i131] == b13) {
                                                z11 = false;
                                                break;
                                            }
                                            i137++;
                                            b13 = 1;
                                        }
                                        z11 = true;
                                        if (z11) {
                                        }
                                        i130++;
                                    }
                                } else {
                                    i18 = i129;
                                }
                            }
                            i131++;
                            i129 = i18;
                        } else {
                            i16 = i130;
                        }
                        i130 = i16;
                        i17 = i129 + 6;
                        if (i17 >= i116) {
                        }
                        i131++;
                        i129 = i18;
                    }
                    i129++;
                }
                int i140 = (i130 * 40) + i128;
                int i141 = 0;
                for (int i142 = 0; i142 < i116; i142++) {
                    byte[] bArr9 = bArr5[i142];
                    for (int i143 = 0; i143 < i117; i143++) {
                        if (bArr9[i143] == 1) {
                            i141++;
                        }
                    }
                }
                int i144 = i116 * i117;
                int iAbs = (((Math.abs((i141 * 2) - i144) * 10) / i144) * 10) + i140;
                if (iAbs < i119) {
                    i119 = iAbs;
                    i118 = i120;
                } else {
                    i118 = i127;
                }
                i120++;
                i110 = i121;
            }
            i15 = i118;
        }
        sn.c.b(aVar21, i110, bVar14, i15, aVar22);
        int i145 = i111 * 2;
        int i146 = i117 + i145;
        int i147 = i145 + i116;
        int iMax3 = Math.max(i5, i146);
        int iMax4 = Math.max(i11, i147);
        int iMin = Math.min(iMax3 / i146, iMax4 / i147);
        int i148 = (iMax3 - (i117 * iMin)) / 2;
        int i149 = (iMax4 - (i116 * iMin)) / 2;
        on.b bVar15 = new on.b();
        if (iMax3 < 1 || iMax4 < 1) {
            throw new IllegalArgumentException("Both dimensions must be greater than 0");
        }
        bVar15.f80534a = iMax3;
        bVar15.f80535b = iMax4;
        int i150 = (iMax3 + 31) / 32;
        bVar15.f80536c = i150;
        bVar15.f80537d = new int[i150 * iMax4];
        int i151 = 0;
        while (i151 < i116) {
            int i152 = i148;
            int i153 = 0;
            while (i153 < i117) {
                if (aVar22.s(i153, i151) == 1) {
                    if (i149 < 0 || i152 < 0) {
                        throw new IllegalArgumentException("Left and top must be nonnegative");
                    }
                    if (iMin < 1 || iMin < 1) {
                        throw new IllegalArgumentException("Height and width must be at least 1");
                    }
                    int i154 = i152 + iMin;
                    int i155 = i149 + iMin;
                    if (i155 > bVar15.f80535b || i154 > bVar15.f80534a) {
                        throw new IllegalArgumentException("The region must fit inside the matrix");
                    }
                    for (int i156 = i149; i156 < i155; i156++) {
                        int i157 = bVar15.f80536c * i156;
                        for (int i158 = i152; i158 < i154; i158++) {
                            int[] iArr16 = bVar15.f80537d;
                            int i159 = (i158 / 32) + i157;
                            iArr16[i159] = iArr16[i159] | (1 << (i158 & 31));
                        }
                    }
                }
                i153++;
                i152 += iMin;
            }
            i151++;
            i149 += iMin;
        }
        return bVar15;
    }

    public static v o(h6.n1 n1Var) {
        k6.a defaultCreationExtras = k6.a.f71149b;
        Intrinsics.g(defaultCreationExtras, "defaultCreationExtras");
        x7.n nVar = new x7.n(n1Var, v.f82278b, defaultCreationExtras);
        KClass modelClass = JvmClassMappingKt.e(v.class);
        Intrinsics.g(modelClass, "modelClass");
        String qualifiedName = modelClass.getQualifiedName();
        if (qualifiedName != null) {
            return (v) nVar.m(modelClass, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(qualifiedName));
        }
        throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
    }

    public static final void p(k2 k2Var, p1.c cVar, int i5) {
        while (true) {
            int i11 = k2Var.f81484v;
            if (i5 > i11 && i5 < k2Var.f81483u) {
                return;
            }
            if (i11 == 0 && i5 == 0) {
                return;
            }
            k2Var.L();
            if (k2Var.x(k2Var.f81484v)) {
                cVar.q();
            }
            k2Var.j();
        }
    }

    public static final i20.a q(String str, Collection collection) {
        u80.b bVar;
        String str2;
        ExternalLink externalLink;
        if (collection == null) {
            return new i20.a(0L, str, null, true);
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            u80.c cVar = (u80.c) it.next();
            ExternalLink externalLink2 = null;
            if (cVar instanceof u80.a) {
                u80.a aVar = (u80.a) cVar;
                String str3 = aVar.f90679d;
                if (str3 != null) {
                    externalLink = new ExternalLink(b.c0.k("file/", aVar.f90676a), aVar.f90677b, null, aVar.f90680e, str3, null, null, 228);
                    externalLink2 = externalLink;
                }
            } else if ((cVar instanceof u80.b) && (str2 = (bVar = (u80.b) cVar).f90684d) != null) {
                externalLink = new ExternalLink(b.c0.k("folder/", bVar.f90681a), bVar.f90682b, null, bVar.f90685e, str2, null, null, 228);
                externalLink2 = externalLink;
            }
            if (externalLink2 != null) {
                arrayList.add(externalLink2);
            }
        }
        return new i20.a(0L, str, arrayList, false);
    }

    public static JSONArray r() throws SecurityException {
        MediaCodecInfo.CodecCapabilities capabilitiesForType;
        MediaCodecInfo[] mediaCodecInfoArr;
        int i5;
        int i11;
        String strValueOf;
        int i12;
        HashSet hashSet = new HashSet();
        MediaCodecInfo[] codecInfos = new MediaCodecList(1).getCodecInfos();
        int length = codecInfos.length;
        int i13 = 0;
        while (i13 < length) {
            MediaCodecInfo mediaCodecInfo = codecInfos[i13];
            if (!mediaCodecInfo.isEncoder() && (Build.VERSION.SDK_INT < 29 || !mediaCodecInfo.isAlias())) {
                String[] supportedTypes = mediaCodecInfo.getSupportedTypes();
                int length2 = supportedTypes.length;
                int i14 = 0;
                while (i14 < length2) {
                    if (supportedTypes[i14].equals("video/hevc") && (capabilitiesForType = mediaCodecInfo.getCapabilitiesForType("video/hevc")) != null) {
                        MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArr = capabilitiesForType.profileLevels;
                        int length3 = codecProfileLevelArr.length;
                        int i15 = 0;
                        while (i15 < length3) {
                            int i16 = codecProfileLevelArr[i15].level;
                            Field[] fields = MediaCodecInfo.CodecProfileLevel.class.getFields();
                            int length4 = fields.length;
                            int i17 = 0;
                            while (true) {
                                if (i17 >= length4) {
                                    mediaCodecInfoArr = codecInfos;
                                    i5 = length;
                                    i11 = i13;
                                    strValueOf = String.valueOf(i16);
                                    break;
                                }
                                Field field = fields[i17];
                                mediaCodecInfoArr = codecInfos;
                                strValueOf = field.getName();
                                i5 = length;
                                int i18 = i17;
                                if (field.getType() == Integer.TYPE && strValueOf.contains("HEVC")) {
                                    try {
                                        if (field.getInt(null) == i16) {
                                            i11 = i13;
                                            break;
                                        }
                                        i12 = i13;
                                    } catch (IllegalAccessException e3) {
                                        i12 = i13;
                                        sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "becpkAyYbMSPTtJomBis", "XOs5vSaKSuuFXNJRohCtLQ==", 83);
                                    }
                                } else {
                                    i12 = i13;
                                }
                                i17 = i18 + 1;
                                codecInfos = mediaCodecInfoArr;
                                length = i5;
                                i13 = i12;
                            }
                            hashSet.add(strValueOf);
                            i15++;
                            codecInfos = mediaCodecInfoArr;
                            length = i5;
                            i13 = i11;
                        }
                    }
                    i14++;
                    codecInfos = codecInfos;
                    length = length;
                    i13 = i13;
                }
            }
            i13++;
            codecInfos = codecInfos;
            length = length;
        }
        JSONArray jSONArray = new JSONArray();
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            jSONArray.put((String) it.next());
        }
        return jSONArray;
    }

    public Metadata l(xe.c cVar) {
        ByteBuffer byteBuffer = cVar.f61580d;
        byteBuffer.getClass();
        wf.a.e(byteBuffer.position() == 0 && byteBuffer.hasArray() && byteBuffer.arrayOffset() == 0);
        if (cVar.d(Integer.MIN_VALUE)) {
            return null;
        }
        return m(cVar, byteBuffer);
    }

    public abstract Metadata m(xe.c cVar, ByteBuffer byteBuffer);
}
