package gu;

import ab.y;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;
import android.graphics.Region;
import android.media.AudioAttributes;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import com.google.android.gms.auth.api.identity.BeginSignInRequest;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.gms.internal.measurement.ag;
import com.google.gson.n;
import com.google.gson.p;
import com.google.gson.t;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivity;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeArgs;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.StripeIntent;
import dq.e0;
import he.c0;
import in.i0;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.g3;
import io.sentry.i1;
import io.sentry.o0;
import io.sentry.protocol.k;
import io.sentry.protocol.z;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.net.InetAddress;
import java.net.URI;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Currency;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.concurrent.atomic.AtomicReference;
import jb.m;
import jt.z0;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import ps.v;
import rg.l;
import w70.o1;

/* loaded from: classes4.dex */
public final class j implements j30.e, hb.e, hq.e, l, t, n, o0, iq.l {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57835a;

    /* renamed from: b, reason: collision with root package name */
    public Object f57836b;

    public /* synthetic */ j(char c11, int i5) {
        this.f57835a = i5;
    }

    public static io.sentry.protocol.t f(Throwable th2, k kVar, Long l9, List list, boolean z11) {
        Package r02 = th2.getClass().getPackage();
        String name = th2.getClass().getName();
        io.sentry.protocol.t tVar = new io.sentry.protocol.t();
        String message = th2.getMessage();
        if (r02 != null) {
            name = name.replace(r02.getName() + ".", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        String name2 = r02 != null ? r02.getName() : null;
        if (list != null && !list.isEmpty()) {
            z zVar = new z(list);
            if (z11) {
                zVar.f67660c = Boolean.TRUE;
            }
            tVar.f67617e = zVar;
        }
        tVar.f67616d = l9;
        tVar.f67613a = name;
        tVar.f67618f = kVar;
        tVar.f67615c = name2;
        tVar.f67614b = message;
        return tVar;
    }

    public static j h(BufferedInputStream bufferedInputStream) throws IOException {
        try {
            BitmapRegionDecoder bitmapRegionDecoderNewInstance = BitmapRegionDecoder.newInstance((InputStream) bufferedInputStream, false);
            if (bitmapRegionDecoderNewInstance == null) {
                return null;
            }
            j jVar = new j((char) 0, 7);
            jVar.f57836b = bitmapRegionDecoderNewInstance;
            return jVar;
        } catch (IOException e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("BitmapRegionTileSource");
            bVar.p(e3, "getting decoder failed", new Object[0]);
            return null;
        }
    }

    @Override // iq.l
    public void a(iq.j jVar) {
        ww.a aVar = (ww.a) this.f57836b;
        int i5 = IntentConfirmationChallengeActivity.f42488q;
        String str = jVar.f67976a;
        StripeIntent stripeIntent = jVar.f67978c;
        Bundle bundleA = w.b.a(new Pair("intent_confirmation_challenge_args", new IntentConfirmationChallengeArgs(str, b70.g.I1(jVar.f67977b), stripeIntent)));
        List list = e0.f49312l;
        aVar.a(IntentConfirmationChallengeActivity.class, bundleA, k0.q(stripeIntent));
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        switch (this.f57835a) {
            case 16:
                ih.c cVar = (ih.c) this.f57836b;
                ih.b bVar = new ih.b((fi.j) obj2);
                ih.j jVar = (ih.j) ((ih.d) obj).getService();
                String str = cVar.f61596l;
                Parcel parcelT = jVar.T();
                parcelT.writeStrongBinder(bVar);
                parcelT.writeString(str);
                jVar.U(parcelT, 2);
                break;
            default:
                ih.a aVar = new ih.a((fi.j) obj2);
                ih.j jVar2 = (ih.j) ((ih.d) obj).getService();
                BeginSignInRequest beginSignInRequest = (BeginSignInRequest) this.f57836b;
                Parcel parcelT2 = jVar2.T();
                parcelT2.writeStrongBinder(aVar);
                ih.e.c(parcelT2, beginSignInRequest);
                jVar2.U(parcelT2, 1);
                break;
        }
    }

    @Override // hq.e
    public o1 b() {
        return (o1) this.f57836b;
    }

    @Override // hb.e
    public Bitmap c(Rect rect, BitmapFactory.Options options) {
        return ((BitmapRegionDecoder) this.f57836b).decodeRegion(rect, options);
    }

    @Override // hq.e
    public Object d(hq.f fVar, Continuation continuation) {
        return null;
    }

    public Object e(p pVar, Class cls) {
        return ((i0) this.f57836b).f61706c.fromJson(pVar, (Type) cls);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object g(String str, String str2, String str3, ContinuationImpl continuationImpl) {
        i iVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f57834v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f57834v = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj = iVar.f57832t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f57834v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        z0 z0Var = (z0) this.f57836b;
        ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str, str2, 4);
        iVar.f57834v = 1;
        Object objS = z0Var.S(str3, apiRequest$Options, EmptyList.f71733a, iVar);
        return objS == coroutineSingletons ? coroutineSingletons : objS;
    }

    @Override // hb.e
    public int getHeight() {
        return ((BitmapRegionDecoder) this.f57836b).getHeight();
    }

    @Override // hb.e
    public int getWidth() {
        return ((BitmapRegionDecoder) this.f57836b).getWidth();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003a A[Catch: all -> 0x002a, DONT_GENERATE, TryCatch #1 {, blocks: (B:4:0x0005, B:6:0x000f, B:7:0x0016, B:9:0x0022, B:13:0x002c, B:14:0x003a), top: B:20:0x0005, inners: #0 }] */
    @Override // io.sentry.o0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void i(long j11) {
        synchronized (((ScheduledExecutorService) this.f57836b)) {
            if (!((ScheduledExecutorService) this.f57836b).isShutdown()) {
                ((ScheduledExecutorService) this.f57836b).shutdown();
                try {
                } catch (InterruptedException unused) {
                    ((ScheduledExecutorService) this.f57836b).shutdownNow();
                    Thread.currentThread().interrupt();
                }
                if (!((ScheduledExecutorService) this.f57836b).awaitTermination(j11, TimeUnit.MILLISECONDS)) {
                    ((ScheduledExecutorService) this.f57836b).shutdownNow();
                }
            }
        }
    }

    @Override // io.sentry.o0
    public boolean isClosed() {
        boolean zIsShutdown;
        synchronized (((ScheduledExecutorService) this.f57836b)) {
            zIsShutdown = ((ScheduledExecutorService) this.f57836b).isShutdown();
        }
        return zIsShutdown;
    }

    public void j(Exception exc) {
        wf.a.p("MediaCodecAudioRenderer", "Audio sink error", exc);
        he.k kVar = ((c0) this.f57836b).F0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new he.i(kVar, exc, 6));
        }
    }

    public void k(jb.i iVar, m mVar, ab.z zVar) {
        iVar.markDelivered();
        iVar.addMarker("post-response");
        ((androidx.recyclerview.widget.e) this.f57836b).execute(new y(15, iVar, mVar, zVar, false));
    }

    public boolean l(ib.a aVar) {
        ib.a aVar2 = (ib.a) this.f57836b;
        while (true) {
            if (aVar2 == null) {
                ib.a aVar3 = (ib.a) this.f57836b;
                boolean z11 = aVar3 == null;
                aVar.f61468r = aVar3;
                this.f57836b = aVar;
                return z11;
            }
            if (aVar2 == aVar) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("TiledImageRenderer");
                bVar.n("Attempting to add a tile already in the queue!", new Object[0]);
                return false;
            }
            aVar2 = aVar2.f61468r;
        }
    }

    @Override // io.sentry.o0
    public Future m(Runnable runnable, long j11) {
        return ((ScheduledExecutorService) this.f57836b).schedule(runnable, j11, TimeUnit.MILLISECONDS);
    }

    public j9.b n(BufferedInputStream bufferedInputStream) {
        j9.i iVar;
        j9.g gVar = new j9.g(bufferedInputStream, (j9.c) this.f57836b);
        j9.a aVar = gVar.f69243a;
        j9.b bVar = new j9.b(aVar.f69158c.order());
        for (int iF = gVar.f(); iF != 5; iF = gVar.f()) {
            j9.i[] iVarArr = bVar.f69159a;
            if (iF == 0) {
                j9.i iVar2 = new j9.i(gVar.f69247e);
                iVarArr[iVar2.f69267a] = iVar2;
            } else if (iF == 1) {
                j9.h hVar = gVar.f69248f;
                if (hVar.f69264f != null) {
                    int i5 = hVar.f69263e;
                    Charset charset = j9.h.f69257h;
                    iVar = (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4) ? iVarArr[i5] : null;
                    hVar.f69263e = iVar.f69267a;
                } else {
                    int i11 = hVar.f69265g;
                    if (i11 >= aVar.f69156a) {
                        gVar.f69256p.put(Integer.valueOf(i11), new j9.d(hVar, true));
                    }
                }
            } else if (iF == 2) {
                j9.h hVar2 = gVar.f69248f;
                if (hVar2.f69260b == 7) {
                    gVar.g(hVar2);
                }
                int i12 = hVar2.f69263e;
                Charset charset2 = j9.h.f69257h;
                iVar = (i12 == 0 || i12 == 1 || i12 == 2 || i12 == 3 || i12 == 4) ? iVarArr[i12] : null;
                hVar2.f69263e = iVar.f69267a;
            } else if (iF == 3) {
                j9.h hVar3 = gVar.f69251i;
                int iB = hVar3 == null ? 0 : (int) hVar3.b(0);
                byte[] bArr = new byte[iB];
                if (iB == aVar.read(bArr)) {
                    bVar.f69160b = bArr;
                } else {
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("ExifReader");
                    bVar2.n("Failed to read the compressed thumbnail", new Object[0]);
                }
            } else if (iF == 4) {
                j9.h hVar4 = gVar.f69250h;
                int iB2 = hVar4 == null ? 0 : (int) hVar4.b(0);
                byte[] bArr2 = new byte[iB2];
                if (iB2 == aVar.read(bArr2)) {
                    int i13 = gVar.f69249g.f69233a;
                    ArrayList arrayList = bVar.f69161c;
                    if (i13 < arrayList.size()) {
                        arrayList.set(i13, bArr2);
                    } else {
                        for (int size = arrayList.size(); size < i13; size++) {
                            arrayList.add(null);
                        }
                        arrayList.add(bArr2);
                    }
                } else {
                    mc0.b bVar3 = mc0.d.f76206a;
                    bVar3.r("ExifReader");
                    bVar3.n("Failed to read the strip bytes", new Object[0]);
                }
            }
        }
        return bVar;
    }

    public p o(Object obj) {
        return ((i0) this.f57836b).f61706c.toJsonTree(obj);
    }

    @Override // j30.e
    public void onCancel() {
        switch (this.f57835a) {
            case 3:
                ((BitmapFactory.Options) this.f57836b).requestCancelDecode();
                return;
            case 4:
                h30.e eVar = (h30.e) this.f57836b;
                h30.c cVar = eVar.f59053a;
                synchronized (cVar.f59050d.f59062b) {
                    try {
                        f30.f.a(cVar.f59047a.remove(eVar));
                        if (cVar.f59047a.isEmpty()) {
                            cVar.f59048b.a();
                            cVar.f59050d.f59062b.remove(cVar.f59049c);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                synchronized (((h30.e) this.f57836b)) {
                    h30.e eVar2 = (h30.e) this.f57836b;
                    eVar2.f59054b = true;
                    eVar2.notifyAll();
                }
                return;
            default:
                ((Thread) this.f57836b).interrupt();
                return;
        }
    }

    public void p(e3 e3Var, ILogger iLogger, Object obj) throws IOException {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) e3Var.f67208b;
        if (obj == null) {
            cVar.d();
            return;
        }
        if (obj instanceof Character) {
            e3Var.A(Character.toString(((Character) obj).charValue()));
            return;
        }
        if (obj instanceof String) {
            e3Var.A((String) obj);
            return;
        }
        if (obj instanceof Boolean) {
            e3Var.B(((Boolean) obj).booleanValue());
            return;
        }
        if (obj instanceof Number) {
            e3Var.z((Number) obj);
            return;
        }
        if (obj instanceof Date) {
            try {
                e3Var.A(android.support.v4.media.session.b.b0((Date) obj));
                return;
            } catch (Exception e3) {
                iLogger.e(g3.ERROR, "Error when serializing Date", e3);
                cVar.d();
                return;
            }
        }
        if (obj instanceof TimeZone) {
            try {
                e3Var.A(((TimeZone) obj).getID());
                return;
            } catch (Exception e11) {
                iLogger.e(g3.ERROR, "Error when serializing TimeZone", e11);
                cVar.d();
                return;
            }
        }
        if (obj instanceof i1) {
            ((i1) obj).serialize(e3Var, iLogger);
            return;
        }
        if (obj instanceof Collection) {
            q(e3Var, iLogger, (Collection) obj);
            return;
        }
        if (obj.getClass().isArray()) {
            q(e3Var, iLogger, Arrays.asList((Object[]) obj));
            return;
        }
        if (obj instanceof Map) {
            r(e3Var, iLogger, (Map) obj);
            return;
        }
        if (obj instanceof Locale) {
            e3Var.A(obj.toString());
            return;
        }
        if (obj instanceof AtomicIntegerArray) {
            AtomicIntegerArray atomicIntegerArray = (AtomicIntegerArray) obj;
            Charset charset = io.sentry.util.a.f67825a;
            int length = atomicIntegerArray.length();
            ArrayList arrayList = new ArrayList(length);
            for (int i5 = 0; i5 < length; i5++) {
                arrayList.add(Integer.valueOf(atomicIntegerArray.get(i5)));
            }
            q(e3Var, iLogger, arrayList);
            return;
        }
        if (obj instanceof AtomicBoolean) {
            e3Var.B(((AtomicBoolean) obj).get());
            return;
        }
        if (obj instanceof URI) {
            e3Var.A(obj.toString());
            return;
        }
        if (obj instanceof InetAddress) {
            e3Var.A(obj.toString());
            return;
        }
        if (obj instanceof UUID) {
            e3Var.A(obj.toString());
            return;
        }
        if (obj instanceof Currency) {
            e3Var.A(obj.toString());
            return;
        }
        if (obj instanceof Calendar) {
            r(e3Var, iLogger, io.sentry.util.a.a((Calendar) obj));
            return;
        }
        if (obj.getClass().isEnum()) {
            e3Var.A(obj.toString());
            return;
        }
        try {
            p(e3Var, iLogger, ((ag) this.f57836b).r(iLogger, obj));
        } catch (Exception e12) {
            iLogger.e(g3.ERROR, "Failed serializing unknown object.", e12);
            e3Var.A("[OBJECT]");
        }
    }

    public void q(e3 e3Var, ILogger iLogger, Collection collection) throws IOException {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) e3Var.f67208b;
        cVar.h();
        cVar.a();
        int i5 = cVar.f67886c;
        int[] iArr = cVar.f67885b;
        if (i5 == iArr.length) {
            cVar.f67885b = Arrays.copyOf(iArr, i5 * 2);
        }
        int[] iArr2 = cVar.f67885b;
        int i11 = cVar.f67886c;
        cVar.f67886c = i11 + 1;
        iArr2[i11] = 1;
        cVar.f67884a.write(91);
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            p(e3Var, iLogger, it.next());
        }
        cVar.b(1, 2, AbstractJsonLexerKt.END_LIST);
    }

    public void r(e3 e3Var, ILogger iLogger, Map map) throws IOException {
        e3Var.f();
        for (Object obj : map.keySet()) {
            if (obj instanceof String) {
                e3Var.o((String) obj);
                p(e3Var, iLogger, map.get(obj));
            }
        }
        e3Var.i();
    }

    @Override // io.sentry.o0
    public Future submit(Runnable runnable) {
        return ((ScheduledExecutorService) this.f57836b).submit(runnable);
    }

    public /* synthetic */ j(ih.c cVar, BeginSignInRequest beginSignInRequest) {
        this.f57835a = 17;
        this.f57836b = beginSignInRequest;
    }

    public /* synthetic */ j(Object obj, int i5) {
        this.f57835a = i5;
        this.f57836b = obj;
    }

    public j(int i5) {
        this.f57835a = 19;
        ag agVar = new ag();
        agVar.f32386b = new HashSet();
        agVar.f32385a = i5;
        this.f57836b = agVar;
    }

    public j(ww.a host) {
        this.f57835a = 26;
        Intrinsics.g(host, "host");
        this.f57836b = host;
    }

    public j(int i5, byte b11) {
        this.f57835a = i5;
        switch (i5) {
            case 13:
                this.f57836b = v.y(Boolean.FALSE);
                break;
            case 22:
                this.f57836b = Executors.newSingleThreadScheduledExecutor(new io.sentry.y(1));
                break;
            case 23:
                this.f57836b = new Handler(Looper.getMainLooper());
                break;
            case 24:
                this.f57836b = new io.sentry.util.c(new ge.d(19));
                break;
            case 25:
                this.f57836b = new io.sentry.transport.n();
                break;
            case 27:
                this.f57836b = new Region();
                break;
            default:
                this.f57836b = new AtomicReference(null);
                break;
        }
    }

    public j(Handler handler) {
        this.f57835a = 29;
        this.f57836b = new androidx.recyclerview.widget.e(handler, 2);
    }

    public j(he.d dVar) {
        this.f57835a = 8;
        AudioAttributes.Builder usage = new AudioAttributes.Builder().setContentType(dVar.f59673a).setFlags(dVar.f59674b).setUsage(dVar.f59675c);
        int i5 = wf.v.f94376a;
        if (i5 >= 29) {
            he.b.a(usage, dVar.f59676d);
        }
        if (i5 >= 32) {
            he.c.a(usage, dVar.f59677e);
        }
        this.f57836b = usage.build();
    }
}
