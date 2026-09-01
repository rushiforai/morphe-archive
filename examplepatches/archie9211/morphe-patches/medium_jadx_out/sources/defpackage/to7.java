package defpackage;

import android.os.Bundle;
import android.util.Log;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import com.medium.android.core.models.MembershipTypeEntity;
import com.medium.stats.ui.user.UserStatsTab;
import com.medium.stats.ui.user.a;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class to7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;

    /* JADX WARN: Removed duplicated region for block: B:8:0x0017  */
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
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object A(defpackage.p92 r7) throws kotlinx.coroutines.DispatchException {
        /*
            ib2 r0 = r7.getContext()
            defpackage.bo.N(r0)
            n92 r7 = defpackage.pwd.Q(r7)
            boolean r1 = r7 instanceof defpackage.rg3
            if (r1 == 0) goto L12
            rg3 r7 = (defpackage.rg3) r7
            goto L13
        L12:
            r7 = 0
        L13:
            c1e r1 = defpackage.c1e.a
            if (r7 != 0) goto L1a
        L17:
            r7 = r1
            goto L83
        L1a:
            kb2 r2 = r7.d
            boolean r3 = defpackage.op8.m0(r2, r0)
            r4 = 1
            if (r3 == 0) goto L2b
            r7.f = r1
            r7.c = r4
            r2.F0(r0, r7)
            goto L81
        L2b:
            faf r3 = new faf
            no3 r5 = defpackage.faf.c
            r3.<init>(r5)
            ib2 r0 = r0.j0(r3)
            r7.f = r1
            r7.c = r4
            r2.F0(r0, r7)
            boolean r0 = r3.b
            if (r0 == 0) goto L81
            k34 r0 = defpackage.ald.a()
            m70 r2 = r0.e
            if (r2 == 0) goto L4e
            boolean r2 = r2.isEmpty()
            goto L4f
        L4e:
            r2 = r4
        L4f:
            if (r2 == 0) goto L52
            goto L17
        L52:
            long r2 = r0.c
            r5 = 4294967296(0x100000000, double:2.121995791E-314)
            int r2 = (r2 > r5 ? 1 : (r2 == r5 ? 0 : -1))
            if (r2 < 0) goto L67
            r7.f = r1
            r7.c = r4
            r0.J0(r7)
            tb2 r7 = defpackage.tb2.COROUTINE_SUSPENDED
            goto L83
        L67:
            r0.K0(r4)
            r7.run()     // Catch: java.lang.Throwable -> L77
        L6d:
            boolean r2 = r0.M0()     // Catch: java.lang.Throwable -> L77
            if (r2 != 0) goto L6d
        L73:
            r0.I0(r4)
            goto L17
        L77:
            r2 = move-exception
            r7.g(r2)     // Catch: java.lang.Throwable -> L7c
            goto L73
        L7c:
            r7 = move-exception
            r0.I0(r4)
            throw r7
        L81:
            tb2 r7 = defpackage.tb2.COROUTINE_SUSPENDED
        L83:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r7 != r0) goto L88
            return r7
        L88:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.to7.A(p92):java.lang.Object");
    }

    public static zzabz B(Exception exc, String str, String str2) {
        String message = exc.getMessage();
        StringBuilder sbU = y30.u("Failed to parse ", str, " for string [", str2, "] with exception: ");
        sbU.append(message);
        Log.e(str, sbU.toString());
        return new zzabz(ev6.y("Failed to parse ", str, " for string [", str2, "]"), exc);
    }

    public static void C(JSONObject jSONObject, String str, String str2) throws JSONException {
        jSONObject.put(str, str2);
        jSONObject.put("recaptchaVersion", "RECAPTCHA_ENTERPRISE");
        jSONObject.put("clientType", "CLIENT_TYPE_ANDROID");
    }

    public static byte[] D(byte[]... bArr) {
        int i = 0;
        int length = 0;
        while (true) {
            if (i >= bArr.length) {
                break;
            }
            length += bArr[i].length;
            i++;
        }
        byte[] bArr2 = new byte[length];
        int i2 = 0;
        for (byte[] bArr3 : bArr) {
            int length2 = bArr3.length;
            System.arraycopy(bArr3, 0, bArr2, i2, length2);
            i2 += length2;
        }
        return bArr2;
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x030d  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x031b  */
    /* JADX WARN: Removed duplicated region for block: B:122:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(boolean r44, defpackage.x45 r45, defpackage.r28 r46, boolean r47, defpackage.ey2 r48, defpackage.x12 r49, int r50, int r51) {
        /*
            Method dump skipped, instruction units count: 810
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.to7.a(boolean, x45, r28, boolean, ey2, x12, int, int):void");
    }

    public static final void b(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1740416071);
        int i2 = 4;
        if (p65Var.P(i & 1, i != 0)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
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
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new be7(i2);
                p65Var.j0(objM);
            }
            a(false, (x45) objM, null, false, null, p65Var, 54, 28);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new be7(5);
                p65Var.j0(objM2);
            }
            a(true, (x45) objM2, null, false, null, p65Var, 54, 28);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new be7(6);
                p65Var.j0(objM3);
            }
            a(false, (x45) objM3, null, false, null, p65Var, 3126, 20);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new be7(7);
                p65Var.j0(objM4);
            }
            a(true, (x45) objM4, null, false, null, p65Var, 3126, 20);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, i2);
        }
    }

    public static final void c(boolean z, m45 m45Var, m45 m45Var2, x12 x12Var, int i) {
        m45 m45Var3;
        m45 m45Var4;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-44578779);
        int i2 = (p65Var.g(z) ? 4 : 2) | i | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.h(m45Var2) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new oo7(22);
                p65Var.j0(objM);
            }
            m45Var3 = m45Var;
            m45Var4 = m45Var2;
            m40.h((m45) objM, new pb3(4), pxf.E(-107461764, new zo8(z, m45Var3, m45Var4, 1, (byte) 0), p65Var), p65Var, 438, 0);
        } else {
            m45Var3 = m45Var;
            m45Var4 = m45Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zo8(z, m45Var3, m45Var4, i);
        }
    }

    public static final void d(boolean z, m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1087353582);
        int i2 = i | (p65Var.g(z) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.h(m45Var2) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            amb ambVarA = bmb.a(24.0f);
            mz1 mz1VarE = pxf.E(1132259927, new zo8(z, m45Var, m45Var2, 0, (byte) 0), p65Var);
            o28 o28Var = o28.b;
            g3d.a(o28Var, ambVarA, 0L, 0L, 0.0f, 0.0f, null, mz1VarE, p65Var, 12582918, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ap8(z, m45Var, m45Var2, r28Var2, i, 0);
        }
    }

    public static final void e(wme wmeVar, x45 x45Var, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        boolean z;
        Object obj2;
        x45 x45Var2 = x45Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(584691104);
        int i2 = i | (p65Var.f(wmeVar) ? 4 : 2) | (p65Var.h(x45Var2) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
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
            boolean zD = p65Var.d(wmeVar.a.ordinal());
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                ArrayList arrayList = new ArrayList();
                Iterator<E> it2 = UserStatsTab.getEntries().iterator();
                while (it2.hasNext()) {
                    arrayList.add(new mz1(new zq(10, (UserStatsTab) it2.next()), true, 802455870));
                }
                z = true;
                arrayList.add(dm2.g);
                p65Var.j0(arrayList);
                obj2 = arrayList;
            } else {
                z = true;
                obj2 = objM;
            }
            List list = (List) obj2;
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            int iOrdinal = wmeVar.a.ordinal();
            boolean z2 = ((i2 & 896) == 256 ? z : false) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? z : false);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                x45Var2 = x45Var;
                objM2 = new vrd(m45Var, 15, x45Var2);
                p65Var.j0(objM2);
            } else {
                x45Var2 = x45Var;
            }
            boolean z3 = z;
            ns7.b(0.0f, iOrdinal, 48, 248, 0L, 0L, p65Var, (x45) objM2, null, r28VarD2, null, list);
            p65Var.p(z3);
            p65Var.p(z3);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 26, wmeVar, x45Var2, m45Var, obj);
        }
    }

    public static final void f(String str, UserStatsTab userStatsTab, String str2, ume umeVar, tme tmeVar, a aVar, r28 r28Var, yme ymeVar, x12 x12Var, int i) {
        UserStatsTab userStatsTab2;
        yme ymeVar2;
        yme ymeVar3;
        int i2;
        yme ymeVar4;
        str.getClass();
        userStatsTab.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1119206677);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.d(userStatsTab.ordinal()) ? 32 : 16) | (p65Var.f(str2) ? 256 : 128) | (p65Var.f(umeVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(tmeVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(aVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288) | 4194304;
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    userStatsTab2 = userStatsTab;
                    objM = new pi9(str, (Object) userStatsTab2, (Object) str2, 23);
                    p65Var.j0(objM);
                } else {
                    userStatsTab2 = userStatsTab;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ymeVar3 = (yme) z(n1b.a.b(yme.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-29360129);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-29360129);
                userStatsTab2 = userStatsTab;
                ymeVar3 = ymeVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ymeVar3.d, p65Var, 0);
            wme wmeVar = (wme) l78VarZ.getValue();
            boolean zH = p65Var.h(ymeVar3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                ymeVar4 = ymeVar3;
                objM2 = new hgb(1, ymeVar4, yme.class, "onTabSelected", "onTabSelected(Lcom/medium/stats/ui/user/UserStatsTab;)V", 0, 21);
                p65Var.j0(objM2);
            } else {
                ymeVar4 = ymeVar3;
            }
            x45 x45Var2 = (x45) ((qh6) objM2);
            int i5 = i2 & 7168;
            boolean zF = (i5 == 2048) | p65Var.f(l78VarZ);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new ube(umeVar, 11, l78VarZ);
                p65Var.j0(objM3);
            }
            int i6 = (i2 & 14) | ((i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | i5;
            int i7 = i2 << 6;
            g(str, str2, wmeVar, umeVar, x45Var2, (m45) objM3, tmeVar, aVar, r28Var, p65Var, (i7 & 234881024) | i6 | (3670016 & i7) | (29360128 & i7), 0);
            ymeVar2 = ymeVar4;
        } else {
            userStatsTab2 = userStatsTab;
            p65Var.S();
            ymeVar2 = ymeVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new nb4(str, userStatsTab2, str2, umeVar, tmeVar, aVar, r28Var, ymeVar2, i);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0190  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x019b  */
    /* JADX WARN: Removed duplicated region for block: B:105:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(java.lang.String r26, java.lang.String r27, defpackage.wme r28, defpackage.ume r29, defpackage.x45 r30, defpackage.m45 r31, defpackage.hsc r32, defpackage.ab0 r33, defpackage.r28 r34, defpackage.x12 r35, int r36, int r37) {
        /*
            Method dump skipped, instruction units count: 434
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.to7.g(java.lang.String, java.lang.String, wme, ume, x45, m45, hsc, ab0, r28, x12, int, int):void");
    }

    public static String i(h21 h21Var, h21[] h21VarArr, int i) {
        int i2;
        boolean z;
        int i3;
        int i4;
        int iE = h21Var.e();
        int i5 = 0;
        while (i5 < iE) {
            int i6 = (i5 + iE) / 2;
            while (i6 > -1 && h21Var.j(i6) != 10) {
                i6--;
            }
            int i7 = i6 + 1;
            int i8 = 1;
            while (true) {
                i2 = i7 + i8;
                if (h21Var.j(i2) == 10) {
                    break;
                }
                i8++;
            }
            int i9 = i2 - i7;
            int i10 = i;
            boolean z2 = false;
            int i11 = 0;
            int i12 = 0;
            while (true) {
                if (z2) {
                    i3 = 46;
                    z = false;
                } else {
                    byte bJ = h21VarArr[i10].j(i11);
                    byte[] bArr = egf.a;
                    int i13 = bJ & 255;
                    z = z2;
                    i3 = i13;
                }
                byte bJ2 = h21Var.j(i7 + i12);
                byte[] bArr2 = egf.a;
                i4 = i3 - (bJ2 & 255);
                if (i4 != 0) {
                    break;
                }
                i12++;
                i11++;
                if (i12 == i9) {
                    break;
                }
                if (h21VarArr[i10].e() != i11) {
                    z2 = z;
                } else {
                    if (i10 == h21VarArr.length - 1) {
                        break;
                    }
                    i10++;
                    i11 = -1;
                    z2 = true;
                }
            }
            if (i4 >= 0) {
                if (i4 <= 0) {
                    int i14 = i9 - i12;
                    int iE2 = h21VarArr[i10].e() - i11;
                    int length = h21VarArr.length;
                    for (int i15 = i10 + 1; i15 < length; i15++) {
                        iE2 += h21VarArr[i15].e();
                    }
                    if (iE2 >= i14) {
                        if (iE2 <= i14) {
                            return h21Var.p(i7, i9 + i7).o(wk1.a);
                        }
                    }
                }
                i5 = i2 + 1;
            }
            iE = i6;
        }
        return null;
    }

    public static final long j() {
        return Thread.currentThread().getId();
    }

    public static la8 m(vue vueVar) {
        vueVar.getClass();
        w7 w7Var = ma8.a;
        og2 og2Var = og2.b;
        w7Var.getClass();
        og2Var.getClass();
        o2b o2bVar = new o2b(vueVar, w7Var, og2Var);
        wg6 wg6VarB = n1b.a.b(la8.class);
        String strD = wg6VarB.d();
        if (strD != null) {
            return (la8) o2bVar.o(wg6VarB, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
        }
        ay0.e("Local and anonymous classes can not be ViewModels");
        return null;
    }

    public static boolean p(g59 g59Var) {
        return !tuc.F(g59Var.b(), ".class", true);
    }

    public static String q(String str, String str2) {
        int length = str.length() - str2.length();
        if (length < 0 || length > 1) {
            ay0.e("Invalid input received");
            return null;
        }
        StringBuilder sb = new StringBuilder(str2.length() + str.length());
        for (int i = 0; i < str.length(); i++) {
            sb.append(str.charAt(i));
            if (str2.length() > i) {
                sb.append(str2.charAt(i));
            }
        }
        return sb.toString();
    }

    public static final l78 r(vob vobVar, String str, mya myaVar, m45 m45Var) {
        final Object objInvoke;
        Object obj;
        h9b h9bVar = new h9b(8, myaVar);
        eb8 eb8Var = new eb8(26, myaVar);
        final mya myaVar2 = new mya(h9bVar, 3, eb8Var);
        Bundle bundle = (Bundle) vobVar.a(str);
        if (bundle == null || (obj = bundle.get("value")) == null || (objInvoke = eb8Var.invoke(obj)) == null) {
            objInvoke = m45Var.invoke();
        }
        ((LinkedHashMap) vobVar.b.c).put(str, new dpb() { // from class: yob
            @Override // defpackage.dpb
            public final Bundle a() {
                f09[] f09VarArr;
                Map mapSingletonMap = Collections.singletonMap("value", ((b55) myaVar2.b).invoke(new zob(), objInvoke));
                mapSingletonMap.getClass();
                if (mapSingletonMap.isEmpty()) {
                    f09VarArr = new f09[0];
                } else {
                    ArrayList arrayList = new ArrayList(mapSingletonMap.size());
                    for (Map.Entry entry : mapSingletonMap.entrySet()) {
                        arrayList.add(new f09((String) entry.getKey(), entry.getValue()));
                    }
                    f09VarArr = (f09[]) arrayList.toArray(new f09[0]);
                }
                return xz5.E((f09[]) Arrays.copyOf(f09VarArr, f09VarArr.length));
            }
        });
        return (l78) objInvoke;
    }

    public static mkd s(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        return mkd.a(dl7.m(((bu7) p65Var.j(jt7.c)).l), ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
    }

    public static mkd t(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        return mkd.a(dl7.m(((bu7) p65Var.j(jt7.c)).n), ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
    }

    public static mkd u(x12 x12Var) {
        return dl7.m(((bu7) ((p65) x12Var).j(jt7.c)).h);
    }

    public static mkd v(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        return mkd.a(dl7.m(((bu7) p65Var.j(jt7.c)).l), ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
    }

    public static mkd w(x12 x12Var) {
        return dl7.m(((bu7) ((p65) x12Var).j(jt7.c)).i);
    }

    public static final zw7 x(MembershipTypeEntity membershipTypeEntity) {
        membershipTypeEntity.getClass();
        int i = ax7.a[membershipTypeEntity.ordinal()];
        if (i == 1) {
            return zw7.NOT_A_MEMBER;
        }
        if (i == 2) {
            return zw7.REGULAR;
        }
        if (i == 3) {
            return zw7.PREMIUM;
        }
        ygf.a();
        return null;
    }

    public static final void y() {
        throw new UnsupportedOperationException();
    }

    public static final que z(wg6 wg6Var, wue wueVar, uue uueVar, qg2 qg2Var, x12 x12Var) {
        zg7 zg7VarC;
        if (uueVar != null) {
            vue viewModelStore = wueVar.getViewModelStore();
            viewModelStore.getClass();
            qg2Var.getClass();
            zg7VarC = new zg7(viewModelStore, uueVar, qg2Var);
        } else if (wueVar instanceof pi5) {
            vue viewModelStore2 = wueVar.getViewModelStore();
            uue defaultViewModelProviderFactory = ((pi5) wueVar).getDefaultViewModelProviderFactory();
            viewModelStore2.getClass();
            defaultViewModelProviderFactory.getClass();
            qg2Var.getClass();
            zg7VarC = new zg7(viewModelStore2, defaultViewModelProviderFactory, qg2Var);
        } else {
            zg7VarC = z46.c(wueVar, null, 6);
        }
        return zg7VarC.n0(wg6Var);
    }

    public abstract void h(ubb ubbVar, Object obj);

    public abstract Method k(Class cls, Field field);

    public abstract Constructor l(Class cls);

    public abstract String[] n(Class cls);

    public abstract boolean o(Class cls);
}
