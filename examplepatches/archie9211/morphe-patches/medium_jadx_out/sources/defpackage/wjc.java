package defpackage;

import android.content.Context;
import android.os.Parcel;
import android.security.keystore.KeyGenParameterSpec;
import android.util.SparseIntArray;
import com.google.android.gms.identitycredentials.GetCredentialRequest;
import com.medium.android.graphql.CollectionIsFollowingQuery;
import com.medium.android.graphql.UserPreferencesQuery;
import j$.util.DesugarCollections;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.UnrecoverableEntryException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class wjc implements bnb, ex, iof, s3b {
    public final /* synthetic */ int a;
    public Object b;

    public wjc(y6a y6aVar) {
        this.a = 3;
        y6aVar.getClass();
        List list = y6aVar.c;
        if ((y6aVar.b & 1) == 1) {
            int i = y6aVar.d;
            list.getClass();
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            int i2 = 0;
            for (Object obj : list) {
                int i3 = i2 + 1;
                if (i2 < 0) {
                    d46.i0();
                    throw null;
                }
                s6a s6aVarE = (s6a) obj;
                if (i2 >= i) {
                    s6aVarE.getClass();
                    r6a r6aVarP = s6a.p(s6aVarE);
                    r6aVarP.d |= 2;
                    r6aVarP.f = true;
                    s6aVarE = r6aVarP.e();
                    if (!s6aVarE.isInitialized()) {
                        throw new UninitializedMessageException();
                    }
                }
                arrayList.add(s6aVarE);
                i2 = i3;
            }
            list = arrayList;
        }
        list.getClass();
        this.b = list;
    }

    public static to4 i(wjc wjcVar) {
        yd4 yd4Var = yd4.CacheFirst;
        yd4 yd4Var2 = yd4.CacheOnly;
        yd4Var.getClass();
        yd4Var2.getClass();
        e00 e00Var = ((l2c) wjcVar.b).b;
        UserPreferencesQuery userPreferencesQuery = new UserPreferencesQuery();
        e00Var.getClass();
        return new to4(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(new uz(e00Var, userPreferencesQuery), yd4Var), yd4Var2)), yd4Var, 16), 0), new au2(2, 7, null), 3);
    }

    public static wjc l() {
        Pattern patternCompile = Pattern.compile("[.-]");
        fgg fggVar = new fgg(patternCompile);
        Matcher matcher = patternCompile.matcher("");
        matcher.getClass();
        if (matcher.matches()) {
            ay0.e(hk7.L("The pattern may not match the empty string: %s", fggVar));
            return null;
        }
        hha hhaVar = new hha();
        hhaVar.a = fggVar;
        return new wjc(15, hhaVar);
    }

    @Override // defpackage.bnb
    public boolean W() {
        return true;
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public void mo105a(String str) {
        ((zjf) this.b).b(hp7.K(str));
    }

    @Override // defpackage.s3b
    public void accept(Object obj, Object obj2) {
        switch (this.a) {
            case 12:
                n44 n44Var = (n44) this.b;
                hag hagVar = new hag((wfd) obj2, 0);
                p3g p3gVar = (p3g) ((neg) obj).h();
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken("com.google.android.gms.recaptchabase.internal.IRecaptchaBaseService");
                int i = sxf.a;
                parcelObtain.writeStrongBinder(hagVar);
                parcelObtain.writeInt(1);
                n44Var.writeToParcel(parcelObtain, 0);
                p3gVar.a(2, parcelObtain);
                break;
            default:
                GetCredentialRequest getCredentialRequest = (GetCredentialRequest) this.b;
                a66 a66Var = new a66((wfd) obj2, 1);
                eu5 eu5Var = (eu5) ((tv5) obj).h();
                hz hzVarB = wo7.B();
                Parcel parcelObtain2 = Parcel.obtain();
                parcelObtain2.writeInterfaceToken("com.google.android.gms.identitycredentials.internal.IIdentityCredentialService");
                int i2 = qxf.a;
                parcelObtain2.writeStrongBinder(a66Var);
                qxf.b(parcelObtain2, getCredentialRequest);
                qxf.b(parcelObtain2, hzVarB);
                ((cu5) eu5Var).a(1, parcelObtain2);
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.z84 r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.sjc
            if (r0 == 0) goto L13
            r0 = r6
            sjc r0 = (defpackage.sjc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            sjc r0 = new sjc
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L41
            goto L3e
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            java.lang.Object r4 = r4.b     // Catch: java.lang.Throwable -> L41
            in7 r4 = (defpackage.in7) r4     // Catch: java.lang.Throwable -> L41
            r0.d = r3     // Catch: java.lang.Throwable -> L41
            java.lang.Object r4 = r4.p(r5, r0)     // Catch: java.lang.Throwable -> L41
            if (r4 != r1) goto L3e
            return r1
        L3e:
            c1e r4 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L41
            return r4
        L41:
            r4 = move-exception
            ajb r5 = new ajb
            r5.<init>(r4)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wjc.b(z84, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(defpackage.daf r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.tjc
            if (r0 == 0) goto L13
            r0 = r6
            tjc r0 = (defpackage.tjc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            tjc r0 = new tjc
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L41
            goto L3e
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            java.lang.Object r4 = r4.b     // Catch: java.lang.Throwable -> L41
            in7 r4 = (defpackage.in7) r4     // Catch: java.lang.Throwable -> L41
            r0.d = r3     // Catch: java.lang.Throwable -> L41
            java.lang.Object r4 = r4.d(r5, r0)     // Catch: java.lang.Throwable -> L41
            if (r4 != r1) goto L3e
            return r1
        L3e:
            c1e r4 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L41
            return r4
        L41:
            r4 = move-exception
            ajb r5 = new ajb
            r5.<init>(r4)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wjc.c(daf, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object d(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.ujc
            if (r0 == 0) goto L13
            r0 = r7
            ujc r0 = (defpackage.ujc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ujc r0 = new ujc
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L60
            goto L3e
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r7)
            java.lang.Object r6 = r6.b     // Catch: java.lang.Throwable -> L60
            in7 r6 = (defpackage.in7) r6     // Catch: java.lang.Throwable -> L60
            r0.d = r3     // Catch: java.lang.Throwable -> L60
            java.lang.Object r7 = r6.f(r0)     // Catch: java.lang.Throwable -> L60
            if (r7 != r1) goto L3e
            return r1
        L3e:
            nn7 r7 = (defpackage.nn7) r7     // Catch: java.lang.Throwable -> L60
            o69 r6 = r7.getPayload()     // Catch: java.lang.Throwable -> L60
            java.lang.Object r6 = r6.getValue()     // Catch: java.lang.Throwable -> L60
            java.lang.Boolean r6 = (java.lang.Boolean) r6     // Catch: java.lang.Throwable -> L60
            boolean r6 = r6.booleanValue()     // Catch: java.lang.Throwable -> L60
            if (r6 == 0) goto L53
            c1e r6 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L60
            return r6
        L53:
            com.medium.android.common.api.Medium2Error r0 = new com.medium.android.common.api.Medium2Error     // Catch: java.lang.Throwable -> L60
            r4 = 0
            r5 = 13
            r1 = 0
            r2 = 400(0x190, float:5.6E-43)
            r3 = 0
            r0.<init>(r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L60
            throw r0     // Catch: java.lang.Throwable -> L60
        L60:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wjc.d(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object e(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.vjc
            if (r0 == 0) goto L13
            r0 = r7
            vjc r0 = (defpackage.vjc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            vjc r0 = new vjc
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L60
            goto L3e
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r7)
            java.lang.Object r6 = r6.b     // Catch: java.lang.Throwable -> L60
            in7 r6 = (defpackage.in7) r6     // Catch: java.lang.Throwable -> L60
            r0.d = r3     // Catch: java.lang.Throwable -> L60
            java.lang.Object r7 = r6.n(r0)     // Catch: java.lang.Throwable -> L60
            if (r7 != r1) goto L3e
            return r1
        L3e:
            nn7 r7 = (defpackage.nn7) r7     // Catch: java.lang.Throwable -> L60
            o69 r6 = r7.getPayload()     // Catch: java.lang.Throwable -> L60
            java.lang.Object r6 = r6.getValue()     // Catch: java.lang.Throwable -> L60
            java.lang.Boolean r6 = (java.lang.Boolean) r6     // Catch: java.lang.Throwable -> L60
            boolean r6 = r6.booleanValue()     // Catch: java.lang.Throwable -> L60
            if (r6 == 0) goto L53
            c1e r6 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L60
            return r6
        L53:
            com.medium.android.common.api.Medium2Error r0 = new com.medium.android.common.api.Medium2Error     // Catch: java.lang.Throwable -> L60
            r4 = 0
            r5 = 13
            r1 = 0
            r2 = 400(0x190, float:5.6E-43)
            r3 = 0
            r0.<init>(r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L60
            throw r0     // Catch: java.lang.Throwable -> L60
        L60:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wjc.e(p92):java.lang.Object");
    }

    public s6a f(int i) {
        return (s6a) ((List) this.b).get(i);
    }

    public bo4 g(String str, boolean z) {
        bo4 u50Var;
        if (str != null) {
            e00 e00Var = ((kla) this.b).a;
            CollectionIsFollowingQuery collectionIsFollowingQuery = new CollectionIsFollowingQuery(str);
            e00Var.getClass();
            uz uzVar = new uz(e00Var, collectionIsFollowingQuery);
            uzVar.b.i = Boolean.valueOf(z);
            yd4 yd4Var = yd4.CacheFirst;
            xz xzVar = new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 14);
            int i = 0;
            u50Var = new mxe(new zz(xzVar, i), str, i);
        } else {
            u50Var = new u50(7, bt4.CANT_FOLLOW);
        }
        return m40.J(u50Var);
    }

    @Override // defpackage.ex
    public hn4 get(int i) {
        return ((pn4[]) this.b)[i];
    }

    @Override // defpackage.iof
    public /* synthetic */ void h(xnf xnfVar) {
        ((zjf) this.b).g((zpf) xnfVar);
    }

    public int j(Context context, wd5 wd5Var) {
        int iC;
        vp7.p(context);
        vp7.p(wd5Var);
        int iF = wd5Var.f();
        int iK = k(iF);
        if (iK != -1) {
            return iK;
        }
        SparseIntArray sparseIntArray = (SparseIntArray) this.b;
        synchronized (sparseIntArray) {
            iC = 0;
            int i = 0;
            while (true) {
                try {
                    if (i >= sparseIntArray.size()) {
                        iC = -1;
                        break;
                    }
                    int iKeyAt = sparseIntArray.keyAt(i);
                    if (iKeyAt > iF && sparseIntArray.get(iKeyAt) == 0) {
                        break;
                    }
                    i++;
                } catch (Throwable th) {
                    throw th;
                }
            }
            if (iC == -1) {
                iC = ae5.e.c(context, iF);
            }
            sparseIntArray.put(iF, iC);
        }
        return iC;
    }

    public int k(int i) {
        int i2;
        SparseIntArray sparseIntArray = (SparseIntArray) this.b;
        synchronized (sparseIntArray) {
            i2 = sparseIntArray.get(i, -1);
        }
        return i2;
    }

    public List m(String str) {
        str.getClass();
        Iterator itO = ((hvg) this.b).o(this, str);
        ArrayList arrayList = new ArrayList();
        while (true) {
            btg btgVar = (btg) itO;
            if (!btgVar.hasNext()) {
                return DesugarCollections.unmodifiableList(arrayList);
            }
            arrayList.add((String) btgVar.next());
        }
    }

    public SecretKey n() throws NoSuchAlgorithmException, KeyStoreException, NoSuchProviderException, UnrecoverableEntryException, InvalidAlgorithmParameterException {
        SecretKey secretKey;
        KeyStore.Entry entry = ((KeyStore) ((w5d) this.b).getValue()).getEntry("recck", null);
        KeyStore.SecretKeyEntry secretKeyEntry = entry instanceof KeyStore.SecretKeyEntry ? (KeyStore.SecretKeyEntry) entry : null;
        if (secretKeyEntry != null && (secretKey = secretKeyEntry.getSecretKey()) != null) {
            return secretKey;
        }
        KeyGenerator keyGenerator = KeyGenerator.getInstance("AES", "AndroidKeyStore");
        keyGenerator.init(new KeyGenParameterSpec.Builder("recck", 3).setBlockModes("GCM").setEncryptionPaddings("NoPadding").build());
        return keyGenerator.generateKey();
    }

    @Override // defpackage.bnb
    public anb D(String str) {
        str.getClass();
        v2d v2dVar = (v2d) this.b;
        String databaseName = v2dVar.getDatabaseName();
        if (databaseName == null) {
            if (!str.equals(":memory:")) {
                ywb.g(ev6.x("This driver is configured to open an in-memory database but a file-based named '", str, "' was requested."));
                return null;
            }
        } else if (!databaseName.equals(str) && !muc.t0('/', databaseName, databaseName).equals(muc.t0('/', str, str))) {
            throw new IllegalArgumentException(("This driver is configured to open a database named '" + v2dVar.getDatabaseName() + gYpYQDQkhfs.BLYRgCtLKIkihjF + str + "' was requested.").toString());
        }
        return new t2d(v2dVar.Z());
    }

    public wjc(ujf ujfVar, zjf zjfVar) {
        this.a = 8;
        this.b = zjfVar;
    }

    public wjc(int i) {
        this.a = i;
        switch (i) {
            case 10:
                break;
            case 14:
                this.b = new w5d(qk0.n);
                break;
            default:
                Object obj = ae5.d;
                this.b = new SparseIntArray();
                break;
        }
    }

    public wjc(in7 in7Var) {
        this.a = 0;
        in7Var.getClass();
        this.b = in7Var;
    }

    public /* synthetic */ wjc(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public wjc(v2d v2dVar) {
        this.a = 1;
        v2dVar.getClass();
        this.b = v2dVar;
    }

    public wjc(dx dxVar, float f, float f2) {
        this.a = 4;
        int iB = dxVar.b();
        pn4[] pn4VarArr = new pn4[iB];
        for (int i = 0; i < iB; i++) {
            pn4VarArr[i] = new pn4(f, f2, dxVar.a(i));
        }
        this.b = pn4VarArr;
    }
}
