package br;

import a80.e;
import android.content.Context;
import b.c0;
import b70.g;
import com.google.crypto.tink.shaded.protobuf.f;
import com.teslacoilsw.launcher.rawdatalogger.SubmitRawDataLogWork;
import db0.m0;
import ft.u0;
import gf.t0;
import io.p;
import io.sentry.e3;
import io.sentry.hints.h;
import j10.m;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileLock;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import o7.a0;
import o7.z;
import p7.s;
import r70.k;
import rx.exceptions.OnErrorNotImplementedException;
import t5.r0;
import t70.y0;
import u60.j;
import y7.d;

/* loaded from: classes4.dex */
public final class c implements f, t0, k6.b, h, ib0.f, nl.c, mb0.b, sp.a, u60.c {

    /* renamed from: a, reason: collision with root package name */
    public static volatile c f18430a;

    /* renamed from: b, reason: collision with root package name */
    public static c f18431b;

    /* renamed from: c, reason: collision with root package name */
    public static c f18432c;

    /* JADX WARN: Removed duplicated region for block: B:29:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0043 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0072 -> B:27:0x0075). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object g(FileOutputStream fileOutputStream, ContinuationImpl continuationImpl) throws IOException {
        r0 r0Var;
        long j11;
        r0 r0Var2;
        if (continuationImpl instanceof r0) {
            r0Var = (r0) continuationImpl;
            int i5 = r0Var.f88684w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r0Var.f88684w = i5 - Integer.MIN_VALUE;
            } else {
                r0Var = new r0(continuationImpl);
            }
        }
        Object obj = r0Var.f88683v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r0Var.f88684w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = r0Var.f88682u;
            fileOutputStream = r0Var.f88681t;
            ResultKt.b(obj);
            r0Var2 = r0Var;
            j11 *= 2;
            if (j11 <= 60000) {
                FileLock fileLockLock = fileOutputStream.getChannel().lock(0L, Long.MAX_VALUE, false);
                Intrinsics.f(fileLockLock, "lockFileStream.getChanne…LUE, /* shared= */ false)");
                return fileLockLock;
            }
            try {
            } catch (IOException e3) {
                String message = e3.getMessage();
                if (message == null || !k.K0(message, "Resource deadlock would occur", false)) {
                    throw e3;
                }
                r0Var2.f88681t = fileOutputStream;
                r0Var2.f88682u = j11;
                r0Var2.f88684w = 1;
                if (t70.t0.b(j11, r0Var2) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            FileLock fileLockLock2 = fileOutputStream.getChannel().lock(0L, Long.MAX_VALUE, false);
            Intrinsics.f(fileLockLock2, "lockFileStream.getChanne…LUE, /* shared= */ false)");
            return fileLockLock2;
        }
        ResultKt.b(obj);
        j11 = 10;
        r0Var2 = r0Var;
        if (j11 <= 60000) {
        }
    }

    public static void h(Context context) {
        s sVarC = s.c(context);
        sVarC.getClass();
        sVarC.f82375d.a(d.c("SubmitRawDataLogWork", sVarC));
    }

    public static u0 i(String str) {
        Object next;
        i70.a aVar = u0.f56051e;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (g.O0(((u0) next).f56052a, str)) {
                break;
            }
        }
        return (u0) next;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0072  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ArrayList l(String appId) {
        List listQ;
        Intrinsics.g(appId, "appId");
        String lowerCase = appId.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        int iHashCode = lowerCase.hashCode();
        if (iHashCode != -1288569423) {
            if (iHashCode != 3387436) {
                listQ = (iHashCode == 1863398948 && lowerCase.equals("instabridge")) ? ul.b.Q(p.f66706g, p.f66707h, p.f66712m, p.f66711l, p.f66708i, p.f66710k, p.o, p.f66713p, p.f66714q) : g.I1(p.f66716s);
            } else if (lowerCase.equals("nova")) {
                listQ = ul.b.Q(p.f66706g, p.n, p.o, p.f66707h, p.f66714q, p.f66711l, p.f66710k, p.f66713p);
            }
        } else if (lowerCase.equals("eyecon")) {
            listQ = ul.b.Q(p.f66706g, p.f66707h, p.f66708i, p.f66709j, p.f66710k, p.n, p.o, p.f66713p, p.f66714q);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : listQ) {
            if (((p) obj).f66721e) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static final CharSequence m(Object obj) {
        Objects.requireNonNull(obj);
        return obj instanceof CharSequence ? (CharSequence) obj : obj.toString();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f
    public byte[] a(int i5, int i11, byte[] bArr) {
        return Arrays.copyOfRange(bArr, i5, i11 + i5);
    }

    @Override // mb0.b
    /* renamed from: b */
    public void mo5b(Object obj) {
        Throwable nullPointerException = (Throwable) obj;
        String message = nullPointerException != null ? nullPointerException.getMessage() : null;
        if (nullPointerException == null) {
            nullPointerException = new NullPointerException();
        }
        throw new OnErrorNotImplementedException(message, nullPointerException);
    }

    @Override // gf.t0
    public void c() {
    }

    @Override // u60.c
    public boolean d(j jVar) {
        String str = jVar.f90659a;
        return ("class-name".equals(str) || "function".equals(str)) ? false : true;
    }

    @Override // gf.t0
    public int e(e3 e3Var, ie.f fVar, int i5) {
        fVar.f61556b = 4;
        return -4;
    }

    @Override // gf.t0
    public int f(long j11) {
        return 0;
    }

    @Override // gf.t0
    public boolean isReady() {
        return true;
    }

    @Override // ib0.f
    public void j(long j11) {
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object k(Context context, m0 m0Var, Duration duration, ContinuationImpl continuationImpl) {
        m10.c cVar;
        Context context2;
        Duration duration2;
        if (continuationImpl instanceof m10.c) {
            cVar = (m10.c) continuationImpl;
            int i5 = cVar.f75805x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f75805x = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new m10.c(this, continuationImpl);
            }
        }
        Object obj = cVar.f75803v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f75805x;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (m.k(context)) {
                return Unit.f71706a;
            }
            File file = new File(context.getCacheDir(), "pendingRawData");
            file.mkdirs();
            e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            m10.d dVar2 = new m10.d(file, m0Var, null);
            context2 = context;
            cVar.f75801t = context2;
            cVar.f75802u = duration;
            cVar.f75805x = 1;
            if (t70.m0.y(dVar, dVar2, cVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            duration2 = duration;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            duration2 = cVar.f75802u;
            Context context3 = cVar.f75801t;
            ResultKt.b(obj);
            context2 = context3;
        }
        s sVarC = s.c(context2);
        z zVar = new z(SubmitRawDataLogWork.class, Duration.ofHours(8L));
        zVar.f79651d.add("SubmitRawDataLogWork");
        sVarC.a((a0) ((z) ((z) ((z) zVar.e(new o7.f(2, false, false, true, false, -1L, -1L, g.N1(new LinkedHashSet())))).f(duration2)).d(1, 1L, TimeUnit.MINUTES)).a());
        return Unit.f71706a;
    }

    @Override // sp.a
    public boolean n(sp.m0 m0Var, int i5, String str) {
        if (i5 == 200) {
            return true;
        }
        sp.m0.a("e104");
        return false;
    }
}
