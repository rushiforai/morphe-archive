package defpackage;

import android.content.res.Resources;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xk8 {
    /* JADX WARN: Removed duplicated region for block: B:70:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x017e A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0180  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.fl8 r21, com.medium.android.core.navigation.NotificationFilterType r22, defpackage.kv6 r23, defpackage.vk8 r24, defpackage.ek8 r25, defpackage.obe r26, defpackage.r28 r27, defpackage.x12 r28, int r29) {
        /*
            Method dump skipped, instruction units count: 441
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xk8.a(fl8, com.medium.android.core.navigation.NotificationFilterType, kv6, vk8, ek8, obe, r28, x12, int):void");
    }

    public static final void b(dl8 dl8Var, NotificationFilterType notificationFilterType, vk8 vk8Var, ek8 ek8Var, obe obeVar, kv6 kv6Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        NotificationFilterType notificationFilterType2;
        p65 p65Var;
        boolean z;
        int i3;
        uob uobVar;
        vk8 vk8Var2 = vk8Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1061131730);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(dl8Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.d(notificationFilterType.ordinal()) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(vk8Var2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(ek8Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(obeVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var2.f(kv6Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var2.f(r28Var) ? 1048576 : 524288;
        }
        if (p65Var2.P(i2 & 1, (599187 & i2) != 599186)) {
            boolean z2 = dl8Var.b;
            int i4 = i2 & 896;
            boolean z3 = i4 == 256;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                z = z2;
                i3 = i4;
                uobVar = uobVar2;
                qv7 qv7Var = new qv7(0, vk8Var, vk8.class, "refresh", "refresh()V", 0, 19);
                p65Var2.j0(qv7Var);
                objM = qv7Var;
            } else {
                z = z2;
                i3 = i4;
                uobVar = uobVar2;
            }
            int i5 = i2;
            vk8Var2 = vk8Var;
            er7.d(z, (m45) ((qh6) objM), r28Var.b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(1028793348, new g91(kv6Var, (Object) dl8Var, (Object) ek8Var, (Object) obeVar, (Object) vk8Var, 3), p65Var2), p65Var2, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            boolean z4 = (i3 == 256) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                notificationFilterType2 = notificationFilterType;
                objM2 = new rc0(vk8Var2, notificationFilterType2, null, 26);
                p65Var.j0(objM2);
            } else {
                notificationFilterType2 = notificationFilterType;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            notificationFilterType2 = notificationFilterType;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(dl8Var, notificationFilterType2, vk8Var2, ek8Var, obeVar, kv6Var, r28Var, i, 3);
        }
    }

    public static final void c(gl8 gl8Var, nhc nhcVar, vk8 vk8Var, ek8 ek8Var, obe obeVar, r28 r28Var, gz8 gz8Var, x12 x12Var, int i) {
        int i2;
        ek8 ek8Var2;
        obe obeVar2;
        vk8 vk8Var2;
        gz8 gz8Var2;
        gl8Var.getClass();
        nhcVar.getClass();
        vk8Var.getClass();
        obeVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1613767800);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(gl8Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(nhcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(vk8Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            ek8Var2 = ek8Var;
            i2 |= p65Var.f(ek8Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            ek8Var2 = ek8Var;
        }
        if ((i & 24576) == 0) {
            obeVar2 = obeVar;
            i2 |= p65Var.f(obeVar2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            obeVar2 = obeVar;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i & 1572864) == 0) {
            i2 |= p65Var.f(gz8Var) ? 1048576 : 524288;
        }
        int i3 = i2;
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new hb8(8);
                p65Var.j0(objM);
            }
            boolean z = false;
            gz8Var2 = gz8Var;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "notifications"), pxf.E(-66802292, new v08(5, vk8Var), p65Var), null, pxf.E(-1255594866, new w87(nhcVar, 5), p65Var), null, 0, 0L, 0L, null, pxf.E(-419471145, new g91(gz8Var, gl8Var, vk8Var, ek8Var2, obeVar2, 18), p65Var), p65Var, 805309488, 500);
            boolean z2 = (((3670016 & i3) ^ 1572864) > 1048576 && p65Var.f(gz8Var2)) || (i3 & 1572864) == 1048576;
            if ((i3 & 896) == 256) {
                z = true;
            }
            boolean z3 = z2 | z;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                vk8Var2 = vk8Var;
                objM2 = new kd7(gz8Var2, vk8Var2, null, 12);
                p65Var.j0(objM2);
            } else {
                vk8Var2 = vk8Var;
            }
            kyd.k(p65Var, (b55) objM2, gz8Var2);
        } else {
            vk8Var2 = vk8Var;
            gz8Var2 = gz8Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(gl8Var, nhcVar, vk8Var2, ek8Var, obeVar, r28Var, gz8Var2, i, 4);
        }
    }

    public static final void d(String str, ek8 ek8Var, r28 r28Var, NotificationFilterType notificationFilterType, nl8 nl8Var, x12 x12Var, int i) {
        NotificationFilterType notificationFilterType2;
        nl8 nl8Var2;
        int i2;
        nl8 nl8Var3;
        nl8 nl8Var4;
        str.getClass();
        notificationFilterType.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2024594180);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(ek8Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | (p65Var.d(notificationFilterType.ordinal()) ? 2048 : 1024) | 8192;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    notificationFilterType2 = notificationFilterType;
                    objM = new q58(str, 7, notificationFilterType2);
                    p65Var.j0(objM);
                } else {
                    notificationFilterType2 = notificationFilterType;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    nl8 nl8Var5 = (nl8) to7.z(n1b.a.b(nl8.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-57345);
                    nl8Var3 = nl8Var5;
                }
            } else {
                p65Var.S();
                notificationFilterType2 = notificationFilterType;
                i2 = i3 & (-57345);
                nl8Var3 = nl8Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(nl8Var3.s, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i5 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i5 == 32) | p65Var.f(nl8Var3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new vk8(ek8Var, nl8Var3);
                p65Var.j0(objM2);
            }
            vk8 vk8Var = (vk8) objM2;
            boolean zF2 = p65Var.f(nl8Var3) | (i5 == 32);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new wk8(ek8Var, nl8Var3);
                p65Var.j0(objM3);
            }
            wk8 wk8Var = (wk8) objM3;
            int iOrdinal = ((gl8) l78VarZ.getValue()).a.ordinal();
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new oo7(20);
                p65Var.j0(objM4);
            }
            d13 d13VarB = jz8.b(iOrdinal, (m45) objM4, p65Var, 384, 2);
            c((gl8) l78VarZ.getValue(), nhcVarF, vk8Var, ek8Var, wk8Var, r28Var, d13VarB, p65Var, ((i2 << 9) & 458752) | ((i2 << 6) & 7168));
            NotificationFilterType notificationFilterType3 = ((gl8) l78VarZ.getValue()).a;
            boolean zF3 = p65Var.f(d13VarB) | p65Var.f(l78VarZ);
            Object objM5 = p65Var.M();
            if (zF3 || objM5 == uobVar) {
                objM5 = new xx4(d13VarB, l78VarZ, null, 1);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, notificationFilterType3);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = kyd.M(p65Var);
                p65Var.j0(objM6);
            }
            sb2 sb2Var = (sb2) objM6;
            boolean zH = p65Var.h(nl8Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(wk8Var);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar) {
                nl8Var4 = nl8Var3;
                uk8 uk8Var = new uk8(nl8Var4, nhcVarF, sb2Var, resources, wk8Var, (n92) null, 0);
                p65Var.j0(uk8Var);
                objM7 = uk8Var;
            } else {
                nl8Var4 = nl8Var3;
            }
            kyd.k(p65Var, (b55) objM7, c1e.a);
            nl8Var2 = nl8Var4;
        } else {
            notificationFilterType2 = notificationFilterType;
            p65Var.S();
            nl8Var2 = nl8Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(str, ek8Var, r28Var, notificationFilterType2, nl8Var2, i);
        }
    }

    public static final void e(vk8 vk8Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1158478367);
        int i2 = (p65Var2.f(vk8Var) ? 4 : 2) | i | 48;
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            String strR = vo7.R(p65Var2, R.string.notifications_title);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new qv7(0, vk8Var, vk8.class, "onBackPressed", "onBackPressed()V", 0, 21);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            r28Var2 = o28.b;
            qk7.g(r28Var2, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 6, 504);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(vk8Var, r28Var2, i, 29);
        }
    }
}
