package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Paint;
import android.net.Uri;
import android.text.Layout;
import android.util.DisplayMetrics;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.models.CurrentUserAdminCollectionEntity;
import com.medium.android.core.models.CurrentUserEntity;
import com.medium.android.core.models.MastodonEntity;
import com.medium.android.core.models.PartnerProgramEnrollment;
import com.medium.android.core.models.PartnerProgramV4EnrollmentStatus;
import com.medium.android.core.navigation.s;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.susi.data.CreateAccountData;
import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import kotlinx.serialization.json.internal.JsonDecodingException;
import kotlinx.serialization.json.internal.JsonEncodingException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m40 {
    public static final mz1 a;
    public static final mz1 e;
    public static final mz1 i;
    public static final mz1 j;
    public static final da4 o;
    public static final da4 p;
    public static final da4[] q;
    public static final /* synthetic */ int r = 0;
    public static final /* synthetic */ int s = 0;
    public static final mz1 b = new mz1(new a02(19), false, 1106817218);
    public static final mz1 c = new mz1(new yz1(29), false, -2043156228);
    public static final mz1 d = new mz1(new a02(20), false, -1067551239);
    public static final mz1 f = new mz1(new j02(28), false, -1454701170);
    public static final mz1 g = new mz1(new u02(17), false, -257859904);
    public static final mz1 h = new mz1(new u02(18), false, 1341289154);
    public static final qna k = new qna(22);
    public static final p44 l = new p44(6);
    public static final g m = new g(12);
    public static final xzb[] n = new xzb[0];

    static {
        int i2 = 8;
        byte b2 = 0;
        a = new mz1(new e02(i2), false, 365703890);
        e = new mz1(new c02(b2), false, -1983428032);
        i = new mz1(new v02(i2, b2), false, -1072590521);
        j = new mz1(new v02(9, b2), false, -273015992);
        da4 da4Var = new da4("GET_CREDENTIAL", 1L);
        o = da4Var;
        da4 da4Var2 = new da4("CREDENTIAL_REGISTRY", 1L);
        da4 da4Var3 = new da4("CLEAR_REGISTRY", 2L);
        da4 da4Var4 = new da4("CLEAR_CREATION_OPTIONS", 1L);
        da4 da4Var5 = new da4("CLEAR_CREDENTIAL_STATE", 1L);
        p = da4Var5;
        q = new da4[]{da4Var, da4Var2, da4Var3, da4Var4, da4Var5, new da4("CREATE_CREDENTIAL", 3L), new da4("REGISTER_CREATION_OPTIONS", 1L), new da4("REGISTER_EXPORT", 1L), new da4("IMPORT_CREDENTIALS", 1L), new da4("SIGNAL_CREDENTIAL_STATE", 1L), new da4("CLEAR_EXPORT", 1L), new da4("IMPORT_CREDENTIALS_FOR_DEVICE_SETUP", 3L), new da4("EXPORT_CREDENTIALS_TO_DEVICE_SETUP", 3L), new da4("GET_CREDENTIAL_TRANSFER_CAPABILITIES", 3L)};
    }

    public static final void A(c2e c2eVar, x1e x1eVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1382150419);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var2.f(c2eVar) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(x1eVar) ? 32 : 16;
        }
        int i5 = i3 | 384;
        if (p65Var2.P(i5 & 1, (i5 & 147) != 146)) {
            p65Var2.Y(1101666250);
            kx kxVar = new kx();
            p65Var2.Y(1101666300);
            ohd ohdVar = ohd.c;
            skc skcVar = null;
            int i6 = 14;
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), skcVar, i6);
            int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = i7 == 32;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new r8(i4, x1eVar);
                p65Var2.j0(objM);
            }
            int iV = ho2.v("see_all_sign_in_options", wjdVar, (e07) objM, kxVar);
            try {
                kxVar.d(vo7.R(p65Var2, R.string.unrecognized_email_see_all_sign_in_options));
                kxVar.f(iV);
                p65Var2.p(false);
                kxVar.d(" ");
                kxVar.d(vo7.R(p65Var2, R.string.unrecognized_email_or));
                kxVar.d(" ");
                p65Var2.Y(1101684844);
                wjd wjdVar2 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), skcVar, i6);
                boolean z2 = ((i5 & 14) == 4) | (i7 == 32);
                Object objM2 = p65Var2.M();
                if (z2 || objM2 == uobVar) {
                    objM2 = new bf0(x1eVar, 7, c2eVar);
                    p65Var2.j0(objM2);
                }
                iV = ho2.v("create_account", wjdVar2, (e07) objM2, kxVar);
                try {
                    kxVar.d(vo7.R(p65Var2, R.string.unrecognized_email_create_new_account));
                    kxVar.f(iV);
                    p65Var2.p(false);
                    mx mxVarI = kxVar.i();
                    p65Var2.p(false);
                    mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
                    o28 o28Var = o28.b;
                    p65Var = p65Var2;
                    jjd.c(mxVarI, bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "sign_in_or_create_account"), 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, mkdVar, p65Var, 0, 0, 261116);
                    r28Var2 = o28Var;
                } finally {
                }
            } finally {
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 20, c2eVar, x1eVar, r28Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x028e  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x02a2  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x02b0  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x02fc  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0311  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void B(defpackage.c2e r41, final defpackage.x1e r42, defpackage.r28 r43, defpackage.x12 r44, int r45) {
        /*
            Method dump skipped, instruction units count: 924
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m40.B(c2e, x1e, r28, x12, int):void");
    }

    public static final void C(c2e c2eVar, x1e x1eVar, r28 r28Var, nhc nhcVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        c2eVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(833107451);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(c2eVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(x1eVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(nhcVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new tjd(10);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, false, (x45) objM), "unrecognized_email_screen");
            mz1 mz1VarE = pxf.E(1604739839, new u1e(x1eVar), p65Var2);
            mz1 mz1VarE2 = pxf.E(883820417, new eyc(nhcVar, 6), p65Var2);
            y0e y0eVarV = hk7.v(p65Var2);
            WeakHashMap weakHashMap = f5f.w;
            p65Var = p65Var2;
            pr7.b(r28VarN, mz1VarE, null, mz1VarE2, null, 0, 0L, 0L, new y0e(y0eVarV, tr7.o(p65Var2).c), pxf.E(1177460874, new dyc(c2eVar, 8, x1eVar), p65Var2), p65Var, 805309488, 244);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(c2eVar, x1eVar, r28Var, nhcVar, i2, 24);
        }
    }

    public static final void D(String str, String str2, SusiDestination susiDestination, boolean z, nec necVar, r28 r28Var, e2e e2eVar, x12 x12Var, int i2) {
        r28 r28Var2;
        e2e e2eVar2;
        int i3;
        e2e e2eVar3;
        int i4;
        r28 r28Var3;
        Object kycVar;
        e2e e2eVar4;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2104830133);
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(susiDestination) ? 256 : 128) | (p65Var.g(z) ? 2048 : 1024) | (p65Var.f(necVar) ? 16384 : 8192) | 720896;
        if (p65Var.P(i5 & 1, (599187 & i5) != 599186)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z2 = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i5 & 896) == 256) | ((i5 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    i3 = 0;
                    z9c z9cVar = new z9c(str, str2, susiDestination, z, 1);
                    p65Var.j0(z9cVar);
                    objM = z9cVar;
                } else {
                    i3 = 0;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    e2eVar3 = (e2e) to7.z(n1b.a.b(e2e.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i4 = i5 & (-3670017);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i4 = i5 & (-3670017);
                r28Var3 = r28Var;
                e2eVar3 = e2eVar;
                i3 = 0;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(e2eVar3.n, p65Var, i3);
            Object objM2 = p65Var.M();
            Object objJ = objM2;
            if (objM2 == uobVar) {
                objJ = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objJ;
            akc akcVar = (akc) p65Var.j(z22.r);
            C((c2e) l78VarZ.getValue(), new x1e(necVar, e2eVar3), r28Var3, nhcVar, p65Var, 3456);
            r28 r28Var4 = r28Var3;
            boolean zH = p65Var.h(e2eVar3);
            Object objM3 = p65Var.M();
            Object obj = objM3;
            if (zH || objM3 == uobVar) {
                obb obbVar = new obb(e2eVar3, null, 20);
                p65Var.j0(obbVar);
                obj = obbVar;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) obj, c1eVar);
            Resources resources = (Resources) p65Var.j(eo.c);
            int i7 = (p65Var.h(e2eVar3) ? 1 : 0) | (p65Var.f(akcVar) ? 1 : 0) | ((i4 & 57344) != 16384 ? i3 : 1) | (p65Var.h(resources) ? 1 : 0);
            Object objM4 = p65Var.M();
            if (i7 != 0 || objM4 == uobVar) {
                e2eVar4 = e2eVar3;
                kycVar = new kyc(e2eVar4, akcVar, necVar, nhcVar, resources, (n92) null);
                p65Var.j0(kycVar);
            } else {
                kycVar = objM4;
                e2eVar4 = e2eVar3;
            }
            kyd.k(p65Var, (b55) kycVar, c1eVar);
            r28Var2 = r28Var4;
            e2eVar2 = e2eVar4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            e2eVar2 = e2eVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new me0(str, str2, susiDestination, z, necVar, r28Var2, e2eVar2, i2, 4);
        }
    }

    public static final void E(x1e x1eVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2064807604);
        int i3 = (p65Var2.f(x1eVar) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new ibd(0, x1eVar, x1e.class, "onBackPressed", "onBackPressed()V", 0, 13);
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
            mwaVarS.d = new u1e(x1eVar, i2);
        }
    }

    public static final Set F(xzb xzbVar) {
        xzbVar.getClass();
        if (xzbVar instanceof p31) {
            return ((p31) xzbVar).b();
        }
        HashSet hashSet = new HashSet(xzbVar.e());
        int iE = xzbVar.e();
        for (int i2 = 0; i2 < iE; i2++) {
            hashSet.add(xzbVar.f(i2));
        }
        return hashSet;
    }

    public static final xzb[] G(List list) {
        xzb[] xzbVarArr;
        if (list == null || list.isEmpty()) {
            list = null;
        }
        return (list == null || (xzbVarArr = (xzb[]) list.toArray(new xzb[0])) == null) ? n : xzbVarArr;
    }

    public static final void H(y28 y28Var, LinkedHashSet linkedHashSet, ev7 ev7Var, boolean z) {
        for (yv2 yv2Var : qo7.o(ev7Var, p83.o, 2)) {
            if (yv2Var instanceof y28) {
                y28 y28VarY0 = (y28) yv2Var;
                if (y28VarY0.y()) {
                    n98 name = y28VarY0.getName();
                    name.getClass();
                    co1 co1VarD = ev7Var.d(name, ng8.WHEN_GET_ALL_DESCRIPTORS);
                    y28VarY0 = co1VarD instanceof y28 ? (y28) co1VarD : co1VarD instanceof ha3 ? ((ha3) co1VarD).y0() : null;
                }
                if (y28VarY0 != null) {
                    int i2 = d93.a;
                    Iterator it2 = y28VarY0.n().b().iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            if (d93.o((mn6) it2.next(), y28Var.x0())) {
                                linkedHashSet.add(y28VarY0);
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    if (z) {
                        ev7 ev7VarL0 = y28VarY0.l0();
                        ev7VarL0.getClass();
                        H(y28Var, linkedHashSet, ev7VarL0, z);
                    }
                }
            }
        }
    }

    public static final iq1 I(j15 j15Var, wg6 wg6Var, m45 m45Var, m45 m45Var2, m45 m45Var3) {
        j15Var.getClass();
        wg6Var.getClass();
        return new iq1(wg6Var, m45Var, m45Var3, m45Var2);
    }

    public static final bo4 J(bo4 bo4Var) {
        return bo4Var instanceof vpc ? bo4Var : K(bo4Var, k, l);
    }

    public static final fi3 K(bo4 bo4Var, x45 x45Var, b55 b55Var) {
        if (bo4Var instanceof fi3) {
            fi3 fi3Var = (fi3) bo4Var;
            if (fi3Var.b == x45Var && fi3Var.c == b55Var) {
                return fi3Var;
            }
        }
        return new fi3(bo4Var, x45Var, b55Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:5:0x0011  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0134 A[Catch: all -> 0x00e5, Exception -> 0x00e8, TryCatch #8 {Exception -> 0x00e8, all -> 0x00e5, blocks: (B:40:0x00c4, B:42:0x00d2, B:44:0x00d6, B:51:0x00ec, B:53:0x0106, B:55:0x0111, B:62:0x012e, B:64:0x0134, B:67:0x0140, B:69:0x0144, B:70:0x014d, B:58:0x011b, B:60:0x0126, B:92:0x01ae, B:93:0x01b5), top: B:110:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0140 A[Catch: all -> 0x00e5, Exception -> 0x00e8, TryCatch #8 {Exception -> 0x00e8, all -> 0x00e5, blocks: (B:40:0x00c4, B:42:0x00d2, B:44:0x00d6, B:51:0x00ec, B:53:0x0106, B:55:0x0111, B:62:0x012e, B:64:0x0134, B:67:0x0140, B:69:0x0144, B:70:0x014d, B:58:0x011b, B:60:0x0126, B:92:0x01ae, B:93:0x01b5), top: B:110:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0144 A[Catch: all -> 0x00e5, Exception -> 0x00e8, TryCatch #8 {Exception -> 0x00e8, all -> 0x00e5, blocks: (B:40:0x00c4, B:42:0x00d2, B:44:0x00d6, B:51:0x00ec, B:53:0x0106, B:55:0x0111, B:62:0x012e, B:64:0x0134, B:67:0x0140, B:69:0x0144, B:70:0x014d, B:58:0x011b, B:60:0x0126, B:92:0x01ae, B:93:0x01b5), top: B:110:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x014d A[Catch: all -> 0x00e5, Exception -> 0x00e8, TRY_LEAVE, TryCatch #8 {Exception -> 0x00e8, all -> 0x00e5, blocks: (B:40:0x00c4, B:42:0x00d2, B:44:0x00d6, B:51:0x00ec, B:53:0x0106, B:55:0x0111, B:62:0x012e, B:64:0x0134, B:67:0x0140, B:69:0x0144, B:70:0x014d, B:58:0x011b, B:60:0x0126, B:92:0x01ae, B:93:0x01b5), top: B:110:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01c3  */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1, types: [android.database.Cursor] */
    /* JADX WARN: Type inference failed for: r6v2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.ra0 L(android.content.Context r17) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 455
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m40.L(android.content.Context):ra0");
    }

    public static final float M(Layout layout, int i2, Paint paint) {
        float fAbs;
        float width;
        float lineLeft = layout.getLineLeft(i2);
        ThreadLocal threadLocal = sjd.a;
        if (layout.getEllipsisCount(i2) <= 0 || layout.getParagraphDirection(i2) != 1 || lineLeft >= 0.0f) {
            return 0.0f;
        }
        float fMeasureText = paint.measureText("…") + (layout.getPrimaryHorizontal(layout.getEllipsisStart(i2) + layout.getLineStart(i2)) - lineLeft);
        Layout.Alignment paragraphAlignment = layout.getParagraphAlignment(i2);
        if ((paragraphAlignment == null ? -1 : p06.a[paragraphAlignment.ordinal()]) == 1) {
            fAbs = Math.abs(lineLeft);
            width = (layout.getWidth() - fMeasureText) / 2.0f;
        } else {
            fAbs = Math.abs(lineLeft);
            width = layout.getWidth() - fMeasureText;
        }
        return width + fAbs;
    }

    public static final float N(Layout layout, int i2, Paint paint) {
        float width;
        float width2;
        ThreadLocal threadLocal = sjd.a;
        if (layout.getEllipsisCount(i2) <= 0) {
            return 0.0f;
        }
        if (layout.getParagraphDirection(i2) != -1 || layout.getWidth() >= layout.getLineRight(i2)) {
            return 0.0f;
        }
        float fMeasureText = paint.measureText("…") + (layout.getLineRight(i2) - layout.getPrimaryHorizontal(layout.getEllipsisStart(i2) + layout.getLineStart(i2)));
        Layout.Alignment paragraphAlignment = layout.getParagraphAlignment(i2);
        if ((paragraphAlignment != null ? p06.a[paragraphAlignment.ordinal()] : -1) == 1) {
            width = layout.getWidth() - layout.getLineRight(i2);
            width2 = (layout.getWidth() - fMeasureText) / 2.0f;
        } else {
            width = layout.getWidth() - layout.getLineRight(i2);
            width2 = layout.getWidth() - fMeasureText;
        }
        return width - width2;
    }

    public static m50 O(JSONObject jSONObject) throws JSONException {
        String strOptString;
        JSONArray jSONArray = jSONObject.getJSONObject("permissions").getJSONArray("data");
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        int length = jSONArray.length();
        boolean z = false;
        for (int i2 = 0; i2 < length; i2++) {
            JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i2);
            String strOptString2 = jSONObjectOptJSONObject.optString("permission");
            strOptString2.getClass();
            if (strOptString2.length() != 0 && !strOptString2.equals("installed") && (strOptString = jSONObjectOptJSONObject.optString("status")) != null) {
                int iHashCode = strOptString.hashCode();
                if (iHashCode != -1309235419) {
                    if (iHashCode != 280295099) {
                        if (iHashCode == 568196142 && strOptString.equals("declined")) {
                            arrayList2.add(strOptString2);
                        }
                    } else if (strOptString.equals("granted")) {
                        arrayList.add(strOptString2);
                    }
                } else if (strOptString.equals("expired")) {
                    arrayList3.add(strOptString2);
                }
            }
        }
        m50 m50Var = new m50(27, z);
        m50Var.b = arrayList;
        m50Var.c = arrayList2;
        m50Var.d = arrayList3;
        return m50Var;
    }

    public static final void P(jl1 jl1Var, String str) {
        jl1Var.p("Trailing comma before the end of JSON ".concat(str), jl1Var.c - 1, "Trailing commas are non-complaint JSON and not allowed by default. Use 'allowTrailingCommas = true' in 'Json {}' builder to support them.");
        throw null;
    }

    public static boolean Q(Context context) {
        Method methodA = epe.A("com.google.android.gms.common.GooglePlayServicesUtil", "isGooglePlayServicesAvailable", Context.class);
        if (methodA != null) {
            Object objE = epe.E(null, methodA, context);
            if ((objE instanceof Integer) && objE.equals(0)) {
                return true;
            }
        }
        return false;
    }

    public static final CharSequence R(CharSequence charSequence, int i2) {
        charSequence.getClass();
        if (charSequence.length() >= 200) {
            if (i2 != -1) {
                int i3 = i2 - 30;
                int i4 = i2 + 30;
                String str = i3 <= 0 ? "" : ".....";
                String str2 = i4 >= charSequence.length() ? "" : ".....";
                StringBuilder sb = new StringBuilder(str);
                if (i3 < 0) {
                    i3 = 0;
                }
                int length = charSequence.length();
                if (i4 > length) {
                    i4 = length;
                }
                sb.append(charSequence.subSequence(i3, i4).toString());
                sb.append(str2);
                return sb.toString();
            }
            int length2 = charSequence.length() - 60;
            if (length2 > 0) {
                return "....." + charSequence.subSequence(length2, charSequence.length()).toString();
            }
        }
        return charSequence;
    }

    public static final synchronized void S(y3 y3Var, b1c b1cVar) {
        if (ec2.a.contains(m40.class)) {
            return;
        }
        try {
            f89 f89VarJ0 = k40.J0();
            f89VarJ0.a(y3Var, b1cVar.d());
            k40.M0(f89VarJ0);
        } catch (Throwable th) {
            ec2.a(m40.class, th);
        }
    }

    public static final synchronized void T(pkf pkfVar) {
        if (ec2.a.contains(m40.class)) {
            return;
        }
        try {
            pkfVar.getClass();
            f89 f89VarJ0 = k40.J0();
            for (y3 y3Var : pkfVar.A()) {
                b1c b1cVarS = pkfVar.s(y3Var);
                if (b1cVarS == null) {
                    throw new IllegalStateException("Required value was null.");
                }
                f89VarJ0.a(y3Var, b1cVarS.d());
            }
            k40.M0(f89VarJ0);
        } catch (Throwable th) {
            ec2.a(m40.class, th);
        }
    }

    public static final Object U(i89 i89Var, d8a d8aVar) {
        d8aVar.getClass();
        Object objB = i89Var.get(d8aVar);
        if (objB == null) {
            objB = d8aVar.b();
        }
        return ((gqe) objB).a(i89Var);
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public static final r28 V(r28 r28Var, x12 x12Var, int i2) {
        zwa zwaVar;
        r28Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-1865284449);
        p65Var.Y(466348159);
        f8c f8cVar = (f8c) p65Var.j(g8c.b);
        f8cVar.getClass();
        p65Var.Y(1265936280);
        sn3 sn3Var = z22.h;
        float fZ = ((m73) p65Var.j(sn3Var)).Z(400.0f);
        p65Var.Y(5004770);
        boolean zF = p65Var.f(f8cVar);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (zF || objM == uobVar) {
            objM = new c8c(f8cVar.a, f8cVar.b, f8cVar.c, fZ);
            p65Var.j0(objM);
        }
        c8c c8cVar = (c8c) objM;
        p65Var.p(false);
        p65Var.Y(5004770);
        boolean zH = p65Var.h(c8cVar);
        Object objM2 = p65Var.M();
        n92 n92Var = null;
        if (zH || objM2 == uobVar) {
            objM2 = new xi7(c8cVar, n92Var, 16);
            p65Var.j0(objM2);
        }
        p65Var.p(false);
        kyd.k(p65Var, (b55) objM2, c8cVar);
        p65Var.p(false);
        p65Var.Y(1234290070);
        Object obj = z7c.a;
        a8c a8cVar = a8c.a;
        if (a8cVar.equals(obj)) {
            zwaVar = zwa.e;
        } else if (a8cVar.equals(a8cVar)) {
            zwaVar = null;
        } else {
            if (!a8cVar.equals(b8c.a)) {
                ygf.a();
                return null;
            }
            p65Var.Y(137725222);
            p65Var.Y(1849434622);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
                zwa zwaVar2 = new zwa(0.0f, 0.0f, displayMetrics.widthPixels, displayMetrics.heightPixels);
                p65Var.j0(zwaVar2);
                objM3 = zwaVar2;
            }
            zwaVar = (zwa) objM3;
            p65Var.p(false);
            p65Var.p(false);
        }
        p65Var.p(false);
        p65Var.Y(-1633490746);
        boolean zF2 = p65Var.f(f8cVar) | p65Var.f(c8cVar);
        Object objM4 = p65Var.M();
        if (zF2 || objM4 == uobVar) {
            objM4 = new x7c(f8cVar, c8cVar, zwaVar);
            p65Var.j0(objM4);
        }
        x7c x7cVar = (x7c) objM4;
        p65Var.p(false);
        x7cVar.c.l(zwaVar);
        p65Var.p(false);
        float fZ2 = ((m73) p65Var.j(sn3Var)).Z(400.0f);
        p65Var.Y(-1633490746);
        boolean zC = p65Var.c(fZ2) | p65Var.c(15.0f);
        Object objM5 = p65Var.M();
        if (zC || objM5 == uobVar) {
            objM5 = new y7c(fZ2);
            p65Var.j0(objM5);
        }
        y7c y7cVar = (y7c) objM5;
        p65Var.p(false);
        p65Var.Y(-1633490746);
        boolean zH2 = p65Var.h(x7cVar) | p65Var.h(y7cVar);
        Object objM6 = p65Var.M();
        if (zH2 || objM6 == uobVar) {
            objM6 = new eub(x7cVar, y7cVar, n92Var, 9);
            p65Var.j0(objM6);
        }
        p65Var.p(false);
        kyd.l(y7cVar, x7cVar, (b55) objM6, p65Var);
        c8c c8cVar2 = x7cVar.b;
        y7cVar.getClass();
        c8cVar2.getClass();
        d8c d8cVar = new d8c();
        d8cVar.b = y7cVar;
        d8cVar.c = c8cVar2;
        r28 r28VarB = r28Var.b(d8cVar);
        p65Var.p(false);
        return r28VarB;
    }

    public static final void W(jl1 jl1Var, Number number) {
        jl1.q(jl1Var, "Unexpected special floating-point value " + number + ". By default, non-finite floating point values are prohibited because they do not conform JSON specification", 0, "It is possible to deserialize them using 'JsonBuilder.allowSpecialFloatingPointValues = true'", 2);
        throw null;
    }

    public static final rj2 X(CurrentUserEntity currentUserEntity) {
        bj7 bj7Var;
        u49 u49Var;
        u49 u49Var2;
        v49 v49Var;
        currentUserEntity.getClass();
        String id = currentUserEntity.getId();
        String name = currentUserEntity.getName();
        String username = currentUserEntity.getUsername();
        String profileImageId = currentUserEntity.getProfileImageId();
        String bio = currentUserEntity.getBio();
        String aboutAsHtml = currentUserEntity.getAboutAsHtml();
        Long followerCount = currentUserEntity.getFollowerCount();
        Long followingCount = currentUserEntity.getFollowingCount();
        zw7 zw7VarX = to7.x(currentUserEntity.getMembershipType());
        Long memberSince = currentUserEntity.getMemberSince();
        Long friendSince = currentUserEntity.getFriendSince();
        boolean zIsMembershipTrialEligible = currentUserEntity.isMembershipTrialEligible();
        String facebookDisplayName = currentUserEntity.getFacebookDisplayName();
        String twitterDisplayName = currentUserEntity.getTwitterDisplayName();
        boolean hasLists = currentUserEntity.getHasLists();
        boolean zIsBookAuthor = currentUserEntity.isBookAuthor();
        Long firstOpenedAndroidApp = currentUserEntity.getFirstOpenedAndroidApp();
        List<CurrentUserAdminCollectionEntity> adminOfCollections = currentUserEntity.getAdminOfCollections();
        ArrayList arrayList = new ArrayList(cu1.k0(adminOfCollections, 10));
        Iterator it2 = adminOfCollections.iterator();
        while (it2.hasNext()) {
            CurrentUserAdminCollectionEntity currentUserAdminCollectionEntity = (CurrentUserAdminCollectionEntity) it2.next();
            arrayList.add(new sj2(currentUserAdminCollectionEntity.getId(), currentUserAdminCollectionEntity.getName()));
            it2 = it2;
            name = name;
        }
        String str = name;
        boolean allowEmailAddressSharing = currentUserEntity.getAllowEmailAddressSharing();
        List<String> pronouns = currentUserEntity.getPronouns();
        PartnerProgramEnrollment partnerProgramEnrollment = currentUserEntity.getPartnerProgramEnrollment();
        if (partnerProgramEnrollment != null) {
            PartnerProgramV4EnrollmentStatus status = partnerProgramEnrollment.getStatus();
            int i2 = status == null ? -1 : uj2.a[status.ordinal()];
            if (i2 == -1) {
                v49Var = null;
            } else if (i2 == 1) {
                v49Var = v49.ACTIVE;
            } else if (i2 == 2) {
                v49Var = v49.INACTIVE;
            } else if (i2 == 3) {
                v49Var = v49.PENDING_ACTION;
            } else if (i2 == 4) {
                v49Var = v49.SUSPENDED;
            } else {
                if (i2 != 5) {
                    ygf.a();
                    return null;
                }
                v49Var = v49.UNKNOWN;
            }
            u49Var = new u49(v49Var);
            bj7Var = null;
        } else {
            bj7Var = null;
            u49Var = null;
        }
        Long lastPostCreatedAt = currentUserEntity.getLastPostCreatedAt();
        boolean zIsSuspended = currentUserEntity.isSuspended();
        MastodonEntity mastodonEntity = currentUserEntity.getMastodonEntity();
        if (mastodonEntity != null) {
            u49Var2 = u49Var;
            bj7Var = new bj7(mastodonEntity.getDomain(), mastodonEntity.getUsername());
        } else {
            u49Var2 = u49Var;
        }
        return new rj2(id, str, username, profileImageId, bio, aboutAsHtml, followerCount, followingCount, zw7VarX, memberSince, friendSince, zIsMembershipTrialEligible, facebookDisplayName, twitterDisplayName, bj7Var, hasLists, zIsBookAuthor, firstOpenedAndroidApp, arrayList, allowEmailAddressSharing, pronouns, u49Var2, lastPostCreatedAt, zIsSuspended);
    }

    public static final i89 Y(o10[] o10VarArr, i89 i89Var, i89 i89Var2) {
        h89 h89Var = new h89(i89.d);
        for (o10 o10Var : o10VarArr) {
            d8a d8aVar = (d8a) o10Var.f;
            if (o10Var.e || !i89Var.containsKey(d8aVar)) {
                h89Var.put(d8aVar, d8aVar.c(o10Var, (gqe) i89Var2.get(d8aVar)));
            }
        }
        return h89Var.h();
    }

    public static final List Z(int i2, int i3, ArrayList arrayList, List list) {
        if (arrayList.isEmpty()) {
            return ey3.a;
        }
        ArrayList arrayList2 = new ArrayList(list);
        int size = arrayList.size();
        for (int i4 = 0; i4 < size; i4++) {
            zt6 zt6Var = (zt6) arrayList.get(i4);
            int index = zt6Var.getIndex();
            if (i2 <= index && index <= i3) {
                arrayList2.add(zt6Var);
            }
        }
        eu1.m0(arrayList2, m);
        return arrayList2;
    }

    public static final void a(l9 l9Var, final c9 c9Var, r28 r28Var, x12 x12Var, int i2) {
        l9 l9Var2;
        c9 c9Var2;
        l9 l9Var3;
        int i3;
        mx mxVar;
        sr4 sr4Var;
        r28 r28Var2;
        int i4;
        mx mxVar2;
        final c9 c9Var3;
        int i5;
        float f2;
        sr4 sr4Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(36139911);
        int i6 = i2 | (p65Var.f(l9Var) ? 4 : 2) | (p65Var.f(c9Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i6 & 1, (i6 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.g(p65Var);
            }
            sr4 sr4Var3 = (sr4) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = ka1.g(p65Var);
            }
            sr4 sr4Var4 = (sr4) objM2;
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(rh4Var), "content"), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i7);
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
            int i8 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarR3 = wgf.R(rh4Var, wgf.K(p65Var), false, 14);
            yq0 yq0Var = z46.q;
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j4 = p65Var.T;
            int i9 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarR3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            qv5.b(vn7.J(R.drawable.ic_logo_medium_wordmark, 0, p65Var), vo7.R(p65Var, R.string.common_cd_medium_logo), bgf.N(w2g.G(o28Var, 0.0f, 32.0f, 0.0f, 0.0f, 13).b(new dr5(yq0Var)), "logo"), ((zo7) p65Var.j(kt7.b)).n, p65Var, 8, 0);
            jjd.b(y30.n(32.0f, R.string.add_info_title, p65Var, p65Var, o28Var), bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).F, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                l9Var3 = l9Var;
                String str = l9Var3.a;
                int length = str.length();
                objM3 = qo7.u(new uid(str, 4, lk7.q(length, length)));
                p65Var.j0(objM3);
            } else {
                l9Var3 = l9Var;
            }
            final l78 l78Var = (l78) objM3;
            uid uidVar = (uid) l78Var.getValue();
            String strR = vo7.R(p65Var, R.string.add_info_full_name_label);
            String strR2 = vo7.R(p65Var, R.string.add_info_full_name_placeholder);
            Integer num = l9Var3.b;
            gt7 gt7Var = num != null ? gt7.ERROR : gt7.DEFAULT;
            if (num == null) {
                p65Var.Y(941447948);
                i3 = 0;
                p65Var.p(false);
                mxVar = null;
            } else {
                p65Var.Y(941447949);
                int iIntValue = num.intValue();
                p65Var.Y(446012352);
                StringBuilder sb = new StringBuilder(16);
                ArrayList arrayListV = wgd.v();
                new ArrayList();
                sb.append(vo7.R(p65Var, iIntValue));
                String string = sb.toString();
                ArrayList arrayList = new ArrayList(arrayListV.size());
                int i10 = 0;
                for (int size = arrayListV.size(); i10 < size; size = size) {
                    i10 = lv8.i(sb, (jx) arrayListV.get(i10), arrayList, i10, 1);
                }
                mx mxVar3 = new mx(string, arrayList);
                i3 = 0;
                p65Var.p(false);
                p65Var.p(false);
                mxVar = mxVar3;
            }
            sk6 sk6Var = sk6.f;
            sk6 sk6VarA = sk6.a(2, i3, 6, 118);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new w8(sr4Var4, i3);
                p65Var.j0(objM4);
            }
            x45 x45Var = null;
            pk6 pk6Var = new pk6(x45Var, (x45) objM4, x45Var, 59);
            r28 r28VarN = bgf.N(t40.F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), sr4Var3), "full_name");
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = new b5(5);
                p65Var.j0(objM5);
            }
            r28 r28VarA = wxb.a(r28VarN, false, (x45) objM5);
            int i11 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = i11 == 32;
            Object objM6 = p65Var.M();
            if (z || objM6 == uobVar) {
                sr4Var = sr4Var3;
                r28Var2 = r28VarA;
                final int i12 = 1;
                objM6 = new x45() { // from class: p8
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        int i13 = i12;
                        c1e c1eVar = c1e.a;
                        l78 l78Var2 = l78Var;
                        c9 c9Var4 = c9Var;
                        uid uidVar2 = (uid) obj;
                        uidVar2.getClass();
                        switch (i13) {
                            case 0:
                                l78Var2.setValue(uidVar2);
                                String str2 = uidVar2.a.b;
                                c9Var4.getClass();
                                str2.getClass();
                                r9 r9Var = c9Var4.b;
                                r9Var.e.d("email", str2);
                                vx0.c0(f76.F(r9Var), null, null, new n9(r9Var, null, 0), 3);
                                break;
                            default:
                                l78Var2.setValue(uidVar2);
                                String str3 = uidVar2.a.b;
                                c9Var4.getClass();
                                str3.getClass();
                                r9 r9Var2 = c9Var4.b;
                                r9Var2.e.d("full_name", str3);
                                vx0.c0(f76.F(r9Var2), null, null, new n9(r9Var2, null, 1), 3);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM6);
            } else {
                sr4Var = sr4Var3;
                r28Var2 = r28VarA;
            }
            d46.m(uidVar, (x45) objM6, r28Var2, false, false, gt7Var, 1, sk6VarA, pk6Var, strR, mxVar, strR2, null, null, null, null, 0, p65Var, 12582912, 0, 254008);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                String str2 = l9Var.c;
                int length2 = str2.length();
                objM7 = qo7.u(new uid(str2, 4, lk7.q(length2, length2)));
                p65Var.j0(objM7);
            }
            final l78 l78Var2 = (l78) objM7;
            uid uidVar2 = (uid) l78Var2.getValue();
            String strR3 = vo7.R(p65Var, R.string.add_info_email_label);
            String strR4 = vo7.R(p65Var, R.string.add_info_email_placeholder);
            Integer num2 = l9Var.d;
            gt7 gt7Var2 = num2 != null ? gt7.ERROR : gt7.DEFAULT;
            if (num2 == null) {
                p65Var.Y(943164108);
                i4 = 0;
                p65Var.p(false);
                mxVar2 = null;
            } else {
                p65Var.Y(943164109);
                int iIntValue2 = num2.intValue();
                p65Var.Y(446067712);
                StringBuilder sb2 = new StringBuilder(16);
                ArrayList arrayListV2 = wgd.v();
                new ArrayList();
                sb2.append(vo7.R(p65Var, iIntValue2));
                String string2 = sb2.toString();
                ArrayList arrayList2 = new ArrayList(arrayListV2.size());
                int size2 = arrayListV2.size();
                for (int i13 = 0; i13 < size2; i13 = lv8.i(sb2, (jx) arrayListV2.get(i13), arrayList2, i13, 1)) {
                }
                mx mxVar4 = new mx(string2, arrayList2);
                i4 = 0;
                p65Var.p(false);
                p65Var.p(false);
                mxVar2 = mxVar4;
            }
            sk6 sk6VarA2 = sk6.a(i4, 6, 7, 113);
            boolean z2 = i11 == 32;
            Object objM8 = p65Var.M();
            if (z2 || objM8 == uobVar) {
                c9Var3 = c9Var;
                i5 = 2;
                objM8 = new s0(i5, c9Var3);
                p65Var.j0(objM8);
            } else {
                c9Var3 = c9Var;
                i5 = 2;
            }
            x45 x45Var2 = null;
            pk6 pk6Var2 = new pk6((x45) objM8, x45Var2, x45Var2, 62);
            r28 r28VarN2 = bgf.N(t40.F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, i5), sr4Var4), "email");
            Object objM9 = p65Var.M();
            if (objM9 == uobVar) {
                objM9 = new b5(3);
                p65Var.j0(objM9);
            }
            final int i14 = 0;
            r28 r28VarA2 = wxb.a(r28VarN2, false, (x45) objM9);
            boolean z3 = i11 == 32;
            Object objM10 = p65Var.M();
            if (z3 || objM10 == uobVar) {
                objM10 = new x45() { // from class: p8
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        int i132 = i14;
                        c1e c1eVar = c1e.a;
                        l78 l78Var22 = l78Var2;
                        c9 c9Var4 = c9Var3;
                        uid uidVar22 = (uid) obj;
                        uidVar22.getClass();
                        switch (i132) {
                            case 0:
                                l78Var22.setValue(uidVar22);
                                String str22 = uidVar22.a.b;
                                c9Var4.getClass();
                                str22.getClass();
                                r9 r9Var = c9Var4.b;
                                r9Var.e.d("email", str22);
                                vx0.c0(f76.F(r9Var), null, null, new n9(r9Var, null, 0), 3);
                                break;
                            default:
                                l78Var22.setValue(uidVar22);
                                String str3 = uidVar22.a.b;
                                c9Var4.getClass();
                                str3.getClass();
                                r9 r9Var2 = c9Var4.b;
                                r9Var2.e.d("full_name", str3);
                                vx0.c0(f76.F(r9Var2), null, null, new n9(r9Var2, null, 1), 3);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM10);
            }
            d46.m(uidVar2, (x45) objM10, r28VarA2, false, false, gt7Var2, 1, sk6VarA2, pk6Var2, strR3, mxVar2, strR4, null, null, null, null, 0, p65Var, 12582912, 0, 254008);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            boolean z4 = i11 == 32;
            Object objM11 = p65Var.M();
            if (z4 || objM11 == uobVar) {
                l9Var2 = l9Var;
                f2 = 32.0f;
                sr4Var2 = sr4Var;
                x8 x8Var = new x8(0, c9Var, c9.class, "onSubmitClicked", "onSubmitClicked()V", 0, 0);
                p65Var.j0(x8Var);
                objM11 = x8Var;
            } else {
                l9Var2 = l9Var;
                f2 = 32.0f;
                sr4Var2 = sr4Var;
            }
            c9Var2 = c9Var;
            p65Var = p65Var;
            fo7.r((m45) ((qh6) objM11), vo7.R(p65Var, R.string.add_info_submit), xn7.M, bgf.N(w2g.E(jfc.d(jfc.q(o28Var, 0.0f, 348.0f, 1), 1.0f), 24.0f, 0.0f, 2), "submit"), l9Var2.e, p65Var, 3456, 0);
            hp7.t(p65Var, jfc.l(o28Var, f2));
            t(c9Var2, p65Var, (i6 >> 3) & 14);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            Object objM12 = p65Var.M();
            if (objM12 == uobVar) {
                objM12 = new y8(sr4Var2, null, 0);
                p65Var.j0(objM12);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM12, c1eVar);
            boolean z5 = i11 == 32;
            Object objM13 = p65Var.M();
            if (z5 || objM13 == uobVar) {
                objM13 = new z8(c9Var2, null, 0);
                p65Var.j0(objM13);
            }
            kyd.k(p65Var, (b55) objM13, c1eVar);
        } else {
            l9Var2 = l9Var;
            c9Var2 = c9Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 3, l9Var2, c9Var2, r28Var);
        }
    }

    public static final void b(l9 l9Var, nhc nhcVar, c9 c9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        l9Var.getClass();
        nhcVar.getClass();
        c9Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1534555783);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(l9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(c9Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new b5(i4);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, false, (x45) objM), "add_info_screen");
            mz1 mz1VarE = pxf.E(1531574155, new q8(c9Var), p65Var2);
            mz1 mz1VarE2 = pxf.E(123848205, new u8(nhcVar, i5), p65Var2);
            y0e y0eVarV = hk7.v(p65Var2);
            WeakHashMap weakHashMap = f5f.w;
            p65Var = p65Var2;
            pr7.b(r28VarN, mz1VarE, null, mz1VarE2, null, 0, 0L, 0L, new y0e(y0eVarV, tr7.o(p65Var2).c), pxf.E(-728835050, new ec(l9Var, 13, c9Var), p65Var2), p65Var, 805309488, 244);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 0, l9Var, nhcVar, c9Var, r28Var);
        }
    }

    public static final void c(String str, CreateAccountData createAccountData, SusiDestination susiDestination, s26 s26Var, r28 r28Var, r9 r9Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        r9 r9Var2;
        int i3;
        r9 r9Var3;
        r28 r28Var3;
        r9 r9Var4;
        str.getClass();
        createAccountData.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1097410491);
        int i4 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(createAccountData) ? 32 : 16) | (p65Var2.f(susiDestination) ? 256 : 128) | (p65Var2.f(s26Var) ? 2048 : 1024) | 90112;
        int i5 = 0;
        if (p65Var2.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var2.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var2.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256);
                Object objM = p65Var2.M();
                if (z || objM == uobVar) {
                    objM = new o8(str, createAccountData, susiDestination, i5);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                r9 r9Var5 = (r9) to7.z(n1b.a.b(r9.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                i3 = i4 & (-458753);
                r9Var3 = r9Var5;
                r28Var3 = o28.b;
            } else {
                p65Var2.S();
                r28Var3 = r28Var;
                i3 = i4 & (-458753);
                r9Var3 = r9Var;
            }
            p65Var2.q();
            l78 l78VarZ = guc.z(r9Var3.m, p65Var2, 0);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var2);
            }
            nhc nhcVar = (nhc) objM2;
            akc akcVar = (akc) p65Var2.j(z22.r);
            int i7 = i3 & 7168;
            boolean zF = (i7 == 2048) | p65Var2.f(r9Var3);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                objM3 = new c9(s26Var, r9Var3);
                p65Var2.j0(objM3);
            }
            b((l9) l78VarZ.getValue(), nhcVar, (c9) objM3, r28Var3, p65Var2, 3120);
            r28 r28Var4 = r28Var3;
            Resources resources = (Resources) p65Var2.j(eo.c);
            boolean zH = p65Var2.h(r9Var3) | p65Var2.f(akcVar) | (i7 == 2048) | p65Var2.h(resources);
            Object objM4 = p65Var2.M();
            if (zH || objM4 == uobVar) {
                r9Var4 = r9Var3;
                p65Var = p65Var2;
                b9 b9Var = new b9(r9Var4, akcVar, s26Var, nhcVar, resources, (n92) null, 0);
                p65Var.j0(b9Var);
                objM4 = b9Var;
            } else {
                r9Var4 = r9Var3;
                p65Var = p65Var2;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            r9Var2 = r9Var4;
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            r9Var2 = r9Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, createAccountData, susiDestination, s26Var, r28Var2, r9Var2, i2, 0);
        }
    }

    public static final void d(c9 c9Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1617481208);
        int i3 = (p65Var2.f(c9Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new x8(0, c9Var, c9.class, "onBackPressed", "onBackPressed()V", 0, 1);
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
            mwaVarS.d = new q8(c9Var, i2);
        }
    }

    public static final void e(final List list, final lv0 lv0Var, final b55 b55Var, final String str, final zw7 zw7Var, final boolean z, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        ot2 ot2Var;
        list.getClass();
        lv0Var.getClass();
        b55Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1518214898);
        int i3 = i2 | (p65Var2.h(list) ? 4 : 2) | (p65Var2.d(lv0Var.ordinal()) ? 32 : 16) | (p65Var2.h(b55Var) ? 256 : 128) | (p65Var2.f(str != null ? new ax5(str) : null) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.d(zw7Var == null ? -1 : zw7Var.ordinal()) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 1572864;
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarX = rv8.X(flb.a0(r28VarD, ((zo7) p65Var2.j(sn3Var)).a, rv8.r), rv8.w);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new nx(17);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(wxb.a(r28VarX, false, (x45) objM), "main_navigation_bar");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            p65Var = p65Var2;
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                ot2Var = ot2Var2;
                p65Var.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            fc8.a(jfc.e(o28Var, 56.0f), ((zo7) p65Var.j(sn3Var)).a, ((zo7) p65Var.j(sn3Var)).n, new hl4(0), pxf.E(-661073016, new c55() { // from class: mv0
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    long j5;
                    long j6;
                    pmb pmbVar = (pmb) obj;
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    pmbVar.getClass();
                    if ((iIntValue & 6) == 0) {
                        iIntValue |= ((p65) x12Var2).f(pmbVar) ? 4 : 2;
                    }
                    int i7 = iIntValue;
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.P(i7 & 1, (i7 & 19) != 18)) {
                        for (lv0 lv0Var2 : list) {
                            boolean z2 = lv0Var2 == lv0Var;
                            r28 r28VarN2 = bgf.N(jfc.e(o28.b, 56.0f), "main_navigation_bar_" + lv0Var2.name());
                            long j7 = ((zo7) p65Var3.j(kt7.b)).n;
                            long j8 = uu1.g;
                            long j9 = uu1.h;
                            fv1 fv1Var = (fv1) p65Var3.j(iv1.a);
                            xb8 xb8Var = fv1Var.g0;
                            if (xb8Var == null) {
                                long jC = iv1.c(fv1Var, hc8.a);
                                long jC2 = iv1.c(fv1Var, hc8.d);
                                long jC3 = iv1.c(fv1Var, hc8.b);
                                gv1 gv1Var = hc8.e;
                                long jC4 = iv1.c(fv1Var, gv1Var);
                                gv1 gv1Var2 = hc8.f;
                                xb8Var = new xb8(jC, jC2, jC3, jC4, iv1.c(fv1Var, gv1Var2), uu1.b(0.38f, iv1.c(fv1Var, gv1Var)), uu1.b(0.38f, iv1.c(fv1Var, gv1Var2)));
                                fv1Var.g0 = xb8Var;
                            }
                            if (j7 == 16) {
                                j7 = xb8Var.a;
                            }
                            long j10 = j7;
                            if (j9 != 16) {
                                j5 = 16;
                                j6 = j9;
                            } else {
                                j5 = 16;
                                j6 = xb8Var.b;
                            }
                            if (j8 == j5) {
                                j8 = xb8Var.c;
                            }
                            xb8 xb8Var2 = new xb8(j10, j6, j8, j9 != 16 ? j9 : xb8Var.d, j9 != 16 ? j9 : xb8Var.e, j9 != 16 ? j9 : xb8Var.f, j9 != 16 ? j9 : xb8Var.g);
                            b55 b55Var2 = b55Var;
                            boolean zF = p65Var3.f(b55Var2) | p65Var3.d(lv0Var2.ordinal()) | p65Var3.g(z2);
                            Object objM2 = p65Var3.M();
                            if (zF || objM2 == w12.a) {
                                objM2 = new nv0(b55Var2, lv0Var2, z2);
                                p65Var3.j0(objM2);
                            }
                            fc8.b(pmbVar, z2, (m45) objM2, pxf.E(-245187137, new ov0(0, lv0Var2, str, zw7Var, z2), p65Var3), r28VarN2, false, pxf.E(-1679076734, new pv0(lv0Var2, z, 0), p65Var3), false, xb8Var2, p65Var3, (i7 & 14) | 1575936);
                        }
                    } else {
                        p65Var3.S();
                    }
                    return c1e.a;
                }
            }, p65Var), p65Var, 196614);
            b09.H(p65Var, true, true, true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new me0(list, lv0Var, b55Var, str, zw7Var, z, r28Var2, i2);
        }
    }

    public static final void f(int i2, int i3, r28 r28Var, m45 m45Var, x12 x12Var, int i4) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-405380463);
        int i5 = (p65Var.d(i2) ? 4 : 2) | i4 | (p65Var.d(i3) ? 32 : 16) | 384 | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i6 = 1;
        if (p65Var.P(i5 & 1, (i5 & 1171) != 1170)) {
            String strR = vo7.R(p65Var, i2);
            kod.b(hod.a(0, 2, p65Var), pxf.E(1701660550, new ba1(strR, i6), p65Var), kod.d(0, 7, p65Var), null, false, pxf.E(-1342943122, new s(m45Var, i3, strR, 9), p65Var), p65Var, 100859952, 216);
            r28Var = o28.b;
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pp3(i2, i3, r28Var2, m45Var, i4);
        }
    }

    public static final void g(ab4 ab4Var, ua4 ua4Var, r28 r28Var, x12 x12Var, int i2) {
        ab4 ab4Var2;
        Object obj;
        float f2;
        int i3;
        uob uobVar;
        float f3;
        int i4;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1577228932);
        int i5 = i2 | (p65Var.f(ab4Var) ? 4 : 2) | (p65Var.f(ua4Var) ? 32 : 16) | 384;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            String strR = vo7.R(p65Var, R.string.feature_post_can_feature_title);
            r28 r28VarG = w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10);
            jgd jgdVar = new jgd(3);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, r28VarG, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).i, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            pq9 pq9Var = ab4Var.a;
            int i7 = ab4Var.d;
            z(pq9Var, ab4Var.b, ab4Var.c, ab4Var.g, w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), p65Var, 24576);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            r28 r28VarG2 = w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i8 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            p65Var.Y(-1203252886);
            kx kxVar = new kx();
            int iH = kxVar.h(new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531));
            try {
                kxVar.d(String.valueOf(i7));
                kxVar.f(iH);
                kxVar.d(" ");
                kxVar.d(vo7.D(R.plurals.featured_stories_available, i7, new Object[]{Integer.valueOf(i7)}, p65Var));
                mx mxVarI = kxVar.i();
                p65Var.p(false);
                jjd.c(mxVarI, new sq6(1.0f, true), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 262140);
                String strN = y30.n(8.0f, R.string.feature_post_cta_view_featured_stories, p65Var, p65Var, o28Var);
                vkb vkbVar = new vkb(0);
                int i9 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i10 = i5 & 14;
                boolean z2 = (i9 == 32) | (i10 == 4);
                Object objM = p65Var.M();
                uob uobVar2 = w12.a;
                if (z2 || objM == uobVar2) {
                    objM = new gd3(ua4Var, 6, ab4Var);
                    p65Var.j0(objM);
                }
                r28 r28VarR3 = hlg.r(o28Var, false, null, vkbVar, (m45) objM, 11);
                mkd mkdVar = ((bu7) p65Var.j(sn3Var)).m;
                ohd ohdVar = ohd.c;
                jjd.b(strN, r28VarR3, 0L, 0L, 0L, ohdVar, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 805306368, 0, 130556);
                ka1.B(p65Var, true, o28Var, 24.0f, p65Var);
                kx kxVarW = ho2.w(p65Var, 538694837);
                kxVarW.d(vo7.R(p65Var, R.string.feature_post_can_feature_description));
                kxVarW.d(" ");
                p65Var.Y(538699229);
                wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
                boolean z3 = (i10 == 4) | (i9 == 32);
                Object objM2 = p65Var.M();
                if (z3 || objM2 == uobVar2) {
                    ab4Var2 = ab4Var;
                    objM2 = new bf0(ua4Var, 2, ab4Var2);
                    p65Var.j0(objM2);
                } else {
                    ab4Var2 = ab4Var;
                }
                int iV = ho2.v("annotation_learn_more", wjdVar, (e07) objM2, kxVarW);
                try {
                    kxVarW.d(vo7.R(p65Var, R.string.common_learn_more));
                    kxVarW.f(iV);
                    p65Var.p(false);
                    mx mxVarI2 = kxVarW.i();
                    p65Var.p(false);
                    jjd.c(mxVarI2, jfc.d(w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), 1.0f), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 48, 0, 262140);
                    hp7.t(p65Var, jfc.l(o28Var, 21.0f));
                    boolean z4 = i9 == 32;
                    Object objM3 = p65Var.M();
                    if (z4 || objM3 == uobVar2) {
                        f2 = 1.0f;
                        i3 = i9;
                        uobVar = uobVar2;
                        f3 = 24.0f;
                        i4 = 32;
                        z = false;
                        hq3 hq3Var = new hq3(0, ua4Var, ua4.class, "featurePost", "featurePost()V", 0, 19);
                        p65Var.j0(hq3Var);
                        objM3 = hq3Var;
                    } else {
                        f3 = 24.0f;
                        f2 = 1.0f;
                        uobVar = uobVar2;
                        i3 = i9;
                        i4 = 32;
                        z = false;
                    }
                    m45 m45Var = (m45) ((qh6) objM3);
                    String strR2 = vo7.R(p65Var, R.string.feature_post_cta_feature_story);
                    xn7 xn7Var = xn7.L;
                    uob uobVar3 = uobVar;
                    float f4 = f2;
                    fo7.i(m45Var, strR2, xn7Var, bgf.N(jfc.d(w2g.G(o28Var, f3, 0.0f, f3, 0.0f, 10), f4), "feature_story"), ab4Var2.f, p65Var, 3456, 0);
                    hp7.t(p65Var, jfc.l(o28Var, 6.0f));
                    boolean z5 = i3 == i4 ? true : z;
                    Object objM4 = p65Var.M();
                    if (z5 || objM4 == uobVar3) {
                        hq3 hq3Var2 = new hq3(0, ua4Var, ua4.class, "onClose", "onClose()V", 0, 20);
                        p65Var.j0(hq3Var2);
                        objM4 = hq3Var2;
                    }
                    fo7.j((m45) ((qh6) objM4), vo7.R(p65Var, R.string.common_cancel), xn7Var, bgf.N(jfc.d(w2g.G(o28Var, f3, 0.0f, f3, 0.0f, 10), f4), "cancel"), ab4Var2.f, null, p65Var, 3456, 32);
                    p65Var = p65Var;
                    lv8.y(o28Var, 21.0f, p65Var, true);
                    obj = o28Var;
                } catch (Throwable th) {
                    kxVarW.f(iV);
                    throw th;
                }
            } catch (Throwable th2) {
                kxVar.f(iH);
                throw th2;
            }
        } else {
            ab4Var2 = ab4Var;
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 6, ab4Var2, ua4Var, obj);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:70:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(defpackage.m45 r17, defpackage.pb3 r18, defpackage.mz1 r19, defpackage.x12 r20, int r21, int r22) {
        /*
            Method dump skipped, instruction units count: 352
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m40.h(m45, pb3, mz1, x12, int, int):void");
    }

    public static final void i(r28 r28Var, b55 b55Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1090521195);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2 | (p65Var.h(b55Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = id.c;
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int i4 = ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 >> 3) & 14) | 384;
            long j2 = p65Var.T;
            int i5 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            int i6 = ((i4 << 6) & 896) | 6;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            b55Var.invoke(p65Var, Integer.valueOf((i6 >> 6) & 14));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lo(r28Var, b55Var, i2);
        }
    }

    public static final void j(rp3 rp3Var, gq3 gq3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        int i4;
        Object gu1Var;
        uob uobVar;
        boolean z;
        Object gu1Var2;
        uob uobVar2;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        boolean z8;
        Object gu1Var3;
        boolean z9;
        boolean z10;
        boolean z11;
        boolean z12;
        gq3Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1334074972);
        int i5 = i2 | (p65Var.f(rp3Var) ? 4 : 2) | (p65Var.f(gq3Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            ParagraphType paragraphType = rp3Var != null ? rp3Var.a : null;
            ParagraphType paragraphType2 = ParagraphType.PRE;
            boolean z13 = paragraphType == paragraphType2;
            boolean z14 = paragraphType == ParagraphType.MIXTAPE_EMBED;
            boolean zP0 = bu1.p0(d46.R(ParagraphType.H3, paragraphType2), paragraphType);
            yrb yrbVarK = wgf.K(p65Var);
            r28 r28VarA0 = flb.a0(jfc.e(jfc.d(r28Var, 1.0f), 48.0f), ((zo7) p65Var.j(kt7.b)).a, rv8.r);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            p65Var = p65Var;
            r28 r28VarZ = er7.z(wgf.v(w2g.E(jfc.d(o28.b, 1.0f), 16.0f, 0.0f, 2), yrbVarK), yrbVarK, 16.0f, true);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarZ);
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
            uob uobVar3 = w12.a;
            if (paragraphType == null || (l28.c(paragraphType) && !z13)) {
                p65Var.Y(-1472774190);
                int i8 = paragraphType == null ? -1 : qp3.a[paragraphType.ordinal()];
                int i9 = i8 != 1 ? i8 != 2 ? R.drawable.ic_editor_title_default : R.drawable.ic_editor_title_smallcaps : R.drawable.ic_editor_title_caps;
                int i10 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean z15 = i10 == 32;
                Object objM = p65Var.M();
                if (z15 || objM == uobVar3) {
                    i3 = 32;
                    i4 = i10;
                    gu1 gu1Var4 = new gu1(0, gq3Var, gq3.class, "onTitleClicked", "onTitleClicked()V", 0, 21);
                    p65Var.j0(gu1Var4);
                    objM = gu1Var4;
                } else {
                    i4 = i10;
                    i3 = 32;
                }
                f(R.string.write_toolbar_title_desc, i9, null, (m45) ((qh6) objM), p65Var, 0);
                int i11 = paragraphType == null ? -1 : qp3.a[paragraphType.ordinal()];
                int i12 = i11 != 3 ? i11 != 4 ? R.drawable.ic_editor_quote_default : R.drawable.ic_editor_quote_right : R.drawable.ic_editor_quote_left;
                boolean z16 = i4 == i3;
                Object objM2 = p65Var.M();
                if (z16 || objM2 == uobVar3) {
                    uobVar = uobVar3;
                    z = true;
                    gu1Var = new gu1(0, gq3Var, gq3.class, "onQuoteClicked", "onQuoteClicked()V", 0, 22);
                    p65Var.j0(gu1Var);
                } else {
                    gu1Var = objM2;
                    uobVar = uobVar3;
                    z = true;
                }
                uob uobVar4 = uobVar;
                boolean z17 = z;
                f(R.string.write_toolbar_quote_desc, i12, null, (m45) ((qh6) gu1Var), p65Var, 0);
                int i13 = paragraphType != null ? qp3.a[paragraphType.ordinal()] : -1;
                int i14 = i13 != 5 ? i13 != 6 ? R.drawable.ic_editor_list_default : R.drawable.ic_editor_list_numbers : R.drawable.ic_editor_list_bullets;
                boolean z18 = i4 == i3 ? z17 : false;
                Object objM3 = p65Var.M();
                if (z18 || objM3 == uobVar4) {
                    uobVar2 = uobVar4;
                    z2 = z17;
                    gu1Var2 = new gu1(0, gq3Var, gq3.class, "onListClicked", "onListClicked()V", 0, 23);
                    p65Var.j0(gu1Var2);
                } else {
                    gu1Var2 = objM3;
                    uobVar2 = uobVar4;
                    z2 = z17;
                }
                z3 = z2;
                z4 = false;
                f(R.string.write_toolbar_list_desc, i14, null, (m45) ((qh6) gu1Var2), p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var.Y(-1474996704);
                p65Var.p(false);
                uobVar2 = uobVar3;
                z4 = false;
                i3 = 32;
                z3 = true;
            }
            if (zP0 || z14) {
                p65Var.Y(-1474996704);
            } else {
                p65Var.Y(-1471966144);
                boolean z19 = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == i3 ? z3 : z4;
                Object objM4 = p65Var.M();
                if (z19 || objM4 == uobVar2) {
                    z11 = z4;
                    z12 = z3;
                    gu1 gu1Var5 = new gu1(0, gq3Var, gq3.class, "onLinkClicked", "onLinkClicked()V", 0, 24);
                    p65Var.j0(gu1Var5);
                    objM4 = gu1Var5;
                } else {
                    z11 = z4;
                    z12 = z3;
                }
                z3 = z12;
                z4 = z11;
                f(R.string.write_toolbar_link_desc, R.drawable.ic_editor_link, null, (m45) ((qh6) objM4), p65Var, 0);
            }
            p65Var.p(z4);
            int i15 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z20 = i15 == i3 ? z3 : z4;
            Object objM5 = p65Var.M();
            if (z20 || objM5 == uobVar2) {
                z5 = z4;
                z6 = z3;
                gu1 gu1Var6 = new gu1(0, gq3Var, gq3.class, "onSectionClicked", "onSectionClicked()V", 0, 25);
                p65Var.j0(gu1Var6);
                objM5 = gu1Var6;
            } else {
                z5 = z4;
                z6 = z3;
            }
            boolean z21 = z6;
            f(R.string.write_toolbar_section_desc, R.drawable.ic_editor_section, null, (m45) ((qh6) objM5), p65Var, 0);
            if (zP0 || z14) {
                z7 = z5;
                p65Var.Y(-1474996704);
            } else {
                p65Var.Y(-1471434153);
                boolean z22 = i15 == i3 ? z21 : z5;
                Object objM6 = p65Var.M();
                if (z22 || objM6 == uobVar2) {
                    z10 = z21;
                    gu1 gu1Var7 = new gu1(0, gq3Var, gq3.class, "onMentionClicked", "onMentionClicked()V", 0, 26);
                    p65Var.j0(gu1Var7);
                    objM6 = gu1Var7;
                } else {
                    z10 = z21;
                }
                z21 = z10;
                z7 = z5;
                f(R.string.write_toolbar_mention_desc, R.drawable.ic_editor_mention, null, (m45) ((qh6) objM6), p65Var, 0);
            }
            p65Var.p(z7);
            if (l28.b(paragraphType)) {
                z8 = z21;
                p65Var.Y(-1474996704);
            } else {
                p65Var.Y(-1471115008);
                boolean z23 = i15 == i3 ? z21 : z7;
                Object objM7 = p65Var.M();
                if (z23 || objM7 == uobVar2) {
                    z9 = z7;
                    z8 = z21;
                    gu1Var3 = new gu1(0, gq3Var, gq3.class, "onCodeClicked", "onCodeClicked()V", 0, 27);
                    p65Var.j0(gu1Var3);
                } else {
                    gu1Var3 = objM7;
                    z9 = z7;
                    z8 = z21;
                }
                z7 = z9;
                f(R.string.write_toolbar_code_desc, R.drawable.ic_editor_code, null, (m45) ((qh6) gu1Var3), p65Var, 0);
            }
            p65Var.p(z7);
            hp7.t(p65Var, new sq6(1.0f, z8));
            boolean z24 = i15 == i3 ? z8 : z7;
            Object objM8 = p65Var.M();
            if (z24 || objM8 == uobVar2) {
                gu1 gu1Var8 = new gu1(0, gq3Var, gq3.class, "onImageClicked", "onImageClicked()V", 0, 28);
                p65Var.j0(gu1Var8);
                objM8 = gu1Var8;
            }
            f(R.string.write_toolbar_image_desc, R.drawable.ic_editor_image, null, (m45) ((qh6) objM8), p65Var, 0);
            p65Var.p(z8);
            p65Var.p(z8);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 29, rp3Var, gq3Var, r28Var);
        }
    }

    public static final void k(bb4 bb4Var, ua4 ua4Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-541621250);
        int i3 = i2 | (p65Var.f(bb4Var) ? 4 : 2) | (p65Var.f(ua4Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            b24 b24Var = bb4Var.a;
            String strR = vo7.R(p65Var, R.string.common_cancel);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                hq3 hq3Var = new hq3(0, ua4Var, ua4.class, "onClose", "onClose()V", 0, 21);
                p65Var.j0(hq3Var);
                objM = hq3Var;
            }
            iq7.a(b24Var, null, null, null, null, strR, null, (m45) ((qh6) objM), p65Var, 0, 94);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 7, bb4Var, ua4Var, r28Var2);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1453056767);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarV = V(jfc.d(o28Var, 1.0f), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
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
            long j3 = ((zo7) p65Var.j(kt7.b)).o;
            p65Var.Y(1098188584);
            sn3 sn3Var = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var);
            sn3 sn3Var2 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var2)).i.b.c);
            p65Var.p(false);
            r28 r28VarE = jfc.e(jfc.d(w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), 0.5f), fZ);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarE, j3, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            dy0.a(flb.a0(r40.y(jfc.e(jfc.d(w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), 1.0f), 92.0f), bmb.a(4.0f)), j3, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            p65Var.Y(1098212648);
            float fZ2 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).i.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), 1.0f), fZ2 * 3.0f), j3, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            r28 r28VarE2 = jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), 42.0f);
            amb ambVar = bmb.a;
            dy0.a(flb.a0(r40.y(r28VarE2, ambVar), j3, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            dy0.a(flb.a0(r40.y(jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), 42.0f), ambVar), j3, nr5Var), p65Var, 0);
            lv8.y(o28Var, 24.0f, p65Var, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var2, i2, 20);
        }
    }

    public static final void m(fb4 fb4Var, nhc nhcVar, ua4 ua4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        ua4 ua4Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2092235374);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(fb4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(ua4Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = i3;
        if (p65Var2.P(i5 & 1, (i5 & 1171) != 1170)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i6 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            boolean z = (i5 & 896) == 256;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new hq3(0, ua4Var, ua4.class, "onClose", "onClose()V", 0, 22);
                ua4Var2 = ua4Var;
                p65Var2.j0(objM);
            } else {
                ua4Var2 = ua4Var;
            }
            ek7.f((m45) ((qh6) objM), null, pxf.E(654692224, new g64(fb4Var, i4, ua4Var2), p65Var2), p65Var2, 384, 2);
            br7.k(nhcVar, iy0.a.a(o28.b, z46.k), 0.0f, null, p65Var2, (i5 >> 3) & 14, 12);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            ua4Var2 = ua4Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 19, fb4Var, nhcVar, ua4Var2, r28Var);
        }
    }

    public static final void n(String str, String str2, String str3, zm7 zm7Var, r28 r28Var, ib4 ib4Var, x12 x12Var, int i2) {
        r28 r28Var2;
        ib4 ib4Var2;
        int i3;
        r28 r28Var3;
        ib4 ib4Var3;
        b09.I(str, str2, str3);
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1994126320);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.f(zm7Var) ? 2048 : 1024) | 90112;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ta4(i5, str, str2, str3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                ib4 ib4Var4 = (ib4) to7.z(n1b.a.b(ib4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i3 = i4 & (-458753);
                r28Var3 = o28.b;
                ib4Var3 = ib4Var4;
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                r28Var3 = r28Var;
                ib4Var3 = ib4Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ib4Var3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            m((fb4) l78VarZ.getValue(), nhcVarF, new ua4(zm7Var, ib4Var3), r28Var3, p65Var, 3072);
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(ib4Var3) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i3 & 7168) == 2048);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                fl2 fl2Var = new fl2(ib4Var3, nhcVarF, resources, zm7Var, null, 10);
                p65Var.j0(fl2Var);
                objM2 = fl2Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            ib4Var2 = ib4Var3;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            ib4Var2 = ib4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, str3, zm7Var, r28Var2, ib4Var2, i2, 7);
        }
    }

    /* JADX WARN: Type inference failed for: r6v24 */
    /* JADX WARN: Type inference failed for: r6v25, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r6v28 */
    public static final void o(r28 r28Var, g70 g70Var, j70 j70Var, int i2, fq4 fq4Var, mz1 mz1Var, x12 x12Var, int i3) {
        int i4;
        int i5;
        int i6;
        ?? r6;
        Object obj;
        zq0 zq0Var = z46.m;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1956591841);
        if ((i3 & 6) == 0) {
            i4 = (p65Var.f(r28Var) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var.f(g70Var) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.f(j70Var) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i4 |= p65Var.f(zq0Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i3 & 24576) == 0) {
            i4 |= p65Var.d(i2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i3) == 0) {
            i4 |= p65Var.d(Integer.MAX_VALUE) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i3) == 0) {
            i4 |= p65Var.f(fq4Var) ? 1048576 : 524288;
        }
        if ((12582912 & i3) == 0) {
            i4 |= p65Var.h(mz1Var) ? 8388608 : 4194304;
        }
        int i7 = i4;
        if (p65Var.P(i7 & 1, (i7 & 4793491) != 4793490)) {
            int i8 = i7 & 3670016;
            boolean z = i8 == 1048576;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new aq4(fq4Var.a);
                p65Var.j0(objM);
            }
            aq4 aq4Var = (aq4) objM;
            int i9 = i7 >> 3;
            boolean zF = ((((57344 & i9) ^ 24576) > 16384 && p65Var.d(Integer.MAX_VALUE)) || (i9 & 24576) == 16384) | ((((i9 & 14) ^ 6) > 4 && p65Var.f(g70Var)) || (i9 & 6) == 4) | ((((i9 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var.f(j70Var)) || (i9 & 48) == 32) | ((((i9 & 896) ^ 384) > 256 && p65Var.f(zq0Var)) || (i9 & 384) == 256) | ((((i9 & 7168) ^ 3072) > 2048 && p65Var.d(i2)) || (i9 & 3072) == 2048) | p65Var.f(aq4Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                i5 = i8;
                i6 = 8388608;
                dq4 dq4Var = new dq4(g70Var, j70Var, g70Var.f(), new fj2(zq0Var), j70Var.f(), i2, aq4Var);
                p65Var.j0(dq4Var);
                objM2 = dq4Var;
            } else {
                i5 = i8;
                i6 = 8388608;
            }
            dq4 dq4Var2 = (dq4) objM2;
            boolean z2 = (i5 == 1048576) | ((i7 & 29360128) == i6) | ((i7 & 458752) == 131072);
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                ArrayList arrayList = new ArrayList();
                r6 = 1;
                arrayList.add(new mz1(new dd(mz1Var, 4), true, -1192950673));
                fq4Var.getClass();
                int i10 = yp4.a[fq4Var.a.ordinal()];
                p65Var.j0(arrayList);
                obj = arrayList;
            } else {
                r6 = 1;
                obj = objM3;
            }
            mz1 mz1Var2 = new mz1(new d50((List) obj, r6), r6, 1271844412);
            boolean zF2 = p65Var.f(dq4Var2);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == uobVar) {
                objM4 = new x48(dq4Var2);
                p65Var.j0(objM4);
            }
            zk7 zk7Var = (zk7) objM4;
            long j2 = p65Var.T;
            int i11 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i11));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(0, mz1Var2, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sf(r28Var, g70Var, j70Var, i2, fq4Var, mz1Var, i3);
        }
    }

    public static final void p(r28 r28Var, g70 g70Var, j70 j70Var, zq0 zq0Var, int i2, int i3, final mz1 mz1Var, x12 x12Var, final int i4, final int i5) {
        int i6;
        final r28 r28Var2;
        final g70 g70Var2;
        final j70 j70Var2;
        final zq0 zq0Var2;
        final int i7;
        p65 p65Var;
        final int i8;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1303174015);
        int i9 = i5 & 1;
        if (i9 != 0) {
            i6 = i4 | 6;
        } else if ((i4 & 6) == 0) {
            i6 = (p65Var2.f(r28Var) ? 4 : 2) | i4;
        } else {
            i6 = i4;
        }
        int i10 = i5 & 2;
        if (i10 != 0) {
            i6 |= 48;
        } else if ((i4 & 48) == 0) {
            i6 |= p65Var2.f(g70Var) ? 32 : 16;
        }
        int i11 = i5 & 4;
        if (i11 != 0) {
            i6 |= 384;
        } else if ((i4 & 384) == 0) {
            i6 |= p65Var2.f(j70Var) ? 256 : 128;
        }
        int i12 = i6 | 3072;
        int i13 = i5 & 16;
        if (i13 != 0) {
            i12 = i6 | 27648;
        } else if ((i4 & 24576) == 0) {
            i12 |= p65Var2.d(i2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i14 = i12 | 196608;
        if (p65Var2.P(i14 & 1, (599187 & i14) != 599186)) {
            if (i9 != 0) {
                r28Var = o28.b;
            }
            r28 r28Var3 = r28Var;
            if (i10 != 0) {
                g70Var = qb8.a;
            }
            if (i11 != 0) {
                j70Var = qb8.c;
            }
            j70 j70Var3 = j70Var;
            zq0 zq0Var3 = z46.m;
            int i15 = i13 != 0 ? Integer.MAX_VALUE : i2;
            g70 g70Var3 = g70Var;
            o(r28Var3, g70Var3, j70Var3, i15, fq4.b, mz1Var, p65Var2, (i14 & 57344) | (i14 & 14) | 1572864 | (i14 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i14 & 896) | 3072 | 12779520);
            zq0Var2 = zq0Var3;
            i7 = i15;
            p65Var = p65Var2;
            i8 = Integer.MAX_VALUE;
            j70Var2 = j70Var3;
            g70Var2 = g70Var3;
            r28Var2 = r28Var3;
        } else {
            p65Var2.S();
            r28Var2 = r28Var;
            g70Var2 = g70Var;
            j70Var2 = j70Var;
            zq0Var2 = zq0Var;
            i7 = i2;
            p65Var = p65Var2;
            i8 = i3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: wp4
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    m40.p(r28Var2, g70Var2, j70Var2, zq0Var2, i7, i8, mz1Var, (x12) obj, tr7.y(i4 | 1), i5);
                    return c1e.a;
                }
            };
        }
    }

    public static final JsonEncodingException q(Number number, String str) {
        return new JsonEncodingException("Unexpected special floating-point value " + number + ". By default, non-finite floating point values are prohibited because they do not conform JSON specification. It is possible to deserialize them using 'JsonBuilder.allowSpecialFloatingPointValues = true'\nCurrent output: " + ((Object) R(str, -1)));
    }

    public static final JsonDecodingException r(int i2, CharSequence charSequence, String str) {
        charSequence.getClass();
        String str2 = str + "\nJSON input: " + ((Object) R(charSequence, i2));
        if (i2 >= 0) {
            str2 = "Unexpected JSON token at offset " + i2 + ": " + str2;
        }
        return new JsonDecodingException(str2);
    }

    public static final void s(final ag5 ag5Var, final r28 r28Var, ur6 ur6Var, hy8 hy8Var, final j70 j70Var, final g70 g70Var, dn4 dn4Var, boolean z, fx8 fx8Var, final x45 x45Var, x12 x12Var, final int i2) {
        final ur6 ur6Var2;
        final hy8 hy8Var2;
        final dn4 dn4Var2;
        final boolean z2;
        final fx8 fx8Var2;
        ur6 ur6Var3;
        dn4 dn4Var3;
        int i3;
        boolean z3;
        fx8 fx8VarA;
        hy8 hy8Var3;
        boolean z4;
        g70 g70Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2072102870);
        int i4 = i2 | (p65Var.f(ag5Var) ? 4 : 2) | 373320832;
        int i5 = p65Var.h(x45Var) ? 4 : 2;
        boolean z5 = true;
        if (p65Var.P(i4 & 1, ((306783379 & i4) == 306783378 && (i5 & 3) == 2) ? false : true)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                mr6 mr6Var = wr6.a;
                Object[] objArr = new Object[0];
                mya myaVar = ur6.w;
                boolean zD = p65Var.d(0) | p65Var.d(0);
                Object objM = p65Var.M();
                if (zD || objM == uobVar) {
                    objM = new e73(29);
                    p65Var.j0(objM);
                }
                ur6Var3 = (ur6) hp7.F(objArr, myaVar, (m45) objM, p65Var, 0);
                jy8 jy8Var = new jy8(0.0f, 0.0f, 0.0f, 0.0f);
                xv2 xv2VarA = plc.a(p65Var);
                boolean zF = p65Var.f(xv2VarA);
                Object objM2 = p65Var.M();
                if (zF || objM2 == uobVar) {
                    objM2 = new az2(xv2VarA);
                    p65Var.j0(objM2);
                }
                dn4Var3 = (az2) objM2;
                i3 = i4 & (-1908409217);
                z3 = false;
                fx8VarA = gx8.a(p65Var);
                hy8Var3 = jy8Var;
                z4 = true;
            } else {
                p65Var.S();
                i3 = i4 & (-1908409217);
                ur6Var3 = ur6Var;
                hy8Var3 = hy8Var;
                dn4Var3 = dn4Var;
                z4 = true;
                z3 = false;
                z5 = z;
                fx8VarA = fx8Var;
            }
            p65Var.q();
            int i7 = (i3 & 14) | 48;
            if ((((i7 & 14) ^ 6) <= 4 || !p65Var.f(ag5Var)) && (i7 & 6) != 4) {
                z4 = z3;
            }
            Object objM3 = p65Var.M();
            if (z4 || objM3 == uobVar) {
                g70Var2 = g70Var;
                objM3 = new sg5(new l23(ag5Var, g70Var2));
                p65Var.j0(objM3);
            } else {
                g70Var2 = g70Var;
            }
            g70 g70Var3 = g70Var2;
            dn4 dn4Var4 = dn4Var3;
            ur6Var2 = ur6Var3;
            r40.n(r28Var, ur6Var2, (sg5) objM3, hy8Var3, dn4Var4, z5, fx8VarA, j70Var, g70Var3, x45Var, p65Var, 818113542, 6 | ((i5 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
            hy8Var2 = hy8Var3;
            fx8Var2 = fx8VarA;
            z2 = z5;
            dn4Var2 = dn4Var4;
        } else {
            p65Var.S();
            ur6Var2 = ur6Var;
            hy8Var2 = hy8Var;
            dn4Var2 = dn4Var;
            z2 = z;
            fx8Var2 = fx8Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(r28Var, ur6Var2, hy8Var2, j70Var, g70Var, dn4Var2, z2, fx8Var2, x45Var, i2) { // from class: cr6
                public final /* synthetic */ r28 b;
                public final /* synthetic */ ur6 c;
                public final /* synthetic */ hy8 d;
                public final /* synthetic */ j70 e;
                public final /* synthetic */ g70 f;
                public final /* synthetic */ dn4 g;
                public final /* synthetic */ boolean h;
                public final /* synthetic */ fx8 i;
                public final /* synthetic */ x45 j;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1769521);
                    m40.s(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void t(c9 c9Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1400669328);
        int i3 = (i2 & 6) == 0 ? (p65Var2.f(c9Var) ? 4 : 2) | i2 : i2;
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var2.Y(-1718456819);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            String strR = vo7.R(p65Var2, R.string.common_terms_of_service);
            String strR2 = vo7.R(p65Var2, R.string.common_privacy_policy);
            String strQ = vo7.Q(R.string.susi_auth_sign_up_terms_privacy_message, new Object[]{strR, strR2}, p65Var2);
            int iZ = muc.Z(strQ, strR, 0, false, 6);
            int length = strR.length() + iZ;
            int iZ2 = muc.Z(strQ, strR2, 0, false, 6);
            int length2 = strR2.length() + iZ2;
            sb.append(strQ);
            ohd ohdVar = ohd.c;
            skc skcVar = null;
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), skcVar, 14);
            int i5 = i3 & 14;
            boolean z = i5 == 4;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new r8(i4, c9Var);
                p65Var2.j0(objM);
            }
            b07 b07Var = new b07("terms_of_service", wjdVar, (e07) objM);
            int i6 = 8;
            arrayListV.add(new jx(b07Var, iZ, length, i6));
            wjd wjdVar2 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), skcVar, 14);
            boolean z2 = i5 == 4;
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new r8(1, c9Var);
                p65Var2.j0(objM2);
            }
            arrayListV.add(new jx(new b07("privacy_policy", wjdVar2, (e07) objM2), iZ2, length2, i6));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            for (int i7 = 0; i7 < arrayListV.size(); i7 = lv8.i(sb, (jx) arrayListV.get(i7), arrayList, i7, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var2.p(false);
            p65Var = p65Var2;
            jjd.c(mxVar, bgf.N(jfc.d(w2g.G(o28.b, 24.0f, 0.0f, 24.0f, 24.0f, 2), 1.0f), "legal_text"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkd.a(((bu7) p65Var2.j(jt7.c)).n, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 3, 0L, null, null, 16744446), p65Var, 48, 0, 262140);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i2, 0, c9Var);
        }
    }

    public static final void u(final SourceParameter sourceParameter, final x1e x1eVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(722934421);
        int i3 = (i2 & 6) == 0 ? i2 | (p65Var2.f(sourceParameter) ? 4 : 2) : i2;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(x1eVar) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            p65Var2.Y(-1044716720);
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
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i6 = i4 & 14;
            boolean z = (i5 == 32) | (i6 == 4);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                final int i7 = 0;
                objM = new e07() { // from class: v1e
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i8 = i7;
                        SourceParameter sourceParameter2 = sourceParameter;
                        x1e x1eVar2 = x1eVar;
                        d07Var.getClass();
                        switch (i8) {
                            case 0:
                                sourceParameter2.getClass();
                                UnrecognizedEmailFragment unrecognizedEmailFragment = (UnrecognizedEmailFragment) x1eVar2.a.b;
                                s sVarZ = unrecognizedEmailFragment.Z();
                                Context contextS = unrecognizedEmailFragment.S();
                                if (unrecognizedEmailFragment.u0 == null) {
                                    g76.g0("mediumUris");
                                    throw null;
                                }
                                ((p13) sVarZ).f(contextS, Uri.parse(i03.D), gp7.u(sourceParameter2));
                                return;
                            default:
                                sourceParameter2.getClass();
                                UnrecognizedEmailFragment unrecognizedEmailFragment2 = (UnrecognizedEmailFragment) x1eVar2.a.b;
                                s sVarZ2 = unrecognizedEmailFragment2.Z();
                                Context contextS2 = unrecognizedEmailFragment2.S();
                                if (unrecognizedEmailFragment2.u0 == null) {
                                    g76.g0("mediumUris");
                                    throw null;
                                }
                                ((p13) sVarZ2).f(contextS2, Uri.parse(i03.E), gp7.u(sourceParameter2));
                                return;
                        }
                    }
                };
                p65Var2.j0(objM);
            }
            b07 b07Var = new b07("terms_of_service", wjdVar, (e07) objM);
            int i8 = 8;
            arrayListV.add(new jx(b07Var, iZ, length, i8));
            wjd wjdVar2 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
            boolean z2 = (i6 == 4) | (i5 == 32);
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar) {
                final int i9 = 1;
                objM2 = new e07() { // from class: v1e
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i82 = i9;
                        SourceParameter sourceParameter2 = sourceParameter;
                        x1e x1eVar2 = x1eVar;
                        d07Var.getClass();
                        switch (i82) {
                            case 0:
                                sourceParameter2.getClass();
                                UnrecognizedEmailFragment unrecognizedEmailFragment = (UnrecognizedEmailFragment) x1eVar2.a.b;
                                s sVarZ = unrecognizedEmailFragment.Z();
                                Context contextS = unrecognizedEmailFragment.S();
                                if (unrecognizedEmailFragment.u0 == null) {
                                    g76.g0("mediumUris");
                                    throw null;
                                }
                                ((p13) sVarZ).f(contextS, Uri.parse(i03.D), gp7.u(sourceParameter2));
                                return;
                            default:
                                sourceParameter2.getClass();
                                UnrecognizedEmailFragment unrecognizedEmailFragment2 = (UnrecognizedEmailFragment) x1eVar2.a.b;
                                s sVarZ2 = unrecognizedEmailFragment2.Z();
                                Context contextS2 = unrecognizedEmailFragment2.S();
                                if (unrecognizedEmailFragment2.u0 == null) {
                                    g76.g0("mediumUris");
                                    throw null;
                                }
                                ((p13) sVarZ2).f(contextS2, Uri.parse(i03.E), gp7.u(sourceParameter2));
                                return;
                        }
                    }
                };
                p65Var2.j0(objM2);
            }
            arrayListV.add(new jx(new b07("privacy_policy", wjdVar2, (e07) objM2), iZ2, length2, i8));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            for (int i10 = 0; i10 < arrayListV.size(); i10 = lv8.i(sb, (jx) arrayListV.get(i10), arrayList, i10, 1)) {
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
            mwaVarS.d = new y5c(i2, 19, sourceParameter, x1eVar, r28Var2);
        }
    }

    public static final void v(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2140824978);
        int i3 = i2 | (p65Var2.h(m45Var) ? 4 : 2) | (p65Var2.h(m45Var2) ? 32 : 16) | 384;
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            v7c v7cVarF = t18.f(6, 2, p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var2);
                p65Var2.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            boolean zH = p65Var2.h(sb2Var) | p65Var2.f(v7cVarF) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                objM2 = new a57(sb2Var, v7cVarF, m45Var2, i4);
                p65Var2.j0(objM2);
            }
            mz1 mz1VarE = pxf.E(-88334122, new ov2(sb2Var, v7cVarF, m45Var2, m45Var, 8), p65Var2);
            p65Var = p65Var2;
            o28 o28Var = o28.b;
            qq7.a((m45) objM2, o28Var, v7cVarF, mz1VarE, p65Var, 3120, 0);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y47(m45Var, m45Var2, r28Var2, i2, 0);
        }
    }

    public static final void w(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(200451372);
        int i3 = i2 | (p65Var.h(m45Var) ? 4 : 2) | (p65Var.h(m45Var2) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            String strQ = vo7.Q(R.string.lists_catalog_size_limit_modal_title, new Object[]{100}, p65Var);
            String strQ2 = vo7.Q(R.string.lists_catalog_size_limit_modal_text, new Object[]{100}, p65Var);
            String strR = vo7.R(p65Var, R.string.lists_catalog_size_limit_modal_positive_cta);
            String strR2 = vo7.R(p65Var, R.string.lists_catalog_size_limit_modal_negative_cta);
            int i4 = (i3 & PhotoshopDirectory.TAG_CAPTION) | ((i3 << 12) & 458752) | ((i3 << 21) & 29360128);
            o28 o28Var = o28.b;
            vv2.s(strQ, m45Var2, o28Var, strQ2, strR, m45Var2, strR2, m45Var, p65Var, i4, 0);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y47(m45Var, m45Var2, r28Var2, i2, 1);
        }
    }

    public static final void x(db4 db4Var, ua4 ua4Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1546336924);
        int i3 = i2 | (p65Var.f(db4Var) ? 4 : 2) | (p65Var.f(ua4Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            String strR = vo7.R(p65Var, R.string.feature_post_no_featured_stories_available_title);
            r28 r28VarG = w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10);
            jgd jgdVar = new jgd(3);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, r28VarG, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).i, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            p65Var.Y(-181657812);
            kx kxVar = new kx();
            kxVar.d(vo7.R(p65Var, R.string.feature_post_no_featured_stories_available_description_part_1));
            kxVar.d(" ");
            p65Var.Y(-181653682);
            int iH = kxVar.h(new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531));
            try {
                sn3 sn3Var2 = eo.b;
                kxVar.d(s42.T((Context) p65Var.j(sn3Var2), db4Var.a));
                kxVar.d(".");
                kxVar.f(iH);
                p65Var.p(false);
                kxVar.d(" ");
                kxVar.d(vo7.Q(R.string.feature_post_no_featured_stories_available_description_part_2, new Object[]{s42.S((Context) p65Var.j(sn3Var2), db4Var.b), String.valueOf(db4Var.c)}, p65Var));
                kxVar.d(" ");
                p65Var.Y(-181621955);
                wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
                int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i6 = i3 & 14;
                boolean z = (i5 == 32) | (i6 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z || objM == uobVar) {
                    objM = new bf0(ua4Var, 4, db4Var);
                    p65Var.j0(objM);
                }
                int iV = ho2.v("annotation_learn_more", wjdVar, (e07) objM, kxVar);
                try {
                    kxVar.d(vo7.R(p65Var, R.string.common_learn_more));
                    kxVar.f(iV);
                    p65Var.p(false);
                    mx mxVarI = kxVar.i();
                    p65Var.p(false);
                    jjd.c(mxVarI, w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 48, 0, 262140);
                    hp7.t(p65Var, jfc.l(o28Var, 21.0f));
                    boolean z2 = i5 == 32;
                    Object objM2 = p65Var.M();
                    if (z2 || objM2 == uobVar) {
                        hq3 hq3Var = new hq3(0, ua4Var, ua4.class, "onClose", "onClose()V", 0, 23);
                        p65Var.j0(hq3Var);
                        objM2 = hq3Var;
                    }
                    m45 m45Var = (m45) ((qh6) objM2);
                    String strR2 = vo7.R(p65Var, R.string.common_got_it);
                    xn7 xn7Var = xn7.L;
                    fo7.i(m45Var, strR2, xn7Var, bgf.N(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "got_it"), db4Var.e, p65Var, 3456, 0);
                    hp7.t(p65Var, jfc.l(o28Var, 6.0f));
                    boolean z3 = (i5 == 32) | (i6 == 4);
                    Object objM3 = p65Var.M();
                    if (z3 || objM3 == uobVar) {
                        objM3 = new gd3(ua4Var, 7, db4Var);
                        p65Var.j0(objM3);
                    }
                    fo7.j((m45) objM3, vo7.R(p65Var, R.string.feature_post_cta_view_featured_stories), xn7Var, bgf.N(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "view_featured_stories"), db4Var.e, null, p65Var, 3456, 32);
                    p65Var = p65Var;
                    lv8.y(o28Var, 21.0f, p65Var, true);
                    obj = o28Var;
                } catch (Throwable th) {
                    kxVar.f(iV);
                    throw th;
                }
            } catch (Throwable th2) {
                kxVar.f(iH);
                throw th2;
            }
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 5, db4Var, ua4Var, obj);
        }
    }

    public static final void y(eb4 eb4Var, ua4 ua4Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        int i3;
        int i4;
        float f2;
        boolean z;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1490606076);
        int i5 = i2 | (p65Var2.f(eb4Var) ? 4 : 2) | (p65Var2.f(ua4Var) ? 32 : 16) | 384;
        if (p65Var2.P(i5 & 1, (i5 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var2, 48);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String strR = vo7.R(p65Var2, R.string.feature_post_stop_featuring_stories_title);
            r28 r28VarG = w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10);
            jgd jgdVar = new jgd(3);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, r28VarG, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).i, p65Var2, 48, 0, 130044);
            hp7.t(p65Var2, jfc.l(o28Var, 24.0f));
            z(eb4Var.a, eb4Var.b, eb4Var.c, eb4Var.f, w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), p65Var2, 24576);
            hp7.t(p65Var2, jfc.l(o28Var, 24.0f));
            p65Var2.Y(1517415096);
            kx kxVar = new kx();
            kxVar.d(vo7.R(p65Var2, R.string.feature_post_stop_featuring_stories_description));
            kxVar.d(" ");
            p65Var2.Y(1517419829);
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = ((i5 & 14) == 4) | (i7 == 32);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new bf0(ua4Var, 3, eb4Var);
                p65Var2.j0(objM);
            }
            int iV = ho2.v("annotation_view_featured_stories", wjdVar, (e07) objM, kxVar);
            try {
                kxVar.d(vo7.R(p65Var2, R.string.feature_post_cta_view_featured_stories));
                kxVar.f(iV);
                p65Var2.p(false);
                mx mxVarI = kxVar.i();
                p65Var2.p(false);
                jjd.c(mxVarI, w2g.G(o28Var, 32.0f, 0.0f, 32.0f, 0.0f, 10), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var2.j(sn3Var)).m, p65Var2, 48, 0, 262140);
                hp7.t(p65Var2, jfc.l(o28Var, 21.0f));
                boolean z3 = i7 == 32;
                Object objM2 = p65Var2.M();
                if (z3 || objM2 == uobVar) {
                    i3 = i7;
                    i4 = 32;
                    f2 = 24.0f;
                    z = true;
                    hq3 hq3Var = new hq3(0, ua4Var, ua4.class, "stopFeaturingPost", "stopFeaturingPost()V", 0, 24);
                    p65Var2.j0(hq3Var);
                    objM2 = hq3Var;
                } else {
                    f2 = 24.0f;
                    i4 = 32;
                    i3 = i7;
                    z = true;
                }
                String strR2 = vo7.R(p65Var2, R.string.feature_post_cta_stop_featuring_story);
                xn7 xn7Var = xn7.L;
                int i8 = i4;
                float f3 = f2;
                int i9 = i3;
                fo7.i((m45) ((qh6) objM2), strR2, xn7Var, bgf.N(jfc.d(w2g.G(o28Var, f3, 0.0f, f2, 0.0f, 10), 1.0f), "stop_featuring_story"), eb4Var.e, p65Var2, 3456, 0);
                hp7.t(p65Var2, jfc.l(o28Var, 6.0f));
                boolean z4 = i9 == i8 ? z : false;
                Object objM3 = p65Var2.M();
                if (z4 || objM3 == uobVar) {
                    p65Var = p65Var2;
                    hq3 hq3Var2 = new hq3(0, ua4Var, ua4.class, "onClose", "onClose()V", 0, 25);
                    p65Var.j0(hq3Var2);
                    objM3 = hq3Var2;
                } else {
                    p65Var = p65Var2;
                }
                p65 p65Var3 = p65Var;
                fo7.j((m45) ((qh6) objM3), vo7.R(p65Var, R.string.common_cancel), xn7Var, bgf.N(jfc.d(w2g.G(o28Var, f3, 0.0f, f3, 0.0f, 10), 1.0f), "cancel"), eb4Var.e, null, p65Var3, 3456, 32);
                p65Var2 = p65Var3;
                lv8.y(o28Var, 21.0f, p65Var2, z);
                obj = o28Var;
            } catch (Throwable th) {
                kxVar.f(iV);
                throw th;
            }
        } else {
            p65Var2.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var2.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 8, eb4Var, ua4Var, obj);
        }
    }

    public static final void z(pq9 pq9Var, rq9 rq9Var, String str, SourceParameter sourceParameter, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-855639381);
        int i3 = 2;
        int i4 = i2 | (p65Var.f(pq9Var) ? 4 : 2) | (p65Var.f(rq9Var) ? 32 : 16) | (p65Var.f(str) ? 256 : 128) | (p65Var.f(sourceParameter) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            r28 r28VarC = w2g.C(bo.B(jfc.d(r28Var, 1.0f), 1.0f, ((zo7) p65Var.j(kt7.b)).z, bmb.a(4.0f)), 16.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new p44(i3);
                p65Var.j0(objM);
            }
            b55 b55Var = (b55) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new p44(3);
                p65Var.j0(objM2);
            }
            vc2.e(pq9Var, rq9Var, false, sourceParameter, b55Var, (b55) objM2, null, null, p65Var, (i4 & 14) | 221568 | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i4 & 7168), 192);
            hp7.t(p65Var, jfc.l(o28.b, 12.0f));
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).e, p65Var, (i4 >> 6) & 14, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(pq9Var, rq9Var, str, sourceParameter, r28Var, i2);
        }
    }
}
