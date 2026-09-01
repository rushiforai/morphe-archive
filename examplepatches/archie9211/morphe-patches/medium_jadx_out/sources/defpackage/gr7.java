package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.Window;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.play.core.common.PlayCoreDialogWrapperActivity;
import com.medium.android.core.push.MediumPushNotification;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.donkey.push.gcm.MediumPushNotificationWorker;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class gr7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;
    public static final /* synthetic */ int f = 0;
    public static final /* synthetic */ int g = 0;

    public static final boolean A(int i, vt vtVar, es4 es4Var, zwa zwaVar) {
        es4 es4VarJ;
        o78 o78Var = new o78(new es4[16]);
        if (!es4Var.a.n) {
            b26.b("visitChildren called on an unattached node");
        }
        o78 o78Var2 = new o78(new q28[16]);
        q28 q28Var = es4Var.a;
        q28 q28Var2 = q28Var.f;
        if (q28Var2 == null) {
            flb.X(o78Var2, q28Var);
        } else {
            o78Var2.b(q28Var2);
        }
        while (true) {
            int i2 = o78Var2.c;
            if (i2 == 0) {
                break;
            }
            q28 q28VarQ0 = (q28) o78Var2.m(i2 - 1);
            if ((q28VarQ0.d & 1024) == 0) {
                flb.X(o78Var2, q28VarQ0);
            } else {
                while (true) {
                    if (q28VarQ0 == null) {
                        break;
                    }
                    if ((q28VarQ0.c & 1024) != 0) {
                        o78 o78Var3 = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof es4) {
                                es4 es4Var2 = (es4) q28VarQ0;
                                if (es4Var2.n) {
                                    o78Var.b(es4Var2);
                                }
                            } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                int i3 = 0;
                                for (q28 q28Var3 = ((b43) q28VarQ0).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                    if ((q28Var3.c & 1024) != 0) {
                                        i3++;
                                        if (i3 == 1) {
                                            q28VarQ0 = q28Var3;
                                        } else {
                                            if (o78Var3 == null) {
                                                o78Var3 = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var3.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var3.b(q28Var3);
                                        }
                                    }
                                }
                                if (i3 == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var3);
                        }
                    } else {
                        q28VarQ0 = q28VarQ0.f;
                    }
                }
            }
        }
        while (o78Var.c != 0 && (es4VarJ = j(o78Var, zwaVar, i)) != null) {
            if (es4VarJ.K0().a) {
                return ((Boolean) vtVar.invoke(es4VarJ)).booleanValue();
            }
            if (l(i, vtVar, es4VarJ, zwaVar)) {
                return true;
            }
            o78Var.l(es4VarJ);
        }
        return false;
    }

    public static void B(Window window, boolean z) {
        int i = Build.VERSION.SDK_INT;
        if (i >= 35) {
            u4.m(window, z);
        } else {
            if (i >= 30) {
                u4.l(window, z);
                return;
            }
            View decorView = window.getDecorView();
            int systemUiVisibility = decorView.getSystemUiVisibility();
            decorView.setSystemUiVisibility(z ? systemUiVisibility & (-1793) : systemUiVisibility | 1792);
        }
    }

    public static final long C(zwa zwaVar) {
        float f2 = zwaVar.c - zwaVar.a;
        return (((long) Float.floatToRawIntBits(zwaVar.d - zwaVar.b)) & 4294967295L) | (Float.floatToRawIntBits(f2) << 32);
    }

    public static final int D(j68 j68Var) {
        int iC;
        int i = j68Var.b;
        int iC2 = j68Var.c(0);
        while (j68Var.b != 0 && j68Var.c(0) == iC2) {
            j68Var.f(0, j68Var.d());
            j68Var.e(j68Var.b - 1);
            int i2 = j68Var.b;
            int i3 = i2 >>> 1;
            int i4 = 0;
            while (i4 < i3) {
                int iC3 = j68Var.c(i4);
                int i5 = (i4 + 1) * 2;
                int i6 = i5 - 1;
                int iC4 = j68Var.c(i6);
                if (i5 >= i2 || (iC = j68Var.c(i5)) <= iC4) {
                    if (iC4 > iC3) {
                        j68Var.f(i4, iC4);
                        j68Var.f(i6, iC3);
                        i4 = i6;
                    }
                } else if (iC > iC3) {
                    j68Var.f(i4, iC);
                    j68Var.f(i5, iC3);
                    i4 = i5;
                }
            }
        }
        return iC2;
    }

    public static final Boolean E(int i, vt vtVar, es4 es4Var, zwa zwaVar) {
        zr4 zr4VarN0 = es4Var.N0();
        int[] iArr = fud.a;
        int i2 = iArr[zr4VarN0.ordinal()];
        if (i2 != 1) {
            if (i2 == 2 || i2 == 3) {
                return Boolean.valueOf(k(es4Var, i, vtVar));
            }
            if (i2 == 4) {
                return es4Var.K0().a ? (Boolean) vtVar.invoke(es4Var) : zwaVar == null ? Boolean.valueOf(k(es4Var, i, vtVar)) : Boolean.valueOf(A(i, vtVar, es4Var, zwaVar));
            }
            ygf.a();
            return null;
        }
        es4 es4VarO = rx0.O(es4Var);
        if (es4VarO == null) {
            ygf.f("ActiveParent must have a focusedChild");
            return null;
        }
        int i3 = iArr[es4VarO.N0().ordinal()];
        if (i3 != 1) {
            if (i3 == 2 || i3 == 3) {
                if (zwaVar == null) {
                    zwaVar = rx0.N(es4VarO);
                }
                return Boolean.valueOf(l(i, vtVar, es4Var, zwaVar));
            }
            if (i3 != 4) {
                ygf.a();
                return null;
            }
            ygf.f("ActiveParent must have a focusedChild");
            return null;
        }
        Boolean boolE = E(i, vtVar, es4VarO, zwaVar);
        if (!g76.L(boolE, Boolean.FALSE)) {
            return boolE;
        }
        if (zwaVar == null) {
            if (es4VarO.N0() != zr4.ActiveParent) {
                ygf.f("Searching for active node in inactive hierarchy");
                return null;
            }
            es4 es4VarM = rx0.M(es4VarO);
            if (es4VarM == null) {
                ygf.f("ActiveParent must have a focusedChild");
                return null;
            }
            zwaVar = rx0.N(es4VarM);
        }
        return Boolean.valueOf(l(i, vtVar, es4Var, zwaVar));
    }

    public static final u50 F(uz uzVar) {
        uzVar.getClass();
        return new u50(12, new zo5(uzVar, null, 7));
    }

    public static int G(int i) {
        return (int) (((long) Integer.rotateLeft((int) (((long) i) * (-862048943)), 15)) * 461845907);
    }

    public static int I(Object obj) {
        return G(obj == null ? 0 : obj.hashCode());
    }

    public static final void a(boolean z, mcb mcbVar, lid lidVar, x12 x12Var, int i) {
        int i2;
        rjd rjdVarD;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1344558920);
        if ((i & 6) == 0) {
            i2 = (p65Var.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.d(mcbVar.ordinal()) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(lidVar) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            int i3 = i2 & 14;
            boolean zF = (i3 == 4) | p65Var.f(lidVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new iid(lidVar, z);
                p65Var.j0(objM);
            }
            rhd rhdVar = (rhd) objM;
            boolean zH = (i3 == 4) | p65Var.h(lidVar);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new mid(lidVar, z);
                p65Var.j0(objM2);
            }
            lp8 lp8Var = (lp8) objM2;
            boolean zG = bkd.g(lidVar.l().b);
            int i4 = (int) (z ? lidVar.l().b >> 32 : lidVar.l().b & 4294967295L);
            kx6 kx6Var = lidVar.d;
            float fE = 0.0f;
            if (kx6Var != null && (rjdVarD = kx6Var.d()) != null) {
                qjd qjdVar = rjdVarD.a;
                if (i4 >= 0) {
                    pjd pjdVar = qjdVar.a;
                    f58 f58Var = qjdVar.b;
                    if (pjdVar.a.b.length() != 0) {
                        int iMin = Math.min(f58Var.d(i4), Math.min(f58Var.b - 1, f58Var.f - 1));
                        if (i4 <= f58Var.c(iMin, false)) {
                            f58Var.m(iMin);
                            ArrayList arrayList = f58Var.h;
                            y19 y19Var = (y19) arrayList.get(mk7.s(iMin, arrayList));
                            wq wqVar = y19Var.a;
                            int i5 = iMin - y19Var.d;
                            ojd ojdVar = wqVar.d;
                            fE = ojdVar.e(i5) - ojdVar.g(i5);
                        }
                    }
                }
            }
            float f2 = fE;
            boolean zH2 = p65Var.h(rhdVar);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                objM3 = new dp(9, rhdVar);
                p65Var.j0(objM3);
            }
            g01.A(lp8Var, z, mcbVar, zG, 0L, f2, new q4d(rhdVar, null, (PointerInputEventHandler) objM3, 6), p65Var, (i2 << 3) & PhotoshopDirectory.TAG_CAPTION);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s81(z, mcbVar, lidVar, i);
        }
    }

    public static final ArrayList b(ArrayList arrayList) {
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            yhf yhfVar = (yhf) it2.next();
            Bundle bundle = new Bundle();
            bundle.putInt("event_type", yhfVar.a);
            bundle.putLong("event_timestamp", yhfVar.b);
            arrayList2.add(bundle);
        }
        return arrayList2;
    }

    public static final void c(j68 j68Var, int i) {
        if (j68Var.b == 0 || !(j68Var.c(0) == i || j68Var.c(j68Var.b - 1) == i)) {
            int i2 = j68Var.b;
            j68Var.a(i);
            while (i2 > 0) {
                int i3 = ((i2 + 1) >>> 1) - 1;
                int iC = j68Var.c(i3);
                if (i <= iC) {
                    break;
                }
                j68Var.f(i2, iC);
                i2 = i3;
            }
            j68Var.f(i2, i);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0033, code lost:
    
        if (r11 >= r2) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003a, code lost:
    
        if (r10 <= r7) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0041, code lost:
    
        if (r9 >= r6) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0048, code lost:
    
        if (r8 <= r5) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004a, code lost:
    
        if (r21 != 3) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x004d, code lost:
    
        if (r21 != 4) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x004f, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0050, code lost:
    
        if (r21 != 3) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0052, code lost:
    
        r1 = r11 - r19.c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0057, code lost:
    
        if (r21 != 4) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0059, code lost:
    
        r1 = r19.a - r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x005d, code lost:
    
        if (r21 != 5) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005f, code lost:
    
        r1 = r9 - r19.d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0064, code lost:
    
        if (r21 != 6) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0066, code lost:
    
        r1 = r19.b - r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x006d, code lost:
    
        if (r1 >= 0.0f) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x006f, code lost:
    
        r1 = 0.0f;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0071, code lost:
    
        if (r21 != 3) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0073, code lost:
    
        r11 = r11 - r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0075, code lost:
    
        if (r21 != 4) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0077, code lost:
    
        r11 = r2 - r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x007a, code lost:
    
        if (r21 != 5) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x007c, code lost:
    
        r11 = r9 - r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x007f, code lost:
    
        if (r21 != 6) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0081, code lost:
    
        r11 = r6 - r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0087, code lost:
    
        if (r11 >= 1.0f) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0089, code lost:
    
        r11 = 1.0f;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x008c, code lost:
    
        if (r1 >= r11) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x008e, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x008f, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0090, code lost:
    
        defpackage.ygf.f("This function should only be used for 2-D focus search");
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0093, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0094, code lost:
    
        defpackage.ygf.f("This function should only be used for 2-D focus search");
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0097, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0098, code lost:
    
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean d(defpackage.zwa r18, defpackage.zwa r19, defpackage.zwa r20, int r21) {
        /*
            r0 = r18
            r1 = r19
            r2 = r20
            r3 = r21
            boolean r4 = e(r3, r2, r0)
            float r5 = r2.b
            float r6 = r2.d
            float r7 = r2.a
            float r2 = r2.c
            float r8 = r0.d
            float r9 = r0.b
            float r10 = r0.c
            float r11 = r0.a
            r12 = 0
            if (r4 != 0) goto L9c
            boolean r0 = e(r3, r1, r0)
            if (r0 != 0) goto L27
            goto L9c
        L27:
            java.lang.String r4 = "This function should only be used for 2-D focus search"
            r13 = 6
            r14 = 5
            r15 = 4
            r18 = 1
            r0 = 3
            if (r3 != r0) goto L36
            int r16 = (r11 > r2 ? 1 : (r11 == r2 ? 0 : -1))
            if (r16 < 0) goto L98
            goto L4a
        L36:
            if (r3 != r15) goto L3d
            int r16 = (r10 > r7 ? 1 : (r10 == r7 ? 0 : -1))
            if (r16 > 0) goto L98
            goto L4a
        L3d:
            if (r3 != r14) goto L44
            int r16 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
            if (r16 < 0) goto L98
            goto L4a
        L44:
            if (r3 != r13) goto L99
            int r16 = (r8 > r5 ? 1 : (r8 == r5 ? 0 : -1))
            if (r16 > 0) goto L98
        L4a:
            if (r3 != r0) goto L4d
            goto L4f
        L4d:
            if (r3 != r15) goto L50
        L4f:
            return r18
        L50:
            if (r3 != r0) goto L57
            float r1 = r1.c
            float r1 = r11 - r1
            goto L69
        L57:
            if (r3 != r15) goto L5d
            float r1 = r1.a
            float r1 = r1 - r10
            goto L69
        L5d:
            if (r3 != r14) goto L64
            float r1 = r1.d
            float r1 = r9 - r1
            goto L69
        L64:
            if (r3 != r13) goto L94
            float r1 = r1.b
            float r1 = r1 - r8
        L69:
            r16 = 0
            int r17 = (r1 > r16 ? 1 : (r1 == r16 ? 0 : -1))
            if (r17 >= 0) goto L71
            r1 = r16
        L71:
            if (r3 != r0) goto L75
            float r11 = r11 - r7
            goto L83
        L75:
            if (r3 != r15) goto L7a
            float r11 = r2 - r10
            goto L83
        L7a:
            if (r3 != r14) goto L7f
            float r11 = r9 - r5
            goto L83
        L7f:
            if (r3 != r13) goto L90
            float r11 = r6 - r8
        L83:
            r0 = 1065353216(0x3f800000, float:1.0)
            int r2 = (r11 > r0 ? 1 : (r11 == r0 ? 0 : -1))
            if (r2 >= 0) goto L8a
            r11 = r0
        L8a:
            int r0 = (r1 > r11 ? 1 : (r1 == r11 ? 0 : -1))
            if (r0 >= 0) goto L8f
            return r18
        L8f:
            return r12
        L90:
            defpackage.ygf.f(r4)
            return r12
        L94:
            defpackage.ygf.f(r4)
            return r12
        L98:
            return r18
        L99:
            defpackage.ygf.f(r4)
        L9c:
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gr7.d(zwa, zwa, zwa, int):boolean");
    }

    public static final boolean e(int i, zwa zwaVar, zwa zwaVar2) {
        if (i == 3 || i == 4) {
            return zwaVar.d > zwaVar2.b && zwaVar.b < zwaVar2.d;
        }
        if (i == 5 || i == 6) {
            return zwaVar.c > zwaVar2.a && zwaVar.a < zwaVar2.c;
        }
        ygf.f("This function should only be used for 2-D focus search");
        return false;
    }

    public static final String f(fb6 fb6Var, xzb xzbVar) {
        xzbVar.getClass();
        fb6Var.getClass();
        for (Annotation annotation : xzbVar.getAnnotations()) {
            if (annotation instanceof tb6) {
                return ((tb6) annotation).discriminator();
            }
        }
        return (String) fb6Var.a.c;
    }

    public static final void g(es4 es4Var, o78 o78Var) {
        if (!es4Var.a.n) {
            b26.b("visitChildren called on an unattached node");
        }
        o78 o78Var2 = new o78(new q28[16]);
        q28 q28Var = es4Var.a;
        q28 q28Var2 = q28Var.f;
        if (q28Var2 == null) {
            flb.X(o78Var2, q28Var);
        } else {
            o78Var2.b(q28Var2);
        }
        while (true) {
            int i = o78Var2.c;
            if (i == 0) {
                return;
            }
            q28 q28VarQ0 = (q28) o78Var2.m(i - 1);
            if ((q28VarQ0.d & 1024) == 0) {
                flb.X(o78Var2, q28VarQ0);
            } else {
                while (true) {
                    if (q28VarQ0 == null) {
                        break;
                    }
                    if ((q28VarQ0.c & 1024) != 0) {
                        o78 o78Var3 = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof es4) {
                                es4 es4Var2 = (es4) q28VarQ0;
                                if (es4Var2.n && !flb.v0(es4Var2).Q) {
                                    if (es4Var2.K0().a) {
                                        o78Var.b(es4Var2);
                                    } else {
                                        g(es4Var2, o78Var);
                                    }
                                }
                            } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                int i2 = 0;
                                for (q28 q28Var3 = ((b43) q28VarQ0).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                    if ((q28Var3.c & 1024) != 0) {
                                        i2++;
                                        if (i2 == 1) {
                                            q28VarQ0 = q28Var3;
                                        } else {
                                            if (o78Var3 == null) {
                                                o78Var3 = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var3.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var3.b(q28Var3);
                                        }
                                    }
                                }
                                if (i2 == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var3);
                        }
                    } else {
                        q28VarQ0 = q28VarQ0.f;
                    }
                }
            }
        }
    }

    public static final Object i(h68 h68Var, yd4 yd4Var) {
        yd4Var.getClass();
        return h68Var.a(new zd4(p(yd4Var)));
    }

    public static final es4 j(o78 o78Var, zwa zwaVar, int i) {
        zwa zwaVarH;
        es4 es4Var = null;
        if (i == 3) {
            zwaVarH = zwaVar.h((zwaVar.c - zwaVar.a) + 1.0f, 0.0f);
        } else if (i == 4) {
            zwaVarH = zwaVar.h(-((zwaVar.c - zwaVar.a) + 1.0f), 0.0f);
        } else if (i == 5) {
            zwaVarH = zwaVar.h(0.0f, (zwaVar.d - zwaVar.b) + 1.0f);
        } else {
            if (i != 6) {
                ygf.f("This function should only be used for 2-D focus search");
                return null;
            }
            zwaVarH = zwaVar.h(0.0f, -((zwaVar.d - zwaVar.b) + 1.0f));
        }
        Object[] objArr = o78Var.a;
        int i2 = o78Var.c;
        for (int i3 = 0; i3 < i2; i3++) {
            es4 es4Var2 = (es4) objArr[i3];
            if (rx0.Q(es4Var2)) {
                zwa zwaVarN = rx0.N(es4Var2);
                if (q(zwaVarN, zwaVarH, zwaVar, i)) {
                    es4Var = es4Var2;
                    zwaVarH = zwaVarN;
                }
            }
        }
        return es4Var;
    }

    public static final boolean k(es4 es4Var, int i, x45 x45Var) {
        zwa zwaVar;
        o78 o78Var = new o78(new es4[16]);
        g(es4Var, o78Var);
        int i2 = o78Var.c;
        if (i2 <= 1) {
            es4 es4Var2 = (es4) (i2 == 0 ? null : o78Var.a[0]);
            if (es4Var2 != null) {
                return ((Boolean) x45Var.invoke(es4Var2)).booleanValue();
            }
        } else {
            if (i == 7) {
                i = 4;
            }
            if (i == 4 || i == 6) {
                zwa zwaVarN = rx0.N(es4Var);
                float f2 = zwaVarN.a;
                float f3 = zwaVarN.b;
                zwaVar = new zwa(f2, f3, f2, f3);
            } else {
                if (i != 3 && i != 5) {
                    ygf.f("This function should only be used for 2-D focus search");
                    return false;
                }
                zwa zwaVarN2 = rx0.N(es4Var);
                float f4 = zwaVarN2.c;
                float f5 = zwaVarN2.d;
                zwaVar = new zwa(f4, f5, f4, f5);
            }
            es4 es4VarJ = j(o78Var, zwaVar, i);
            if (es4VarJ != null) {
                return ((Boolean) x45Var.invoke(es4VarJ)).booleanValue();
            }
        }
        return false;
    }

    public static final boolean l(int i, vt vtVar, es4 es4Var, zwa zwaVar) {
        if (A(i, vtVar, es4Var, zwaVar)) {
            return true;
        }
        Boolean bool = (Boolean) kyd.g0(es4Var, i, new st8(((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).f(), es4Var, zwaVar, i, vtVar, 1));
        if (bool != null) {
            return bool.booleanValue();
        }
        return false;
    }

    public static final m00 m(e00 e00Var) {
        Object next;
        e00Var.getClass();
        Iterator it2 = e00Var.e.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((g00) next) instanceof sz) {
                break;
            }
        }
        g00 g00Var = (g00) next;
        if (g00Var != null) {
            return ((sz) g00Var).a;
        }
        ygf.f("no cache configured");
        return null;
    }

    public static final th3 n(rx5 rx5Var, o33 o33Var) {
        rfd rfdVar = rx5Var.c;
        if (!(rfdVar instanceof fy5)) {
            return new zm7(21, o33Var);
        }
        wve wveVarT = yo7.t(((fy5) rfdVar).b);
        synchronized (wveVarT) {
            mv2 mv2Var = wveVarT.a;
            if (mv2Var != null) {
                Bitmap.Config[] configArr = spe.a;
                if (g76.L(Looper.myLooper(), Looper.getMainLooper()) && wveVarT.d) {
                    wveVarT.d = false;
                    mv2Var.a = o33Var;
                    return mv2Var;
                }
            }
            enc encVar = wveVarT.b;
            if (encVar != null) {
                encVar.m(null);
            }
            wveVarT.b = null;
            mv2 mv2Var2 = new mv2();
            mv2Var2.a = o33Var;
            wveVarT.a = mv2Var2;
            return mv2Var2;
        }
    }

    public static final ft o(ib2 ib2Var) {
        ft ftVar = (ft) ib2Var.o0(tz7.j);
        if (ftVar != null) {
            return ftVar;
        }
        ygf.f("A MonotonicFrameClock is not available in this CoroutineContext. Callers should supply an appropriate MonotonicFrameClock using withContext.");
        return null;
    }

    public static final g00 p(yd4 yd4Var) {
        int i = vh8.a[yd4Var.ordinal()];
        if (i == 1) {
            return kng.n;
        }
        if (i == 2) {
            return kng.o;
        }
        if (i == 3) {
            return kng.p;
        }
        if (i == 4) {
            return kng.q;
        }
        if (i == 5) {
            return kng.r;
        }
        ygf.a();
        return null;
    }

    public static final boolean q(zwa zwaVar, zwa zwaVar2, zwa zwaVar3, int i) {
        if (!r(i, zwaVar, zwaVar3)) {
            return false;
        }
        if (r(i, zwaVar2, zwaVar3) && !d(zwaVar3, zwaVar, zwaVar2, i)) {
            return !d(zwaVar3, zwaVar2, zwaVar, i) && s(i, zwaVar3, zwaVar) < s(i, zwaVar3, zwaVar2);
        }
        return true;
    }

    public static final boolean r(int i, zwa zwaVar, zwa zwaVar2) {
        if (i == 3) {
            float f2 = zwaVar2.c;
            float f3 = zwaVar2.a;
            float f4 = zwaVar.c;
            return (f2 > f4 || f3 >= f4) && f3 > zwaVar.a;
        }
        if (i == 4) {
            float f5 = zwaVar2.a;
            float f6 = zwaVar2.c;
            float f7 = zwaVar.a;
            return (f5 < f7 || f6 <= f7) && f6 < zwaVar.c;
        }
        if (i == 5) {
            float f8 = zwaVar2.d;
            float f9 = zwaVar2.b;
            float f10 = zwaVar.d;
            return (f8 > f10 || f9 >= f10) && f9 > zwaVar.b;
        }
        if (i != 6) {
            ygf.f("This function should only be used for 2-D focus search");
            return false;
        }
        float f11 = zwaVar2.b;
        float f12 = zwaVar2.d;
        float f13 = zwaVar.b;
        return (f11 < f13 || f12 <= f13) && f12 < zwaVar.d;
    }

    public static final long s(int i, zwa zwaVar, zwa zwaVar2) {
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        if (i == 3) {
            f2 = zwaVar.a;
            f3 = zwaVar2.c;
        } else if (i == 4) {
            f2 = zwaVar2.a;
            f3 = zwaVar.c;
        } else if (i == 5) {
            f2 = zwaVar.b;
            f3 = zwaVar2.d;
        } else {
            if (i != 6) {
                ygf.f("This function should only be used for 2-D focus search");
                return 0L;
            }
            f2 = zwaVar2.b;
            f3 = zwaVar.d;
        }
        float f7 = f2 - f3;
        if (f7 < 0.0f) {
            f7 = 0.0f;
        }
        long j = (long) f7;
        if (i == 3 || i == 4) {
            float f8 = zwaVar.b;
            f4 = ((zwaVar.d - f8) / 2.0f) + f8;
            f5 = zwaVar2.b;
            f6 = zwaVar2.d;
        } else {
            if (i != 5 && i != 6) {
                ygf.f("This function should only be used for 2-D focus search");
                return 0L;
            }
            float f9 = zwaVar.a;
            f4 = ((zwaVar.c - f9) / 2.0f) + f9;
            f5 = zwaVar2.a;
            f6 = zwaVar2.c;
        }
        long j2 = (long) (f4 - (((f6 - f5) / 2.0f) + f5));
        return (j2 * j2) + (13 * j * j);
    }

    public static final boolean t(lid lidVar, boolean z) {
        hp6 hp6VarC;
        kx6 kx6Var = lidVar.d;
        if (kx6Var == null || (hp6VarC = kx6Var.c()) == null) {
            return false;
        }
        zwa zwaVarH = mk7.H(hp6VarC);
        long j = lidVar.j(z);
        float f2 = zwaVarH.a;
        float f3 = zwaVarH.c;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
        if (f2 > fIntBitsToFloat || fIntBitsToFloat > f3) {
            return false;
        }
        float f4 = zwaVarH.b;
        float f5 = zwaVarH.d;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L));
        return f4 <= fIntBitsToFloat2 && fIntBitsToFloat2 <= f5;
    }

    public static final Object u(d2f d2fVar, Activity activity, xjb xjbVar, cf7 cf7Var) {
        jrg jrgVarX;
        if (((ukf) xjbVar).b) {
            jrgVarX = vp7.x(null);
        } else {
            Intent intent = new Intent(activity, (Class<?>) PlayCoreDialogWrapperActivity.class);
            intent.putExtra("confirmation_intent", ((ukf) xjbVar).a);
            intent.putExtra("window_flags", activity.getWindow().getDecorView().getWindowSystemUiVisibility());
            wfd wfdVar = new wfd();
            intent.putExtra("result_receiver", new rwf((Handler) d2fVar.c, wfdVar));
            activity.startActivity(intent);
            jrgVarX = wfdVar.a;
        }
        jrgVarX.getClass();
        Object objZ = z(jrgVarX, cf7Var);
        return objZ == tb2.COROUTINE_SUSPENDED ? objZ : c1e.a;
    }

    public static final void v(uz uzVar, u78 u78Var) {
        uzVar.b.b(new wv8(u78Var));
    }

    public static final void w(fa4 fa4Var, ng8 ng8Var, wx8 wx8Var, n98 n98Var) {
        fa4Var.getClass();
        ng8Var.getClass();
        wx8Var.getClass();
        n98Var.getClass();
        String str = ((xx8) wx8Var).f.a.a;
        n98Var.b().getClass();
        str.getClass();
        if (fa4Var == fa4.m) {
            return;
        }
        ng8Var.getLocation();
    }

    public static final Object x(h68 h68Var, yd4 yd4Var) {
        h68Var.getClass();
        yd4Var.getClass();
        return h68Var.a(new tya(p(yd4Var)));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object y(defpackage.d2f r11, defpackage.p92 r12) {
        /*
            Method dump skipped, instruction units count: 225
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gr7.y(d2f, p92):java.lang.Object");
    }

    public static Object z(jrg jrgVar, p92 p92Var) {
        int i = 1;
        x51 x51Var = new x51(1, pwd.Q(p92Var));
        x51Var.s();
        x51Var.v(new ox8(i, 17));
        if (!jrgVar.j()) {
            jrgVar.e(yfd.a, new hha(new fw8(i, x51Var)));
            jrgVar.c(new zg2(x51Var));
        } else if (jrgVar.k()) {
            x51Var.resumeWith(jrgVar.i());
        } else {
            Exception excH = jrgVar.h();
            excH.getClass();
            x51Var.resumeWith(new ajb(excH));
        }
        return x51Var.q();
    }

    public abstract bzf H();

    public abstract Integer J();

    public static void h(Context context, MediumPushNotification mediumPushNotification) {
        MediumPushNotification.Companion.getClass();
        f09[] f09VarArr = {new f09("key_notification", MediumPushNotification.adapter.d(mediumPushNotification))};
        ct2 ct2Var = new ct2(0, false);
        f09 f09Var = f09VarArr[0];
        ct2Var.d((String) f09Var.a, f09Var.b);
        dt2 dt2VarA = ct2Var.a();
        vt8 vt8Var = new vt8(MediumPushNotificationWorker.class);
        lw8 lw8Var = lw8.RUN_AS_NON_EXPEDITED_WORK_REQUEST;
        lw8Var.getClass();
        c8f c8fVar = vt8Var.c;
        c8fVar.q = true;
        c8fVar.r = lw8Var;
        vt8Var.c.e = dt2VarA;
        wt8 wt8Var = (wt8) vt8Var.a();
        m7f m7fVarF = m7f.f(context);
        m7fVarF.getClass();
        m7fVarF.d(b09.w(mediumPushNotification.getNotificationId(), DtuT.dlGJjAmb), j54.REPLACE, wt8Var);
    }
}
