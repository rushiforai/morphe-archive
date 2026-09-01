package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.Editable;
import com.adobe.internal.xmp.XMPException;
import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.common.post.text.ParagraphEditText;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.proto.model.MarkupModel;
import com.medium.reader.R;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import kotlinx.coroutines.DispatchException;
import kotlinx.coroutines.TimeoutCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class mo7 {
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public final /* synthetic */ int a;

    public /* synthetic */ mo7(boolean z) {
        this.a = 21;
    }

    public static final void A(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1536879607);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28Var2 = o28Var;
            kjd.b("Upsell", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(kt7.c)).l, p65Var, 6, 0, 65534);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(r28Var2, 24.0f));
            p65Var.Y(1483892597);
            for (yn7 yn7Var : yn7.getEntries()) {
                b(yn7Var, pxf.E(-397399691, new go7(yn7Var, 0), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 15);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x03c2  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x036b  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x036d  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0375  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x037d  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x03bc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void B(defpackage.tve r41, final defpackage.lo9 r42, defpackage.r28 r43, defpackage.x12 r44, final int r45) {
        /*
            Method dump skipped, instruction units count: 1127
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.B(tve, lo9, r28, x12, int):void");
    }

    public static void C(y9f y9fVar, String str, String str2) {
        y9f y9fVar2 = new y9f("[]", str2, null);
        y9f y9fVar3 = new y9f("xml:lang", str, null);
        y9fVar2.c(y9fVar3);
        if ("x-default".equals(y9fVar3.b)) {
            y9fVar.b(y9fVar2);
        } else {
            y9fVar.a(y9fVar2);
        }
    }

    public static final List D(ParagraphEditText paragraphEditText) {
        Integer num;
        paragraphEditText.getClass();
        Editable text = paragraphEditText.getText();
        if (text == null) {
            return ey3.a;
        }
        Object[] spans = text.getSpans(0, text.length(), ni7.class);
        spans.getClass();
        ArrayList arrayList = new ArrayList(spans.length);
        for (Object obj : spans) {
            ni7 ni7Var = (ni7) obj;
            ni7Var.getClass();
            int spanStart = text.getSpanStart(ni7Var);
            int spanEnd = text.getSpanEnd(ni7Var);
            MarkupModel markupModelB = ni7Var.b();
            Integer num2 = markupModelB.start;
            if (num2 == null || num2.intValue() != spanStart || (num = markupModelB.end) == null || num.intValue() != spanEnd) {
                markupModelB = MarkupModel.copy$default(markupModelB, null, Integer.valueOf(spanStart), Integer.valueOf(spanEnd), null, null, null, null, null, null, null, null, null, 4089, null);
            }
            arrayList.add(markupModelB);
        }
        return arrayList;
    }

    public static final int E(long[] jArr, long j) {
        int length = jArr.length - 1;
        int i = 0;
        while (i <= length) {
            int i2 = (i + length) >>> 1;
            long j2 = jArr[i2];
            if (j > j2) {
                i = i2 + 1;
            } else {
                if (j >= j2) {
                    return i2;
                }
                length = i2 - 1;
            }
        }
        return -(i + 1);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.h1b F(java.lang.Class r15) {
        /*
            Method dump skipped, instruction units count: 214
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.F(java.lang.Class):h1b");
    }

    public static void G(y9f y9fVar) {
        y9f y9fVar2 = y9fVar.c;
        if (y9fVar.j().c(32)) {
            y9fVar2.r(y9fVar);
        } else {
            ((ArrayList) y9fVar2.h()).remove(y9fVar);
            if (y9fVar2.d.isEmpty()) {
                y9fVar2.d = null;
            }
        }
        if (y9fVar2.n() || !y9fVar2.j().c(Integer.MIN_VALUE)) {
            return;
        }
        y9f y9fVar3 = y9fVar2.c;
        ((ArrayList) y9fVar3.h()).remove(y9fVar2);
        if (y9fVar3.d.isEmpty()) {
            y9fVar3.d = null;
        }
    }

    public static qnb H(byte[] bArr, Parcelable.Creator creator) {
        vp7.p(creator);
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.unmarshall(bArr, 0, bArr.length);
        parcelObtain.setDataPosition(0);
        qnb qnbVar = (qnb) creator.createFromParcel(parcelObtain);
        parcelObtain.recycle();
        return qnbVar;
    }

    public static y9f I(y9f y9fVar, String str, boolean z) throws XMPException {
        if (!y9fVar.j().c(Integer.MIN_VALUE) && !y9fVar.j().c(256)) {
            if (!y9fVar.g) {
                ywb.e(102, "Named children only allowed for schemas and structs");
                return null;
            }
            if (y9fVar.j().c(512)) {
                ywb.e(102, "Named children not allowed for arrays");
                return null;
            }
            if (z) {
                y9fVar.j().g(true);
            }
        }
        y9f y9fVarF = y9f.f(str, y9fVar.h());
        if (y9fVarF != null || !z) {
            return y9fVarF;
        }
        y9f y9fVar2 = new y9f(str, null, new t4a());
        y9fVar2.g = true;
        y9fVar.a(y9fVar2);
        return y9fVar2;
    }

    public static y9f J(y9f y9fVar, ru ruVar, boolean z, t4a t4aVar) throws XMPException {
        y9f y9fVar2;
        ArrayList arrayList = ruVar.b;
        if (arrayList.size() == 0) {
            ywb.e(102, "Empty XMPPath");
            return null;
        }
        y9f y9fVarM = M(y9fVar, ruVar.h(0).a, null, z);
        if (y9fVarM != null) {
            if (y9fVarM.g) {
                y9fVarM.g = false;
                y9fVar2 = y9fVarM;
            } else {
                y9fVar2 = null;
            }
            for (int i = 1; i < arrayList.size(); i++) {
                try {
                    y9fVarM = N(y9fVarM, ruVar.h(i), z);
                    if (y9fVarM != null) {
                        if (y9fVarM.g) {
                            y9fVarM.g = false;
                            if (i == 1 && ruVar.h(i).c && ruVar.h(i).d != 0) {
                                y9fVarM.j().e(ruVar.h(i).d, true);
                            } else if (i < arrayList.size() - 1 && ruVar.h(i).b == 1 && !y9fVarM.j().f()) {
                                y9fVarM.j().g(true);
                            }
                            if (y9fVar2 == null) {
                                y9fVar2 = y9fVarM;
                            }
                        }
                    } else if (z) {
                        G(y9fVar2);
                        return null;
                    }
                } catch (XMPException e) {
                    if (y9fVar2 != null) {
                        G(y9fVar2);
                    }
                    throw e;
                }
            }
            if (y9fVar2 != null) {
                t4a t4aVarJ = y9fVarM.j();
                if (t4aVar != null) {
                    int i2 = t4aVarJ.a | t4aVar.a;
                    t4aVarJ.b(i2);
                    t4aVarJ.a = i2;
                } else {
                    t4aVarJ.getClass();
                }
                y9fVarM.f = y9fVarM.j();
            }
            return y9fVarM;
        }
        return null;
    }

    public static final int K(CharSequence charSequence, int i) {
        int length = charSequence.length();
        while (i < length) {
            if (charSequence.charAt(i) == '\n') {
                return i;
            }
            i++;
        }
        return charSequence.length();
    }

    public static final int L(CharSequence charSequence, int i) {
        while (i > 0) {
            if (charSequence.charAt(i - 1) == '\n') {
                return i;
            }
            i--;
        }
        return 0;
    }

    public static y9f M(y9f y9fVar, String str, String str2, boolean z) throws XMPException {
        y9f y9fVarF = y9f.f(str, y9fVar.h());
        if (y9fVarF != null || !z) {
            return y9fVarF;
        }
        t4a t4aVar = new t4a();
        t4aVar.e(Integer.MIN_VALUE, true);
        y9f y9fVar2 = new y9f(str, null, t4aVar);
        y9fVar2.g = true;
        o2b o2bVar = v9f.a;
        String strL = o2bVar.l(str);
        if (strL == null) {
            if (str2 == null || str2.length() == 0) {
                ywb.e(101, "Unregistered schema namespace URI");
                return null;
            }
            strL = o2bVar.E(str, str2);
        }
        y9fVar2.b = strL;
        y9fVar.a(y9fVar2);
        return y9fVar2;
    }

    public static SharedPreferences O(Context context) {
        Context applicationContext = context.getApplicationContext();
        if (applicationContext != null) {
            context = applicationContext;
        }
        return context.getSharedPreferences("com.google.firebase.messaging", 0);
    }

    public static final cn P(x0 x0Var, wx6 wx6Var) {
        if (((ky6) wx6Var).d.compareTo(vx6.DESTROYED) <= 0) {
            rd6.j("Cannot configure ", x0Var, " to disposeComposition at Lifecycle ON_DESTROY: ", wx6Var, "is already destroyed");
            return null;
        }
        di4 di4Var = new di4(6, x0Var);
        wx6Var.a(di4Var);
        return new cn(wx6Var, 24, di4Var);
    }

    public static final void Q(Runnable runnable, Throwable th, f66 f66Var) {
        f66Var.getClass();
        if (th == null && (runnable instanceof Future) && ((Future) runnable).isDone()) {
            try {
                try {
                    ((Future) runnable).get();
                } catch (SecurityException e) {
                    f49.K(f66Var, d66.ERROR, e66.MAINTAINER, b18.l, e, false, 48);
                }
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            } catch (CancellationException e2) {
                th = e2;
            } catch (ExecutionException e3) {
                th = e3.getCause();
            }
        }
        Throwable th2 = th;
        if (th2 != null) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), b18.m, th2, 48);
        }
    }

    public static int R(y9f y9fVar, String str) throws XMPException {
        if (!y9fVar.j().c(512)) {
            ywb.e(102, "Language item must be used on array");
            return 0;
        }
        for (int i = 1; i <= y9fVar.i(); i++) {
            y9f y9fVarG = y9fVar.g(i);
            if (y9fVarG.o() && "xml:lang".equals(y9fVarG.k(1).a) && str.equals(y9fVarG.k(1).b)) {
                return i;
            }
        }
        return -1;
    }

    public static void S(y9f y9fVar) {
        if (y9fVar.j().c(4096)) {
            for (int i = 2; i <= y9fVar.i(); i++) {
                y9f y9fVarG = y9fVar.g(i);
                if (y9fVarG.o() && "x-default".equals(y9fVarG.k(1).b)) {
                    try {
                        ((ArrayList) y9fVar.h()).remove(i - 1);
                        if (y9fVar.d.isEmpty()) {
                            y9fVar.d = null;
                        }
                        y9fVar.b(y9fVarG);
                    } catch (XMPException unused) {
                    }
                    if (i == 2) {
                        y9fVar.g(2).b = y9fVarG.b;
                        return;
                    }
                    return;
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void T(q28 q28Var, m45 m45Var) {
        mn8 mn8Var = q28Var.g;
        if (mn8Var == null) {
            mn8Var = new mn8((ln8) q28Var);
            q28Var.g = mn8Var;
        }
        px8 snapshotObserver = ((mn) flb.w0(q28Var)).getSnapshotObserver();
        snapshotObserver.a.d(mn8Var, zu2.z, m45Var);
    }

    public static final Object U(frb frbVar, boolean z, Object obj, b55 b55Var) throws Throwable {
        Object cy1Var;
        Object objW;
        try {
            if (b55Var instanceof kn0) {
                pwd.B(2, b55Var);
                cy1Var = b55Var.invoke(obj, frbVar);
            } else {
                cy1Var = pwd.f0(b55Var, obj, frbVar);
            }
        } catch (DispatchException e) {
            Throwable th = e.a;
            frbVar.V(new cy1(th, false));
            throw th;
        } catch (Throwable th2) {
            cy1Var = new cy1(th2, false);
        }
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        if (cy1Var == tb2Var || (objW = frbVar.W(cy1Var)) == o7f.j) {
            return tb2Var;
        }
        frbVar.l0();
        if (!(objW instanceof cy1)) {
            return o7f.K(objW);
        }
        if (!z) {
            Throwable th3 = ((cy1) objW).a;
            if ((th3 instanceof TimeoutCancellationException) && ((TimeoutCancellationException) th3).a == frbVar) {
                if (cy1Var instanceof cy1) {
                    throw ((cy1) cy1Var).a;
                }
                return cy1Var;
            }
        }
        throw ((cy1) objW).a;
    }

    public static String V(String str) {
        if (str.toLowerCase(Locale.US).startsWith("android-keystore://")) {
            return str.substring(19);
        }
        ay0.e("key URI must start with android-keystore://");
        return null;
    }

    public static void W(int i) throws InvalidAlgorithmParameterException {
        if (i != 16 && i != 32) {
            throw new InvalidAlgorithmParameterException(String.format("invalid key size %d; only 128-bit and 256-bit AES keys are supported", Integer.valueOf(i << 3)));
        }
    }

    public static int X(String str) {
        int length = str.length();
        int i = 0;
        int i2 = 0;
        while (i2 < length && str.charAt(i2) < 128) {
            i2++;
        }
        int i3 = length;
        while (true) {
            if (i2 >= length) {
                break;
            }
            char cCharAt = str.charAt(i2);
            if (cCharAt < 2048) {
                i3 += (127 - cCharAt) >>> 31;
                i2++;
            } else {
                try {
                    int i4 = lpf.a;
                    int length2 = str.length();
                    while (i2 < length2) {
                        char cCharAt2 = str.charAt(i2);
                        if (cCharAt2 < 2048) {
                            i += (127 - cCharAt2) >>> 31;
                        } else {
                            i += 2;
                            if (cCharAt2 >= 55296 && cCharAt2 <= 57343) {
                                if (Character.codePointAt(str, i2) < 65536) {
                                    throw new jpf(hmf.a(length2, i2, (byte) 32, "Unpaired surrogate at index ", " of "));
                                }
                                i2++;
                            }
                        }
                        i2++;
                    }
                    i3 += i;
                } catch (jpf unused) {
                    return str.getBytes(StandardCharsets.UTF_8).length;
                }
            }
        }
        if (i3 >= length) {
            return i3;
        }
        long j = ((long) i3) + 4294967296L;
        StringBuilder sb = new StringBuilder(String.valueOf(j).length() + 34);
        sb.append("UTF-8 length does not fit in int: ");
        sb.append(j);
        throw new IllegalArgumentException(sb.toString());
    }

    public static final void a(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2094796922);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            c(null, p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, 48.0f));
            f(null, p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, 48.0f));
            A(null, p65Var, 0);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 16);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:126:0x0442  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0444  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x044c A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0451  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0263  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.ove r30, defpackage.lo9 r31, defpackage.veb r32, defpackage.r28 r33, defpackage.x12 r34, int r35) {
        /*
            Method dump skipped, instruction units count: 1191
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.d(ove, lo9, veb, r28, x12, int):void");
    }

    public static final void e(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-162073797);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            hp7.t(p65Var, jfc.e(o28Var, 24.0f));
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 28);
        }
    }

    public static final void f(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-770416086);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28Var2 = o28Var;
            kjd.b("Error", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(kt7.c)).l, p65Var, 6, 0, 65534);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(r28Var2, 24.0f));
            p65Var.Y(889227407);
            for (yn7 yn7Var : yn7.getEntries()) {
                b(yn7Var, pxf.E(-1426395330, new go7(yn7Var, 4), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(889234513);
            for (yn7 yn7Var2 : yn7.getEntries()) {
                b(yn7Var2, pxf.E(-1217514969, new go7(yn7Var2, 5), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(889241677);
            for (yn7 yn7Var3 : yn7.getEntries()) {
                b(yn7Var3, pxf.E(-1879104442, new go7(yn7Var3, 6), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 14);
        }
    }

    public static final void g(rve rveVar, lo9 lo9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(776602083);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.f(rveVar) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(lo9Var) : p65Var.h(lo9Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        boolean z = false;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            b24 b24Var = rveVar.b;
            if ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var.h(lo9Var))) {
                z = true;
            }
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                qv7 qv7Var = new qv7(0, lo9Var, lo9.class, "refresh", "refresh()V", 0, 27);
                p65Var.j0(qv7Var);
                objM = qv7Var;
            }
            iq7.a(b24Var, w2g.E(new dr5(z46.q), 16.0f, 0.0f, 2), null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
            hp7.t(p65Var, jfc.e(o28Var, 64.0f));
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 12, rveVar, lo9Var, r28Var2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:77:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x02a6  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x02ae  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x02b7  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x02e5 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x02f6  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0302  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x030f  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0337  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(defpackage.tve r47, final defpackage.lo9 r48, defpackage.r28 r49, defpackage.x12 r50, int r51) {
        /*
            Method dump skipped, instruction units count: 921
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.h(tve, lo9, r28, x12, int):void");
    }

    public static final void i(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-229683862);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarV = m40.V(o28Var, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarV);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(2139656654);
            for (int i6 = 0; i6 < 8; i6++) {
                gp7.d(0, 1, p65Var, null);
                tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            }
            p65Var.p(false);
            hp7.t(p65Var, jfc.e(o28Var, 64.0f));
            b09.H(p65Var, true, true, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 29);
        }
    }

    public static final void j(ba8 ba8Var, nob nobVar, mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(233973821);
        if ((((p65Var.h(ba8Var) ? 4 : 2) | i | (p65Var.h(nobVar) ? 32 : 16)) & 147) == 146 && p65Var.B()) {
            p65Var.S();
        } else {
            k40.d(new o10[]{e67.a.a(ba8Var), y57.a.a(ba8Var), d67.a.a(ba8Var)}, pxf.E(1808964477, new kd(nobVar, 7, mz1Var), p65Var), p65Var, 56);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 15, ba8Var, nobVar, mz1Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k(defpackage.m45 r20, java.lang.String r21, defpackage.yn7 r22, defpackage.r28 r23, boolean r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 269
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.k(m45, java.lang.String, yn7, r28, boolean, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.m45 r22, java.lang.String r23, defpackage.yn7 r24, defpackage.r28 r25, defpackage.ay2 r26, boolean r27, defpackage.x12 r28, int r29, int r30) {
        /*
            Method dump skipped, instruction units count: 404
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.l(m45, java.lang.String, yn7, r28, ay2, boolean, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:76:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m(int r22, int r23, defpackage.x12 r24, defpackage.ay2 r25, defpackage.m45 r26, defpackage.yn7 r27, defpackage.r28 r28, java.lang.String r29, boolean r30, boolean r31) {
        /*
            Method dump skipped, instruction units count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.m(int, int, x12, ay2, m45, yn7, r28, java.lang.String, boolean, boolean):void");
    }

    public static final void n(m45 m45Var, String str, yn7 yn7Var, r28 r28Var, boolean z, x12 x12Var, int i) {
        int i2;
        String str2;
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        yn7Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1224555709);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var2.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.d(yn7Var.ordinal()) ? 256 : 128;
        }
        int i3 = i2 | 3072;
        if ((i & 24576) == 0) {
            i3 |= p65Var2.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            float f = i11.a;
            sn3 sn3Var = kt7.b;
            long j = ((zo7) p65Var2.j(sn3Var)).k;
            long j2 = uu1.d;
            p65Var = p65Var2;
            o28 o28Var = o28.b;
            q(m45Var, str2, yn7Var, i11.a(j, j2, uu1.b(0.5f, ((zo7) p65Var2.j(sn3Var)).k), j2, p65Var, 3120, 0), z, o28Var, p65Var, (58366 & i3) | ((i3 << 6) & 458752));
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jo7(m45Var, str, yn7Var, r28Var2, z, i, 0);
        }
    }

    public static final void o(m45 m45Var, String str, yn7 yn7Var, r28 r28Var, boolean z, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        String str2;
        r28 r28Var2;
        long jB;
        m45Var.getClass();
        yn7Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2138183421);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.d(yn7Var.ordinal()) ? 256 : 128;
        }
        int i3 = i2 | 3072;
        if ((i & 24576) == 0) {
            i3 |= p65Var.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            float f = i11.a;
            long j = uu1.g;
            sn3 sn3Var = kt7.b;
            ay2 ay2VarA = i11.a(j, ((zo7) p65Var.j(sn3Var)).u, j, uu1.b(0.5f, ((zo7) p65Var.j(sn3Var)).u), p65Var, 390, 0);
            if (z) {
                p65Var.Y(38399010);
                jB = ((zo7) p65Var.j(sn3Var)).D;
                p65Var.p(false);
            } else {
                p65Var.Y(38466931);
                jB = uu1.b(0.5f, ((zo7) p65Var.j(sn3Var)).D);
                p65Var.p(false);
            }
            int i4 = (i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION) | ((i3 << 3) & 458752) | ((i3 << 9) & 3670016);
            o28 o28Var = o28.b;
            r(m45Var2, str2, yn7Var, ay2VarA, jB, z, o28Var, p65Var, i4);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jo7(m45Var, str, yn7Var, r28Var2, z, i, 1);
        }
    }

    public static final void p(m45 m45Var, String str, yn7 yn7Var, r28 r28Var, boolean z, x12 x12Var, int i) {
        int i2;
        String str2;
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        yn7Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1005274574);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var2.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.d(yn7Var.ordinal()) ? 256 : 128;
        }
        int i3 = i2 | 3072;
        if ((i & 24576) == 0) {
            i3 |= p65Var2.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            float f = i11.a;
            long j = uu1.g;
            sn3 sn3Var = kt7.b;
            ay2 ay2VarA = i11.a(j, ((zo7) p65Var2.j(sn3Var)).u, j, uu1.b(0.5f, ((zo7) p65Var2.j(sn3Var)).u), p65Var2, 390, 0);
            o28 o28Var = o28.b;
            s((58366 & i3) | ((i3 << 6) & 458752), 64, p65Var2, ay2VarA, m45Var, yn7Var, o28Var, str2, z, false);
            p65Var = p65Var2;
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jo7(m45Var, str, yn7Var, r28Var2, z, i, 2);
        }
    }

    public static final void q(m45 m45Var, String str, yn7 yn7Var, ay2 ay2Var, boolean z, r28 r28Var, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        yn7 yn7Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-248979509);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.d(yn7Var.ordinal()) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(ay2Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i3 = 0;
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            int i4 = i2;
            yn7Var2 = yn7Var;
            g76.f(m45Var2, jfc.b(r28Var, 0.0f, 24.0f, 1), z, null, bmb.a(yn7Var.m181getCornerSizeD9Ej5fM()), null, ay2Var, yn7Var.getContentPadding(), pxf.E(2117986235, new io7(yn7Var2, ay2Var.a(z, p65Var), str, i3), p65Var), p65Var, ((i2 >> 6) & 896) | 805330944 | (i4 & 14) | (29360128 & (i4 << 12)), 72);
        } else {
            yn7Var2 = yn7Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(m45Var, str, yn7Var2, ay2Var, z, r28Var, i, 7);
        }
    }

    public static final void r(m45 m45Var, String str, yn7 yn7Var, ay2 ay2Var, long j, boolean z, r28 r28Var, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        yn7 yn7Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1509813922);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.d(yn7Var.ordinal()) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(ay2Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.e(j) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.f(r28Var) ? 1048576 : 524288;
        }
        int i3 = 1;
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            yn7Var2 = yn7Var;
            m45 m45Var3 = m45Var2;
            g76.f(m45Var3, jfc.b(r28Var, 0.0f, 24.0f, 1), z, null, bmb.a(yn7Var.m181getCornerSizeD9Ej5fM()), k40.b(1.0f, j), ay2Var, yn7Var.getContentPadding(), pxf.E(20145172, new io7(yn7Var2, ay2Var.a(z, p65Var), str, i3), p65Var), p65Var, (((i2 << 12) & 29360128) | 805330944 | (i2 & 14) | ((i2 >> 9) & 896)) & 2147483646, 0);
        } else {
            yn7Var2 = yn7Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lq(m45Var, str, yn7Var2, ay2Var, j, z, r28Var, i, 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:71:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(int r19, int r20, defpackage.x12 r21, defpackage.ay2 r22, defpackage.m45 r23, defpackage.yn7 r24, defpackage.r28 r25, java.lang.String r26, boolean r27, boolean r28) {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.s(int, int, x12, ay2, m45, yn7, r28, java.lang.String, boolean, boolean):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void t(defpackage.m45 r18, java.lang.String r19, defpackage.yn7 r20, defpackage.r28 r21, boolean r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 250
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.t(m45, java.lang.String, yn7, r28, boolean, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:169:0x03e3  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x03f0  */
    /* JADX WARN: Removed duplicated region for block: B:174:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void u(defpackage.tve r33, defpackage.tb3 r34, defpackage.bo4 r35, defpackage.lo9 r36, defpackage.veb r37, defpackage.r28 r38, defpackage.x12 r39, int r40, int r41) {
        /*
            Method dump skipped, instruction units count: 1030
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo7.u(tve, tb3, bo4, lo9, veb, r28, x12, int, int):void");
    }

    public static final void v(String str, bf7 bf7Var, x12 x12Var, int i) {
        str.getClass();
        bf7Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1539087559);
        int i2 = (p65Var.f(str) ? 4 : 2) | i | (p65Var.f(bf7Var) ? 32 : 16);
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new obb(bf7Var, null, i3);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new lg9(14);
                p65Var.j0(objM2);
            }
            m40.h((m45) objM2, new pb3(4), pxf.E(1606910558, new mbb(bf7Var, str, i3), p65Var), p65Var, 438, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mbb(str, bf7Var, i);
        }
    }

    public static final void w(ove oveVar, lo9 lo9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        ove oveVar2 = oveVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1060041362);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.f(oveVar2) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var2.f(lo9Var) : p65Var2.h(lo9Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), w2g.G(o28Var, 0.0f, 0.0f, 0.0f, 40.0f, 7), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var2.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var2.h(lo9Var)));
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                oveVar2 = oveVar;
                objM = new yn9(lo9Var, oveVar2, i4);
                p65Var2.j0(objM);
            } else {
                oveVar2 = oveVar;
            }
            r28 r28VarR3 = hlg.r(o28Var, false, null, null, (m45) objM, 15);
            sn3 sn3Var = kt7.b;
            r28 r28VarC = w2g.C(jfc.d(flb.a0(r28VarR3, ((zo7) p65Var2.j(sn3Var)).b, rv8.r), 1.0f), 24.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarC);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            String strR = vo7.R(p65Var2, R.string.response_post_locked_message);
            sn3 sn3Var2 = jt7.c;
            r28Var = o28Var;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).o, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131070);
            jjd.b(vo7.R(p65Var2, R.string.response_locked_learn_more), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).o, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16773118), p65Var2, 0, 0, 131070);
            p65Var = p65Var2;
            b09.H(p65Var, true, true, true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 13, oveVar2, lo9Var, r28Var2);
        }
    }

    public static final void x(nob nobVar, mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(832919318);
        int i2 = (p65Var.h(nobVar) ? 4 : 2) | i | (p65Var.h(mz1Var) ? 32 : 16);
        int i3 = 18;
        if ((i2 & 19) == 18 && p65Var.B()) {
            p65Var.S();
        } else {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new ss7(i3);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            wue wueVarA = e67.a(p65Var);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            s1b s1bVar = n1b.a;
            wg6 wg6VarB = s1bVar.b(jm0.class);
            w16 w16Var = new w16();
            w16Var.a(s1bVar.b(jm0.class), x45Var);
            jm0 jm0Var = (jm0) to7.z(wg6VarB, wueVarA, w16Var.b(), wueVarA instanceof pi5 ? ((pi5) wueVarA).getDefaultViewModelCreationExtras() : og2.b, p65Var);
            qlb qlbVar = new qlb();
            qlbVar.a = new WeakReference(nobVar);
            jm0Var.c = qlbVar;
            nobVar.e(jm0Var.b, mz1Var, p65Var, ((i2 << 6) & 896) | (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(nobVar, mz1Var, i, 28);
        }
    }

    public static final void y(k9d k9dVar, b55 b55Var, b55 b55Var2, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        k9dVar.getClass();
        String str = k9dVar.b;
        b55Var.getClass();
        b55Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(628523975);
        int i2 = i | (p65Var2.f(k9dVar) ? 4 : 2) | (p65Var2.h(b55Var) ? 32 : 16) | (p65Var2.h(b55Var2) ? 256 : 128) | 3072;
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            b55Var.invoke(k9dVar.a, k9dVar.d);
            p65Var2.Y(-1578832798);
            amb ambVar = bmb.a;
            o28 o28Var = o28.b;
            r28 r28VarY = r40.y(o28Var, ambVar);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarY, ((zo7) p65Var2.j(sn3Var)).b, rv8.r);
            if (k9dVar.c) {
                p65Var2.Y(-984551203);
                r28VarA0 = bo.B(r28VarA0, 1.0f, ((zo7) p65Var2.j(sn3Var)).n, ambVar);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-984435356);
                p65Var2.p(false);
            }
            r28 r28Var3 = r28VarA0;
            p65Var2.p(false);
            boolean z = ((i2 & 896) == 256) | ((i2 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new i9d(b55Var2, k9dVar, 1);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            kjd.b(str, bgf.N(w2g.F(hlg.r(r28Var3, false, null, null, (m45) objM, 15), 16.0f, 9.0f, 16.0f, 9.0f), str), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var2.j(kt7.c)).m, p65Var, 0, 0, 65532);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new j9d(k9dVar, b55Var, b55Var2, r28Var2, i, 1);
        }
    }

    public static final void z(int i, long j, x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(383320585);
        int i2 = i | 6 | (p65Var.e(j) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28Var = o28.b;
            } else {
                p65Var.S();
            }
            p65Var.q();
            dy0.a(flb.a0(r40.y(jfc.m(r28Var, 128.0f, 38.0f), bmb.a(18.0f)), j, rv8.r), p65Var, 0);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j, i, 22);
        }
    }

    public int hashCode() {
        switch (this.a) {
            case 11:
                return toString().hashCode();
            default:
                return super.hashCode();
        }
    }

    public String toString() {
        switch (this.a) {
            case 11:
                String strJ = n1b.a.b(getClass()).j();
                strJ.getClass();
                return strJ;
            default:
                return super.toString();
        }
    }

    public static y9f N(y9f y9fVar, aaf aafVar, boolean z) throws XMPException {
        int i;
        int i2 = aafVar.b;
        if (i2 == 1) {
            return I(y9fVar, aafVar.a, z);
        }
        if (i2 == 2) {
            String strSubstring = aafVar.a.substring(1);
            y9f y9fVarF = y9f.f(strSubstring, y9fVar.e);
            if (y9fVarF != null || !z) {
                return y9fVarF;
            }
            y9f y9fVar2 = new y9f(strSubstring, null, null);
            y9fVar2.g = true;
            y9fVar.c(y9fVar2);
            return y9fVar2;
        }
        if (!y9fVar.j().c(512)) {
            ywb.e(102, "Indexing applied to non-array");
            return null;
        }
        String str = bPUi.Cbs;
        if (i2 == 3) {
            String str2 = aafVar.a;
            try {
                i = Integer.parseInt(str2.substring(1, str2.length() - 1));
                if (i < 1) {
                    throw new XMPException("Array index must be larger than zero", 102);
                }
                if (z && i == y9fVar.i() + 1) {
                    y9f y9fVar3 = new y9f(str, null, null);
                    y9fVar3.g = true;
                    y9fVar.a(y9fVar3);
                }
            } catch (NumberFormatException unused) {
                ywb.e(102, "Array index not digits.");
                return null;
            }
        } else if (i2 == 4) {
            i = y9fVar.i();
        } else {
            int i3 = -1;
            if (i2 == 6) {
                String[] strArrF = kpe.f(aafVar.a);
                String str3 = strArrF[0];
                String str4 = strArrF[1];
                for (int i4 = 1; i4 <= y9fVar.i() && i3 < 0; i4++) {
                    y9f y9fVarG = y9fVar.g(i4);
                    if (!y9fVarG.j().c(256)) {
                        ywb.e(102, "Field selector must be used on array of struct");
                        return null;
                    }
                    int i5 = 1;
                    while (true) {
                        if (i5 <= y9fVarG.i()) {
                            y9f y9fVarG2 = y9fVarG.g(i5);
                            if (str3.equals(y9fVarG2.a) && str4.equals(y9fVarG2.b)) {
                                i3 = i4;
                                break;
                            }
                            i5++;
                        }
                    }
                }
            } else {
                if (i2 != 5) {
                    ywb.e(9, "Unknown array indexing step in FollowXPathStep");
                    return null;
                }
                String[] strArrF2 = kpe.f(aafVar.a);
                String str5 = strArrF2[0];
                String str6 = strArrF2[1];
                int i6 = aafVar.d;
                if ("xml:lang".equals(str5)) {
                    int iR = R(y9fVar, kpe.e(str6));
                    if (iR >= 0 || (i6 & 4096) <= 0) {
                        i = iR;
                    } else {
                        y9f y9fVar4 = new y9f(str, null, null);
                        y9fVar4.c(new y9f("xml:lang", "x-default", null));
                        y9fVar.b(y9fVar4);
                        i = 1;
                    }
                } else {
                    i = 1;
                    loop2: while (i < y9fVar.i()) {
                        Iterator itQ = y9fVar.g(i).q();
                        while (itQ.hasNext()) {
                            y9f y9fVar5 = (y9f) itQ.next();
                            if (str5.equals(y9fVar5.a) && str6.equals(y9fVar5.b)) {
                                break loop2;
                            }
                        }
                        i++;
                    }
                }
            }
            i = i3;
        }
        if (1 > i || i > y9fVar.i()) {
            return null;
        }
        return y9fVar.g(i);
    }

    public static final void b(yn7 yn7Var, mz1 mz1Var, x12 x12Var, int i) {
        String str;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(593222635);
        int i2 = (p65Var.d(yn7Var.ordinal()) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            int i3 = lo7.a[yn7Var.ordinal()];
            if (i3 == 1) {
                str = "L";
            } else if (i3 == 2) {
                str = "M";
            } else if (i3 == 3) {
                str = "S";
            } else {
                if (i3 != 4) {
                    ygf.a();
                    return;
                }
                str = "XS";
            }
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.e, z46.m, p65Var, 6);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            mz1Var.k(Boolean.TRUE, str.concat(MaAxRJinch.wBCcraqhmgP), p65Var, 390);
            hp7.t(p65Var, jfc.p(o28Var, 16.0f));
            mz1Var.k(Boolean.FALSE, str.concat(" - Disabled"), p65Var, 390);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(yn7Var, mz1Var, i, 25);
        }
    }

    public static final void c(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(757192139);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28Var2 = o28Var;
            kjd.b(AXoTRPEGKEve.SqCuZbDOKgWqIJ, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(kt7.c)).l, p65Var, 6, 0, 65534);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(r28Var2, 24.0f));
            p65Var.Y(-1526349635);
            for (yn7 yn7Var : yn7.getEntries()) {
                b(yn7Var, pxf.E(1896672055, new go7(yn7Var, 1), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(-1526342497);
            for (yn7 yn7Var2 : yn7.getEntries()) {
                b(yn7Var2, pxf.E(-217971346, new go7(yn7Var2, 2), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(-1526335301);
            for (yn7 yn7Var3 : yn7.getEntries()) {
                b(yn7Var3, pxf.E(747591471, new go7(yn7Var3, 3), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 17);
        }
    }

    public /* synthetic */ mo7(int i) {
        this.a = i;
    }
}
