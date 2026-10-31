package q10;

import android.content.Context;
import android.content.Intent;
import android.graphics.Point;
import android.net.http.UrlResponseInfo;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.cloudmessaging.RegisterRequest;
import com.google.android.gms.common.Feature;
import com.google.android.gms.internal.consent_sdk.z;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigServerException;
import cy.t;
import e00.u3;
import fe.k0;
import gf.x0;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import m3.l0;
import o9.n1;
import p1.s2;
import rg.m;
import s90.a1;
import s90.b1;
import s90.g1;
import s90.p;
import s90.q0;
import s90.s;
import s90.w0;
import s90.x;
import t0.p0;
import t0.y1;
import t70.j0;
import t70.m0;
import tf.n;
import wf.v;
import xk.r2;
import xk.s0;
import xk.v0;
import ya.w;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements d9.i, x, b1, tf.l, fi.e, fi.c, w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83436a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f83437b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f83438c;

    public /* synthetic */ d(int i5, Object obj, Object obj2) {
        this.f83436a = i5;
        this.f83437b = obj;
        this.f83438c = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0080  */
    @Override // tf.l
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public r2 a(int i5, x0 x0Var, int[] iArr) {
        int i11;
        int i12;
        int i13;
        int i14;
        Point point;
        int i15;
        x0 x0Var2 = x0Var;
        switch (this.f83436a) {
            case 5:
                tf.h hVar = (tf.h) this.f83437b;
                int i16 = ((int[]) this.f83438c)[i5];
                int i17 = hVar.f89161i;
                int i18 = hVar.f89162j;
                boolean z11 = hVar.f89163k;
                if (i17 == Integer.MAX_VALUE || i18 == Integer.MAX_VALUE) {
                    i11 = LayoutNode.NotPlacedPlaceOrder;
                } else {
                    int i19 = Integer.MAX_VALUE;
                    for (int i21 = 0; i21 < x0Var2.f57655a; i21++) {
                        k0 k0Var = x0Var2.f57658d[i21];
                        int i22 = k0Var.f54886q;
                        int i23 = k0Var.f54887r;
                        if (i22 > 0 && i23 > 0) {
                            if (z11) {
                                if ((i22 > i23) != (i17 > i18)) {
                                    i14 = i17;
                                    i13 = i18;
                                }
                                int i24 = i22 * i14;
                                int i25 = i23 * i13;
                                if (i24 < i25) {
                                }
                                i15 = k0Var.f54886q;
                                int i26 = i15 * i23;
                                if (i15 < ((int) (point.x * 0.98f))) {
                                }
                            } else {
                                i13 = i17;
                                i14 = i18;
                                int i242 = i22 * i14;
                                int i252 = i23 * i13;
                                point = i242 < i252 ? new Point(i13, v.f(i252, i22)) : new Point(v.f(i242, i23), i14);
                                i15 = k0Var.f54886q;
                                int i262 = i15 * i23;
                                if (i15 < ((int) (point.x * 0.98f)) && i23 >= ((int) (point.y * 0.98f)) && i262 < i19) {
                                    i19 = i262;
                                }
                            }
                        }
                    }
                    i11 = i19;
                }
                s0 s0VarL = v0.l();
                int i27 = 0;
                while (i27 < x0Var2.f57655a) {
                    k0 k0Var2 = x0Var2.f57658d[i27];
                    int i28 = k0Var2.f54886q;
                    int i29 = (i28 == -1 || (i12 = k0Var2.f54887r) == -1) ? -1 : i28 * i12;
                    s0VarL.a(new n(i5, x0Var2, i27, hVar, iArr[i27], i16, i11 == Integer.MAX_VALUE || (i29 != -1 && i29 <= i11)));
                    i27++;
                    x0Var2 = x0Var;
                }
                return s0VarL.f();
            default:
                tf.h hVar2 = (tf.h) this.f83437b;
                String str = (String) this.f83438c;
                s0 s0VarL2 = v0.l();
                for (int i31 = 0; i31 < x0Var2.f57655a; i31++) {
                    s0VarL2.a(new tf.k(i5, x0Var2, i31, hVar2, iArr[i31], str));
                }
                return s0VarL2.f();
        }
    }

    public com.google.android.gms.internal.consent_sdk.a b(p0 p0Var) {
        y1 y1Var = (y1) this.f83437b;
        m3.e eVar = (m3.e) this.f83438c;
        l0 l0Var = (l0) ((s2) y1Var.f88303a).getValue();
        int i5 = 0;
        if (l0Var == null) {
            return new com.google.android.gms.internal.consent_sdk.a(new sx.d(3), i5, i5, 11);
        }
        m3.e eVarC = y1.c(eVar, l0Var);
        if (eVarC == null) {
            return new com.google.android.gms.internal.consent_sdk.a(new sx.d(2), i5, i5, 11);
        }
        y3.l lVarY = p6.j.y(l0Var.h(eVarC.f75853b, eVarC.f75854c).b());
        return new com.google.android.gms.internal.consent_sdk.a(new n0.w(lVarY, 20), lVarY.h(), lVarY.c(), 11);
    }

    @Override // d9.i
    public void d(d9.c cVar) {
        m0.t((j0) this.f83437b, null, null, new t((Context) this.f83438c, null, 6), 3);
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        HashSet hashSet = (HashSet) this.f83437b;
        n1 n1Var = (n1) this.f83438c;
        if (!(view instanceof BubbleTextView) || !hashSet.contains(eVar)) {
            if ((eVar instanceof ga.c) && (view instanceof FolderIcon)) {
                ((FolderIcon) view).m0(new u3(hashSet, 14));
            }
            return false;
        }
        ga.j jVar = (ga.j) eVar;
        BubbleTextView bubbleTextView = (BubbleTextView) view;
        aa.n nVar = bubbleTextView.f20869f;
        boolean z11 = (nVar instanceof z9.d) && !((z9.d) nVar).D;
        if (bubbleTextView instanceof FolderIcon) {
            ((FolderIcon) bubbleTextView).X((iz.a) n1Var.V.f21025g.b(new ComponentKey(jVar.f57322x.getComponent(), eVar.o)));
            return false;
        }
        bubbleTextView.x(jVar, jVar.O0(3) != z11);
        return false;
    }

    @Override // fi.e
    public void onComplete(Task task) {
        ((tm.f) this.f83437b).a((Intent) this.f83438c);
    }

    @Override // s90.x
    public Object run() throws Exception {
        switch (this.f83436a) {
            case 1:
                s90.h hVar = (s90.h) this.f83437b;
                return hVar.f86957a.openConnection((URL) this.f83438c);
            default:
                p pVar = (p) this.f83437b;
                UrlResponseInfo urlResponseInfo = (UrlResponseInfo) this.f83438c;
                pVar.getClass();
                pVar.f86994a.onResponseStarted(pVar.f86995b, s.b(urlResponseInfo));
                return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:170:0x0060 A[EXC_TOP_SPLITTER, PHI: r13
      0x0060: PHI (r13v7 java.io.InputStream) = (r13v6 java.io.InputStream), (r13v8 java.io.InputStream) binds: [B:30:0x006f, B:19:0x005e] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:172:0x007e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:176:0x0159 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:178:0x00f8 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00ec A[Catch: all -> 0x0075, TRY_LEAVE, TryCatch #15 {all -> 0x0075, blocks: (B:11:0x003f, B:13:0x0042, B:14:0x0043, B:20:0x0060, B:27:0x006a, B:28:0x006d, B:37:0x0079, B:75:0x00e8, B:77:0x00ec, B:79:0x00ef, B:83:0x00f3, B:78:0x00ed), top: B:183:0x001b, inners: #13 }] */
    /* JADX WARN: Type inference failed for: r11v2 */
    /* JADX WARN: Type inference failed for: r11v4 */
    /* JADX WARN: Type inference failed for: r11v5, types: [java.lang.Integer, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v6 */
    /* JADX WARN: Type inference failed for: r11v7 */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r11v9, types: [java.lang.Integer, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r15v22, types: [com.google.android.gms.tasks.Task] */
    /* JADX WARN: Type inference failed for: r15v23 */
    /* JADX WARN: Type inference failed for: r15v24 */
    /* JADX WARN: Type inference failed for: r15v25 */
    /* JADX WARN: Type inference failed for: r15v38 */
    /* JADX WARN: Type inference failed for: r15v39, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r15v56, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r15v67 */
    /* JADX WARN: Type inference failed for: r1v17, types: [xm.l] */
    @Override // fi.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object then(Task task) throws Throwable {
        InputStream errorStream;
        Integer num;
        ?? ValueOf;
        int responseCode;
        InputStream inputStream;
        switch (this.f83436a) {
            case 8:
                bn.s0 s0Var = (bn.s0) this.f83437b;
                ExecutorService executorService = (ExecutorService) this.f83438c;
                s0Var.getClass();
                if (!task.q()) {
                    return Tasks.c(task.l() != null ? task.l() : new ExecutionException(new RuntimeException("Unexpected Error")));
                }
                String str = (String) task.m();
                return ((om.d) ((om.e) s0Var.f18281d)).e().k(Executors.newSingleThreadExecutor(new yg.a("Firebase-Messaging-Network-Io")), new d(9, s0Var, str)).i(executorService, new ep.a(str, 5));
            case 9:
                bn.s0 s0Var2 = (bn.s0) this.f83437b;
                String str2 = (String) this.f83438c;
                ul.g gVar = (ul.g) s0Var2.f18280c;
                if (!task.q()) {
                    return Tasks.c(task.l() != null ? task.l() : new ExecutionException(new RuntimeException("Unexpected Error")));
                }
                String str3 = ((om.b) task.m()).f80504a;
                gVar.a();
                ul.i iVar = gVar.f91322c;
                String str4 = iVar.f91335a;
                gVar.a();
                RegisterRequest registerRequest = new RegisterRequest(ja.d.i(gVar), iVar.f91336b, str4, str2, str3);
                kh.c cVar = (kh.c) s0Var2.f18279b;
                cVar.getClass();
                cz.b bVarB = m.b();
                bVarB.f48576d = new Feature[]{og.c.f80388a};
                bVarB.f48575c = new io.sentry.internal.debugmeta.c(cVar, registerRequest);
                bVarB.f48574b = 39001;
                return cVar.c(0, bVarB.a());
            case 10:
                tm.g gVar2 = (tm.g) this.f83437b;
                String str5 = (String) this.f83438c;
                synchronized (gVar2) {
                    ((z.e) gVar2.f89476b).remove(str5);
                }
                return task;
            case 11:
                return ((xm.i) this.f83437b).b(task, 0L, (HashMap) this.f83438c);
            default:
                ?? r12 = (xm.l) this.f83437b;
                ?? inputStream2 = (Task) this.f83438c;
                xg.a aVar = r12.o;
                InputStream inputStream3 = null;
                try {
                    try {
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream3 = inputStream2;
                        num = ValueOf;
                        r12.b(inputStream3, errorStream);
                        synchronized (r12) {
                            r12.f96147b = false;
                            if (r12.f96150e || (num != null && !xm.l.d(num.intValue()))) {
                                z = false;
                            }
                            if (z) {
                                aVar.getClass();
                                r12.k(new Date(System.currentTimeMillis()));
                            }
                            if (z || num.intValue() == 200) {
                                r12.h();
                            } else {
                                String strF = String.format("Unable to connect to the server. Try again in a few minutes. HTTP status code: %d", num);
                                if (num.intValue() == 403) {
                                    strF = xm.l.f(r12.f96151f.getErrorStream());
                                }
                                new FirebaseRemoteConfigServerException(num.intValue(), strF, 0);
                                r12.g();
                            }
                            throw th;
                        }
                    }
                } catch (IOException unused) {
                    inputStream2 = 0;
                    errorStream = null;
                } catch (Throwable th3) {
                    th = th3;
                    errorStream = null;
                    num = null;
                    r12.b(inputStream3, errorStream);
                    synchronized (r12) {
                    }
                }
                if (!inputStream2.q()) {
                    throw new IOException(inputStream2.l());
                }
                HttpURLConnection httpURLConnection = (HttpURLConnection) inputStream2.m();
                r12.f96151f = httpURLConnection;
                inputStream2 = httpURLConnection.getInputStream();
                try {
                    errorStream = r12.f96151f.getErrorStream();
                } catch (IOException unused2) {
                    errorStream = null;
                    inputStream2 = inputStream2;
                    ValueOf = errorStream;
                    if (r12.f96150e) {
                    }
                    r12.b(inputStream2, errorStream);
                    synchronized (r12) {
                    }
                } catch (Throwable th4) {
                    th = th4;
                    errorStream = null;
                    ValueOf = 0;
                }
                try {
                    responseCode = r12.f96151f.getResponseCode();
                    ValueOf = Integer.valueOf(responseCode);
                    if (responseCode == 200) {
                        try {
                            synchronized (r12) {
                                r12.f96148c = 8;
                            }
                            r12.f96159p.n(0, xm.n.f96165f);
                            z zVarJ = r12.j(r12.f96151f);
                            HttpURLConnection httpURLConnection2 = (HttpURLConnection) zVarJ.f32327b;
                            if (httpURLConnection2 != null) {
                                try {
                                    inputStream = httpURLConnection2.getInputStream();
                                    try {
                                        zVarJ.e(inputStream);
                                    } catch (IOException unused3) {
                                        if (inputStream != null) {
                                        }
                                        r12.b(inputStream2, errorStream);
                                        synchronized (r12) {
                                        }
                                    } catch (Throwable th5) {
                                        th = th5;
                                        if (inputStream != null) {
                                            try {
                                                inputStream.close();
                                            } catch (IOException unused4) {
                                            }
                                        }
                                        throw th;
                                    }
                                } catch (IOException unused5) {
                                    inputStream = null;
                                } catch (Throwable th6) {
                                    th = th6;
                                    inputStream = null;
                                }
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException unused6) {
                                    }
                                }
                            }
                        } catch (IOException unused7) {
                            if (r12.f96150e) {
                                synchronized (r12) {
                                    r12.f96148c = 8;
                                }
                            }
                            r12.b(inputStream2, errorStream);
                            synchronized (r12) {
                                r12.f96147b = false;
                            }
                            if (r12.f96150e || (ValueOf != 0 && !xm.l.d(ValueOf.intValue()))) {
                                z = false;
                            }
                            if (z) {
                                aVar.getClass();
                                r12.k(new Date(System.currentTimeMillis()));
                            }
                            if (!z && ValueOf.intValue() != 200) {
                                String strF2 = String.format("Unable to connect to the server. Try again in a few minutes. HTTP status code: %d", ValueOf);
                                if (ValueOf.intValue() == 403) {
                                    strF2 = xm.l.f(r12.f96151f.getErrorStream());
                                }
                                new FirebaseRemoteConfigServerException(ValueOf.intValue(), strF2, 0);
                                r12.g();
                                r12.f96151f = null;
                                return Tasks.d(null);
                            }
                            r12.h();
                            r12.f96151f = null;
                            return Tasks.d(null);
                        }
                    }
                    r12.b(inputStream2, errorStream);
                    synchronized (r12) {
                        r12.f96147b = false;
                    }
                    z = !r12.f96150e && xm.l.d(responseCode);
                    if (z) {
                        aVar.getClass();
                        r12.k(new Date(System.currentTimeMillis()));
                    }
                } catch (IOException unused8) {
                    ValueOf = 0;
                } catch (Throwable th7) {
                    th = th7;
                    ValueOf = 0;
                    inputStream3 = inputStream2;
                    num = ValueOf;
                    r12.b(inputStream3, errorStream);
                    synchronized (r12) {
                    }
                }
                if (!z && responseCode != 200) {
                    String strF3 = String.format("Unable to connect to the server. Try again in a few minutes. HTTP status code: %d", ValueOf);
                    if (responseCode == 403) {
                        strF3 = xm.l.f(r12.f96151f.getErrorStream());
                    }
                    new FirebaseRemoteConfigServerException(responseCode, strF3, 0);
                    r12.g();
                    r12.f96151f = null;
                    return Tasks.d(null);
                }
                r12.h();
                r12.f96151f = null;
                return Tasks.d(null);
        }
    }

    @Override // s90.b1
    /* renamed from: run */
    public void mo109run() throws IOException {
        int i5;
        a1 a1Var = (a1) this.f83437b;
        ByteBuffer byteBuffer = (ByteBuffer) this.f83438c;
        ReadableByteChannel readableByteChannel = a1Var.n;
        if (readableByteChannel != null) {
            a1Var.f86873w++;
            i5 = readableByteChannel.read(byteBuffer);
        } else {
            i5 = -1;
        }
        s90.x0 x0Var = a1Var.f86853a;
        if (i5 != -1) {
            g1 g1Var = a1Var.o;
            x0Var.getClass();
            x0Var.b(new be.f(9, x0Var, g1Var, byteBuffer), "onReadCompleted");
            return;
        }
        ReadableByteChannel readableByteChannel2 = a1Var.n;
        if (readableByteChannel2 != null) {
            readableByteChannel2.close();
        }
        if (a1Var.f86858f.compareAndSet(5, 7)) {
            a1Var.d("fireDisconnect", new q0(a1Var, 2));
            g1 g1Var2 = a1Var.o;
            x0Var.getClass();
            x0Var.c("onSucceeded", new w0(x0Var, g1Var2, 1));
        }
    }
}
