package defpackage;

import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.avi.AviDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.postpage.membershipinfo.a;
import com.medium.android.responses.ResponsesViewModel$WriteState$Highlight;
import com.medium.proto.event.PostMocLabelInformationViewed;
import com.medium.reader.R;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.crypto.Mac;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fo7 implements rkg {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;

    public static final void A(DarkMode darkMode, x45 x45Var, m45 m45Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        darkMode.getClass();
        x45Var.getClass();
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-822286117);
        if ((i & 6) == 0) {
            i2 = (p65Var2.d(darkMode.ordinal()) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(x45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var = p65Var2;
            hlg.a(m45Var, pxf.E(-37749981, new c60(24, m45Var), p65Var2), null, null, null, kyd.f, pxf.E(343242152, new l6c(darkMode, 15, x45Var), p65Var2), null, 0L, 0L, 0L, 0L, null, p65Var, ((i2 >> 6) & 14) | 1769520, 0, 16284);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 16, darkMode, x45Var, m45Var);
        }
    }

    public static final void B(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1627229623);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            r28Var2 = o28Var;
            jjd.b("Upsell", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 6, 0, 131070);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(r28Var2, 24.0f));
            p65Var.Y(414238820);
            for (xn7 xn7Var : xn7.getEntries()) {
                b(xn7Var, pxf.E(1841634994, new zn7(xn7Var, 3), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 12);
        }
    }

    public static final void C(uid uidVar, bib bibVar, lgb lgbVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        boolean z;
        cu cuVar;
        cu cuVar2;
        cu cuVar3;
        upc upcVar;
        ar0 ar0Var;
        float f;
        boolean z2;
        o28 o28Var;
        uob uobVar;
        boolean z3;
        boolean z4;
        lgb lgbVar2;
        p65 p65Var;
        String str;
        uidVar.getClass();
        bibVar.getClass();
        String str2 = bibVar.f;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1044124533);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(uidVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(bibVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(lgbVar) ? 256 : 128;
        }
        int i3 = i2 | 3072;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            l78 l78VarJ = f49.J(p65Var2);
            o28 o28Var2 = o28.b;
            r28 r28VarD = jfc.d(o28Var2, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            cu cuVar4 = q12.f;
            tp7.B(p65Var2, cuVar4, wv1VarA);
            cu cuVar5 = q12.e;
            tp7.B(p65Var2, cuVar5, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar6 = q12.g;
            tp7.B(p65Var2, cuVar6, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar7 = q12.d;
            tp7.B(p65Var2, cuVar7, r28VarR);
            if (str2 != null) {
                p65Var2.Y(-883060861);
                e(str2, lgbVar, null, p65Var2, (i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                z = false;
            } else {
                z = false;
                p65Var2.Y(-885413203);
            }
            p65Var2.p(z);
            tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
            p65 p65Var3 = p65Var2;
            upc upcVarA = zu.a(((Boolean) l78VarJ.getValue()).booleanValue() ? -50.0f : 0.0f, null, "Avatar Offset Animation", p65Var3, 384, 10);
            upc upcVarA2 = zu.a(((Boolean) l78VarJ.getValue()).booleanValue() ? 0.0f : 50.0f, null, "SendButton Offset Animation", p65Var3, 384, 10);
            r28 r28VarC = w2g.C(jfc.d(o28Var2, 1.0f), 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.o, p65Var3, 48);
            long j2 = p65Var3.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var3.l();
            r28 r28VarR2 = gx1.R(p65Var3, r28VarC);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar4, ombVarA);
            tp7.B(p65Var3, cuVar5, i89VarL2);
            ka1.z(i5, p65Var3, cuVar6, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar7, r28VarR2);
            boolean zF = p65Var3.f(upcVarA);
            Object objM = p65Var3.M();
            int i6 = 3;
            uob uobVar2 = w12.a;
            if (zF || objM == uobVar2) {
                objM = new w13(upcVarA, i6);
                p65Var3.j0(objM);
            }
            r28 r28VarR3 = guc.R(o28Var2, (x45) objM);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j3 = p65Var3.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var3.l();
            r28 r28VarR4 = gx1.R(p65Var3, r28VarR3);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar4, zk7VarC);
            tp7.B(p65Var3, cuVar5, i89VarL3);
            ka1.z(i7, p65Var3, cuVar6, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar7, r28VarR4);
            if (((Boolean) l78VarJ.getValue()).booleanValue()) {
                cuVar = cuVar6;
                cuVar2 = cuVar7;
                cuVar3 = cuVar5;
                upcVar = upcVarA2;
                ar0Var = ar0Var2;
                f = 8.0f;
                z2 = false;
                o28Var = o28Var2;
                uobVar = uobVar2;
                p65Var3.Y(-534225257);
            } else {
                p65Var3.Y(-531012479);
                String str3 = bibVar.a;
                if (str3 != null) {
                    str = str3;
                    upcVar = upcVarA2;
                } else {
                    upcVar = upcVarA2;
                    str = null;
                }
                uobVar = uobVar2;
                cuVar2 = cuVar7;
                z2 = false;
                ar0Var = ar0Var2;
                cuVar3 = cuVar5;
                o28Var = o28Var2;
                cuVar = cuVar6;
                f = 8.0f;
                d46.a(str, hl0.XS, w2g.G(o28Var2, 0.0f, 0.0f, 0.0f, 3.0f, 7), bibVar.b, null, null, null, 0.0f, 0, null, null, p65Var3, 432, 0, 4080);
                p65Var3 = p65Var3;
            }
            p65Var3.p(z2);
            p65Var3.p(true);
            if (((Boolean) l78VarJ.getValue()).booleanValue()) {
                p65Var3.Y(916167729);
            } else {
                p65Var3.Y(919749717);
                hp7.t(p65Var3, jfc.p(o28Var, f));
            }
            p65Var3.p(z2);
            upc upcVar2 = upcVar;
            int i8 = i3 & 896;
            float f2 = f;
            uob uobVar3 = uobVar;
            p65 p65Var4 = p65Var3;
            cu cuVar8 = cuVar;
            x(uidVar, bibVar, lgbVar, ((Boolean) l78VarJ.getValue()).booleanValue(), new sq6(1.0f, true), p65Var4, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            if (((Boolean) l78VarJ.getValue()).booleanValue()) {
                p65Var4.Y(920129653);
                hp7.t(p65Var4, jfc.p(o28Var, f2));
            } else {
                p65Var4.Y(916167729);
            }
            p65Var4.p(z2);
            boolean zF2 = p65Var4.f(upcVar2);
            Object objM2 = p65Var4.M();
            if (zF2 || objM2 == uobVar3) {
                objM2 = new w13(upcVar2, 4);
                p65Var4.j0(objM2);
            }
            r28 r28VarR5 = guc.R(o28Var, (x45) objM2);
            zk7 zk7VarC2 = dy0.c(ar0Var, z2);
            o28 o28Var3 = o28Var;
            long j4 = p65Var4.T;
            int i9 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var4.l();
            r28 r28VarR6 = gx1.R(p65Var4, r28VarR5);
            p65Var4.c0();
            if (p65Var4.S) {
                p65Var4.k(ot2Var);
            } else {
                p65Var4.m0();
            }
            tp7.B(p65Var4, cuVar4, zk7VarC2);
            tp7.B(p65Var4, cuVar3, i89VarL4);
            ka1.z(i9, p65Var4, cuVar8, p65Var4, fnVar);
            tp7.B(p65Var4, cuVar2, r28VarR6);
            if (((Boolean) l78VarJ.getValue()).booleanValue()) {
                p65Var4.Y(1649192947);
                boolean z5 = bibVar.g;
                z3 = true;
                boolean z6 = !muc.b0(uidVar.a.b);
                boolean z7 = i8 == 256;
                Object objM3 = p65Var4.M();
                if (z7 || objM3 == uobVar3) {
                    p65Var = p65Var4;
                    z4 = false;
                    lgbVar2 = lgbVar;
                    k8e k8eVar = new k8e(0, lgbVar2, lgb.class, "onWriteResponseSendButtonClicked", "onWriteResponseSendButtonClicked()V", 0, 29);
                    p65Var.j0(k8eVar);
                    objM3 = k8eVar;
                } else {
                    p65Var = p65Var4;
                    z4 = false;
                    lgbVar2 = lgbVar;
                }
                p65 p65Var5 = p65Var;
                y(z5, z6, (m45) ((qh6) objM3), null, p65Var5, 0);
                p65Var2 = p65Var5;
            } else {
                p65Var2 = p65Var4;
                z3 = true;
                z4 = false;
                lgbVar2 = lgbVar;
                p65Var2.Y(1645040590);
            }
            p65Var2.p(z4);
            p65Var2.p(z3);
            p65Var2.p(z3);
            p65Var2.p(z3);
            boolean zBooleanValue = ((Boolean) l78VarJ.getValue()).booleanValue();
            nib nibVar = lgbVar2.c;
            vx0.c0(f76.F(nibVar), null, null, new jib(nibVar, zBooleanValue, null), 3);
            r28Var2 = o28Var3;
        } else {
            p65Var2.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var2.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 28, uidVar, bibVar, lgbVar, r28Var2);
        }
    }

    public static a0c D(String str, mo7 mo7Var, xzb[] xzbVarArr) {
        if (muc.b0(str)) {
            ay0.e("Blank serial names are prohibited");
            return null;
        }
        if (mo7Var.equals(wuc.e)) {
            ay0.e("For StructureKind.CLASS please use 'buildClassSerialDescriptor' instead");
            return null;
        }
        vn1 vn1Var = new vn1(str);
        return new a0c(str, mo7Var, vn1Var.b.size(), k80.Q0(xzbVarArr), vn1Var);
    }

    public static final String F(String str) {
        str.getClass();
        return (str.length() <= 0 || !muc.R(str, '-')) ? str : (String) bu1.H0(muc.o0(str, new char[]{'-'}));
    }

    public static l78 G() {
        return new k49(c1e.a, y3b.h);
    }

    public static final String H(String str) {
        str.getClass();
        List listP0 = muc.p0(str, new String[]{"-"}, 0, 6);
        if (listP0.size() >= 29 && g76.L((String) listP0.get(3), "digest.reader")) {
            Object obj = listP0.get(28);
            if (muc.b0((String) obj)) {
                obj = null;
            }
            String str2 = (String) obj;
            if (str2 != null) {
                return tuc.L(str2, "_", "-");
            }
        }
        return null;
    }

    public static sk0 I(View view) {
        if (Build.VERSION.SDK_INT >= 26) {
            return new sk0(epe.v(view));
        }
        return null;
    }

    public static final Field J(fj6 fj6Var) {
        fj6Var.getClass();
        mj6 mj6VarC = bpe.c(fj6Var);
        if (mj6VarC != null) {
            return (Field) mj6VarC.l.getValue();
        }
        return null;
    }

    public static final Method K(qh6 qh6Var) {
        v41 v41VarV;
        qh6Var.getClass();
        vg6 vg6VarA = bpe.a(qh6Var);
        Member memberB = (vg6VarA == null || (v41VarV = vg6VarA.v()) == null) ? null : v41VarV.b();
        if (memberB instanceof Method) {
            return (Method) memberB;
        }
        return null;
    }

    public static final void L(l78 l78Var) {
        l78Var.setValue(c1e.a);
    }

    public static boolean M(ParagraphData paragraphData) {
        ParagraphType type = paragraphData.getType();
        if (type != null) {
            switch (m19.a[type.ordinal()]) {
                case 1:
                case 2:
                case 3:
                case 6:
                case 7:
                case 8:
                case 11:
                case 12:
                case 13:
                case 14:
                case 15:
                    String text = paragraphData.getText();
                    if (text == null || text.length() == 0) {
                        return true;
                    }
                    break;
            }
        }
        return bu1.p0(l09.i, paragraphData.getType());
    }

    public static final ArrayList N(Map map, x45 x45Var) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            aa8 aa8Var = (aa8) entry.getValue();
            Boolean boolValueOf = aa8Var != null ? Boolean.valueOf(aa8Var.b) : null;
            boolValueOf.getClass();
            if (!boolValueOf.booleanValue() && !aa8Var.c) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        Set setKeySet = linkedHashMap.keySet();
        ArrayList arrayList = new ArrayList();
        for (Object obj : setKeySet) {
            if (((Boolean) x45Var.invoke((String) obj)).booleanValue()) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static final zyd P(String str) {
        int i;
        kyd.I(10);
        int length = str.length();
        if (length == 0) {
            return null;
        }
        int i2 = 0;
        char cCharAt = str.charAt(0);
        if (g76.Q(cCharAt, 48) < 0) {
            i = 1;
            if (length == 1 || cCharAt != '+') {
                return null;
            }
        } else {
            i = 0;
        }
        int i3 = 119304647;
        while (i < length) {
            int iDigit = Character.digit((int) str.charAt(i), 10);
            if (iDigit < 0) {
                return null;
            }
            int i4 = i2 ^ Integer.MIN_VALUE;
            if (Integer.compare(i4, i3 ^ Integer.MIN_VALUE) > 0) {
                if (i3 != 119304647 || Integer.compare(i4, -1717986919) > 0) {
                    return null;
                }
                i3 = 429496729;
            }
            int i5 = i2 * 10;
            int i6 = iDigit + i5;
            if (Integer.compare(i6 ^ Integer.MIN_VALUE, i5 ^ Integer.MIN_VALUE) < 0) {
                return null;
            }
            i++;
            i2 = i6;
        }
        return new zyd(i2);
    }

    public static final ezd Q(String str) {
        str.getClass();
        int i = 10;
        kyd.I(10);
        int length = str.length();
        if (length == 0) {
            return null;
        }
        int i2 = 0;
        char cCharAt = str.charAt(0);
        if (g76.Q(cCharAt, 48) < 0) {
            i2 = 1;
            if (length == 1 || cCharAt != '+') {
                return null;
            }
        }
        long j = 0;
        long j2 = 512409557603043100L;
        while (i2 < length) {
            int iDigit = Character.digit((int) str.charAt(i2), i);
            if (iDigit < 0) {
                return null;
            }
            long j3 = j ^ Long.MIN_VALUE;
            int i3 = length;
            if (Long.compare(j3, j2 ^ Long.MIN_VALUE) > 0) {
                if (j2 != 512409557603043100L || Long.compare(j3, -7378697629483820647L) > 0) {
                    return null;
                }
                j2 = 1844674407370955161L;
            }
            long j4 = j * 10;
            long j5 = (((long) iDigit) & 4294967295L) + j4;
            if (Long.compare(j5 ^ Long.MIN_VALUE, j4 ^ Long.MIN_VALUE) < 0) {
                return null;
            }
            i2++;
            j = j5;
            length = i3;
            i = 10;
        }
        return new ezd(j);
    }

    public static void R(Parcel parcel, int i, Bundle bundle) {
        if (bundle == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        parcel.writeBundle(bundle);
        d0(iC0, parcel);
    }

    public static void S(Parcel parcel, int i, byte[] bArr) {
        if (bArr == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        parcel.writeByteArray(bArr);
        d0(iC0, parcel);
    }

    public static void T(Parcel parcel, int i, Integer num) {
        if (num == null) {
            return;
        }
        a0(parcel, i, 4);
        parcel.writeInt(num.intValue());
    }

    public static void U(Parcel parcel, int i, Parcelable parcelable, int i2) {
        if (parcelable == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        parcelable.writeToParcel(parcel, i2);
        d0(iC0, parcel);
    }

    public static void V(Parcel parcel, int i, String str) {
        if (str == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        parcel.writeString(str);
        d0(iC0, parcel);
    }

    public static void W(Parcel parcel, int i, List list) {
        if (list == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        parcel.writeStringList(list);
        d0(iC0, parcel);
    }

    public static void X(Parcel parcel, int i, Parcelable[] parcelableArr, int i2) {
        if (parcelableArr == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        parcel.writeInt(parcelableArr.length);
        for (Parcelable parcelable : parcelableArr) {
            if (parcelable == null) {
                parcel.writeInt(0);
            } else {
                int iDataPosition = parcel.dataPosition();
                parcel.writeInt(1);
                int iDataPosition2 = parcel.dataPosition();
                parcelable.writeToParcel(parcel, i2);
                int iDataPosition3 = parcel.dataPosition();
                parcel.setDataPosition(iDataPosition);
                parcel.writeInt(iDataPosition3 - iDataPosition2);
                parcel.setDataPosition(iDataPosition3);
            }
        }
        d0(iC0, parcel);
    }

    public static void Y(Parcel parcel, int i, List list) {
        if (list == null) {
            return;
        }
        int iC0 = c0(i, parcel);
        int size = list.size();
        parcel.writeInt(size);
        for (int i2 = 0; i2 < size; i2++) {
            Parcelable parcelable = (Parcelable) list.get(i2);
            if (parcelable == null) {
                parcel.writeInt(0);
            } else {
                int iDataPosition = parcel.dataPosition();
                parcel.writeInt(1);
                int iDataPosition2 = parcel.dataPosition();
                parcelable.writeToParcel(parcel, 0);
                int iDataPosition3 = parcel.dataPosition();
                parcel.setDataPosition(iDataPosition);
                parcel.writeInt(iDataPosition3 - iDataPosition2);
                parcel.setDataPosition(iDataPosition3);
            }
        }
        d0(iC0, parcel);
    }

    public static rkg Z(pkg pkgVar) {
        ujf ujfVar = pkgVar.i;
        tkg tkgVar = new tkg(((qvg) ujfVar.b).b());
        try {
            mag magVar = vkg.c;
            Provider providerJ0 = n01.j0();
            if (providerJ0 == null) {
                throw new GeneralSecurityException("Conscrypt not available");
            }
            Mac.getInstance("AESCMAC", providerJ0);
            return new d2f(tkgVar, 28, new vkg(((qvg) ujfVar.b).b(), providerJ0));
        } catch (GeneralSecurityException unused) {
            return tkgVar;
        }
    }

    public static final void a(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1710812417);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            c(null, p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, 48.0f));
            d(null, p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, 48.0f));
            B(null, p65Var, 0);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 10);
        }
    }

    public static void a0(Parcel parcel, int i, int i2) {
        parcel.writeInt(i | (i2 << 16));
    }

    public static final void b(xn7 xn7Var, mz1 mz1Var, x12 x12Var, int i) {
        String str;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1007227314);
        int i2 = (p65Var.d(xn7Var.ordinal()) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            int i3 = eo7.a[xn7Var.ordinal()];
            if (i3 == 1) {
                str = "L";
            } else if (i3 == 2) {
                str = "M";
            } else if (i3 == 3) {
                str = "S";
            } else {
                if (i3 != 4) {
                    ygf.a();
                    return;
                }
                str = "XS";
            }
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.e, z46.m, p65Var, 6);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            mz1Var.k(Boolean.TRUE, str.concat(" - Enabled"), p65Var, 390);
            hp7.t(p65Var, jfc.p(o28Var, 16.0f));
            mz1Var.k(Boolean.FALSE, str.concat(" - Disabled"), p65Var, 390);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(xn7Var, mz1Var, i, 24);
        }
    }

    public static int b0(int i) {
        return (i >>> 1) ^ (-(i & 1));
    }

    public static final void c(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1383012615);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            r28Var2 = o28Var;
            jjd.b("Common", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 6, 0, 131070);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(r28Var2, 24.0f));
            p65Var.Y(-1915561684);
            for (xn7 xn7Var : xn7.getEntries()) {
                b(xn7Var, pxf.E(-1168607244, new zn7(xn7Var, 0), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(-1915554482);
            for (xn7 xn7Var2 : xn7.getEntries()) {
                b(xn7Var2, pxf.E(-251627349, new zn7(xn7Var2, 1), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(-1915547222);
            for (xn7 xn7Var3 : xn7.getEntries()) {
                b(xn7Var3, pxf.E(-58696148, new zn7(xn7Var3, 2), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 11);
        }
    }

    public static int c0(int i, Parcel parcel) {
        parcel.writeInt(i | (-65536));
        parcel.writeInt(0);
        return parcel.dataPosition();
    }

    public static final void d(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-535701608);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            r28Var2 = o28Var;
            jjd.b("Error", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 6, 0, 131070);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(r28Var2, 24.0f));
            p65Var.Y(171667517);
            for (xn7 xn7Var : xn7.getEntries()) {
                b(xn7Var, pxf.E(-1914258627, new zn7(xn7Var, 4), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(171674656);
            for (xn7 xn7Var2 : xn7.getEntries()) {
                b(xn7Var2, pxf.E(-1469036634, new zn7(xn7Var2, 5), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.Y(171681884);
            for (xn7 xn7Var3 : xn7.getEntries()) {
                b(xn7Var3, pxf.E(-1601360379, new zn7(xn7Var3, 6), p65Var), p65Var, 48);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 13);
        }
    }

    public static void d0(int i, Parcel parcel) {
        int iDataPosition = parcel.dataPosition();
        parcel.setDataPosition(i - 4);
        parcel.writeInt(iDataPosition - i);
        parcel.setDataPosition(iDataPosition);
    }

    public static final void e(String str, lgb lgbVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        o28 o28Var;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-142534032);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(lgbVar) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var2 = o28.b;
            r28 r28VarD = jfc.d(o28Var2, 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarE = w2g.E(flb.a0(r28VarD, ((zo7) p65Var.j(sn3Var)).c, rv8.r), 0.0f, 2.0f, 1);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            jjd.b(vo7.Q(R.string.response_write_replying_to, new Object[]{str}, p65Var), w2g.G(new sq6(1.0f, true), 16.0f, 0.0f, 8.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).n, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                o28Var = o28Var2;
                z = true;
                objM = new k8e(0, lgbVar, lgb.class, "onWriteResponseCancelButtonClicked", "onWriteResponseCancelButtonClicked()V", 0, 28);
                p65Var.j0(objM);
            } else {
                o28Var = o28Var2;
                z = true;
            }
            r28Var2 = o28Var;
            k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, (m45) ((qh6) objM), xn7.S, w2g.G(o28Var, 0.0f, 0.0f, 4.0f, 0.0f, 11), vo7.R(p65Var, R.string.common_cancel), false, false);
            p65Var.p(z);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pfe(str, lgbVar, r28Var2, i);
        }
    }

    public static boolean e0(byte b2) {
        return b2 > -65;
    }

    public static final void f(ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(583614861);
        int i2 = (p65Var.f(responsesViewModel$WriteState$Highlight) ? 4 : 2) | i | 48;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(bo.B(r28VarD, 1.0f, ((zo7) p65Var.j(sn3Var)).z, bmb.a(3.0f)), ((zo7) p65Var.j(sn3Var)).a, bmb.a(3.0f));
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.c(w2g.y(responsesViewModel$WriteState$Highlight.getStartOffset(), responsesViewModel$WriteState$Highlight.getEndOffset(), 0, p65Var, responsesViewModel$WriteState$Highlight.getParagraphText(), responsesViewModel$WriteState$Highlight.getParagraphMarkups()), bgf.N(jfc.d(w2g.C(o28Var, 16.0f), 1.0f), "quote"), 0L, 0L, 0L, null, 0L, 2, false, 2, 0, null, null, ((bu7) p65Var.j(jt7.c)).t, p65Var, 48, 24960, 241660);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new xre(responsesViewModel$WriteState$Highlight, r28Var2, i, 2);
        }
    }

    public static final void g(DarkMode darkMode, DarkMode darkMode2, x45 x45Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        int i2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2010780651);
        int i4 = i | (p65Var.d(darkMode.ordinal()) ? 4 : 2) | (p65Var.h(x45Var) ? 256 : 128) | 3072;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(darkMode);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            vkb vkbVar = new vkb(3);
            int i6 = i4 & 896;
            boolean z = i6 == 256;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new ukd(darkMode2, x45Var, l78Var, i5);
                p65Var.j0(objM2);
            }
            r28 r28VarR = hlg.r(r28VarD, false, null, vkbVar, (m45) objM2, 11);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i7 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            boolean z2 = ((DarkMode) l78Var.getValue()) == darkMode2;
            boolean z3 = i6 == 256;
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                objM3 = new nbb(x45Var, 21, darkMode2);
                p65Var.j0(objM3);
            }
            mr7.a(z2, (m45) objM3, null, false, null, null, p65Var, 0, 60);
            int i8 = vkd.a[darkMode2.ordinal()];
            if (i8 == 1) {
                i2 = 404834057;
                i3 = R.string.settings_dark_mode_dark;
            } else if (i8 == 2) {
                i2 = 404836714;
                i3 = R.string.settings_dark_mode_light;
            } else if (i8 == 3) {
                i2 = 404839666;
                i3 = R.string.settings_dark_mode_follow_system;
            } else {
                if (i8 != 4) {
                    throw ho2.L(p65Var, 404832617, false);
                }
                i2 = 404842833;
                i3 = R.string.settings_dark_mode_auto_battery;
            }
            jjd.b(km4.w(p65Var, i2, i3, p65Var, false), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 0, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 16, darkMode, darkMode2, x45Var, r28Var2);
        }
    }

    public static final void h(xn7 xn7Var, r28 r28Var, long j, x12 x12Var, int i, int i2) {
        int i3;
        long j2;
        xn7Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-352117829);
        if ((i & 6) == 0) {
            i3 = (p65Var.d(xn7Var.ordinal()) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= ((i2 & 4) == 0 && p65Var.e(j)) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                if ((i2 & 4) != 0) {
                    j2 = ((zo7) p65Var.j(kt7.b)).c;
                }
                p65Var.q();
                dy0.a(flb.a0(jfc.e(jfc.b(r28Var, 0.0f, 24.0f, 1), xn7Var.getContentPadding().a() + xn7Var.getContentPadding().d() + ((m73) p65Var.j(z22.h)).z(((mkd) xn7Var.getTextStyle().invoke(p65Var, 0)).b.c)), j2, bmb.a(xn7Var.m180getCornerSizeD9Ej5fM())), p65Var, 0);
            } else {
                p65Var.S();
            }
            j2 = j;
            p65Var.q();
            dy0.a(flb.a0(jfc.e(jfc.b(r28Var, 0.0f, 24.0f, 1), xn7Var.getContentPadding().a() + xn7Var.getContentPadding().d() + ((m73) p65Var.j(z22.h)).z(((mkd) xn7Var.getTextStyle().invoke(p65Var, 0)).b.c)), j2, bmb.a(xn7Var.m180getCornerSizeD9Ej5fM())), p65Var, 0);
        } else {
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk0(xn7Var, r28Var, j2, i, i2, 4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void i(defpackage.m45 r19, java.lang.String r20, defpackage.xn7 r21, defpackage.r28 r22, boolean r23, defpackage.x12 r24, int r25, int r26) {
        /*
            Method dump skipped, instruction units count: 267
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.i(m45, java.lang.String, xn7, r28, boolean, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(defpackage.m45 r19, java.lang.String r20, defpackage.xn7 r21, defpackage.r28 r22, boolean r23, defpackage.g11 r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 402
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.j(m45, java.lang.String, xn7, r28, boolean, g11, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:103:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x016d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k(int r22, int r23, defpackage.g11 r24, defpackage.x12 r25, defpackage.m45 r26, defpackage.xn7 r27, defpackage.r28 r28, java.lang.String r29, boolean r30, boolean r31) {
        /*
            Method dump skipped, instruction units count: 395
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.k(int, int, g11, x12, m45, xn7, r28, java.lang.String, boolean, boolean):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.m45 r17, java.lang.String r18, defpackage.xn7 r19, defpackage.r28 r20, boolean r21, defpackage.x12 r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.l(m45, java.lang.String, xn7, r28, boolean, x12, int, int):void");
    }

    public static final void m(m45 m45Var, String str, xn7 xn7Var, r28 r28Var, boolean z, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        String str2;
        r28 r28Var2;
        long jB;
        m45Var.getClass();
        xn7Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1924915229);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.d(xn7Var.ordinal()) ? 256 : 128;
        }
        int i3 = i2 | 3072;
        if ((i & 24576) == 0) {
            i3 |= p65Var.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            jy8 jy8Var = h11.a;
            long j = uu1.g;
            sn3 sn3Var = kt7.b;
            g11 g11VarA = h11.a(j, ((zo7) p65Var.j(sn3Var)).u, j, uu1.b(0.5f, ((zo7) p65Var.j(sn3Var)).u), p65Var, 0);
            if (z) {
                p65Var.Y(1254471169);
                jB = ((zo7) p65Var.j(sn3Var)).D;
                p65Var.p(false);
            } else {
                p65Var.Y(1254539865);
                jB = uu1.b(0.5f, ((zo7) p65Var.j(sn3Var)).D);
                p65Var.p(false);
            }
            int i4 = (i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION) | ((i3 << 3) & 458752) | ((i3 << 9) & 3670016);
            o28 o28Var = o28.b;
            p(m45Var2, str2, xn7Var, g11VarA, jB, z, o28Var, p65Var, i4);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mq(m45Var, str, xn7Var, r28Var2, z, i);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:50:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(defpackage.m45 r17, java.lang.String r18, defpackage.xn7 r19, defpackage.r28 r20, boolean r21, defpackage.x12 r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.n(m45, java.lang.String, xn7, r28, boolean, x12, int, int):void");
    }

    public static final void o(m45 m45Var, String str, xn7 xn7Var, g11 g11Var, boolean z, r28 r28Var, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        String str2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-33412190);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.d(xn7Var.ordinal()) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(g11Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            f76.g(m45Var2, jfc.b(r28Var, 0.0f, 24.0f, 1), z, bmb.a(xn7Var.m180getCornerSizeD9Ej5fM()), g11Var, null, null, xn7Var.getContentPadding(), pxf.E(-529998414, new do7(0, z ? g11Var.b : g11Var.d, xn7Var, str2), p65Var), p65Var, (i2 & 14) | 805502976 | ((i2 >> 6) & 896) | ((i2 << 3) & 57344), AviDirectory.TAG_DATETIME_ORIGINAL);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(m45Var, str, xn7Var, g11Var, z, r28Var, i, 6);
        }
    }

    public static final void p(m45 m45Var, String str, xn7 xn7Var, g11 g11Var, long j, boolean z, r28 r28Var, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        String str2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1897734777);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.d(xn7Var.ordinal()) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(g11Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.e(j) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.f(r28Var) ? 1048576 : 524288;
        }
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            int i3 = i2;
            f76.s(m45Var2, jfc.b(r28Var, 0.0f, 24.0f, 1), z, bmb.a(xn7Var.m180getCornerSizeD9Ej5fM()), g11Var, k40.b(1.0f, j), xn7Var.getContentPadding(), pxf.E(-1221894201, new do7(1, z ? g11Var.b : g11Var.d, xn7Var, str2), p65Var), p65Var, ((i3 << 3) & 57344) | (i3 & 14) | 805502976 | ((i3 >> 9) & 896), 256);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lq(m45Var, str, xn7Var, g11Var, j, z, r28Var, i, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:77:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void q(int r20, int r21, defpackage.g11 r22, defpackage.x12 r23, defpackage.m45 r24, final defpackage.xn7 r25, defpackage.r28 r26, java.lang.String r27, boolean r28, boolean r29) {
        /*
            Method dump skipped, instruction units count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.q(int, int, g11, x12, m45, xn7, r28, java.lang.String, boolean, boolean):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void r(defpackage.m45 r17, java.lang.String r18, defpackage.xn7 r19, defpackage.r28 r20, boolean r21, defpackage.x12 r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.r(m45, java.lang.String, xn7, r28, boolean, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:96:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(defpackage.wv7 r16, defpackage.rv7 r17, defpackage.r28 r18, defpackage.x12 r19, int r20, int r21) {
        /*
            Method dump skipped, instruction units count: 509
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo7.s(wv7, rv7, r28, x12, int, int):void");
    }

    public static final void t(String str, String str2, String str3, a aVar, r28 r28Var, yv7 yv7Var, x12 x12Var, int i) {
        r28 r28Var2;
        yv7 yv7Var2;
        r28 r28Var3;
        int i2;
        yv7 yv7Var3;
        b09.I(str, str2, str3);
        p65 p65Var = (p65) x12Var;
        p65Var.a0(221025928);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.f(aVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 90112;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new ta4(i4, str, str2, str3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                yv7 yv7Var4 = (yv7) to7.z(n1b.a.b(yv7.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                r28Var3 = o28.b;
                i2 = i3 & (-458753);
                yv7Var3 = yv7Var4;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                i2 = i3 & (-458753);
                yv7Var3 = yv7Var;
            }
            p65Var.q();
            s((wv7) guc.z(yv7Var3.g, p65Var, 0).getValue(), aVar, r28Var3, p65Var, (i2 >> 6) & PhotoshopDirectory.TAG_CAPTION, 0);
            String str4 = yv7Var3.h;
            String str5 = yv7Var3.d;
            if (!yv7Var3.k) {
                yv7Var3.k = true;
                ty2 ty2Var = yv7Var3.e;
                String str6 = yv7Var3.b;
                String str7 = yv7Var3.j;
                ty2Var.getClass();
                str6.getClass();
                str5.getClass();
                str7.getClass();
                str4.getClass();
                rqd.a(ty2Var.a, new PostMocLabelInformationViewed(null, str6, null, 5, null), str5, str7, false, null, str4, 24);
                yv7Var3.f.j(str5, gp7.u(yv7Var3.i), str4);
            }
            r28Var2 = r28Var3;
            yv7Var2 = yv7Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            yv7Var2 = yv7Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, str3, aVar, r28Var2, yv7Var2, i, 15);
        }
    }

    public static final void u(final on9 on9Var, final ek8 ek8Var, x12 x12Var, int i) {
        int i2;
        int i3;
        final int i4;
        String str = on9Var.h;
        String strD = on9Var.f;
        int i5 = on9Var.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(888068199);
        int i6 = (p65Var.f(on9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i6 & 1, (i6 & 19) != 18)) {
            String str2 = on9Var.d;
            boolean z = on9Var.a;
            kx kxVarW = ho2.w(p65Var, -1264942776);
            if (i5 == 1) {
                p65Var.Y(-916135847);
                p65Var.p(false);
                i3 = 1;
            } else {
                i3 = 1;
                p65Var.Y(-916134383);
                int i7 = i5 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i7, new Object[]{strD, Integer.valueOf(i7)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i3] = str;
            String strQ = vo7.Q(R.string.notification_type_post_reposted, objArr, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strD, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, strD.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = on9Var.b;
                int i8 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i9 = i6 & 14;
                int i10 = (i8 == 32 ? i3 : 0) | (i9 == 4 ? i3 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i10 != 0 || objM == uobVar) {
                    i4 = 0;
                    objM = new m45() { // from class: pn9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i11 = i4;
                            c1e c1eVar = c1e.a;
                            on9 on9Var2 = on9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i11) {
                                case 0:
                                    ek8Var2.n(on9Var2.c, on9Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(on9Var2.e, on9Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                } else {
                    i4 = 0;
                }
                m45 m45Var = (m45) objM;
                int i11 = i8 == 32 ? i3 : i4;
                if (i9 == 4) {
                    i4 = i3;
                }
                int i12 = i11 | i4;
                Object objM2 = p65Var.M();
                if (i12 != 0 || objM2 == uobVar) {
                    final int i13 = i3;
                    objM2 = new m45() { // from class: pn9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i112 = i13;
                            c1e c1eVar = c1e.a;
                            on9 on9Var2 = on9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i112) {
                                case 0:
                                    ek8Var2.n(on9Var2.c, on9Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(on9Var2.e, on9Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                i2 = 14;
                rv8.f(z, str2, null, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 36);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i2 = 14;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(on9Var, ek8Var, i, i2);
        }
    }

    public static final void v(long j, mkd mkdVar, b55 b55Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-684938728);
        if ((i & 6) == 0) {
            i2 = (p65Var.e(j) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(mkdVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(b55Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            sn3 sn3Var = jjd.a;
            k40.d(new o10[]{b09.q(j, c82.a), sn3Var.a(((mkd) p65Var.j(sn3Var)).d(mkdVar))}, b55Var, p65Var, ((i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new be1(j, mkdVar, b55Var, i);
        }
    }

    public static final void w(int i, int i2, x12 x12Var, m45 m45Var, r28 r28Var, String str, String str2) {
        m45 m45Var2;
        int i3;
        r28 r28Var2;
        m45 m45Var3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-169233017);
        int i4 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2 != null ? new ax5(str2) : null) ? 32 : 16);
        int i5 = i4 | 384;
        int i6 = i2 & 8;
        if (i6 != 0) {
            i3 = i4 | 3456;
            m45Var2 = m45Var;
        } else {
            m45Var2 = m45Var;
            i3 = i5 | (p65Var.h(m45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            m45 m45Var4 = i6 != 0 ? null : m45Var2;
            amb ambVarA = bmb.a(4.0f);
            o28 o28Var = o28.b;
            r28 r28VarY = r40.y(o28Var, ambVarA);
            if (m45Var4 != null) {
                r28VarY = hlg.r(r28VarY, false, null, null, m45Var4, 15);
            }
            m45 m45Var5 = m45Var4;
            r28 r28VarG = w2g.G(jfc.o(r28VarY, 48.0f, 48.0f, 0.0f, 0.0f, 12), 12.0f, 0.0f, 12.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.e, z46.n, p65Var, 54);
            long j = p65Var.T;
            int i7 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            hp7.o(str2, as7.a, null, null, null, 0.0f, 0, null, null, p65Var, ((i3 >> 3) & 14) | 48, 2044);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(jt7.c)).j, p65Var, i3 & 14, 24960, 110590);
            p65Var = p65Var;
            p65Var.p(true);
            m45Var3 = m45Var5;
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            m45Var3 = m45Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rma(str, str2, r28Var2, m45Var3, i, i2);
        }
    }

    public static final void x(uid uidVar, bib bibVar, lgb lgbVar, boolean z, r28 r28Var, x12 x12Var, int i) {
        int i2;
        lgb lgbVar2;
        akc akcVar;
        lr4 lr4Var;
        uob uobVar;
        Object hgbVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(665212387);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(uidVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(bibVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            lgbVar2 = lgbVar;
            i2 |= p65Var.f(lgbVar2) ? 256 : 128;
        } else {
            lgbVar2 = lgbVar;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            akc akcVar2 = (akc) p65Var.j(z22.r);
            lr4 lr4Var2 = (lr4) p65Var.j(z22.i);
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                objM = ka1.g(p65Var);
            }
            sr4 sr4Var = (sr4) objM;
            fv1 fv1Var = (fv1) p65Var.j(iv1.a);
            ekd ekdVar = (ekd) p65Var.j(fkd.a);
            thd thdVar = fv1Var.j0;
            if (thdVar != null) {
                ekd ekdVar2 = thdVar.k;
                if (g76.L(ekdVar2, ekdVar)) {
                    akcVar = akcVar2;
                    lr4Var = lr4Var2;
                } else {
                    akcVar = akcVar2;
                    lr4Var = lr4Var2;
                    thdVar = new thd(thdVar.a, thdVar.b, thdVar.c, thdVar.d, thdVar.e, thdVar.f, thdVar.g, thdVar.h, thdVar.i, thdVar.j, ekdVar == null ? ekdVar2 : ekdVar, thdVar.l, thdVar.m, thdVar.n, thdVar.o, thdVar.p, thdVar.q, thdVar.r, thdVar.s, thdVar.t, thdVar.u, thdVar.v, thdVar.w, thdVar.x, thdVar.y, thdVar.z, thdVar.A, thdVar.B, thdVar.C, thdVar.D, thdVar.E, thdVar.F, thdVar.G, thdVar.H, thdVar.I, thdVar.J, thdVar.K, thdVar.L, thdVar.M, thdVar.N, thdVar.O, thdVar.P, thdVar.Q);
                    fv1Var.j0 = thdVar;
                }
            } else {
                akcVar = akcVar2;
                lr4Var = lr4Var2;
                long jC = iv1.c(fv1Var, wh4.x);
                long jC2 = iv1.c(fv1Var, wh4.C);
                gv1 gv1Var = wh4.f;
                long jC3 = iv1.c(fv1Var, gv1Var);
                float f = wh4.g;
                long jB = uu1.b(f, jC3);
                long jC4 = iv1.c(fv1Var, wh4.r);
                gv1 gv1Var2 = wh4.c;
                long jC5 = iv1.c(fv1Var, gv1Var2);
                long jC6 = iv1.c(fv1Var, gv1Var2);
                long jC7 = iv1.c(fv1Var, gv1Var2);
                long jC8 = iv1.c(fv1Var, gv1Var2);
                long jC9 = iv1.c(fv1Var, wh4.b);
                long jC10 = iv1.c(fv1Var, wh4.q);
                long jC11 = iv1.c(fv1Var, wh4.w);
                long jC12 = iv1.c(fv1Var, wh4.a);
                long jB2 = uu1.b(wh4.e, iv1.c(fv1Var, wh4.d));
                long jC13 = iv1.c(fv1Var, wh4.p);
                long jC14 = iv1.c(fv1Var, wh4.z);
                long jC15 = iv1.c(fv1Var, wh4.H);
                long jB3 = uu1.b(wh4.k, iv1.c(fv1Var, wh4.j));
                long jC16 = iv1.c(fv1Var, wh4.t);
                long jC17 = iv1.c(fv1Var, wh4.B);
                long jC18 = iv1.c(fv1Var, wh4.J);
                long jB4 = uu1.b(wh4.o, iv1.c(fv1Var, wh4.n));
                long jC19 = iv1.c(fv1Var, wh4.v);
                long jC20 = iv1.c(fv1Var, wh4.y);
                long jC21 = iv1.c(fv1Var, wh4.G);
                long jB5 = uu1.b(wh4.i, iv1.c(fv1Var, wh4.h));
                long jC22 = iv1.c(fv1Var, wh4.s);
                gv1 gv1Var3 = wh4.D;
                long jC23 = iv1.c(fv1Var, gv1Var3);
                long jC24 = iv1.c(fv1Var, gv1Var3);
                long jB6 = uu1.b(f, iv1.c(fv1Var, gv1Var));
                long jC25 = iv1.c(fv1Var, gv1Var3);
                long jC26 = iv1.c(fv1Var, wh4.A);
                long jC27 = iv1.c(fv1Var, wh4.I);
                long jB7 = uu1.b(wh4.m, iv1.c(fv1Var, wh4.l));
                long jC28 = iv1.c(fv1Var, wh4.u);
                gv1 gv1Var4 = wh4.E;
                long jC29 = iv1.c(fv1Var, gv1Var4);
                long jC30 = iv1.c(fv1Var, gv1Var4);
                long jB8 = uu1.b(f, iv1.c(fv1Var, gv1Var4));
                long jC31 = iv1.c(fv1Var, gv1Var4);
                gv1 gv1Var5 = wh4.F;
                thdVar = new thd(jC, jC2, jB, jC4, jC5, jC6, jC7, jC8, jC9, jC10, ekdVar, jC11, jC12, jB2, jC13, jC14, jC15, jB3, jC16, jC17, jC18, jB4, jC19, jC20, jC21, jB5, jC22, jC23, jC24, jB6, jC25, jC26, jC27, jB7, jC28, jC29, jC30, jB8, jC31, iv1.c(fv1Var, gv1Var5), iv1.c(fv1Var, gv1Var5), uu1.b(f, iv1.c(fv1Var, gv1Var5)), iv1.c(fv1Var, gv1Var5));
                fv1Var.j0 = thdVar;
            }
            long j = thdVar.i;
            r28 r28VarD = w2g.D(flb.a0(r28Var, ((zo7) p65Var.j(kt7.b)).c, bmb.a(4.0f)), 12.0f, 10.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight = bibVar.j;
            o28 o28Var = o28.b;
            if (responsesViewModel$WriteState$Highlight != null) {
                p65Var.Y(-1039381524);
                f(bibVar.j, null, p65Var, 0);
                lv8.y(o28Var, 16.0f, p65Var, false);
            } else {
                p65Var.Y(-1046964651);
                p65Var.p(false);
            }
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).m;
            r28 r28VarF = t40.F(jfc.d(o28Var, 1.0f), sr4Var);
            boolean z2 = (i2 & 896) == 256;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar2) {
                uobVar = uobVar2;
                hgbVar = new hgb(1, lgbVar2, lgb.class, "onWriteResponseValueChanged", "onWriteResponseValueChanged(Landroidx/compose/ui/text/input/TextFieldValue;)V", 0, 22);
                p65Var.j0(hgbVar);
            } else {
                hgbVar = objM2;
                uobVar = uobVar2;
            }
            qh6 qh6Var = (qh6) hgbVar;
            int i4 = z ? 10 : 1;
            sk6 sk6Var = sk6.f;
            uob uobVar3 = uobVar;
            akc akcVar3 = akcVar;
            lr4 lr4Var3 = lr4Var;
            yo0.a(uidVar, (x45) qh6Var, r28VarF, false, mkdVar, sk6.a(3, 0, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER), null, false, i4, 0, null, null, new dkc(j), pxf.E(-1083108272, new dyc(uidVar, 11, mkdVar), p65Var), p65Var, i2 & 14, 196608, 15768);
            p65Var.p(true);
            Boolean boolValueOf = Boolean.valueOf(bibVar.i);
            boolean zF = p65Var.f(akcVar3) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.h(lr4Var3);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar3) {
                ya2 ya2Var = new ya2(bibVar, sr4Var, akcVar3, lr4Var3, null, 2);
                p65Var.j0(ya2Var);
                objM3 = ya2Var;
            }
            kyd.k(p65Var, (b55) objM3, boolValueOf);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mq(uidVar, bibVar, lgbVar, z, r28Var, i);
        }
    }

    public static final void y(boolean z, boolean z2, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1318971722);
        int i2 = i | (p65Var.g(z) ? 4 : 2) | (p65Var.g(z2) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            if (z) {
                p65Var.Y(1170288892);
                xz5.o(w2g.C(jfc.l(o28Var, 38.0f), 7.0f), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 2.0f, ((zo7) p65Var.j(kt7.b)).d, 0L, 0, p65Var, 384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(false);
            } else {
                p65Var.Y(1169425604);
                k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(2009949905, new pv0(z2, m45Var, 8), p65Var), p65Var, 56);
                p65Var.p(false);
            }
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dma(z, z2, m45Var, r28Var2, i);
        }
    }

    public static final void z(k9d k9dVar, b55 b55Var, b55 b55Var2, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        k9dVar.getClass();
        String str = k9dVar.b;
        b55Var.getClass();
        b55Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1510942082);
        int i2 = i | (p65Var2.f(k9dVar) ? 4 : 2) | (p65Var2.h(b55Var) ? 32 : 16) | (p65Var2.h(b55Var2) ? 256 : 128) | 3072;
        int i3 = 0;
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            b55Var.invoke(k9dVar.a, k9dVar.d);
            p65Var2.Y(316410782);
            amb ambVar = bmb.a;
            o28 o28Var = o28.b;
            r28 r28VarY = r40.y(o28Var, ambVar);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarY, ((zo7) p65Var2.j(sn3Var)).b, rv8.r);
            if (k9dVar.c) {
                p65Var2.Y(-1426908895);
                r28VarA0 = bo.B(r28VarA0, 1.0f, ((zo7) p65Var2.j(sn3Var)).n, ambVar);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-1426792087);
                p65Var2.p(false);
            }
            r28 r28Var3 = r28VarA0;
            p65Var2.p(false);
            boolean z = ((i2 & 896) == 256) | ((i2 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new i9d(b55Var2, k9dVar, i3);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            jjd.b(str, bgf.N(w2g.F(hlg.r(r28Var3, false, null, null, (m45) objM, 15), 16.0f, 9.0f, 16.0f, 9.0f), str), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var, 0, 0, 131068);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new j9d(k9dVar, b55Var, b55Var2, r28Var2, i, 0);
        }
    }

    public abstract void E();
}
