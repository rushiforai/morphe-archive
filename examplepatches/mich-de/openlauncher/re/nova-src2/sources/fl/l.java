package fl;

import ai.k4;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import com.google.android.exoplayer2.source.UnrecognizedInputFormatException;
import com.google.firebase.encoders.EncodingException;
import com.stripe.android.core.AppInfo;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import cw.u0;
import cw.v0;
import fr.r0;
import h6.e1;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.l4;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import kotlin.LazyKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kw.l2;
import kw.w0;
import m.p0;
import t70.y0;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes3.dex */
public class l implements h60.e, hb.e, io.branch.requery.android.database.sqlite.i, kk.c {

    /* renamed from: e, reason: collision with root package name */
    public static l f55372e;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55373a;

    /* renamed from: b, reason: collision with root package name */
    public Object f55374b;

    /* renamed from: c, reason: collision with root package name */
    public Object f55375c;

    /* renamed from: d, reason: collision with root package name */
    public Object f55376d;

    public /* synthetic */ l(int i5, byte b11) {
        this.f55373a = i5;
    }

    public static fr.i h(l lVar, String url, ApiRequest$Options options, Map map, int i5) {
        if ((i5 & 4) != 0) {
            map = null;
        }
        lVar.getClass();
        Intrinsics.g(url, "url");
        Intrinsics.g(options, "options");
        return new fr.i(r0.f55694b, url, map, options, (AppInfo) lVar.f55376d, (String) lVar.f55374b, (String) lVar.f55375c);
    }

    public static fr.i i(l lVar, String url, ApiRequest$Options options, Map map, int i5) {
        if ((i5 & 4) != 0) {
            map = null;
        }
        lVar.getClass();
        Intrinsics.g(url, "url");
        Intrinsics.g(options, "options");
        return new fr.i(r0.f55695c, url, map, options, (AppInfo) lVar.f55376d, (String) lVar.f55374b, (String) lVar.f55375c);
    }

    public static Float j(Duration duration) {
        if (duration != null) {
            return Float.valueOf((float) Duration.p(duration.f72041a, DurationUnit.f72045d));
        }
        return null;
    }

    public static void n(l lVar, e3 e3Var) {
        long[] jArr = (long[]) lVar.f55376d;
        l lVar2 = (l) e3Var.f67208b;
        long[] jArr2 = (long[]) lVar2.f55376d;
        long[] jArr3 = (long[]) e3Var.f67209c;
        kl.a.m(jArr, jArr2, jArr3);
        long[] jArr4 = (long[]) lVar.f55374b;
        long[] jArr5 = (long[]) lVar2.f55374b;
        long[] jArr6 = (long[]) lVar2.f55375c;
        kl.a.m(jArr4, jArr5, jArr6);
        kl.a.m((long[]) lVar.f55375c, jArr6, jArr3);
    }

    public void A(g4.e eVar, int i5, int i11, int i12) {
        eVar.getClass();
        int i13 = eVar.f57083a0;
        int i14 = eVar.f57085b0;
        eVar.f57083a0 = 0;
        eVar.f57085b0 = 0;
        eVar.J(i11);
        eVar.G(i12);
        if (i13 < 0) {
            eVar.f57083a0 = 0;
        } else {
            eVar.f57083a0 = i13;
        }
        if (i14 < 0) {
            eVar.f57085b0 = 0;
        } else {
            eVar.f57085b0 = i14;
        }
        g4.e eVar2 = (g4.e) this.f55375c;
        eVar2.f57124s0 = i5;
        eVar2.P();
    }

    public void B(fc0.e[] eVarArr) {
        BitSet bitSet = new BitSet(eVarArr.length);
        int i5 = 0;
        int i11 = 0;
        for (fc0.e eVar : eVarArr) {
            if (eVar.e()) {
                bitSet.set(i11);
            }
            i11++;
        }
        while (true) {
            int iNextSetBit = bitSet.nextSetBit(i5);
            if (iNextSetBit <= -1) {
                return;
            }
            int iNextClearBit = bitSet.nextClearBit(iNextSetBit);
            if (iNextClearBit == -1) {
                Arrays.sort(eVarArr, iNextSetBit, bitSet.size(), new ay.g(this, 4));
                return;
            } else {
                Arrays.sort(eVarArr, iNextSetBit, iNextClearBit, new ay.g(this, 4));
                i5 = iNextClearBit;
            }
        }
    }

    public j30.g C(j30.f fVar, j30.a aVar) {
        j30.g gVar = new j30.g(this, fVar, aVar);
        ((ThreadPoolExecutor) this.f55375c).execute(gVar);
        return gVar;
    }

    public byte[] D() {
        long[] jArr = new long[10];
        long[] jArr2 = new long[10];
        long[] jArr3 = new long[10];
        long[] jArr4 = (long[]) this.f55375c;
        long[] jArr5 = new long[10];
        long[] jArr6 = new long[10];
        long[] jArr7 = new long[10];
        long[] jArr8 = new long[10];
        long[] jArr9 = new long[10];
        long[] jArr10 = new long[10];
        long[] jArr11 = new long[10];
        long[] jArr12 = new long[10];
        long[] jArr13 = new long[10];
        long[] jArr14 = new long[10];
        kl.a.t(jArr5, jArr4);
        kl.a.t(jArr14, jArr5);
        kl.a.t(jArr13, jArr14);
        kl.a.m(jArr6, jArr13, jArr4);
        kl.a.m(jArr7, jArr6, jArr5);
        kl.a.t(jArr13, jArr7);
        kl.a.m(jArr8, jArr13, jArr6);
        kl.a.t(jArr13, jArr8);
        kl.a.t(jArr14, jArr13);
        kl.a.t(jArr13, jArr14);
        kl.a.t(jArr14, jArr13);
        kl.a.t(jArr13, jArr14);
        kl.a.m(jArr9, jArr13, jArr8);
        kl.a.t(jArr13, jArr9);
        kl.a.t(jArr14, jArr13);
        for (int i5 = 2; i5 < 10; i5 += 2) {
            kl.a.t(jArr13, jArr14);
            kl.a.t(jArr14, jArr13);
        }
        kl.a.m(jArr10, jArr14, jArr9);
        kl.a.t(jArr13, jArr10);
        kl.a.t(jArr14, jArr13);
        for (int i11 = 2; i11 < 20; i11 += 2) {
            kl.a.t(jArr13, jArr14);
            kl.a.t(jArr14, jArr13);
        }
        kl.a.m(jArr13, jArr14, jArr10);
        kl.a.t(jArr14, jArr13);
        kl.a.t(jArr13, jArr14);
        for (int i12 = 2; i12 < 10; i12 += 2) {
            kl.a.t(jArr14, jArr13);
            kl.a.t(jArr13, jArr14);
        }
        kl.a.m(jArr11, jArr13, jArr9);
        kl.a.t(jArr13, jArr11);
        kl.a.t(jArr14, jArr13);
        for (int i13 = 2; i13 < 50; i13 += 2) {
            kl.a.t(jArr13, jArr14);
            kl.a.t(jArr14, jArr13);
        }
        kl.a.m(jArr12, jArr14, jArr11);
        kl.a.t(jArr14, jArr12);
        kl.a.t(jArr13, jArr14);
        for (int i14 = 2; i14 < 100; i14 += 2) {
            kl.a.t(jArr14, jArr13);
            kl.a.t(jArr13, jArr14);
        }
        kl.a.m(jArr14, jArr13, jArr12);
        kl.a.t(jArr13, jArr14);
        kl.a.t(jArr14, jArr13);
        for (int i15 = 2; i15 < 50; i15 += 2) {
            kl.a.t(jArr13, jArr14);
            kl.a.t(jArr14, jArr13);
        }
        kl.a.m(jArr13, jArr14, jArr11);
        kl.a.t(jArr14, jArr13);
        kl.a.t(jArr13, jArr14);
        kl.a.t(jArr14, jArr13);
        kl.a.t(jArr13, jArr14);
        kl.a.t(jArr14, jArr13);
        kl.a.m(jArr, jArr14, jArr7);
        kl.a.m(jArr2, (long[]) this.f55376d, jArr);
        kl.a.m(jArr3, (long[]) this.f55374b, jArr);
        byte[] bArrC = kl.a.c(jArr3);
        bArrC[31] = (byte) (((kl.a.c(jArr2)[0] & 1) << 7) ^ bArrC[31]);
        return bArrC;
    }

    public void E(g4.e eVar) {
        ArrayList arrayList = (ArrayList) this.f55376d;
        arrayList.clear();
        int size = eVar.f57121p0.size();
        for (int i5 = 0; i5 < size; i5++) {
            g4.d dVar = (g4.d) eVar.f57121p0.get(i5);
            int[] iArr = dVar.f57109o0;
            if (iArr[0] == 3 || iArr[1] == 3) {
                arrayList.add(dVar);
            }
        }
        eVar.f57123r0.f59099b = true;
    }

    public m a() throws GeneralSecurityException {
        t5.d0 d0Var;
        tl.a aVarB;
        o oVar = (o) this.f55376d;
        if (oVar == null || (d0Var = (t5.d0) this.f55374b) == null) {
            throw new GeneralSecurityException("Cannot build without parameters and/or key material");
        }
        if (oVar.f55394a != ((tl.a) d0Var.f88562b).f89442a.length) {
            throw new GeneralSecurityException("Key size mismatch");
        }
        if (oVar.a() && ((Integer) this.f55375c) == null) {
            throw new GeneralSecurityException("Cannot create key without ID requirement with parameters with ID requirement");
        }
        if (!((o) this.f55376d).a() && ((Integer) this.f55375c) != null) {
            throw new GeneralSecurityException("Cannot create key with ID requirement with parameters without ID requirement");
        }
        j jVar = ((o) this.f55376d).f55397d;
        if (jVar == j.f55346m) {
            aVarB = kl.c0.f71572a;
        } else if (jVar == j.f55345l) {
            aVarB = kl.c0.a(((Integer) this.f55375c).intValue());
        } else {
            if (jVar != j.f55344k) {
                throw new IllegalStateException("Unknown AesEaxParameters.Variant: " + ((o) this.f55376d).f55397d);
            }
            aVarB = kl.c0.b(((Integer) this.f55375c).intValue());
        }
        return new m((o) this.f55376d, (t5.d0) this.f55374b, aVarB, (Integer) this.f55375c);
    }

    public p b() throws GeneralSecurityException {
        t5.d0 d0Var;
        tl.a aVarB;
        r rVar = (r) this.f55376d;
        if (rVar == null || (d0Var = (t5.d0) this.f55374b) == null) {
            throw new GeneralSecurityException("Cannot build without parameters and/or key material");
        }
        if (rVar.f55408a != ((tl.a) d0Var.f88562b).f89442a.length) {
            throw new GeneralSecurityException("Key size mismatch");
        }
        if (rVar.a() && ((Integer) this.f55375c) == null) {
            throw new GeneralSecurityException("Cannot create key without ID requirement with parameters with ID requirement");
        }
        if (!((r) this.f55376d).a() && ((Integer) this.f55375c) != null) {
            throw new GeneralSecurityException("Cannot create key with ID requirement with parameters without ID requirement");
        }
        j jVar = ((r) this.f55376d).f55411d;
        if (jVar == j.f55347p) {
            aVarB = kl.c0.f71572a;
        } else if (jVar == j.o) {
            aVarB = kl.c0.a(((Integer) this.f55375c).intValue());
        } else {
            if (jVar != j.n) {
                throw new IllegalStateException("Unknown AesGcmParameters.Variant: " + ((r) this.f55376d).f55411d);
            }
            aVarB = kl.c0.b(((Integer) this.f55375c).intValue());
        }
        return new p((r) this.f55376d, (t5.d0) this.f55374b, aVarB, (Integer) this.f55375c);
    }

    @Override // hb.e
    public Bitmap c(Rect rect, BitmapFactory.Options options) {
        if (((Canvas) this.f55374b) == null) {
            this.f55374b = new Canvas();
            Paint paint = new Paint();
            this.f55375c = paint;
            paint.setFilterBitmap(true);
        }
        int iMax = Math.max(options.inSampleSize, 1);
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(rect.width() / iMax, rect.height() / iMax, Bitmap.Config.ARGB_8888);
        ((Canvas) this.f55374b).setBitmap(bitmapCreateBitmap);
        ((Canvas) this.f55374b).save();
        float f11 = 1.0f / iMax;
        ((Canvas) this.f55374b).scale(f11, f11);
        ((Canvas) this.f55374b).drawBitmap((Bitmap) this.f55376d, -rect.left, -rect.top, (Paint) this.f55375c);
        ((Canvas) this.f55374b).restore();
        ((Canvas) this.f55374b).setBitmap(null);
        return bitmapCreateBitmap;
    }

    public s d() throws GeneralSecurityException {
        t5.d0 d0Var;
        tl.a aVarB;
        u uVar = (u) this.f55376d;
        if (uVar == null || (d0Var = (t5.d0) this.f55374b) == null) {
            throw new GeneralSecurityException("Cannot build without parameters and/or key material");
        }
        if (uVar.f55420a != ((tl.a) d0Var.f88562b).f89442a.length) {
            throw new GeneralSecurityException("Key size mismatch");
        }
        if (uVar.a() && ((Integer) this.f55375c) == null) {
            throw new GeneralSecurityException("Cannot create key without ID requirement with parameters with ID requirement");
        }
        if (!((u) this.f55376d).a() && ((Integer) this.f55375c) != null) {
            throw new GeneralSecurityException("Cannot create key with ID requirement with parameters without ID requirement");
        }
        j jVar = ((u) this.f55376d).f55421b;
        if (jVar == j.f55350s) {
            aVarB = kl.c0.f71572a;
        } else if (jVar == j.f55349r) {
            aVarB = kl.c0.a(((Integer) this.f55375c).intValue());
        } else {
            if (jVar != j.f55348q) {
                throw new IllegalStateException("Unknown AesGcmSivParameters.Variant: " + ((u) this.f55376d).f55421b);
            }
            aVarB = kl.c0.b(((Integer) this.f55375c).intValue());
        }
        return new s((u) this.f55376d, (t5.d0) this.f55374b, aVarB, (Integer) this.f55375c);
    }

    public ll.a e() throws GeneralSecurityException {
        t5.d0 d0Var;
        tl.a aVarA;
        ll.d dVar = (ll.d) this.f55376d;
        if (dVar == null || (d0Var = (t5.d0) this.f55374b) == null) {
            throw new GeneralSecurityException("Cannot build without parameters and/or key material");
        }
        if (dVar.f74998a != ((tl.a) d0Var.f88562b).f89442a.length) {
            throw new GeneralSecurityException("Key size mismatch");
        }
        if (dVar.a() && ((Integer) this.f55375c) == null) {
            throw new GeneralSecurityException("Cannot create key without ID requirement with parameters with ID requirement");
        }
        if (!((ll.d) this.f55376d).a() && ((Integer) this.f55375c) != null) {
            throw new GeneralSecurityException("Cannot create key with ID requirement with parameters without ID requirement");
        }
        ll.c cVar = ((ll.d) this.f55376d).f75000c;
        if (cVar == ll.c.f74996e) {
            aVarA = kl.c0.f71572a;
        } else if (cVar == ll.c.f74995d || cVar == ll.c.f74994c) {
            aVarA = kl.c0.a(((Integer) this.f55375c).intValue());
        } else {
            if (cVar != ll.c.f74993b) {
                throw new IllegalStateException("Unknown AesCmacParametersParameters.Variant: " + ((ll.d) this.f55376d).f75000c);
            }
            aVarA = kl.c0.b(((Integer) this.f55375c).intValue());
        }
        return new ll.a((ll.d) this.f55376d, (t5.d0) this.f55374b, aVarA, (Integer) this.f55375c);
    }

    public ll.h f() throws GeneralSecurityException {
        t5.d0 d0Var;
        tl.a aVarA;
        ll.m mVar = (ll.m) this.f55376d;
        if (mVar == null || (d0Var = (t5.d0) this.f55374b) == null) {
            throw new GeneralSecurityException("Cannot build without parameters and/or key material");
        }
        if (mVar.f75027a != ((tl.a) d0Var.f88562b).f89442a.length) {
            throw new GeneralSecurityException("Key size mismatch");
        }
        if (mVar.a() && ((Integer) this.f55375c) == null) {
            throw new GeneralSecurityException("Cannot create key without ID requirement with parameters with ID requirement");
        }
        if (!((ll.m) this.f55376d).a() && ((Integer) this.f55375c) != null) {
            throw new GeneralSecurityException("Cannot create key with ID requirement with parameters without ID requirement");
        }
        ll.l lVar = ((ll.m) this.f55376d).f75029c;
        if (lVar == ll.l.f75025e) {
            aVarA = kl.c0.f71572a;
        } else if (lVar == ll.l.f75024d || lVar == ll.l.f75023c) {
            aVarA = kl.c0.a(((Integer) this.f55375c).intValue());
        } else {
            if (lVar != ll.l.f75022b) {
                throw new IllegalStateException("Unknown HmacParameters.Variant: " + ((ll.m) this.f55376d).f75029c);
            }
            aVarA = kl.c0.b(((Integer) this.f55375c).intValue());
        }
        return new ll.h((ll.m) this.f55376d, (t5.d0) this.f55374b, aVarA, (Integer) this.f55375c);
    }

    public void g(h60.f fVar) {
        HashSet hashSet = (HashSet) this.f55375c;
        ArrayList arrayList = (ArrayList) this.f55374b;
        if (arrayList.contains(fVar)) {
            return;
        }
        if (hashSet.contains(fVar)) {
            throw new IllegalStateException("Cyclic dependency chain found: " + hashSet);
        }
        hashSet.add(fVar);
        fVar.configure(this);
        hashSet.remove(fVar);
        if (arrayList.contains(fVar)) {
            return;
        }
        if (i60.b.class.isAssignableFrom(fVar.getClass())) {
            arrayList.add(0, fVar);
        } else {
            arrayList.add(fVar);
        }
    }

    @Override // hb.e
    public int getHeight() {
        return ((Bitmap) this.f55376d).getHeight();
    }

    @Override // hb.e
    public int getWidth() {
        return ((Bitmap) this.f55376d).getWidth();
    }

    public void k(Object obj, ByteArrayOutputStream byteArrayOutputStream) {
        HashMap map = (HashMap) this.f55376d;
        jm.g gVar = new jm.g(byteArrayOutputStream, map, (HashMap) this.f55374b, (gm.d) this.f55375c);
        if (obj == null) {
            return;
        }
        gm.d dVar = (gm.d) map.get(obj.getClass());
        if (dVar != null) {
            dVar.encode(obj, gVar);
        } else {
            throw new EncodingException("No encoder for " + obj.getClass());
        }
    }

    public void l(gq.e eVar) {
        ((fr.l) this.f55376d).a(((fr.c) this.f55374b).a(eVar, eVar.getParams()));
    }

    public void m(gs.g gVar) {
        t70.m0.t(t70.k0.a((CoroutineContext) this.f55375c), null, null, new h6.w(this, gVar, null, 3), 3);
    }

    public h60.f o() {
        h60.f fVar;
        h60.f fVar2;
        ArrayList arrayList = (ArrayList) this.f55376d;
        Iterator it = ((ArrayList) this.f55374b).iterator();
        while (true) {
            fVar = null;
            if (!it.hasNext()) {
                fVar2 = null;
                break;
            }
            fVar2 = (h60.f) it.next();
            if (i60.b.class.isAssignableFrom(fVar2.getClass())) {
                break;
            }
        }
        if (fVar2 != null) {
            return fVar2;
        }
        Iterator it2 = arrayList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            h60.f fVar3 = (h60.f) it2.next();
            if (i60.b.class.isAssignableFrom(fVar3.getClass())) {
                fVar = fVar3;
                break;
            }
        }
        if (fVar != null) {
            g(fVar);
            return fVar;
        }
        throw new IllegalStateException("Requested plugin is not added: " + i60.b.class.getName() + ", plugins: " + arrayList);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:162:0x0223 A[Catch: all -> 0x0227, TRY_ENTER, TryCatch #0 {all -> 0x0227, blocks: (B:7:0x001c, B:9:0x0033, B:12:0x003a, B:162:0x0223, B:165:0x022a, B:168:0x0232, B:171:0x0238, B:174:0x023e, B:175:0x0241, B:176:0x0244, B:17:0x0048), top: B:227:0x001c }] */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0238 A[Catch: all -> 0x0227, TryCatch #0 {all -> 0x0227, blocks: (B:7:0x001c, B:9:0x0033, B:12:0x003a, B:162:0x0223, B:165:0x022a, B:168:0x0232, B:171:0x0238, B:174:0x023e, B:175:0x0241, B:176:0x0244, B:17:0x0048), top: B:227:0x001c }] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void p(vf.k kVar, Uri uri, Map map, long j11, long j12, gf.l0 l0Var) throws UnrecognizedInputFormatException {
        boolean z11;
        int i5;
        int iV;
        int i11;
        ke.j[] jVarArr;
        ke.g gVar = new ke.g(kVar, j11, j12);
        this.f55375c = gVar;
        if (((ke.j) this.f55374b) != null) {
            return;
        }
        synchronized (((ke.h) this.f55376d)) {
            try {
                int[] iArr = ke.h.f71402a;
                ArrayList arrayList = new ArrayList(16);
                List list = (List) map.get("Content-Type");
                String str = (list == null || list.isEmpty()) ? null : (String) list.get(0);
                z11 = true;
                if (str != null) {
                    ArrayList arrayList2 = wf.j.f94334a;
                    char c11 = 2;
                    switch (str) {
                        case "audio/x-flac":
                            str = "audio/flac";
                            break;
                        case "audio/x-wav":
                            str = "audio/wav";
                            break;
                        case "audio/mp3":
                            str = "audio/mpeg";
                            break;
                    }
                    i5 = 15;
                    switch (str.hashCode()) {
                        case -2123537834:
                            if (str.equals("audio/eac3-joc")) {
                                c11 = 0;
                                break;
                            } else {
                                c11 = 65535;
                                break;
                            }
                        case -1662384011:
                            if (str.equals("video/mp2p")) {
                                c11 = 1;
                                break;
                            }
                            break;
                        case -1662384007:
                            if (!str.equals("video/mp2t")) {
                            }
                            break;
                        case -1662095187:
                            if (str.equals("video/webm")) {
                                c11 = 3;
                                break;
                            }
                            break;
                        case -1606874997:
                            if (str.equals("audio/amr-wb")) {
                                c11 = 4;
                                break;
                            }
                            break;
                        case -1487394660:
                            if (str.equals("image/jpeg")) {
                                c11 = 5;
                                break;
                            }
                            break;
                        case -1248337486:
                            if (str.equals("application/mp4")) {
                                c11 = 6;
                                break;
                            }
                            break;
                        case -1079884372:
                            if (str.equals("video/x-msvideo")) {
                                c11 = 7;
                                break;
                            }
                            break;
                        case -1004728940:
                            if (str.equals("text/vtt")) {
                                c11 = '\b';
                                break;
                            }
                            break;
                        case -387023398:
                            if (str.equals("audio/x-matroska")) {
                                c11 = '\t';
                                break;
                            }
                            break;
                        case -43467528:
                            if (str.equals("application/webm")) {
                                c11 = '\n';
                                break;
                            }
                            break;
                        case 13915911:
                            if (str.equals("video/x-flv")) {
                                c11 = 11;
                                break;
                            }
                            break;
                        case 187078296:
                            if (str.equals("audio/ac3")) {
                                c11 = '\f';
                                break;
                            }
                            break;
                        case 187078297:
                            if (str.equals("audio/ac4")) {
                                c11 = '\r';
                                break;
                            }
                            break;
                        case 187078669:
                            if (str.equals("audio/amr")) {
                                c11 = 14;
                                break;
                            }
                            break;
                        case 187090232:
                            if (str.equals("audio/mp4")) {
                                c11 = 15;
                                break;
                            }
                            break;
                        case 187091926:
                            if (str.equals("audio/ogg")) {
                                c11 = 16;
                                break;
                            }
                            break;
                        case 187099443:
                            if (str.equals("audio/wav")) {
                                c11 = 17;
                                break;
                            }
                            break;
                        case 1331848029:
                            if (str.equals("video/mp4")) {
                                c11 = 18;
                                break;
                            }
                            break;
                        case 1503095341:
                            if (str.equals("audio/3gpp")) {
                                c11 = 19;
                                break;
                            }
                            break;
                        case 1504578661:
                            if (str.equals("audio/eac3")) {
                                c11 = 20;
                                break;
                            }
                            break;
                        case 1504619009:
                            if (str.equals("audio/flac")) {
                                c11 = 21;
                                break;
                            }
                            break;
                        case 1504824762:
                            if (str.equals("audio/midi")) {
                                c11 = 22;
                                break;
                            }
                            break;
                        case 1504831518:
                            if (str.equals("audio/mpeg")) {
                                c11 = 23;
                                break;
                            }
                            break;
                        case 1505118770:
                            if (str.equals("audio/webm")) {
                                c11 = 24;
                                break;
                            }
                            break;
                        case 2039520277:
                            if (str.equals("video/x-matroska")) {
                                c11 = 25;
                                break;
                            }
                            break;
                    }
                    switch (c11) {
                        case 0:
                        case '\f':
                        case 20:
                            i5 = 0;
                            break;
                        case 1:
                            i5 = 10;
                            break;
                        case 2:
                            i5 = 11;
                            break;
                        case 3:
                        case '\t':
                        case '\n':
                        case 24:
                        case 25:
                            i5 = 6;
                            break;
                        case 4:
                        case 14:
                        case 19:
                            i5 = 3;
                            break;
                        case 5:
                            i5 = 14;
                            break;
                        case 6:
                        case 15:
                        case 18:
                            i5 = 8;
                            break;
                        case 7:
                            i5 = 16;
                            break;
                        case '\b':
                            i5 = 13;
                            break;
                        case 11:
                            i5 = 5;
                            break;
                        case '\r':
                            i5 = 1;
                            break;
                        case 16:
                            i5 = 9;
                            break;
                        case 17:
                            i5 = 12;
                            break;
                        case 21:
                            i5 = 4;
                            break;
                        case 23:
                            i5 = 7;
                            break;
                    }
                    if (i5 != -1) {
                        ke.h.a(arrayList, i5);
                    }
                    iV = wf.a.v(uri);
                    if (iV != -1 && iV != i5) {
                        ke.h.a(arrayList, iV);
                    }
                    for (i11 = 0; i11 < 16; i11++) {
                        int i12 = iArr[i11];
                        if (i12 != i5 && i12 != iV) {
                            ke.h.a(arrayList, i12);
                        }
                    }
                    jVarArr = (ke.j[]) arrayList.toArray(new ke.j[arrayList.size()]);
                }
                i5 = -1;
                if (i5 != -1) {
                }
                iV = wf.a.v(uri);
                if (iV != -1) {
                    ke.h.a(arrayList, iV);
                }
                while (i11 < 16) {
                }
                jVarArr = (ke.j[]) arrayList.toArray(new ke.j[arrayList.size()]);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (jVarArr.length == 1) {
            this.f55374b = jVarArr[0];
        } else {
            int length = jVarArr.length;
            int i13 = 0;
            while (true) {
                if (i13 < length) {
                    ke.j jVar = jVarArr[i13];
                    try {
                    } catch (EOFException unused) {
                        if (((ke.j) this.f55374b) != null || gVar.f71398d == j11) {
                        }
                    } catch (Throwable th3) {
                        if (((ke.j) this.f55374b) == null && gVar.f71398d != j11) {
                            z11 = false;
                        }
                        wf.a.i(z11);
                        gVar.f71400f = 0;
                        throw th3;
                    }
                    if (jVar.c(gVar)) {
                        this.f55374b = jVar;
                        gVar.f71400f = 0;
                    } else {
                        boolean z12 = ((ke.j) this.f55374b) != null || gVar.f71398d == j11;
                        wf.a.i(z12);
                        gVar.f71400f = 0;
                        i13++;
                    }
                }
            }
            if (((ke.j) this.f55374b) == null) {
                StringBuilder sb2 = new StringBuilder("None of the available extractors (");
                int i14 = wf.v.f94376a;
                StringBuilder sb3 = new StringBuilder();
                for (int i15 = 0; i15 < jVarArr.length; i15++) {
                    sb3.append(jVarArr[i15].getClass().getSimpleName());
                    if (i15 < jVarArr.length - 1) {
                        sb3.append(", ");
                    }
                }
                sb2.append(sb3.toString());
                sb2.append(") could read the stream.");
                throw new UnrecognizedInputFormatException(sb2.toString(), null, false, 1);
            }
        }
        ((ke.j) this.f55374b).a(l0Var);
    }

    public boolean q(int i5, fa.u uVar, g4.d dVar) {
        h4.b bVar = (h4.b) this.f55374b;
        int[] iArr = dVar.f57109o0;
        int[] iArr2 = dVar.f57113s;
        bVar.f59086a = iArr[0];
        bVar.f59087b = iArr[1];
        bVar.f59088c = dVar.n();
        bVar.f59089d = dVar.k();
        bVar.f59094i = false;
        bVar.f59095j = i5;
        boolean z11 = bVar.f59086a == 3;
        boolean z12 = bVar.f59087b == 3;
        boolean z13 = z11 && dVar.V > 0.0f;
        boolean z14 = z12 && dVar.V > 0.0f;
        if (z13 && iArr2[0] == 4) {
            bVar.f59086a = 1;
        }
        if (z14 && iArr2[1] == 4) {
            bVar.f59087b = 1;
        }
        uVar.f(dVar, bVar);
        dVar.J(bVar.f59090e);
        dVar.G(bVar.f59091f);
        dVar.D = bVar.f59093h;
        dVar.D(bVar.f59092g);
        bVar.f59095j = 0;
        return bVar.f59094i;
    }

    public void r(h6.s sVar) {
        e1 e1Var = (e1) this.f55375c;
        if (e1Var != null) {
            e1Var.run();
        }
        e1 e1Var2 = new e1((h6.c0) this.f55376d, sVar);
        this.f55375c = e1Var2;
        ((Handler) this.f55374b).postAtFrontOfQueue(e1Var2);
    }

    public void s(t5.d0 d0Var) {
        this.f55374b = d0Var;
    }

    public void t(Integer num) {
        switch (this.f55373a) {
            case 0:
                this.f55375c = num;
                break;
            case 1:
                this.f55375c = num;
                break;
            case 2:
                this.f55375c = num;
                break;
            case 25:
                this.f55375c = num;
                break;
            default:
                this.f55375c = num;
                break;
        }
    }

    public String toString() {
        switch (this.f55373a) {
            case 15:
                return "SQLiteDirectCursorDriver: " + ((String) this.f55374b);
            default:
                return super.toString();
        }
    }

    public void u(t5.d0 d0Var) {
        switch (this.f55373a) {
            case 0:
                this.f55374b = d0Var;
                break;
            case 1:
                this.f55374b = d0Var;
                break;
            case 2:
                this.f55374b = d0Var;
                break;
            default:
                this.f55374b = d0Var;
                break;
        }
    }

    public void v(o oVar) {
        this.f55376d = oVar;
    }

    public void w(r rVar) {
        this.f55376d = rVar;
    }

    public void x(u uVar) {
        this.f55376d = uVar;
    }

    public void y(ll.d dVar) {
        this.f55376d = dVar;
    }

    public void z(ll.m mVar) {
        this.f55376d = mVar;
    }

    @Override // kk.c
    public Object zza() {
        Object objZza = ((kk.c) this.f55376d).zza();
        return new com.google.android.play.core.appupdate.a((jk.h) objZza, ((k4) ((je.f) this.f55375c).f69487b).f13083a);
    }

    public /* synthetic */ l(int i5, Object obj, Object obj2, Object obj3) {
        this.f55373a = i5;
        this.f55376d = obj;
        this.f55374b = obj2;
        this.f55375c = obj3;
    }

    public /* synthetic */ l(int i5, boolean z11) {
        this.f55373a = i5;
        this.f55376d = null;
        this.f55374b = null;
        this.f55375c = null;
    }

    public /* synthetic */ l(Object obj, Object obj2, Object obj3, Object obj4, int i5) {
        this.f55373a = i5;
        this.f55376d = obj;
        this.f55374b = obj2;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public l(int i5) {
        this.f55373a = i5;
        switch (i5) {
            case 18:
                this.f55376d = new bh.k(4);
                this.f55374b = new bh.k(4);
                this.f55375c = new ThreadPoolExecutor(4, 8, 10L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new j30.d());
                break;
            case 22:
                this(22, new long[10], new long[10], new long[10]);
                break;
            case 28:
                this.f55376d = new z.x(8);
                break;
            default:
                int i11 = 16;
                this(i11, new io.sentry.protocol.u((UUID) null), new l4(), null);
                break;
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public l(l lVar) {
        this.f55373a = 16;
        io.sentry.protocol.u uVar = (io.sentry.protocol.u) lVar.f55376d;
        l4 l4Var = (l4) lVar.f55374b;
        e1.m0 m0Var = (e1.m0) lVar.f55375c;
        this(16, uVar, l4Var, m0Var != null ? new e1.m0((Map) m0Var.f51338c, m0Var.f51337b, (ILogger) m0Var.f51339d, 6) : null);
    }

    public l(PaymentMethodIncentive paymentMethodIncentive) {
        this.f55373a = 21;
        this.f55376d = paymentMethodIncentive;
        i2 i2VarC = u1.c(paymentMethodIncentive);
        this.f55374b = i2VarC;
        this.f55375c = new o1(i2VarC);
    }

    public l(fr.l analyticsRequestExecutor, fr.c analyticsRequestFactory, ir.c durationProvider) {
        this.f55373a = 6;
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(analyticsRequestFactory, "analyticsRequestFactory");
        Intrinsics.g(durationProvider, "durationProvider");
        this.f55376d = analyticsRequestExecutor;
        this.f55374b = analyticsRequestFactory;
        this.f55375c = durationProvider;
    }

    public l(ResolvableString resolvableString, List list) {
        w70.m u0Var;
        w0 w0Var;
        this.f55373a = 24;
        this.f55376d = resolvableString;
        this.f55374b = kw.c0.f72334a;
        List list2 = list;
        ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
        Iterator it = list2.iterator();
        while (it.hasNext()) {
            arrayList.add(((l2) it.next()).g());
        }
        if (arrayList.isEmpty()) {
            Iterator it2 = b70.g.D1((kw.c0) this.f55374b, EmptyList.f71733a).iterator();
            while (true) {
                if (!it2.hasNext()) {
                    w0Var = null;
                    break;
                } else {
                    w0Var = (w0) it2.next();
                    if (w0Var != null) {
                        break;
                    }
                }
            }
            u0Var = ps.v.y(w0Var);
        } else {
            u0Var = new u0(4, (w70.m[]) b70.g.I1(arrayList).toArray(new w70.m[0]), this);
        }
        this.f55375c = new uw.c(u0Var, new v0(3, arrayList, this));
    }

    public l(fr.l analyticsRequestExecutor, fr.c analyticsRequestFactory, CoroutineContext workContext) {
        this.f55373a = 23;
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(analyticsRequestFactory, "analyticsRequestFactory");
        Intrinsics.g(workContext, "workContext");
        this.f55376d = analyticsRequestExecutor;
        this.f55374b = analyticsRequestFactory;
        this.f55375c = workContext;
    }

    public l(ArrayList arrayList) {
        this.f55373a = 9;
        this.f55376d = arrayList;
        this.f55374b = new ArrayList(arrayList.size());
        this.f55375c = new HashSet(3);
    }

    public l(h6.d0 d0Var) {
        this.f55373a = 8;
        this.f55376d = new h6.c0(d0Var);
        this.f55374b = new Handler();
    }

    public l(Context context) {
        this.f55373a = 4;
        Intrinsics.g(context, "context");
        a80.e eVar = y0.f88884a;
        a80.d dVar = a80.d.f488c;
        this.f55376d = context;
        this.f55374b = dVar;
        this.f55375c = LazyKt.a(new fr.b0(this, 0));
    }

    public l(ke.h hVar) {
        this.f55373a = 5;
        this.f55376d = hVar;
    }

    public l(Context context, LocationManager locationManager) {
        this.f55373a = 27;
        this.f55375c = new p0();
        this.f55376d = context;
        this.f55374b = locationManager;
    }

    public l(g4.e eVar) {
        this.f55373a = 7;
        this.f55376d = new ArrayList();
        this.f55374b = new h4.b();
        this.f55375c = eVar;
    }

    public l(l lVar, byte b11) {
        this.f55373a = 22;
        this.f55376d = Arrays.copyOf((long[]) lVar.f55376d, 10);
        this.f55374b = Arrays.copyOf((long[]) lVar.f55374b, 10);
        this.f55375c = Arrays.copyOf((long[]) lVar.f55375c, 10);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public l(e3 e3Var) {
        this(22);
        this.f55373a = 22;
        n(this, e3Var);
    }

    public l(he.h[] hVarArr) {
        this.f55373a = 13;
        he.e0 e0Var = new he.e0();
        he.g0 g0Var = new he.g0();
        g0Var.f59721c = 1.0f;
        g0Var.f59722d = 1.0f;
        he.g gVar = he.g.f59715e;
        g0Var.f59723e = gVar;
        g0Var.f59724f = gVar;
        g0Var.f59725g = gVar;
        g0Var.f59726h = gVar;
        ByteBuffer byteBuffer = he.h.f59733a;
        g0Var.f59729k = byteBuffer;
        g0Var.f59730l = byteBuffer.asShortBuffer();
        g0Var.f59731m = byteBuffer;
        g0Var.f59720b = -1;
        he.h[] hVarArr2 = new he.h[hVarArr.length + 2];
        this.f55376d = hVarArr2;
        System.arraycopy(hVarArr, 0, hVarArr2, 0, hVarArr.length);
        this.f55374b = e0Var;
        this.f55375c = g0Var;
        hVarArr2[hVarArr.length] = e0Var;
        hVarArr2[hVarArr.length + 1] = g0Var;
    }

    public l(AppInfo appInfo, String apiVersion, String str) {
        this.f55373a = 3;
        Intrinsics.g(apiVersion, "apiVersion");
        this.f55376d = appInfo;
        this.f55374b = apiVersion;
        this.f55375c = str;
    }

    public l(io.sentry.android.core.v vVar) {
        this.f55373a = 17;
        this.f55376d = vVar;
        this.f55374b = null;
        this.f55375c = null;
    }

    public l(io.sentry.android.core.v vVar, byte[] bArr) {
        this.f55373a = 17;
        this.f55376d = vVar;
        this.f55374b = bArr;
        this.f55375c = null;
    }

    public l(he.y yVar) {
        this.f55373a = 14;
        this.f55375c = yVar;
        this.f55376d = new Handler(Looper.myLooper());
        this.f55374b = new he.x(this);
    }
}
