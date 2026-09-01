package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Matrix;
import android.os.Build;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.CatalogName;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.susi.ui.signIn.SignInFragment;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t40 {
    public static boolean a;
    public static final mz1 b = new mz1(new e02(10), false, 926865964);
    public static final mz1 c = new mz1(new a02(21), false, 34364962);
    public static final mz1 d = new mz1(new l02(27), false, -1314341233);
    public static final mz1 e = new mz1(new l02(28), false, -1448923922);
    public static final mz1 f = new mz1(new zz1(7), false, -1354528434);
    public static final mz1 g = new mz1(new u02(19), false, -2057615024);
    public static final lr h = new lr(PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE);
    public static final lr i;
    public static final lr j;
    public static final z0g k;
    public static final cig l;
    public static final /* synthetic */ int m = 0;
    public static final /* synthetic */ int n = 0;
    public static final /* synthetic */ int o = 0;
    public static final /* synthetic */ int p = 0;

    static {
        new lr(PhotoshopDirectory.TAG_DISPLAY_INFO_OBSOLETE);
        i = new lr(PhotoshopDirectory.TAG_CAPTION);
        j = new lr(PhotoshopDirectory.TAG_XML);
        k = new z0g(7);
        l = new cig(u4g.class, lwf.class);
    }

    public static final void A(nec necVar, y06 y06Var, hw8 hw8Var, x06 x06Var, ad adVar, long j2) {
        float fIntBitsToFloat;
        x68 x68Var = (x68) adVar.c;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (y06Var.c >> 32));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (y06Var.c & 4294967295L));
        if (C(y06Var)) {
            adVar.b = 0;
            x68Var.d();
        }
        if (!D(y06Var) && !C(y06Var)) {
            if (x68Var.b == 3) {
                int i2 = adVar.b;
                adVar.b = i2 + 1;
                x68Var.n(i2, y06Var);
            } else {
                x68Var.a(y06Var);
            }
            if (adVar.b == 3) {
                adVar.b = 0;
            }
            Object[] objArr = x68Var.a;
            int i3 = x68Var.b;
            float fIntBitsToFloat4 = 0.0f;
            for (int i4 = 0; i4 < i3; i4++) {
                fIntBitsToFloat4 += Float.intBitsToFloat((int) (((y06) objArr[i4]).c >> 32));
            }
            int i5 = x68Var.b;
            fIntBitsToFloat2 = fIntBitsToFloat4 / i5;
            Object[] objArr2 = x68Var.a;
            float fIntBitsToFloat5 = 0.0f;
            for (int i6 = 0; i6 < i5; i6++) {
                fIntBitsToFloat5 += Float.intBitsToFloat((int) (((y06) objArr2[i6]).c & 4294967295L));
            }
            fIntBitsToFloat3 = fIntBitsToFloat5 / x68Var.b;
        }
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat3)) & 4294967295L);
        if (hw8Var != null) {
            int i7 = x06Var.a;
            if (i7 == 1) {
                fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32));
            } else if (i7 == 2) {
                fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L));
            }
            jFloatToRawIntBits = hw8Var == hw8.Horizontal ? (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L) : (((long) Float.floatToRawIntBits(fIntBitsToFloat)) & 4294967295L) | (Float.floatToRawIntBits(0.0f) << 32);
        }
        ((f33) necVar.b).a(y06Var.b, ip8.e(jFloatToRawIntBits, j2));
    }

    public static final Integer B(int i2) {
        return new Integer(i2);
    }

    public static final boolean C(y06 y06Var) {
        return !y06Var.h && y06Var.d;
    }

    public static final boolean D(y06 y06Var) {
        return y06Var.h && !y06Var.d;
    }

    public static final hm5 E(wue wueVar, x12 x12Var) {
        if (!(wueVar instanceof pi5)) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(-1968008324);
            p65Var.p(false);
            return null;
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-1968186822);
        Context baseContext = (Context) p65Var2.j(eo.b);
        uue defaultViewModelProviderFactory = ((pi5) wueVar).getDefaultViewModelProviderFactory();
        baseContext.getClass();
        defaultViewModelProviderFactory.getClass();
        while (baseContext instanceof ContextWrapper) {
            if (baseContext instanceof xy1) {
                xm2 xm2Var = (xm2) ((fm5) op8.V(fm5.class, (xy1) baseContext));
                hm5 hm5Var = new hm5(xm2Var.a(), defaultViewModelProviderFactory, new s26(xm2Var.b, 17, xm2Var.c));
                p65Var2.p(false);
                return hm5Var;
            }
            baseContext = ((ContextWrapper) baseContext).getBaseContext();
            baseContext.getClass();
        }
        ik4.o("Expected an activity context for creating a HiltViewModelFactory but instead found: ", baseContext);
        return null;
    }

    public static final r28 F(r28 r28Var, sr4 sr4Var) {
        return r28Var.b(new tr4(sr4Var));
    }

    public static final View G(q28 q28Var) {
        due dueVar = flb.v0(q28Var.a).o;
        View interopView = dueVar != null ? dueVar.getInteropView() : null;
        if (interopView != null) {
            return interopView;
        }
        ygf.f("Could not fetch interop view");
        return null;
    }

    public static i67 H(Configuration configuration) {
        return Build.VERSION.SDK_INT >= 24 ? new i67(new l67(o6.j(configuration))) : i67.a(configuration.locale);
    }

    public static final int I(nr6 nr6Var, hw8 hw8Var) {
        return (int) (hw8Var == hw8.Vertical ? nr6Var.t & 4294967295L : nr6Var.t >> 32);
    }

    public static final long J(y06 y06Var, hw8 hw8Var, x06 x06Var, boolean z) {
        float fIntBitsToFloat;
        long jFloatToRawIntBits;
        long j2;
        long j3 = y06Var.g;
        if (hw8Var != null) {
            int i2 = x06Var.a;
            if (i2 == 1) {
                fIntBitsToFloat = Float.intBitsToFloat((int) (j3 >> 32));
            } else if (i2 == 2) {
                fIntBitsToFloat = Float.intBitsToFloat((int) (j3 & 4294967295L));
            }
            if (hw8Var == hw8.Horizontal) {
                long jFloatToRawIntBits2 = Float.floatToRawIntBits(fIntBitsToFloat);
                jFloatToRawIntBits = Float.floatToRawIntBits(0.0f);
                j2 = jFloatToRawIntBits2 << 32;
            } else {
                long jFloatToRawIntBits3 = Float.floatToRawIntBits(0.0f);
                jFloatToRawIntBits = Float.floatToRawIntBits(fIntBitsToFloat);
                j2 = jFloatToRawIntBits3 << 32;
            }
            j3 = j2 | (4294967295L & jFloatToRawIntBits);
        }
        long jD = ip8.d(K(y06Var, hw8Var, x06Var), j3);
        if (z || !y06Var.i) {
            return jD;
        }
        return 0L;
    }

    public static final long K(y06 y06Var, hw8 hw8Var, x06 x06Var) {
        float fIntBitsToFloat;
        long jFloatToRawIntBits;
        long j2;
        if (hw8Var == null) {
            return y06Var.c;
        }
        int i2 = x06Var.a;
        if (i2 == 1) {
            fIntBitsToFloat = Float.intBitsToFloat((int) (y06Var.c >> 32));
        } else {
            if (i2 != 2) {
                return y06Var.c;
            }
            fIntBitsToFloat = Float.intBitsToFloat((int) (y06Var.c & 4294967295L));
        }
        if (hw8Var == hw8.Horizontal) {
            long jFloatToRawIntBits2 = Float.floatToRawIntBits(fIntBitsToFloat);
            jFloatToRawIntBits = Float.floatToRawIntBits(0.0f);
            j2 = jFloatToRawIntBits2 << 32;
        } else {
            long jFloatToRawIntBits3 = Float.floatToRawIntBits(0.0f);
            jFloatToRawIntBits = Float.floatToRawIntBits(fIntBitsToFloat);
            j2 = jFloatToRawIntBits3 << 32;
        }
        return j2 | (4294967295L & jFloatToRawIntBits);
    }

    public static final String L(fd6 fd6Var) {
        if (fd6Var.n0(d46.Q("__typename")) != 0) {
            ygf.f("__typename not found");
            return null;
        }
        String strQ = fd6Var.q();
        if (strQ != null) {
            return strQ;
        }
        ygf.f("__typename is null");
        return null;
    }

    public static final void M(Matrix matrix, float[] fArr) {
        float f2 = fArr[0];
        float f3 = fArr[1];
        float f4 = fArr[2];
        float f5 = fArr[3];
        float f6 = fArr[4];
        float f7 = fArr[5];
        float f8 = fArr[6];
        float f9 = fArr[7];
        float f10 = fArr[8];
        float f11 = fArr[12];
        float f12 = fArr[13];
        float f13 = fArr[15];
        fArr[0] = f2;
        fArr[1] = f6;
        fArr[2] = f11;
        fArr[3] = f3;
        fArr[4] = f7;
        fArr[5] = f12;
        fArr[6] = f5;
        fArr[7] = f9;
        fArr[8] = f13;
        matrix.setValues(fArr);
        fArr[0] = f2;
        fArr[1] = f3;
        fArr[2] = f4;
        fArr[3] = f5;
        fArr[4] = f6;
        fArr[5] = f7;
        fArr[6] = f8;
        fArr[7] = f9;
        fArr[8] = f10;
    }

    public static final void N(Matrix matrix, float[] fArr) {
        matrix.getValues(fArr);
        float f2 = fArr[0];
        float f3 = fArr[1];
        float f4 = fArr[2];
        float f5 = fArr[3];
        float f6 = fArr[4];
        float f7 = fArr[5];
        float f8 = fArr[6];
        float f9 = fArr[7];
        float f10 = fArr[8];
        fArr[0] = f2;
        fArr[1] = f5;
        fArr[2] = 0.0f;
        fArr[3] = f8;
        fArr[4] = f3;
        fArr[5] = f6;
        fArr[6] = 0.0f;
        fArr[7] = f9;
        fArr[8] = 0.0f;
        fArr[9] = 0.0f;
        fArr[10] = 1.0f;
        fArr[11] = 0.0f;
        fArr[12] = f4;
        fArr[13] = f7;
        fArr[14] = 0.0f;
        fArr[15] = f10;
    }

    public static void O(HashMap map) {
        SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.sdk.CloudBridgeSavedCredentials", 0);
        if (sharedPreferences == null) {
            return;
        }
        x1c x1cVar = x1c.DATASETID;
        Object obj = map.get(x1cVar.getRawValue());
        x1c x1cVar2 = x1c.URL;
        Object obj2 = map.get(x1cVar2.getRawValue());
        x1c x1cVar3 = x1c.ACCESSKEY;
        Object obj3 = map.get(x1cVar3.getRawValue());
        if (obj == null || obj2 == null || obj3 == null) {
            return;
        }
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putString(x1cVar.getRawValue(), obj.toString());
        editorEdit.putString(x1cVar2.getRawValue(), obj2.toString());
        editorEdit.putString(x1cVar3.getRawValue(), obj3.toString());
        editorEdit.apply();
        z46 z46Var = f87.b;
        z46.s(i87.APP_EVENTS, "t40".toString(), " \n\nSaving Cloudbridge settings from saved Prefs: \n================\n DATASETID: %s\n URL: %s \n ACCESSKEY: %s \n\n ", obj, obj2, obj3);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00c6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.zo1 P(defpackage.mx r21) {
        /*
            Method dump skipped, instruction units count: 415
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t40.P(mx):zo1");
    }

    public static final void a(pmb pmbVar, ga1 ga1Var, y81 y81Var, x12 x12Var, final int i2) {
        int i3;
        mwa mwaVarS;
        b55 b55Var;
        l78 l78Var;
        uob uobVar;
        int i4;
        int i5;
        int i6;
        boolean z;
        int i7;
        int i8;
        o28 o28Var;
        uob uobVar2;
        uob uobVar3;
        l78 l78Var2;
        uob uobVar4;
        final pmb pmbVar2 = pmbVar;
        final ga1 ga1Var2 = ga1Var;
        final y81 y81Var2 = y81Var;
        zq0 zq0Var = z46.n;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(93291728);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(pmbVar2) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(ga1Var2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(y81Var2) ? 256 : 128;
        }
        int i9 = i3;
        if (!p65Var.P(i9 & 1, (i9 & 147) != 146)) {
            p65Var.S();
        } else {
            if (ga1Var2 == null) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    final int i10 = 1;
                    b55Var = new b55() { // from class: aa1
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i11 = i10;
                            c1e c1eVar = c1e.a;
                            int i12 = i2;
                            y81 y81Var3 = y81Var2;
                            ga1 ga1Var3 = ga1Var2;
                            pmb pmbVar3 = pmbVar2;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i11) {
                                case 0:
                                    t40.a(pmbVar3, ga1Var3, y81Var3, x12Var2, tr7.y(i12 | 1));
                                    break;
                                default:
                                    t40.a(pmbVar3, ga1Var3, y81Var3, x12Var2, tr7.y(i12 | 1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            Object objM = p65Var.M();
            uob uobVar5 = w12.a;
            if (objM == uobVar5) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var3 = (l78) objM;
            if (ga1Var2.b != null) {
                p65Var.Y(410292768);
                String strA = af1.a(ga1Var2.a, p65Var);
                pg1 pg1Var = ga1Var2.b;
                kj3 kj3Var = kj3.NORMAL;
                boolean z2 = (i9 & 896) == 256;
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar5) {
                    l78Var = l78Var3;
                    uobVar = uobVar5;
                    sc0 sc0Var = new sc0(0, y81Var, y81.class, "onDownloadListsCatalogClicked", "onDownloadListsCatalogClicked()V", 0, 21);
                    y81Var2 = y81Var;
                    p65Var.j0(sc0Var);
                    objM2 = sc0Var;
                } else {
                    y81Var2 = y81Var;
                    l78Var = l78Var3;
                    uobVar = uobVar5;
                }
                z = false;
                i5 = 256;
                i4 = 32;
                ga1Var2 = ga1Var2;
                pmbVar2 = pmbVar;
                i6 = i9;
                guc.c(strA, pg1Var, kj3Var, (m45) ((qh6) objM2), null, ((zo7) p65Var.j(kt7.b)).o, p65Var, 384, 16);
                p65Var = p65Var;
                p65Var.p(false);
                i7 = 407448146;
            } else {
                l78Var = l78Var3;
                uobVar = uobVar5;
                i4 = 32;
                i5 = 256;
                i6 = i9;
                z = false;
                ga1Var2 = ga1Var2;
                pmbVar2 = pmbVar;
                i7 = 407448146;
                y81Var2 = y81Var;
                p65Var.Y(407448146);
                p65Var.p(false);
            }
            boolean z3 = ga1Var2.i;
            o28 o28Var2 = o28.b;
            if (z3 || ga1Var2.k == null) {
                i8 = i7;
                o28Var = o28Var2;
                uobVar2 = uobVar;
                p65Var.Y(i8);
            } else {
                p65Var.Y(410698434);
                boolean z4 = ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == i4 ? true : z) | ((i6 & 896) == i5 ? true : z);
                Object objM3 = p65Var.M();
                if (z4) {
                    uobVar4 = uobVar;
                } else {
                    uobVar4 = uobVar;
                    if (objM3 == uobVar4) {
                    }
                    o28Var = o28Var2;
                    uobVar2 = uobVar4;
                    i8 = i7;
                    f49.l((m45) objM3, bgf.N(pmbVar2.b(o28Var2, zq0Var), "share_button"), false, null, null, ht2.b, p65Var, 1572864, 60);
                }
                objM3 = new fa1(y81Var2, ga1Var2);
                p65Var.j0(objM3);
                o28Var = o28Var2;
                uobVar2 = uobVar4;
                i8 = i7;
                f49.l((m45) objM3, bgf.N(pmbVar2.b(o28Var2, zq0Var), "share_button"), false, null, null, ht2.b, p65Var, 1572864, 60);
            }
            p65Var.p(z);
            if (ga1Var2.j != null) {
                p65Var.Y(411244778);
                boolean z5 = ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == i4 ? true : z) | ((i6 & 896) != 256 ? z : true);
                Object objM4 = p65Var.M();
                if (z5) {
                    uobVar3 = uobVar2;
                } else {
                    uobVar3 = uobVar2;
                    if (objM4 == uobVar3) {
                    }
                    f49.l((m45) objM4, bgf.N(pmbVar2.b(o28Var, zq0Var), "save_button"), false, null, null, pxf.E(1682809758, new k6c(22, ga1Var2), p65Var), p65Var, 1572864, 60);
                }
                objM4 = new fa1(ga1Var2, y81Var2);
                p65Var.j0(objM4);
                f49.l((m45) objM4, bgf.N(pmbVar2.b(o28Var, zq0Var), "save_button"), false, null, null, pxf.E(1682809758, new k6c(22, ga1Var2), p65Var), p65Var, 1572864, 60);
            } else {
                uobVar3 = uobVar2;
                p65Var.Y(i8);
            }
            p65Var.p(z);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar3) {
                l78Var2 = l78Var;
                objM5 = new vs(l78Var2, 4);
                p65Var.j0(objM5);
            } else {
                l78Var2 = l78Var;
            }
            f49.l((m45) objM5, bgf.N(pmbVar2.b(o28Var, zq0Var), "more_button"), false, null, null, ht2.c, p65Var, 1572870, 60);
            boolean zBooleanValue = ((Boolean) l78Var2.getValue()).booleanValue();
            Object objM6 = p65Var.M();
            if (objM6 == uobVar3) {
                objM6 = new vs(l78Var2, 5);
                p65Var.j0(objM6);
            }
            p65 p65Var2 = p65Var;
            xp7.b(zBooleanValue, (m45) objM6, bgf.N(o28Var, "more_menu"), 0L, null, null, null, 0L, 0.0f, pxf.E(-2025508299, new nh(ga1Var2, y81Var2, l78Var2, 15), p65Var), p65Var2, 432, 2040);
            p65Var = p65Var2;
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final int i11 = 0;
            b55Var = new b55() { // from class: aa1
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i112 = i11;
                    c1e c1eVar = c1e.a;
                    int i12 = i2;
                    y81 y81Var3 = y81Var2;
                    ga1 ga1Var3 = ga1Var2;
                    pmb pmbVar3 = pmbVar2;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i112) {
                        case 0:
                            t40.a(pmbVar3, ga1Var3, y81Var3, x12Var2, tr7.y(i12 | 1));
                            break;
                        default:
                            t40.a(pmbVar3, ga1Var3, y81Var3, x12Var2, tr7.y(i12 | 1));
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void b(hu7 hu7Var, m45 m45Var, String str, r28 r28Var, wb wbVar, x12 x12Var, int i2) {
        wb wbVar2;
        wb wbVar3;
        int i3;
        wb wbVar4;
        hu7Var.getClass();
        m45Var.getClass();
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1764110754);
        int i4 = 2;
        int i5 = 4;
        int i6 = i2 | (p65Var.f(hu7Var) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(str) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        int i7 = 0;
        if (p65Var.P(i6 & 1, (i6 & 9363) != 9362)) {
            p65Var.U();
            int i8 = i2 & 1;
            uob uobVar = w12.a;
            if (i8 == 0 || p65Var.z()) {
                boolean z = (i6 & 896) == 256;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, i7);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    wbVar3 = (wb) to7.z(n1b.a.b(wb.class), wueVarA, E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i6 & (-57345);
                }
            } else {
                p65Var.S();
                i3 = i6 & (-57345);
                wbVar3 = wbVar;
            }
            p65Var.q();
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            boolean zH = p65Var.h(wbVar3);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                wb wbVar5 = wbVar3;
                k0 k0Var = new k0(1, wbVar5, wb.class, "updateCfAuthorizationCookie", "updateCfAuthorizationCookie(Lokhttp3/Cookie;)V", 0, 1);
                wbVar4 = wbVar5;
                p65Var.j0(k0Var);
                objM3 = k0Var;
            } else {
                wbVar4 = wbVar3;
            }
            int i9 = (i3 & 14) | 48;
            int i10 = i3 << 3;
            c(hu7Var, nhcVar, m45Var, (x45) ((qh6) objM3), r28Var, p65Var, (i10 & 57344) | i9 | (i10 & 896));
            boolean zH2 = p65Var.h(wbVar4);
            Object objM4 = p65Var.M();
            n92 n92Var = null;
            if (zH2 || objM4 == uobVar) {
                objM4 = new z8(wbVar4, n92Var, i4);
                p65Var.j0(objM4);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM4, c1eVar);
            boolean zH3 = p65Var.h(wbVar4);
            Object objM5 = p65Var.M();
            if (zH3 || objM5 == uobVar) {
                objM5 = new j0(wbVar4, nhcVar, n92Var, i5);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, c1eVar);
            wbVar2 = wbVar4;
        } else {
            p65Var.S();
            wbVar2 = wbVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(hu7Var, m45Var, str, r28Var, wbVar2, i2, 3);
        }
    }

    public static final void c(hu7 hu7Var, nhc nhcVar, m45 m45Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        hu7 hu7Var2;
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1100915312);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            hu7Var2 = hu7Var;
            i3 = (p65Var2.f(hu7Var2) ? 4 : 2) | i2;
        } else {
            hu7Var2 = hu7Var;
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.h(x45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            String str = i03.p;
            boolean zBooleanValue = ((Boolean) p65Var2.j(l36.a)).booleanValue();
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u("");
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new g49(0.0f);
                p65Var2.j0(objM2);
            }
            p65Var = p65Var2;
            pr7.b(r28Var.b(jfc.c), pxf.E(-1254114292, new r(m45Var, 5, l78Var), p65Var2), null, pxf.E(1110351178, new u8(nhcVar, i4), p65Var2), null, 0, 0L, 0L, null, pxf.E(-24050143, new nb(x45Var, zBooleanValue, str, (g49) objM2), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(hu7Var2, nhcVar, m45Var, x45Var, r28Var, i2, 0);
        }
    }

    public static final void d(String str, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1630767893);
        int i3 = i2 | (p65Var.f(str) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128) | 3072;
        byte b2 = 0;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28Var2 = o28.b;
            qk7.f(pxf.E(-845689059, new pb(str, b2, b2), p65Var), r28Var2, m45Var, null, null, null, 0L, 0L, null, p65Var, 54 | (i3 & 896), 504);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qb(str, m45Var, r28Var2, i2, 0);
        }
    }

    public static final void e(za0 za0Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        x45 x45Var2;
        Object obj;
        String strV;
        sv2 sv2Var = za0Var.c;
        long j2 = za0Var.b;
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1903772860);
        int i3 = i2 | (p65Var.f(za0Var) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, "audience_growth_section");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            String strR = vo7.R(p65Var, R.string.audience_stats_growth_title);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, bgf.N(o28Var, "audience_growth_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).h, p65Var, 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            if (pwd.G(Long.valueOf(j2)).get(1) == pwd.G(null).get(1)) {
                strV = km4.w(p65Var, -2117135245, R.string.common_today, p65Var, false);
            } else {
                p65Var.Y(-2117068161);
                strV = vo7.v(j2, p65Var);
                p65Var.p(false);
            }
            jjd.b(vo7.Q(R.string.stats_from_to_utc_updated_daily, new Object[]{vo7.v(za0Var.a, p65Var), strV}, p65Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(dl7.m(((bu7) p65Var.j(sn3Var)).n), ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            if (sv2Var.a.isEmpty()) {
                x45Var2 = x45Var;
                p65Var.Y(-2119336400);
            } else {
                p65Var.Y(-2116560350);
                String strR2 = vo7.R(p65Var, R.string.year_date_format);
                r28 r28VarN2 = bgf.N(jfc.d(o28Var, 1.0f), "audience_growth_date_select_field");
                boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    x45Var2 = x45Var;
                    objM = new wa0(0, x45Var2);
                    p65Var.j0(objM);
                } else {
                    x45Var2 = x45Var;
                }
                d46.g(sv2Var, r28VarN2, strR2, (b55) objM, p65Var, 48, 0);
            }
            p65Var.p(false);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            int i5 = i3 & 14;
            i(za0Var, null, p65Var, i5);
            hp7.t(p65Var, jfc.l(o28Var, 64.0f));
            s(za0Var, null, p65Var, i5);
            lv8.y(o28Var, 24.0f, p65Var, true);
            obj = o28Var;
        } else {
            x45Var2 = x45Var;
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 21, za0Var, x45Var2, obj);
        }
    }

    public static final void f(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        long j3 = j2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1503670105);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j3) ? 32 : 16;
        }
        int i4 = i3;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            p65Var.U();
            int i5 = i2 & 1;
            o28 o28Var = o28.b;
            if (i5 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarN = bgf.N(r28Var3, "audience_growth_section");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = jt7.c;
            int i7 = ((i4 << 6) & 7168) | 48;
            ok7.r(180.0f, i7, 4, j2, p65Var, null, ((bu7) p65Var.j(sn3Var)).h);
            ok7.r(78.0f, i7, 4, j2, p65Var, null, ((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).n);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            int i8 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            j3 = j2;
            d46.h(i8 | 6, 0, j3, p65Var, r28VarD);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            u(i8, j3, p65Var, null);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j3, i2, 1);
        }
    }

    public static final void g(ga1 ga1Var, y81 y81Var, r28 r28Var, boolean z, float f2, x12 x12Var, int i2) {
        r28 r28Var2;
        Object sc0Var;
        y81 y81Var2;
        y81Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1526267581);
        int i3 = i2 | (p65Var.f(ga1Var) ? 4 : 2) | (p65Var.f(y81Var) ? 32 : 16) | 384 | (p65Var.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.c(f2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            String strA = null;
            CatalogName catalogName = ga1Var != null ? ga1Var.a : null;
            if (catalogName == null) {
                p65Var.Y(-1781012683);
            } else {
                p65Var.Y(-2135662004);
                strA = af1.a(catalogName, p65Var);
            }
            p65Var.p(false);
            String str = strA;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarW = wo7.w(o28Var, f2, nr5Var, 0L, 0L, 28);
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                sc0Var = new sc0(0, y81Var, y81.class, "onBackPressed", "onBackPressed()V", 0, 22);
                y81Var2 = y81Var;
                p65Var.j0(sc0Var);
            } else {
                y81Var2 = y81Var;
                sc0Var = objM;
            }
            qk7.f(pxf.E(-1298062481, new z91(i4, str, z), p65Var), r28VarW, (m45) ((qh6) sc0Var), pxf.E(-835141148, new ec(ga1Var, 19, y81Var2), p65Var), null, null, 0L, 0L, null, p65Var, 3078, 496);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ea1(ga1Var, y81Var, r28Var2, z, f2, i2);
        }
    }

    public static final void h(ob3 ob3Var, x12 x12Var, int i2) {
        ejc ejcVar;
        ob3 ob3Var2 = ob3Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(294589392);
        int i3 = 3;
        if ((((p65Var.h(ob3Var2) ? 4 : 2) | i2) & 3) == 2 && p65Var.B()) {
            p65Var.S();
        } else {
            oob oobVarX = qo7.x(p65Var);
            wua wuaVar = ob3Var2.b().e;
            l78 l78VarL = no7.l(wuaVar, wuaVar.getValue(), p65Var, 0, 0);
            List list = (List) l78VarL.getValue();
            boolean zBooleanValue = ((Boolean) p65Var.j(l36.a)).booleanValue();
            boolean zF = p65Var.f(list);
            Object objM = p65Var.M();
            Object obj = w12.a;
            Object obj2 = objM;
            if (zF || objM == obj) {
                ejc ejcVar2 = new ejc();
                ArrayList arrayList = new ArrayList();
                for (Object obj3 : list) {
                    if (zBooleanValue ? true : ((ba8) obj3).h.j.d.isAtLeast(vx6.STARTED)) {
                        arrayList.add(obj3);
                    }
                }
                ejcVar2.addAll(arrayList);
                p65Var.j0(ejcVar2);
                obj2 = ejcVar2;
            }
            ejc ejcVar3 = (ejc) obj2;
            n(ejcVar3, (List) l78VarL.getValue(), p65Var, 0);
            wua wuaVar2 = ob3Var2.b().f;
            l78 l78VarL2 = no7.l(wuaVar2, wuaVar2.getValue(), p65Var, 0, 0);
            Object objM2 = p65Var.M();
            if (objM2 == obj) {
                objM2 = new ejc();
                p65Var.j0(objM2);
            }
            ejc ejcVar4 = (ejc) objM2;
            p65Var.Y(-367418626);
            ListIterator listIterator = ejcVar3.listIterator();
            while (true) {
                wn5 wn5Var = (wn5) listIterator;
                if (!wn5Var.hasNext()) {
                    break;
                }
                ba8 ba8Var = (ba8) wn5Var.next();
                va8 va8Var = ba8Var.b;
                va8Var.getClass();
                nb3 nb3Var = (nb3) va8Var;
                boolean zH = p65Var.h(ob3Var2) | p65Var.h(ba8Var);
                Object objM3 = p65Var.M();
                if (zH || objM3 == obj) {
                    objM3 = new gf2(ob3Var2, 28, ba8Var);
                    p65Var.j0(objM3);
                }
                m40.h((m45) objM3, nb3Var.g, pxf.E(1129586364, new lb3(ba8Var, ob3Var2, oobVarX, ejcVar4, nb3Var), p65Var), p65Var, 384, 0);
                ob3Var2 = ob3Var2;
                oobVarX = oobVarX;
                ejcVar4 = ejcVar4;
            }
            ob3 ob3Var3 = ob3Var2;
            ejc ejcVar5 = ejcVar4;
            p65Var.p(false);
            Set set = (Set) l78VarL2.getValue();
            boolean zF2 = p65Var.f(l78VarL2) | p65Var.h(ob3Var3);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == obj) {
                ob3Var2 = ob3Var3;
                ejcVar = ejcVar5;
                Object lm1Var = new lm1(l78VarL2, ob3Var2, ejcVar, null, 1);
                p65Var.j0(lm1Var);
                objM4 = lm1Var;
            } else {
                ob3Var2 = ob3Var3;
                ejcVar = ejcVar5;
            }
            kyd.l(set, ejcVar, (b55) objM4, p65Var);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l23(i2, i3, ob3Var2);
        }
    }

    public static final void i(za0 za0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1460814479);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(za0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            ArrayList arrayList = za0Var.d;
            o28 o28Var = o28.b;
            t(R.string.stats_followers, R.string.audience_stats_growth_followers_subtitle, arrayList, bgf.N(o28Var, "audience_growth_followers"), p65Var, 0);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new xa0(za0Var, r28Var, i2, i5);
        }
    }

    public static final void j(q35 q35Var, ew9 ew9Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(114814701);
        int i3 = (p65Var.f(q35Var) ? 4 : 2) | i2 | (p65Var.f(ew9Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new cq4(20);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), wxb.a(o28Var, false, (x45) objM), 3, 1.0f);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            k(q35Var, ew9Var, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
            if (q35Var instanceof o35) {
                o35 o35Var = (o35) q35Var;
                UpsellInfo upsellInfo = o35Var.d;
                String str = o35Var.e;
                sw9 sw9Var = ew9Var.a;
                if (!sw9Var.v0) {
                    sw9Var.v0 = true;
                    sw9Var.p.f(upsellInfo, sw9Var.D0, str, sw9Var.d);
                }
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l35(q35Var, ew9Var, i2, 0);
        }
    }

    public static final void k(final q35 q35Var, final ew9 ew9Var, x12 x12Var, int i2) {
        final int i3;
        int iV;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1150662750);
        int i4 = (p65Var.f(q35Var) ? 4 : 2) | i2 | (p65Var.f(ew9Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            kx kxVarW = ho2.w(p65Var, -699012098);
            boolean z2 = q35Var instanceof o35;
            int i5 = 14;
            ohd ohdVar = ohd.c;
            uob uobVar = w12.a;
            if (z2) {
                p65Var.Y(1344494294);
                zw7 zw7Var = ((o35) q35Var).c;
                int[] iArr = m35.a;
                int i6 = iArr[zw7Var.ordinal()];
                if (i6 == 1) {
                    p65Var.Y(1344512212);
                    kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_reading_for_free_via));
                    p65Var.p(false);
                } else if (i6 == 2) {
                    p65Var.Y(1344678589);
                    kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_reading_via));
                    p65Var.p(false);
                } else {
                    if (i6 != 3) {
                        throw ho2.L(p65Var, 459010780, false);
                    }
                    p65Var.Y(1344836317);
                    kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_reading_via));
                    p65Var.p(false);
                }
                kxVarW.d(" ");
                wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, i5);
                int i7 = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48;
                int i8 = (i4 & 14) ^ 6;
                boolean z3 = ((i8 > 4 && p65Var.h(q35Var)) || (i4 & 6) == 4) | ((i7 > 32 && p65Var.h(ew9Var)) || (i4 & 48) == 32);
                Object objM = p65Var.M();
                if (z3 || objM == uobVar) {
                    final int i9 = 0;
                    objM = new e07() { // from class: k35
                        @Override // defpackage.e07
                        public final void a(d07 d07Var) {
                            int i10 = i9;
                            q35 q35Var2 = q35Var;
                            ew9 ew9Var2 = ew9Var;
                            switch (i10) {
                                case 0:
                                    d07Var.getClass();
                                    o35 o35Var = (o35) q35Var2;
                                    String str = o35Var.a;
                                    String str2 = o35Var.e;
                                    str.getClass();
                                    sw9 sw9Var = ew9Var2.a;
                                    vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 9), 3);
                                    break;
                                case 1:
                                    d07Var.getClass();
                                    o35 o35Var2 = (o35) q35Var2;
                                    UpsellInfo upsellInfo = o35Var2.d;
                                    String str3 = o35Var2.e;
                                    sw9 sw9Var2 = ew9Var2.a;
                                    sw9Var2.p.e(upsellInfo, sw9Var2.D0, str3, sw9Var2.d);
                                    vx0.c0(f76.F(sw9Var2), null, null, new kv9(sw9Var2, upsellInfo, str3, null, 1), 3);
                                    break;
                                case 2:
                                    d07Var.getClass();
                                    ew9Var2.a(((o35) q35Var2).e);
                                    break;
                                case 3:
                                    d07Var.getClass();
                                    ew9Var2.a(((n35) q35Var2).a);
                                    break;
                                default:
                                    d07Var.getClass();
                                    ew9Var2.a(((p35) q35Var2).a);
                                    break;
                            }
                        }
                    };
                    p65Var.j0(objM);
                }
                iV = ho2.v("annotation_friend_link_creator_name", wjdVar, (e07) objM, kxVarW);
                try {
                    kxVarW.a.append((CharSequence) ((o35) q35Var).b);
                    kxVarW.f(iV);
                    kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_creator_friend_link));
                    kxVarW.d("  ");
                    int i10 = iArr[zw7Var.ordinal()];
                    if (i10 == 1 || i10 == 2) {
                        p65Var.Y(1345994632);
                        p65Var.Y(459061868);
                        wjd wjdVar2 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
                        boolean z4 = ((i8 > 4 && p65Var.h(q35Var)) || (i4 & 6) == 4) | ((i7 > 32 && p65Var.h(ew9Var)) || (i4 & 48) == 32);
                        Object objM2 = p65Var.M();
                        if (z4 || objM2 == uobVar) {
                            i3 = 1;
                            objM2 = new e07() { // from class: k35
                                @Override // defpackage.e07
                                public final void a(d07 d07Var) {
                                    int i102 = i3;
                                    q35 q35Var2 = q35Var;
                                    ew9 ew9Var2 = ew9Var;
                                    switch (i102) {
                                        case 0:
                                            d07Var.getClass();
                                            o35 o35Var = (o35) q35Var2;
                                            String str = o35Var.a;
                                            String str2 = o35Var.e;
                                            str.getClass();
                                            sw9 sw9Var = ew9Var2.a;
                                            vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 9), 3);
                                            break;
                                        case 1:
                                            d07Var.getClass();
                                            o35 o35Var2 = (o35) q35Var2;
                                            UpsellInfo upsellInfo = o35Var2.d;
                                            String str3 = o35Var2.e;
                                            sw9 sw9Var2 = ew9Var2.a;
                                            sw9Var2.p.e(upsellInfo, sw9Var2.D0, str3, sw9Var2.d);
                                            vx0.c0(f76.F(sw9Var2), null, null, new kv9(sw9Var2, upsellInfo, str3, null, 1), 3);
                                            break;
                                        case 2:
                                            d07Var.getClass();
                                            ew9Var2.a(((o35) q35Var2).e);
                                            break;
                                        case 3:
                                            d07Var.getClass();
                                            ew9Var2.a(((n35) q35Var2).a);
                                            break;
                                        default:
                                            d07Var.getClass();
                                            ew9Var2.a(((p35) q35Var2).a);
                                            break;
                                    }
                                }
                            };
                            p65Var.j0(objM2);
                        } else {
                            i3 = 1;
                        }
                        iV = ho2.v("annotation_upgrade_membership", wjdVar2, (e07) objM2, kxVarW);
                        try {
                            kxVarW.d(vo7.R(p65Var, R.string.common_upgrade));
                            kxVarW.f(iV);
                            z = false;
                            p65Var.p(false);
                            kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_to_access_medium));
                            p65Var.p(false);
                        } finally {
                        }
                    } else {
                        if (i10 != 3) {
                            throw ho2.L(p65Var, 459056755, false);
                        }
                        p65Var.Y(1346924632);
                        wjd wjdVar3 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
                        boolean z5 = ((i8 > 4 && p65Var.h(q35Var)) || (i4 & 6) == 4) | ((i7 > 32 && p65Var.h(ew9Var)) || (i4 & 48) == 32);
                        Object objM3 = p65Var.M();
                        if (z5 || objM3 == uobVar) {
                            final int i11 = 2;
                            objM3 = new e07() { // from class: k35
                                @Override // defpackage.e07
                                public final void a(d07 d07Var) {
                                    int i102 = i11;
                                    q35 q35Var2 = q35Var;
                                    ew9 ew9Var2 = ew9Var;
                                    switch (i102) {
                                        case 0:
                                            d07Var.getClass();
                                            o35 o35Var = (o35) q35Var2;
                                            String str = o35Var.a;
                                            String str2 = o35Var.e;
                                            str.getClass();
                                            sw9 sw9Var = ew9Var2.a;
                                            vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 9), 3);
                                            break;
                                        case 1:
                                            d07Var.getClass();
                                            o35 o35Var2 = (o35) q35Var2;
                                            UpsellInfo upsellInfo = o35Var2.d;
                                            String str3 = o35Var2.e;
                                            sw9 sw9Var2 = ew9Var2.a;
                                            sw9Var2.p.e(upsellInfo, sw9Var2.D0, str3, sw9Var2.d);
                                            vx0.c0(f76.F(sw9Var2), null, null, new kv9(sw9Var2, upsellInfo, str3, null, 1), 3);
                                            break;
                                        case 2:
                                            d07Var.getClass();
                                            ew9Var2.a(((o35) q35Var2).e);
                                            break;
                                        case 3:
                                            d07Var.getClass();
                                            ew9Var2.a(((n35) q35Var2).a);
                                            break;
                                        default:
                                            d07Var.getClass();
                                            ew9Var2.a(((p35) q35Var2).a);
                                            break;
                                    }
                                }
                            };
                            p65Var.j0(objM3);
                        }
                        iV = ho2.v("annotation_learn_more", wjdVar3, (e07) objM3, kxVarW);
                        try {
                            kxVarW.d(vo7.R(p65Var, R.string.common_learn_more));
                            kxVarW.f(iV);
                            z = false;
                            p65Var.p(false);
                            i3 = 1;
                        } finally {
                        }
                    }
                    p65Var.p(z);
                } finally {
                }
            } else {
                i3 = 1;
                if (q35Var instanceof n35) {
                    p65Var.Y(1347578546);
                    kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_expired_friend_link));
                    kxVarW.d("  ");
                    wjd wjdVar4 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
                    boolean z6 = ((((i4 & 14) ^ 6) > 4 && p65Var.h(q35Var)) || (i4 & 6) == 4) | ((((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var.h(ew9Var)) || (i4 & 48) == 32);
                    Object objM4 = p65Var.M();
                    if (z6 || objM4 == uobVar) {
                        final int i12 = 3;
                        objM4 = new e07() { // from class: k35
                            @Override // defpackage.e07
                            public final void a(d07 d07Var) {
                                int i102 = i12;
                                q35 q35Var2 = q35Var;
                                ew9 ew9Var2 = ew9Var;
                                switch (i102) {
                                    case 0:
                                        d07Var.getClass();
                                        o35 o35Var = (o35) q35Var2;
                                        String str = o35Var.a;
                                        String str2 = o35Var.e;
                                        str.getClass();
                                        sw9 sw9Var = ew9Var2.a;
                                        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 9), 3);
                                        break;
                                    case 1:
                                        d07Var.getClass();
                                        o35 o35Var2 = (o35) q35Var2;
                                        UpsellInfo upsellInfo = o35Var2.d;
                                        String str3 = o35Var2.e;
                                        sw9 sw9Var2 = ew9Var2.a;
                                        sw9Var2.p.e(upsellInfo, sw9Var2.D0, str3, sw9Var2.d);
                                        vx0.c0(f76.F(sw9Var2), null, null, new kv9(sw9Var2, upsellInfo, str3, null, 1), 3);
                                        break;
                                    case 2:
                                        d07Var.getClass();
                                        ew9Var2.a(((o35) q35Var2).e);
                                        break;
                                    case 3:
                                        d07Var.getClass();
                                        ew9Var2.a(((n35) q35Var2).a);
                                        break;
                                    default:
                                        d07Var.getClass();
                                        ew9Var2.a(((p35) q35Var2).a);
                                        break;
                                }
                            }
                        };
                        p65Var.j0(objM4);
                    }
                    iV = ho2.v("annotation_learn_more", wjdVar4, (e07) objM4, kxVarW);
                    try {
                        kxVarW.d(vo7.R(p65Var, R.string.common_learn_more));
                        kxVarW.f(iV);
                        z = false;
                        p65Var.p(false);
                    } finally {
                    }
                } else {
                    if (!(q35Var instanceof p35)) {
                        throw ho2.L(p65Var, 459011940, false);
                    }
                    p65Var.Y(1348233142);
                    kxVarW.d(vo7.R(p65Var, R.string.friend_link_banner_own_friend_link));
                    kxVarW.d("  ");
                    wjd wjdVar5 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
                    boolean z7 = ((((i4 & 14) ^ 6) > 4 && p65Var.h(q35Var)) || (i4 & 6) == 4) | ((((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var.h(ew9Var)) || (i4 & 48) == 32);
                    Object objM5 = p65Var.M();
                    if (z7 || objM5 == uobVar) {
                        final int i13 = 4;
                        objM5 = new e07() { // from class: k35
                            @Override // defpackage.e07
                            public final void a(d07 d07Var) {
                                int i102 = i13;
                                q35 q35Var2 = q35Var;
                                ew9 ew9Var2 = ew9Var;
                                switch (i102) {
                                    case 0:
                                        d07Var.getClass();
                                        o35 o35Var = (o35) q35Var2;
                                        String str = o35Var.a;
                                        String str2 = o35Var.e;
                                        str.getClass();
                                        sw9 sw9Var = ew9Var2.a;
                                        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 9), 3);
                                        break;
                                    case 1:
                                        d07Var.getClass();
                                        o35 o35Var2 = (o35) q35Var2;
                                        UpsellInfo upsellInfo = o35Var2.d;
                                        String str3 = o35Var2.e;
                                        sw9 sw9Var2 = ew9Var2.a;
                                        sw9Var2.p.e(upsellInfo, sw9Var2.D0, str3, sw9Var2.d);
                                        vx0.c0(f76.F(sw9Var2), null, null, new kv9(sw9Var2, upsellInfo, str3, null, 1), 3);
                                        break;
                                    case 2:
                                        d07Var.getClass();
                                        ew9Var2.a(((o35) q35Var2).e);
                                        break;
                                    case 3:
                                        d07Var.getClass();
                                        ew9Var2.a(((n35) q35Var2).a);
                                        break;
                                    default:
                                        d07Var.getClass();
                                        ew9Var2.a(((p35) q35Var2).a);
                                        break;
                                }
                            }
                        };
                        p65Var.j0(objM5);
                    }
                    iV = ho2.v("annotation_learn_more", wjdVar5, (e07) objM5, kxVarW);
                    try {
                        kxVarW.d(vo7.R(p65Var, R.string.common_learn_more));
                        kxVarW.f(iV);
                        z = false;
                        p65Var.p(false);
                    } finally {
                    }
                }
            }
            mx mxVarI = kxVarW.i();
            p65Var.p(z);
            nr5 nr5Var = new nr5(4);
            jjd.c(mxVarI, bgf.N(w2g.F(jfc.d(flb.a0(r40.y(w2g.D(o28.b, 8.0f, 8.0f), nr5Var), ((zo7) p65Var.j(kt7.b)).b, nr5Var), 1.0f), 16.0f, 16.0f, 16.0f, 24.0f), "friend_link_banner"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 0, 262140);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l35(q35Var, ew9Var, i2, 1);
        }
    }

    public static final void l(final sac sacVar, final eac eacVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1067650459);
        int i3 = i2 | (p65Var2.f(sacVar) ? 4 : 2) | (p65Var2.f(eacVar) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var2.Y(485099330);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            String strR = vo7.R(p65Var2, R.string.common_terms_of_service);
            String strR2 = vo7.R(p65Var2, R.string.common_privacy_policy);
            String strQ = vo7.Q(R.string.susi_auth_sign_in_terms_privacy_message, new Object[]{strR, strR2}, p65Var2);
            int iZ = muc.Z(strQ, strR, 0, false, 6);
            int length = strR.length() + iZ;
            int iZ2 = muc.Z(strQ, strR2, 0, false, 6);
            int length2 = strR2.length() + iZ2;
            sb.append(strQ);
            ohd ohdVar = ohd.c;
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i3 & 14;
            boolean z = (i4 == 32) | (i5 == 4);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                final int i6 = 0;
                objM = new e07() { // from class: bac
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i7 = i6;
                        sac sacVar2 = sacVar;
                        eac eacVar2 = eacVar;
                        d07Var.getClass();
                        switch (i7) {
                            case 0:
                                String str = sacVar2.d;
                                str.getClass();
                                ((SignInFragment) eacVar2.a.a).i1().Y(str);
                                break;
                            default:
                                String str2 = sacVar2.d;
                                str2.getClass();
                                ((SignInFragment) eacVar2.a.a).i1().X(str2);
                                break;
                        }
                    }
                };
                p65Var2.j0(objM);
            }
            b07 b07Var = new b07("terms_of_service", wjdVar, (e07) objM);
            int i7 = 8;
            arrayListV.add(new jx(b07Var, iZ, length, i7));
            wjd wjdVar2 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
            boolean z2 = (i5 == 4) | (i4 == 32);
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar) {
                final int i8 = 1;
                objM2 = new e07() { // from class: bac
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i72 = i8;
                        sac sacVar2 = sacVar;
                        eac eacVar2 = eacVar;
                        d07Var.getClass();
                        switch (i72) {
                            case 0:
                                String str = sacVar2.d;
                                str.getClass();
                                ((SignInFragment) eacVar2.a.a).i1().Y(str);
                                break;
                            default:
                                String str2 = sacVar2.d;
                                str2.getClass();
                                ((SignInFragment) eacVar2.a.a).i1().X(str2);
                                break;
                        }
                    }
                };
                p65Var2.j0(objM2);
            }
            arrayListV.add(new jx(new b07("privacy_policy", wjdVar2, (e07) objM2), iZ2, length2, i7));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            int size = arrayListV.size();
            for (int i9 = 0; i9 < size; i9 = lv8.i(sb, (jx) arrayListV.get(i9), arrayList, i9, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var2.p(false);
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            jjd.c(mxVar, bgf.N(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "legal_text"), 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, mkdVar, p65Var, 0, 0, 261116);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aac(sacVar, eacVar, r28Var2, i2, 1);
        }
    }

    public static final void m(j57 j57Var, m45 m45Var, b55 b55Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        m45Var.getClass();
        b55Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1464233644);
        int i3 = i2 | (p65Var.f(j57Var) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.h(b55Var) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            fp7.c(0, true, bgf.N(o28Var, "load_more_error_responses_item"), pxf.E(-1250150308, new gx4(j57Var, m45Var, b55Var, 6), p65Var), p65Var, 3072);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 12, r28Var2, (Object) j57Var, (Object) m45Var, (Object) b55Var);
        }
    }

    public static final void n(List list, Collection collection, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1537894851);
        int i3 = 16;
        if ((((p65Var.h(list) ? 4 : 2) | i2 | (p65Var.h(collection) ? 32 : 16)) & 19) == 18 && p65Var.B()) {
            p65Var.S();
        } else {
            boolean zBooleanValue = ((Boolean) p65Var.j(l36.a)).booleanValue();
            Iterator it2 = collection.iterator();
            while (it2.hasNext()) {
                ba8 ba8Var = (ba8) it2.next();
                ky6 ky6Var = ba8Var.h.j;
                boolean zG = p65Var.g(zBooleanValue) | p65Var.h(list) | p65Var.h(ba8Var);
                Object objM = p65Var.M();
                if (zG || objM == w12.a) {
                    objM = new rb(ba8Var, list, zBooleanValue);
                    p65Var.j0(objM);
                }
                kyd.h(ky6Var, (x45) objM, p65Var);
            }
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(list, collection, i2, i3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x02c9  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x02df  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x02e1  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x02ed  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0324  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0384  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0386  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x038e  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0397  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0403  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(defpackage.sac r39, defpackage.eac r40, defpackage.r28 r41, defpackage.x12 r42, int r43) {
        /*
            Method dump skipped, instruction units count: 1073
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t40.o(sac, eac, r28, x12, int):void");
    }

    public static final void p(sac sacVar, eac eacVar, r28 r28Var, nhc nhcVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        sacVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(503112181);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(sacVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(eacVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(nhcVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new dsb(11);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, false, (x45) objM), "sign_in_screen");
            mz1 mz1VarE = pxf.E(-299858695, new cac(eacVar), p65Var2);
            mz1 mz1VarE2 = pxf.E(198698107, new w87(nhcVar, 26), p65Var2);
            y0e y0eVarV = hk7.v(p65Var2);
            WeakHashMap weakHashMap = f5f.w;
            int i4 = i3;
            pr7.b(r28VarN, mz1VarE, null, mz1VarE2, null, 0, 0L, 0L, new y0e(y0eVarV, tr7.o(p65Var2).c), pxf.E(2064344836, new qg9(sacVar, 23, eacVar), p65Var2), p65Var2, 805309488, 244);
            p65Var = p65Var2;
            boolean z = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new obb(eacVar, null, 5);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(sacVar, eacVar, r28Var, nhcVar, i2, 16);
        }
    }

    public static final void q(String str, String str2, SusiDestination susiDestination, boolean z, qlb qlbVar, r28 r28Var, wac wacVar, x12 x12Var, int i2) {
        r28 r28Var2;
        wac wacVar2;
        int i3;
        r28 r28Var3;
        wac wacVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-975301802);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(susiDestination) ? 256 : 128) | (p65Var.g(z) ? 2048 : 1024) | (p65Var.f(qlbVar) ? 16384 : 8192) | 720896;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z2 = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256) | ((i4 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    z9c z9cVar = new z9c(str, str2, susiDestination, z, 0);
                    p65Var.j0(z9cVar);
                    objM = z9cVar;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                wac wacVar4 = (wac) to7.z(n1b.a.b(wac.class), wueVarA, E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i3 = i4 & (-3670017);
                r28Var3 = o28.b;
                wacVar3 = wacVar4;
            } else {
                p65Var.S();
                i3 = i4 & (-3670017);
                r28Var3 = r28Var;
                wacVar3 = wacVar;
            }
            p65Var.q();
            l78 l78VarM = no7.m(wacVar3.l, p65Var);
            uua uuaVar = wacVar3.n;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            akc akcVar = (akc) p65Var.j(z22.r);
            Resources resources = (Resources) p65Var.j(eo.c);
            r28 r28Var4 = r28Var3;
            p((sac) l78VarM.getValue(), new eac(qlbVar, wacVar3), r28Var4, nhcVar, p65Var, 3456);
            boolean zH = p65Var.h(uuaVar) | p65Var.f(akcVar) | ((i3 & 57344) == 16384) | p65Var.h(resources);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                uk8 uk8Var = new uk8((Object) uuaVar, nhcVar, resources, (Object) akcVar, (Object) qlbVar, (n92) null, 26);
                p65Var.j0(uk8Var);
                objM3 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var4;
            wacVar2 = wacVar3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            wacVar2 = wacVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new me0(str, str2, susiDestination, z, qlbVar, r28Var2, wacVar2, i2, 3);
        }
    }

    public static final void r(eac eacVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(923194502);
        int i3 = (p65Var2.f(eacVar) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new j5c(0, eacVar, eac.class, "onBackPressed", "onBackPressed()V", 0, 18);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, null, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 507);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cac(eacVar, i2);
        }
    }

    public static final void s(za0 za0Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-201119355);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(za0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            ArrayList arrayList = za0Var.e;
            o28 o28Var = o28.b;
            t(R.string.stats_subscribers, R.string.audience_stats_growth_subscribers_subtitle, arrayList, bgf.N(o28Var, "audience_growth_subscribers"), p65Var, 0);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new xa0(za0Var, r28Var, i2, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:64:0x0345  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x034d  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x03c3  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x03ec  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0473  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x047f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void t(int r68, int r69, java.util.ArrayList r70, defpackage.r28 r71, defpackage.x12 r72, int r73) {
        /*
            Method dump skipped, instruction units count: 1209
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t40.t(int, int, java.util.ArrayList, r28, x12, int):void");
    }

    public static final void u(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        long j3 = j2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(996705518);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j3) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var3);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            int i6 = ((i3 << 6) & 7168) | 48;
            ok7.r(86.0f, i6, 4, j3, p65Var, null, rz5.D(p65Var).i);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            ok7.r(200.0f, i6, 4, j2, p65Var, null, rz5.D(p65Var).l);
            ok7.r(300.0f, i6, 4, j2, p65Var, null, rz5.D(p65Var).l);
            ok7.r(60.0f, i6, 4, j2, p65Var, null, rz5.D(p65Var).l);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            ok7.r(18.0f, i6, 4, j2, p65Var, null, rz5.D(p65Var).j);
            ok7.r(100.0f, i6, 4, j2, p65Var, null, rz5.D(p65Var).l);
            ka1.B(p65Var, true, o28Var, 16.0f, p65Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j5 = p65Var.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            j3 = j2;
            ok7.r(18.0f, i6, 4, j3, p65Var, null, rz5.D(p65Var).j);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            nr5 nr5Var = rv8.r;
            dy0.a(jfc.l(flb.a0(o28Var, j3, nr5Var), 16.0f), p65Var, 0);
            p65Var.p(true);
            ok7.r(100.0f, i6, 4, j3, p65Var, null, rz5.D(p65Var).l);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            dy0.a(jfc.e(jfc.d(flb.a0(o28Var, j3, nr5Var), 1.0f), 180.0f), p65Var, 0);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j3, i2, 2);
        }
    }

    public static final void v(a5e a5eVar, akc akcVar, g4e g4eVar, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        final g4e g4eVar2;
        m62 m62Var;
        l78 l78Var;
        Object ibdVar;
        c1e c1eVar;
        uob uobVar2;
        p65 p65Var;
        int i3;
        float f2;
        float f3;
        sr4 sr4Var;
        a5e a5eVar2 = a5eVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-41173756);
        int i4 = i2 | (p65Var2.f(a5eVar2) ? 4 : 2) | (p65Var2.f(akcVar) ? 32 : 16) | (p65Var2.f(g4eVar) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            uob uobVar3 = w12.a;
            if (objM == uobVar3) {
                objM = ka1.g(p65Var2);
            }
            sr4 sr4Var2 = (sr4) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar3) {
                objM2 = ka1.g(p65Var2);
            }
            sr4 sr4Var3 = (sr4) objM2;
            rh4 rh4Var = jfc.c;
            final int i5 = 1;
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), bgf.N(r28Var.b(rh4Var), "content"), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarR3 = wgf.R(rh4Var, wgf.K(p65Var2), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarR3);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            hp7.t(p65Var2, jfc.l(o28Var, 16.0f));
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar3) {
                String str = a5eVar2.b;
                int length = str.length();
                objM3 = qo7.u(new uid(str, 4, lk7.q(length, length)));
                p65Var2.j0(objM3);
            }
            final l78 l78Var2 = (l78) objM3;
            uid uidVar = (uid) l78Var2.getValue();
            boolean z = !a5eVar2.e;
            String strR = vo7.R(p65Var2, R.string.update_catalog_name);
            String strR2 = vo7.R(p65Var2, R.string.update_catalog_name_placeholder);
            sk6 sk6Var = sk6.f;
            sk6 sk6VarA = sk6.a(3, 0, 6, 118);
            Object objM4 = p65Var2.M();
            int i9 = 5;
            if (objM4 == uobVar3) {
                objM4 = new w8(sr4Var3, i9);
                p65Var2.j0(objM4);
            }
            pk6 pk6Var = new pk6(null, (x45) objM4, null, 59);
            r28 r28VarN = bgf.N(F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), sr4Var2), "list_title");
            int i10 = i4 & 896;
            boolean z2 = i10 == 256;
            Object objM5 = p65Var2.M();
            if (z2 || objM5 == uobVar3) {
                uobVar = uobVar3;
                g4eVar2 = g4eVar;
                objM5 = new x45() { // from class: o4e
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        int i11 = i5;
                        c1e c1eVar2 = c1e.a;
                        l78 l78Var3 = l78Var2;
                        g4e g4eVar3 = g4eVar2;
                        uid uidVar2 = (uid) obj;
                        switch (i11) {
                            case 0:
                                uidVar2.getClass();
                                l78Var3.setValue(uidVar2);
                                String str2 = uidVar2.a.b;
                                str2.getClass();
                                h5e h5eVar = g4eVar3.b;
                                h5eVar.getClass();
                                h5eVar.h = str2;
                                vx0.c0(f76.F(h5eVar), null, null, new e5e(h5eVar, null, 0), 3);
                                break;
                            default:
                                uidVar2.getClass();
                                l78Var3.setValue(uidVar2);
                                String str3 = uidVar2.a.b;
                                str3.getClass();
                                h5e h5eVar2 = g4eVar3.b;
                                h5eVar2.getClass();
                                h5eVar2.g = str3;
                                vx0.c0(f76.F(h5eVar2), null, null, new e5e(h5eVar2, null, 5), 3);
                                break;
                        }
                        return c1eVar2;
                    }
                };
                p65Var2.j0(objM5);
            } else {
                uobVar = uobVar3;
                g4eVar2 = g4eVar;
            }
            uob uobVar4 = uobVar;
            final int i11 = 0;
            d46.m(uidVar, (x45) objM5, r28VarN, z, false, null, 1, sk6VarA, pk6Var, strR, null, strR2, 60, null, null, null, 0, p65Var2, 12582912, 3072, 247920);
            hp7.t(p65Var2, jfc.l(o28Var, 24.0f));
            Object objM6 = p65Var2.M();
            if (objM6 == uobVar4) {
                String str2 = a5eVar2.c;
                int length2 = str2.length();
                objM6 = qo7.u(new uid(str2, 4, lk7.q(length2, length2)));
                p65Var2.j0(objM6);
            }
            final l78 l78Var3 = (l78) objM6;
            uid uidVar2 = (uid) l78Var3.getValue();
            String strR3 = vo7.R(p65Var2, R.string.update_catalog_description);
            String strR4 = vo7.R(p65Var2, R.string.update_catalog_description_placeholder);
            sk6 sk6VarA2 = sk6.a(3, 0, 7, 118);
            boolean z3 = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM7 = p65Var2.M();
            if (z3 || objM7 == uobVar4) {
                objM7 = new ba(akcVar, 4);
                p65Var2.j0(objM7);
            }
            pk6 pk6Var2 = new pk6((x45) objM7, null, null, 62);
            r28 r28VarN2 = bgf.N(F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), sr4Var3), "list_description");
            boolean z4 = i10 == 256;
            Object objM8 = p65Var2.M();
            if (z4 || objM8 == uobVar4) {
                objM8 = new x45() { // from class: o4e
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        int i112 = i11;
                        c1e c1eVar2 = c1e.a;
                        l78 l78Var32 = l78Var3;
                        g4e g4eVar3 = g4eVar2;
                        uid uidVar22 = (uid) obj;
                        switch (i112) {
                            case 0:
                                uidVar22.getClass();
                                l78Var32.setValue(uidVar22);
                                String str22 = uidVar22.a.b;
                                str22.getClass();
                                h5e h5eVar = g4eVar3.b;
                                h5eVar.getClass();
                                h5eVar.h = str22;
                                vx0.c0(f76.F(h5eVar), null, null, new e5e(h5eVar, null, 0), 3);
                                break;
                            default:
                                uidVar22.getClass();
                                l78Var32.setValue(uidVar22);
                                String str3 = uidVar22.a.b;
                                str3.getClass();
                                h5e h5eVar2 = g4eVar3.b;
                                h5eVar2.getClass();
                                h5eVar2.g = str3;
                                vx0.c0(f76.F(h5eVar2), null, null, new e5e(h5eVar2, null, 5), 3);
                                break;
                        }
                        return c1eVar2;
                    }
                };
                p65Var2.j0(objM8);
            }
            d46.m(uidVar2, (x45) objM8, r28VarN2, false, false, null, 3, sk6VarA2, pk6Var2, strR3, null, strR4, 280, null, null, null, 0, p65Var2, 12582912, 3072, 247928);
            hp7.t(p65Var2, w2g.E(jfc.l(o28Var, 24.0f), 24.0f, 0.0f, 2));
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2);
            wgd.w(-1003410150, 212064437, p65Var2, false);
            m73 m73Var = (m73) p65Var2.j(z22.h);
            Object objM9 = p65Var2.M();
            if (objM9 == uobVar4) {
                objM9 = b09.t(m73Var, p65Var2);
            }
            hl7 hl7Var = (hl7) objM9;
            Object objM10 = p65Var2.M();
            if (objM10 == uobVar4) {
                objM10 = b09.r(p65Var2);
            }
            z52 z52Var = (z52) objM10;
            Object objM11 = p65Var2.M();
            if (objM11 == uobVar4) {
                objM11 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM11);
            }
            l78 l78Var4 = (l78) objM11;
            Object objM12 = p65Var2.M();
            if (objM12 == uobVar4) {
                objM12 = b09.s(z52Var, p65Var2);
            }
            m62 m62Var2 = (m62) objM12;
            Object objM13 = p65Var2.M();
            c1e c1eVar2 = c1e.a;
            if (objM13 == uobVar4) {
                objM13 = b09.v(c1eVar2, y3b.h, p65Var2);
            }
            l78 l78Var5 = (l78) objM13;
            boolean zH = p65Var2.h(hl7Var) | p65Var2.d(257);
            Object objM14 = p65Var2.M();
            if (zH || objM14 == uobVar4) {
                objM14 = new ftc(l78Var5, hl7Var, m62Var2, l78Var4, 5);
                m62Var = m62Var2;
                l78Var = l78Var4;
                p65Var2.j0(objM14);
            } else {
                m62Var = m62Var2;
                l78Var = l78Var4;
            }
            zk7 zk7Var = (zk7) objM14;
            Object objM15 = p65Var2.M();
            if (objM15 == uobVar4) {
                objM15 = new gtc(l78Var, m62Var, 5);
                p65Var2.j0(objM15);
            }
            m45 m45Var = (m45) objM15;
            boolean zH2 = p65Var2.h(hl7Var);
            Object objM16 = p65Var2.M();
            if (zH2 || objM16 == uobVar4) {
                objM16 = new htc(hl7Var, 5);
                p65Var2.j0(objM16);
            }
            r28 r28VarA = wxb.a(r28VarE, false, (x45) objM16);
            je2 je2Var = new je2(l78Var5, z52Var, m45Var, a5eVar2, g4eVar2, 6);
            a5eVar2 = a5eVar2;
            hlg.j(r28VarA, pxf.E(1200550679, je2Var, p65Var2), zk7Var, p65Var2, 48);
            ka1.B(p65Var2, false, o28Var, 24.0f, p65Var2);
            boolean z5 = i10 == 256;
            Object objM17 = p65Var2.M();
            if (z5 || objM17 == uobVar4) {
                c1eVar = c1eVar2;
                uobVar2 = uobVar4;
                p65Var = p65Var2;
                i3 = 2;
                f2 = 1.0f;
                f3 = 0.0f;
                sr4Var = sr4Var2;
                ibdVar = new ibd(0, g4eVar, g4e.class, "onSubmitClicked", "onSubmitClicked()V", 0, 23);
                p65Var.j0(ibdVar);
            } else {
                ibdVar = objM17;
                p65Var = p65Var2;
                uobVar2 = uobVar4;
                i3 = 2;
                f2 = 1.0f;
                f3 = 0.0f;
                sr4Var = sr4Var2;
                c1eVar = c1eVar2;
            }
            p65Var2 = p65Var;
            fo7.r((m45) ((qh6) ibdVar), vo7.R(p65Var, R.string.update_catalog_submit), xn7.M, bgf.N(w2g.E(jfc.d(jfc.q(new dr5(z46.q), f3, 348.0f, 1), f2), 24.0f, f3, i3), "submit"), a5eVar2.f, p65Var2, 384, 0);
            p65Var2.p(true);
            p65Var2.p(true);
            p65Var2.p(true);
            Object objM18 = p65Var2.M();
            if (objM18 == uobVar2) {
                objM18 = new y8(sr4Var, null, 7);
                p65Var2.j0(objM18);
            }
            kyd.k(p65Var2, (b55) objM18, c1eVar);
        } else {
            p65Var2.S();
        }
        mwa mwaVarS = p65Var2.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 19, a5eVar2, akcVar, g4eVar, r28Var);
        }
    }

    public static final void w(b5e b5eVar, g4e g4eVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object ibdVar;
        float f2;
        b5e b5eVar2 = b5eVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(592799548);
        int i3 = i2 | (p65Var.f(b5eVar2) ? 4 : 2) | (p65Var.f(g4eVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            b5eVar2 = b5eVar;
            b24 b24Var = b5eVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                ibdVar = new ibd(0, g4eVar, g4e.class, "refresh", "refresh()V", 0, 24);
                p65Var.j0(ibdVar);
            } else {
                ibdVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) ibdVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 12, b5eVar2, g4eVar, r28Var);
        }
    }

    public static final void x(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1675551388);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(rh4Var), "loading"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
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
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            xz5.o(iy0.a.a(o28Var, ar0Var), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 4);
        }
    }

    public static final void y(vpc vpcVar, bo4 bo4Var, vpc vpcVar2, g4e g4eVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        Object gbdVar;
        uob uobVar;
        o28 o28Var;
        int i3;
        g4e g4eVar2 = g4eVar;
        vpcVar.getClass();
        bo4Var.getClass();
        vpcVar2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1520893342);
        int i4 = (p65Var2.h(vpcVar) ? 4 : 2) | i2 | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.h(vpcVar2) ? 256 : 128);
        if ((i2 & 3072) == 0) {
            i4 |= p65Var2.f(g4eVar2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = i4 | 24576;
        byte b2 = 0;
        int i6 = 1;
        if (p65Var2.P(i5 & 1, (i5 & 9363) != 9362)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var2, i5 & 14);
            l78 l78VarZ2 = guc.z(vpcVar2, p65Var2, (i5 >> 6) & 14);
            nhc nhcVarF = mk7.F(p65Var2);
            akc akcVar = (akc) p65Var2.j(z22.r);
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                objM = new tjd(15);
                p65Var2.j0(objM);
            }
            o28 o28Var2 = o28.b;
            r28 r28VarN = bgf.N(wxb.a(o28Var2, false, (x45) objM), "update_catalog_screen");
            mz1 mz1VarE = pxf.E(988899234, new p4e(g4eVar2, i6, b2), p65Var2);
            mz1 mz1VarE2 = pxf.E(-1548440924, new eyc(nhcVarF, 8), p65Var2);
            mz1 mz1VarE3 = pxf.E(1643773165, new gab(g4eVar2, akcVar, l78VarZ, 10), p65Var2);
            byte b3 = 0;
            boolean z = true;
            pr7.b(r28VarN, mz1VarE, null, mz1VarE2, null, 0, 0L, 0L, null, mz1VarE3, p65Var2, 805309488, 500);
            p65Var = p65Var2;
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            int i7 = i5 & 7168;
            boolean zH = (i7 == 2048) | p65Var.h(bo4Var) | p65Var.f(nhcVarF) | p65Var.h(resources);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar2) {
                uobVar = uobVar2;
                gbdVar = new gbd(bo4Var, g4eVar2, nhcVarF, resources, (n92) null);
                p65Var.j0(gbdVar);
            } else {
                gbdVar = objM2;
                uobVar = uobVar2;
            }
            kyd.k(p65Var, (b55) gbdVar, c1e.a);
            w4e w4eVar = (w4e) l78VarZ2.getValue();
            if (w4eVar != null) {
                p65Var.Y(1289691279);
                if (i7 != 2048) {
                    z = false;
                }
                Object objM3 = p65Var.M();
                if (z || objM3 == uobVar) {
                    o28Var = o28Var2;
                    i3 = 2;
                    g4eVar2 = g4eVar;
                    objM3 = new ibd(0, g4eVar2, g4e.class, "onDialogClosed", "onDialogClosed()V", 0, 25);
                    p65Var.j0(objM3);
                } else {
                    g4eVar2 = g4eVar;
                    o28Var = o28Var2;
                    i3 = 2;
                }
                hlg.a((m45) ((qh6) objM3), pxf.E(209803118, new p4e(g4eVar2, i3, b3), p65Var), null, pxf.E(333084784, new p4e(g4eVar2, 3, b3), p65Var), null, sgg.h, sgg.i, null, 0L, 0L, 0L, 0L, null, p65Var, 1772592, 0, 16276);
                p65Var = p65Var;
                p65Var.p(false);
            } else {
                g4eVar2 = g4eVar;
                o28Var = o28Var2;
                if (w4eVar != null) {
                    throw ho2.L(p65Var, 1289688052, false);
                }
                p65Var.Y(1289716194);
                p65Var.p(false);
            }
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(vpcVar, bo4Var, vpcVar2, g4eVar2, r28Var2, i2, 20);
        }
    }

    public static final void z(g4e g4eVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1570756997);
        int i3 = (p65Var2.f(g4eVar) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.update_catalog_title);
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var2);
            String strR2 = vo7.R(p65Var2, R.string.common_close);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new ibd(0, g4eVar, g4e.class, "onBackPressed", "onBackPressed()V", 0, 28);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, strR, (m45) ((qh6) objM), null, c09VarJ, strR2, 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_VENDOR);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new p4e(g4eVar, i2);
        }
    }
}
