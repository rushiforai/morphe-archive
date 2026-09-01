package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.graphql.fragment.IframeData;
import com.medium.reader.R;
import java.io.EOFException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlinx.coroutines.DispatchException;
import kotlinx.serialization.SerializationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class kyd {
    public static final d1g h = new d1g(15, "InvalidModuleNotifier", false);
    public static final no3 i;
    public static final zi5 j;
    public static final xsa k;
    public static final /* synthetic */ int m = 0;
    public static final /* synthetic */ int n = 0;
    public static final mz1 a = new mz1(new a02(3), false, 1152338983);
    public static final mz1 b = new mz1(new a02(4), false, 1633464712);
    public static final mz1 c = new mz1(new f02(25), false, 719099087);
    public static final mz1 d = new mz1(new f02(26), false, 882896330);
    public static final mz1 e = new mz1(new u02(1), false, 221447456);
    public static final mz1 f = new mz1(new m02(23), false, -1450943193);
    public static final wh3 g = new wh3();
    public static final char[] l = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    static {
        int i2 = 22;
        i = new no3(i2);
        j = new zi5(i2);
        k = new xsa(i2);
    }

    public static final void A(yed yedVar, bo4 bo4Var, ted tedVar, e9d e9dVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-728213669);
        int i3 = i2 | (p65Var.f(yedVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(tedVar) ? 256 : 128) | (p65Var.f(e9dVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z = yedVar.b;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ibd ibdVar = new ibd(0, tedVar, ted.class, "onRefresh", "onRefresh()V", 0, 7);
                p65Var.j0(ibdVar);
                objM = ibdVar;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(785401961, new ov2(yedVar, bo4Var, tedVar, e9dVar, 25), p65Var), p65Var, (i3 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(yedVar, bo4Var, tedVar, e9dVar, r28Var, i2, 10);
        }
    }

    public static final void B(bo4 bo4Var, String str, bo4 bo4Var2, gub gubVar, r28 r28Var, efd efdVar, x12 x12Var, int i2) {
        r28 r28Var2;
        efd efdVar2;
        efd efdVar3;
        int i3;
        r28 r28Var3;
        efd efdVar4;
        str.getClass();
        bo4Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-999937212);
        int i4 = i2 | (p65Var.h(bo4Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var2) ? 256 : 128) | (p65Var.f(gubVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 90112;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean zH = p65Var.h(bo4Var) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    objM = new ui1(bo4Var, str, 3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    efdVar3 = (efd) to7.z(n1b.a.b(efd.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                r28Var3 = r28Var;
                efdVar3 = efdVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(efdVar3.m, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            ted tedVar = new ted(efdVar3, gubVar);
            a1a a1aVar = new a1a(efdVar3, 15, gubVar);
            C((zed) l78VarZ.getValue(), nhcVarF, bo4Var2, tedVar, a1aVar, r28Var3, p65Var, (i3 & 896) | 196608, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH2 = p65Var.h(efdVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(a1aVar);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                efdVar4 = efdVar3;
                objM3 = new kyc((que) efdVar4, nhcVarF, sb2Var, resources, (Object) a1aVar, (n92) null, 1);
                p65Var.j0(objM3);
            } else {
                efdVar4 = efdVar3;
            }
            k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var3;
            efdVar2 = efdVar4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            efdVar2 = efdVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 26, r28Var2, (que) efdVar2, (Object) bo4Var, (Object) bo4Var2, (Object) gubVar, str);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void C(defpackage.zed r23, defpackage.nhc r24, defpackage.bo4 r25, defpackage.ted r26, defpackage.e9d r27, defpackage.r28 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyd.C(zed, nhc, bo4, ted, e9d, r28, x12, int, int):void");
    }

    public static void D(Throwable th, Throwable th2) {
        th.getClass();
        th2.getClass();
        if (th != th2) {
            Integer num = k86.a;
            if (num == null || num.intValue() >= 19) {
                th.addSuppressed(th2);
                return;
            }
            Method method = ia9.a;
            if (method != null) {
                method.invoke(th, th2);
            }
        }
    }

    public static final float E(IframeData iframeData) {
        Integer iframeWidth = iframeData.getIframeWidth();
        if (iframeWidth == null) {
            return 1.0f;
        }
        int iIntValue = iframeWidth.intValue();
        Integer iframeHeight = iframeData.getIframeHeight();
        if (iframeHeight == null) {
            return 1.0f;
        }
        int iIntValue2 = iframeHeight.intValue();
        if (iIntValue == 0) {
            return 1.0f;
        }
        return iIntValue2 / iIntValue;
    }

    public static String F(int i2, int i3, int i4, String str, String str2, boolean z) {
        int i5 = (i4 & 1) != 0 ? 0 : i2;
        if ((i4 & 2) != 0) {
            i3 = str.length();
        }
        int i6 = i3;
        boolean z2 = (i4 & 8) != 0 ? false : z;
        boolean z3 = (i4 & 16) == 0;
        boolean z4 = (i4 & 32) == 0;
        boolean z5 = (i4 & 64) == 0;
        str.getClass();
        return G(str, i5, i6, str2, z2, z3, z4, z5, 128);
    }

    public static String G(String str, int i2, int i3, String str2, boolean z, boolean z2, boolean z3, boolean z4, int i4) throws EOFException {
        int i5 = (i4 & 1) != 0 ? 0 : i2;
        int length = (i4 & 2) != 0 ? str.length() : i3;
        boolean z5 = (i4 & 8) != 0 ? false : z;
        boolean z6 = (i4 & 16) != 0 ? false : z2;
        boolean z7 = (i4 & 64) == 0 ? z4 : false;
        str.getClass();
        int iCharCount = i5;
        while (iCharCount < length) {
            int iCodePointAt = str.codePointAt(iCharCount);
            int i6 = 128;
            if (iCodePointAt < 32 || iCodePointAt == 127 || ((iCodePointAt >= 128 && !z7) || muc.R(str2, (char) iCodePointAt) || ((iCodePointAt == 37 && (!z5 || (z6 && !b0(iCharCount, length, str)))) || (iCodePointAt == 43 && z3)))) {
                kz0 kz0Var = new kz0();
                kz0Var.Q0(i5, iCharCount, str);
                kz0 kz0Var2 = null;
                while (iCharCount < length) {
                    int iCodePointAt2 = str.codePointAt(iCharCount);
                    if (!z5 || (iCodePointAt2 != 9 && iCodePointAt2 != 10 && iCodePointAt2 != 12 && iCodePointAt2 != 13)) {
                        if (iCodePointAt2 == 32 && str2 == " !\"#$&'()+,/:;<=>?@[\\]^`{|}~") {
                            kz0Var.R0("+");
                        } else if (iCodePointAt2 == 43 && z3) {
                            kz0Var.R0(z5 ? "+" : "%2B");
                        } else if (iCodePointAt2 < 32 || iCodePointAt2 == 127 || ((iCodePointAt2 >= i6 && !z7) || muc.R(str2, (char) iCodePointAt2) || (iCodePointAt2 == 37 && (!z5 || (z6 && !b0(iCharCount, length, str)))))) {
                            if (kz0Var2 == null) {
                                kz0Var2 = new kz0();
                            }
                            kz0Var2.S0(iCodePointAt2);
                            while (!kz0Var2.H()) {
                                byte b2 = kz0Var2.readByte();
                                kz0Var.K0(37);
                                char[] cArr = l;
                                kz0Var.K0(cArr[((b2 & 255) >> 4) & 15]);
                                kz0Var.K0(cArr[b2 & 15]);
                            }
                        } else {
                            kz0Var.S0(iCodePointAt2);
                        }
                    }
                    iCharCount += Character.charCount(iCodePointAt2);
                    i6 = 128;
                }
                return kz0Var.G0();
            }
            iCharCount += Character.charCount(iCodePointAt);
        }
        return str.substring(i5, length);
    }

    public static final u50 H(bo4 bo4Var) {
        return new u50(12, new jo4(bo4Var, null, 0));
    }

    public static void I(int i2) {
        if (2 > i2 || i2 >= 37) {
            ay0.i(ev6.C("radix ", i2, " was not in valid range "), new n46(2, 36, 1));
        }
    }

    public static final pc1 J(bo4 bo4Var, bo4 bo4Var2, bo4 bo4Var3, bo4 bo4Var4, bo4 bo4Var5, f65 f65Var, g55 g55Var) {
        bo4Var3.getClass();
        return new pc1(new bo4[]{bo4Var, bo4Var2, bo4Var3, bo4Var4, bo4Var5, f65Var}, 7, g55Var);
    }

    public static final Type K(qj6 qj6Var, boolean z) {
        ih6 ih6VarR = qj6Var.r();
        if (ih6VarR instanceof xj6) {
            return new oxd((xj6) ih6VarR);
        }
        if (!(ih6VarR instanceof wg6)) {
            ywb.i("Unsupported type classifier: ", qj6Var);
            return null;
        }
        wg6 wg6Var = (wg6) ih6VarR;
        Class clsU = z ? vx0.U(wg6Var) : vx0.T(wg6Var);
        List listO = qj6Var.o();
        if (listO.isEmpty()) {
            return clsU;
        }
        if (!clsU.isArray()) {
            return P(clsU, listO);
        }
        if (clsU.getComponentType().isPrimitive()) {
            return clsU;
        }
        ak6 ak6Var = (ak6) bu1.c1(listO);
        if (ak6Var == null) {
            ik4.h("kotlin.Array must have exactly one type argument: ", qj6Var);
            return null;
        }
        bk6 bk6Var = ak6Var.a;
        qj6 qj6Var2 = ak6Var.b;
        int i2 = bk6Var == null ? -1 : iyd.a[bk6Var.ordinal()];
        if (i2 == -1 || i2 == 1) {
            return clsU;
        }
        if (i2 != 2 && i2 != 3) {
            ygf.a();
            return null;
        }
        qj6Var2.getClass();
        Type typeK = K(qj6Var2, false);
        return typeK instanceof Class ? clsU : new x75(typeK);
    }

    public static final boolean L(dk3 dk3Var, long j2) {
        if (!dk3Var.a.n) {
            return false;
        }
        l26 l26Var = (l26) flb.v0(dk3Var).F.d;
        if (!l26Var.S.n) {
            return false;
        }
        long jI = l26Var.I(0L);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jI >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jI & 4294967295L));
        long j3 = dk3Var.q;
        float f2 = ((int) (j3 >> 32)) + fIntBitsToFloat;
        float f3 = ((int) (j3 & 4294967295L)) + fIntBitsToFloat2;
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (j2 >> 32));
        if (fIntBitsToFloat > fIntBitsToFloat3 || fIntBitsToFloat3 > f2) {
            return false;
        }
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (j2 & 4294967295L));
        return fIntBitsToFloat2 <= fIntBitsToFloat4 && fIntBitsToFloat4 <= f3;
    }

    public static final sb2 M(x12 x12Var) {
        return new r3b(((p65) x12Var).R);
    }

    public static final bz4 N(Context context) {
        return new bz4(new mp(context, 0), new np(Build.VERSION.SDK_INT >= 31 ? e05.a.a(context) : 0));
    }

    public static final pnc O(y28 y28Var, y28 y28Var2) {
        y28Var.getClass();
        y28Var2.getClass();
        y28Var.g0().size();
        y28Var2.g0().size();
        List listG0 = y28Var.g0();
        listG0.getClass();
        ArrayList arrayList = new ArrayList(cu1.k0(listG0, 10));
        Iterator it2 = listG0.iterator();
        while (it2.hasNext()) {
            arrayList.add(((swd) it2.next()).n());
        }
        List listG02 = y28Var2.g0();
        listG02.getClass();
        ArrayList arrayList2 = new ArrayList(cu1.k0(listG02, 10));
        Iterator it3 = listG02.iterator();
        while (it3.hasNext()) {
            hec hecVarT = ((swd) it3.next()).T();
            hecVarT.getClass();
            arrayList2.add(new onc(hecVarT));
        }
        return new pnc(1, ei7.V(bu1.t1(arrayList2, arrayList)));
    }

    public static final e49 P(Class cls, List list) {
        Class<?> declaringClass = cls.getDeclaringClass();
        if (declaringClass == null) {
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                arrayList.add(V((ak6) it2.next()));
            }
            return new e49(cls, null, arrayList);
        }
        if (Modifier.isStatic(cls.getModifiers())) {
            ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
            Iterator it3 = list.iterator();
            while (it3.hasNext()) {
                arrayList2.add(V((ak6) it3.next()));
            }
            return new e49(cls, declaringClass, arrayList2);
        }
        int length = cls.getTypeParameters().length;
        e49 e49VarP = P(declaringClass, list.subList(length, list.size()));
        List listSubList = list.subList(0, length);
        ArrayList arrayList3 = new ArrayList(cu1.k0(listSubList, 10));
        Iterator it4 = listSubList.iterator();
        while (it4.hasNext()) {
            arrayList3.add(V((ak6) it4.next()));
        }
        return new e49(cls, e49VarP, arrayList3);
    }

    public static final vob Q(qg2 qg2Var) {
        vob vobVar;
        qg2Var.getClass();
        hpb hpbVar = (hpb) qg2Var.a(i);
        Bundle bundle = null;
        if (hpbVar == null) {
            ay0.e("CreationExtras must have a value by `SAVED_STATE_REGISTRY_OWNER_KEY`");
            return null;
        }
        wue wueVar = (wue) qg2Var.a(j);
        if (wueVar == null) {
            ay0.e("CreationExtras must have a value by `VIEW_MODEL_STORE_OWNER_KEY`");
            return null;
        }
        Bundle bundle2 = (Bundle) qg2Var.a(k);
        String str = (String) qg2Var.a(zg7.d);
        if (str == null) {
            ay0.e("CreationExtras must have a value by `VIEW_MODEL_KEY`");
            return null;
        }
        dpb dpbVarB = hpbVar.getSavedStateRegistry().b("androidx.lifecycle.internal.SavedStateHandlesProvider");
        apb apbVar = dpbVarB instanceof apb ? (apb) dpbVarB : null;
        if (apbVar == null) {
            ygf.f("enableSavedStateHandles() wasn't called prior to createSavedStateHandle() call");
            return null;
        }
        LinkedHashMap linkedHashMap = W(wueVar).b;
        vob vobVar2 = (vob) linkedHashMap.get(str);
        if (vobVar2 != null) {
            return vobVar2;
        }
        apbVar.b();
        Bundle bundle3 = apbVar.c;
        if (bundle3 != null && bundle3.containsKey(str)) {
            Bundle bundle4 = bundle3.getBundle(str);
            if (bundle4 == null) {
                bundle4 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            }
            bundle3.remove(str);
            if (bundle3.isEmpty()) {
                apbVar.c = null;
            }
            bundle = bundle4;
        }
        if (bundle != null) {
            bundle2 = bundle;
        }
        if (bundle2 == null) {
            vobVar = new vob();
        } else {
            ClassLoader classLoader = vob.class.getClassLoader();
            classLoader.getClass();
            bundle2.setClassLoader(classLoader);
            dh7 dh7Var = new dh7(bundle2.size());
            for (String str2 : bundle2.keySet()) {
                str2.getClass();
                dh7Var.put(str2, bundle2.get(str2));
            }
            vobVar = new vob(dh7Var.b());
        }
        linkedHashMap.put(str, vobVar);
        return vobVar;
    }

    public static final void R(hpb hpbVar) {
        vx6 vx6Var = ((ky6) hpbVar.getLifecycle()).d;
        if (vx6Var != vx6.INITIALIZED && vx6Var != vx6.CREATED) {
            ay0.e("Failed requirement.");
        } else if (hpbVar.getSavedStateRegistry().b("androidx.lifecycle.internal.SavedStateHandlesProvider") == null) {
            apb apbVar = new apb(hpbVar.getSavedStateRegistry(), (wue) hpbVar);
            hpbVar.getSavedStateRegistry().c("androidx.lifecycle.internal.SavedStateHandlesProvider", apbVar);
            hpbVar.getLifecycle().a(new ywa(5, apbVar));
        }
    }

    public static final boolean S(char c2, char c3, boolean z) {
        if (c2 == c3) {
            return true;
        }
        if (!z) {
            return false;
        }
        char upperCase = Character.toUpperCase(c2);
        char upperCase2 = Character.toUpperCase(c3);
        return upperCase == upperCase2 || Character.toLowerCase(upperCase) == Character.toLowerCase(upperCase2);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0039 A[Catch: all -> 0x0073, TRY_LEAVE, TryCatch #0 {, blocks: (B:6:0x000e, B:8:0x0014, B:15:0x0033, B:17:0x0039, B:24:0x005b, B:23:0x0058, B:14:0x0030, B:20:0x0054, B:11:0x002c), top: B:37:0x000e, inners: #1, #2 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String T(android.content.Context r7) {
        /*
            java.lang.String r0 = "XZ"
            java.lang.String r1 = defpackage.g50.a()
            r2 = 0
            if (r1 != 0) goto L79
            java.lang.Object r1 = defpackage.g50.c()
            monitor-enter(r1)
            java.lang.String r3 = defpackage.g50.a()     // Catch: java.lang.Throwable -> L73
            if (r3 != 0) goto L75
            java.lang.String r3 = "com.facebook.sdk.appEventPreferences"
            r4 = 0
            android.content.SharedPreferences r3 = r7.getSharedPreferences(r3, r4)     // Catch: java.lang.Throwable -> L73
            java.lang.String r5 = "anonymousAppDeviceGUID"
            java.lang.String r3 = r3.getString(r5, r2)     // Catch: java.lang.Throwable -> L73
            java.lang.Class<g50> r5 = defpackage.g50.class
            java.util.Set r6 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L73
            boolean r6 = r6.contains(r5)     // Catch: java.lang.Throwable -> L73
            if (r6 == 0) goto L2c
            goto L33
        L2c:
            defpackage.g50.g = r3     // Catch: java.lang.Throwable -> L2f
            goto L33
        L2f:
            r3 = move-exception
            defpackage.ec2.a(r5, r3)     // Catch: java.lang.Throwable -> L73
        L33:
            java.lang.String r3 = defpackage.g50.a()     // Catch: java.lang.Throwable -> L73
            if (r3 != 0) goto L75
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L73
            r3.<init>(r0)     // Catch: java.lang.Throwable -> L73
            java.util.UUID r0 = java.util.UUID.randomUUID()     // Catch: java.lang.Throwable -> L73
            r3.append(r0)     // Catch: java.lang.Throwable -> L73
            java.lang.String r0 = r3.toString()     // Catch: java.lang.Throwable -> L73
            java.lang.Class<g50> r3 = defpackage.g50.class
            java.util.Set r5 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L73
            boolean r5 = r5.contains(r3)     // Catch: java.lang.Throwable -> L73
            if (r5 == 0) goto L54
            goto L5b
        L54:
            defpackage.g50.g = r0     // Catch: java.lang.Throwable -> L57
            goto L5b
        L57:
            r0 = move-exception
            defpackage.ec2.a(r3, r0)     // Catch: java.lang.Throwable -> L73
        L5b:
            java.lang.String r0 = "com.facebook.sdk.appEventPreferences"
            android.content.SharedPreferences r7 = r7.getSharedPreferences(r0, r4)     // Catch: java.lang.Throwable -> L73
            android.content.SharedPreferences$Editor r7 = r7.edit()     // Catch: java.lang.Throwable -> L73
            java.lang.String r0 = "anonymousAppDeviceGUID"
            java.lang.String r3 = defpackage.g50.a()     // Catch: java.lang.Throwable -> L73
            android.content.SharedPreferences$Editor r7 = r7.putString(r0, r3)     // Catch: java.lang.Throwable -> L73
            r7.apply()     // Catch: java.lang.Throwable -> L73
            goto L75
        L73:
            r7 = move-exception
            goto L77
        L75:
            monitor-exit(r1)
            goto L79
        L77:
            monitor-exit(r1)
            throw r7
        L79:
            java.lang.String r7 = defpackage.g50.a()
            if (r7 == 0) goto L80
            return r7
        L80:
            java.lang.String r7 = "Required value was null."
            defpackage.ygf.f(r7)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyd.T(android.content.Context):java.lang.String");
    }

    public static final Type U(qj6 qj6Var) {
        qj6Var.getClass();
        if (qj6Var instanceof vj6) {
            k1b k1bVar = ((vj6) qj6Var).c;
            Type type = k1bVar != null ? (Type) k1bVar.invoke() : null;
            if (type != null) {
                return type;
            }
        }
        return K(qj6Var, false);
    }

    public static final Type V(ak6 ak6Var) {
        bk6 bk6Var = ak6Var.a;
        if (bk6Var == null) {
            return n3f.c;
        }
        qj6 qj6Var = ak6Var.b;
        qj6Var.getClass();
        int i2 = iyd.a[bk6Var.ordinal()];
        if (i2 == 1) {
            return new n3f(null, K(qj6Var, true));
        }
        if (i2 == 2) {
            return K(qj6Var, true);
        }
        if (i2 == 3) {
            return new n3f(K(qj6Var, true), null);
        }
        ygf.a();
        return null;
    }

    public static final bpb W(wue wueVar) {
        zg7 zg7VarC = z46.c(wueVar, new i33(3), 4);
        return (bpb) ((o2b) zg7VarC.b).o(n1b.a.b(bpb.class), "androidx.lifecycle.internal.SavedStateHandlesVM");
    }

    public static List X(Throwable th) {
        Object objInvoke;
        th.getClass();
        Integer num = k86.a;
        if (num == null || num.intValue() >= 19) {
            Throwable[] suppressed = th.getSuppressed();
            suppressed.getClass();
            List listAsList = Arrays.asList(suppressed);
            listAsList.getClass();
            return listAsList;
        }
        Method method = ia9.b;
        if (method == null || (objInvoke = method.invoke(th, null)) == null) {
            return ey3.a;
        }
        List listAsList2 = Arrays.asList((Throwable[]) objInvoke);
        listAsList2.getClass();
        return listAsList2;
    }

    public static final void Y(ib2 ib2Var, Throwable th) {
        if (th instanceof DispatchException) {
            th = ((DispatchException) th).a;
        }
        try {
            lb2 lb2Var = (lb2) ib2Var.o0(u3b.d);
            if (lb2Var != null) {
                lb2Var.I(ib2Var, th);
            } else {
                pwd.N(ib2Var, th);
            }
        } catch (Throwable th2) {
            if (th != th2) {
                RuntimeException runtimeException = new RuntimeException("Exception while trying to handle coroutine exception", th2);
                D(runtimeException, th);
                th = runtimeException;
            }
            pwd.N(ib2Var, th);
        }
    }

    public static final boolean Z(float[] fArr, float[] fArr2) {
        if (fArr.length < 16 || fArr2.length < 16) {
            return false;
        }
        float f2 = fArr[0];
        float f3 = fArr[1];
        float f4 = fArr[2];
        float f5 = fArr[3];
        float f6 = fArr[4];
        float f7 = fArr[5];
        float f8 = fArr[6];
        float f9 = fArr[7];
        float f10 = fArr[8];
        float f11 = fArr[9];
        float f12 = fArr[10];
        float f13 = fArr[11];
        float f14 = fArr[12];
        float f15 = fArr[13];
        float f16 = fArr[14];
        float f17 = fArr[15];
        float f18 = (f2 * f7) - (f3 * f6);
        float f19 = (f2 * f8) - (f4 * f6);
        float f20 = (f2 * f9) - (f5 * f6);
        float f21 = (f3 * f8) - (f4 * f7);
        float f22 = (f3 * f9) - (f5 * f7);
        float f23 = (f4 * f9) - (f5 * f8);
        float f24 = (f10 * f15) - (f11 * f14);
        float f25 = (f10 * f16) - (f12 * f14);
        float f26 = (f10 * f17) - (f13 * f14);
        float f27 = (f11 * f16) - (f12 * f15);
        float f28 = (f11 * f17) - (f13 * f15);
        float f29 = (f12 * f17) - (f13 * f16);
        float f30 = (f23 * f24) + (((f21 * f26) + ((f20 * f27) + ((f18 * f29) - (f19 * f28)))) - (f22 * f25));
        if (f30 != 0.0f) {
            float f31 = 1.0f / f30;
            fArr2[0] = ((f9 * f27) + ((f7 * f29) - (f8 * f28))) * f31;
            fArr2[1] = (((f4 * f28) + ((-f3) * f29)) - (f5 * f27)) * f31;
            fArr2[2] = ((f17 * f21) + ((f15 * f23) - (f16 * f22))) * f31;
            fArr2[3] = (((f12 * f22) + ((-f11) * f23)) - (f13 * f21)) * f31;
            float f32 = -f6;
            fArr2[4] = (((f8 * f26) + (f32 * f29)) - (f9 * f25)) * f31;
            fArr2[5] = ((f5 * f25) + ((f29 * f2) - (f4 * f26))) * f31;
            float f33 = -f14;
            fArr2[6] = (((f16 * f20) + (f33 * f23)) - (f17 * f19)) * f31;
            fArr2[7] = ((f13 * f19) + ((f23 * f10) - (f12 * f20))) * f31;
            fArr2[8] = ((f9 * f24) + ((f6 * f28) - (f7 * f26))) * f31;
            fArr2[9] = (((f26 * f3) + ((-f2) * f28)) - (f5 * f24)) * f31;
            fArr2[10] = ((f17 * f18) + ((f14 * f22) - (f15 * f20))) * f31;
            fArr2[11] = (((f20 * f11) + ((-f10) * f22)) - (f13 * f18)) * f31;
            fArr2[12] = (((f7 * f25) + (f32 * f27)) - (f8 * f24)) * f31;
            fArr2[13] = ((f4 * f24) + ((f2 * f27) - (f3 * f25))) * f31;
            fArr2[14] = (((f15 * f19) + (f33 * f21)) - (f16 * f18)) * f31;
            fArr2[15] = ((f12 * f18) + ((f10 * f21) - (f11 * f19))) * f31;
        }
        return !(f30 == 0.0f);
    }

    public static final px1 a(qx1 qx1Var) {
        qx1Var.getClass();
        return new px1(qx1Var);
    }

    public static final boolean a0(mn6 mn6Var) {
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        if (o3eVarM0 instanceof i24) {
            return true;
        }
        return (o3eVarM0 instanceof zm4) && (((zm4) o3eVarM0).q0() instanceof i24);
    }

    public static final rx1 b(qx1 qx1Var) {
        qx1Var.getClass();
        return new rx1(qx1Var);
    }

    public static final boolean b0(int i2, int i3, String str) {
        str.getClass();
        int i4 = i2 + 2;
        return i4 < i3 && str.charAt(i2) == '%' && egf.n(str.charAt(i2 + 1)) != -1 && egf.n(str.charAt(i4)) != -1;
    }

    public static final void c(iv0 iv0Var, pu0 pu0Var, x12 x12Var, int i2) {
        pu0 pu0Var2 = pu0Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(345656616);
        int i3 = i2 | (p65Var.f(iv0Var) ? 4 : 2) | (p65Var.f(pu0Var2) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            o28 o28Var = o28.b;
            r28 r28VarE = jfc.e(jfc.q(o28Var, 0.0f, 648.0f, 1), 48.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
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
            g08 g08Var = iv0Var.h;
            zu0 zu0Var = iv0Var.c;
            String str = g08Var.d;
            xm1 xm1Var = iv0Var.a;
            rm1 rm1Var = rm1.M;
            nu0 nu0Var = new nu0(pu0Var2, iv0Var, str);
            qmb qmbVar = qmb.a;
            sgg.h(xm1Var, rm1Var, nu0Var, qmbVar.a(1.0f, o28Var, true), 0L, false, null, p65Var, 48, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            dv0 dv0Var = iv0Var.b;
            String str2 = iv0Var.f;
            r28 r28VarA = qmbVar.a(1.0f, o28Var, true);
            int i5 = (i3 << 6) & 7168;
            t(dv0Var, str2, str, pu0Var2, r28VarA, p65Var, i5);
            if (zu0Var.equals(vu0.a)) {
                p65Var.Y(-155435042);
            } else {
                p65Var.Y(-149286130);
                q(zu0Var, iv0Var.f, iv0Var.h, pu0Var, qmbVar.a(1.0f, o28Var, true), p65Var, i5);
            }
            p65Var.p(false);
            d(iv0Var.d, iv0Var.f, str, pu0Var, qmbVar.a(1.0f, o28Var, true), p65Var, i5);
            u(iv0Var.e, iv0Var.h, pu0Var, qmbVar.a(1.0f, o28Var, true), p65Var, (i3 << 3) & 896);
            pu0Var2 = pu0Var;
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ku0(iv0Var, pu0Var2, i2);
        }
    }

    public static boolean c0(char c2) {
        return Character.isWhitespace(c2) || Character.isSpaceChar(c2);
    }

    public static final void d(tu0 tu0Var, String str, String str2, pu0 pu0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        int i4;
        int i5;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(888081008);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(tu0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(str2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(pu0Var) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            r28 r28VarC = jfc.c(r28Var, 1.0f);
            boolean z2 = tu0Var instanceof ru0;
            if (z2 && ((ru0) tu0Var).a) {
                i4 = -176739580;
                i5 = R.string.common_unsave;
            } else {
                i4 = -176656314;
                i5 = R.string.common_save;
            }
            String strW = km4.w(p65Var, i4, i5, p65Var, false);
            boolean z3 = ((i3 & 896) == 256) | ((i3 & 7168) == 2048) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new eu0(pu0Var, str, str2, 2);
                p65Var.j0(objM);
            }
            r28 r28VarR = hlg.r(r28VarC, z2, strW, null, (m45) objM, 12);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i6 = (int) ((j2 >>> 32) ^ j2);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            r28 r28VarL = jfc.l(o28.b, 24.0f);
            if (z2) {
                p65Var.Y(669349722);
                if (((ru0) tu0Var).a) {
                    p65Var.Y(669386302);
                    z = false;
                    qv5.b(vn7.J(R.drawable.ic_bookmark_24, 0, p65Var), null, r28VarL, ((zo7) p65Var.j(kt7.b)).o, p65Var, 440, 0);
                    p65Var.p(false);
                } else {
                    z = false;
                    p65Var.Y(669735610);
                    qv5.b(vn7.J(R.drawable.ic_bookmark_add_24, 0, p65Var), null, r28VarL, ((zo7) p65Var.j(kt7.b)).o, p65Var, 440, 0);
                    p65Var.p(false);
                }
                p65Var.p(z);
            } else {
                if (!tu0Var.equals(su0.a) && !tu0Var.equals(qu0.a)) {
                    throw ho2.L(p65Var, 1684157723, false);
                }
                p65Var.Y(670232943);
                qv5.b(vn7.J(R.drawable.ic_bookmark_24, 0, p65Var), null, r28VarL, uu1.b(0.4f, ((zo7) p65Var.j(kt7.b)).o), p65Var, 440, 0);
                p65Var.p(false);
            }
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(tu0Var, str, str2, pu0Var, r28Var, i2, 2);
        }
    }

    public static final r28 d0(x45 x45Var) {
        return new fr8(x45Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:64:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x017c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(defpackage.iv0 r21, defpackage.pu0 r22, defpackage.r28 r23, float r24, defpackage.x45 r25, defpackage.x12 r26, int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 487
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyd.e(iv0, pu0, r28, float, x45, x12, int, int):void");
    }

    public static String e0(int i2, int i3, int i4, String str) {
        int i5;
        if ((i4 & 1) != 0) {
            i2 = 0;
        }
        if ((i4 & 2) != 0) {
            i3 = str.length();
        }
        boolean z = (i4 & 4) == 0;
        str.getClass();
        int iCharCount = i2;
        while (iCharCount < i3) {
            char cCharAt = str.charAt(iCharCount);
            if (cCharAt == '%' || (cCharAt == '+' && z)) {
                kz0 kz0Var = new kz0();
                kz0Var.Q0(i2, iCharCount, str);
                while (iCharCount < i3) {
                    int iCodePointAt = str.codePointAt(iCharCount);
                    if (iCodePointAt == 37 && (i5 = iCharCount + 2) < i3) {
                        int iN = egf.n(str.charAt(iCharCount + 1));
                        int iN2 = egf.n(str.charAt(i5));
                        if (iN == -1 || iN2 == -1) {
                            kz0Var.S0(iCodePointAt);
                            iCharCount += Character.charCount(iCodePointAt);
                        } else {
                            kz0Var.K0((iN << 4) + iN2);
                            iCharCount = Character.charCount(iCodePointAt) + i5;
                        }
                    } else if (iCodePointAt == 43 && z) {
                        kz0Var.K0(32);
                        iCharCount++;
                    } else {
                        kz0Var.S0(iCodePointAt);
                        iCharCount += Character.charCount(iCodePointAt);
                    }
                }
                return kz0Var.G0();
            }
            iCharCount++;
        }
        return str.substring(i2, i3);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.m45 r13, defpackage.r28 r14, boolean r15, java.lang.String r16, defpackage.x12 r17, int r18, int r19) {
        /*
            Method dump skipped, instruction units count: 265
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyd.f(m45, r28, boolean, java.lang.String, x12, int, int):void");
    }

    public static final Object f0(Object obj, l44 l44Var) {
        Object objF0;
        f09 f09Var;
        Map map = l44Var.a;
        if (obj == null) {
            return null;
        }
        if (obj instanceof tx1) {
            ygf.f("must be checked by the caller");
            return null;
        }
        if (obj instanceof Map) {
            ArrayList arrayList = new ArrayList();
            for (Map.Entry entry : ((Map) obj).entrySet()) {
                Object value = entry.getValue();
                if (value instanceof tx1) {
                    String str = ((tx1) value).a;
                    f09Var = map.containsKey(str) ? new f09(entry.getKey(), map.get(str)) : null;
                } else {
                    f09Var = new f09(entry.getKey(), f0(value, l44Var));
                }
                if (f09Var != null) {
                    arrayList.add(f09Var);
                }
            }
            return ei7.V(bu1.f1(bu1.m1(arrayList), new js4(12)));
        }
        if (!(obj instanceof List)) {
            return obj;
        }
        Iterable iterable = (Iterable) obj;
        ArrayList arrayList2 = new ArrayList(cu1.k0(iterable, 10));
        for (Object obj2 : iterable) {
            if (obj2 instanceof tx1) {
                String str2 = ((tx1) obj2).a;
                objF0 = map.containsKey(str2) ? map.get(str2) : null;
            } else {
                objF0 = f0(obj2, l44Var);
            }
            arrayList2.add(objF0);
        }
        return arrayList2;
    }

    public static final void g(int i2, long j2, x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-163413164);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                r28Var = o28.b;
            } else {
                p65Var.S();
            }
            p65Var.q();
            ((jp7) p65Var.j(kt7.a)).getClass();
            dy0.a(flb.a0(w2g.E(jfc.e(jfc.d(jp7.a(p65Var) == ip7.COMPACT ? r28Var : jfc.q(r28Var, 0.0f, 348.0f, 1), 1.0f), 48.0f), 24.0f, 0.0f, 2), j2, bmb.a(19.0f)), p65Var, 0);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j2, i2, 5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x00a5 A[PHI: r0
      0x00a5: PHI (r0v11 int) = (r0v5 int), (r0v6 int), (r0v7 int), (r0v8 int) binds: [B:54:0x00a3, B:57:0x00a8, B:60:0x00ac, B:63:0x00b0] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object g0(defpackage.es4 r10, int r11, defpackage.x45 r12) {
        /*
            Method dump skipped, instruction units count: 382
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyd.g0(es4, int, x45):java.lang.Object");
    }

    public static final void h(Object obj, x45 x45Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        boolean zF = p65Var.f(obj);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = new uh3(x45Var);
            p65Var.j0(objM);
        }
    }

    public static String h0(Throwable th) {
        th.getClass();
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        th.printStackTrace(printWriter);
        printWriter.flush();
        String string = stringWriter.toString();
        string.getClass();
        return string;
    }

    public static final void i(Object obj, Object obj2, x45 x45Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        boolean zF = p65Var.f(obj) | p65Var.f(obj2);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = new uh3(x45Var);
            p65Var.j0(objM);
        }
    }

    public static final void i0(wg6 wg6Var, String str) {
        String string;
        wg6Var.getClass();
        String str2 = "in the polymorphic scope of '" + wg6Var.j() + '\'';
        if (str == null) {
            string = wgd.t('.', "Class discriminator was missing and no default serializers were registered ", str2);
        } else {
            StringBuilder sbU = y30.u("Serializer for subclass '", str, "' is not found ", str2, ".\nCheck if class with serial name '");
            ka1.C(sbU, str, "' exists and serializer is registered in a corresponding SerializersModule.\nTo be registered automatically, class '", str, "' has to be '@Serializable', and the base class '");
            sbU.append(wg6Var.j());
            sbU.append("' has to be sealed and '@Serializable'.");
            string = sbU.toString();
        }
        throw new SerializationException(string);
    }

    public static final void j(Object[] objArr, x45 x45Var, x12 x12Var) {
        boolean zF = false;
        for (Object obj : Arrays.copyOf(objArr, objArr.length)) {
            zF |= ((p65) x12Var).f(obj);
        }
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            p65Var.j0(new uh3(x45Var));
        }
    }

    public static String j0(char c2, Locale locale) {
        locale.getClass();
        String strValueOf = String.valueOf(c2);
        strValueOf.getClass();
        String upperCase = strValueOf.toUpperCase(locale);
        upperCase.getClass();
        if (upperCase.length() <= 1) {
            String strValueOf2 = String.valueOf(c2);
            strValueOf2.getClass();
            String upperCase2 = strValueOf2.toUpperCase(Locale.ROOT);
            upperCase2.getClass();
            if (upperCase.equals(upperCase2)) {
                return String.valueOf(Character.toTitleCase(c2));
            }
        } else if (c2 != 329) {
            char cCharAt = upperCase.charAt(0);
            String lowerCase = upperCase.substring(1).toLowerCase(Locale.ROOT);
            lowerCase.getClass();
            return cCharAt + lowerCase;
        }
        return upperCase;
    }

    public static final void k(x12 x12Var, b55 b55Var, Object obj) {
        ib2 ib2Var = ((p65) x12Var).R;
        p65 p65Var = (p65) x12Var;
        boolean zF = p65Var.f(obj);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = new fo6(ib2Var, b55Var);
            p65Var.j0(objM);
        }
    }

    public static final String k0(Type type) {
        if (!(type instanceof Class)) {
            return type.toString();
        }
        Class cls = (Class) type;
        if (!cls.isArray()) {
            return cls.getName();
        }
        mzb mzbVarK0 = szb.K0(type, jyd.a);
        StringBuilder sb = new StringBuilder(((Class) szb.M0(mzbVarK0)).getName());
        Iterator it2 = mzbVarK0.iterator();
        int i2 = 0;
        while (it2.hasNext()) {
            it2.next();
            i2++;
            if (i2 < 0) {
                d46.h0();
                throw null;
            }
        }
        sb.append(tuc.J(i2, "[]"));
        return sb.toString();
    }

    public static final void l(Object obj, Object obj2, b55 b55Var, x12 x12Var) {
        ib2 ib2Var = ((p65) x12Var).R;
        p65 p65Var = (p65) x12Var;
        boolean zF = p65Var.f(obj) | p65Var.f(obj2);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = new fo6(ib2Var, b55Var);
            p65Var.j0(objM);
        }
    }

    public static final void l0(int i2, int i3) {
        if (!(i2 > 0 && i3 > 0)) {
            e26.a("both minLines " + i2 + " and maxLines " + i3 + " must be greater than zero");
        }
        if (i2 <= i3) {
            return;
        }
        e26.a("minLines " + i2 + " must be less than or equal to maxLines " + i3);
    }

    public static final void m(Object[] objArr, b55 b55Var, x12 x12Var) {
        ib2 ib2Var = ((p65) x12Var).R;
        boolean zF = false;
        for (Object obj : Arrays.copyOf(objArr, objArr.length)) {
            zF |= ((p65) x12Var).f(obj);
        }
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            p65Var.j0(new fo6(ib2Var, b55Var));
        }
    }

    public static final void n(Boolean bool, Object obj, iy6 iy6Var, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(696924721);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(bool) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(obj) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(x45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                iy6Var = (iy6) p65Var.j(y57.a);
            } else {
                p65Var.S();
            }
            int i4 = i3 & (-897);
            p65Var.q();
            boolean zF = p65Var.f(bool) | p65Var.f(obj) | p65Var.f(iy6Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new ry6(iy6Var.getLifecycle());
                p65Var.j0(objM);
            }
            o(iy6Var, (ry6) objM, x45Var, p65Var, (i4 >> 3) & 896);
        } else {
            p65Var.S();
        }
        iy6 iy6Var2 = iy6Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 25, bool, obj, iy6Var2, x45Var);
        }
    }

    public static final void o(iy6 iy6Var, ry6 ry6Var, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(228371534);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(iy6Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(ry6Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(x45Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            boolean zH = p65Var.h(ry6Var) | ((i3 & 896) == 256) | p65Var.h(iy6Var);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new o8(iy6Var, ry6Var, x45Var, 23);
                p65Var.j0(objM);
            }
            i(iy6Var, ry6Var, (x45) objM, p65Var);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i2, 2, iy6Var, ry6Var, x45Var);
        }
    }

    public static final void p(zu0 zu0Var, String str, g08 g08Var, pu0 pu0Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        y7b y7bVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1624241091);
        int i3 = i2 | (p65Var.f(zu0Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(g08Var) ? 256 : 128) | (p65Var.f(pu0Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            String str2 = g08Var.d;
            if (zu0Var instanceof yu0) {
                y7bVar = y7b.Reposted;
            } else if (zu0Var instanceof xu0) {
                y7bVar = y7b.NotReposted;
            } else {
                if (!(zu0Var instanceof wu0) && !(zu0Var instanceof uu0) && !(zu0Var instanceof vu0)) {
                    ygf.a();
                    return;
                }
                y7bVar = y7b.Faded;
            }
            rh4 rh4Var = jfc.c;
            omb ombVarA = nmb.a(qb8.e, z46.n, p65Var, 54);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, rh4Var);
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
            o28 o28Var = o28.b;
            int i5 = i3 << 3;
            s(y7bVar, zu0Var, str, g08Var, pu0Var, bgf.N(o28Var, "bottom_action_bar_repost"), p65Var, (i5 & 57344) | (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 196608 | (i5 & 896) | (i5 & 7168));
            Integer numB = zu0Var.b();
            if (numB == null || numB.intValue() <= 0) {
                p65Var.Y(1071740169);
            } else {
                p65Var.Y(1084154832);
                r(zu0Var.b(), y7bVar, zu0Var.a(), str, str2, pu0Var, null, p65Var, (i3 << 6) & 465920);
                p65Var = p65Var;
            }
            p65Var.p(false);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(zu0Var, str, g08Var, pu0Var, r28Var2, i2, 7);
        }
    }

    public static final void q(zu0 zu0Var, String str, g08 g08Var, pu0 pu0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        String str2;
        g08 g08Var2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2021216969);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(zu0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            str2 = str;
            i3 |= p65Var2.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i2 & 384) == 0) {
            g08Var2 = g08Var;
            i3 |= p65Var2.f(g08Var2) ? 256 : 128;
        } else {
            g08Var2 = g08Var;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(pu0Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var = p65Var2;
            ok7.b(zu0Var instanceof xu0 ? ((xu0) zu0Var).a : false, jfc.c(r28Var, 1.0f), null, null, 0.0f, null, pxf.E(-1541762854, new fd3(zu0Var, str2, g08Var2, pu0Var, 23), p65Var2), pxf.E(812510448, new k6c(20, pu0Var), p65Var2), p65Var, 14155776, 60);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(zu0Var, str, g08Var, pu0Var, r28Var, i2, 3);
        }
    }

    public static final void r(Integer num, y7b y7bVar, boolean z, String str, String str2, pu0 pu0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        r28 r28VarR;
        long j2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1907365085);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(num) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.d(y7bVar.ordinal()) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(str) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(str2) ? 16384 : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(pu0Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i4 = i3 | 1572864;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            if (z) {
                p65Var.Y(104437796);
                r28 r28VarY = r40.y(o28Var, bmb.a);
                vkb vkbVar = new vkb(0);
                boolean z2 = ((i4 & 57344) == 16384) | ((i4 & 458752) == 131072) | ((i4 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z2 || objM == w12.a) {
                    objM = new eu0(pu0Var, str, str2, 1);
                    p65Var.j0(objM);
                }
                r28VarR = hlg.r(r28VarY, false, null, vkbVar, (m45) objM, 11);
                p65Var.p(false);
            } else {
                p65Var.Y(104599399);
                p65Var.p(false);
                r28VarR = o28Var;
            }
            int i5 = ou0.a[y7bVar.ordinal()];
            if (i5 == 1 || i5 == 2) {
                p65Var.Y(973210301);
                j2 = rz5.A(p65Var).o;
                p65Var.p(false);
            } else {
                if (i5 != 3) {
                    throw ho2.L(p65Var, 973207009, false);
                }
                p65Var.Y(973212986);
                j2 = rz5.A(p65Var).r;
                p65Var.p(false);
            }
            long j3 = j2;
            r28 r28VarN = bgf.N(jfc.f(r28VarR, 48.0f, 0.0f, 2), "bottom_action_bar_repost_count_button");
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            jjd.b(dq1.g(Integer.valueOf(num != null ? num.intValue() : 0)), bgf.N(o28Var, "bottom_action_bar_repost_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(rz5.D(p65Var).n, j3, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gu0(num, y7bVar, z, str, str2, pu0Var, r28Var2, i2, 0);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0342  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x0346  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x036e  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x039e  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0178  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(defpackage.y7b r35, defpackage.zu0 r36, java.lang.String r37, defpackage.g08 r38, defpackage.pu0 r39, defpackage.r28 r40, defpackage.x12 r41, int r42) {
        /*
            Method dump skipped, instruction units count: 1048
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyd.s(y7b, zu0, java.lang.String, g08, pu0, r28, x12, int):void");
    }

    public static final void t(dv0 dv0Var, String str, String str2, pu0 pu0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        o28 o28Var;
        bv0 bv0Var;
        boolean z;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(741290908);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dv0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(str2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(pu0Var) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            r28 r28VarC = jfc.c(r28Var, 1.0f);
            boolean z3 = dv0Var instanceof cv0;
            String strR = vo7.R(p65Var, R.string.bottom_action_bar_responses_cd);
            boolean z4 = ((i3 & 896) == 256) | ((i3 & 7168) == 2048) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z4 || objM == w12.a) {
                objM = new eu0(pu0Var, str, str2, 0);
                p65Var.j0(objM);
            }
            r28 r28VarR = hlg.r(r28VarC, z3, strR, null, (m45) objM, 12);
            omb ombVarA = nmb.a(qb8.e, z46.n, p65Var, 54);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            o28 o28Var2 = o28.b;
            r28 r28VarL = jfc.l(o28Var2, 24.0f);
            bv0 bv0Var2 = bv0.a;
            if (z3) {
                p65Var.Y(-315254227);
                o28Var = o28Var2;
                bv0Var = bv0Var2;
                z = false;
                qv5.b(vn7.J(R.drawable.ic_respond_24, 0, p65Var), null, r28VarL, rz5.A(p65Var).o, p65Var, 440, 0);
                p65Var.p(false);
            } else {
                o28Var = o28Var2;
                bv0Var = bv0Var2;
                z = false;
                if (!dv0Var.equals(bv0Var) && !(dv0Var instanceof av0)) {
                    throw ho2.L(p65Var, 266922871, false);
                }
                p65Var.Y(-314797349);
                qv5.b(vn7.J(R.drawable.ic_respond_filled_24, 0, p65Var), null, r28VarL, uu1.b(0.4f, rz5.A(p65Var).o), p65Var, 440, 0);
                p65Var.p(false);
            }
            r28 r28VarG = w2g.G(o28Var, 4.0f, 0.0f, 0.0f, 0.0f, 14);
            if (z3) {
                p65Var.Y(-314293041);
                Integer num = ((cv0) dv0Var).a;
                if (num == null || num.intValue() <= 0) {
                    z2 = true;
                    p65Var.Y(-323060182);
                } else {
                    p65Var.Y(-314199297);
                    z2 = true;
                    jjd.b(dq1.g(num), r28VarG, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(rz5.D(p65Var).n, rz5.A(p65Var).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
                    p65Var = p65Var;
                }
                p65Var.p(z);
                p65Var.p(z);
            } else {
                z2 = true;
                if (dv0Var.equals(bv0Var)) {
                    p65Var.Y(-313732561);
                    jjd.b(vo7.R(p65Var, R.string.common_count_placeholder), r28VarG, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(rz5.D(p65Var).n, rz5.A(p65Var).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
                    p65Var = p65Var;
                    p65Var.p(z);
                } else {
                    if (!(dv0Var instanceof av0)) {
                        throw ho2.L(p65Var, 266954357, z);
                    }
                    p65Var.Y(-313317719);
                    Integer num2 = ((av0) dv0Var).a;
                    if (num2 != null) {
                        p65Var.Y(-313259532);
                        jjd.b(dq1.g(num2), r28VarG, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(rz5.D(p65Var).n, uu1.b(0.4f, rz5.A(p65Var).o), 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
                        p65Var = p65Var;
                    } else {
                        p65Var.Y(-323060182);
                    }
                    p65Var.p(z);
                    p65Var.p(z);
                }
            }
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(dv0Var, str, str2, pu0Var, r28Var, i2, 4);
        }
    }

    public static final void u(hv0 hv0Var, g08 g08Var, pu0 pu0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1661884072);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(hv0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(g08Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(pu0Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarC = jfc.c(r28Var, 1.0f);
            boolean z = hv0Var instanceof fv0;
            String strR = vo7.R(p65Var, R.string.common_share);
            boolean z2 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4) | ((i3 & 896) == 256);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new le0(hv0Var, pu0Var, g08Var, 6);
                p65Var.j0(objM);
            }
            r28 r28VarR = hlg.r(r28VarC, z, strR, null, (m45) objM, 12);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) ((j2 >>> 32) ^ j2);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            if (z) {
                p65Var.Y(-622989919);
                qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var), null, null, ((zo7) p65Var.j(kt7.b)).o, p65Var, 56, 4);
                p65Var.p(false);
            } else {
                if (!hv0Var.equals(gv0.a) && !hv0Var.equals(ev0.a)) {
                    throw ho2.L(p65Var, -2098308483, false);
                }
                p65Var.Y(-622585834);
                qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var), null, null, uu1.b(0.4f, ((zo7) p65Var.j(kt7.b)).o), p65Var, 56, 4);
                p65Var.p(false);
            }
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 8, hv0Var, g08Var, pu0Var, r28Var);
        }
    }

    public static final void v(m45 m45Var, x12 x12Var) {
        qv8 qv8Var = ((p65) x12Var).M.b.s;
        qv8Var.I(xu8.d);
        gq7.S(qv8Var, 0, m45Var);
    }

    public static final void w(yed yedVar, bo4 bo4Var, ted tedVar, e9d e9dVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1382335790);
        int i3 = i2 | (p65Var2.f(yedVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(tedVar) ? 256 : 128) | (p65Var2.f(e9dVar) ? 2048 : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            boolean z = ((i3 & 14) == 4) | ((i3 & 7168) == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new pda(yedVar, 24, e9dVar);
                p65Var2.j0(objM);
            }
            k40.t(null, kv6VarA, null, null, null, null, false, null, (x45) objM, p65Var2, 0, 509);
            p65Var = p65Var2;
            int i4 = i3 & 896;
            boolean zF = p65Var.f(kv6VarA) | (i4 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM2 == uobVar) {
                objM2 = new eub(kv6VarA, tedVar, n92Var, 29);
                p65Var.j0(objM2);
            }
            k(p65Var, (b55) objM2, kv6VarA);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = bjc.b(new f91(kv6VarA, 12));
                p65Var.j0(objM3);
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            boolean z2 = i4 == 256;
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar) {
                objM4 = new n79(tedVar, upcVar, n92Var, 23);
                p65Var.j0(objM4);
            }
            k(p65Var, (b55) objM4, bool);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                objM5 = new wi1(bo4Var, kv6VarA, n92Var, 10);
                p65Var.j0(objM5);
            }
            k(p65Var, (b55) objM5, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 15, yedVar, bo4Var, tedVar, e9dVar);
        }
    }

    public static final void x(b24 b24Var, ted tedVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(10903312);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(tedVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            rh4 rh4Var = jfc.c;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ibd ibdVar = new ibd(0, tedVar, ted.class, "onRefresh", "onRefresh()V", 0, 6);
                p65Var.j0(ibdVar);
                objM = ibdVar;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 3, b24Var, tedVar, r28Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v24 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [int] */
    public static final void y(r28 r28Var, x12 x12Var, int i2) {
        ?? r4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(870624133);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
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
            p65Var.Y(2109534417);
            int i5 = 0;
            while (i5 < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j3 = p65Var.T;
                int i6 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i6);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                char c3 = c2;
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j4 = p65Var.T;
                int i7 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                vn7.g(null, p65Var, 0);
                p65Var.p(true);
                p65Var.p(true);
                i5++;
                c2 = c3;
                z = true;
            }
            boolean z2 = z;
            p65Var.p(false);
            p65Var.p(z2);
            r4 = z2;
        } else {
            r4 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, r4);
        }
    }

    public static final void z(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1994422981);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            gq7.a(jfc.c, null, vo7.R(p65Var, R.string.search_tags_none_found), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 6, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 0);
        }
    }
}
