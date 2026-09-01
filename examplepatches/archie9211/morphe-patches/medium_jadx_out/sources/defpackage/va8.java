package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class va8 {
    public static final /* synthetic */ int f = 0;
    public final String a;
    public final ym6 b;
    public ya8 c;
    public CharSequence d;
    public final xkc e;

    static {
        new LinkedHashMap();
    }

    public va8(String str) {
        this.a = str;
        this.b = new ym6(this);
        this.e = new xkc(0);
    }

    public final void d(qa8 qa8Var) {
        qa8Var.getClass();
        ym6 ym6Var = this.b;
        ym6Var.getClass();
        ArrayList arrayListN = fo7.N((LinkedHashMap) ym6Var.f, new wa8(qa8Var, 0));
        if (arrayListN.isEmpty()) {
            ((ArrayList) ym6Var.e).add(qa8Var);
            return;
        }
        throw new IllegalArgumentException(("Deep link " + qa8Var.a + " can't be used to open destination " + ((va8) ym6Var.d) + ".\nFollowing required arguments are missing: " + arrayListN).toString());
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00c1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean equals(java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 215
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.va8.equals(java.lang.Object):boolean");
    }

    public final Bundle f(Bundle bundle) {
        Object obj;
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.b.f;
        if (bundle == null && linkedHashMap.isEmpty()) {
            return null;
        }
        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str = (String) entry.getKey();
            aa8 aa8Var = (aa8) entry.getValue();
            aa8Var.getClass();
            str.getClass();
            if (aa8Var.c && (obj = aa8Var.d) != null) {
                aa8Var.a.e(bundleE, str, obj);
            }
        }
        if (bundle != null) {
            bundleE.putAll(bundle);
            for (Map.Entry entry2 : linkedHashMap.entrySet()) {
                String str2 = (String) entry2.getKey();
                aa8 aa8Var2 = (aa8) entry2.getValue();
                aa8Var2.getClass();
                wb8 wb8Var = aa8Var2.a;
                str2.getClass();
                if (aa8Var2.b || !bundleE.containsKey(str2) || !vo7.B(str2, bundleE)) {
                    try {
                        wb8Var.a(str2, bundleE);
                    } catch (IllegalStateException unused) {
                    }
                }
                rd6.l(lv8.u("Wrong argument type for '", str2, "' in argument savedState. "), wb8Var.b(), " expected.");
                return null;
            }
        }
        return bundleE;
    }

    public int hashCode() {
        ym6 ym6Var = this.b;
        int i = ym6Var.c * 31;
        String str = (String) ym6Var.g;
        int iHashCode = i + (str != null ? str.hashCode() : 0);
        for (qa8 qa8Var : (ArrayList) ym6Var.e) {
            int i2 = iHashCode * 31;
            String str2 = qa8Var.a;
            int iHashCode2 = (i2 + (str2 != null ? str2.hashCode() : 0)) * 31;
            String str3 = qa8Var.b;
            int iHashCode3 = (iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31;
            String str4 = qa8Var.c;
            iHashCode = iHashCode3 + (str4 != null ? str4.hashCode() : 0);
        }
        xkc xkcVar = this.e;
        xkcVar.getClass();
        int i3 = 0;
        while (true) {
            if (!(i3 < xkcVar.e())) {
                break;
            }
            int i4 = i3 + 1;
            z98 z98Var = (z98) xkcVar.g(i3);
            int i5 = ((iHashCode * 31) + z98Var.a) * 31;
            ob8 ob8Var = z98Var.b;
            iHashCode = i5 + (ob8Var != null ? ob8Var.hashCode() : 0);
            Bundle bundle = z98Var.c;
            if (bundle != null) {
                iHashCode = yo7.q(bundle) + (iHashCode * 31);
            }
            i3 = i4;
        }
        for (String str5 : q().keySet()) {
            int iO = wgd.o(iHashCode * 31, 31, str5);
            Object obj = q().get(str5);
            iHashCode = iO + (obj != null ? obj.hashCode() : 0);
        }
        return iHashCode;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0024  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int[] m(defpackage.va8 r6) {
        /*
            r5 = this;
            m70 r0 = new m70
            r0.<init>()
        L5:
            ym6 r1 = r5.b
            ya8 r2 = r5.c
            if (r6 == 0) goto Le
            ya8 r3 = r6.c
            goto Lf
        Le:
            r3 = 0
        Lf:
            if (r3 == 0) goto L24
            ya8 r3 = r6.c
            r3.getClass()
            int r4 = r1.c
            jl1 r3 = r3.g
            va8 r3 = r3.s(r4)
            if (r3 != r5) goto L24
            r0.addFirst(r5)
            goto L3a
        L24:
            if (r2 == 0) goto L2e
            jl1 r3 = r2.g
            int r3 = r3.c
            int r1 = r1.c
            if (r3 == r1) goto L31
        L2e:
            r0.addFirst(r5)
        L31:
            boolean r5 = defpackage.g76.L(r2, r6)
            if (r5 == 0) goto L38
            goto L3a
        L38:
            if (r2 != 0) goto L6a
        L3a:
            java.util.List r5 = defpackage.bu1.m1(r0)
            java.util.ArrayList r6 = new java.util.ArrayList
            r0 = 10
            int r0 = defpackage.cu1.k0(r5, r0)
            r6.<init>(r0)
            java.util.Iterator r5 = r5.iterator()
        L4d:
            boolean r0 = r5.hasNext()
            if (r0 == 0) goto L65
            java.lang.Object r0 = r5.next()
            va8 r0 = (defpackage.va8) r0
            ym6 r0 = r0.b
            int r0 = r0.c
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)
            r6.add(r0)
            goto L4d
        L65:
            int[] r5 = defpackage.bu1.l1(r6)
            return r5
        L6a:
            r5 = r2
            goto L5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.va8.m(va8):int[]");
    }

    public final z98 p(int i) {
        z98 z98Var;
        xkc xkcVar = this.e;
        if (xkcVar.e() == 0) {
            z98Var = null;
        } else {
            xkcVar.getClass();
            z98Var = (z98) s42.L(xkcVar, i);
        }
        if (z98Var != null) {
            return z98Var;
        }
        ya8 ya8Var = this.c;
        if (ya8Var != null) {
            return ya8Var.p(i);
        }
        return null;
    }

    public final Map q() {
        return ei7.W((LinkedHashMap) this.b.f);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x022d  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01dc  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.ua8 r(defpackage.ku3 r26) {
        /*
            Method dump skipped, instruction units count: 589
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.va8.r(ku3):ua8");
    }

    public void s(Context context, AttributeSet attributeSet) {
        String strValueOf;
        context.getClass();
        TypedArray typedArrayObtainAttributes = context.getResources().obtainAttributes(attributeSet, csa.e);
        typedArrayObtainAttributes.getClass();
        u(typedArrayObtainAttributes.getString(2));
        if (typedArrayObtainAttributes.hasValue(1)) {
            int resourceId = typedArrayObtainAttributes.getResourceId(1, 0);
            ym6 ym6Var = this.b;
            ym6Var.c = resourceId;
            ym6Var.b = null;
            int i = ym6Var.c;
            if (i <= 16777215) {
                strValueOf = String.valueOf(i);
            } else {
                try {
                    strValueOf = context.getResources().getResourceName(i);
                    strValueOf.getClass();
                } catch (Resources.NotFoundException unused) {
                    strValueOf = String.valueOf(i);
                }
            }
            ym6Var.b = strValueOf;
        }
        this.d = typedArrayObtainAttributes.getText(0);
        typedArrayObtainAttributes.recycle();
    }

    public final void t(int i, z98 z98Var) {
        z98Var.getClass();
        if (!(this instanceof v6)) {
            if (i != 0) {
                this.e.d(i, z98Var);
                return;
            } else {
                ay0.e("Cannot have an action with actionId 0");
                return;
            }
        }
        throw new UnsupportedOperationException("Cannot add action " + i + " to " + this + " as it does not support actions, indicating that it is a terminal destination in your navigation graph and will never trigger actions.");
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(getClass().getSimpleName());
        sb.append("(");
        ym6 ym6Var = this.b;
        String str = ym6Var.b;
        if (str == null) {
            sb.append("0x");
            sb.append(Integer.toHexString(ym6Var.c));
        } else {
            sb.append(str);
        }
        sb.append(")");
        String str2 = (String) ym6Var.g;
        if (str2 != null && !muc.b0(str2)) {
            sb.append(" route=");
            sb.append((String) ym6Var.g);
        }
        if (this.d != null) {
            sb.append(" label=");
            sb.append(this.d);
        }
        return sb.toString();
    }

    public final void u(String str) {
        int i = 0;
        ym6 ym6Var = this.b;
        if (str == null) {
            ym6Var.c = 0;
            ym6Var.b = null;
        } else {
            ym6Var.getClass();
            if (muc.b0(str)) {
                ay0.e("Cannot have an empty route");
                return;
            }
            String strConcat = "android-app://androidx.navigation/".concat(str);
            ArrayList arrayListN = fo7.N((LinkedHashMap) ym6Var.f, new wa8(new qa8(strConcat, null, null), 1));
            if (!arrayListN.isEmpty()) {
                StringBuilder sbU = lv8.u("Cannot set route \"", str, "\" for destination ");
                sbU.append((va8) ym6Var.d);
                sbU.append(". Following required arguments are missing: ");
                sbU.append(arrayListN);
                throw new IllegalArgumentException(sbU.toString().toString());
            }
            ym6Var.h = new w5d(new xa8(strConcat, i));
            ym6Var.c = strConcat.hashCode();
            ym6Var.b = null;
        }
        ym6Var.g = str;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public va8(sc8 sc8Var) {
        this(gq7.w(sc8Var.getClass()));
        sc8Var.getClass();
        LinkedHashMap linkedHashMap = tc8.b;
    }
}
