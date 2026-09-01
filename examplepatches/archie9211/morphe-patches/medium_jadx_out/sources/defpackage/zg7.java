package defpackage;

import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import androidx.appcompat.widget.ActionMenuView;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.datastore.preferences.protobuf.a;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;
import j$.util.Objects;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import javax.crypto.KeyAgreement;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class zg7 implements cfg, jx7, o30, jt4, yp8, rx7, x31, v0d, cw2, y60 {
    public static final d75 c = new d75(1);
    public static final cd7 d = new cd7();
    public static final u3b e = new u3b(27);
    public static final byte[] f = {48, 46, 2, 1, 0, 48, 5, 6, 3, 43, 101, 110, 4, 34, 4, 32};
    public static final byte[] g = {48, 42, 48, 5, 6, 3, 43, 101, 110, 3, 33, 0};
    public final /* synthetic */ int a;
    public Object b;

    public zg7(int i) {
        az7 az7Var;
        this.a = i;
        int i2 = 12;
        char c2 = 0;
        switch (i) {
            case 2:
                huf[] hufVarArr = {h1c.l, e};
                nec necVar = new nec(c2, i2);
                necVar.b = hufVarArr;
                byte[] bArr = ztf.a;
                this.b = necVar;
                break;
            case 4:
                if (Build.VERSION.SDK_INT < 26) {
                    this.b = new z4(this);
                } else {
                    this.b = new a5(this);
                }
                break;
            case 11:
                this.b = new AtomicReference(null);
                break;
            case 17:
                this.b = new ujf(12);
                break;
            case 21:
                TimeUnit.MINUTES.getClass();
                cgd cgdVar = cgd.l;
                cgdVar.getClass();
                this.b = new eva(cgdVar);
                break;
            case 27:
                this.b = new HashSet();
                break;
            default:
                u7a u7aVar = u7a.c;
                try {
                    az7Var = (az7) Class.forName("androidx.datastore.preferences.protobuf.DescriptorMessageInfoFactory").getDeclaredMethod("getInstance", null).invoke(null, null);
                } catch (Exception unused) {
                    az7Var = c;
                }
                az7[] az7VarArr = {d75.b, az7Var};
                yg7 yg7Var = new yg7();
                yg7Var.a = az7VarArr;
                Charset charset = x56.a;
                this.b = yg7Var;
                break;
        }
    }

    public static zg7 v0() throws GeneralSecurityException {
        Provider providerJ0 = n01.j0();
        if (providerJ0 == null) {
            ygf.l("Conscrypt is not available.");
            return null;
        }
        KeyFactory.getInstance("XDH", providerJ0);
        KeyAgreement.getInstance("XDH", providerJ0);
        zg7 zg7Var = new zg7(3, providerJ0);
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("XDH", providerJ0);
        keyPairGenerator.initialize(255);
        KeyPair keyPairGenerateKeyPair = keyPairGenerator.generateKeyPair();
        byte[] encoded = keyPairGenerateKeyPair.getPrivate().getEncoded();
        if (encoded.length != 48) {
            ygf.l("Invalid encoded private key length");
            return null;
        }
        if (!ejg.b(f, encoded)) {
            ygf.l("Invalid encoded private key prefix");
            return null;
        }
        Arrays.copyOfRange(encoded, 16, encoded.length);
        byte[] encoded2 = keyPairGenerateKeyPair.getPublic().getEncoded();
        if (encoded2.length != 44) {
            ygf.l("Invalid encoded public key length");
            return null;
        }
        if (ejg.b(g, encoded2)) {
            Arrays.copyOfRange(encoded2, 12, encoded2.length);
            return zg7Var;
        }
        ygf.l("Invalid encoded public key prefix");
        return null;
    }

    @Override // defpackage.cw2
    public Object B(ha3 ha3Var, Object obj) {
        return null;
    }

    @Override // defpackage.y60
    public Object C(xrb xrbVar, Float f2, Float f3, x45 x45Var, hic hicVar) {
        Object objI = en7.i(xrbVar, f2.floatValue(), g76.e(0.0f, f3.floatValue(), 28), (xv2) this.b, x45Var, hicVar);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : (tw) objI;
    }

    @Override // defpackage.cw2
    public Object D(c38 c38Var, Object obj) {
        return null;
    }

    @Override // defpackage.cw2
    public Object H(r4a r4aVar, Object obj) {
        int i;
        ph6 ph6Var = (ph6) this.b;
        List listU = r4aVar.U();
        listU.getClass();
        if (listU.isEmpty()) {
            i = (r4aVar.u != null ? 1 : 0) + (r4aVar.v != null ? 1 : 0);
        } else {
            i = -1;
        }
        if (r4aVar.g) {
            if (i == -1) {
                return new hi6(ph6Var, r4aVar);
            }
            if (i == 0) {
                return new zh6(ph6Var, r4aVar);
            }
            if (i == 1) {
                return new ci6(ph6Var, r4aVar);
            }
            if (i == 2) {
                return new ei6(ph6Var, r4aVar);
            }
        } else {
            if (i == -1) {
                return new oj6(ph6Var, r4aVar);
            }
            if (i == 0) {
                return new wi6(ph6Var, r4aVar);
            }
            if (i == 1) {
                return new aj6(ph6Var, r4aVar);
            }
            if (i == 2) {
                return new ej6(ph6Var, r4aVar);
            }
        }
        rd6.r("Unsupported property: ", r4aVar);
        return null;
    }

    @Override // defpackage.rx7
    public void I(lx7 lx7Var, sx7 sx7Var) {
        p71 p71Var = (p71) this.b;
        Handler handler = p71Var.f;
        handler.removeCallbacksAndMessages(null);
        ArrayList arrayList = p71Var.h;
        int size = arrayList.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                i = -1;
                break;
            } else if (lx7Var == ((o71) arrayList.get(i)).b) {
                break;
            } else {
                i++;
            }
        }
        if (i == -1) {
            return;
        }
        int i2 = i + 1;
        handler.postAtTime(new n71(this, i2 < arrayList.size() ? (o71) arrayList.get(i2) : null, sx7Var, lx7Var), lx7Var, SystemClock.uptimeMillis() + 200);
    }

    @Override // defpackage.cw2
    public Object J(s55 s55Var, Object obj) {
        return new sh6((ph6) this.b, s55Var);
    }

    @Override // defpackage.jt4
    public void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        iv9 iv9Var = (iv9) this.b;
        ho2.P(sourceParameter, str, str2, str3);
        sw9 sw9Var = iv9Var.a;
        sw9Var.l.e(str3, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
        sw9Var.G(str3, EntityType.AUTHOR, str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.jt4
    public void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        iv9 iv9Var = (iv9) this.b;
        sourceParameter.getClass();
        sw9 sw9Var = iv9Var.a;
        if (sw9Var.q0) {
            return;
        }
        sw9Var.q0 = true;
        sw9Var.l.i(str, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
    }

    @Override // defpackage.jt4
    public void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        iv9 iv9Var = (iv9) this.b;
        str2.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = iv9Var.a;
        vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str2, str, sourceParameter, null, 8), 3);
    }

    @Override // defpackage.jt4
    public void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        iv9 iv9Var = (iv9) this.b;
        ho2.O(sourceParameter, str, str2);
        sw9 sw9Var = iv9Var.a;
        sw9Var.l.d(str3, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
        sw9Var.v(str3, EntityType.AUTHOR, str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.cw2
    public Object Q(y28 y28Var, Object obj) {
        return null;
    }

    @Override // defpackage.jt4
    public void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        iv9 iv9Var = (iv9) this.b;
        str2.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = iv9Var.a;
        vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str2, str, sourceParameter, null, 7), 3);
    }

    @Override // defpackage.jt4
    public void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        iv9 iv9Var = (iv9) this.b;
        str.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = iv9Var.a;
        vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 12), 3);
    }

    @Override // defpackage.yp8
    public z4f W(View view, z4f z4fVar) {
        switch (this.a) {
            case 14:
                jo0 jo0Var = (jo0) this.b;
                jo0Var.m = z4fVar.a();
                jo0Var.n = z4fVar.b();
                jo0Var.o = z4fVar.c();
                jo0Var.f();
                break;
            case 15:
            default:
                w4f w4fVar = z4fVar.a;
                CoordinatorLayout coordinatorLayout = (CoordinatorLayout) this.b;
                if (!Objects.equals(coordinatorLayout.n, z4fVar)) {
                    coordinatorLayout.n = z4fVar;
                    boolean z = z4fVar.d() > 0;
                    coordinatorLayout.o = z;
                    coordinatorLayout.setWillNotDraw(!z && coordinatorLayout.getBackground() == null);
                    if (!w4fVar.s()) {
                        int childCount = coordinatorLayout.getChildCount();
                        for (int i = 0; i < childCount; i++) {
                            View childAt = coordinatorLayout.getChildAt(i);
                            WeakHashMap weakHashMap = ute.a;
                            if (!childAt.getFitsSystemWindows() || ((ga2) childAt.getLayoutParams()).a == null || !w4fVar.s()) {
                            }
                        }
                    }
                    coordinatorLayout.requestLayout();
                }
                break;
            case 16:
                cw0 cw0Var = (cw0) this.b;
                bw0 bw0Var = cw0Var.n;
                if (bw0Var != null) {
                    cw0Var.g.a0.remove(bw0Var);
                }
                bw0 bw0Var2 = new bw0(cw0Var.j, z4fVar);
                cw0Var.n = bw0Var2;
                bw0Var2.e(cw0Var.getWindow());
                BottomSheetBehavior bottomSheetBehavior = cw0Var.g;
                bw0 bw0Var3 = cw0Var.n;
                ArrayList arrayList = bottomSheetBehavior.a0;
                if (!arrayList.contains(bw0Var3)) {
                    arrayList.add(bw0Var3);
                }
                break;
        }
        return z4fVar;
    }

    @Override // defpackage.cw2
    public Object X(xx8 xx8Var, Object obj) {
        return null;
    }

    @Override // defpackage.jx7
    public void Y(lx7 lx7Var) {
        nec necVar = ((ActionMenuView) this.b).u;
        if (necVar != null) {
            necVar.Y(lx7Var);
        }
    }

    @Override // defpackage.cfg
    public byte[] b(byte[] bArr, byte[] bArr2) throws InvalidKeySpecException, NoSuchAlgorithmException, InvalidKeyException {
        Provider provider = (Provider) this.b;
        KeyFactory keyFactory = KeyFactory.getInstance("XDH", provider);
        if (bArr.length != 32) {
            throw new InvalidKeyException("Invalid X25519 private key");
        }
        PrivateKey privateKeyGeneratePrivate = keyFactory.generatePrivate(new PKCS8EncodedKeySpec(il7.H(f, bArr)));
        if (bArr2.length != 32) {
            throw new InvalidKeyException("Invalid X25519 public key");
        }
        PublicKey publicKeyGeneratePublic = keyFactory.generatePublic(new X509EncodedKeySpec(il7.H(g, bArr2)));
        KeyAgreement keyAgreement = KeyAgreement.getInstance("XDH", provider);
        keyAgreement.init(privateKeyGeneratePrivate);
        keyAgreement.doPhase(publicKeyGeneratePublic, true);
        return keyAgreement.generateSecret();
    }

    @Override // defpackage.jx7
    public boolean d(lx7 lx7Var, MenuItem menuItem) {
        k6 k6Var = ((ActionMenuView) this.b).z;
        return k6Var != null && ((Toolbar) ((qlb) k6Var).a).G.a();
    }

    @Override // defpackage.rx7
    public void f(lx7 lx7Var, MenuItem menuItem) {
        ((p71) this.b).f.removeCallbacksAndMessages(lx7Var);
    }

    public Object h0(zm1 zm1Var, Object obj) {
        return J(zm1Var, obj);
    }

    @Override // defpackage.cw2
    public Object i(s4a s4aVar, Object obj) {
        return J(s4aVar, obj);
    }

    public y4 k0(int i) {
        return null;
    }

    public y4 m0(int i) {
        return null;
    }

    @Override // defpackage.cw2
    public Object n(lqe lqeVar, Object obj) {
        return null;
    }

    public que n0(wg6 wg6Var) {
        wg6Var.getClass();
        o2b o2bVar = (o2b) this.b;
        String strD = wg6Var.d();
        if (strD != null) {
            return o2bVar.o(wg6Var, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
        }
        ay0.e("Local and anonymous classes can not be ViewModels");
        return null;
    }

    @Override // defpackage.cw2
    public Object o(c3 c3Var, Object obj) {
        return null;
    }

    public boolean o0(int i, int i2, Bundle bundle) {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object p0(java.lang.String r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.yy2
            if (r0 == 0) goto L13
            r0 = r6
            yy2 r0 = (defpackage.yy2) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            yy2 r0 = new yy2
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            java.lang.String r5 = r0.b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            goto L46
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r6)
            java.lang.Object r4 = r4.b
            v54 r4 = (defpackage.v54) r4
            r0.b = r5
            r0.e = r3
            java.lang.Object r4 = r4.a(r5, r0)
            if (r4 != r1) goto L46
            return r1
        L46:
            java.lang.Throwable r6 = defpackage.bjb.b(r4)
            if (r6 == 0) goto L5c
            java.lang.String r0 = "Failed to track "
            java.lang.String r1 = " experiment exposure event"
            java.lang.String r5 = defpackage.ev6.x(r0, r5, r1)
            uld r0 = defpackage.wld.a
            r1 = 0
            java.lang.Object[] r1 = new java.lang.Object[r1]
            r0.e(r6, r5, r1)
        L5c:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zg7.p0(java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.cw2
    public Object r(yq6 yq6Var, Object obj) {
        return null;
    }

    @Override // defpackage.x31
    public Type s() {
        return (Type) this.b;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object s0(java.lang.String r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.zy2
            if (r0 == 0) goto L13
            r0 = r6
            zy2 r0 = (defpackage.zy2) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            zy2 r0 = new zy2
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            java.lang.String r5 = r0.b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            goto L46
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r6)
            java.lang.Object r4 = r4.b
            v54 r4 = (defpackage.v54) r4
            r0.b = r5
            r0.e = r3
            java.lang.Object r4 = r4.b(r5, r0)
            if (r4 != r1) goto L46
            return r1
        L46:
            java.lang.Throwable r6 = defpackage.bjb.b(r4)
            if (r6 == 0) goto L5c
            java.lang.String r0 = "Failed to track "
            java.lang.String r1 = " gate exposure event"
            java.lang.String r5 = defpackage.ev6.x(r0, r5, r1)
            uld r0 = defpackage.wld.a
            r1 = 0
            java.lang.Object[] r1 = new java.lang.Object[r1]
            r0.e(r6, r5, r1)
        L5c:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zg7.s0(java.lang.String, p92):java.lang.Object");
    }

    public void t0(int i, d21 d21Var) {
        ((zp1) this.b).p(i, d21Var);
    }

    @Override // defpackage.x31
    public Object u(sp8 sp8Var) {
        xx1 xx1Var = new xx1(sp8Var);
        sp8Var.f(new wx1(1, xx1Var));
        return xx1Var;
    }

    public void u0(int i, Object obj, crb crbVar) {
        zp1 zp1Var = (zp1) this.b;
        zp1Var.B(i, 3);
        crbVar.f((a) obj, zp1Var.a);
        zp1Var.B(i, 4);
    }

    @Override // defpackage.cw2
    public Object w(x4a x4aVar, Object obj) {
        return J(x4aVar, obj);
    }

    @Override // defpackage.cw2
    public Object x(rv6 rv6Var, Object obj) {
        return null;
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) {
        w1c w1cVar = (w1c) obj;
        jc2 jc2Var = ((hc2) this.b).e;
        if (w1cVar == null) {
            Log.w("FirebaseCrashlytics", "Received null app settings, cannot send reports at crash time.", null);
            return vp7.x(null);
        }
        fc2 fc2Var = jc2.r;
        return vp7.H(Arrays.asList(jc2Var.f(), jc2Var.m.C(null, (ud2) jc2Var.e.b)));
    }

    public void F(int i) {
    }

    public void Z(int i) {
    }

    public void a0(int i, float f2) {
    }

    public void i0(int i, y4 y4Var, String str, Bundle bundle) {
    }

    public zg7(rqd rqdVar, v54 v54Var) {
        this.a = 29;
        this.b = v54Var;
    }

    public zg7(String str, Bundle bundle) {
        Uri uriA;
        this.a = 26;
        bundle = bundle == null ? new Bundle() : bundle;
        j65[] j65VarArrValues = j65.values();
        ArrayList arrayList = new ArrayList(j65VarArrValues.length);
        for (j65 j65Var : j65VarArrValues) {
            arrayList.add(j65Var.getRawValue());
        }
        if (arrayList.contains(str)) {
            f94 f94Var = f94.a;
            uriA = epe.a(String.format("%s", Arrays.copyOf(new Object[]{"fb.gg"}, 1)), "/dialog/".concat(str), bundle);
        } else {
            uriA = epe.a(no7.t(), f94.d() + "/dialog/" + str, bundle);
        }
        this.b = uriA;
    }

    public zg7(zp1 zp1Var) {
        this.a = 19;
        Charset charset = x56.a;
        this.b = zp1Var;
        zp1Var.a = this;
    }

    public zg7(vue vueVar, uue uueVar, qg2 qg2Var) {
        this.a = 1;
        vueVar.getClass();
        uueVar.getClass();
        qg2Var.getClass();
        this.b = new o2b(vueVar, uueVar, qg2Var);
    }

    public /* synthetic */ zg7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public zg7(hc2 hc2Var, String str) {
        this.a = 23;
        this.b = hc2Var;
    }
}
