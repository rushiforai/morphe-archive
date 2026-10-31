package cw;

import android.app.Notification;
import android.opengl.GLES20;
import android.provider.Settings;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import com.google.android.exoplayer2.util.GlUtil$GlException;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements kw.x2, ue.z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48277a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f48278b;

    /* renamed from: c, reason: collision with root package name */
    public final int f48279c;

    /* renamed from: d, reason: collision with root package name */
    public Object f48280d;

    /* renamed from: e, reason: collision with root package name */
    public Object f48281e;

    /* renamed from: f, reason: collision with root package name */
    public Object f48282f;

    public r(CoroutineContext workContext, xq.c logger, int i5) {
        this.f48277a = 2;
        if ((i5 & 1) != 0) {
            a80.e eVar = t70.y0.f88884a;
            workContext = a80.d.f488c;
        }
        fr.s sVar = new fr.s();
        logger = (i5 & 16) != 0 ? xq.d.f96224b : logger;
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(logger, "logger");
        this.f48278b = workContext;
        this.f48282f = fr.k.f55651a;
        this.f48280d = sVar;
        this.f48279c = 3;
        this.f48281e = logger;
    }

    public static void p(int i5, int i11, String str) throws GlUtil$GlException {
        int iGlCreateShader = GLES20.glCreateShader(i11);
        GLES20.glShaderSource(iGlCreateShader, str);
        GLES20.glCompileShader(iGlCreateShader);
        int[] iArr = {0};
        GLES20.glGetShaderiv(iGlCreateShader, 35713, iArr, 0);
        wf.a.g(GLES20.glGetShaderInfoLog(iGlCreateShader) + ", source: " + str, iArr[0] == 1);
        GLES20.glAttachShader(i5, iGlCreateShader);
        GLES20.glDeleteShader(iGlCreateShader);
        wf.a.f();
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:3:0x0002. Please report as an issue. */
    @Override // kw.x2
    public String a(String rawValue) {
        switch (this.f48277a) {
        }
        Intrinsics.g(rawValue, "rawValue");
        return rawValue;
    }

    @Override // kw.x2
    public w70.i2 b() {
        switch (this.f48277a) {
        }
        return (w70.i2) this.f48281e;
    }

    @Override // kw.x2
    public w70.g2 c() {
        switch (this.f48277a) {
        }
        return (w70.i2) this.f48280d;
    }

    @Override // kw.x2
    public r3.i0 d() {
        switch (this.f48277a) {
            case 0:
                return (r3.g0) this.f48282f;
            default:
                return (x) this.f48282f;
        }
    }

    @Override // kw.x2
    public String e() {
        switch (this.f48277a) {
            case 0:
                return "00012345";
            default:
                return "10-80-00";
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0136  */
    @Override // ue.z
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void f(com.google.android.gms.internal.consent_sdk.a aVar) {
        wf.t tVar;
        SparseArray sparseArray;
        wf.t tVar2;
        int i5;
        int i11;
        char c11;
        SparseArray sparseArray2;
        int i12;
        SparseArray sparseArray3 = (SparseArray) this.f48282f;
        SparseIntArray sparseIntArray = (SparseIntArray) this.f48280d;
        ke.x xVar = (ke.x) this.f48278b;
        ue.b0 b0Var = (ue.b0) this.f48281e;
        SparseArray sparseArray4 = b0Var.f90830g;
        SparseBooleanArray sparseBooleanArray = b0Var.f90831h;
        t5.d0 d0Var = b0Var.f90829f;
        List list = b0Var.f90826c;
        int i13 = b0Var.f90824a;
        if (aVar.N() != 2) {
            return;
        }
        if (i13 == 1 || i13 == 2 || b0Var.f90836m == 1) {
            tVar = (wf.t) list.get(0);
        } else {
            tVar = new wf.t(((wf.t) list.get(0)).c());
            list.add(tVar);
        }
        if ((aVar.N() & 128) == 0) {
            return;
        }
        aVar.Z(1);
        int iS = aVar.S();
        aVar.Z(3);
        aVar.z(0, 2, xVar.f71449d);
        xVar.o(0);
        xVar.r(3);
        b0Var.f90840s = xVar.i(13);
        aVar.z(0, 2, xVar.f71449d);
        xVar.o(0);
        xVar.r(4);
        aVar.Z(xVar.i(12));
        if (i13 == 2 && b0Var.f90838q == null) {
            ue.e0 e0VarI = d0Var.i(21, new mh.c(21, (String) null, (ArrayList) null, wf.v.f94381f));
            b0Var.f90838q = e0VarI;
            if (e0VarI != null) {
                e0VarI.g(tVar, b0Var.f90835l, new ue.d0(iS, 21, UserMetadata.MAX_INTERNAL_KEY_SIZE));
            }
        }
        sparseArray3.clear();
        sparseIntArray.clear();
        int iG = aVar.g();
        while (iG > 0) {
            aVar.z(0, 5, xVar.f71449d);
            xVar.o(0);
            int i14 = xVar.i(8);
            xVar.r(3);
            int i15 = xVar.i(13);
            xVar.r(4);
            int i16 = xVar.i(12);
            int i17 = aVar.f31984b;
            int i18 = i17 + i16;
            int i19 = iG;
            SparseArray sparseArray5 = sparseArray4;
            wf.t tVar3 = tVar;
            int i21 = -1;
            ArrayList arrayList = null;
            ke.x xVar2 = xVar;
            String strTrim = null;
            while (true) {
                if (aVar.f31984b >= i18) {
                    i11 = iS;
                    break;
                }
                int iN = aVar.N();
                i11 = iS;
                int iN2 = aVar.f31984b + aVar.N();
                if (iN2 > i18) {
                    break;
                }
                SparseArray sparseArray6 = sparseArray3;
                if (iN == 5) {
                    long jO = aVar.O();
                    if (jO == 1094921523) {
                        i21 = 129;
                    } else if (jO == 1161904947) {
                        i21 = 135;
                    } else if (jO == 1094921524) {
                        i21 = 172;
                    } else if (jO == 1212503619) {
                        i21 = 36;
                    }
                    i12 = iN2;
                } else if (iN == 106) {
                    i12 = iN2;
                    i21 = 129;
                } else if (iN == 122) {
                    i12 = iN2;
                    i21 = 135;
                } else {
                    if (iN == 127) {
                        if (aVar.N() == 21) {
                        }
                    } else if (iN == 123) {
                        i21 = Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE;
                    } else if (iN == 10) {
                        i12 = iN2;
                        strTrim = aVar.L(3, vk.e.f92809c).trim();
                    } else if (iN == 89) {
                        arrayList = new ArrayList();
                        while (aVar.f31984b < iN2) {
                            String strTrim2 = aVar.L(3, vk.e.f92809c).trim();
                            aVar.N();
                            byte[] bArr = new byte[4];
                            aVar.z(0, 4, bArr);
                            arrayList.add(new ue.c0(strTrim2, bArr));
                            iN2 = iN2;
                        }
                        i12 = iN2;
                        i21 = 89;
                    } else {
                        i12 = iN2;
                        if (iN == 111) {
                            i21 = 257;
                        }
                    }
                    i12 = iN2;
                }
                aVar.Z(i12 - aVar.f31984b);
                iS = i11;
                sparseArray3 = sparseArray6;
            }
            SparseArray sparseArray7 = sparseArray3;
            aVar.Y(i18);
            mh.c cVar = new mh.c(i21, strTrim, arrayList, Arrays.copyOfRange((byte[]) aVar.f31986d, i17, i18));
            if (i14 == 6 || i14 == 5) {
                i14 = i21;
            }
            iG = i19 - (i16 + 5);
            int i22 = i13 == 2 ? i14 : i15;
            if (sparseBooleanArray.get(i22)) {
                sparseArray2 = sparseArray7;
                c11 = 21;
            } else {
                c11 = 21;
                ue.e0 e0VarI2 = (i13 == 2 && i14 == 21) ? b0Var.f90838q : d0Var.i(i14, cVar);
                if (i13 != 2 || i15 < sparseIntArray.get(i22, UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
                    sparseIntArray.put(i22, i15);
                    sparseArray2 = sparseArray7;
                    sparseArray2.put(i22, e0VarI2);
                } else {
                    sparseArray2 = sparseArray7;
                }
            }
            sparseArray3 = sparseArray2;
            xVar = xVar2;
            sparseArray4 = sparseArray5;
            tVar = tVar3;
            iS = i11;
        }
        SparseArray sparseArray8 = sparseArray4;
        int i23 = iS;
        wf.t tVar4 = tVar;
        SparseArray sparseArray9 = sparseArray3;
        int size = sparseIntArray.size();
        int i24 = 0;
        while (i24 < size) {
            int iKeyAt = sparseIntArray.keyAt(i24);
            int iValueAt = sparseIntArray.valueAt(i24);
            sparseBooleanArray.put(iKeyAt, true);
            b0Var.f90832i.put(iValueAt, true);
            ue.e0 e0Var = (ue.e0) sparseArray9.valueAt(i24);
            if (e0Var != null) {
                if (e0Var != b0Var.f90838q) {
                    i5 = i23;
                    tVar2 = tVar4;
                    e0Var.g(tVar2, b0Var.f90835l, new ue.d0(i5, iKeyAt, UserMetadata.MAX_INTERNAL_KEY_SIZE));
                } else {
                    tVar2 = tVar4;
                    i5 = i23;
                }
                sparseArray = sparseArray8;
                sparseArray.put(iValueAt, e0Var);
            } else {
                sparseArray = sparseArray8;
                tVar2 = tVar4;
                i5 = i23;
            }
            i24++;
            sparseArray8 = sparseArray;
            i23 = i5;
            tVar4 = tVar2;
        }
        SparseArray sparseArray10 = sparseArray8;
        if (i13 == 2) {
            if (b0Var.n) {
                return;
            }
            b0Var.f90835l.o();
            b0Var.f90836m = 0;
            b0Var.n = true;
            return;
        }
        sparseArray10.remove(this.f48279c);
        int i25 = i13 == 1 ? 0 : b0Var.f90836m - 1;
        b0Var.f90836m = i25;
        if (i25 == 0) {
            b0Var.f90835l.o();
            b0Var.n = true;
        }
    }

    @Override // ue.z
    public void g(wf.t tVar, ke.l lVar, ue.d0 d0Var) {
    }

    @Override // kw.x2
    public ResolvableString getLabel() {
        switch (this.f48277a) {
        }
        return (IdentifierResolvableString) this.f48278b;
    }

    @Override // kw.x2
    public y3.n getLayoutDirection() {
        switch (this.f48277a) {
        }
        return null;
    }

    @Override // kw.x2
    public int h() {
        switch (this.f48277a) {
        }
        return 0;
    }

    @Override // kw.x2
    public String i(String userTyped) throws IOException {
        switch (this.f48277a) {
            case 0:
                Intrinsics.g(userTyped, "userTyped");
                StringBuilder sb2 = new StringBuilder();
                int length = userTyped.length();
                for (int i5 = 0; i5 < length; i5++) {
                    char cCharAt = userTyped.charAt(i5);
                    if (Character.isDigit(cCharAt)) {
                        sb2.append(cCharAt);
                    }
                }
                return r70.l.G1(8, sb2.toString());
            default:
                Intrinsics.g(userTyped, "userTyped");
                StringBuilder sb3 = new StringBuilder();
                int length2 = userTyped.length();
                for (int i11 = 0; i11 < length2; i11++) {
                    char cCharAt2 = userTyped.charAt(i11);
                    if (Character.isDigit(cCharAt2)) {
                        sb3.append(cCharAt2);
                    }
                }
                return r70.l.G1(6, sb3.toString());
        }
    }

    @Override // kw.x2
    public kw.e3 j(String input) {
        switch (this.f48277a) {
            case 0:
                Intrinsics.g(input, "input");
                if (!r70.k.U0(input)) {
                    if (input.length() >= 8) {
                        break;
                    } else {
                        break;
                    }
                } else {
                    break;
                }
            default:
                Intrinsics.g(input, "input");
                if (!r70.k.U0(input)) {
                    if (input.length() >= 6) {
                        break;
                    } else {
                        break;
                    }
                } else {
                    break;
                }
        }
        return new kw.j3(null);
    }

    @Override // kw.x2
    public boolean k() {
        switch (this.f48277a) {
        }
        return false;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:3:0x0002. Please report as an issue. */
    @Override // kw.x2
    public String l(String displayName) {
        switch (this.f48277a) {
        }
        Intrinsics.g(displayName, "displayName");
        return displayName;
    }

    @Override // kw.x2
    public int m() {
        switch (this.f48277a) {
        }
        return this.f48279c;
    }

    @Override // kw.x2
    public boolean n() {
        switch (this.f48277a) {
        }
        return true;
    }

    @Override // kw.x2
    public boolean o() {
        switch (this.f48277a) {
        }
        return true;
    }

    public AuthorizationRequest q() {
        return new AuthorizationRequest((String) this.f48278b, this.f48279c, (String) this.f48282f, (String[]) this.f48280d, (HashMap) this.f48281e);
    }

    public Object r(fr.t0 t0Var, ContinuationImpl continuationImpl) {
        Iterable iterableD = t0Var.d();
        e00.q4 q4Var = new e00.q4(9, this, t0Var);
        return t70.m0.y((CoroutineContext) this.f48278b, new b30.a(q4Var, iterableD, this.f48279c, this, null, 3), continuationImpl);
    }

    public int s(String str) throws GlUtil$GlException {
        int iGlGetAttribLocation = GLES20.glGetAttribLocation(this.f48279c, str);
        GLES20.glEnableVertexAttribArray(iGlGetAttribLocation);
        wf.a.f();
        return iGlGetAttribLocation;
    }

    public void t(String[] strArr) {
        this.f48280d = strArr;
    }

    public r(int i5) {
        this.f48277a = i5;
        switch (i5) {
            case 1:
                this.f48278b = zg.a.U(2132019711, new Object[0], EmptyList.f71733a);
                this.f48279c = 8;
                this.f48282f = x.f48369a;
                this.f48280d = w70.u1.c(null);
                this.f48281e = w70.u1.c(Boolean.FALSE);
                break;
            case 7:
                this.f48281e = new HashMap();
                this.f48278b = "98029f78f5794b958c1591691f7ce13f";
                this.f48279c = 1;
                this.f48282f = "disco://nova.branch.search.spotify/callback/oauth2";
                break;
            default:
                this.f48278b = zg.a.U(2132019707, new Object[0], EmptyList.f71733a);
                this.f48279c = 8;
                this.f48282f = r3.h0.f85443a;
                this.f48280d = w70.u1.c(null);
                this.f48281e = w70.u1.c(Boolean.FALSE);
                break;
        }
    }

    public r(String str, String str2) throws GlUtil$GlException {
        this.f48277a = 6;
        int iGlCreateProgram = GLES20.glCreateProgram();
        this.f48279c = iGlCreateProgram;
        wf.a.f();
        p(iGlCreateProgram, 35633, str);
        p(iGlCreateProgram, 35632, str2);
        GLES20.glLinkProgram(iGlCreateProgram);
        int[] iArr = {0};
        GLES20.glGetProgramiv(iGlCreateProgram, 35714, iArr, 0);
        wf.a.g("Unable to link shader program: \n" + GLES20.glGetProgramInfoLog(iGlCreateProgram), iArr[0] == 1);
        GLES20.glUseProgram(iGlCreateProgram);
        this.f48280d = new HashMap();
        int[] iArr2 = new int[1];
        GLES20.glGetProgramiv(iGlCreateProgram, 35721, iArr2, 0);
        this.f48278b = new vu.q[iArr2[0]];
        for (int i5 = 0; i5 < iArr2[0]; i5++) {
            int i11 = this.f48279c;
            int[] iArr3 = new int[1];
            GLES20.glGetProgramiv(i11, 35722, iArr3, 0);
            int i12 = iArr3[0];
            byte[] bArr = new byte[i12];
            GLES20.glGetActiveAttrib(i11, i5, i12, new int[1], 0, new int[1], 0, new int[1], 0, bArr, 0);
            int i13 = 0;
            while (true) {
                if (i13 >= i12) {
                    break;
                }
                if (bArr[i13] == 0) {
                    i12 = i13;
                    break;
                }
                i13++;
            }
            String str3 = new String(bArr, 0, i12);
            GLES20.glGetAttribLocation(i11, str3);
            vu.q qVar = new vu.q();
            ((vu.q[]) this.f48278b)[i5] = qVar;
            ((HashMap) this.f48280d).put(str3, qVar);
        }
        this.f48281e = new HashMap();
        int[] iArr4 = new int[1];
        GLES20.glGetProgramiv(this.f48279c, 35718, iArr4, 0);
        this.f48282f = new w.a[iArr4[0]];
        for (int i14 = 0; i14 < iArr4[0]; i14++) {
            int i15 = this.f48279c;
            int[] iArr5 = new int[1];
            GLES20.glGetProgramiv(i15, 35719, iArr5, 0);
            int i16 = iArr5[0];
            byte[] bArr2 = new byte[i16];
            GLES20.glGetActiveUniform(i15, i14, i16, new int[1], 0, new int[1], 0, new int[1], 0, bArr2, 0);
            int i17 = 0;
            while (true) {
                if (i17 >= i16) {
                    break;
                }
                if (bArr2[i17] == 0) {
                    i16 = i17;
                    break;
                }
                i17++;
            }
            String str4 = new String(bArr2, 0, i16);
            GLES20.glGetUniformLocation(i15, str4);
            w.a aVar = new w.a();
            ((w.a[]) this.f48282f)[i14] = aVar;
            ((HashMap) this.f48281e).put(str4, aVar);
        }
        wf.a.f();
    }

    public r(fz.y yVar, je.f fVar, byte[] bArr, bg.g[] gVarArr, int i5) {
        this.f48277a = 4;
        this.f48278b = yVar;
        this.f48282f = fVar;
        this.f48280d = bArr;
        this.f48281e = gVarArr;
        this.f48279c = i5;
    }

    public r(String str, int i5) {
        this.f48277a = 3;
        this.f48280d = Settings.System.DEFAULT_NOTIFICATION_URI;
        this.f48278b = str;
        this.f48279c = i5;
        this.f48281e = Notification.AUDIO_ATTRIBUTES_DEFAULT;
    }

    public r(ue.b0 b0Var, int i5) {
        this.f48277a = 5;
        this.f48281e = b0Var;
        this.f48278b = new ke.x(new byte[5], 5);
        this.f48282f = new SparseArray();
        this.f48280d = new SparseIntArray();
        this.f48279c = i5;
    }
}
