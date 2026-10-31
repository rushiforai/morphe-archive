package e30;

import ads_mobile_sdk.au;
import ads_mobile_sdk.au3;
import ads_mobile_sdk.cu3;
import ads_mobile_sdk.du3;
import ads_mobile_sdk.fu3;
import ads_mobile_sdk.hm2;
import ads_mobile_sdk.hu3;
import ads_mobile_sdk.iu3;
import ads_mobile_sdk.ku3;
import ads_mobile_sdk.lu3;
import ads_mobile_sdk.ou3;
import ads_mobile_sdk.qu3;
import ads_mobile_sdk.st3;
import ads_mobile_sdk.su3;
import ads_mobile_sdk.tt3;
import ads_mobile_sdk.ut3;
import ads_mobile_sdk.vo3;
import ads_mobile_sdk.vu3;
import ads_mobile_sdk.wi1;
import ads_mobile_sdk.wt3;
import ads_mobile_sdk.xo3;
import ads_mobile_sdk.xt3;
import ads_mobile_sdk.zt3;
import android.content.Context;
import android.util.SparseBooleanArray;
import androidx.appcompat.widget.ActionMenuView;
import aq.e0;
import b.d6;
import b.d7;
import b.d8;
import b.hb;
import b.k9;
import b.kc;
import b.v8;
import b3.x;
import com.google.android.play.core.hsdp.service.HsdpDeepLinkServiceFactory;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Optional;
import java.util.Stack;
import kotlin.jvm.functions.Function0;
import m.n0;
import ninja.sesame.lib.bridge.v1.SesameInitOnComplete;
import q.k;
import q.v;
import xk.r2;
import xk.w2;
import xk.x0;
import ya.o;

/* loaded from: classes4.dex */
public final class j implements v, qh.b, SesameInitOnComplete, n30.c {

    /* renamed from: a, reason: collision with root package name */
    public boolean f52117a;

    /* renamed from: b, reason: collision with root package name */
    public Object f52118b;

    public /* synthetic */ j(Object obj) {
        this.f52118b = obj;
    }

    public static byte[] g() {
        short sC = (short) (k9.c(((~1529195746) & 118097808) | 3345166, (1529195746 & 656934035) | 821390159, 1125361885, 184839124) ^ (1037127828 % 1034949299));
        int[] iArr = {350322227, 1077471394, 1759186290, 18931840, 769005128, 1847857001, 24413078, 1982275856, 1275373743};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int i14 = iArr[4];
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(k9.c((i11 & (~i5)) | i12, (i5 & i13) | i14, iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]));
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.putShort(sC);
        byteBufferAllocate.putInt(1182321202);
        return byteBufferAllocate.array();
    }

    public void a() throws xo3 {
        qu3 qu3Var = (qu3) this.f52118b;
        boolean z11 = this.f52117a;
        String strA = xt3.a("BkCyvAwRMTm0TkOZyDYQMHRR/BfGWZQu16Q1Ljk3pdYDZK5S");
        if (z11) {
            return;
        }
        try {
            HashMap map = v8.f16012a;
            c30.c cVarA = x0.a();
            cVarA.p(au3.f1102a, vu3.a((d7) tt3.f10079s));
            cVarA.p(au3.f1104b, vu3.a((d7) new ut3(0L)));
            cVarA.p(au3.f1106c, vu3.a((d7) new ut3(1L)));
            cVarA.p(au3.f1108d, vu3.a((d7) new ut3(2L)));
            cVarA.p(au3.f1110e, vu3.a((d7) new ut3(3L)));
            cVarA.p(au3.f1112f, vu3.a((d7) new ut3(4L)));
            cVarA.p(au3.f1114g, vu3.a((d7) new ut3(7L)));
            cVarA.p(au3.f1116h, vu3.a((d7) new ut3(-1L)));
            cVarA.p(au3.f1118i, vu3.a((d7) new ut3(-2L)));
            cVarA.p(au3.f1120j, vu3.a((d7) st3.f9664b));
            cVarA.p(au3.f1122k, vu3.a((d7) st3.f9666d));
            cVarA.p(au3.f1124l, vu3.a((d7) st3.f9672j));
            cVarA.p(au3.f1126m, vu3.a((d7) st3.f9673k));
            cVarA.p(au3.n, vu3.a((d7) st3.n));
            cVarA.p(au3.o, vu3.a((d7) tt3.n));
            cVarA.p(au3.f1129p, vu3.a((d7) st3.f9668f));
            cVarA.p(au3.f1130q, vu3.a((d7) st3.f9669g));
            cVarA.p(au3.f1131r, vu3.a((d7) st3.f9670h));
            cVarA.p(au3.f1132s, vu3.a((d7) st3.f9671i));
            cVarA.p(au3.f1133t, vu3.a((d7) tt3.f10070h));
            cVarA.p(au3.f1134u, vu3.a((d7) tt3.f10072j));
            cVarA.p(au3.f1136w, vu3.a((d7) st3.o));
            cVarA.p(au3.f1137x, vu3.a((d7) st3.f9676p));
            cVarA.p(au3.f1138y, vu3.a((d7) st3.f9679s));
            cVarA.p(au3.f1139z, vu3.a((d7) st3.f9680t));
            cVarA.p(au3.A, vu3.a((d7) st3.f9681u));
            cVarA.p(au3.B, vu3.a((d7) st3.f9682v));
            cVarA.p(au3.C, vu3.a((d7) tt3.f10064b));
            cVarA.p(au3.D, vu3.a((d7) tt3.f10066d));
            cVarA.p(au3.E, vu3.a((d7) tt3.f10067e));
            cVarA.p(au3.F, vu3.a((d7) tt3.f10068f));
            cVarA.p(au3.G, vu3.a((d7) tt3.f10073k));
            cVarA.p(au3.H, vu3.a((d7) tt3.f10074l));
            cVarA.p(au3.I, vu3.a((d7) tt3.f10076p));
            cVarA.p(au3.J, vu3.a((d7) tt3.f10077q));
            cVarA.p(au3.K, vu3.a((d7) tt3.f10081u));
            cVarA.p(au3.L, vu3.a((d7) tt3.f10082v));
            cVarA.p(au3.M, vu3.a((d7) wt3.f11397b));
            cVarA.p(au3.N, vu3.a((d7) wt3.f11399d));
            cVarA.p(au3.U, vu3.a((d7) wt3.f11400e));
            cVarA.p(au3.O, vu3.a((d7) wt3.f11405j));
            cVarA.p(au3.P, vu3.a((d7) wt3.f11406k));
            cVarA.p(au3.Q, vu3.a((d7) wt3.n));
            cVarA.p(au3.R, vu3.a((d7) wt3.f11410q));
            cVarA.p(au3.S, vu3.a((d7) st3.f9677q));
            cVarA.p(au3.T, vu3.a((d7) wt3.f11407l));
            cVarA.p(au3.V, vu3.a((d7) st3.f9674l));
            cVarA.p(au3.W, vu3.a((d7) wt3.f11402g));
            cVarA.p(au3.X, vu3.a((d7) wt3.f11403h));
            cVarA.p(au3.f1135v, vu3.a((d7) tt3.f10071i));
            cVarA.p(au3.Y, vu3.a((d7) wt3.f11409p));
            cVarA.p(au3.Z, vu3.a((d7) tt3.f10075m));
            cVarA.p(au3.f1103a0, vu3.a((d7) wt3.o));
            cVarA.p(au3.f1105b0, vu3.a((d7) tt3.f10065c));
            cVarA.p(au3.f1107c0, vu3.a((d7) wt3.f11398c));
            cVarA.p(au3.f1109d0, vu3.a((d7) st3.f9678r));
            cVarA.p(au3.f1111e0, vu3.a((d7) wt3.f11408m));
            cVarA.p(au3.f1113f0, vu3.a((d7) st3.f9667e));
            cVarA.p(au3.f1115g0, vu3.a((d7) wt3.f11401f));
            cVarA.p(au3.f1117h0, vu3.a((d7) tt3.f10080t));
            cVarA.p(au3.f1119i0, vu3.a((d7) st3.f9665c));
            cVarA.p(au3.f1121j0, vu3.a((d7) wt3.f11404i));
            cVarA.p(au3.f1123k0, vu3.a((d7) tt3.o));
            cVarA.p(au3.f1125l0, vu3.a((d7) st3.f9675m));
            cVarA.p(au3.f1127m0, vu3.a((d7) tt3.f10078r));
            cVarA.p(au3.f1128n0, vu3.a((d7) tt3.f10069g));
            w2 w2VarC = cVarA.c(true);
            for (long j11 = -1; j11 >= -82; j11--) {
                au3 au3Var = (au3) map.get(Long.valueOf(j11));
                if (au3Var == null) {
                    StringBuilder sb2 = new StringBuilder(String.valueOf(j11).length() + 36);
                    sb2.append(strA);
                    sb2.append(j11);
                    throw new ou3(sb2.toString());
                }
                qu3Var.f8820a.a((vu3) w2VarC.get(au3Var));
            }
            for (int iC = k9.c(2138952001, 664592093, -868790359, 1108537283) ^ 485904490; iC < 1159; iC++) {
                qu3Var.f8820a.a(vu3.a((Object) null));
            }
            this.f52117a = true;
        } catch (lu3 e3) {
            throw new xo3(vo3.f10839b, e3);
        }
    }

    @Override // q.v
    public void b(k kVar, boolean z11) {
        r.i iVar;
        n0 n0Var = (n0) this.f52118b;
        if (this.f52117a) {
            return;
        }
        this.f52117a = true;
        ActionMenuView actionMenuView = n0Var.f75310a.f84789a.f13800a;
        if (actionMenuView != null && (iVar = actionMenuView.f13746t) != null) {
            iVar.j();
            r.e eVar = iVar.f84740r;
            if (eVar != null && eVar.b()) {
                eVar.f83302i.dismiss();
            }
        }
        n0Var.f75311b.onPanelClosed(108, kVar);
        this.f52117a = false;
    }

    public void c() throws wi1 {
        int iC = k9.c(((~250198952) & 424581896) | 1125410098, (250198952 & 1481292330) | 1135682867, 1944425977, 41268864) ^ (1865036214 % 1099527851);
        try {
            int iC2 = ((qu3) this.f52118b).f8822c.c();
            int i5 = ((iC2 & iC) << 16) >> 16;
            int i11 = ((iC & (iC2 >> 16)) << 16) >> 16;
            if (i5 != -14426) {
                throw new wi1(xt3.a("Ake3rgkWMjm/WV6IwjgYPC5W5wzEVsBo").concat(String.format(xt3.a("e1Hk+x0="), Short.valueOf((short) i5))));
            }
            if (i11 == 5) {
                return;
            }
            throw new wi1(xt3.a("Ake3rgkWMjm/WV6IwjgYPC5A+hHdWNcn1PY=").concat(String.format(xt3.a("e1Hk+x0="), Short.valueOf((short) i11))));
        } catch (du3 e3) {
            throw new wi1(xt3.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), (Throwable) e3);
        }
    }

    public void d() throws wi1 {
        int[] iArr = {171029949, 1356422403, 1913211838, 215266853, 506454572, 1309457854, 56236614, 1696779465, 30245415};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int i14 = iArr[4];
        int iC = k9.c((i11 & (~i5)) | i12, (i5 & i13) | i14, iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        try {
            int iC2 = ((qu3) this.f52118b).f8822c.c();
            if (iC2 == iC) {
                return;
            }
            throw new wi1(xt3.a("HkeprgsbOny5AEiU1TIfNmpVqAjMRcch17g1").concat(String.format(xt3.a("e1Hk9x0="), Integer.valueOf(iC2))));
        } catch (du3 e3) {
            throw new wi1(xt3.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), (Throwable) e3);
        }
    }

    public void e() throws xo3 {
        try {
            qu3 qu3Var = (qu3) this.f52118b;
            int iC = qu3Var.f8822c.c();
            og.g gVar = qu3Var.f8822c;
            int[] iArr = d8.f15810a;
            ((kc) gVar.f80409d).getClass();
            gVar.f80408c = new c00.d(new x(iArr, iC));
        } catch (du3 e3) {
            throw new xo3(vo3.f10842e, e3);
        }
    }

    @Override // n30.c
    public boolean f() {
        return this.f52117a;
    }

    public wf.d h() {
        wf.a.i(!this.f52117a);
        this.f52117a = true;
        return new wf.d((SparseBooleanArray) this.f52118b);
    }

    public boolean i() {
        return this.f52117a;
    }

    public void j() {
        Stack stack = (Stack) this.f52118b;
        f30.f.a(!stack.isEmpty());
        stack.peek().getClass();
        throw new ClassCastException();
    }

    public boolean k(float f11, int i5, float f12, int i11) {
        o oVar = (o) this.f52118b;
        if (!this.f52117a) {
            return oVar.c(i5, i11, (int) f11, (int) f12);
        }
        n30.b bVar = n30.b.f77778b;
        return oVar.c(i5 * 2, i11 * 2, fg.a.l(f11).c(this), fg.a.l(f12).c(this));
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0039  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean l(int i5, CharSequence charSequence) {
        if (charSequence == null || i5 < 0 || charSequence.length() - i5 < 0) {
            throw new IllegalArgumentException();
        }
        y4.e eVar = (y4.e) this.f52118b;
        if (eVar == null) {
            return i();
        }
        eVar.getClass();
        char c11 = 2;
        for (int i11 = 0; i11 < i5 && c11 == 2; i11++) {
            byte directionality = Character.getDirectionality(charSequence.charAt(i11));
            j jVar = y4.f.f96646a;
            if (directionality == 0) {
                c11 = 1;
            } else if (directionality != 1 && directionality != 2) {
                switch (directionality) {
                    case 14:
                    case 15:
                        break;
                    case 16:
                    case 17:
                        break;
                    default:
                        c11 = 2;
                        break;
                }
            } else {
                c11 = 0;
            }
        }
        if (c11 == 0) {
            return true;
        }
        if (c11 != 1) {
            return i();
        }
        return false;
    }

    @Override // q.v
    public boolean m(k kVar) {
        ((n0) this.f52118b).f75311b.onMenuOpened(108, kVar);
        return true;
    }

    public void n(c00.c cVar) {
        ((o) this.f52118b).d(cVar.f57293e.c(this), cVar.f57294f.c(this), cVar.f57295g.c(this), cVar.f57296h.c(this), true);
    }

    @Override // ninja.sesame.lib.bridge.v1.SesameInitOnComplete
    public void onConnect() {
        this.f52117a = true;
        Function0 function0 = (Function0) ((WeakReference) this.f52118b).get();
        if (function0 != null) {
            function0.invoke();
        }
    }

    @Override // ninja.sesame.lib.bridge.v1.SesameInitOnComplete
    public void onDisconnect() {
        this.f52117a = false;
    }

    @Override // qh.b
    public Object zza() {
        return HsdpDeepLinkServiceFactory.lambda$createInternal$0((Context) this.f52118b, this.f52117a);
    }

    public /* synthetic */ j(Object obj, boolean z11) {
        this.f52118b = obj;
        this.f52117a = z11;
    }

    public j(int i5) {
        switch (i5) {
            case 7:
                this.f52118b = new SparseBooleanArray();
                break;
            default:
                int[] iArr = {530498338, 909437126, 1273894288, 894494823, 1232015929, -100152071, 858712529, 970925433, 309198987};
                int i11 = iArr[7] % iArr[8];
                e0 e0Var = new e0(1);
                kc kcVar = new kc(28);
                og.g gVar = new og.g(zt3.f12664b, 0, new io.sentry.hints.i(false));
                gVar.f80409d = kcVar;
                this.f52118b = new qu3(e0Var, gVar);
                this.f52117a = false;
                break;
        }
    }

    public void c(int i5) {
        wf.a.i(!this.f52117a);
        ((SparseBooleanArray) this.f52118b).append(i5, true);
    }

    public j(y4.e eVar, boolean z11) {
        this(eVar);
        this.f52117a = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x0062 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x00a7 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(long j11, Optional optional) throws xo3, wi1 {
        hm2 hm2Var;
        Object objOf;
        long j12;
        qu3 qu3Var = (qu3) this.f52118b;
        try {
            if (!this.f52117a) {
                a();
            }
            og.g gVar = qu3Var.f8822c;
            try {
                e0 e0Var = qu3Var.f8820a;
                gVar.a(0L);
                gVar.f80408c = new io.sentry.hints.i(false);
                c();
                d();
                e();
                try {
                    qu3Var.f8822c.a(j11);
                    r2 r2Var = d6.f15809a;
                    Optional.empty();
                    Object objOrElseGet = optional.orElseGet(fu3.f3526c);
                    e0Var.a(objOrElseGet instanceof vu3 ? (vu3) objOrElseGet : vu3.b(objOrElseGet));
                    e0Var.a(vu3.a((Object) null));
                    au auVar = qu3Var.f8821b;
                    auVar.a(0L, 0L, e0Var.f15451b);
                    while (!((ArrayDeque) auVar.f1092a).isEmpty()) {
                        long jA = qu3Var.f8822c.a();
                        try {
                            long jB = qu3Var.f8822c.b();
                            try {
                                e0 e0Var2 = qu3Var.f8820a;
                                try {
                                    try {
                                        objOf = ((vu3) e0Var2.f15450a.get(e0Var2.a(jB))).f().apply(qu3Var);
                                    } catch (Throwable unused) {
                                        hm2Var = hm2.f4458w;
                                        objOf = Optional.of(hm2Var);
                                        if (((Optional) objOf).isPresent()) {
                                        }
                                    }
                                } catch (su3 unused2) {
                                    hm2Var = hm2.f4443d;
                                }
                            } catch (ku3 unused3) {
                                hm2Var = hm2.f4442c;
                            }
                        } catch (du3 unused4) {
                            hm2Var = hm2.f4457v;
                        }
                        if (((Optional) objOf).isPresent()) {
                            if (!d6.f15809a.contains(((Optional) objOf).get())) {
                                throw new xo3(vo3.f10845h, (hm2) ((Optional) objOf).get(), jA);
                            }
                            Object obj = ((Optional) objOf).get();
                            long jA2 = qu3Var.f8822c.a();
                            do {
                                try {
                                    j12 = qu3Var.f8821b.a().f4088c;
                                    Optional optionalA = qu3Var.a();
                                    if (optionalA.isPresent() && optionalA.get() == hm2.f4459x) {
                                        throw new xo3(vo3.f10845h, (hm2) obj, jA2);
                                    }
                                    if (optionalA.isPresent()) {
                                        throw new xo3(vo3.f10845h, (hm2) optionalA.get(), jA2);
                                    }
                                } catch (iu3 unused5) {
                                    throw new xo3(vo3.f10845h, (hm2) obj, jA2);
                                }
                            } while (j12 != 2);
                        }
                    }
                    try {
                        e0 e0Var3 = qu3Var.f8820a;
                        vu3 vu3VarA = e0Var3.a();
                        e0Var3.a();
                        return vu3VarA.a();
                    } catch (ku3 e3) {
                        throw new xo3(vo3.f10843f, e3);
                    } catch (su3 e11) {
                        throw new xo3(vo3.f10844g, e11);
                    }
                } catch (cu3 e12) {
                    e = e12;
                    throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
                } catch (du3 e13) {
                    e = e13;
                    throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
                }
            } catch (cu3 e14) {
                e = e14;
                throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
            } catch (du3 e15) {
                e = e15;
                throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
            }
        } catch (hu3 e16) {
            throw new xo3(vo3.f10841d, e16);
        } catch (lu3 e17) {
            throw new xo3(vo3.f10840c, e17);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:152:0x0452 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:157:0x040d A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(Optional optional) throws xo3, wi1 {
        long j11;
        Object obj;
        hm2 hm2Var;
        Object objOf;
        long j12;
        long jB;
        e0 e0Var;
        qu3 qu3Var = (qu3) this.f52118b;
        int iC = k9.c(616386615, 1609881029, -1418081056, 652996966) ^ 2379269;
        try {
            try {
                long j13 = 2;
                if (this.f52117a) {
                    j11 = 2;
                    obj = null;
                } else {
                    String strA = xt3.a("BkCyvAwRMTm0TkOZyDYQMHRR/BfGWZQu16Q1Ljk3pdYDZK5S");
                    try {
                        HashMap map = v8.f16012a;
                        c30.c cVarA = x0.a();
                        cVarA.p(au3.f1102a, vu3.a((d7) tt3.f10079s));
                        cVarA.p(au3.f1104b, hb.c(0L));
                        cVarA.p(au3.f1106c, hb.c(1L));
                        cVarA.p(au3.f1108d, hb.c(2L));
                        cVarA.p(au3.f1110e, hb.c(3L));
                        cVarA.p(au3.f1112f, hb.c(4L));
                        cVarA.p(au3.f1114g, hb.c(7L));
                        obj = null;
                        cVarA.p(au3.f1116h, hb.c(-1L));
                        cVarA.p(au3.f1118i, hb.c(-2L));
                        cVarA.p(au3.f1120j, vu3.a((d7) st3.f9664b));
                        cVarA.p(au3.f1122k, vu3.a((d7) st3.f9666d));
                        cVarA.p(au3.f1124l, vu3.a((d7) st3.f9672j));
                        cVarA.p(au3.f1126m, vu3.a((d7) st3.f9673k));
                        cVarA.p(au3.n, vu3.a((d7) st3.n));
                        cVarA.p(au3.o, vu3.a((d7) tt3.n));
                        cVarA.p(au3.f1129p, vu3.a((d7) st3.f9668f));
                        cVarA.p(au3.f1130q, vu3.a((d7) st3.f9669g));
                        cVarA.p(au3.f1131r, vu3.a((d7) st3.f9670h));
                        cVarA.p(au3.f1132s, vu3.a((d7) st3.f9671i));
                        cVarA.p(au3.f1133t, vu3.a((d7) tt3.f10070h));
                        cVarA.p(au3.f1134u, vu3.a((d7) tt3.f10072j));
                        cVarA.p(au3.f1136w, vu3.a((d7) st3.o));
                        cVarA.p(au3.f1137x, vu3.a((d7) st3.f9676p));
                        cVarA.p(au3.f1138y, vu3.a((d7) st3.f9679s));
                        cVarA.p(au3.f1139z, vu3.a((d7) st3.f9680t));
                        cVarA.p(au3.A, vu3.a((d7) st3.f9681u));
                        cVarA.p(au3.B, vu3.a((d7) st3.f9682v));
                        cVarA.p(au3.C, vu3.a((d7) tt3.f10064b));
                        cVarA.p(au3.D, vu3.a((d7) tt3.f10066d));
                        cVarA.p(au3.E, vu3.a((d7) tt3.f10067e));
                        cVarA.p(au3.F, vu3.a((d7) tt3.f10068f));
                        cVarA.p(au3.G, vu3.a((d7) tt3.f10073k));
                        cVarA.p(au3.H, vu3.a((d7) tt3.f10074l));
                        cVarA.p(au3.I, vu3.a((d7) tt3.f10076p));
                        cVarA.p(au3.J, vu3.a((d7) tt3.f10077q));
                        cVarA.p(au3.K, vu3.a((d7) tt3.f10081u));
                        cVarA.p(au3.L, vu3.a((d7) tt3.f10082v));
                        cVarA.p(au3.M, vu3.a((d7) wt3.f11397b));
                        cVarA.p(au3.N, vu3.a((d7) wt3.f11399d));
                        cVarA.p(au3.U, vu3.a((d7) wt3.f11400e));
                        cVarA.p(au3.O, vu3.a((d7) wt3.f11405j));
                        cVarA.p(au3.P, vu3.a((d7) wt3.f11406k));
                        cVarA.p(au3.Q, vu3.a((d7) wt3.n));
                        cVarA.p(au3.R, vu3.a((d7) wt3.f11410q));
                        cVarA.p(au3.S, vu3.a((d7) st3.f9677q));
                        cVarA.p(au3.T, vu3.a((d7) wt3.f11407l));
                        cVarA.p(au3.V, vu3.a((d7) st3.f9674l));
                        cVarA.p(au3.W, vu3.a((d7) wt3.f11402g));
                        cVarA.p(au3.X, vu3.a((d7) wt3.f11403h));
                        cVarA.p(au3.f1135v, vu3.a((d7) tt3.f10071i));
                        cVarA.p(au3.Y, vu3.a((d7) wt3.f11409p));
                        cVarA.p(au3.Z, vu3.a((d7) tt3.f10075m));
                        cVarA.p(au3.f1103a0, vu3.a((d7) wt3.o));
                        cVarA.p(au3.f1105b0, vu3.a((d7) tt3.f10065c));
                        cVarA.p(au3.f1107c0, vu3.a((d7) wt3.f11398c));
                        cVarA.p(au3.f1109d0, vu3.a((d7) st3.f9678r));
                        cVarA.p(au3.f1111e0, vu3.a((d7) wt3.f11408m));
                        cVarA.p(au3.f1113f0, vu3.a((d7) st3.f9667e));
                        cVarA.p(au3.f1115g0, vu3.a((d7) wt3.f11401f));
                        cVarA.p(au3.f1117h0, vu3.a((d7) tt3.f10080t));
                        cVarA.p(au3.f1119i0, vu3.a((d7) st3.f9665c));
                        cVarA.p(au3.f1121j0, vu3.a((d7) wt3.f11404i));
                        cVarA.p(au3.f1123k0, vu3.a((d7) tt3.o));
                        cVarA.p(au3.f1125l0, vu3.a((d7) st3.f9675m));
                        cVarA.p(au3.f1127m0, vu3.a((d7) tt3.f10078r));
                        cVarA.p(au3.f1128n0, vu3.a((d7) tt3.f10069g));
                        x0 x0VarD = cVarA.d();
                        long j14 = -1;
                        while (j14 >= -82) {
                            long j15 = j13;
                            au3 au3Var = (au3) map.get(Long.valueOf(j14));
                            if (au3Var == null) {
                                StringBuilder sb2 = new StringBuilder(String.valueOf(j14).length() + 36);
                                sb2.append(strA);
                                sb2.append(j14);
                                throw new ou3(sb2.toString());
                            }
                            qu3Var.f8820a.a((vu3) x0VarD.get(au3Var));
                            j14--;
                            j13 = j15;
                        }
                        j11 = j13;
                        for (int i5 = 82; i5 < iC; i5++) {
                            qu3Var.f8820a.a(vu3.a((Object) null));
                        }
                        this.f52117a = true;
                    } catch (lu3 e3) {
                        throw new xo3(vo3.f10839b, e3);
                    }
                }
                og.g gVar = qu3Var.f8822c;
                try {
                    e0 e0Var2 = qu3Var.f8820a;
                    og.g gVar2 = qu3Var.f8822c;
                    gVar.a(0L);
                    gVar.f80408c = new io.sentry.hints.i(27);
                    String strA2 = xt3.a("Ake3rgkWMjm/WV6IwjgYPC5W5wzEVsBo");
                    String strA3 = xt3.a("Ake3rgkWMjm/WV6IwjgYPC5A+hHdWNcn1PY=");
                    try {
                        int iC2 = gVar2.c();
                        int i11 = ((iC2 & 65535) << 16) >> 16;
                        int i12 = (((iC2 >> 16) & 65535) << 16) >> 16;
                        if (i11 != -14426) {
                            throw new wi1(strA2.concat(String.format(xt3.a("e1Hk+x0="), Short.valueOf((short) i11))));
                        }
                        if (i12 != 5) {
                            throw new wi1(strA3.concat(String.format(xt3.a("e1Hk+x0="), Short.valueOf((short) i12))));
                        }
                        String strA4 = xt3.a("HkeprgsbOny5AEiU1TIfNmpVqAjMRcch17g1");
                        try {
                            int iC3 = gVar2.c();
                            if (iC3 != 1182321202) {
                                throw new wi1(strA4.concat(String.format(xt3.a("e1Hk9x0="), Integer.valueOf(iC3))));
                            }
                            try {
                                int iC4 = gVar2.c();
                                int[] iArr = d8.f15810a;
                                ((kc) gVar2.f80409d).getClass();
                                gVar2.f80408c = new c00.d(new x(iArr, iC4));
                                try {
                                    gVar2.a(96L);
                                    r2 r2Var = d6.f15809a;
                                    Optional.empty();
                                    Object objOrElseGet = optional.orElseGet(fu3.f3526c);
                                    e0Var2.a(objOrElseGet instanceof vu3 ? (vu3) objOrElseGet : vu3.b(objOrElseGet));
                                    e0Var2.a(vu3.a(obj));
                                    au auVar = qu3Var.f8821b;
                                    auVar.a(0L, 0L, e0Var2.f15451b);
                                    while (!((ArrayDeque) auVar.f1092a).isEmpty()) {
                                        long jA = qu3Var.f8822c.a();
                                        try {
                                            jB = qu3Var.f8822c.b();
                                            try {
                                                e0Var = qu3Var.f8820a;
                                                try {
                                                } catch (su3 unused) {
                                                    hm2Var = hm2.f4443d;
                                                }
                                            } catch (ku3 unused2) {
                                                hm2Var = hm2.f4442c;
                                            }
                                        } catch (du3 unused3) {
                                            hm2Var = hm2.f4457v;
                                        }
                                        try {
                                            objOf = ((vu3) e0Var.f15450a.get(e0Var.a(jB))).f().apply(qu3Var);
                                        } catch (Throwable unused4) {
                                            hm2Var = hm2.f4458w;
                                            objOf = Optional.of(hm2Var);
                                            if (((Optional) objOf).isPresent()) {
                                            }
                                        }
                                        if (((Optional) objOf).isPresent()) {
                                            if (!d6.f15809a.contains(((Optional) objOf).get())) {
                                                throw new xo3(vo3.f10845h, (hm2) ((Optional) objOf).get(), jA);
                                            }
                                            Object obj2 = ((Optional) objOf).get();
                                            long jA2 = qu3Var.f8822c.a();
                                            do {
                                                try {
                                                    j12 = qu3Var.f8821b.a().f4088c;
                                                    Optional optionalA = qu3Var.a();
                                                    if (optionalA.isPresent() && optionalA.get() == hm2.f4459x) {
                                                        throw new xo3(vo3.f10845h, (hm2) obj2, jA2);
                                                    }
                                                    if (optionalA.isPresent()) {
                                                        throw new xo3(vo3.f10845h, (hm2) optionalA.get(), jA2);
                                                    }
                                                } catch (iu3 unused5) {
                                                    throw new xo3(vo3.f10845h, (hm2) obj2, jA2);
                                                }
                                            } while (j12 != j11);
                                        }
                                    }
                                    try {
                                        e0 e0Var3 = qu3Var.f8820a;
                                        vu3 vu3VarA = e0Var3.a();
                                        e0Var3.a();
                                        return vu3VarA.a();
                                    } catch (ku3 e11) {
                                        throw new xo3(vo3.f10843f, e11);
                                    } catch (su3 e12) {
                                        throw new xo3(vo3.f10844g, e12);
                                    }
                                } catch (cu3 e13) {
                                    e = e13;
                                    throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
                                } catch (du3 e14) {
                                    e = e14;
                                    throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
                                }
                            } catch (du3 e15) {
                                throw new xo3(vo3.f10842e, e15);
                            }
                        } catch (du3 e16) {
                            throw new wi1(xt3.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), e16);
                        }
                    } catch (du3 e17) {
                        throw new wi1(xt3.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), e17);
                    }
                } catch (cu3 e18) {
                    e = e18;
                    throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
                } catch (du3 e19) {
                    e = e19;
                    throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
                }
            } catch (lu3 e21) {
                throw new xo3(vo3.f10840c, e21);
            }
        } catch (hu3 e22) {
            throw new xo3(vo3.f10841d, e22);
        }
    }
}
