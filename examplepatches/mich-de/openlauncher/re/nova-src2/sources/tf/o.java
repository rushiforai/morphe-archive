package tf;

import ai.y0;
import android.content.Context;
import android.media.AudioManager;
import android.text.TextUtils;
import android.util.Pair;
import com.amplitude.core.events.Identify;
import fe.h0;
import fe.k0;
import gf.x0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.RandomAccess;
import xk.l2;
import xk.r2;
import xk.v0;

/* loaded from: classes3.dex */
public final class o extends c3.b {
    public static final l2 n = l2.a(new com.google.firebase.crashlytics.internal.persistence.c(16));
    public static final l2 o = l2.a(new com.google.firebase.crashlytics.internal.persistence.c(17));

    /* renamed from: g, reason: collision with root package name */
    public final Object f89112g;

    /* renamed from: h, reason: collision with root package name */
    public final Context f89113h;

    /* renamed from: i, reason: collision with root package name */
    public final b6.b f89114i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f89115j;

    /* renamed from: k, reason: collision with root package name */
    public h f89116k;

    /* renamed from: l, reason: collision with root package name */
    public final y0 f89117l;

    /* renamed from: m, reason: collision with root package name */
    public he.d f89118m;

    public o(Context context) {
        b6.b bVar = new b6.b();
        int i5 = h.P;
        h hVar = new h(new g(context));
        this.f89112g = new Object();
        this.f89113h = context != null ? context.getApplicationContext() : null;
        this.f89114i = bVar;
        this.f89116k = hVar;
        this.f89118m = he.d.f59672g;
        boolean z11 = context != null && wf.v.x(context);
        this.f89115j = z11;
        if (!z11 && context != null && wf.v.f94376a >= 32) {
            AudioManager audioManager = (AudioManager) context.getSystemService("audio");
            this.f89117l = audioManager != null ? new y0(audioManager.getSpatializer()) : null;
        }
        if (this.f89116k.J && context == null) {
            wf.a.D("DefaultTrackSelector", "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument.");
        }
    }

    public static void E(gf.y0 y0Var, h hVar, HashMap map) {
        for (int i5 = 0; i5 < y0Var.f57666a; i5++) {
            s sVar = (s) hVar.f89175y.get(y0Var.a(i5));
            if (sVar != null) {
                x0 x0Var = sVar.f89127a;
                s sVar2 = (s) map.get(Integer.valueOf(x0Var.f57657c));
                if (sVar2 == null || (sVar2.f89128b.isEmpty() && !sVar.f89128b.isEmpty())) {
                    map.put(Integer.valueOf(x0Var.f57657c), sVar);
                }
            }
        }
    }

    public static int F(k0 k0Var, String str, boolean z11) {
        if (!TextUtils.isEmpty(str) && str.equals(k0Var.f54874c)) {
            return 4;
        }
        String strJ = J(str);
        String strJ2 = J(k0Var.f54874c);
        if (strJ2 == null || strJ == null) {
            return (z11 && strJ2 == null) ? 1 : 0;
        }
        if (strJ2.startsWith(strJ) || strJ.startsWith(strJ2)) {
            return 3;
        }
        int i5 = wf.v.f94376a;
        return strJ2.split(Identify.UNSET_VALUE, 2)[0].equals(strJ.split(Identify.UNSET_VALUE, 2)[0]) ? 2 : 0;
    }

    public static boolean H(int i5, boolean z11) {
        int i11 = i5 & 7;
        if (i11 != 4) {
            return z11 && i11 == 3;
        }
        return true;
    }

    public static String J(String str) {
        if (TextUtils.isEmpty(str) || TextUtils.equals(str, "und")) {
            return null;
        }
        return str;
    }

    public static Pair K(int i5, r rVar, int[][][] iArr, l lVar, Comparator comparator) {
        int i11;
        RandomAccess randomAccessS;
        r rVar2 = rVar;
        ArrayList arrayList = new ArrayList();
        int i12 = rVar2.f89121a;
        int i13 = 0;
        while (i13 < i12) {
            if (i5 == rVar2.f89122b[i13]) {
                gf.y0 y0Var = rVar2.f89123c[i13];
                for (int i14 = 0; i14 < y0Var.f57666a; i14++) {
                    x0 x0VarA = y0Var.a(i14);
                    r2 r2VarA = lVar.a(i13, x0VarA, iArr[i13][i14]);
                    int i15 = x0VarA.f57655a;
                    boolean[] zArr = new boolean[i15];
                    int i16 = 0;
                    while (i16 < i15) {
                        m mVar = (m) r2VarA.get(i16);
                        int iA = mVar.a();
                        if (zArr[i16] || iA == 0) {
                            i11 = i12;
                        } else {
                            if (iA == 1) {
                                randomAccessS = v0.s(mVar);
                            } else {
                                ArrayList arrayList2 = new ArrayList();
                                arrayList2.add(mVar);
                                int i17 = i16 + 1;
                                while (i17 < i15) {
                                    m mVar2 = (m) r2VarA.get(i17);
                                    int i18 = i12;
                                    if (mVar2.a() == 2 && mVar.b(mVar2)) {
                                        arrayList2.add(mVar2);
                                        zArr[i17] = true;
                                    }
                                    i17++;
                                    i12 = i18;
                                }
                                randomAccessS = arrayList2;
                            }
                            i11 = i12;
                            arrayList.add(randomAccessS);
                        }
                        i16++;
                        i12 = i11;
                    }
                }
            }
            i13++;
            rVar2 = rVar;
            i12 = i12;
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        List list = (List) Collections.max(arrayList, comparator);
        int[] iArr2 = new int[list.size()];
        for (int i19 = 0; i19 < list.size(); i19++) {
            iArr2[i19] = ((m) list.get(i19)).f89098c;
        }
        m mVar3 = (m) list.get(0);
        return Pair.create(new p(0, mVar3.f89097b, iArr2), Integer.valueOf(mVar3.f89096a));
    }

    public final h G() {
        h hVar;
        synchronized (this.f89112g) {
            hVar = this.f89116k;
        }
        return hVar;
    }

    public final void I() {
        boolean z11;
        h0 h0Var;
        y0 y0Var;
        synchronized (this.f89112g) {
            try {
                z11 = this.f89116k.J && !this.f89115j && wf.v.f94376a >= 32 && (y0Var = this.f89117l) != null && y0Var.f13474b;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (!z11 || (h0Var = (h0) this.f19222a) == null) {
            return;
        }
        h0Var.f54816h.c(10);
    }

    public final void L(h hVar) {
        boolean zEquals;
        hVar.getClass();
        synchronized (this.f89112g) {
            zEquals = this.f89116k.equals(hVar);
            this.f89116k = hVar;
        }
        if (zEquals) {
            return;
        }
        if (hVar.J && this.f89113h == null) {
            wf.a.D("DefaultTrackSelector", "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument.");
        }
        h0 h0Var = (h0) this.f19222a;
        if (h0Var != null) {
            h0Var.f54816h.c(10);
        }
    }
}
