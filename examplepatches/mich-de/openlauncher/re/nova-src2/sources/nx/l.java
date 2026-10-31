package nx;

import a5.a0;
import a5.f2;
import a5.h2;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.WorkSource;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.node.LayoutNode;
import androidx.core.graphics.Insets;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.android.launcher3.folder.Folder;
import com.google.android.gms.internal.location.zzd;
import com.google.android.gms.internal.location.zzdb;
import com.google.android.gms.internal.location.zzdd;
import com.google.android.gms.internal.location.zzdf;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.td;
import com.google.android.gms.internal.measurement.wg;
import com.google.android.gms.internal.measurement.z6;
import com.google.android.gms.location.CurrentLocationRequest;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import e1.m0;
import h10.k1;
import io.branch.search.internal.C3482z5;
import io.branch.search.internal.F4;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.EllipticCurve;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import ke.x;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.StringFormat;
import mx.c0;
import ninja.sesame.lib.bridge.v1.SesameFrontend;
import ninja.sesame.lib.bridge.v1.SesameInitOnComplete;
import ninja.sesame.lib.bridge.v1_1.LookFeelKeys;
import o9.l0;
import o9.p2;
import oh.s;
import p10.t0;
import pu.n0;
import sg.j0;
import sg.w;
import t5.d0;
import ue.b0;
import ue.z;
import wf.t;
import x7.u;
import x80.p0;
import z.c1;

/* loaded from: classes4.dex */
public final class l implements d9.g, rg.l, fi.i, SesameInitOnComplete, kw.p, eb0.m, a0, z, vf.j, p2 {

    /* renamed from: a, reason: collision with root package name */
    public Object f78644a;

    /* renamed from: b, reason: collision with root package name */
    public Object f78645b;

    public /* synthetic */ l(Object obj, Object obj2) {
        this.f78645b = obj;
        this.f78644a = obj2;
    }

    @Override // kw.p
    public kw.q a() {
        return new n0((pu.o) this.f78644a, (m0) this.f78645b);
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x01a4 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0162  */
    @Override // rg.l
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void accept(Object obj, Object obj2) throws Throwable {
        boolean z11;
        int i5;
        boolean z12;
        int i11;
        boolean z13;
        fi.a aVar;
        long j11;
        long j12;
        og.i iVar;
        c1 c1Var;
        c1 c1Var2;
        oh.h hVar;
        fi.j jVar;
        long j13;
        sg.i j0Var;
        CurrentLocationRequest currentLocationRequest = (CurrentLocationRequest) this.f78644a;
        fi.a aVar2 = (fi.a) this.f78645b;
        oh.h hVar2 = (oh.h) obj;
        fi.j jVar2 = (fi.j) obj2;
        int i12 = 1;
        sg.i iVar2 = null;
        if (hVar2.c(uh.c.f91268a)) {
            s sVar = (s) hVar2.getService();
            oh.d dVar = new oh.d(jVar2);
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken(sVar.f32954c);
            parcelObtain.writeInt(1);
            currentLocationRequest.writeToParcel(parcelObtain, 0);
            parcelObtain.writeStrongBinder(dVar);
            parcelObtain = Parcel.obtain();
            try {
                sVar.f32953b.transact(87, parcelObtain, parcelObtain, 0);
                parcelObtain.readException();
                parcelObtain.recycle();
                IBinder strongBinder = parcelObtain.readStrongBinder();
                int i13 = sg.h.f87440j;
                if (strongBinder == null) {
                    j0Var = iVar2;
                } else {
                    IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface("com.google.android.gms.common.internal.ICancelToken");
                    if (iInterfaceQueryLocalInterface instanceof sg.i) {
                        iVar2 = (sg.i) iInterfaceQueryLocalInterface;
                        j0Var = iVar2;
                    } else {
                        j0Var = new j0(strongBinder, "com.google.android.gms.common.internal.ICancelToken", 0);
                    }
                }
                if (aVar2 != null) {
                    aVar2.a(new je.f(j0Var, 23));
                    return;
                }
                return;
            } catch (RuntimeException e3) {
                throw e3;
            } finally {
                parcelObtain.recycle();
            }
        }
        oh.b bVar = new oh.b(hVar2, jVar2);
        oh.o oVar = oh.o.f80440a;
        td tdVar = new td();
        tdVar.f33083a = oVar;
        w.e("GetCurrentLocation");
        tdVar.f33084b = new rg.i(bVar, "GetCurrentLocation");
        rg.i iVar3 = (rg.i) tdVar.f33084b;
        iVar3.getClass();
        og.i iVar4 = new og.i(i12, tdVar, jVar2);
        fi.j jVar3 = new fi.j();
        int i14 = currentLocationRequest.f33687h;
        uh.c.a(i14);
        long j14 = currentLocationRequest.f33688i;
        long jMin = 0;
        w.a("durationMillis must be greater than 0", j14 > 0);
        int i15 = currentLocationRequest.f33686g;
        if (i15 == 0 || i15 == 1) {
            z11 = true;
            i5 = i15;
        } else if (i15 == 2) {
            i5 = 2;
            z11 = true;
        } else {
            i5 = i15;
            z11 = false;
        }
        w.b("granularity %d must be a Granularity.GRANULARITY_* constant", new Object[]{Integer.valueOf(i5)}, z11);
        long j15 = currentLocationRequest.f33685f;
        w.a("maxUpdateAgeMillis must be greater than or equal to 0, or IMPLICIT_MAX_UPDATE_AGE", j15 == -1 || j15 >= 0);
        boolean z14 = currentLocationRequest.f33689j;
        int i16 = currentLocationRequest.f33690k;
        if (i16 != 0) {
            z12 = z14;
            if (i16 != 1) {
                if (i16 == 2) {
                    i16 = 2;
                } else {
                    i11 = i16;
                    z13 = false;
                }
            }
            w.b("throttle behavior %d must be a ThrottleBehavior.THROTTLE_* constant", new Object[]{Integer.valueOf(i16)}, z13);
            String str = currentLocationRequest.f33691l;
            int i17 = Build.VERSION.SDK_INT;
            String str2 = i17 >= 30 ? str : null;
            WorkSource workSource = currentLocationRequest.f33692m;
            if (0 != -1 && i14 != 105) {
                aVar = aVar2;
                j11 = 0;
                jMin = Math.min(0L, 0L);
                j12 = j14;
                iVar = iVar4;
            } else {
                aVar = aVar2;
                j12 = j14;
                iVar = iVar4;
                j11 = 0;
            }
            og.i iVar5 = iVar;
            c1 c1Var3 = null;
            LocationRequest locationRequest = new LocationRequest(i14, j11, jMin, Math.max(j11, j11), Long.MAX_VALUE, j12, LayoutNode.NotPlacedPlaceOrder, 0.0f, true, j15 != -1 ? j11 : j15, i15, i11, str2, z12, new WorkSource(workSource), null);
            rg.i iVar6 = (rg.i) tdVar.f33084b;
            iVar6.getClass();
            boolean zC = hVar2.c(uh.c.f91269b);
            c1Var = hVar2.f80426d;
            synchronized (c1Var) {
                try {
                    try {
                        oh.g gVar = (oh.g) hVar2.f80426d.get(iVar6);
                        if (gVar != null && !zC) {
                            gVar.f80424b.getClass();
                            throw new IllegalStateException();
                        }
                        oh.g gVar2 = new oh.g(iVar5);
                        hVar2.f80426d.put(iVar6, gVar2);
                        int iIdentityHashCode = System.identityHashCode(iVar6.f85889a);
                        String str3 = iVar6.f85890b;
                        StringBuilder sb2 = new StringBuilder(str3.length() + 1 + String.valueOf(iIdentityHashCode).length());
                        sb2.append(str3);
                        sb2.append("@");
                        sb2.append(iIdentityHashCode);
                        String string = sb2.toString();
                        if (zC) {
                            s sVar2 = (s) hVar2.getService();
                            oh.g gVar3 = gVar;
                            if (gVar3 == null) {
                                gVar3 = null;
                            }
                            zzdb zzdbVar = new zzdb(2, gVar3, gVar2, null, null, string);
                            oh.c cVar = new oh.c(null, jVar3);
                            Parcel parcelObtain2 = Parcel.obtain();
                            parcelObtain2.writeInterfaceToken(sVar2.f32954c);
                            parcelObtain2.writeInt(1);
                            zzdbVar.writeToParcel(parcelObtain2, 0);
                            parcelObtain2.writeInt(1);
                            locationRequest.writeToParcel(parcelObtain2, 0);
                            parcelObtain2.writeStrongBinder(cVar);
                            sVar2.Z(parcelObtain2, 88);
                            hVar = hVar2;
                            jVar = jVar2;
                            c1Var2 = c1Var;
                        } else {
                            s sVar3 = (s) hVar2.getService();
                            int i18 = locationRequest.f33698f;
                            long j16 = locationRequest.f33699g;
                            long jMin2 = locationRequest.f33700h;
                            c1Var2 = c1Var;
                            long j17 = locationRequest.f33701i;
                            hVar = hVar2;
                            jVar = jVar2;
                            long j18 = locationRequest.f33702j;
                            int i19 = locationRequest.f33703k;
                            float f11 = locationRequest.f33704l;
                            boolean z15 = locationRequest.f33705m;
                            long j19 = locationRequest.n;
                            int i21 = locationRequest.o;
                            int i22 = locationRequest.f33706p;
                            String str4 = locationRequest.f33707q;
                            boolean z16 = locationRequest.f33708r;
                            WorkSource workSource2 = locationRequest.f33709s;
                            zzd zzdVar = locationRequest.f33710t;
                            String str5 = i17 < 30 ? null : str4;
                            if (jMin2 == -1) {
                                j13 = j16;
                            } else {
                                if (i18 != 105) {
                                    jMin2 = Math.min(jMin2, j16);
                                }
                                j13 = jMin2;
                            }
                            zzdf zzdfVar = new zzdf(1, new zzdd(new LocationRequest(i18, j16, j13, Math.max(j17, j16), Long.MAX_VALUE, j18, i19, f11, z15, j19 == -1 ? j16 : j19, i21, i22, str5, z16, new WorkSource(workSource2), zzdVar), null, false, false, null, false, false, null, Long.MAX_VALUE), null, gVar2, null, new oh.f(jVar3, gVar2), string);
                            Parcel parcelObtain3 = Parcel.obtain();
                            parcelObtain3.writeInterfaceToken(sVar3.f32954c);
                            parcelObtain3.writeInt(1);
                            zzdfVar.writeToParcel(parcelObtain3, 0);
                            sVar3.Z(parcelObtain3, 59);
                        }
                        jVar3.f55135a.b(new fi.r(jVar));
                        if (aVar != null) {
                            aVar.a(new m.w(hVar, iVar3, false, 4));
                            return;
                        }
                        return;
                    } catch (Throwable th2) {
                        th = th2;
                        c1Var3 = c1Var;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        } else {
            z12 = z14;
        }
        i11 = i16;
        z13 = true;
        w.b("throttle behavior %d must be a ThrottleBehavior.THROTTLE_* constant", new Object[]{Integer.valueOf(i16)}, z13);
        String str6 = currentLocationRequest.f33691l;
        int i172 = Build.VERSION.SDK_INT;
        if (i172 >= 30) {
        }
        WorkSource workSource3 = currentLocationRequest.f33692m;
        if (0 != -1) {
            aVar = aVar2;
            j11 = 0;
            jMin = Math.min(0L, 0L);
            j12 = j14;
            iVar = iVar4;
        }
        og.i iVar52 = iVar;
        c1 c1Var32 = null;
        LocationRequest locationRequest2 = new LocationRequest(i14, j11, jMin, Math.max(j11, j11), Long.MAX_VALUE, j12, LayoutNode.NotPlacedPlaceOrder, 0.0f, true, j15 != -1 ? j11 : j15, i15, i11, str2, z12, new WorkSource(workSource3), null);
        rg.i iVar62 = (rg.i) tdVar.f33084b;
        iVar62.getClass();
        boolean zC2 = hVar2.c(uh.c.f91269b);
        c1Var = hVar2.f80426d;
        synchronized (c1Var) {
        }
    }

    public m.w b() {
        return new m.w((F4) this.f78644a, (C3482z5) this.f78645b, false, 26);
    }

    public ql.d c() throws GeneralSecurityException {
        ECPoint eCPoint;
        ql.e eVar = (ql.e) this.f78644a;
        if (eVar == null) {
            throw new GeneralSecurityException("Cannot build without a ecdsa public key");
        }
        d0 d0Var = (d0) this.f78645b;
        if (d0Var == null) {
            throw new GeneralSecurityException("Cannot build without a private value");
        }
        BigInteger bigInteger = (BigInteger) d0Var.f88562b;
        ECPoint eCPoint2 = eVar.f84146d;
        ql.a aVar = eVar.f84145c.f84129b;
        BigInteger order = aVar.f84104b.getOrder();
        if (bigInteger.signum() <= 0 || bigInteger.compareTo(order) >= 0) {
            throw new GeneralSecurityException("Invalid private value");
        }
        ECParameterSpec eCParameterSpec = aVar.f84104b;
        if (!kl.f.f(eCParameterSpec, kl.f.f71587a) && !kl.f.f(eCParameterSpec, kl.f.f71588b) && !kl.f.f(eCParameterSpec, kl.f.f71589c)) {
            throw new GeneralSecurityException("spec must be NIST P256, P384 or P521");
        }
        if (bigInteger.signum() != 1) {
            throw new GeneralSecurityException("k must be positive");
        }
        if (bigInteger.compareTo(eCParameterSpec.getOrder()) >= 0) {
            throw new GeneralSecurityException("k must be smaller than the order of the generator");
        }
        EllipticCurve curve = eCParameterSpec.getCurve();
        ECPoint generator = eCParameterSpec.getGenerator();
        kl.f.b(generator, curve);
        BigInteger a11 = eCParameterSpec.getCurve().getA();
        BigInteger bigIntegerD = kl.f.d(curve);
        kl.e eVarG = kl.f.g(ECPoint.POINT_INFINITY, bigIntegerD);
        kl.e eVarG2 = kl.f.g(generator, bigIntegerD);
        for (int iBitLength = bigInteger.bitLength(); iBitLength >= 0; iBitLength--) {
            if (bigInteger.testBit(iBitLength)) {
                eVarG = kl.f.a(eVarG, eVarG2, a11, bigIntegerD);
                eVarG2 = kl.f.c(eVarG2, a11, bigIntegerD);
            } else {
                eVarG2 = kl.f.a(eVarG, eVarG2, a11, bigIntegerD);
                eVarG = kl.f.c(eVarG, a11, bigIntegerD);
            }
        }
        if (eVarG.f71586c.equals(BigInteger.ZERO)) {
            eCPoint = ECPoint.POINT_INFINITY;
        } else {
            BigInteger bigIntegerModInverse = eVarG.f71586c.modInverse(bigIntegerD);
            BigInteger bigIntegerMod = bigIntegerModInverse.multiply(bigIntegerModInverse).mod(bigIntegerD);
            eCPoint = new ECPoint(eVarG.f71584a.multiply(bigIntegerMod).mod(bigIntegerD), eVarG.f71585b.multiply(bigIntegerMod).mod(bigIntegerD).multiply(bigIntegerModInverse).mod(bigIntegerD));
        }
        kl.f.b(eCPoint, curve);
        if (eCPoint.equals(eCPoint2)) {
            return new ql.d((ql.e) this.f78644a, (d0) this.f78645b);
        }
        throw new GeneralSecurityException("Invalid private value");
    }

    @Override // eb0.m
    public Object convert(Object obj) throws IOException {
        p0 value = (p0) obj;
        Intrinsics.g(value, "value");
        vm.c cVar = (vm.c) this.f78645b;
        DeserializationStrategy loader = (DeserializationStrategy) this.f78644a;
        cVar.getClass();
        Intrinsics.g(loader, "loader");
        String strString = value.string();
        Intrinsics.f(strString, "body.string()");
        return ((StringFormat) cVar.f92857b).decodeFromString(loader, strString);
    }

    public ud.a d() {
        String str = ((ArrayList) this.f78644a) == null ? " events" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str.isEmpty()) {
            return new ud.a((ArrayList) this.f78644a, (byte[]) this.f78645b);
        }
        throw new IllegalStateException("Missing required properties:".concat(str));
    }

    public t0 e(int i5, long j11, String str, String str2) {
        return new t0(str, TimeUnit.DAYS.toMillis(j11), ((Number) ((k1) this.f78644a).invoke(str2, Integer.valueOf(i5))).intValue());
    }

    @Override // ue.z
    public void f(com.google.android.gms.internal.consent_sdk.a aVar) {
        b0 b0Var = (b0) this.f78645b;
        SparseArray sparseArray = b0Var.f90830g;
        x xVar = (x) this.f78644a;
        if (aVar.N() == 0 && (aVar.N() & 128) != 0) {
            aVar.Z(6);
            int iG = aVar.g() / 4;
            for (int i5 = 0; i5 < iG; i5++) {
                aVar.z(0, 4, xVar.f71449d);
                xVar.o(0);
                int i11 = xVar.i(16);
                xVar.r(3);
                if (i11 == 0) {
                    xVar.r(13);
                } else {
                    int i12 = xVar.i(13);
                    if (sparseArray.get(i12) == null) {
                        sparseArray.put(i12, new ue.a0(new cw.r(b0Var, i12)));
                        b0Var.f90836m++;
                    }
                }
            }
            if (b0Var.f90824a != 2) {
                sparseArray.remove(0);
            }
        }
    }

    @Override // ue.z
    public void g(t tVar, ke.l lVar, ue.d0 d0Var) {
    }

    @Override // vf.j
    public vf.k h() {
        return new vf.q((Context) this.f78644a, ((com.google.android.gms.internal.consent_sdk.a) this.f78645b).h());
    }

    public void i(ArrayList arrayList) {
        this.f78644a = arrayList;
    }

    @Override // d9.g
    public void j(d9.j jVar, int i5) {
        c0 c0Var = c0.GOTO_SCREEN;
        int iA = c0Var.a();
        Intent intent = new Intent();
        Intent intentB = c0Var.b();
        intentB.putExtra("PAGE_NUMBER", i5);
        intent.putExtra("android.intent.extra.shortcut.INTENT", intentB);
        f10.t tVar = (f10.t) this.f78644a;
        intent.putExtra("android.intent.extra.shortcut.NAME", tVar.getString(2132018760, Integer.valueOf(i5 + 1)));
        intent.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", Intent.ShortcutIconResource.fromContext(tVar, iA));
        ((o) this.f78645b).f78651b.f(intent);
    }

    public void k(byte[] bArr) {
        this.f78645b = bArr;
    }

    public void l(p7.m mVar) {
        m(mVar, null);
    }

    public void m(p7.m mVar, u uVar) {
        ((a8.a) this.f78645b).a(new y7.n((p7.h) this.f78644a, mVar, uVar));
    }

    public void n(p7.m workSpecId) {
        Intrinsics.g(workSpecId, "workSpecId");
        o(workSpecId, -512);
    }

    public void o(p7.m workSpecId, int i5) {
        Intrinsics.g(workSpecId, "workSpecId");
        ((a8.a) this.f78645b).a(new y7.o((p7.h) this.f78644a, workSpecId, false, i5));
    }

    @Override // o9.p2
    public void onAlarm() {
        Folder folder = (Folder) this.f78645b;
        int i5 = folder.M;
        if (i5 == 0) {
            folder.f21117q.c0();
            folder.L = -1;
        } else {
            if (i5 != 1) {
                return;
            }
            folder.f21117q.d0();
            folder.L = -1;
        }
        folder.M = -1;
        o9.b bVar = folder.f21104f;
        bVar.f79769d = new og.i(folder, (l0) this.f78644a, 21);
        bVar.a(900L);
    }

    @Override // ninja.sesame.lib.bridge.v1.SesameInitOnComplete
    public void onConnect() {
        Bundle bundle = new Bundle();
        bundle.putString(LookFeelKeys.ICON_PACK_PKG, (String) this.f78644a);
        SesameFrontend.setLookFeelPreferences(bundle);
        SesameFrontend.disconnect((Context) this.f78645b);
    }

    @Override // ninja.sesame.lib.bridge.v1.SesameInitOnComplete
    public void onDisconnect() {
    }

    public void p(p7.m mVar, int i5) {
        o(mVar, i5);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void q(List list) {
        SpannableStringBuilder spannableStringBuilder = (SpannableStringBuilder) this.f78645b;
        Iterator it = list.iterator();
        while (it.hasNext()) {
            u60.f fVar = (u60.f) it.next();
            if (fVar.b()) {
                u60.h hVar = (u60.h) fVar;
                int length = spannableStringBuilder.length();
                q(hVar.f90653b);
                int length2 = spannableStringBuilder.length();
                if (length2 != length) {
                    ag agVar = (ag) this.f78644a;
                    String str = hVar.f90652a;
                    String str2 = hVar.f90654c;
                    s60.b bVar = (s60.b) agVar.f32386b;
                    s60.a aVar = (s60.a) bVar.get(str);
                    if (aVar == null && str2 != null) {
                        aVar = (s60.a) bVar.get(str2);
                    }
                    int i5 = aVar != null ? aVar.f86695a : 0;
                    if (i5 != 0) {
                        spannableStringBuilder.setSpan(new ForegroundColorSpan(i5), length, length2, 33);
                        if ("important".equals(str) || "important".equals(str2) || "bold".equals(str) || "bold".equals(str2)) {
                            spannableStringBuilder.setSpan(new k60.e(1), length, length2, 33);
                        }
                        if ("italic".equals(str) || "italic".equals(str2)) {
                            spannableStringBuilder.setSpan(new k60.e(0), length, length2, 33);
                        }
                    }
                }
            } else {
                spannableStringBuilder.append((CharSequence) ((u60.i) fVar).f90658a);
            }
        }
    }

    public int r(Context context, qg.c cVar) {
        int iB;
        w.h(context);
        w.h(cVar);
        int minApkVersion = cVar.getMinApkVersion();
        int iT = t(minApkVersion);
        if (iT != -1) {
            return iT;
        }
        SparseIntArray sparseIntArray = (SparseIntArray) this.f78644a;
        synchronized (sparseIntArray) {
            iB = 0;
            int i5 = 0;
            while (true) {
                try {
                    if (i5 >= sparseIntArray.size()) {
                        iB = -1;
                        break;
                    }
                    int iKeyAt = sparseIntArray.keyAt(i5);
                    if (iKeyAt > minApkVersion && sparseIntArray.get(iKeyAt) == 0) {
                        break;
                    }
                    i5++;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (iB == -1) {
                iB = ((pg.b) this.f78645b).b(context, minApkVersion);
            }
            sparseIntArray.put(minApkVersion, iB);
        }
        return iB;
    }

    public void s() {
        rg.n nVar = (rg.n) ((mk.w) this.f78645b).f76493c;
        nVar.f85897c.set(null);
        z6 z6Var = nVar.f85901g.n;
        z6Var.sendMessage(z6Var.obtainMessage(3));
        Dialog dialog = (Dialog) this.f78644a;
        if (dialog.isShowing()) {
            dialog.dismiss();
        }
    }

    public int t(int i5) {
        int i11;
        SparseIntArray sparseIntArray = (SparseIntArray) this.f78644a;
        synchronized (sparseIntArray) {
            i11 = sparseIntArray.get(i5, -1);
        }
        return i11;
    }

    @Override // fi.i
    public Task then(Object obj) {
        ok.b bVar = (ok.b) this.f78644a;
        return Tasks.d(new ok.k(bVar.f80456b, ((ok.n) this.f78645b).f80486a, ((Long) obj).longValue()));
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0086  */
    @Override // a5.a0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public h2 u(View view, h2 h2Var) {
        boolean z11;
        e30.j jVar = (e30.j) this.f78644a;
        wg wgVar = (wg) this.f78645b;
        int i5 = wgVar.f33198a;
        int i11 = wgVar.f33199b;
        int i12 = wgVar.f33200c;
        f2 f2Var = h2Var.f296a;
        Insets insetsG = f2Var.g(7);
        Insets insetsG2 = f2Var.g(32);
        BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) jVar.f52118b;
        bottomSheetBehavior.f34107w = insetsG.top;
        boolean zE = tj.i.e(view);
        int paddingBottom = view.getPaddingBottom();
        int paddingLeft = view.getPaddingLeft();
        int paddingRight = view.getPaddingRight();
        boolean z12 = bottomSheetBehavior.o;
        if (z12) {
            int iA = h2Var.a();
            bottomSheetBehavior.f34106v = iA;
            paddingBottom = iA + i12;
        }
        if (bottomSheetBehavior.f34100p) {
            paddingLeft = insetsG.left + (zE ? i11 : i5);
        }
        if (bottomSheetBehavior.f34101q) {
            if (!zE) {
                i5 = i11;
            }
            paddingRight = i5 + insetsG.right;
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        boolean z13 = true;
        if (bottomSheetBehavior.f34103s) {
            int i13 = marginLayoutParams.leftMargin;
            int i14 = insetsG.left;
            if (i13 != i14) {
                marginLayoutParams.leftMargin = i14;
                z11 = true;
            } else {
                z11 = false;
            }
        }
        if (bottomSheetBehavior.f34104t) {
            int i15 = marginLayoutParams.rightMargin;
            int i16 = insetsG.right;
            if (i15 != i16) {
                marginLayoutParams.rightMargin = i16;
                z11 = true;
            }
        }
        if (bottomSheetBehavior.f34105u) {
            int i17 = marginLayoutParams.topMargin;
            int i18 = insetsG.top;
            if (i17 != i18) {
                marginLayoutParams.topMargin = i18;
            } else {
                z13 = z11;
            }
        }
        if (z13) {
            view.setLayoutParams(marginLayoutParams);
        }
        view.setPadding(paddingLeft, view.getPaddingTop(), paddingRight, paddingBottom);
        boolean z14 = jVar.f52117a;
        if (z14) {
            bottomSheetBehavior.f34099m = insetsG2.bottom;
        }
        if (!z12 && !z14) {
            return h2Var;
        }
        bottomSheetBehavior.Q();
        return h2Var;
    }

    public void v() {
        SparseIntArray sparseIntArray = (SparseIntArray) this.f78644a;
        synchronized (sparseIntArray) {
            sparseIntArray.clear();
        }
    }

    public /* synthetic */ l(Object obj, Object obj2, boolean z11) {
        this.f78644a = obj;
        this.f78645b = obj2;
    }

    public l(DeserializationStrategy loader, vm.c cVar) {
        Intrinsics.g(loader, "loader");
        this.f78644a = loader;
        this.f78645b = cVar;
    }

    public l(int i5) {
        switch (i5) {
            case 12:
                pg.b bVar = pg.b.f82559e;
                this.f78644a = new SparseIntArray();
                this.f78645b = bVar;
                break;
            case 23:
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(EventBridgeChannel.QUEUE_CAPACITY);
                this.f78644a = byteArrayOutputStream;
                this.f78645b = new DataOutputStream(byteArrayOutputStream);
                break;
            default:
                this.f78644a = new k1(2, zy.c.f98823a, zy.c.class, "getInt", "getInt(Ljava/lang/String;I)I", 0, 17);
                this.f78645b = ul.b.Q(e(100, 1L, "prime_1d", "rewards_prime_1d_cost"), e(300, 7L, "prime_7d", "rewards_prime_7d_cost"), e(1200, 30L, "prime_30d", "rewards_prime_30d_cost"));
                break;
        }
    }

    public l(pu.o launcher, m0 m0Var) {
        Intrinsics.g(launcher, "launcher");
        this.f78644a = launcher;
        this.f78645b = m0Var;
    }

    public l(p7.h processor, a8.a workTaskExecutor) {
        Intrinsics.g(processor, "processor");
        Intrinsics.g(workTaskExecutor, "workTaskExecutor");
        this.f78644a = processor;
        this.f78645b = workTaskExecutor;
    }

    public l(Context context, int i5) {
        switch (i5) {
            case 20:
                this.f78644a = new F4(context);
                this.f78645b = new C3482z5(context);
                break;
            default:
                com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(12, (byte) 0);
                this.f78644a = context.getApplicationContext();
                this.f78645b = aVar;
                break;
        }
    }
}
