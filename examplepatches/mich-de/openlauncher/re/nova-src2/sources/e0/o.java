package e0;

import androidx.compose.ui.Modifier$Node;
import b3.p2;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o extends Modifier$Node implements b3.q, b3.z1, p2 {

    /* renamed from: a, reason: collision with root package name */
    public long f50076a;

    /* renamed from: b, reason: collision with root package name */
    public i2.p f50077b;

    /* renamed from: c, reason: collision with root package name */
    public float f50078c;

    /* renamed from: d, reason: collision with root package name */
    public i2.v0 f50079d;

    /* renamed from: e, reason: collision with root package name */
    public long f50080e;

    /* renamed from: f, reason: collision with root package name */
    public y3.n f50081f;

    /* renamed from: g, reason: collision with root package name */
    public i2.r0 f50082g;

    /* renamed from: h, reason: collision with root package name */
    public i2.v0 f50083h;

    /* renamed from: i, reason: collision with root package name */
    public i2.r0 f50084i;

    @Override // b3.p2
    public final void applySemantics(j3.b0 b0Var) {
    }

    @Override // b3.q
    public final void draw(k2.c cVar) {
        i2.r0 r0Var;
        i2.n0 n0Var;
        if (this.f50079d == i2.r0.f61135a) {
            if (!ULong.a(this.f50076a, i2.s.f61147m)) {
                k2.f.s(cVar, this.f50076a, 0L, 0L, 0.0f, null, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
            }
            i2.p pVar = this.f50077b;
            if (pVar != null) {
                k2.f.h(cVar, pVar, 0L, 0L, this.f50078c, null, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
            }
        } else {
            if (h2.e.a(cVar.mo94getSizeNHjbRc(), this.f50080e) && cVar.getLayoutDirection() == this.f50081f && Intrinsics.b(this.f50083h, this.f50079d)) {
                r0Var = this.f50082g;
                Intrinsics.d(r0Var);
            } else {
                b3.g.f(this, new b00.c(1, this, cVar));
                r0Var = this.f50084i;
                this.f50084i = null;
            }
            this.f50082g = r0Var;
            this.f50080e = cVar.mo94getSizeNHjbRc();
            this.f50081f = cVar.getLayoutDirection();
            this.f50083h = this.f50079d;
            Intrinsics.d(r0Var);
            if (!ULong.a(this.f50076a, i2.s.f61147m)) {
                i2.r0.i(cVar, r0Var, this.f50076a);
            }
            i2.p pVar2 = this.f50077b;
            if (pVar2 != null) {
                float f11 = this.f50078c;
                boolean z11 = r0Var instanceof i2.j0;
                k2.j jVar = k2.j.f70871a;
                if (z11) {
                    h2.c cVar2 = ((i2.j0) r0Var).f61125b;
                    float f12 = cVar2.f59018a;
                    float f13 = cVar2.f59019b;
                    cVar.mo89drawRectAsUm42w(pVar2, (Float.floatToRawIntBits(f13) & 4294967295L) | (Float.floatToRawIntBits(f12) << 32), i2.r0.p(cVar2), f11, jVar, null, 3);
                } else {
                    if (r0Var instanceof i2.k0) {
                        i2.k0 k0Var = (i2.k0) r0Var;
                        n0Var = k0Var.f61127c;
                        if (n0Var == null) {
                            h2.d dVar = k0Var.f61126b;
                            float fIntBitsToFloat = Float.intBitsToFloat((int) (dVar.f59029h >> 32));
                            float f14 = dVar.f59022a;
                            float f15 = dVar.f59023b;
                            long jFloatToRawIntBits = (Float.floatToRawIntBits(f15) & 4294967295L) | (Float.floatToRawIntBits(f14) << 32);
                            float fB = dVar.b();
                            float fA = dVar.a();
                            cVar.mo91drawRoundRectZuiqVtQ(pVar2, jFloatToRawIntBits, (Float.floatToRawIntBits(fA) & 4294967295L) | (Float.floatToRawIntBits(fB) << 32), (Float.floatToRawIntBits(fIntBitsToFloat) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32), f11, jVar, null, 3);
                        }
                    } else {
                        if (!(r0Var instanceof i2.i0)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        n0Var = ((i2.i0) r0Var).f61123b;
                    }
                    cVar.mo86drawPathGBMwjPU(n0Var, pVar2, f11, jVar, null, 3);
                }
            }
        }
        cVar.drawContent();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.p2
    public final boolean isImportantForBounds() {
        return false;
    }

    @Override // b3.z1
    public final void k() {
        this.f50080e = 9205357640488583168L;
        this.f50081f = null;
        this.f50082g = null;
        this.f50083h = null;
        b3.g.d(this);
    }
}
