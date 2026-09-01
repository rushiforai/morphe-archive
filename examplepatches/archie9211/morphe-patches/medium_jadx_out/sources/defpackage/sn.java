package defpackage;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.res.Resources;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.os.SystemClock;
import android.os.Trace;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sn extends l4 implements View.OnAttachStateChangeListener, AccessibilityManager.AccessibilityStateChangeListener, AccessibilityManager.TouchExplorationStateChangeListener {
    public static final j68 N;
    public final l68 A;
    public final i68 B;
    public final i68 C;
    public final String D;
    public final String E;
    public final vwa F;
    public final k68 G;
    public ayb H;
    public boolean I;
    public final i68 J;
    public final v0 K;
    public final ArrayList L;
    public final rn M;
    public final mn d;
    public int e = Integer.MIN_VALUE;
    public final rn f = new rn(this, 0);
    public final AccessibilityManager g;
    public long h;
    public List i;
    public final nn j;
    public int k;
    public int l;
    public y4 m;
    public y4 n;
    public boolean o;
    public final k68 p;
    public final k68 q;
    public final xkc r;
    public final xkc s;
    public int t;
    public Integer u;
    public final d80 v;
    public final uz0 w;
    public boolean x;
    public on y;
    public k68 z;

    static {
        int[] iArr = {R.id.accessibility_custom_action_0, R.id.accessibility_custom_action_1, R.id.accessibility_custom_action_2, R.id.accessibility_custom_action_3, R.id.accessibility_custom_action_4, R.id.accessibility_custom_action_5, R.id.accessibility_custom_action_6, R.id.accessibility_custom_action_7, R.id.accessibility_custom_action_8, R.id.accessibility_custom_action_9, R.id.accessibility_custom_action_10, R.id.accessibility_custom_action_11, R.id.accessibility_custom_action_12, R.id.accessibility_custom_action_13, R.id.accessibility_custom_action_14, R.id.accessibility_custom_action_15, R.id.accessibility_custom_action_16, R.id.accessibility_custom_action_17, R.id.accessibility_custom_action_18, R.id.accessibility_custom_action_19, R.id.accessibility_custom_action_20, R.id.accessibility_custom_action_21, R.id.accessibility_custom_action_22, R.id.accessibility_custom_action_23, R.id.accessibility_custom_action_24, R.id.accessibility_custom_action_25, R.id.accessibility_custom_action_26, R.id.accessibility_custom_action_27, R.id.accessibility_custom_action_28, R.id.accessibility_custom_action_29, R.id.accessibility_custom_action_30, R.id.accessibility_custom_action_31};
        j68 j68Var = h46.a;
        j68 j68Var2 = new j68(32);
        int i = j68Var2.b;
        if (i < 0) {
            z10.i("");
            return;
        }
        int i2 = i + 32;
        j68Var2.b(i2);
        int[] iArr2 = j68Var2.a;
        int i3 = j68Var2.b;
        if (i != i3) {
            k80.h0(i2, i, iArr2, iArr2, i3);
        }
        k80.k0(i, 0, iArr, iArr2, 12);
        j68Var2.b += 32;
        N = j68Var2;
    }

    public sn(mn mnVar) {
        this.d = mnVar;
        Object systemService = mnVar.getContext().getSystemService("accessibility");
        systemService.getClass();
        this.g = (AccessibilityManager) systemService;
        this.h = 100L;
        new Handler(Looper.getMainLooper());
        this.j = new nn(this);
        this.k = Integer.MIN_VALUE;
        this.l = Integer.MIN_VALUE;
        this.p = new k68();
        this.q = new k68();
        this.r = new xkc(0);
        this.s = new xkc(0);
        this.t = -1;
        this.v = new d80(0);
        this.w = pwd.e(1, 6, null);
        this.x = true;
        k68 k68Var = j46.a;
        k68Var.getClass();
        this.z = k68Var;
        this.A = new l68();
        this.B = new i68();
        this.C = new i68();
        this.D = "android.view.accessibility.extra.EXTRA_DATA_TEST_TRAVERSALBEFORE_VAL";
        this.E = "android.view.accessibility.extra.EXTRA_DATA_TEST_TRAVERSALAFTER_VAL";
        this.F = new vwa(9);
        this.G = new k68();
        this.H = new ayb(mnVar.getSemanticsOwner().a(), k68Var);
        int i = e46.a;
        this.J = new i68();
        mnVar.addOnAttachStateChangeListener(this);
        this.K = new v0(3, this);
        this.L = new ArrayList();
        this.M = new rn(this, 1);
    }

    public static /* synthetic */ void E(sn snVar, int i, int i2, Integer num, int i3) {
        if ((i3 & 4) != 0) {
            num = null;
        }
        snVar.D(i, i2, num, null);
    }

    public static Rect L(er7 er7Var, float f, float f2) {
        if (!(er7Var instanceof ow8) && !(er7Var instanceof pw8)) {
            return null;
        }
        zwa zwaVarX = er7Var.x();
        return new Rect((int) (zwaVarX.a + f), (int) (zwaVarX.b + f2), (int) (zwaVarX.c + f), (int) (zwaVarX.d + f2));
    }

    public static float[] N(er7 er7Var) {
        if (!(er7Var instanceof pw8)) {
            return null;
        }
        wlb wlbVar = ((pw8) er7Var).d;
        long j = wlbVar.h;
        long j2 = wlbVar.g;
        long j3 = wlbVar.f;
        long j4 = wlbVar.e;
        return new float[]{Float.intBitsToFloat((int) (j4 >> 32)), Float.intBitsToFloat((int) (j4 & 4294967295L)), Float.intBitsToFloat((int) (j3 >> 32)), Float.intBitsToFloat((int) (j3 & 4294967295L)), Float.intBitsToFloat((int) (j2 >> 32)), Float.intBitsToFloat((int) (j2 & 4294967295L)), Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L))};
    }

    public static Region O(er7 er7Var, float f, float f2) {
        if (er7Var instanceof nw8) {
            nw8 nw8Var = (nw8) er7Var;
            zwa zwaVarH = nw8Var.x().h(f, f2);
            Region region = new Region(new Rect((int) (zwaVarH.a + 0.0f), (int) (zwaVarH.b + 0.0f), (int) (zwaVarH.c + 0.0f), (int) (zwaVarH.d + 0.0f)));
            Region region2 = new Region();
            br brVar = nw8Var.d;
            if (brVar instanceof br) {
                Path path = brVar.a;
                path.offset(f, f2);
                region2.setPath(path, region);
                return region2;
            }
            ik4.k("Unable to obtain android.graphics.Path");
        }
        return null;
    }

    public static CharSequence P(CharSequence charSequence) {
        if (charSequence.length() != 0) {
            int i = 100000;
            if (charSequence.length() > 100000) {
                if (Character.isHighSurrogate(charSequence.charAt(99999)) && Character.isLowSurrogate(charSequence.charAt(100000))) {
                    i = 99999;
                }
                CharSequence charSequenceSubSequence = charSequence.subSequence(0, i);
                charSequenceSubSequence.getClass();
                return charSequenceSubSequence;
            }
        }
        return charSequence;
    }

    public static String t(zxb zxbVar) {
        mx mxVar;
        if (zxbVar != null) {
            txb txbVar = zxbVar.d;
            f78 f78Var = txbVar.a;
            iyb iybVar = eyb.a;
            if (f78Var.c(iybVar)) {
                return z27.b((List) txbVar.m(iybVar), ",", null, 62);
            }
            iyb iybVar2 = eyb.G;
            if (f78Var.c(iybVar2)) {
                Object objG = f78Var.g(iybVar2);
                if (objG == null) {
                    objG = null;
                }
                mx mxVar2 = (mx) objG;
                if (mxVar2 != null) {
                    return mxVar2.b;
                }
            } else {
                Object objG2 = f78Var.g(eyb.C);
                if (objG2 == null) {
                    objG2 = null;
                }
                List list = (List) objG2;
                if (list != null && (mxVar = (mx) bu1.z0(list)) != null) {
                    return mxVar.b;
                }
            }
        }
        return null;
    }

    public static final boolean x(lrb lrbVar, float f) {
        m45 m45Var = lrbVar.a;
        if (f >= 0.0f || ((Number) m45Var.invoke()).floatValue() <= 0.0f) {
            return f > 0.0f && ((Number) m45Var.invoke()).floatValue() < ((Number) lrbVar.b.invoke()).floatValue();
        }
        return true;
    }

    public static final boolean y(lrb lrbVar) {
        m45 m45Var = lrbVar.a;
        if (((Number) m45Var.invoke()).floatValue() > 0.0f) {
            return true;
        }
        ((Number) m45Var.invoke()).floatValue();
        ((Number) lrbVar.b.invoke()).floatValue();
        return false;
    }

    public static final boolean z(lrb lrbVar) {
        m45 m45Var = lrbVar.a;
        if (((Number) m45Var.invoke()).floatValue() < ((Number) lrbVar.b.invoke()).floatValue()) {
            return true;
        }
        ((Number) m45Var.invoke()).floatValue();
        return false;
    }

    public final int A(int i) {
        if (i == this.d.getSemanticsOwner().a().f) {
            return -1;
        }
        return i;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0086  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void B(defpackage.zxb r20, defpackage.ayb r21) {
        /*
            r19 = this;
            r0 = r19
            r1 = r20
            r2 = r21
            int[] r3 = defpackage.r46.a
            l68 r3 = new l68
            r3.<init>()
            r4 = 4
            java.util.List r5 = defpackage.zxb.j(r4, r1)
            aq6 r6 = r1.c
            int r7 = r5.size()
            r8 = 0
            r9 = r8
        L1a:
            if (r9 >= r7) goto L40
            java.lang.Object r10 = r5.get(r9)
            zxb r10 = (defpackage.zxb) r10
            i46 r11 = r0.s()
            int r10 = r10.f
            boolean r11 = r11.a(r10)
            if (r11 == 0) goto L3d
            l68 r11 = r2.b
            boolean r11 = r11.c(r10)
            if (r11 != 0) goto L3a
            r0.w(r6)
            return
        L3a:
            r3.a(r10)
        L3d:
            int r9 = r9 + 1
            goto L1a
        L40:
            l68 r2 = r2.b
            int[] r5 = r2.b
            long[] r2 = r2.a
            int r7 = r2.length
            int r7 = r7 + (-2)
            if (r7 < 0) goto L8b
            r9 = r8
        L4c:
            r10 = r2[r9]
            long r12 = ~r10
            r14 = 7
            long r12 = r12 << r14
            long r12 = r12 & r10
            r14 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r12 = r12 & r14
            int r12 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1))
            if (r12 == 0) goto L86
            int r12 = r9 - r7
            int r12 = ~r12
            int r12 = r12 >>> 31
            r13 = 8
            int r12 = 8 - r12
            r14 = r8
        L66:
            if (r14 >= r12) goto L84
            r15 = 255(0xff, double:1.26E-321)
            long r15 = r15 & r10
            r17 = 128(0x80, double:6.3E-322)
            int r15 = (r15 > r17 ? 1 : (r15 == r17 ? 0 : -1))
            if (r15 >= 0) goto L80
            int r15 = r9 << 3
            int r15 = r15 + r14
            r15 = r5[r15]
            boolean r15 = r3.c(r15)
            if (r15 != 0) goto L80
            r0.w(r6)
            return
        L80:
            long r10 = r10 >> r13
            int r14 = r14 + 1
            goto L66
        L84:
            if (r12 != r13) goto L8b
        L86:
            if (r9 == r7) goto L8b
            int r9 = r9 + 1
            goto L4c
        L8b:
            java.util.List r1 = defpackage.zxb.j(r4, r1)
            int r2 = r1.size()
        L93:
            if (r8 >= r2) goto Lb9
            java.lang.Object r3 = r1.get(r8)
            zxb r3 = (defpackage.zxb) r3
            k68 r4 = r0.G
            int r5 = r3.f
            java.lang.Object r4 = r4.b(r5)
            ayb r4 = (defpackage.ayb) r4
            if (r4 == 0) goto Lb6
            i46 r5 = r0.s()
            int r6 = r3.f
            boolean r5 = r5.a(r6)
            if (r5 == 0) goto Lb6
            r0.B(r3, r4)
        Lb6:
            int r8 = r8 + 1
            goto L93
        Lb9:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sn.B(zxb, ayb):void");
    }

    public final boolean C(AccessibilityEvent accessibilityEvent) {
        if (!v()) {
            return false;
        }
        if (accessibilityEvent.getEventType() == 2048 || accessibilityEvent.getEventType() == 32768) {
            this.o = true;
        }
        try {
            return ((Boolean) this.f.invoke(accessibilityEvent)).booleanValue();
        } finally {
            this.o = false;
        }
    }

    public final boolean D(int i, int i2, Integer num, List list) {
        if (i == Integer.MIN_VALUE || !v()) {
            return false;
        }
        AccessibilityEvent accessibilityEventO = o(i, i2);
        if (num != null) {
            accessibilityEventO.setContentChangeTypes(num.intValue());
        }
        if (list != null) {
            accessibilityEventO.setContentDescription(z27.b(list, ",", null, 62));
        }
        return C(accessibilityEventO);
    }

    public final void F(int i, int i2, String str) {
        AccessibilityEvent accessibilityEventO = o(A(i), 32);
        accessibilityEventO.setContentChangeTypes(i2);
        if (str != null) {
            accessibilityEventO.getText().add(str);
        }
        C(accessibilityEventO);
    }

    public final void G(int i) {
        on onVar = this.y;
        if (onVar != null) {
            zxb zxbVar = onVar.a;
            if (i != zxbVar.f) {
                return;
            }
            if (SystemClock.uptimeMillis() - onVar.f <= 1000) {
                AccessibilityEvent accessibilityEventO = o(A(zxbVar.f), 131072);
                accessibilityEventO.setFromIndex(onVar.d);
                accessibilityEventO.setToIndex(onVar.e);
                accessibilityEventO.setAction(onVar.b);
                accessibilityEventO.setMovementGranularity(onVar.c);
                accessibilityEventO.getText().add(t(zxbVar));
                C(accessibilityEventO);
            }
        }
        this.y = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:214:0x04d0 A[PHI: r37
      0x04d0: PHI (r37v8 int) = (r37v7 int), (r37v7 int), (r37v7 int), (r37v7 int), (r37v7 int), (r37v9 int) binds: [B:216:0x04d9, B:223:0x04e9, B:226:0x04f8, B:233:0x0504, B:230:0x04ff, B:213:0x04ce] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:277:0x0631  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x013d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void H(defpackage.i46 r57) {
        /*
            Method dump skipped, instruction units count: 1688
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sn.H(i46):void");
    }

    public final void I(aq6 aq6Var, l68 l68Var) {
        txb txbVarX;
        if (aq6Var.H() && !this.d.getAndroidViewsHandler$ui().getLayoutNodeToHolder().containsKey(aq6Var)) {
            aq6 aq6Var2 = null;
            if (!aq6Var.F.e(8)) {
                aq6Var = aq6Var.v();
                while (true) {
                    if (aq6Var == null) {
                        aq6Var = null;
                        break;
                    } else if (aq6Var.F.e(8)) {
                        break;
                    } else {
                        aq6Var = aq6Var.v();
                    }
                }
            }
            if (aq6Var == null || (txbVarX = aq6Var.x()) == null) {
                return;
            }
            if (!txbVarX.c) {
                aq6 aq6VarV = aq6Var.v();
                while (true) {
                    if (aq6VarV != null) {
                        txb txbVarX2 = aq6VarV.x();
                        if (txbVarX2 != null && txbVarX2.c) {
                            aq6Var2 = aq6VarV;
                            break;
                        }
                        aq6VarV = aq6VarV.v();
                    } else {
                        break;
                    }
                }
                if (aq6Var2 != null) {
                    aq6Var = aq6Var2;
                }
            }
            int i = aq6Var.b;
            if (l68Var.a(i)) {
                E(this, A(i), RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, 1, 8);
            }
        }
    }

    public final void J(aq6 aq6Var) {
        if (aq6Var.H() && !this.d.getAndroidViewsHandler$ui().getLayoutNodeToHolder().containsKey(aq6Var)) {
            int i = aq6Var.b;
            lrb lrbVar = (lrb) this.p.b(i);
            lrb lrbVar2 = (lrb) this.q.b(i);
            if (lrbVar == null && lrbVar2 == null) {
                return;
            }
            AccessibilityEvent accessibilityEventO = o(i, 4096);
            if (lrbVar != null) {
                accessibilityEventO.setScrollX((int) ((Number) lrbVar.a.invoke()).floatValue());
                accessibilityEventO.setMaxScrollX((int) ((Number) lrbVar.b.invoke()).floatValue());
            }
            if (lrbVar2 != null) {
                accessibilityEventO.setScrollY((int) ((Number) lrbVar2.a.invoke()).floatValue());
                accessibilityEventO.setMaxScrollY((int) ((Number) lrbVar2.b.invoke()).floatValue());
            }
            C(accessibilityEventO);
        }
    }

    public final boolean K(zxb zxbVar, int i, int i2, boolean z) {
        String strT;
        txb txbVar = zxbVar.d;
        int i3 = zxbVar.f;
        iyb iybVar = sxb.j;
        if (txbVar.a.c(iybVar) && bo.M(zxbVar)) {
            c55 c55Var = (c55) ((i4) zxbVar.d.m(iybVar)).b;
            if (c55Var != null) {
                return ((Boolean) c55Var.f(Integer.valueOf(i), Integer.valueOf(i2), Boolean.valueOf(z))).booleanValue();
            }
        } else if ((i != i2 || i2 != this.t) && (strT = t(zxbVar)) != null) {
            if (i < 0 || i != i2 || i2 > strT.length()) {
                i = -1;
            }
            this.t = i;
            boolean z2 = strT.length() > 0;
            C(p(A(i3), z2 ? Integer.valueOf(this.t) : null, z2 ? Integer.valueOf(this.t) : null, z2 ? Integer.valueOf(strT.length()) : null, strT));
            G(i3);
            return true;
        }
        return false;
    }

    public final Rect M(float f, float f2, float f3, float f4) {
        long jFloatToRawIntBits = Float.floatToRawIntBits(f);
        long jFloatToRawIntBits2 = ((long) Float.floatToRawIntBits(f2)) & 4294967295L;
        mn mnVar = this.d;
        long jU = mnVar.u(jFloatToRawIntBits2 | (jFloatToRawIntBits << 32));
        long jU2 = mnVar.u((((long) Float.floatToRawIntBits(f4)) & 4294967295L) | (Float.floatToRawIntBits(f3) << 32));
        int i = (int) (jU >> 32);
        int i2 = (int) (jU2 >> 32);
        int i3 = (int) (jU & 4294967295L);
        int i4 = (int) (jU2 & 4294967295L);
        return new Rect((int) Math.floor(Math.min(Float.intBitsToFloat(i), Float.intBitsToFloat(i2))), (int) Math.floor(Math.min(Float.intBitsToFloat(i3), Float.intBitsToFloat(i4))), (int) Math.ceil(Math.max(Float.intBitsToFloat(i), Float.intBitsToFloat(i2))), (int) Math.ceil(Math.max(Float.intBitsToFloat(i3), Float.intBitsToFloat(i4))));
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x013b, code lost:
    
        r28 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0145, code lost:
    
        if (((r7 & ((~r7) << 6)) & r20) == 0) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0147, code lost:
    
        r25 = -1;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void Q() {
        /*
            Method dump skipped, instruction units count: 526
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sn.Q():void");
    }

    @Override // defpackage.l4
    public final zg7 b(View view) {
        return this.j;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void j(int i, y4 y4Var, String str, Bundle bundle) {
        zxb zxbVar;
        int i2;
        int i3;
        mn mnVar;
        RectF rectF;
        AccessibilityNodeInfo accessibilityNodeInfo = y4Var.a;
        byb bybVar = (byb) s().b(i);
        if (bybVar == null || (zxbVar = bybVar.a) == null) {
            return;
        }
        aq6 aq6Var = zxbVar.c;
        txb txbVar = zxbVar.d;
        f78 f78Var = txbVar.a;
        String strT = t(zxbVar);
        if (g76.L(str, this.D)) {
            int iD = this.B.d(i);
            if (iD != -1) {
                accessibilityNodeInfo.getExtras().putInt(str, iD);
                return;
            }
            return;
        }
        if (g76.L(str, this.E)) {
            int iD2 = this.C.d(i);
            if (iD2 != -1) {
                accessibilityNodeInfo.getExtras().putInt(str, iD2);
                return;
            }
            return;
        }
        boolean zC = f78Var.c(sxb.a);
        mn mnVar2 = this.d;
        eh8 eh8Var = null;
        if (zC && bundle != null && g76.L(str, "android.view.accessibility.extra.DATA_TEXT_CHARACTER_LOCATION_KEY")) {
            int i4 = bundle.getInt("android.view.accessibility.extra.DATA_TEXT_CHARACTER_LOCATION_ARG_START_INDEX", -1);
            int i5 = bundle.getInt("android.view.accessibility.extra.DATA_TEXT_CHARACTER_LOCATION_ARG_LENGTH", -1);
            if (i5 > 0 && i4 >= 0) {
                if (i4 < (strT != null ? strT.length() : Integer.MAX_VALUE)) {
                    qjd qjdVarD = en7.D(txbVar);
                    if (qjdVarD == null) {
                        return;
                    }
                    ArrayList arrayList = new ArrayList();
                    int i6 = 0;
                    while (i6 < i5) {
                        int i7 = i4 + i6;
                        if (i7 >= qjdVarD.a.a.b.length()) {
                            arrayList.add(eh8Var);
                            i2 = i4;
                            i3 = i5;
                            mnVar = mnVar2;
                        } else {
                            zwa zwaVarB = qjdVarD.b(i7);
                            eh8 eh8VarD = zxbVar.d();
                            long jI = 0;
                            if (eh8VarD != null) {
                                if (!eh8VarD.O0().n) {
                                    eh8VarD = eh8Var;
                                }
                                if (eh8VarD != null) {
                                    jI = eh8VarD.I(0L);
                                }
                            }
                            zwa zwaVarI = zwaVarB.i(jI);
                            zwa zwaVarG = zxbVar.g();
                            zwa zwaVarE = zwaVarI.g(zwaVarG) ? zwaVarI.e(zwaVarG) : eh8Var;
                            if (zwaVarE != 0) {
                                long jU = mnVar2.u((((long) Float.floatToRawIntBits(zwaVarE.b)) & 4294967295L) | (((long) Float.floatToRawIntBits(zwaVarE.a)) << 32));
                                mnVar = mnVar2;
                                long jU2 = mnVar.u((((long) Float.floatToRawIntBits(zwaVarE.d)) & 4294967295L) | (((long) Float.floatToRawIntBits(zwaVarE.c)) << 32));
                                int i8 = (int) (jU >> 32);
                                i2 = i4;
                                i3 = i5;
                                int i9 = (int) (jU2 >> 32);
                                int i10 = (int) (jU & 4294967295L);
                                int i11 = (int) (jU2 & 4294967295L);
                                rectF = new RectF(Math.min(Float.intBitsToFloat(i8), Float.intBitsToFloat(i9)), Math.min(Float.intBitsToFloat(i10), Float.intBitsToFloat(i11)), Math.max(Float.intBitsToFloat(i8), Float.intBitsToFloat(i9)), Math.max(Float.intBitsToFloat(i10), Float.intBitsToFloat(i11)));
                            } else {
                                i2 = i4;
                                i3 = i5;
                                mnVar = mnVar2;
                                rectF = null;
                            }
                            arrayList.add(rectF);
                        }
                        i6++;
                        i5 = i3;
                        mnVar2 = mnVar;
                        i4 = i2;
                        eh8Var = null;
                    }
                    accessibilityNodeInfo.getExtras().putParcelableArray(str, (Parcelable[]) arrayList.toArray(new RectF[0]));
                    return;
                }
            }
            Log.e("AccessibilityDelegate", "Invalid arguments for accessibility character locations");
            return;
        }
        iyb iybVar = eyb.A;
        if (f78Var.c(iybVar) && bundle != null && g76.L(str, "androidx.compose.ui.semantics.testTag")) {
            Object objG = f78Var.g(iybVar);
            String str2 = (String) (objG == null ? null : objG);
            if (str2 != null) {
                accessibilityNodeInfo.getExtras().putCharSequence(str, str2);
                return;
            }
            return;
        }
        if (g76.L(str, "androidx.compose.ui.semantics.id")) {
            accessibilityNodeInfo.getExtras().putInt(str, zxbVar.f);
            return;
        }
        if (g76.L(str, "androidx.compose.ui.semantics.shapeType")) {
            Object objG2 = f78Var.g(eyb.Q);
            m3c m3cVar = (m3c) (objG2 == null ? null : objG2);
            if (m3cVar != null) {
                Rect rect = new Rect();
                accessibilityNodeInfo.getBoundsInScreen(rect);
                zwa zwaVarU = u(zxbVar, rect, m3cVar);
                float f = zwaVarU.b;
                float f2 = zwaVarU.a;
                er7 er7VarA = m3cVar.a(zwaVarU.c(), aq6Var.z, mnVar2.getDensity());
                if (er7VarA instanceof ow8) {
                    accessibilityNodeInfo.getExtras().putInt("androidx.compose.ui.semantics.shapeType", 0);
                    accessibilityNodeInfo.getExtras().putParcelable("androidx.compose.ui.semantics.shapeRect", L(er7VarA, f2, f));
                    return;
                } else if (er7VarA instanceof pw8) {
                    accessibilityNodeInfo.getExtras().putInt("androidx.compose.ui.semantics.shapeType", 1);
                    accessibilityNodeInfo.getExtras().putParcelable("androidx.compose.ui.semantics.shapeRect", L(er7VarA, f2, f));
                    accessibilityNodeInfo.getExtras().putFloatArray("androidx.compose.ui.semantics.shapeCorners", N(er7VarA));
                    return;
                } else if (!(er7VarA instanceof nw8)) {
                    ygf.a();
                    return;
                } else {
                    accessibilityNodeInfo.getExtras().putInt("androidx.compose.ui.semantics.shapeType", 2);
                    accessibilityNodeInfo.getExtras().putParcelable("androidx.compose.ui.semantics.shapeRegion", O(er7VarA, f2, f));
                    return;
                }
            }
            return;
        }
        if (g76.L(str, "androidx.compose.ui.semantics.shapeRect")) {
            Object objG3 = f78Var.g(eyb.Q);
            m3c m3cVar2 = (m3c) (objG3 == null ? null : objG3);
            if (m3cVar2 != null) {
                Rect rect2 = new Rect();
                accessibilityNodeInfo.getBoundsInScreen(rect2);
                zwa zwaVarU2 = u(zxbVar, rect2, m3cVar2);
                Rect rectL = L(m3cVar2.a(zwaVarU2.c(), aq6Var.z, mnVar2.getDensity()), zwaVarU2.a, zwaVarU2.b);
                if (rectL != null) {
                    accessibilityNodeInfo.getExtras().putParcelable("androidx.compose.ui.semantics.shapeRect", rectL);
                    return;
                }
                return;
            }
            return;
        }
        if (g76.L(str, "androidx.compose.ui.semantics.shapeCorners")) {
            Object objG4 = f78Var.g(eyb.Q);
            m3c m3cVar3 = (m3c) (objG4 == null ? null : objG4);
            if (m3cVar3 != null) {
                Rect rect3 = new Rect();
                accessibilityNodeInfo.getBoundsInScreen(rect3);
                float[] fArrN = N(m3cVar3.a(u(zxbVar, rect3, m3cVar3).c(), aq6Var.z, mnVar2.getDensity()));
                if (fArrN != null) {
                    accessibilityNodeInfo.getExtras().putFloatArray("androidx.compose.ui.semantics.shapeCorners", fArrN);
                    return;
                }
                return;
            }
            return;
        }
        if (g76.L(str, "androidx.compose.ui.semantics.shapeRegion")) {
            Object objG5 = f78Var.g(eyb.Q);
            m3c m3cVar4 = (m3c) (objG5 == null ? null : objG5);
            if (m3cVar4 != null) {
                Rect rect4 = new Rect();
                accessibilityNodeInfo.getBoundsInScreen(rect4);
                zwa zwaVarU3 = u(zxbVar, rect4, m3cVar4);
                Region regionO = O(m3cVar4.a(zwaVarU3.c(), aq6Var.z, mnVar2.getDensity()), zwaVarU3.a, zwaVarU3.b);
                if (regionO != null) {
                    accessibilityNodeInfo.getExtras().putParcelable("androidx.compose.ui.semantics.shapeRegion", regionO);
                }
            }
        }
    }

    public final Rect k(byb bybVar) {
        o46 o46Var = bybVar.b;
        return M(o46Var.a, o46Var.b, o46Var.c, o46Var.d);
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00bb, code lost:
    
        if (defpackage.gsa.X(r7, r0) == r1) goto L41;
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x006f A[Catch: all -> 0x0032, TryCatch #0 {all -> 0x0032, blocks: (B:13:0x002c, B:24:0x0056, B:28:0x0067, B:30:0x006f, B:32:0x0078, B:34:0x007d, B:35:0x008c, B:38:0x009b, B:39:0x00a2, B:20:0x0040, B:23:0x0047), top: B:46:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00bb -> B:14:0x002f). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(defpackage.p92 r11) {
        /*
            r10 = this;
            boolean r0 = r11 instanceof defpackage.pn
            if (r0 == 0) goto L13
            r0 = r11
            pn r0 = (defpackage.pn) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            pn r0 = new pn
            r0.<init>(r10, r11)
        L18:
            java.lang.Object r11 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            d80 r4 = r10.v
            r5 = 1
            if (r2 == 0) goto L44
            if (r2 == r5) goto L3c
            if (r2 != r3) goto L35
            pz0 r2 = r0.c
            l68 r6 = r0.b
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L32
        L2f:
            r11 = r6
            r6 = r2
            goto L56
        L32:
            r10 = move-exception
            goto Lc4
        L35:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L3c:
            pz0 r2 = r0.c
            l68 r6 = r0.b
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L32
            goto L67
        L44:
            defpackage.br7.v(r11)
            l68 r11 = new l68     // Catch: java.lang.Throwable -> L32
            r11.<init>()     // Catch: java.lang.Throwable -> L32
            uz0 r2 = r10.w     // Catch: java.lang.Throwable -> L32
            r2.getClass()     // Catch: java.lang.Throwable -> L32
            pz0 r6 = new pz0     // Catch: java.lang.Throwable -> L32
            r6.<init>(r2)     // Catch: java.lang.Throwable -> L32
        L56:
            r0.b = r11     // Catch: java.lang.Throwable -> L32
            r0.c = r6     // Catch: java.lang.Throwable -> L32
            r0.f = r5     // Catch: java.lang.Throwable -> L32
            java.lang.Object r2 = r6.b(r0)     // Catch: java.lang.Throwable -> L32
            if (r2 != r1) goto L63
            goto Lbd
        L63:
            r9 = r6
            r6 = r11
            r11 = r2
            r2 = r9
        L67:
            java.lang.Boolean r11 = (java.lang.Boolean) r11     // Catch: java.lang.Throwable -> L32
            boolean r11 = r11.booleanValue()     // Catch: java.lang.Throwable -> L32
            if (r11 == 0) goto Lbe
            r2.c()     // Catch: java.lang.Throwable -> L32
            boolean r11 = r10.v()     // Catch: java.lang.Throwable -> L32
            if (r11 == 0) goto La2
            int r11 = r4.c     // Catch: java.lang.Throwable -> L32
            r7 = 0
        L7b:
            if (r7 >= r11) goto L8c
            java.lang.Object[] r8 = r4.b     // Catch: java.lang.Throwable -> L32
            r8 = r8[r7]     // Catch: java.lang.Throwable -> L32
            aq6 r8 = (defpackage.aq6) r8     // Catch: java.lang.Throwable -> L32
            r10.I(r8, r6)     // Catch: java.lang.Throwable -> L32
            r10.J(r8)     // Catch: java.lang.Throwable -> L32
            int r7 = r7 + 1
            goto L7b
        L8c:
            r6.b()     // Catch: java.lang.Throwable -> L32
            mn r11 = r10.d     // Catch: java.lang.Throwable -> L32
            android.os.Handler r11 = r11.getHandler()     // Catch: java.lang.Throwable -> L32
            boolean r7 = r10.I     // Catch: java.lang.Throwable -> L32
            if (r7 != 0) goto La2
            if (r11 == 0) goto La2
            r10.I = r5     // Catch: java.lang.Throwable -> L32
            v0 r7 = r10.K     // Catch: java.lang.Throwable -> L32
            r11.post(r7)     // Catch: java.lang.Throwable -> L32
        La2:
            r4.clear()     // Catch: java.lang.Throwable -> L32
            k68 r11 = r10.p     // Catch: java.lang.Throwable -> L32
            r11.c()     // Catch: java.lang.Throwable -> L32
            k68 r11 = r10.q     // Catch: java.lang.Throwable -> L32
            r11.c()     // Catch: java.lang.Throwable -> L32
            long r7 = r10.h     // Catch: java.lang.Throwable -> L32
            r0.b = r6     // Catch: java.lang.Throwable -> L32
            r0.c = r2     // Catch: java.lang.Throwable -> L32
            r0.f = r3     // Catch: java.lang.Throwable -> L32
            java.lang.Object r11 = defpackage.gsa.X(r7, r0)     // Catch: java.lang.Throwable -> L32
            if (r11 != r1) goto L2f
        Lbd:
            return r1
        Lbe:
            r4.clear()
            c1e r10 = defpackage.c1e.a
            return r10
        Lc4:
            r4.clear()
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sn.l(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00f9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean m(int r22, long r23, boolean r25) {
        /*
            Method dump skipped, instruction units count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sn.m(int, long, boolean):boolean");
    }

    public final void n() {
        Trace.beginSection("sendAccessibilitySemanticsStructureChangeEvents");
        try {
            if (v()) {
                B(this.d.getSemanticsOwner().a(), this.H);
            }
            Trace.endSection();
            Trace.beginSection("sendSemanticsPropertyChangeEvents");
            try {
                H(s());
                Trace.endSection();
                Trace.beginSection("updateSemanticsNodesCopyAndPanes");
                try {
                    Q();
                } finally {
                }
            } finally {
            }
        } finally {
        }
    }

    public final AccessibilityEvent o(int i, int i2) {
        byb bybVar;
        AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(i2);
        accessibilityEventObtain.setEnabled(true);
        accessibilityEventObtain.setClassName("android.view.View");
        mn mnVar = this.d;
        accessibilityEventObtain.setPackageName(mnVar.getContext().getPackageName());
        accessibilityEventObtain.setSource(mnVar, i);
        if (v() && (bybVar = (byb) s().b(i)) != null) {
            zxb zxbVar = bybVar.a;
            accessibilityEventObtain.setPassword(zxbVar.d.a.c(eyb.L));
            Object objG = zxbVar.d.a.g(eyb.o);
            if (objG == null) {
                objG = null;
            }
            boolean zL = g76.L(objG, Boolean.TRUE);
            if (Build.VERSION.SDK_INT >= 34) {
                m4.D(accessibilityEventObtain, zL);
            }
        }
        return accessibilityEventObtain;
    }

    @Override // android.view.accessibility.AccessibilityManager.AccessibilityStateChangeListener
    public final void onAccessibilityStateChanged(boolean z) {
        this.i = null;
    }

    @Override // android.view.accessibility.AccessibilityManager.TouchExplorationStateChangeListener
    public final void onTouchExplorationStateChanged(boolean z) {
        this.i = null;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        AccessibilityManager accessibilityManager = this.g;
        if (accessibilityManager.isEnabled()) {
            this.i = null;
        }
        accessibilityManager.addAccessibilityStateChangeListener(this);
        accessibilityManager.addTouchExplorationStateChangeListener(this);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        Handler handler = this.d.getHandler();
        handler.getClass();
        handler.removeCallbacks(this.K);
        AccessibilityManager accessibilityManager = this.g;
        accessibilityManager.removeAccessibilityStateChangeListener(this);
        accessibilityManager.removeTouchExplorationStateChangeListener(this);
    }

    public final AccessibilityEvent p(int i, Integer num, Integer num2, Integer num3, CharSequence charSequence) {
        AccessibilityEvent accessibilityEventO = o(i, 8192);
        if (num != null) {
            accessibilityEventO.setFromIndex(num.intValue());
        }
        if (num2 != null) {
            accessibilityEventO.setToIndex(num2.intValue());
        }
        if (num3 != null) {
            accessibilityEventO.setItemCount(num3.intValue());
        }
        if (charSequence != null) {
            accessibilityEventO.getText().add(charSequence);
        }
        return accessibilityEventO;
    }

    public final int q(zxb zxbVar) {
        txb txbVar = zxbVar.d;
        if (!txbVar.a.c(eyb.a)) {
            iyb iybVar = eyb.H;
            if (txbVar.a.c(iybVar)) {
                return (int) (((bkd) txbVar.m(iybVar)).a & 4294967295L);
            }
        }
        return this.t;
    }

    public final int r(zxb zxbVar) {
        txb txbVar = zxbVar.d;
        if (!txbVar.a.c(eyb.a)) {
            iyb iybVar = eyb.H;
            if (txbVar.a.c(iybVar)) {
                return (int) (((bkd) txbVar.m(iybVar)).a >> 32);
            }
        }
        return this.t;
    }

    public final i46 s() {
        if (this.x) {
            this.x = false;
            mn mnVar = this.d;
            this.z = kng.z(mnVar.getSemanticsOwner(), fn.c);
            if (v()) {
                k68 k68Var = this.z;
                Resources resources = mnVar.getContext().getResources();
                i68 i68Var = this.B;
                i68Var.a();
                i68 i68Var2 = this.C;
                i68Var2.a();
                byb bybVar = (byb) k68Var.b(-1);
                zxb zxbVar = bybVar != null ? bybVar.a : null;
                zxbVar.getClass();
                ArrayList arrayListB = kyb.b(zxbVar, new ce(3, k68Var), new ce(4, resources), d46.Q(zxbVar));
                int i = 1;
                int size = arrayListB.size() - 1;
                if (1 <= size) {
                    while (true) {
                        int i2 = ((zxb) arrayListB.get(i - 1)).f;
                        int i3 = ((zxb) arrayListB.get(i)).f;
                        i68Var.f(i2, i3);
                        i68Var2.f(i3, i2);
                        if (i == size) {
                            break;
                        }
                        i++;
                    }
                }
            }
        }
        return this.z;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0075 A[LOOP:0: B:4:0x0016->B:36:0x0075, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0078 A[EDGE_INSN: B:47:0x0078->B:37:0x0078 BREAK  A[LOOP:0: B:4:0x0016->B:36:0x0075], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.zwa u(defpackage.zxb r10, android.graphics.Rect r11, defpackage.m3c r12) {
        /*
            r9 = this;
            qn r0 = new qn
            r0.<init>(r12)
            aq6 r10 = r10.c
            hj0 r12 = r10.F
            java.lang.Object r12 = r12.g
            q28 r12 = (defpackage.q28) r12
            int r1 = r12.d
            r1 = r1 & 8
            r2 = 0
            r3 = 1
            r4 = 0
            if (r1 == 0) goto L78
        L16:
            if (r12 == 0) goto L78
            int r1 = r12.c
            r1 = r1 & 8
            if (r1 == 0) goto L6f
            r1 = r12
            r5 = r2
        L20:
            if (r1 == 0) goto L6f
            boolean r6 = r1 instanceof defpackage.xxb
            if (r6 == 0) goto L32
            r6 = r1
            xxb r6 = (defpackage.xxb) r6
            r6.r0(r0)
            boolean r6 = r0.a
            if (r6 == 0) goto L6a
            r2 = r1
            goto L78
        L32:
            int r6 = r1.c
            r6 = r6 & 8
            if (r6 == 0) goto L6a
            boolean r6 = r1 instanceof defpackage.b43
            if (r6 == 0) goto L6a
            r6 = r1
            b43 r6 = (defpackage.b43) r6
            q28 r6 = r6.p
            r7 = r4
        L42:
            if (r6 == 0) goto L67
            int r8 = r6.c
            r8 = r8 & 8
            if (r8 == 0) goto L64
            int r7 = r7 + 1
            if (r7 != r3) goto L50
            r1 = r6
            goto L64
        L50:
            if (r5 != 0) goto L5b
            o78 r5 = new o78
            r8 = 16
            q28[] r8 = new defpackage.q28[r8]
            r5.<init>(r8)
        L5b:
            if (r1 == 0) goto L61
            r5.b(r1)
            r1 = r2
        L61:
            r5.b(r6)
        L64:
            q28 r6 = r6.f
            goto L42
        L67:
            if (r7 != r3) goto L6a
            goto L20
        L6a:
            q28 r1 = defpackage.flb.q0(r5)
            goto L20
        L6f:
            int r1 = r12.d
            r1 = r1 & 8
            if (r1 == 0) goto L78
            q28 r12 = r12.f
            goto L16
        L78:
            xxb r2 = (defpackage.xxb) r2
            if (r2 == 0) goto Lbb
            r12 = r2
            q28 r12 = (defpackage.q28) r12
            q28 r12 = r12.a
            boolean r12 = r12.n
            if (r12 != r3) goto Lbb
            eh8 r10 = defpackage.flb.u0(r2)
            hp6 r12 = defpackage.sgg.K(r10)
            zwa r10 = r12.H(r10, r4)
            float r12 = r10.a
            float r0 = r10.b
            float r1 = r10.c
            float r10 = r10.d
            android.graphics.Rect r9 = r9.M(r12, r0, r1, r10)
            int r10 = r9.left
            int r12 = r11.left
            int r10 = r10 - r12
            float r10 = (float) r10
            int r12 = r9.top
            int r11 = r11.top
            int r12 = r12 - r11
            float r11 = (float) r12
            zwa r12 = new zwa
            int r0 = r9.width()
            float r0 = (float) r0
            float r0 = r0 + r10
            int r9 = r9.height()
            float r9 = (float) r9
            float r9 = r9 + r11
            r12.<init>(r10, r11, r0, r9)
            return r12
        Lbb:
            hj0 r9 = r10.F
            java.lang.Object r9 = r9.e
            eh8 r9 = (defpackage.eh8) r9
            zwa r9 = defpackage.sgg.B(r9, r4)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sn.u(zxb, android.graphics.Rect, m3c):zwa");
    }

    public final boolean v() {
        AccessibilityManager accessibilityManager = this.g;
        if (!accessibilityManager.isEnabled()) {
            return false;
        }
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList = this.i;
        if (enabledAccessibilityServiceList == null) {
            enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(-1);
            this.i = enabledAccessibilityServiceList;
        }
        return !enabledAccessibilityServiceList.isEmpty();
    }

    public final void w(aq6 aq6Var) {
        if (this.v.add(aq6Var)) {
            this.w.e(c1e.a);
        }
    }
}
