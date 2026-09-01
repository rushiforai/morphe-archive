package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.Region;
import android.os.Bundle;
import android.os.Trace;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import androidx.credentials.exceptions.NoCredentialException;
import androidx.credentials.internal.FrameworkClassParsingException;
import com.apollographql.apollo.exception.NullOrMissingField;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.reader.R;
import com.squareup.wire.sjIw.ezwlgQm;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class kng implements png {
    public static final /* synthetic */ int A = 0;
    public static final mz1 c;
    public static final mz1 m;
    public static volatile bpf x;
    public static final /* synthetic */ int y = 0;
    public static final /* synthetic */ int z = 0;
    public static final Object[] a = new Object[0];
    public static final mz1 b = new mz1(new yz1(23), false, 1250646356);
    public static final mz1 d = new mz1(new j02(13), false, 1275243942);
    public static final mz1 e = new mz1(new j02(14), false, -1163674545);
    public static final mz1 f = new mz1(new j02(15), false, 1487343982);
    public static final mz1 g = new mz1(new j02(16), false, -156604787);
    public static final mz1 h = new mz1(new l02(24), false, -421251072);
    public static final mz1 i = new mz1(new l02(25), false, -1613935007);
    public static final mz1 j = new mz1(new l02(26), false, 1593796617);
    public static final mz1 k = new mz1(new u02(10), false, 1316444063);
    public static final mz1 l = new mz1(new u02(11), false, 22930769);
    public static final l13 n = new l13(4);
    public static final l13 o = new l13(6);
    public static final l13 p = new l13(3);
    public static final l13 q = new l13(5);
    public static final l13 r = new l13(2);
    public static final StackTraceElement[] s = new StackTraceElement[0];
    public static final zwa t = new zwa(0.0f, 0.0f, 10.0f, 10.0f);
    public static final int[] u = {R.attr.colorPrimary};
    public static final int[] v = {R.attr.colorPrimaryVariant};
    public static final Object w = new Object();

    static {
        int i2 = 12;
        c = new mz1(new j02(i2), false, 1458894304);
        m = new mz1(new zz1(i2), false, 1911491284);
    }

    public static final void A(x45 x45Var, k68 k68Var, olb olbVar, olb olbVar2, zxb zxbVar, zxb zxbVar2) {
        olb olbVar3 = olbVar;
        Region region = (Region) olbVar3.b;
        olb olbVar4 = olbVar2;
        Region region2 = (Region) olbVar4.b;
        aq6 aq6Var = zxbVar2.c;
        aq6 aq6Var2 = zxbVar2.c;
        if (!aq6Var.I() || !aq6Var2.H() || region2.isEmpty()) {
            if (zxbVar2.n()) {
                B(k68Var, zxbVar, zxbVar2);
                return;
            }
            return;
        }
        zwa zwaVarM = zxbVar2.m();
        if (zwaVarM.f()) {
            a43 a43VarF = zxbVar2.f();
            if (a43VarF == null) {
                l26 l26Var = (l26) aq6Var2.F.d;
                zwaVarM = sgg.K(l26Var).H(l26Var, false);
            } else {
                q28 q28Var = ((q28) a43VarF).a;
                Object objG = zxbVar2.d.a.g(sxb.b);
                if (objG == null) {
                    objG = null;
                }
                zwaVarM = dl7.l(q28Var, objG != null, false);
            }
        }
        o46 o46VarC0 = g76.c0(zwaVarM);
        olbVar3.x(o46VarC0);
        if (region.op(region2, Region.Op.INTERSECT)) {
            int i2 = zxbVar2.f;
            if (i2 == zxbVar.f) {
                i2 = -1;
            }
            Rect bounds = region.getBounds();
            k68Var.i(i2, new byb(zxbVar2, new o46(bounds.left, bounds.top, bounds.right, bounds.bottom)));
            List listJ = zxb.j(4, zxbVar2);
            int size = listJ.size() - 1;
            while (-1 < size) {
                if (!((Boolean) x45Var.invoke(listJ.get(size))).booleanValue()) {
                    A(x45Var, k68Var, olbVar3, olbVar4, zxbVar, (zxb) listJ.get(size));
                }
                size--;
                olbVar3 = olbVar;
                olbVar4 = olbVar2;
            }
            if (I(zxbVar2)) {
                region2.op(o46VarC0.a, o46VarC0.b, o46VarC0.c, o46VarC0.d, Region.Op.DIFFERENCE);
            }
        }
    }

    public static final void B(k68 k68Var, zxb zxbVar, zxb zxbVar2) {
        aq6 aq6Var;
        zxb zxbVarL = zxbVar2.l();
        zwa zwaVarG = (zxbVarL == null || (aq6Var = zxbVarL.c) == null || !aq6Var.I()) ? t : zxbVarL.g();
        int i2 = zxbVar2.f;
        if (i2 == zxbVar.f) {
            i2 = -1;
        }
        k68Var.i(i2, new byb(zxbVar2, g76.c0(zwaVarG)));
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x015b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void C(defpackage.x45 r17, defpackage.k68 r18, defpackage.olb r19, defpackage.olb r20, defpackage.zxb r21, defpackage.zxb r22) {
        /*
            Method dump skipped, instruction units count: 473
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kng.C(x45, k68, olb, olb, zxb, zxb):void");
    }

    public static ColorStateList D(Context context, TypedArray typedArray, int i2) {
        int resourceId;
        ColorStateList colorStateListL;
        return (!typedArray.hasValue(i2) || (resourceId = typedArray.getResourceId(i2, 0)) == 0 || (colorStateListL = nm.l(context, resourceId)) == null) ? typedArray.getColorStateList(i2) : colorStateListL;
    }

    public static final u12 E(View view) {
        Object tag = view.getTag(R.id.androidx_compose_ui_view_compose_view_context);
        WeakReference weakReference = tag instanceof WeakReference ? (WeakReference) tag : null;
        if (weakReference != null) {
            return (u12) weakReference.get();
        }
        return null;
    }

    public static final Object F(tk7 tk7Var) {
        Object objW = tk7Var.w();
        np6 np6Var = objW instanceof np6 ? (np6) objW : null;
        if (np6Var != null) {
            return np6Var.s();
        }
        return null;
    }

    public static boolean G(s55 s55Var) {
        if (s55Var.j() != e41.SYNTHESIZED) {
            return false;
        }
        yv2 yv2VarH = s55Var.h();
        int i2 = d93.a;
        return d93.m(yv2VarH, qn1.ENUM_CLASS);
    }

    public static final boolean H(zxb zxbVar) {
        eh8 eh8VarD = zxbVar.d();
        f78 f78Var = zxbVar.d.a;
        return (eh8VarD != null ? eh8VarD.W0() : false) || f78Var.c(eyb.q) || f78Var.c(eyb.p);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean I(defpackage.zxb r14) {
        /*
            boolean r0 = H(r14)
            r1 = 0
            if (r0 != 0) goto L5b
            txb r14 = r14.d
            boolean r0 = r14.c
            if (r0 != 0) goto L59
            f78 r14 = r14.a
            java.lang.Object[] r0 = r14.b
            java.lang.Object[] r2 = r14.c
            long[] r14 = r14.a
            int r3 = r14.length
            int r3 = r3 + (-2)
            if (r3 < 0) goto L5b
            r4 = r1
        L1b:
            r5 = r14[r4]
            long r7 = ~r5
            r9 = 7
            long r7 = r7 << r9
            long r7 = r7 & r5
            r9 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r7 = r7 & r9
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L54
            int r7 = r4 - r3
            int r7 = ~r7
            int r7 = r7 >>> 31
            r8 = 8
            int r7 = 8 - r7
            r9 = r1
        L35:
            if (r9 >= r7) goto L52
            r10 = 255(0xff, double:1.26E-321)
            long r10 = r10 & r5
            r12 = 128(0x80, double:6.3E-322)
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 >= 0) goto L4e
            int r10 = r4 << 3
            int r10 = r10 + r9
            r11 = r0[r10]
            r10 = r2[r10]
            iyb r11 = (defpackage.iyb) r11
            boolean r10 = r11.c
            if (r10 == 0) goto L4e
            goto L59
        L4e:
            long r5 = r5 >> r8
            int r9 = r9 + 1
            goto L35
        L52:
            if (r7 != r8) goto L5b
        L54:
            if (r4 == r3) goto L5b
            int r4 = r4 + 1
            goto L1b
        L59:
            r14 = 1
            return r14
        L5b:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kng.I(zxb):boolean");
    }

    public static final r28 J(r28 r28Var, Object obj) {
        return r28Var.b(new lp6(obj));
    }

    public static final mya K(b55 b55Var, x45 x45Var) {
        gd gdVar = new gd(4, b55Var);
        pwd.B(1, x45Var);
        return new mya(gdVar, 3, x45Var);
    }

    public static final void L(fd6 fd6Var, String str) {
        StringBuilder sbU = lv8.u("Field '", str, "' is missing or null at path ");
        sbU.append(fd6Var.h());
        throw new NullOrMissingField(sbU.toString(), null);
    }

    public static int M(Context context, int i2) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(android.R.style.Animation.Activity, new int[]{i2});
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, -1);
        typedArrayObtainStyledAttributes.recycle();
        return resourceId;
    }

    public static final Object[] N(Collection collection) {
        collection.getClass();
        int size = collection.size();
        Object[] objArr = a;
        if (size == 0) {
            return objArr;
        }
        Iterator it2 = collection.iterator();
        if (!it2.hasNext()) {
            return objArr;
        }
        Object[] objArrCopyOf = new Object[size];
        int i2 = 0;
        while (true) {
            int i3 = i2 + 1;
            objArrCopyOf[i2] = it2.next();
            if (i3 >= objArrCopyOf.length) {
                if (!it2.hasNext()) {
                    return objArrCopyOf;
                }
                int i4 = ((i3 * 3) + 1) >>> 1;
                if (i4 <= i3) {
                    i4 = 2147483645;
                    if (i3 >= 2147483645) {
                        throw new OutOfMemoryError();
                    }
                }
                objArrCopyOf = Arrays.copyOf(objArrCopyOf, i4);
            } else if (!it2.hasNext()) {
                return Arrays.copyOf(objArrCopyOf, i3);
            }
            i2 = i3;
        }
    }

    public static final Object[] O(Collection collection, Object[] objArr) {
        Object[] objArrCopyOf;
        collection.getClass();
        objArr.getClass();
        int size = collection.size();
        int i2 = 0;
        if (size != 0) {
            Iterator it2 = collection.iterator();
            if (it2.hasNext()) {
                if (size <= objArr.length) {
                    objArrCopyOf = objArr;
                } else {
                    Object objNewInstance = Array.newInstance(objArr.getClass().getComponentType(), size);
                    objNewInstance.getClass();
                    objArrCopyOf = (Object[]) objNewInstance;
                }
                while (true) {
                    int i3 = i2 + 1;
                    objArrCopyOf[i2] = it2.next();
                    if (i3 >= objArrCopyOf.length) {
                        if (!it2.hasNext()) {
                            return objArrCopyOf;
                        }
                        int i4 = ((i3 * 3) + 1) >>> 1;
                        if (i4 <= i3) {
                            i4 = 2147483645;
                            if (i3 >= 2147483645) {
                                throw new OutOfMemoryError();
                            }
                        }
                        objArrCopyOf = Arrays.copyOf(objArrCopyOf, i4);
                    } else if (!it2.hasNext()) {
                        if (objArrCopyOf != objArr) {
                            return Arrays.copyOf(objArrCopyOf, i3);
                        }
                        objArr[i3] = null;
                        return objArr;
                    }
                    i2 = i3;
                }
            } else if (objArr.length > 0) {
                objArr[0] = null;
            }
        } else if (objArr.length > 0) {
            objArr[0] = null;
            return objArr;
        }
        return objArr;
    }

    public static mn1 P(y05 y05Var) {
        y05Var.getClass();
        return new mn1(y05Var.b(), y05Var.a.g());
    }

    public static exd Q(exd exdVar) {
        int i2 = 0;
        if (!(exdVar instanceof q06)) {
            return new o61(exdVar, i2);
        }
        q06 q06Var = (q06) exdVar;
        swd[] swdVarArr = q06Var.b;
        xwd[] xwdVarArr = q06Var.c;
        xwdVarArr.getClass();
        swdVarArr.getClass();
        int iMin = Math.min(xwdVarArr.length, swdVarArr.length);
        ArrayList<f09> arrayList = new ArrayList(iMin);
        for (int i3 = 0; i3 < iMin; i3++) {
            arrayList.add(new f09(xwdVarArr[i3], swdVarArr[i3]));
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        for (f09 f09Var : arrayList) {
            arrayList2.add(l((xwd) f09Var.a, (swd) f09Var.b));
        }
        return new q06(swdVarArr, (xwd[]) arrayList2.toArray(new xwd[0]), true);
    }

    public static /* synthetic */ void a(int i2) {
        String str = (i2 == 12 || i2 == 23 || i2 == 25) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i2 == 12 || i2 == 23 || i2 == 25) ? 2 : 3];
        switch (i2) {
            case 1:
            case 4:
            case 8:
            case 14:
            case 16:
            case 18:
            case 31:
            case 33:
            case 35:
                objArr[0] = "annotations";
                break;
            case 2:
            case 5:
            case 9:
                objArr[0] = "parameterAnnotations";
                break;
            case 3:
            case 7:
            case 13:
            case 15:
            case 17:
            default:
                objArr[0] = "propertyDescriptor";
                break;
            case 6:
            case 11:
            case 19:
                objArr[0] = "sourceElement";
                break;
            case 10:
                objArr[0] = "visibility";
                break;
            case 12:
            case 23:
            case 25:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/resolve/DescriptorFactory";
                break;
            case 20:
                objArr[0] = "containingClass";
                break;
            case 21:
                objArr[0] = "source";
                break;
            case 22:
            case 24:
            case 26:
                objArr[0] = "enumClass";
                break;
            case 27:
            case 28:
            case 29:
                objArr[0] = "descriptor";
                break;
            case 30:
            case 32:
            case 34:
                objArr[0] = "owner";
                break;
        }
        if (i2 == 12) {
            objArr[1] = "createSetter";
        } else if (i2 == 23) {
            objArr[1] = "createEnumValuesMethod";
        } else if (i2 != 25) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/resolve/DescriptorFactory";
        } else {
            objArr[1] = "createEnumValueOfMethod";
        }
        switch (i2) {
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                objArr[2] = "createSetter";
                break;
            case 12:
            case 23:
            case 25:
                break;
            case 13:
            case 14:
                objArr[2] = "createDefaultGetter";
                break;
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
                objArr[2] = "createGetter";
                break;
            case 20:
            case 21:
                objArr[2] = "createPrimaryConstructorForObject";
                break;
            case 22:
                objArr[2] = "createEnumValuesMethod";
                break;
            case 24:
                objArr[2] = "createEnumValueOfMethod";
                break;
            case 26:
                objArr[2] = "createEnumEntriesProperty";
                break;
            case 27:
                objArr[2] = "isEnumValuesMethod";
                break;
            case 28:
                objArr[2] = "isEnumValueOfMethod";
                break;
            case 29:
                objArr[2] = "isEnumSpecialMethod";
                break;
            case 30:
            case 31:
                objArr[2] = "createExtensionReceiverParameterForCallable";
                break;
            case 32:
            case 33:
                objArr[2] = "createContextReceiverParameterForCallable";
                break;
            case 34:
            case 35:
                objArr[2] = "createContextReceiverParameterForClass";
                break;
            default:
                objArr[2] = "createDefaultSetter";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i2 != 12 && i2 != 23 && i2 != 25) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public static /* synthetic */ void b(int i2) {
        Object[] objArr = new Object[3];
        switch (i2) {
            case 1:
                objArr[0] = "member";
                break;
            case 2:
            case 4:
            case 6:
            case 8:
                objArr[0] = "descriptor";
                break;
            case 3:
                objArr[0] = "element";
                break;
            case 5:
                objArr[0] = "field";
                break;
            case 7:
                objArr[0] = "javaClass";
                break;
            default:
                objArr[0] = "fqName";
                break;
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/components/JavaResolverCache$1";
        switch (i2) {
            case 1:
            case 2:
                objArr[2] = "recordMethod";
                break;
            case 3:
            case 4:
                objArr[2] = "recordConstructor";
                break;
            case 5:
            case 6:
                objArr[2] = "recordField";
                break;
            case 7:
            case 8:
                objArr[2] = "recordClass";
                break;
            default:
                objArr[2] = "getClassResolvedFromSource";
                break;
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }

    public static final void c(final m45 m45Var, final mz1 mz1Var, final r28 r28Var, final b55 b55Var, final b55 b55Var2, final b55 b55Var3, m3c m3cVar, long j2, long j3, pb3 pb3Var, x12 x12Var, final int i2) {
        int i3;
        r28 r28Var2;
        b55 b55Var4;
        b55 b55Var5;
        p65 p65Var;
        final m3c m3cVar2;
        final long j4;
        final long j5;
        final pb3 pb3Var2;
        int i4;
        m3c m3cVar3;
        pb3 pb3Var3;
        long j6;
        long j7;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1967984963);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.h(mz1Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            r28Var2 = r28Var;
            i3 |= p65Var2.f(r28Var2) ? 256 : 128;
        } else {
            r28Var2 = r28Var;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.h(b55Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            b55Var4 = b55Var2;
            i3 |= p65Var2.h(b55Var4) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            b55Var4 = b55Var2;
        }
        if ((196608 & i2) == 0) {
            b55Var5 = b55Var3;
            i3 |= p65Var2.h(b55Var5) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            b55Var5 = b55Var3;
        }
        if ((1572864 & i2) == 0) {
            i3 |= 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= 33554432;
        }
        int i5 = i3 | 805306368;
        if (p65Var2.P(i5 & 1, (306783379 & i5) != 306783378)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                amb ambVar = ((x4c) p65Var2.j(a5c.a)).b;
                long jE = ((sv1) p65Var2.j(tv1.a)).e();
                long jB = tv1.b(jE, p65Var2);
                i4 = i5 & (-267911169);
                m3cVar3 = ambVar;
                pb3Var3 = new pb3(7);
                j6 = jE;
                j7 = jB;
            } else {
                p65Var2.S();
                i4 = i5 & (-267911169);
                m3cVar3 = m3cVar;
                j6 = j2;
                j7 = j3;
                pb3Var3 = pb3Var;
            }
            p65Var2.q();
            int i6 = (2147483646 & i4) >> 3;
            p65Var = p65Var2;
            d(m45Var, pxf.E(-309297447, new nd(b55Var, mz1Var, 3), p65Var2), r28Var2, b55Var4, b55Var5, m3cVar3, j6, j7, pb3Var3, p65Var, (i4 & 896) | (i4 & 14) | 48 | (i6 & 7168) | (57344 & i6) | (i6 & 234881024));
            m3cVar2 = m3cVar3;
            j4 = j6;
            j5 = j7;
            pb3Var2 = pb3Var3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            m3cVar2 = m3cVar;
            j4 = j2;
            j5 = j3;
            pb3Var2 = pb3Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: dm
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    kng.c(m45Var, mz1Var, r28Var, b55Var, b55Var2, b55Var3, m3cVar2, j4, j5, pb3Var2, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void d(m45 m45Var, mz1 mz1Var, r28 r28Var, b55 b55Var, b55 b55Var2, m3c m3cVar, long j2, long j3, pb3 pb3Var, x12 x12Var, int i2) {
        m45 m45Var2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1409209698);
        if ((i2 & 6) == 0) {
            m45Var2 = m45Var;
            i3 = (p65Var.h(m45Var2) ? 4 : 2) | i2;
        } else {
            m45Var2 = m45Var;
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(b55Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.h(b55Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(m3cVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.e(j2) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var.e(j3) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= p65Var.f(pb3Var) ? 67108864 : 33554432;
        }
        if (p65Var.P(i3 & 1, (38347923 & i3) != 38347922)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            m40.h(m45Var2, pb3Var, pxf.E(-488319269, new pd(mz1Var, r28Var, b55Var, b55Var2, m3cVar, j2, j3), p65Var), p65Var, (i3 & 14) | 384 | (((268435454 & i3) >> 21) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new em(m45Var, mz1Var, r28Var, b55Var, b55Var2, m3cVar, j2, j3, pb3Var, i2);
        }
    }

    public static final void e(String str, boolean z2, r28 r28Var, long j2, m45 m45Var, x12 x12Var, int i2) {
        r28 r28Var2;
        r28 r28Var3;
        str.getClass();
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1143929357);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.g(z2) ? 32 : 16) | 384 | (p65Var.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(m45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            f49.l(m45Var, bgf.N(r28Var3, "bookmark_button"), false, null, null, pxf.E(-730876373, new kt0(j2, str, z2), p65Var), p65Var, ((i3 >> 12) & 14) | 1572864, 60);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ds(str, z2, r28Var2, j2, m45Var, i2);
        }
    }

    public static final int f(fb7 fb7Var, yd ydVar) {
        fb7 fb7VarR0 = fb7Var.r0();
        if (fb7VarR0 == null) {
            b26.b("Child of " + fb7Var + " cannot be null when calculating alignment line");
        }
        if (fb7Var.w0().c().containsKey(ydVar)) {
            Integer num = (Integer) fb7Var.w0().c().get(ydVar);
            if (num != null) {
                return num.intValue();
            }
        } else {
            int iM = fb7VarR0.M(ydVar);
            if (iM != Integer.MIN_VALUE) {
                fb7VarR0.j = true;
                fb7Var.k = true;
                fb7Var.C0();
                fb7VarR0.j = false;
                fb7Var.k = false;
                return iM + ((int) (ydVar instanceof fr5 ? fb7VarR0.y0() & 4294967295L : fb7VarR0.y0() >> 32));
            }
        }
        return Integer.MIN_VALUE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.io.Serializable g(defpackage.bo4 r6, defpackage.do4 r7, defpackage.p92 r8) throws java.lang.Throwable {
        /*
            boolean r0 = r8 instanceof defpackage.vo4
            if (r0 == 0) goto L13
            r0 = r8
            vo4 r0 = (defpackage.vo4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            vo4 r0 = new vo4
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2c
            rya r6 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L2a
            return r4
        L2a:
            r7 = move-exception
            goto L4a
        L2c:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r4
        L32:
            rya r8 = defpackage.ev6.p(r8)
            be4 r2 = new be4     // Catch: java.lang.Throwable -> L48
            r5 = 2
            r2.<init>(r7, r8, r5)     // Catch: java.lang.Throwable -> L48
            r0.b = r8     // Catch: java.lang.Throwable -> L48
            r0.d = r3     // Catch: java.lang.Throwable -> L48
            java.lang.Object r6 = r6.b(r2, r0)     // Catch: java.lang.Throwable -> L48
            if (r6 != r1) goto L47
            return r1
        L47:
            return r4
        L48:
            r7 = move-exception
            r6 = r8
        L4a:
            java.lang.Object r6 = r6.a
            java.lang.Throwable r6 = (java.lang.Throwable) r6
            if (r6 == 0) goto L56
            boolean r8 = r6.equals(r7)
            if (r8 != 0) goto L78
        L56:
            ib2 r8 = r0.getContext()
            cd7 r0 = defpackage.cd7.g
            gb2 r8 = r8.o0(r0)
            va6 r8 = (defpackage.va6) r8
            if (r8 == 0) goto L79
            boolean r0 = r8.isCancelled()
            if (r0 != 0) goto L6b
            goto L79
        L6b:
            java.util.concurrent.CancellationException r8 = r8.L()
            if (r8 == 0) goto L79
            boolean r8 = r8.equals(r7)
            if (r8 != 0) goto L78
            goto L79
        L78:
            throw r7
        L79:
            if (r6 != 0) goto L7c
            return r7
        L7c:
            boolean r8 = r7 instanceof java.util.concurrent.CancellationException
            if (r8 == 0) goto L84
            defpackage.kyd.D(r6, r7)
            throw r6
        L84:
            defpackage.kyd.D(r7, r6)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kng.g(bo4, do4, p92):java.io.Serializable");
    }

    public static void h(Context context, AttributeSet attributeSet, int i2, int i3) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.r, i2, i3);
        boolean z2 = typedArrayObtainStyledAttributes.getBoolean(1, false);
        typedArrayObtainStyledAttributes.recycle();
        if (z2) {
            TypedValue typedValue = new TypedValue();
            if (!context.getTheme().resolveAttribute(R.attr.isMaterialTheme, typedValue, true) || (typedValue.type == 18 && typedValue.data == 0)) {
                j(context, v, "Theme.MaterialComponents");
            }
        }
        j(context, u, "Theme.AppCompat");
    }

    public static void i(Context context, AttributeSet attributeSet, int[] iArr, int i2, int i3, int... iArr2) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.r, i2, i3);
        boolean z2 = false;
        if (!typedArrayObtainStyledAttributes.getBoolean(2, false)) {
            typedArrayObtainStyledAttributes.recycle();
            return;
        }
        if (iArr2.length != 0) {
            TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, iArr, i2, i3);
            for (int i4 : iArr2) {
                if (typedArrayObtainStyledAttributes2.getResourceId(i4, -1) == -1) {
                    typedArrayObtainStyledAttributes2.recycle();
                    break;
                }
            }
            typedArrayObtainStyledAttributes2.recycle();
            z2 = true;
        } else if (typedArrayObtainStyledAttributes.getResourceId(0, -1) != -1) {
            z2 = true;
        }
        typedArrayObtainStyledAttributes.recycle();
        if (z2) {
            return;
        }
        ay0.e("This component requires that you specify a valid TextAppearance attribute. Update your app theme to inherit from Theme.MaterialComponents (or a descendant).");
    }

    public static void j(Context context, int[] iArr, String str) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(iArr);
        for (int i2 = 0; i2 < iArr.length; i2++) {
            if (!typedArrayObtainStyledAttributes.hasValue(i2)) {
                typedArrayObtainStyledAttributes.recycle();
                ay0.e(ev6.x("The style on this component requires your app theme to be ", str, " (or a descendant)."));
                return;
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public static final double k(double d2, mn3 mn3Var, mn3 mn3Var2) {
        mn3Var.getClass();
        mn3Var2.getClass();
        long jConvert = mn3Var2.getTimeUnit$kotlin_stdlib().convert(1L, mn3Var.getTimeUnit$kotlin_stdlib());
        return jConvert > 0 ? d2 * jConvert : d2 / mn3Var.getTimeUnit$kotlin_stdlib().convert(1L, mn3Var2.getTimeUnit$kotlin_stdlib());
    }

    public static final xwd l(xwd xwdVar, swd swdVar) {
        if (swdVar == null || xwdVar.a() == pqe.INVARIANT) {
            return xwdVar;
        }
        if (swdVar.z() != xwdVar.a()) {
            n61 n61Var = new n61(xwdVar);
            uvd.b.getClass();
            return new onc(new j61(xwdVar, n61Var, false, uvd.c));
        }
        if (!xwdVar.c()) {
            return new onc(xwdVar.b());
        }
        o67 o67Var = x67.e;
        o67Var.getClass();
        return new onc(new cx6(o67Var, new v2(5, xwdVar)));
    }

    public static yq6 m(c41 c41Var, mn6 mn6Var, n98 n98Var, ly lyVar, int i2) {
        if (c41Var == null) {
            a(32);
            throw null;
        }
        if (lyVar == null) {
            a(33);
            throw null;
        }
        if (mn6Var == null) {
            return null;
        }
        d92 d92Var = new d92(c41Var, mn6Var, n98Var);
        x2b x2bVar = s98.a;
        return new yq6(c41Var, d92Var, lyVar, n98.e(s98.b + '_' + i2));
    }

    public static s4a n(q4a q4aVar, ly lyVar) {
        return u(q4aVar, lyVar, true, q4aVar.d());
    }

    public static x4a o(q4a q4aVar, ly lyVar) {
        ky kyVar = cd7.e;
        jkc jkcVarD = q4aVar.d();
        if (jkcVarD != null) {
            return v(q4aVar, lyVar, kyVar, true, q4aVar.getVisibility(), jkcVarD);
        }
        a(6);
        throw null;
    }

    public static r4a p(y28 y28Var) {
        if (y28Var == null) {
            a(26);
            throw null;
        }
        b38 b38VarD = d93.d(y28Var);
        b38VarD.getClass();
        y28 y28VarF = d46.F(b38VarD, gnc.A);
        if (y28VarF == null) {
            return null;
        }
        ky kyVar = cd7.e;
        c28 c28Var = c28.FINAL;
        g93 g93Var = h93.e;
        n98 n98Var = mnc.b;
        e41 e41Var = e41.SYNTHESIZED;
        r4a r4aVarZ0 = r4a.z0(y28Var, c28Var, g93Var, false, n98Var, e41Var, y28Var.d());
        s4a s4aVar = new s4a(r4aVarZ0, kyVar, c28Var, g93Var, false, false, false, e41Var, null, y28Var.d());
        r4aVarZ0.C0(s4aVar, null, null, null);
        uvd.b.getClass();
        uvd uvdVar = uvd.c;
        zvd zvdVarN = y28VarF.n();
        List listSingletonList = Collections.singletonList(new onc(y28Var.T()));
        uvdVar.getClass();
        zvdVarN.getClass();
        listSingletonList.getClass();
        hec hecVarY = pwd.Y(uvdVar, zvdVarN, listSingletonList, false);
        List list = Collections.EMPTY_LIST;
        r4aVarZ0.F0(hecVarY, list, null, null, list);
        s4aVar.A0(r4aVarZ0.getReturnType());
        return r4aVarZ0;
    }

    public static bec q(y28 y28Var) {
        if (y28Var == null) {
            a(24);
            throw null;
        }
        ky kyVar = cd7.e;
        bec becVarI0 = bec.I0(y28Var, mnc.c, e41.SYNTHESIZED, y28Var.d());
        lqe lqeVar = new lqe(becVarI0, null, 0, kyVar, n98.e("value"), f93.e(y28Var).u(), false, false, false, null, y28Var.d());
        List list = Collections.EMPTY_LIST;
        return becVarI0.D0(null, null, list, list, Collections.singletonList(lqeVar), y28Var.T(), c28.FINAL, h93.e);
    }

    public static bec r(y28 y28Var) {
        if (y28Var == null) {
            a(22);
            throw null;
        }
        bec becVarI0 = bec.I0(y28Var, mnc.a, e41.SYNTHESIZED, y28Var.d());
        List list = Collections.EMPTY_LIST;
        return becVarI0.D0(null, null, list, list, list, f93.e(y28Var).h(y28Var.T(), pqe.INVARIANT), c28.FINAL, h93.e);
    }

    public static yq6 s(c41 c41Var, mn6 mn6Var, ly lyVar) {
        if (mn6Var == null) {
            return null;
        }
        return new yq6(c41Var, new l74(c41Var, mn6Var), lyVar);
    }

    public static s4a u(q4a q4aVar, ly lyVar, boolean z2, jkc jkcVar) {
        if (lyVar == null) {
            a(18);
            throw null;
        }
        if (jkcVar != null) {
            return new s4a(q4aVar, lyVar, q4aVar.o(), q4aVar.getVisibility(), z2, false, false, e41.DECLARATION, null, jkcVar);
        }
        a(19);
        throw null;
    }

    public static x4a v(q4a q4aVar, ly lyVar, ly lyVar2, boolean z2, g93 g93Var, jkc jkcVar) {
        if (lyVar == null) {
            a(8);
            throw null;
        }
        if (lyVar2 == null) {
            a(9);
            throw null;
        }
        if (g93Var == null) {
            a(10);
            throw null;
        }
        if (jkcVar == null) {
            a(11);
            throw null;
        }
        x4a x4aVar = new x4a(q4aVar, lyVar, q4aVar.o(), g93Var, z2, false, false, e41.DECLARATION, null, jkcVar);
        x4aVar.n = x4a.z0(x4aVar, q4aVar.getType(), lyVar2);
        return x4aVar;
    }

    public static final int w(View view, int i2) {
        int i3 = 0;
        int i4 = Integer.MAX_VALUE;
        Object obj = null;
        while (view != null) {
            Object tag = view.getTag(i2);
            if (tag != null) {
                if (obj != null) {
                    if (!tag.equals(obj)) {
                        break;
                    }
                } else {
                    obj = tag;
                }
                i4 = i3;
            }
            i3++;
            Object objU = ep7.u(view);
            view = objU instanceof View ? (View) objU : null;
        }
        return i4;
    }

    public static final View x(View view) {
        if (!view.isAttachedToWindow()) {
            return view;
        }
        int iMin = Math.min(w(view, R.id.view_tree_lifecycle_owner), w(view, R.id.view_tree_saved_state_registry_owner));
        View view2 = view;
        int i2 = 0;
        View view3 = view2;
        while (view != null) {
            if (i2 == iMin) {
                if (!(view.getParent() instanceof ViewGroup)) {
                    return view2;
                }
            } else if (E(view) == null) {
                i2++;
                Object objU = ep7.u(view);
                View view4 = view2;
                view2 = view;
                view = objU instanceof View ? (View) objU : null;
                view3 = view4;
            }
            return view;
        }
        return view3;
    }

    public static mn1 y(String str, boolean z2) {
        String strL;
        str.getClass();
        int iY = muc.Y(str, '`', 0, 6);
        if (iY == -1) {
            iY = str.length();
        }
        int iE0 = muc.e0(str, iY, 4, "/");
        String str2 = "";
        if (iE0 == -1) {
            strL = tuc.L(str, "`", "");
        } else {
            String strReplace = str.substring(0, iE0).replace('/', '.');
            strReplace.getClass();
            strL = tuc.L(str.substring(iE0 + 1), "`", "");
            str2 = strReplace;
        }
        return new mn1(new y05(str2), new y05(strL), z2);
    }

    public static final k68 z(cyb cybVar, x45 x45Var) {
        Trace.beginSection("getAllUncoveredSemanticsNodesToIntObjectMap");
        try {
            zxb zxbVarA = cybVar.a();
            aq6 aq6Var = zxbVarA.c;
            if (aq6Var.I() && aq6Var.H()) {
                zwa zwaVarG = zxbVarA.g();
                k68 k68Var = new k68(48);
                olb olbVar = new olb(29);
                olbVar.x(g76.c0(zwaVarG));
                C(x45Var, k68Var, new olb(29), olbVar, zxbVarA, zxbVarA);
                return k68Var;
            }
            k68 k68Var2 = j46.a;
            k68Var2.getClass();
            return k68Var2;
        } finally {
            Trace.endSection();
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static n4 t(String str, Bundle bundle) throws NoCredentialException {
        str.getClass();
        bundle.getClass();
        try {
            switch (str.hashCode()) {
                case -1678407252:
                    if (str.equals("androidx.credentials.TYPE_DIGITAL_CREDENTIAL")) {
                        try {
                            Object obj = bundle.get("androidx.credentials.BUNDLE_KEY_REQUEST_JSON");
                            obj.getClass();
                            return obj instanceof byte[] ? new te3(new String((byte[]) obj, wk1.a), bundle, 0) : new te3((String) obj, bundle, 0);
                        } catch (Exception unused) {
                            throw new FrameworkClassParsingException();
                        }
                    }
                    throw new FrameworkClassParsingException();
                case -1072734346:
                    if (str.equals("androidx.credentials.TYPE_RESTORE_CREDENTIAL")) {
                        String string = bundle.getString("androidx.credentials.BUNDLE_KEY_GET_RESTORE_CREDENTIAL_RESPONSE");
                        if (string == null) {
                            throw new NoCredentialException("The device does not contain a restore credential.");
                        }
                        te3 te3Var = new te3("androidx.credentials.TYPE_RESTORE_CREDENTIAL", bundle);
                        if (string.length() != 0) {
                            try {
                                new JSONObject(string);
                                return te3Var;
                            } catch (Exception unused2) {
                            }
                        }
                        throw new IllegalArgumentException("authenticationResponseJson must not be empty, and must be a valid JSON");
                    }
                    throw new FrameworkClassParsingException();
                case -543568185:
                    if (str.equals("android.credentials.TYPE_PASSWORD_CREDENTIAL")) {
                        try {
                            String string2 = bundle.getString("androidx.credentials.BUNDLE_KEY_ID");
                            String string3 = bundle.getString("androidx.credentials.BUNDLE_KEY_PASSWORD");
                            string2.getClass();
                            string3.getClass();
                            return new te3(string3, bundle, 1);
                        } catch (Exception unused3) {
                            throw new FrameworkClassParsingException();
                        }
                    }
                    throw new FrameworkClassParsingException();
                case -95037569:
                    if (str.equals("androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL")) {
                        try {
                            String string4 = bundle.getString(ezwlgQm.edNJkYMgKK);
                            string4.getClass();
                            return new te3(string4, bundle, 2);
                        } catch (Exception unused4) {
                            throw new FrameworkClassParsingException();
                        }
                    }
                    throw new FrameworkClassParsingException();
                default:
                    throw new FrameworkClassParsingException();
            }
        } catch (FrameworkClassParsingException unused5) {
            return new tl2(str, bundle);
        }
    }
}
