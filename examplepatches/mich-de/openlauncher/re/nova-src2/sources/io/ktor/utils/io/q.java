package io.ktor.utils.io;

import java.io.IOException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final t f66631a;

    /* renamed from: b, reason: collision with root package name */
    public final f80.a f66632b;

    /* renamed from: c, reason: collision with root package name */
    public final j0 f66633c;

    /* renamed from: d, reason: collision with root package name */
    public final long f66634d;

    /* renamed from: e, reason: collision with root package name */
    public final e80.k f66635e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f66636f;

    /* renamed from: g, reason: collision with root package name */
    public final e80.a f66637g;

    /* renamed from: h, reason: collision with root package name */
    public long f66638h;

    /* renamed from: i, reason: collision with root package name */
    public int f66639i;

    public q(t channel, f80.a matchString, j0 writeChannel, long j11) {
        Intrinsics.g(channel, "channel");
        Intrinsics.g(matchString, "matchString");
        Intrinsics.g(writeChannel, "writeChannel");
        this.f66631a = channel;
        this.f66632b = matchString;
        this.f66633c = writeChannel;
        this.f66634d = j11;
        byte[] bArr = matchString.f54354a;
        if (bArr.length <= 0) {
            throw new IllegalArgumentException("Empty match string not permitted for scanning");
        }
        this.f66635e = channel.f();
        int[] iArr = new int[bArr.length];
        int length = bArr.length;
        int i5 = 0;
        for (int i11 = 1; i11 < length; i11++) {
            while (i5 > 0 && matchString.a(i11) != matchString.a(i5)) {
                i5 = iArr[i5 - 1];
            }
            if (matchString.a(i11) == matchString.a(i5)) {
                i5++;
            }
            iArr[i11] = i5;
        }
        this.f66636f = iArr;
        this.f66637g = new e80.a();
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Not found exit edge by exit block: B:31:0x0080
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.checkLoopExits(LoopRegionMaker.java:225)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeLoopRegion(LoopRegionMaker.java:195)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:62)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:101)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:95)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    /* JADX WARN: Path cross not found for [B:36:0x00ae, B:52:0x00dd], limit reached: 109 */
    /* JADX WARN: Path cross not found for [B:36:0x00ae, B:72:0x0134], limit reached: 109 */
    /* JADX WARN: Path cross not found for [B:40:0x00b7, B:36:0x00ae], limit reached: 109 */
    /* JADX WARN: Path cross not found for [B:42:0x00c1, B:64:0x011b], limit reached: 109 */
    /* JADX WARN: Removed duplicated region for block: B:105:0x018b A[EDGE_INSN: B:105:0x018b->B:90:0x018b BREAK  A[LOOP:0: B:30:0x0077->B:86:0x0173], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0173 A[LOOP:0: B:30:0x0077->B:86:0x0173, LOOP_END] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:93:0x01ae -> B:95:0x01b1). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object a(kotlin.coroutines.jvm.internal.ContinuationImpl r26) {
        /*
            Method dump skipped, instructions count: 478
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: io.ktor.utils.io.q.a(kotlin.coroutines.jvm.internal.ContinuationImpl):java.lang.Object");
    }

    public final void b(long j11) throws IOException {
        long j12 = this.f66638h + j11;
        long j13 = this.f66634d;
        if (j12 <= j13) {
            return;
        }
        StringBuilder sbU = b.c0.u(j13, "Limit of ", " bytes exceeded while searching for \"");
        f80.a aVar = this.f66632b;
        Intrinsics.g(aVar, "<this>");
        sbU.append(r70.j.F0(r70.j.x0(aVar.f54354a), "\n", "\\n", false));
        sbU.append(AbstractJsonLexerKt.STRING);
        throw new IOException(sbU.toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004a, code lost:
    
        if (r15 == r1) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c2, code lost:
    
        if (r15 != r1) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0040 -> B:27:0x005a). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x004a -> B:22:0x004e). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) throws Throwable {
        o oVar;
        int i5;
        j0 j0Var;
        int i11;
        Object objA;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i12 = oVar.f66623v;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                oVar.f66623v = i12 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object objG = oVar.f66621t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = oVar.f66623v;
        e80.k kVar = this.f66635e;
        if (i13 == 0) {
            ResultKt.b(objG);
            if (kVar.N()) {
            }
            return coroutineSingletons;
        }
        if (i13 != 1) {
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objG);
            this.f66638h++;
            return Boolean.FALSE;
        }
        ResultKt.b(objG);
        if (!((Boolean) objG).booleanValue()) {
            return Boolean.FALSE;
        }
        byte b11 = kVar.readByte();
        int i14 = this.f66639i;
        e80.a aVar = this.f66637g;
        f80.a aVar2 = this.f66632b;
        if (i14 > 0 && b11 != aVar2.a(i14)) {
            int i15 = this.f66639i;
            while (true) {
                i5 = this.f66639i;
                if (i5 <= 0 || b11 == aVar2.a(i5)) {
                    break;
                }
                this.f66639i = this.f66636f[this.f66639i - 1];
            }
            long j11 = i15 - this.f66639i;
            b(j11);
            long j12 = this.f66638h;
            j0Var = this.f66633c;
            e80.j jVarE = j0Var.e();
            Intrinsics.e(jVarE, "null cannot be cast to non-null type kotlinx.io.Buffer");
            this.f66638h = aVar.B((e80.a) jVarE, j11) + j12;
            i11 = this.f66639i;
            if (i11 == 0 && b11 != aVar2.a(i11)) {
                oVar.f66623v = 2;
                l0 l0Var = m0.f66614a;
                ((e80.a) j0Var.e()).s(b11);
                objA = r0.a(j0Var, oVar);
                if (objA != CoroutineSingletons.f71806a) {
                    objA = Unit.f71706a;
                }
            }
        }
        int i16 = this.f66639i + 1;
        this.f66639i = i16;
        if (i16 != aVar2.f54354a.length) {
            return Boolean.TRUE;
        }
        aVar.s(b11);
        if (kVar.N()) {
            byte b112 = kVar.readByte();
            int i142 = this.f66639i;
            e80.a aVar3 = this.f66637g;
            f80.a aVar22 = this.f66632b;
            if (i142 > 0) {
                int i152 = this.f66639i;
                while (true) {
                    i5 = this.f66639i;
                    if (i5 <= 0) {
                        break;
                    }
                    break;
                    break;
                    this.f66639i = this.f66636f[this.f66639i - 1];
                }
                long j112 = i152 - this.f66639i;
                b(j112);
                long j122 = this.f66638h;
                j0Var = this.f66633c;
                e80.j jVarE2 = j0Var.e();
                Intrinsics.e(jVarE2, "null cannot be cast to non-null type kotlinx.io.Buffer");
                this.f66638h = aVar3.B((e80.a) jVarE2, j112) + j122;
                i11 = this.f66639i;
                if (i11 == 0) {
                    oVar.f66623v = 2;
                    l0 l0Var2 = m0.f66614a;
                    ((e80.a) j0Var.e()).s(b112);
                    objA = r0.a(j0Var, oVar);
                    if (objA != CoroutineSingletons.f71806a) {
                    }
                }
            }
            int i162 = this.f66639i + 1;
            this.f66639i = i162;
            if (i162 != aVar22.f54354a.length) {
            }
        } else {
            oVar.f66623v = 1;
            objG = this.f66631a.g(1, oVar);
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x008a, code lost:
    
        if (r4.c(r0) == r1) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00d7, code lost:
    
        if (r11 != r1) goto L43;
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c4 A[PHI: r10
      0x00c4: PHI (r10v2 boolean) = (r10v3 boolean), (r10v7 boolean) binds: [B:27:0x006e, B:22:0x0059] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x00d7 -> B:43:0x00da). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        p pVar;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f66629w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f66629w = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object objC = pVar.f66627u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = pVar.f66629w;
        if (i11 == 0) {
            ResultKt.b(objC);
            this.f66638h = 0L;
            if (!this.f66635e.N()) {
            }
            return obj;
        }
        if (i11 == 1) {
            z11 = pVar.f66626t;
            ResultKt.b(objC);
            if (!((Boolean) objC).booleanValue()) {
            }
            return obj;
        }
        if (i11 != 2) {
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objC);
                return new Long(this.f66638h);
            }
            z11 = pVar.f66626t;
            ResultKt.b(objC);
            if (((Boolean) objC).booleanValue()) {
                return new Long(this.f66638h);
            }
            if (!this.f66635e.N()) {
                pVar.f66626t = z11;
                pVar.f66629w = 1;
                objC = this.f66631a.g(1, pVar);
                if (objC != obj) {
                    if (!((Boolean) objC).booleanValue()) {
                        pVar.f66626t = z11;
                        pVar.f66629w = 2;
                        if (a(pVar) != obj) {
                            pVar.f66626t = z11;
                            pVar.f66629w = 3;
                            objC = c(pVar);
                        }
                    } else {
                        if (!z11) {
                            StringBuilder sb2 = new StringBuilder("Expected \"");
                            f80.a aVar = this.f66632b;
                            Intrinsics.g(aVar, "<this>");
                            sb2.append(r70.j.F0(r70.j.x0(aVar.f54354a), "\n", "\\n", false));
                            sb2.append("\" but encountered end of input");
                            throw new IOException(sb2.toString());
                        }
                        long j11 = this.f66638h;
                        e80.a aVar2 = this.f66637g;
                        j0 j0Var = this.f66633c;
                        this.f66638h = aVar2.f(j0Var.e()) + j11;
                        pVar.f66629w = 4;
                    }
                }
            }
            return obj;
        }
        z11 = pVar.f66626t;
        ResultKt.b(objC);
        pVar.f66626t = z11;
        pVar.f66629w = 3;
        objC = c(pVar);
    }
}
