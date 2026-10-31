package p50;

import com.google.android.gms.internal.measurement.ke;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.ktor.http.cio.ParserException;
import io.ktor.utils.io.f0;
import io.ktor.utils.io.t;
import io.ktor.utils.io.u0;
import j00.k0;
import java.util.List;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import o50.p;

/* loaded from: classes4.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final Set f82107a = kotlin.collections.c.f1(new Character[]{'/', '?', '#', '@'});

    /* renamed from: b, reason: collision with root package name */
    public static final int f82108b;

    static {
        List list = u0.f66658b;
        f82108b = 6;
        List from = ul.b.Q("HTTP/1.0", "HTTP/1.1");
        Intrinsics.g(from, "from");
        ps.l.e(from, new pu.e(19), new k0(26, (byte) 0));
    }

    public static final void a(q50.c cVar, char c11) {
        throw new ParserException("Character with code " + (c11 & 255) + " is not allowed in header names, \n" + ((Object) cVar));
    }

    public static final int b(q50.c cVar, ke keVar) {
        int i5 = keVar.f32739c;
        for (int i11 = keVar.f32738b; i11 < i5; i11++) {
            char cCharAt = cVar.charAt(i11);
            if (cCharAt == ':' && i11 != keVar.f32738b) {
                keVar.f32738b = i11 + 1;
                return i11;
            }
            if (Intrinsics.h(cCharAt, 32) <= 0 || r70.k.L0("\"(),/:;<=>?@[\\]{}", cCharAt)) {
                int i12 = keVar.f32738b;
                if (cCharAt == ':') {
                    throw new ParserException("Empty header names are not allowed as per RFC7230.");
                }
                if (i11 == i12) {
                    throw new ParserException("Multiline headers via line folding is not supported since it is deprecated as per RFC7230.");
                }
                a(cVar, cCharAt);
                throw null;
            }
        }
        throw new ParserException("No colon in HTTP header in " + cVar.subSequence(keVar.f32738b, keVar.f32739c).toString() + " in builder: \n" + ((Object) cVar));
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x00c4, code lost:
    
        a(r3, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00c7, code lost:
    
        throw null;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x006a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0079 A[Catch: all -> 0x007d, TryCatch #0 {all -> 0x007d, blocks: (B:23:0x0070, B:25:0x0079, B:29:0x0081, B:32:0x008c, B:35:0x0098, B:38:0x00a4, B:40:0x00a9, B:56:0x00d4, B:19:0x0058, B:43:0x00b0, B:52:0x00c4, B:53:0x00c7, B:54:0x00c8, B:55:0x00ce, B:57:0x00e3, B:58:0x00ea, B:59:0x00eb, B:61:0x00f5), top: B:65:0x0070 }] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0081 A[Catch: all -> 0x007d, TryCatch #0 {all -> 0x007d, blocks: (B:23:0x0070, B:25:0x0079, B:29:0x0081, B:32:0x008c, B:35:0x0098, B:38:0x00a4, B:40:0x00a9, B:56:0x00d4, B:19:0x0058, B:43:0x00b0, B:52:0x00c4, B:53:0x00c7, B:54:0x00c8, B:55:0x00ce, B:57:0x00e3, B:58:0x00ea, B:59:0x00eb, B:61:0x00f5), top: B:65:0x0070 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x006b -> B:65:0x0070). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(t tVar, q50.c cVar, ke keVar, ContinuationImpl continuationImpl) throws Throwable {
        f fVar;
        q50.c cVar2;
        d dVar;
        f fVar2;
        t tVar2;
        ke keVar2;
        Throwable th2;
        Object objI;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f82106y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f82106y = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(continuationImpl);
            }
        }
        Object obj = fVar.f82105x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f82106y;
        int i12 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
        int i13 = 1;
        if (i11 == 0) {
            ResultKt.b(obj);
            cVar2 = cVar;
            dVar = new d(cVar2);
            fVar2 = fVar;
            tVar2 = tVar;
            keVar2 = keVar;
            int i14 = f82108b;
            fVar2.f82101t = tVar2;
            fVar2.f82102u = cVar2;
            fVar2.f82103v = keVar2;
            fVar2.f82104w = dVar;
            fVar2.f82106y = i13;
            objI = f0.i(tVar2, cVar2, i12, i14, fVar2);
            if (objI != coroutineSingletons) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = fVar.f82104w;
            ke keVar3 = fVar.f82103v;
            q50.c cVar3 = fVar.f82102u;
            t tVar3 = fVar.f82101t;
            try {
                ResultKt.b(obj);
                fVar2 = fVar;
                keVar2 = keVar3;
                dVar = dVar2;
                cVar2 = cVar3;
                try {
                    if (((Boolean) obj).booleanValue()) {
                        dVar.d();
                        return null;
                    }
                    int i15 = cVar2.f83686g;
                    keVar2.f32739c = i15;
                    int i16 = keVar2.f32738b;
                    int i17 = i15 - i16;
                    if (i17 == 0) {
                        List list = p.f79582a;
                        q50.b bVarA = dVar.a("Host");
                        if (bVarA != null) {
                            d(bVarA);
                        }
                        return dVar;
                    }
                    if (i17 >= i12) {
                        throw new IllegalStateException("Header line length limit exceeded");
                    }
                    int iB = b(cVar2, keVar2);
                    int i18 = keVar2.f32739c;
                    int i19 = keVar2.f32738b;
                    while (i19 < i18) {
                        char cCharAt = cVar2.charAt(i19);
                        if (!kotlin.text.a.b(cCharAt) && cCharAt != '\t') {
                            break;
                        }
                        i19++;
                    }
                    if (i19 >= i18) {
                        keVar2.f32738b = i18;
                    } else {
                        int i21 = i19;
                        int i22 = i21;
                        while (i21 < i18) {
                            char cCharAt2 = cVar2.charAt(i21);
                            if (cCharAt2 != '\t') {
                                if (cCharAt2 == '\n' || cCharAt2 == '\r') {
                                    break;
                                }
                                if (cCharAt2 != ' ') {
                                    i22 = i21;
                                }
                            }
                            i21++;
                        }
                        keVar2.f32738b = i19;
                        keVar2.f32739c = i22 + 1;
                    }
                    int i23 = keVar2.f32738b;
                    int i24 = keVar2.f32739c;
                    keVar2.f32738b = i18;
                    dVar.c(i16, iB, i23, i24);
                    tVar2 = tVar3;
                    i12 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    i13 = 1;
                    int i142 = f82108b;
                    fVar2.f82101t = tVar2;
                    fVar2.f82102u = cVar2;
                    fVar2.f82103v = keVar2;
                    fVar2.f82104w = dVar;
                    fVar2.f82106y = i13;
                    objI = f0.i(tVar2, cVar2, i12, i142, fVar2);
                    if (objI != coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    tVar3 = tVar2;
                    obj = objI;
                    if (((Boolean) obj).booleanValue()) {
                    }
                } catch (Throwable th3) {
                    th2 = th3;
                    dVar2 = dVar;
                    dVar2.d();
                    throw th2;
                }
            } catch (Throwable th4) {
                th2 = th4;
                dVar2.d();
                throw th2;
            }
        }
    }

    public static final void d(q50.b bVar) {
        if (r70.k.N0(":", bVar)) {
            throw new ParserException("Host header with ':' should contains port: " + ((Object) bVar));
        }
        for (int i5 = 0; i5 < bVar.length(); i5++) {
            Character chValueOf = Character.valueOf(bVar.charAt(i5));
            Set set = f82107a;
            if (set.contains(chValueOf)) {
                throw new ParserException("Host cannot contain any of the following symbols: " + set);
            }
        }
    }
}
