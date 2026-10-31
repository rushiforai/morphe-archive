package e0;

import androidx.compose.ui.Modifier$Node;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public final class h0 extends Modifier$Node implements b3.q {

    /* renamed from: a, reason: collision with root package name */
    public final i0.i f50005a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f50006b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f50007c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f50008d;

    public h0(i0.i iVar) {
        this.f50005a = iVar;
    }

    @Override // b3.q
    public final void draw(k2.c cVar) {
        cVar.drawContent();
        if (this.f50006b) {
            k2.f.s(cVar, i2.s.b(0.3f, i2.s.f61136b), 0L, cVar.mo94getSizeNHjbRc(), 0.0f, null, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        } else if (this.f50007c || this.f50008d) {
            k2.f.s(cVar, i2.s.b(0.1f, i2.s.f61136b), 0L, cVar.mo94getSizeNHjbRc(), 0.0f, null, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        t70.m0.t(getCoroutineScope(), null, null, new g0(this, null), 3);
    }
}
