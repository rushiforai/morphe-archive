package defpackage;

import android.graphics.Paint;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import android.text.TextPaint;
import android.text.method.PasswordTransformationMethod;
import android.view.ActionMode;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader$ParseException;
import com.google.android.gms.internal.play_billing.zzgs;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.MalformedJsonException;
import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.graphql.fragment.MembershipFragment;
import java.io.EOFException;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import kotlinx.serialization.json.internal.JsonEncodingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class vn7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;

    public static oic A() {
        return (oic) uic.b.m();
    }

    public static int A0(Object obj, d8g d8gVar, byte[] bArr, int i, int i2, int i3, hmf hmfVar) throws zzgs {
        int i4 = hmfVar.d + 1;
        hmfVar.d = i4;
        E0(i4);
        int iS = ((n7g) d8gVar).s(obj, bArr, i, i2, i3, hmfVar);
        hmfVar.d--;
        hmfVar.c = obj;
        return iS;
    }

    public static final zw7 B(MembershipFragment membershipFragment) {
        int i = mv7.a[membershipFragment.getTier().ordinal()];
        return i != 1 ? i != 2 ? zw7.NOT_A_MEMBER : zw7.REGULAR : zw7.PREMIUM;
    }

    public static int B0(Object obj, d8g d8gVar, byte[] bArr, int i, int i2, hmf hmfVar) throws zzgs {
        int iX0 = i + 1;
        int i3 = bArr[i];
        if (i3 < 0) {
            iX0 = x0(i3, bArr, iX0, hmfVar);
            i3 = hmfVar.a;
        }
        int i4 = iX0;
        if (i3 < 0 || i3 > i2 - i4) {
            ygf.k("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        int i5 = hmfVar.d + 1;
        hmfVar.d = i5;
        E0(i5);
        int i6 = i4 + i3;
        d8gVar.c(obj, bArr, i4, i6, hmfVar);
        hmfVar.d--;
        hmfVar.c = obj;
        return i6;
    }

    public static final n98 C(p98 p98Var, int i) {
        p98Var.getClass();
        return n98.d(p98Var.getString(i));
    }

    public static int C0(int i, byte[] bArr, int i2, int i3, hmf hmfVar) throws zzgs {
        if ((i >>> 3) == 0) {
            ygf.k("Protocol message contained an invalid tag (zero).");
            return 0;
        }
        int i4 = i & 7;
        if (i4 == 0) {
            return z0(bArr, i2, hmfVar);
        }
        if (i4 == 1) {
            return i2 + 8;
        }
        if (i4 == 2) {
            return w0(bArr, i2, hmfVar) + hmfVar.a;
        }
        if (i4 != 3) {
            if (i4 == 5) {
                return i2 + 4;
            }
            ygf.k("Protocol message contained an invalid tag (zero).");
            return 0;
        }
        int i5 = (i & (-8)) | 4;
        int i6 = hmfVar.d + 1;
        hmfVar.d = i6;
        E0(i6);
        int i7 = 0;
        while (i2 < i3) {
            i2 = w0(bArr, i2, hmfVar);
            i7 = hmfVar.a;
            if (i7 == i5) {
                break;
            }
            i2 = C0(i7, bArr, i2, i3, hmfVar);
        }
        hmfVar.d--;
        if (i2 <= i3 && i7 == i5) {
            return i2;
        }
        ygf.k("Failed to parse the message.");
        return 0;
    }

    public static Class D(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            return (Class) ((ParameterizedType) type).getRawType();
        }
        if (type instanceof GenericArrayType) {
            return Array.newInstance((Class<?>) D(((GenericArrayType) type).getGenericComponentType()), 0).getClass();
        }
        if (type instanceof TypeVariable) {
            return Object.class;
        }
        if (type instanceof WildcardType) {
            return D(((WildcardType) type).getUpperBounds()[0]);
        }
        ywb.j("Expected a Class, ParameterizedType, or GenericArrayType, but <", type, "> is of type ", type == null ? "null" : type.getClass().getName());
        return null;
    }

    public static long D0(int i, byte[] bArr) {
        return (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
    }

    public static vx9 E(r30 r30Var) {
        int i = Build.VERSION.SDK_INT;
        if (i >= 28) {
            return new vx9(uy.w(r30Var));
        }
        TextPaint textPaint = new TextPaint(r30Var.getPaint());
        TextDirectionHeuristic textDirectionHeuristic = TextDirectionHeuristics.FIRSTSTRONG_LTR;
        int breakStrategy = r30Var.getBreakStrategy();
        int hyphenationFrequency = r30Var.getHyphenationFrequency();
        if (r30Var.getTransformationMethod() instanceof PasswordTransformationMethod) {
            textDirectionHeuristic = TextDirectionHeuristics.LTR;
        } else if (i < 28 || (r30Var.getInputType() & 15) != 3) {
            boolean z = r30Var.getLayoutDirection() == 1;
            switch (r30Var.getTextDirection()) {
                case 2:
                    textDirectionHeuristic = TextDirectionHeuristics.ANYRTL_LTR;
                    break;
                case 3:
                    textDirectionHeuristic = TextDirectionHeuristics.LTR;
                    break;
                case 4:
                    textDirectionHeuristic = TextDirectionHeuristics.RTL;
                    break;
                case 5:
                    textDirectionHeuristic = TextDirectionHeuristics.LOCALE;
                    break;
                case 6:
                    break;
                case 7:
                    textDirectionHeuristic = TextDirectionHeuristics.FIRSTSTRONG_RTL;
                    break;
                default:
                    if (z) {
                        textDirectionHeuristic = TextDirectionHeuristics.FIRSTSTRONG_RTL;
                    }
                    break;
            }
        } else {
            byte directionality = Character.getDirectionality(uy.l(o6.i(r30Var.getTextLocale()))[0].codePointAt(0));
            textDirectionHeuristic = (directionality == 1 || directionality == 2) ? TextDirectionHeuristics.RTL : TextDirectionHeuristics.LTR;
        }
        return new vx9(textPaint, textDirectionHeuristic, breakStrategy, hyphenationFrequency);
    }

    public static void E0(int i) throws zzgs {
        if (i < 100) {
            return;
        }
        ygf.k("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
    }

    public static nzb F(b55 b55Var) {
        nzb nzbVar = new nzb();
        nzbVar.d = pwd.F(b55Var, nzbVar, nzbVar);
        return nzbVar;
    }

    public static oic G(oic oicVar) {
        if (oicVar instanceof jsd) {
            jsd jsdVar = (jsd) oicVar;
            if (jsdVar.t == to7.j()) {
                jsdVar.r = null;
                return oicVar;
            }
        }
        if (oicVar instanceof ksd) {
            ksd ksdVar = (ksd) oicVar;
            if (ksdVar.i == to7.j()) {
                ksdVar.h = null;
                return oicVar;
            }
        }
        oic oicVarE = uic.e(oicVar, null, false);
        oicVarE.j();
        return oicVarE;
    }

    public static Object H(h83 h83Var, m45 m45Var) {
        oic jsdVar;
        oic oicVar = (oic) uic.b.m();
        if (oicVar instanceof jsd) {
            jsd jsdVar2 = (jsd) oicVar;
            if (jsdVar2.t == to7.j()) {
                x45 x45Var = jsdVar2.r;
                x45 x45Var2 = jsdVar2.s;
                try {
                    ((jsd) oicVar).r = uic.i(h83Var, x45Var, true);
                    ((jsd) oicVar).s = x45Var2;
                    return m45Var.invoke();
                } finally {
                    jsdVar2.r = x45Var;
                    jsdVar2.s = x45Var2;
                }
            }
        }
        if (oicVar == null || (oicVar instanceof k78)) {
            jsdVar = new jsd(oicVar instanceof k78 ? (k78) oicVar : null, h83Var, null, true, false);
        } else {
            jsdVar = oicVar.u(h83Var);
        }
        try {
            oic oicVarJ = jsdVar.j();
            try {
                Object objInvoke = m45Var.invoke();
                oic.q(oicVarJ);
                jsdVar.c();
                return objInvoke;
            } catch (Throwable th) {
                oic.q(oicVarJ);
                throw th;
            }
        } catch (Throwable th2) {
            jsdVar.c();
            throw th2;
        }
    }

    public static final s6a I(s6a s6aVar, wjc wjcVar) {
        s6aVar.getClass();
        int i = s6aVar.c;
        if ((i & 256) == 256) {
            return s6aVar.m;
        }
        if ((i & 512) == 512) {
            return wjcVar.f(s6aVar.n);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:130:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0381  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0385  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0395  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x03a5  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x03f0  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x03f5  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x040d  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0411  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x0436  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0450  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0453  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0459  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x014f  */
    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Not found exit edge by exit block: B:62:0x0183
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.checkLoopExits(LoopRegionMaker.java:226)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeLoopRegion(LoopRegionMaker.java:196)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:63)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:102)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:102)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.c09 J(int r54, int r55, defpackage.x12 r56) {
        /*
            Method dump skipped, instruction units count: 1544
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vn7.J(int, int, x12):c09");
    }

    public static dc6 K(gd6 gd6Var) {
        boolean z;
        try {
            try {
                gd6Var.p0();
                z = false;
                try {
                    jc6.a.getClass();
                    return jc6.d(gd6Var);
                } catch (EOFException e) {
                    e = e;
                    if (z) {
                        return pc6.a;
                    }
                    throw new JsonSyntaxException(e);
                }
            } catch (EOFException e2) {
                e = e2;
                z = true;
            }
        } catch (MalformedJsonException e3) {
            throw new JsonSyntaxException(e3);
        } catch (IOException e4) {
            throw new JsonIOException(e4);
        } catch (NumberFormatException e5) {
            throw new JsonSyntaxException(e5);
        }
    }

    public static boolean L(int i, Parcel parcel) {
        n0(parcel, i, 4);
        return parcel.readInt() != 0;
    }

    public static int M(int i, Parcel parcel) {
        n0(parcel, i, 4);
        return parcel.readInt();
    }

    public static Integer N(int i, Parcel parcel) {
        int iP = P(i, parcel);
        if (iP == 0) {
            return null;
        }
        r0(parcel, iP, 4);
        return Integer.valueOf(parcel.readInt());
    }

    public static long O(int i, Parcel parcel) {
        n0(parcel, i, 8);
        return parcel.readLong();
    }

    public static int P(int i, Parcel parcel) {
        return (i & (-65536)) != -65536 ? (char) (i >> 16) : parcel.readInt();
    }

    public static final s6a Q(a6a a6aVar, wjc wjcVar) {
        wjcVar.getClass();
        int i = a6aVar.c;
        if ((i & 32) == 32) {
            return a6aVar.j;
        }
        if ((i & 64) == 64) {
            return wjcVar.f(a6aVar.k);
        }
        return null;
    }

    public static final s6a R(i6a i6aVar, wjc wjcVar) {
        i6aVar.getClass();
        int i = i6aVar.c;
        if ((i & 32) == 32) {
            return i6aVar.j;
        }
        if ((i & 64) == 64) {
            return wjcVar.f(i6aVar.k);
        }
        return null;
    }

    public static o19 S(v08 v08Var) {
        uic.b(uic.a);
        synchronized (uic.c) {
            uic.h = bu1.R0(uic.h, v08Var);
        }
        return new o19(7, v08Var);
    }

    public static void T(oic oicVar, oic oicVar2, x45 x45Var) {
        if (oicVar != oicVar2) {
            oicVar2.getClass();
            oic.q(oicVar);
            oicVar2.c();
        } else if (oicVar instanceof jsd) {
            ((jsd) oicVar).r = x45Var;
        } else if (oicVar instanceof ksd) {
            ((ksd) oicVar).h = x45Var;
        } else {
            ik4.m("Non-transparent snapshot was reused: ", oicVar);
        }
    }

    public static final s6a U(a6a a6aVar, wjc wjcVar) {
        wjcVar.getClass();
        int i = a6aVar.c;
        if ((i & 8) == 8) {
            s6a s6aVar = a6aVar.g;
            s6aVar.getClass();
            return s6aVar;
        }
        if ((i & 16) == 16) {
            return wjcVar.f(a6aVar.h);
        }
        ygf.f("No returnType in ProtoBuf.Function");
        return null;
    }

    public static final s6a V(i6a i6aVar, wjc wjcVar) {
        i6aVar.getClass();
        int i = i6aVar.c;
        if ((i & 8) == 8) {
            s6a s6aVar = i6aVar.g;
            s6aVar.getClass();
            return s6aVar;
        }
        if ((i & 16) == 16) {
            return wjcVar.f(i6aVar.h);
        }
        ygf.f("No returnType in ProtoBuf.Property");
        return null;
    }

    public static void W() {
        boolean z;
        synchronized (uic.c) {
            g78 g78Var = uic.j.h;
            z = false;
            if (g78Var != null) {
                if (g78Var.h()) {
                    z = true;
                }
            }
        }
        if (z) {
            uic.c();
        }
    }

    public static void X(TextView textView, int i) {
        if (i < 0) {
            lg8.r();
            return;
        }
        if (Build.VERSION.SDK_INT >= 28) {
            uy.G(textView, i);
            return;
        }
        Paint.FontMetricsInt fontMetricsInt = textView.getPaint().getFontMetricsInt();
        int i2 = textView.getIncludeFontPadding() ? fontMetricsInt.top : fontMetricsInt.ascent;
        if (i > Math.abs(i2)) {
            textView.setPadding(textView.getPaddingLeft(), i + i2, textView.getPaddingRight(), textView.getPaddingBottom());
        }
    }

    public static void Y(TextView textView, int i) {
        if (i < 0) {
            lg8.r();
            return;
        }
        Paint.FontMetricsInt fontMetricsInt = textView.getPaint().getFontMetricsInt();
        int i2 = textView.getIncludeFontPadding() ? fontMetricsInt.bottom : fontMetricsInt.descent;
        if (i > Math.abs(i2)) {
            textView.setPadding(textView.getPaddingLeft(), textView.getPaddingTop(), textView.getPaddingRight(), i - i2);
        }
    }

    public static void Z(TextView textView, int i) {
        if (i < 0) {
            lg8.r();
            return;
        }
        if (i != textView.getPaint().getFontMetricsInt(null)) {
            textView.setLineSpacing(i - r0, 1.0f);
        }
    }

    public static void a0(int i, Parcel parcel) {
        parcel.setDataPosition(parcel.dataPosition() + P(i, parcel));
    }

    public static final void b(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1134914726);
        int i2 = 23;
        if (p65Var.P(i & 1, i != 0)) {
            nx0 nx0VarI = bgf.I(new ox0(px0.Collapsed, (m73) p65Var.j(z22.h), ew0.a, new nx(18)), p65Var, 2);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            c(0L, nx0VarI, pxf.E(1762774109, new g64((sb2) objM, i2, nx0VarI), p65Var), p65Var, 24630);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new p44(i, i2);
        }
    }

    public static final void c(long j, nx0 nx0Var, mz1 mz1Var, x12 x12Var, int i) {
        mz1 mz1Var2;
        p65 p65Var;
        long j2;
        int i2;
        long j3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-485771691);
        int i3 = i | 128 | (p65Var2.f(nx0Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                i2 = i3 & (-897);
                j3 = ((zo7) p65Var2.j(kt7.b)).a;
            } else {
                p65Var2.S();
                i2 = i3 & (-897);
                j3 = j;
            }
            p65Var2.q();
            mz1Var2 = mz1Var;
            p65Var = p65Var2;
            bgf.g(o28.b, nx0Var, null, 0, false, null, 0.0f, 0L, 0L, 0.0f, j3, 0L, pxf.E(945950991, new un7(mz1Var2, i4), p65Var2), p65Var, 54 | ((i2 >> 3) & 896), 196992);
            j2 = j3;
        } else {
            mz1Var2 = mz1Var;
            p65Var = p65Var2;
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qo(j2, nx0Var, mz1Var2, i);
        }
    }

    public static final void d(final mn9 mn9Var, final ek8 ek8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-73785164);
        int i2 = (p65Var.f(mn9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = mn9Var.a;
            String str = mn9Var.e;
            mx mxVar = new mx(mn9Var.c);
            mz1 mz1VarE = pxf.E(1019963149, new so1(24, mn9Var), p65Var);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i4 = i2 & 14;
            boolean z2 = (i3 == 32) | (i4 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new m45() { // from class: nn9
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i5 = i;
                        c1e c1eVar = c1e.a;
                        mn9 mn9Var2 = mn9Var;
                        ek8 ek8Var2 = ek8Var;
                        switch (i5) {
                            case 0:
                                ek8Var2.j(mn9Var2.f, mn9Var2.g);
                                break;
                            default:
                                ek8Var2.k(mn9Var2.b, mn9Var2.g);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            int i5 = (i3 == 32 ? 1 : 0) | (i4 == 4 ? 1 : 0);
            Object objM2 = p65Var.M();
            if (i5 != 0 || objM2 == uobVar) {
                final int i6 = 1;
                objM2 = new m45() { // from class: nn9
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i52 = i6;
                        c1e c1eVar = c1e.a;
                        mn9 mn9Var2 = mn9Var;
                        ek8 ek8Var2 = ek8Var;
                        switch (i52) {
                            case 0:
                                ek8Var2.j(mn9Var2.f, mn9Var2.g);
                                break;
                            default:
                                ek8Var2.k(mn9Var2.b, mn9Var2.g);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            rv8.g(z, str, null, mxVar, mz1VarE, 2, m45Var, (m45) objM2, p65Var, 221184, 4);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(mn9Var, ek8Var, i, 13);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    public static final List d0(k5a k5aVar, wjc wjcVar) {
        k5aVar.getClass();
        List list = k5aVar.h;
        boolean zIsEmpty = list.isEmpty();
        ?? arrayList = list;
        if (zIsEmpty) {
            arrayList = 0;
        }
        if (arrayList == 0) {
            List<Integer> list2 = k5aVar.i;
            list2.getClass();
            arrayList = new ArrayList(cu1.k0(list2, 10));
            for (Integer num : list2) {
                num.getClass();
                arrayList.add(wjcVar.f(num.intValue()));
            }
        }
        return arrayList;
    }

    public static final void e(ina inaVar, boolean z, nla nlaVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        Object c9aVar;
        nla nlaVar2;
        inaVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(470269980);
        int i2 = 4;
        int i3 = i | (p65Var.f(inaVar) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.f(nlaVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                c9aVar = new c9a(0, nlaVar, nla.class, "onBackPressed", "onBackPressed()V", 0, 17);
                nlaVar2 = nlaVar;
                p65Var.j0(c9aVar);
            } else {
                c9aVar = objM;
                nlaVar2 = nlaVar;
            }
            mz1 mz1VarE = pxf.E(-265452075, new qg9(inaVar, 10, nlaVar2), p65Var);
            r28Var2 = o28.b;
            qk7.f(pxf.E(916318634, new pv0(z, inaVar, i2), p65Var), r28Var2, (m45) ((qh6) c9aVar), mz1VarE, null, null, 0L, 0L, null, p65Var, 3126, 496);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(inaVar, z, nlaVar, r28Var2, i, 3);
        }
    }

    public static final g9f e0(fb6 fb6Var, xzb xzbVar) {
        xzbVar.getClass();
        mo7 mo7VarJ = xzbVar.j();
        if (mo7VarJ instanceof bc9) {
            return g9f.POLY_OBJ;
        }
        if (g76.L(mo7VarJ, wuc.f)) {
            return g9f.LIST;
        }
        if (!g76.L(mo7VarJ, wuc.g)) {
            return g9f.OBJ;
        }
        xzb xzbVarH = h(xzbVar.h(0), fb6Var.b);
        mo7 mo7VarJ2 = xzbVarH.j();
        if ((mo7VarJ2 instanceof r0a) || g76.L(mo7VarJ2, b0c.f)) {
            return g9f.MAP;
        }
        throw new JsonEncodingException("Value of type '" + xzbVarH.a() + "' can't be used in JSON as a key in the map. It should have either primitive or enum kind, but its kind is '" + xzbVarH.j() + "'.\nUse 'allowStructuredMapKeys = true' in 'Json {}' builder to convert such maps to [key1, value1, key2, value2,...] arrays.");
    }

    public static final void f(sma smaVar, nla nlaVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1673539023);
        int i2 = (p65Var.f(smaVar) ? 4 : 2) | i | (p65Var.f(nlaVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i3 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var, 26);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, null, false, null, null, pxf.E(-591323733, new v08(24, smaVar), p65Var), p65Var, 1572870, 62);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new dq7(l78Var, 27);
                p65Var.j0(objM3);
            }
            mz1 mz1VarE = pxf.E(-982766546, new gx4(smaVar, nlaVar, l78Var, 25), p65Var);
            p65Var = p65Var;
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, mz1VarE, p65Var, 48, 2044);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(smaVar, nlaVar, i, 0);
        }
    }

    public static final s6a f0(a7a a7aVar, wjc wjcVar) {
        a7aVar.getClass();
        wjcVar.getClass();
        int i = a7aVar.c;
        if ((i & 4) == 4) {
            s6a s6aVar = a7aVar.f;
            s6aVar.getClass();
            return s6aVar;
        }
        if ((i & 8) == 8) {
            return wjcVar.f(a7aVar.g);
        }
        ygf.f("No type in ProtoBuf.ValueParameter");
        return null;
    }

    public static final void g(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(697981999);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarB = m40.V(jfc.d(o28Var, 1.0f), p65Var, 6).b(o28Var);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarL = jfc.l(w2g.G(o28Var, 24.0f, 12.0f, 0.0f, 12.0f, 4), 32.0f);
            sn3 sn3Var = kt7.b;
            dy0.a(flb.a0(r28VarL, ((zo7) p65Var.j(sn3Var)).c, bmb.a), p65Var, 0);
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            p65Var.Y(959749755);
            sn3 sn3Var2 = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var2);
            sn3 sn3Var3 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var3)).j.b.c);
            p65Var.p(false);
            r28Var2 = o28Var;
            r28 r28VarD = jfc.d(jfc.e(w2g.G(r28Var2, 16.0f, 12.0f, 16.0f, 0.0f, 8), fZ), 1.0f);
            long j3 = ((zo7) p65Var.j(sn3Var)).c;
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarD, j3, nr5Var), p65Var, 0);
            p65Var.Y(959764057);
            float fZ2 = ((m73) p65Var.j(sn3Var2)).z(((bu7) p65Var.j(sn3Var3)).m.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.F(r28Var2, 16.0f, 4.0f, 16.0f, 12.0f), fZ2), 1.0f), ((zo7) p65Var.j(sn3Var)).c, nr5Var), p65Var, 0);
            p65Var.p(true);
            dy0.a(flb.a0(jfc.m(w2g.G(r28Var2, 0.0f, 12.0f, 24.0f, 0.0f, 9), 90.0f, 32.0f), ((zo7) p65Var.j(sn3Var)).c, bmb.a(16.0f)), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var2, i, 29);
        }
    }

    public static final s6a g0(u6a u6aVar, wjc wjcVar) {
        int i = u6aVar.c;
        if ((i & 4) == 4) {
            s6a s6aVar = u6aVar.g;
            s6aVar.getClass();
            return s6aVar;
        }
        if ((i & 8) == 8) {
            return wjcVar.f(u6aVar.h);
        }
        ygf.f("No underlyingType in ProtoBuf.TypeAlias");
        return null;
    }

    public static final xzb h(xzb xzbVar, fa4 fa4Var) {
        xzbVar.getClass();
        fa4Var.getClass();
        if (!g76.L(xzbVar.j(), b0c.e)) {
            return xzbVar.isInline() ? h(xzbVar.h(0), fa4Var) : xzbVar;
        }
        yi2.L(xzbVar);
        return xzbVar;
    }

    public static ActionMode.Callback h0(ActionMode.Callback callback) {
        return (!(callback instanceof skd) || Build.VERSION.SDK_INT < 26) ? callback : ((skd) callback).a;
    }

    public static Type i(Type type) {
        if (!Collection.class.isAssignableFrom(Collection.class)) {
            lg8.r();
            return null;
        }
        Type typeH = yoe.h(type, Collection.class, yoe.d(type, Collection.class, Collection.class), new LinkedHashSet());
        if (typeH instanceof WildcardType) {
            typeH = ((WildcardType) typeH).getUpperBounds()[0];
        }
        return typeH instanceof ParameterizedType ? ((ParameterizedType) typeH).getActualTypeArguments()[0] : Object.class;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    public static final List i0(x6a x6aVar, wjc wjcVar) {
        x6aVar.getClass();
        List list = x6aVar.h;
        boolean zIsEmpty = list.isEmpty();
        ?? arrayList = list;
        if (zIsEmpty) {
            arrayList = 0;
        }
        if (arrayList == 0) {
            List<Integer> list2 = x6aVar.i;
            list2.getClass();
            arrayList = new ArrayList(cu1.k0(list2, 10));
            for (Integer num : list2) {
                num.getClass();
                arrayList.add(wjcVar.f(num.intValue()));
            }
        }
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    public static final List j(k5a k5aVar, wjc wjcVar) {
        k5aVar.getClass();
        List list = k5aVar.m;
        boolean zIsEmpty = list.isEmpty();
        ?? arrayList = list;
        if (zIsEmpty) {
            arrayList = 0;
        }
        if (arrayList == 0) {
            List<Integer> list2 = k5aVar.n;
            list2.getClass();
            arrayList = new ArrayList(cu1.k0(list2, 10));
            for (Integer num : list2) {
                num.getClass();
                arrayList.add(wjcVar.f(num.intValue()));
            }
        }
        return arrayList;
    }

    public static int j0(Parcel parcel) {
        int i = parcel.readInt();
        int iP = P(i, parcel);
        char c = (char) i;
        int iDataPosition = parcel.dataPosition();
        if (c != 20293) {
            throw new SafeParcelReader$ParseException("Expected object header. Got 0x".concat(String.valueOf(Integer.toHexString(i))), parcel);
        }
        int i2 = iP + iDataPosition;
        if (i2 >= iDataPosition && i2 <= parcel.dataSize()) {
            return i2;
        }
        StringBuilder sb = new StringBuilder(String.valueOf(iDataPosition).length() + 32 + String.valueOf(i2).length());
        sb.append("Size read is invalid start=");
        sb.append(iDataPosition);
        sb.append(" end=");
        sb.append(i2);
        throw new SafeParcelReader$ParseException(sb.toString(), parcel);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    public static final List k(a6a a6aVar, wjc wjcVar) {
        List list = a6aVar.l;
        boolean zIsEmpty = list.isEmpty();
        ?? arrayList = list;
        if (zIsEmpty) {
            arrayList = 0;
        }
        if (arrayList == 0) {
            List<Integer> list2 = a6aVar.m;
            list2.getClass();
            arrayList = new ArrayList(cu1.k0(list2, 10));
            for (Integer num : list2) {
                num.getClass();
                arrayList.add(wjcVar.f(num.intValue()));
            }
        }
        return arrayList;
    }

    public static ActionMode.Callback k0(ActionMode.Callback callback, TextView textView) {
        int i = Build.VERSION.SDK_INT;
        return (i < 26 || i > 27 || (callback instanceof skd) || callback == null) ? callback : new skd(callback, textView);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    public static final List l(i6a i6aVar, wjc wjcVar) {
        i6aVar.getClass();
        List list = i6aVar.l;
        boolean zIsEmpty = list.isEmpty();
        ?? arrayList = list;
        if (zIsEmpty) {
            arrayList = 0;
        }
        if (arrayList == 0) {
            List<Integer> list2 = i6aVar.m;
            list2.getClass();
            arrayList = new ArrayList(cu1.k0(list2, 10));
            for (Integer num : list2) {
                num.getClass();
                arrayList.add(wjcVar.f(num.intValue()));
            }
        }
        return arrayList;
    }

    public static int l0(byte[] bArr, int i, hmf hmfVar) throws zzgs {
        int iW0 = w0(bArr, i, hmfVar);
        int i2 = hmfVar.a;
        if (i2 < 0) {
            ygf.k("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        if (i2 > bArr.length - iW0) {
            ygf.k("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        if (i2 == 0) {
            hmfVar.c = t3g.b;
            return iW0;
        }
        hmfVar.c = t3g.t(bArr, iW0, i2);
        return iW0 + i2;
    }

    public static Bundle m(int i, Parcel parcel) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        Bundle bundle = parcel.readBundle();
        parcel.setDataPosition(iDataPosition + iP);
        return bundle;
    }

    public static String m0(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length);
        for (byte b2 : bArr) {
            if (b2 == 34) {
                sb.append("\\\"");
            } else if (b2 == 39) {
                sb.append("\\'");
            } else if (b2 != 92) {
                switch (b2) {
                    case 7:
                        sb.append("\\a");
                        break;
                    case 8:
                        sb.append("\\b");
                        break;
                    case 9:
                        sb.append("\\t");
                        break;
                    case 10:
                        sb.append("\\n");
                        break;
                    case 11:
                        sb.append("\\v");
                        break;
                    case 12:
                        sb.append("\\f");
                        break;
                    case 13:
                        sb.append("\\r");
                        break;
                    default:
                        if (b2 < 32 || b2 > 126) {
                            sb.append('\\');
                            sb.append((char) (((b2 >>> 6) & 3) + 48));
                            sb.append((char) (((b2 >>> 3) & 7) + 48));
                            sb.append((char) ((b2 & 7) + 48));
                        } else {
                            sb.append((char) b2);
                        }
                        break;
                }
            } else {
                sb.append("\\\\");
            }
        }
        return sb.toString();
    }

    public static byte[] n(int i, Parcel parcel) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        byte[] bArrCreateByteArray = parcel.createByteArray();
        parcel.setDataPosition(iDataPosition + iP);
        return bArrCreateByteArray;
    }

    public static void n0(Parcel parcel, int i, int i2) {
        int iP = P(i, parcel);
        if (iP == i2) {
            return;
        }
        String hexString = Integer.toHexString(iP);
        int length = String.valueOf(i2).length();
        StringBuilder sb = new StringBuilder(String.valueOf(hexString).length() + length + 19 + String.valueOf(iP).length() + 4 + 1);
        sb.append("Expected size ");
        sb.append(i2);
        sb.append(" got ");
        sb.append(iP);
        throw new SafeParcelReader$ParseException(y30.s(sb, " (0x", hexString, ")"), parcel);
    }

    public static Parcelable o(Parcel parcel, int i, Parcelable.Creator creator) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        Parcelable parcelable = (Parcelable) creator.createFromParcel(parcel);
        parcel.setDataPosition(iDataPosition + iP);
        return parcelable;
    }

    public static byte[] o0(String str) {
        if (str.length() % 2 != 0) {
            ay0.e("Expected a string of even length");
            return null;
        }
        int length = str.length() / 2;
        byte[] bArr = new byte[length];
        for (int i = 0; i < length; i++) {
            int i2 = i * 2;
            int iDigit = Character.digit(str.charAt(i2), 16);
            int iDigit2 = Character.digit(str.charAt(i2 + 1), 16);
            if (iDigit == -1 || iDigit2 == -1) {
                ay0.e("input is not hexadecimal");
                return null;
            }
            bArr[i] = (byte) ((iDigit << 4) + iDigit2);
        }
        return bArr;
    }

    public static String p(int i, Parcel parcel) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        String string = parcel.readString();
        parcel.setDataPosition(iDataPosition + iP);
        return string;
    }

    public static String p0(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (byte b2 : bArr) {
            int i = b2 & 255;
            sb.append("0123456789abcdef".charAt(i / 16));
            sb.append("0123456789abcdef".charAt(i % 16));
        }
        return sb.toString();
    }

    public static ArrayList q(int i, Parcel parcel) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
        parcel.setDataPosition(iDataPosition + iP);
        return arrayListCreateStringArrayList;
    }

    public static int q0(int i, byte[] bArr) {
        int i2 = bArr[i] & 255;
        int i3 = bArr[i + 1] & 255;
        int i4 = bArr[i + 2] & 255;
        return ((bArr[i + 3] & 255) << 24) | (i3 << 8) | i2 | (i4 << 16);
    }

    public static Object[] r(Parcel parcel, int i, Parcelable.Creator creator) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        Object[] objArrCreateTypedArray = parcel.createTypedArray(creator);
        parcel.setDataPosition(iDataPosition + iP);
        return objArrCreateTypedArray;
    }

    public static ArrayList s(Parcel parcel, int i, Parcelable.Creator creator) {
        int iP = P(i, parcel);
        int iDataPosition = parcel.dataPosition();
        if (iP == 0) {
            return null;
        }
        ArrayList arrayListCreateTypedArrayList = parcel.createTypedArrayList(creator);
        parcel.setDataPosition(iDataPosition + iP);
        return arrayListCreateTypedArrayList;
    }

    public static int s0(d8g d8gVar, int i, byte[] bArr, int i2, int i3, q5g q5gVar, hmf hmfVar) throws zzgs {
        h5g h5gVarG = d8gVar.g();
        d8g d8gVar2 = d8gVar;
        byte[] bArr2 = bArr;
        int i4 = i3;
        hmf hmfVar2 = hmfVar;
        int iB0 = B0(h5gVarG, d8gVar2, bArr2, i2, i4, hmfVar2);
        d8gVar2.b(h5gVarG);
        hmfVar2.c = h5gVarG;
        q5gVar.add(h5gVarG);
        while (iB0 < i4) {
            hmf hmfVar3 = hmfVar2;
            int i5 = i4;
            int iW0 = w0(bArr2, iB0, hmfVar3);
            if (i != hmfVar3.a) {
                break;
            }
            byte[] bArr3 = bArr2;
            d8g d8gVar3 = d8gVar2;
            h5g h5gVarG2 = d8gVar3.g();
            iB0 = B0(h5gVarG2, d8gVar3, bArr3, iW0, i5, hmfVar3);
            d8gVar2 = d8gVar3;
            bArr2 = bArr3;
            i4 = i5;
            hmfVar2 = hmfVar3;
            d8gVar2.b(h5gVarG2);
            hmfVar2.c = h5gVarG2;
            q5gVar.add(h5gVarG2);
        }
        return iB0;
    }

    public static void t(int i, Parcel parcel) {
        if (parcel.dataPosition() != i) {
            throw new SafeParcelReader$ParseException(b09.A(new StringBuilder(String.valueOf(i).length() + 26), i, "Overread allowed size end="), parcel);
        }
    }

    public static int t0(byte[] bArr, int i, q5g q5gVar, hmf hmfVar) throws zzgs {
        j5g j5gVar = (j5g) q5gVar;
        int iW0 = w0(bArr, i, hmfVar);
        int i2 = hmfVar.a;
        if (i2 < 0) {
            ygf.k("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        if (i2 > bArr.length - iW0) {
            ygf.k("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        int i3 = i2 + iW0;
        while (iW0 < i3) {
            iW0 = w0(bArr, iW0, hmfVar);
            j5gVar.m(hmfVar.a);
        }
        if (iW0 == i3) {
            return iW0;
        }
        ygf.k("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        return 0;
    }

    public static boolean u(Type type, Type type2) {
        if (type == type2) {
            return true;
        }
        if (type instanceof Class) {
            return type2 instanceof GenericArrayType ? u(((Class) type).getComponentType(), ((GenericArrayType) type2).getGenericComponentType()) : type.equals(type2);
        }
        if (type instanceof ParameterizedType) {
            if (!(type2 instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType parameterizedType = (ParameterizedType) type;
            ParameterizedType parameterizedType2 = (ParameterizedType) type2;
            return u(parameterizedType.getOwnerType(), parameterizedType2.getOwnerType()) && parameterizedType.getRawType().equals(parameterizedType2.getRawType()) && Arrays.equals(parameterizedType instanceof woe ? ((woe) parameterizedType).c : parameterizedType.getActualTypeArguments(), parameterizedType2 instanceof woe ? ((woe) parameterizedType2).c : parameterizedType2.getActualTypeArguments());
        }
        if (type instanceof GenericArrayType) {
            if (type2 instanceof Class) {
                return u(((Class) type2).getComponentType(), ((GenericArrayType) type).getGenericComponentType());
            }
            if (type2 instanceof GenericArrayType) {
                return u(((GenericArrayType) type).getGenericComponentType(), ((GenericArrayType) type2).getGenericComponentType());
            }
            return false;
        }
        if (type instanceof WildcardType) {
            if (!(type2 instanceof WildcardType)) {
                return false;
            }
            WildcardType wildcardType = (WildcardType) type;
            WildcardType wildcardType2 = (WildcardType) type2;
            return Arrays.equals(wildcardType.getUpperBounds(), wildcardType2.getUpperBounds()) && Arrays.equals(wildcardType.getLowerBounds(), wildcardType2.getLowerBounds());
        }
        if (!(type instanceof TypeVariable) || !(type2 instanceof TypeVariable)) {
            return false;
        }
        TypeVariable typeVariable = (TypeVariable) type;
        TypeVariable typeVariable2 = (TypeVariable) type2;
        return typeVariable.getGenericDeclaration() == typeVariable2.getGenericDeclaration() && typeVariable.getName().equals(typeVariable2.getName());
    }

    public static int u0(byte[] bArr, int i, hmf hmfVar) throws zzgs {
        int iW0 = w0(bArr, i, hmfVar);
        int i2 = hmfVar.a;
        if (i2 < 0) {
            ygf.k("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        if (i2 == 0) {
            hmfVar.c = "";
            return iW0;
        }
        int i3 = w9g.a;
        int length = bArr.length;
        if ((((length - iW0) - i2) | iW0 | i2) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(length), Integer.valueOf(iW0), Integer.valueOf(i2)));
        }
        int i4 = iW0 + i2;
        char[] cArr = new char[i2];
        int i5 = 0;
        while (iW0 < i4) {
            byte b2 = bArr[iW0];
            if (b2 < 0) {
                break;
            }
            iW0++;
            cArr[i5] = (char) b2;
            i5++;
        }
        while (iW0 < i4) {
            int i6 = iW0 + 1;
            byte b3 = bArr[iW0];
            if (b3 >= 0) {
                cArr[i5] = (char) b3;
                i5++;
                iW0 = i6;
                while (iW0 < i4) {
                    byte b4 = bArr[iW0];
                    if (b4 >= 0) {
                        iW0++;
                        cArr[i5] = (char) b4;
                        i5++;
                    }
                }
            } else if (b3 < -32) {
                if (i6 >= i4) {
                    ygf.k("Protocol message had invalid UTF-8.");
                    return 0;
                }
                int i7 = i5 + 1;
                iW0 += 2;
                byte b5 = bArr[i6];
                if (b3 < -62 || kp7.G(b5)) {
                    ygf.k("Protocol message had invalid UTF-8.");
                    return 0;
                }
                cArr[i5] = (char) ((b5 & 63) | ((b3 & 31) << 6));
                i5 = i7;
            } else {
                if (b3 < -16) {
                    if (i6 >= i4 - 1) {
                        ygf.k("Protocol message had invalid UTF-8.");
                        return 0;
                    }
                    int i8 = i5 + 1;
                    int i9 = iW0 + 2;
                    byte b6 = bArr[i6];
                    iW0 += 3;
                    byte b7 = bArr[i9];
                    if (!kp7.G(b6)) {
                        if (b3 == -32) {
                            if (b6 >= -96) {
                                b3 = -32;
                            }
                        }
                        if (b3 == -19) {
                            if (b6 < -96) {
                                b3 = -19;
                            }
                        }
                        if (!kp7.G(b7)) {
                            cArr[i5] = (char) (((b6 & 63) << 6) | ((b3 & 15) << 12) | (b7 & 63));
                            i5 = i8;
                        }
                    }
                    ygf.k("Protocol message had invalid UTF-8.");
                    return 0;
                }
                if (i6 >= i4 - 2) {
                    ygf.k("Protocol message had invalid UTF-8.");
                    return 0;
                }
                byte b8 = bArr[i6];
                int i10 = iW0 + 3;
                byte b9 = bArr[iW0 + 2];
                iW0 += 4;
                byte b10 = bArr[i10];
                if (kp7.G(b8) || (((b8 + 112) + (b3 << 28)) >> 30) != 0 || kp7.G(b9) || kp7.G(b10)) {
                    ygf.k("Protocol message had invalid UTF-8.");
                    return 0;
                }
                int i11 = ((b8 & 63) << 12) | ((b3 & 7) << 18) | ((b9 & 63) << 6) | (b10 & 63);
                cArr[i5] = (char) ((i11 >>> 10) + 55232);
                cArr[i5 + 1] = (char) ((i11 & 1023) + 56320);
                i5 += 2;
            }
        }
        hmfVar.c = new String(cArr, 0, i5);
        return i4;
    }

    public static final s6a v(u6a u6aVar, wjc wjcVar) {
        int i = u6aVar.c;
        if ((i & 16) == 16) {
            s6a s6aVar = u6aVar.i;
            s6aVar.getClass();
            return s6aVar;
        }
        if ((i & 32) == 32) {
            return wjcVar.f(u6aVar.j);
        }
        ygf.f("No expandedType in ProtoBuf.TypeAlias");
        return null;
    }

    public static int v0(int i, byte[] bArr, int i2, int i3, c9g c9gVar, hmf hmfVar) throws zzgs {
        if ((i >>> 3) == 0) {
            ygf.k("Protocol message contained an invalid tag (zero).");
            return 0;
        }
        int i4 = i & 7;
        if (i4 == 0) {
            int iZ0 = z0(bArr, i2, hmfVar);
            c9gVar.c(i, Long.valueOf(hmfVar.b));
            return iZ0;
        }
        if (i4 == 1) {
            c9gVar.c(i, Long.valueOf(D0(i2, bArr)));
            return i2 + 8;
        }
        if (i4 == 2) {
            int iW0 = w0(bArr, i2, hmfVar);
            int i5 = hmfVar.a;
            if (i5 < 0) {
                ygf.k("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                return 0;
            }
            if (i5 > bArr.length - iW0) {
                ygf.k("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                return 0;
            }
            if (i5 == 0) {
                c9gVar.c(i, t3g.b);
            } else {
                c9gVar.c(i, t3g.t(bArr, iW0, i5));
            }
            return iW0 + i5;
        }
        if (i4 != 3) {
            if (i4 == 5) {
                c9gVar.c(i, Integer.valueOf(q0(i2, bArr)));
                return i2 + 4;
            }
            ygf.k("Protocol message contained an invalid tag (zero).");
            return 0;
        }
        int i6 = (i & (-8)) | 4;
        c9g c9gVarB = c9g.b();
        int i7 = hmfVar.d + 1;
        hmfVar.d = i7;
        E0(i7);
        int i8 = 0;
        while (true) {
            if (i2 >= i3) {
                break;
            }
            int iW02 = w0(bArr, i2, hmfVar);
            int i9 = hmfVar.a;
            if (i9 == i6) {
                i8 = i9;
                i2 = iW02;
                break;
            }
            i2 = v0(i9, bArr, iW02, i3, c9gVarB, hmfVar);
            i8 = i9;
        }
        hmfVar.d--;
        if (i2 > i3 || i8 != i6) {
            ygf.k("Failed to parse the message.");
            return 0;
        }
        c9gVar.c(i, c9gVarB);
        return i2;
    }

    public static final f0b w(Annotation[] annotationArr, y05 y05Var) {
        Annotation annotation;
        annotationArr.getClass();
        y05Var.getClass();
        int length = annotationArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                annotation = null;
                break;
            }
            annotation = annotationArr[i];
            if (g76.L(e0b.a(vx0.T(vx0.P(annotation))).a(), y05Var)) {
                break;
            }
            i++;
        }
        if (annotation != null) {
            return new f0b(annotation);
        }
        return null;
    }

    public static int w0(byte[] bArr, int i, hmf hmfVar) {
        int i2 = i + 1;
        byte b2 = bArr[i];
        if (b2 < 0) {
            return x0(b2, bArr, i2, hmfVar);
        }
        hmfVar.a = b2;
        return i2;
    }

    public static View x(View view, int i) {
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            View viewFindViewById = viewGroup.getChildAt(i2).findViewById(i);
            if (viewFindViewById != null) {
                return viewFindViewById;
            }
        }
        return null;
    }

    public static int x0(int i, byte[] bArr, int i2, hmf hmfVar) {
        byte b2 = bArr[i2];
        int i3 = i2 + 1;
        int i4 = i & 127;
        if (b2 >= 0) {
            hmfVar.a = i4 | (b2 << 7);
            return i3;
        }
        int i5 = i4 | ((b2 & 127) << 7);
        int i6 = i2 + 2;
        byte b3 = bArr[i3];
        if (b3 >= 0) {
            hmfVar.a = i5 | (b3 << 14);
            return i6;
        }
        int i7 = i5 | ((b3 & 127) << 14);
        int i8 = i2 + 3;
        byte b4 = bArr[i6];
        if (b4 >= 0) {
            hmfVar.a = i7 | (b4 << 21);
            return i8;
        }
        int i9 = i7 | ((b4 & 127) << 21);
        int i10 = i2 + 4;
        byte b5 = bArr[i8];
        if (b5 >= 0) {
            hmfVar.a = i9 | (b5 << 28);
            return i10;
        }
        int i11 = i9 | ((b5 & 127) << 28);
        while (true) {
            int i12 = i10 + 1;
            if (bArr[i10] >= 0) {
                hmfVar.a = i11;
                return i12;
            }
            i10 = i12;
        }
    }

    public static final ArrayList y(Annotation[] annotationArr) {
        annotationArr.getClass();
        ArrayList arrayList = new ArrayList(annotationArr.length);
        for (Annotation annotation : annotationArr) {
            arrayList.add(new f0b(annotation));
        }
        return arrayList;
    }

    public static int y0(int i, byte[] bArr, int i2, int i3, q5g q5gVar, hmf hmfVar) {
        j5g j5gVar = (j5g) q5gVar;
        int iW0 = w0(bArr, i2, hmfVar);
        j5gVar.m(hmfVar.a);
        while (iW0 < i3) {
            int iW02 = w0(bArr, iW0, hmfVar);
            if (i != hmfVar.a) {
                break;
            }
            iW0 = w0(bArr, iW02, hmfVar);
            j5gVar.m(hmfVar.a);
        }
        return iW0;
    }

    public static final mn1 z(p98 p98Var, int i) {
        p98Var.getClass();
        return kng.y(p98Var.a(i), p98Var.b(i));
    }

    public static int z0(byte[] bArr, int i, hmf hmfVar) {
        long j = bArr[i];
        int i2 = i + 1;
        if (j >= 0) {
            hmfVar.b = j;
            return i2;
        }
        int i3 = i + 2;
        byte b2 = bArr[i2];
        long j2 = (j & 127) | (((long) (b2 & 127)) << 7);
        int i4 = 7;
        while (b2 < 0) {
            int i5 = i3 + 1;
            byte b3 = bArr[i3];
            i4 += 7;
            j2 |= ((long) (b3 & 127)) << i4;
            b2 = b3;
            i3 = i5;
        }
        hmfVar.b = j2;
        return i3;
    }

    public void b0(jn8 jn8Var) {
        try {
            c0(jn8Var);
        } catch (NullPointerException e) {
            throw e;
        } catch (Throwable th) {
            pwd.c0(th);
            ok7.H(th);
            NullPointerException nullPointerException = new NullPointerException("Actually not, but can't throw other exceptions due to RS");
            nullPointerException.initCause(th);
            throw nullPointerException;
        }
    }

    public abstract void c0(jn8 jn8Var);

    public static void r0(Parcel parcel, int i, int i2) {
        if (i == i2) {
            return;
        }
        String hexString = Integer.toHexString(i);
        int length = String.valueOf(i2).length();
        StringBuilder sb = new StringBuilder(String.valueOf(hexString).length() + length + 19 + String.valueOf(i).length() + 4 + 1);
        sb.append("Expected size ");
        sb.append(i2);
        sb.append(" got ");
        sb.append(i);
        throw new SafeParcelReader$ParseException(y30.s(sb, " (0x", hexString, OphtYB.svqbfFTkfybW), parcel);
    }
}
