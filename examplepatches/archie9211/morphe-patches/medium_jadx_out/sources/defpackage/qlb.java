package defpackage;

import android.R;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Arrays;
import java.util.Stack;
import org.chromium.support_lib_boundary.WebViewProviderFactoryBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class qlb implements c44, ln4, y60, k6, ex, mre, f2f, khf {
    public Object a;

    public qlb(m73 m73Var) {
        float f = plc.a;
        l80 l80Var = new l80();
        l80Var.a = f;
        float fB = m73Var.b();
        float f2 = fn4.a;
        l80Var.b = fB * 386.0878f * 160.0f * 0.84f;
        this.a = l80Var;
    }

    public static void e(byte b, byte b2, int i, long j) throws kc6 {
        if (b == 3) {
            throw new kc6("unsynchronized server");
        }
        if (b2 != 4 && b2 != 5) {
            throw new kc6(b09.w(b2, "untrusted mode: "));
        }
        if (i == 0 || i > 15) {
            throw new kc6(b09.w(i, "untrusted stratum: "));
        }
        if (j == 0) {
            throw new kc6("zero transmitTime");
        }
    }

    public static long n(int i, byte[] bArr) {
        int i2 = bArr[i];
        int i3 = bArr[i + 1];
        int i4 = bArr[i + 2];
        int i5 = bArr[i + 3];
        if ((i2 & 128) == 128) {
            i2 = (i2 & 127) + 128;
        }
        if ((i3 & 128) == 128) {
            i3 = (i3 & 127) + 128;
        }
        if ((i4 & 128) == 128) {
            i4 = (i4 & 127) + 128;
        }
        if ((i5 & 128) == 128) {
            i5 = (i5 & 127) + 128;
        }
        return (((long) i2) << 24) + (((long) i3) << 16) + (((long) i4) << 8) + ((long) i5);
    }

    public static long u(int i, byte[] bArr) {
        long jN = n(i, bArr);
        return ((n(i + 4, bArr) * 1000) / 4294967296L) + ((jN - 2208988800L) * 1000);
    }

    @Override // defpackage.y60
    public Object C(xrb xrbVar, Float f, Float f2, x45 x45Var, hic hicVar) {
        float fFloatValue = f.floatValue();
        float fFloatValue2 = f2.floatValue();
        Object objK = en7.k(xrbVar, Math.signum(fFloatValue2) * Math.abs(fFloatValue), fFloatValue, g76.e(0.0f, fFloatValue2, 28), (ww) this.a, x45Var, hicVar);
        return objK == tb2.COROUTINE_SUSPENDED ? objK : (tw) objK;
    }

    @Override // defpackage.f2f
    public String[] G() {
        return ((WebViewProviderFactoryBoundaryInterface) this.a).getSupportedFeatures();
    }

    @Override // defpackage.c44
    public dva a() throws Throwable {
        jmb jmbVarB;
        IOException iOException = null;
        while (!((rva) this.a).k.q) {
            try {
                jmbVarB = ((rva) this.a).b();
            } catch (IOException e) {
                if (iOException == null) {
                    iOException = e;
                } else {
                    kyd.D(iOException, e);
                }
                if (!((rva) this.a).a(null)) {
                    throw iOException;
                }
            }
            if (!jmbVarB.c()) {
                imb imbVarD = jmbVarB.d();
                if (imbVarD.b == null && imbVarD.c == null) {
                    imbVarD = jmbVarB.g();
                }
                jmb jmbVar = imbVarD.b;
                Throwable th = imbVarD.c;
                if (th != null) {
                    throw th;
                }
                if (jmbVar != null) {
                    ((rva) this.a).p.addFirst(jmbVar);
                }
            }
            return jmbVarB.b();
        }
        ik4.g("Canceled");
        return null;
    }

    @Override // defpackage.jre
    public boolean b() {
        return false;
    }

    @Override // defpackage.c44
    public rva c() {
        return (rva) this.a;
    }

    @Override // defpackage.ln4
    public float d() {
        return 0.0f;
    }

    public void f(g21 g21Var) {
        if (!g21Var.q()) {
            if (!(g21Var instanceof tlb)) {
                String strValueOf = String.valueOf(g21Var.getClass());
                ay0.e(ka1.v(new StringBuilder(strValueOf.length() + 49), "Has a new type of ByteString been created? Found ", strValueOf));
                return;
            } else {
                tlb tlbVar = (tlb) g21Var;
                f(tlbVar.c);
                f(tlbVar.d);
                return;
            }
        }
        int size = g21Var.size();
        int[] iArr = tlb.h;
        int iBinarySearch = Arrays.binarySearch(iArr, size);
        if (iBinarySearch < 0) {
            iBinarySearch = (-(iBinarySearch + 1)) - 1;
        }
        int i = iArr[iBinarySearch + 1];
        Stack stack = (Stack) this.a;
        if (stack.isEmpty() || ((g21) stack.peek()).size() >= i) {
            stack.push(g21Var);
            return;
        }
        int i2 = iArr[iBinarySearch];
        g21 tlbVar2 = (g21) stack.pop();
        while (!stack.isEmpty() && ((g21) stack.peek()).size() < i2) {
            tlbVar2 = new tlb((g21) stack.pop(), tlbVar2);
        }
        tlb tlbVar3 = new tlb(tlbVar2, g21Var);
        while (!stack.isEmpty()) {
            int[] iArr2 = tlb.h;
            int iBinarySearch2 = Arrays.binarySearch(iArr2, tlbVar3.b);
            if (iBinarySearch2 < 0) {
                iBinarySearch2 = (-(iBinarySearch2 + 1)) - 1;
            }
            if (((g21) stack.peek()).size() >= iArr2[iBinarySearch2 + 1]) {
                break;
            } else {
                tlbVar3 = new tlb((g21) stack.pop(), tlbVar3);
            }
        }
        stack.push(tlbVar3);
    }

    public void g() {
        View view = (View) this.a;
        if (view != null) {
            ((InputMethodManager) view.getContext().getSystemService("input_method")).hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    @Override // defpackage.ex
    public hn4 get(int i) {
        return (pn4) this.a;
    }

    @Override // defpackage.f2f
    public WebkitToCompatConverterBoundaryInterface getWebkitToCompatConverter() {
        return (WebkitToCompatConverterBoundaryInterface) vx0.H(WebkitToCompatConverterBoundaryInterface.class, ((WebViewProviderFactoryBoundaryInterface) this.a).getWebkitToCompatConverter());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object h(java.lang.String r5, boolean r6, defpackage.p92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.s1c
            if (r0 == 0) goto L13
            r0 = r7
            s1c r0 = (defpackage.s1c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            s1c r0 = new s1c
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r4 = r7.a
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            java.lang.Object r4 = r4.a
            gl9 r4 = (defpackage.gl9) r4
            r0.d = r3
            java.io.Serializable r4 = r4.f(r5, r6, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qlb.h(java.lang.String, boolean, p92):java.lang.Object");
    }

    @Override // defpackage.ln4
    public float i(float f, long j) {
        long j2 = j / 1000000;
        en4 en4VarA = ((l80) this.a).a(f);
        long j3 = en4VarA.c;
        return (((Math.signum(en4VarA.a) * lp.a(j3 > 0 ? j2 / j3 : 1.0f).b) * en4VarA.b) / j3) * 1000.0f;
    }

    @Override // defpackage.jre
    public dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.a).j(j, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.ln4
    public float k(float f, float f2, long j) {
        long j2 = j / 1000000;
        en4 en4VarA = ((l80) this.a).a(f2);
        long j3 = en4VarA.c;
        return (Math.signum(en4VarA.a) * en4VarA.b * lp.a(j3 > 0 ? j2 / j3 : 1.0f).a) + f;
    }

    public w1c l(JSONObject jSONObject) throws JSONException {
        f2c rz5Var;
        int i = jSONObject.getInt("settings_version");
        if (i != 3) {
            Log.e("FirebaseCrashlytics", "Could not determine SettingsJsonTransform for settings version " + i + ". Using default settings values.", null);
            rz5Var = new h1c(15);
        } else {
            rz5Var = new rz5(23);
        }
        return rz5Var.b((z46) this.a, jSONObject);
    }

    @Override // defpackage.ln4
    public long o(float f) {
        return ((long) (Math.exp(((l80) this.a).b(f) / (((double) fn4.a) - 1.0d)) * 1000.0d)) * 1000000;
    }

    @Override // defpackage.ln4
    public float p(float f, float f2) {
        l80 l80Var = (l80) this.a;
        double dB = l80Var.b(f2);
        double d = fn4.a;
        return (Math.signum(f2) * ((float) (Math.exp((d / (d - 1.0d)) * dB) * ((double) (l80Var.a * l80Var.b))))) + f;
    }

    @Override // defpackage.jre
    public dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.a).r(j, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.a).s(dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.a).t(dxVar, dxVar2, dxVar3);
    }

    public ijc v(String str, Long l) throws Throwable {
        DatagramSocket datagramSocket = null;
        try {
            str.getClass();
            InetAddress byName = InetAddress.getByName(str);
            byName.getClass();
            DatagramSocket datagramSocket2 = new DatagramSocket();
            try {
                datagramSocket2.setSoTimeout(l.intValue());
                byte[] bArr = new byte[48];
                DatagramPacket datagramPacket = new DatagramPacket(bArr, 48, byName, 123);
                bArr[0] = 27;
                long jCurrentTimeMillis = System.currentTimeMillis();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                long j = jCurrentTimeMillis / 1000;
                Long.signum(j);
                long j2 = jCurrentTimeMillis - (j * 1000);
                long j3 = j + 2208988800L;
                bArr[40] = (byte) (j3 >> 24);
                bArr[41] = (byte) (j3 >> 16);
                bArr[42] = (byte) (j3 >> 8);
                bArr[43] = (byte) j3;
                long j4 = (j2 * 4294967296L) / 1000;
                bArr[44] = (byte) (j4 >> 24);
                bArr[45] = (byte) (j4 >> 16);
                bArr[46] = (byte) (j4 >> 8);
                bArr[47] = (byte) (Math.random() * 255.0d);
                datagramSocket2.send(datagramPacket);
                byte[] bArrCopyOf = Arrays.copyOf(bArr, 48);
                datagramSocket2.receive(new DatagramPacket(bArrCopyOf, bArrCopyOf.length));
                long jElapsedRealtime2 = SystemClock.elapsedRealtime();
                long j5 = (jElapsedRealtime2 - jElapsedRealtime) + jCurrentTimeMillis;
                byte b = bArrCopyOf[0];
                int i = bArrCopyOf[1] & 255;
                long jU = u(24, bArrCopyOf);
                long jU2 = u(32, bArrCopyOf);
                long jU3 = u(40, bArrCopyOf);
                e((byte) ((b >> 6) & 3), (byte) (b & 7), i, jU3);
                ijc ijcVar = new ijc(j5, jElapsedRealtime2, ((jU3 - j5) + (jU2 - jU)) / 2, (wz7) this.a);
                datagramSocket2.close();
                return ijcVar;
            } catch (Throwable th) {
                th = th;
                datagramSocket = datagramSocket2;
                if (datagramSocket != null) {
                    datagramSocket.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0094  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object w(defpackage.wj1 r21, defpackage.m45 r22) {
        /*
            Method dump skipped, instruction units count: 212
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qlb.w(wj1, m45):java.lang.Object");
    }

    public void x() {
        View viewFindViewById;
        View view = (View) this.a;
        if (view == null) {
            return;
        }
        if (view.isInEditMode() || view.onCheckIsTextEditor()) {
            view.requestFocus();
            viewFindViewById = view;
        } else {
            viewFindViewById = view.getRootView().findFocus();
        }
        if (viewFindViewById == null) {
            viewFindViewById = view.getRootView().findViewById(R.id.content);
        }
        if (viewFindViewById == null || !viewFindViewById.hasWindowFocus()) {
            return;
        }
        viewFindViewById.post(new b2a(5, viewFindViewById));
    }

    @Override // defpackage.khf
    public /* bridge */ /* synthetic */ Object y() {
        return new thf((phf) ((vgf) this.a).y());
    }

    public /* synthetic */ qlb(Object obj) {
        this.a = obj;
    }
}
