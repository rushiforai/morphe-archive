package defpackage;

import android.content.SharedPreferences;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.gms.internal.p000firebaseauthapi.zzqh;
import com.google.android.recaptcha.internal.zzuf;
import j$.util.DesugarCollections;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bxf {
    public final /* synthetic */ int a;
    public final List b;
    public final HashMap c;

    public bxf(List list, HashMap map, int i) throws GeneralSecurityException {
        this.a = i;
        boolean z = false;
        switch (i) {
            case 1:
                this.b = list;
                this.c = map;
                if (((AtomicBoolean) xjg.a.a).get()) {
                    HashSet hashSet = new HashSet();
                    Iterator it2 = list.iterator();
                    while (it2.hasNext()) {
                        hjg hjgVar = (hjg) it2.next();
                        int i2 = hjgVar.c;
                        if (hashSet.contains(Integer.valueOf(i2))) {
                            StringBuilder sb = new StringBuilder(String.valueOf(i2).length() + PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE);
                            sb.append("KeyID ");
                            sb.append(i2);
                            sb.append(" is duplicated in the keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing.");
                            throw new GeneralSecurityException(sb.toString());
                        }
                        hashSet.add(Integer.valueOf(i2));
                        z |= hjgVar.d;
                    }
                    if (z) {
                        return;
                    }
                    ygf.l("Primary key id not found in keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing.");
                    throw null;
                }
                return;
            default:
                this.b = list;
                this.c = map;
                if (y9g.a.a.get()) {
                    HashSet hashSet2 = new HashSet();
                    Iterator it3 = list.iterator();
                    while (it3.hasNext()) {
                        byf byfVar = (byf) it3.next();
                        int i3 = byfVar.d;
                        if (hashSet2.contains(Integer.valueOf(i3))) {
                            throw new GeneralSecurityException(ev6.w("KeyID ", i3, " is duplicated in the keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing."));
                        }
                        hashSet2.add(Integer.valueOf(i3));
                        if (byfVar.e) {
                            z = true;
                        }
                    }
                    if (z) {
                        return;
                    }
                    ygf.l("Primary key id not found in keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing.");
                    throw null;
                }
                return;
        }
    }

    public static gr7 a(qsg qsgVar) {
        nig nigVarM = m(qsgVar);
        fhg fhgVar = fhg.b;
        wig wigVar = (wig) fhgVar.a.get();
        wigVar.getClass();
        return !wigVar.b.containsKey(new zig(nig.class, (qvg) nigVarM.b)) ? new lgg(nigVarM) : fhgVar.a(nigVarM);
    }

    public static final bxf c(wjc wjcVar) throws GeneralSecurityException {
        int i;
        bzf bzfVarM = (bzf) wjcVar.b;
        if (bzfVarM == null) {
            try {
                bzfVarM = kk7.M((bzfVarM instanceof qgg ? (isg) ((qgg) bzfVarM).a.c : (isg) ((lig) fhg.b.d(bzfVarM)).c).c());
            } catch (GeneralSecurityException e) {
                throw new zzqh("Parsing parameters failed in getProto(). You probably want to call some Tink register function for ".concat(String.valueOf(bzfVarM)), e);
            }
        }
        o72 o72Var = new o72(6);
        ArrayList<wxf> arrayList = (ArrayList) o72Var.c;
        wxf wxfVar = new wxf(bzfVarM);
        no3 no3Var = no3.j;
        wxfVar.c = no3Var;
        wxfVar.a = true;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((wxf) it2.next()).a = false;
        }
        arrayList.add(wxfVar);
        if (o72Var.b) {
            ygf.l("KeysetHandle.Builder#build must only be called once");
            return null;
        }
        o72Var.b = true;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        for (int i2 = 0; i2 < arrayList.size() - 1; i2++) {
            if (((wxf) arrayList.get(i2)).c == no3Var && ((wxf) arrayList.get(i2 + 1)).c != no3Var) {
                ygf.l("Entries with 'withRandomId()' may only be followed by other entries with 'withRandomId()'.");
                return null;
            }
        }
        HashSet hashSet = new HashSet();
        Integer numValueOf = null;
        for (wxf wxfVar2 : arrayList) {
            wxfVar2.getClass();
            bzf bzfVar = wxfVar2.b;
            no3 no3Var2 = wxfVar2.c;
            if (no3Var2 == null) {
                ygf.l("No ID was set (with withFixedId or withRandomId)");
                return null;
            }
            if (no3Var2 == no3Var) {
                int i3 = 0;
                while (true) {
                    if (i3 != 0 && !hashSet.contains(Integer.valueOf(i3))) {
                        break;
                    }
                    Charset charset = ejg.a;
                    i3 = 0;
                    while (i3 == 0) {
                        byte[] bArrA = qig.a(4);
                        i3 = (bArrA[3] & 255) | ((bArrA[0] & 255) << 24) | ((bArrA[1] & 255) << 16) | ((bArrA[2] & 255) << 8);
                    }
                }
                i = i3;
            } else {
                i = 0;
            }
            if (hashSet.contains(Integer.valueOf(i))) {
                throw new GeneralSecurityException(ev6.w("Id ", i, " is used twice in the keyset"));
            }
            hashSet.add(Integer.valueOf(i));
            byf byfVar = new byf(zgg.b.b(bzfVar, bzfVar.a() ? Integer.valueOf(i) : null), dsg.ENABLED, i, wxfVar2.a, false);
            if (wxfVar2.a) {
                if (numValueOf != null) {
                    ygf.l("Two primaries were set");
                    return null;
                }
                numValueOf = Integer.valueOf(i);
            }
            arrayList2.add(byfVar);
        }
        if (numValueOf == null) {
            ygf.l("No primary was set");
            return null;
        }
        bxf bxfVar = new bxf(arrayList2, (HashMap) o72Var.d, 0);
        bxfVar.h();
        return bxfVar;
    }

    public static final bxf d(ujf ujfVar, kfg kfgVar, byte[] bArr) throws GeneralSecurityException, IOException {
        ByteArrayInputStream byteArrayInputStream = (ByteArrayInputStream) ujfVar.b;
        try {
            ptf ptfVar = ptf.a;
            dqg dqgVarT = dqg.t(byteArrayInputStream, ptfVar);
            byteArrayInputStream.close();
            if (dqgVarT.x().e() == 0) {
                ygf.l("empty keyset");
                return null;
            }
            try {
                ssg ssgVarW = ssg.w(kfgVar.b(dqgVarT.x().x(), bArr), ptfVar);
                if (ssgVarW == null || ssgVarW.t() <= 0) {
                    throw new GeneralSecurityException("empty keyset");
                }
                return e(ssgVarW);
            } catch (zzale unused) {
                ygf.l("invalid keyset, corrupted key material");
                return null;
            }
        } catch (Throwable th) {
            byteArrayInputStream.close();
            throw th;
        }
    }

    public static final bxf e(ssg ssgVar) throws GeneralSecurityException {
        gr7 lggVar;
        boolean z;
        if (ssgVar.t() <= 0) {
            ygf.l("empty keyset");
            return null;
        }
        ArrayList arrayList = new ArrayList(ssgVar.t());
        for (qsg qsgVar : ssgVar.B()) {
            int iT = qsgVar.t();
            try {
                lggVar = a(qsgVar);
                z = false;
            } catch (GeneralSecurityException e) {
                if (y9g.a.a.get()) {
                    throw e;
                }
                lggVar = new lgg(m(qsgVar));
                z = true;
            }
            gr7 gr7Var = lggVar;
            if (y9g.a.a.get() && !k(qsgVar.z())) {
                ygf.l("Parsing of a single key failed (wrong status) and Tink is configured via validateKeysetsOnParsing to reject such keysets.");
                return null;
            }
            arrayList.add(new byf(gr7Var, qsgVar.z(), iT, iT == ssgVar.z(), z));
        }
        return new bxf(DesugarCollections.unmodifiableList(arrayList), new HashMap(), 0);
    }

    public static boolean k(dsg dsgVar) {
        int i = fxf.a[dsgVar.ordinal()];
        return i == 1 || i == 2 || i == 3;
    }

    public static nig m(qsg qsgVar) {
        return nig.I(qsgVar.y().A(), qsgVar.y().z(), qsgVar.y().x(), qsgVar.B(), qsgVar.B() == ntg.RAW ? null : Integer.valueOf(qsgVar.t()));
    }

    public static List p(upg upgVar) {
        ur7 clgVar;
        boolean z;
        ArrayList arrayList = new ArrayList(upgVar.x());
        for (spg spgVar : upgVar.w()) {
            int iX = spgVar.x();
            try {
                ing ingVarQ = q(spgVar);
                gmg gmgVar = gmg.b;
                wng wngVar = (wng) gmgVar.a.get();
                wngVar.getClass();
                clgVar = !wngVar.b.containsKey(new tng(ing.class, (cmf) ingVarQ.b)) ? new clg(ingVarQ) : gmgVar.e(ingVarQ);
                z = false;
            } catch (GeneralSecurityException e) {
                if (((AtomicBoolean) xjg.a.a).get()) {
                    throw e;
                }
                clgVar = new clg(q(spgVar));
                z = true;
            }
            if (((AtomicBoolean) xjg.a.a).get() && !r(spgVar.B())) {
                ygf.l("Parsing of a single key failed (wrong status) and Tink is configured via validateKeysetsOnParsing to reject such keysets.");
                return null;
            }
            arrayList.add(new hjg(clgVar, spgVar.B(), iX, iX == upgVar.v(), z));
        }
        return DesugarCollections.unmodifiableList(arrayList);
    }

    public static ing q(spg spgVar) throws GeneralSecurityException {
        d1g d1gVar;
        e1g e1gVar;
        Integer numValueOf = spgVar.C() == 5 ? null : Integer.valueOf(spgVar.x());
        String strV = spgVar.w().v();
        pmf pmfVarW = spgVar.w().w();
        int iB = spgVar.w().B() - 2;
        if (iB == 0) {
            d1gVar = d1g.v;
        } else if (iB == 1) {
            d1gVar = d1g.w;
        } else if (iB == 2) {
            d1gVar = d1g.x;
        } else if (iB == 3) {
            d1gVar = d1g.y;
        } else {
            if (iB != 4) {
                throw new GeneralSecurityException("Unknown KeyMaterialType: ".concat(Integer.toString(iB)));
            }
            d1gVar = d1g.z;
        }
        int iC = spgVar.C() - 2;
        if (iC == 0) {
            e1gVar = e1g.j;
        } else if (iC == 1) {
            e1gVar = e1g.k;
        } else if (iC == 2) {
            e1gVar = e1g.l;
        } else if (iC == 3) {
            e1gVar = e1g.m;
        } else if (iC == 4) {
            e1gVar = e1g.n;
        } else {
            if (iC != 5) {
                throw new GeneralSecurityException("Unknown OutputPrefixType: ".concat(Integer.toString(iC)));
            }
            e1gVar = e1g.o;
        }
        return ing.k(strV, pmfVarW, d1gVar, e1gVar, numValueOf);
    }

    public static boolean r(int i) {
        int i2 = i - 2;
        return i2 == 1 || i2 == 2 || i2 == 3;
    }

    public Object b(twf twfVar, Class cls) throws GeneralSecurityException {
        ssg ssgVarO = o();
        int i = yzf.a;
        int iZ = ssgVarO.z();
        int i2 = 0;
        boolean z = true;
        int i3 = 0;
        boolean z2 = false;
        for (qsg qsgVar : ssgVarO.B()) {
            if (qsgVar.z() == dsg.ENABLED) {
                if (!qsgVar.C()) {
                    throw new GeneralSecurityException(String.format("key %d has no key data", Integer.valueOf(qsgVar.t())));
                }
                if (qsgVar.B() == ntg.UNKNOWN_PREFIX) {
                    throw new GeneralSecurityException(String.format("key %d has unknown prefix", Integer.valueOf(qsgVar.t())));
                }
                if (qsgVar.z() == dsg.UNKNOWN_STATUS) {
                    throw new GeneralSecurityException(String.format("key %d has unknown status", Integer.valueOf(qsgVar.t())));
                }
                if (qsgVar.t() == iZ) {
                    if (z2) {
                        ygf.l("keyset contains multiple primary keys");
                        return null;
                    }
                    z2 = true;
                }
                if (qsgVar.y().x() != zrg.ASYMMETRIC_PUBLIC) {
                    z = false;
                }
                i3++;
            }
        }
        if (i3 == 0) {
            ygf.l("keyset must contain at least one ENABLED key");
            return null;
        }
        if (!z2 && !z) {
            ygf.l("keyset doesn't contain a valid primary key");
            return null;
        }
        while (true) {
            List list = this.b;
            if (i2 >= list.size()) {
                return twfVar.p(this, cls);
            }
            if (((byf) list.get(i2)).f || !k(((byf) list.get(i2)).b)) {
                break;
            }
            i2++;
        }
        throw new GeneralSecurityException("Key parsing of key with index " + i2 + " and type_url " + ssgVarO.u(i2).y().A() + " failed, unable to get primitive");
    }

    public byf f(int i) {
        List list = this.b;
        if (i < 0 || i >= list.size()) {
            z10.i(ev6.v("Invalid index ", i, list.size(), " for keyset of size "));
            return null;
        }
        byf byfVar = (byf) list.get(i);
        if (!k(byfVar.b)) {
            ygf.f(ev6.w("Keyset-Entry at position ", i, " has wrong status"));
            return null;
        }
        if (!byfVar.f) {
            return (byf) list.get(i);
        }
        ygf.f(ev6.w("Keyset-Entry at position ", i, " didn't parse correctly"));
        return null;
    }

    public upg g() {
        int i;
        try {
            kpg kpgVarA = upg.A();
            for (hjg hjgVar : this.b) {
                ur7 ur7Var = hjgVar.a;
                int i2 = hjgVar.c;
                int i3 = hjgVar.f;
                ing ingVar = (ing) gmg.b.f(ur7Var);
                Integer numI = ur7Var.I();
                if (numI != null && numI.intValue() != i2) {
                    throw new GeneralSecurityException("Wrong ID set for key with ID requirement");
                }
                ppg ppgVarY = spg.y();
                bpg bpgVarX = epg.x();
                String str = (String) ingVar.a;
                bpgVarX.c();
                ((epg) bpgVarX.b).z(str);
                pmf pmfVar = (pmf) ingVar.c;
                bpgVarX.c();
                ((epg) bpgVarX.b).A(pmfVar);
                d1g d1gVar = (d1g) ingVar.d;
                int i4 = 6;
                if (d1gVar == d1g.v) {
                    i = 2;
                } else if (d1gVar == d1g.w) {
                    i = 3;
                } else if (d1gVar == d1g.x) {
                    i = 4;
                } else if (d1gVar == d1g.y) {
                    i = 5;
                } else {
                    if (d1gVar != d1g.z) {
                        throw new GeneralSecurityException("Unknown KeyMaterialType: ".concat(d1gVar.b));
                    }
                    i = 6;
                }
                bpgVarX.c();
                ((epg) bpgVarX.b).C(i);
                ppgVarY.c();
                ((spg) ppgVarY.b).z((epg) bpgVarX.e());
                ppgVarY.c();
                ((spg) ppgVarY.b).D(i3);
                ppgVarY.c();
                ((spg) ppgVarY.b).A(i2);
                e1g e1gVar = (e1g) ingVar.e;
                if (e1gVar == e1g.j) {
                    i4 = 2;
                } else if (e1gVar == e1g.k) {
                    i4 = 3;
                } else if (e1gVar == e1g.l) {
                    i4 = 4;
                } else if (e1gVar == e1g.m) {
                    i4 = 5;
                } else if (e1gVar != e1g.n) {
                    if (e1gVar != e1g.o) {
                        throw new GeneralSecurityException("Unknown OutputPrefixType: ".concat(e1gVar.b));
                    }
                    i4 = 7;
                }
                ppgVarY.c();
                ((spg) ppgVarY.b).E(i4);
                spg spgVar = (spg) ppgVarY.e();
                kpgVarA.c();
                ((upg) kpgVarA.b).C(spgVar);
                if (hjgVar.d) {
                    kpgVarA.c();
                    ((upg) kpgVarA.b).B(i2);
                }
            }
            return (upg) kpgVarA.e();
        } catch (GeneralSecurityException e) {
            throw new zzuf(e);
        }
    }

    public void h() {
        if (this.c.get(sgg.class) == null) {
            return;
        }
        rd6.m();
    }

    public void i(hha hhaVar) throws GeneralSecurityException, IOException {
        ssg ssgVarO = o();
        for (qsg qsgVar : ssgVarO.B()) {
            if (qsgVar.y().x() == zrg.UNKNOWN_KEYMATERIAL || qsgVar.y().x() == zrg.SYMMETRIC || qsgVar.y().x() == zrg.ASYMMETRIC_PRIVATE) {
                throw new GeneralSecurityException(lv8.r("keyset contains key material of type ", qsgVar.y().x().name(), " for type url ", qsgVar.y().A()));
            }
        }
        ByteArrayOutputStream byteArrayOutputStream = (ByteArrayOutputStream) hhaVar.a;
        try {
            ssg ssgVar = ssgVarO;
            int iA = ssgVar.a(null);
            boolean z = htf.b;
            if (iA > 4096) {
                iA = 4096;
            }
            jtf jtfVar = new jtf(byteArrayOutputStream, iA);
            ssgVar.k(jtfVar);
            if (jtfVar.e > 0) {
                jtfVar.x();
            }
        } finally {
            byteArrayOutputStream.close();
        }
    }

    public void j(d2f d2fVar, kfg kfgVar, byte[] bArr) throws GeneralSecurityException, IOException {
        ssg ssgVarO = o();
        byte[] bArrC = kfgVar.c(ssgVarO.c(), bArr);
        cqg cqgVarW = dqg.w();
        rsf rsfVarP = hsf.p(bArrC, 0, bArrC.length);
        cqgVarW.c();
        dqg.u((dqg) cqgVarW.b, rsfVarP);
        xsg xsgVarA = yzf.a(ssgVarO);
        cqgVarW.c();
        dqg.v((dqg) cqgVarW.b, xsgVarA);
        if (((SharedPreferences.Editor) d2fVar.b).putString((String) d2fVar.c, vn7.p0(((dqg) cqgVarW.b()).c())).commit()) {
            return;
        }
        ik4.g("Failed to write to SharedPreferences");
    }

    public bxf l() throws GeneralSecurityException {
        gr7 lggVar;
        boolean z;
        byf byfVar;
        ssg ssgVarO = o();
        List<byf> list = this.b;
        ArrayList arrayList = new ArrayList(list.size());
        int i = 0;
        for (byf byfVar2 : list) {
            gr7 gr7Var = byfVar2.a;
            if (gr7Var instanceof xdg) {
                gr7 gr7VarK = ((xdg) gr7Var).K();
                byfVar = new byf(gr7VarK, byfVar2.b, byfVar2.d, byfVar2.e, false);
                int i2 = byfVar2.d;
                Integer numJ = gr7VarK.J();
                if (numJ != null && numJ.intValue() != i2) {
                    ygf.l("Wrong ID set for key with ID requirement");
                    return null;
                }
            } else {
                qsg qsgVarU = ssgVarO.u(i);
                csg csgVarY = qsgVarU.y();
                if (csgVarY.x() != zrg.ASYMMETRIC_PRIVATE) {
                    ygf.l("The keyset contains a non-private key");
                    return null;
                }
                String strA = csgVarY.A();
                hsf hsfVarZ = csgVarY.z();
                int i3 = izf.a;
                bgg bggVarD = ufg.d.d(strA);
                if (!(bggVarD instanceof ngg)) {
                    throw new GeneralSecurityException(ev6.x("manager for key type ", strA, " is not a PrivateKeyManager"));
                }
                ngg nggVar = (ngg) bggVarD;
                nig nigVarI = nig.I(nggVar.a, hsfVarZ, nggVar.b, ntg.RAW, null);
                fhg fhgVar = fhg.b;
                gr7 gr7VarA = fhgVar.a(nigVarI);
                if (!(gr7VarA instanceof xdg)) {
                    ygf.l("Key not private key");
                    return null;
                }
                nig nigVar = (nig) fhgVar.c(((xdg) gr7VarA).K());
                asg asgVarT = csg.t();
                String str = (String) nigVar.a;
                asgVarT.c();
                csg.u((csg) asgVarT.b, str);
                hsf hsfVar = (hsf) nigVar.c;
                asgVarT.c();
                csg.v((csg) asgVarT.b, hsfVar);
                zrg zrgVar = (zrg) nigVar.d;
                asgVarT.c();
                ((csg) asgVarT.b).zzg = zrgVar.zza();
                csg csgVar = (csg) asgVarT.b();
                xtf xtfVar = (xtf) qsgVarU.d(5);
                if (!xtfVar.a.equals(qsgVarU)) {
                    if (!xtfVar.b.s()) {
                        xtfVar.d();
                    }
                    xtf.a(xtfVar.b, qsgVarU);
                }
                psg psgVar = (psg) xtfVar;
                psgVar.c();
                qsg.v((qsg) psgVar.b, csgVar);
                qsg qsgVar = (qsg) psgVar.b();
                try {
                    lggVar = a(qsgVar);
                    z = false;
                } catch (GeneralSecurityException e) {
                    if (y9g.a.a.get()) {
                        throw e;
                    }
                    lggVar = new lgg(m(qsgVar));
                    z = true;
                }
                gr7 gr7Var2 = lggVar;
                int iT = qsgVar.t();
                byfVar = new byf(gr7Var2, byfVar2.b, iT, iT == ssgVarO.z(), z);
            }
            arrayList.add(byfVar);
            i++;
        }
        bxf bxfVar = new bxf(arrayList, this.c, 0);
        bxfVar.h();
        return bxfVar;
    }

    public byf n() {
        for (byf byfVar : this.b) {
            if (byfVar != null && byfVar.e) {
                if (byfVar.c == zwf.c) {
                    return byfVar;
                }
                ygf.f("Keyset has primary which isn't enabled");
                return null;
            }
        }
        ygf.f("Keyset has no valid primary");
        return null;
    }

    public ssg o() {
        try {
            rsg rsgVarA = ssg.A();
            for (byf byfVar : this.b) {
                gr7 gr7Var = byfVar.a;
                int i = byfVar.d;
                dsg dsgVar = byfVar.b;
                nig nigVar = (nig) fhg.b.c(gr7Var);
                Integer numJ = gr7Var.J();
                if (numJ != null && numJ.intValue() != i) {
                    throw new GeneralSecurityException("Wrong ID set for key with ID requirement");
                }
                psg psgVarA = qsg.A();
                asg asgVarT = csg.t();
                String str = (String) nigVar.a;
                asgVarT.c();
                csg.u((csg) asgVarT.b, str);
                hsf hsfVar = (hsf) nigVar.c;
                asgVarT.c();
                csg.v((csg) asgVarT.b, hsfVar);
                zrg zrgVar = (zrg) nigVar.d;
                asgVarT.c();
                ((csg) asgVarT.b).zzg = zrgVar.zza();
                psgVarA.c();
                qsg.v((qsg) psgVarA.b, (csg) asgVarT.b());
                psgVarA.c();
                ((qsg) psgVarA.b).zzg = dsgVar.zza();
                psgVarA.c();
                ((qsg) psgVarA.b).zzh = i;
                ntg ntgVar = (ntg) nigVar.e;
                psgVarA.c();
                ((qsg) psgVarA.b).zzi = ntgVar.zza();
                qsg qsgVar = (qsg) psgVarA.b();
                rsgVarA.c();
                ssg.y((ssg) rsgVarA.b, qsgVar);
                if (byfVar.e) {
                    rsgVarA.c();
                    ((ssg) rsgVarA.b).zze = i;
                }
            }
            return (ssg) rsgVarA.b();
        } catch (GeneralSecurityException e) {
            throw new zzqh(e);
        }
    }

    public final String toString() {
        switch (this.a) {
            case 0:
                return yzf.a(o()).toString();
            default:
                upg upgVarG = g();
                int i = vjg.a;
                vpg vpgVarV = aqg.v();
                int iV = upgVarG.v();
                vpgVarV.c();
                ((aqg) vpgVarV.b).w(iV);
                for (spg spgVar : upgVarG.w()) {
                    xpg xpgVarV = zpg.v();
                    String strV = spgVar.w().v();
                    xpgVarV.c();
                    ((zpg) xpgVarV.b).w(strV);
                    int iB = spgVar.B();
                    xpgVarV.c();
                    ((zpg) xpgVarV.b).y(iB);
                    int iC = spgVar.C();
                    xpgVarV.c();
                    ((zpg) xpgVarV.b).z(iC);
                    int iX = spgVar.x();
                    xpgVarV.c();
                    ((zpg) xpgVarV.b).x(iX);
                    zpg zpgVar = (zpg) xpgVarV.e();
                    vpgVarV.c();
                    ((aqg) vpgVarV.b).x(zpgVar);
                }
                return ((aqg) vpgVarV.e()).toString();
        }
    }
}
