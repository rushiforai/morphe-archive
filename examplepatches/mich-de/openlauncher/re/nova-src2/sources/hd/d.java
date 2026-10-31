package hd;

import ads_mobile_sdk.vo1;
import com.fyber.inneractive.sdk.external.VideoContentListener;

/* loaded from: classes3.dex */
public final class d implements VideoContentListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f59615a;

    public d(g gVar) {
        this.f59615a = gVar;
    }

    @Override // com.fyber.inneractive.sdk.external.VideoContentListener
    public final void onCompleted() {
        vo1 vo1Var = this.f59615a.o;
        if (vo1Var != null) {
            vo1Var.onVideoComplete();
        }
    }

    @Override // com.fyber.inneractive.sdk.external.VideoContentListener
    public final void onPlayerError() {
    }

    @Override // com.fyber.inneractive.sdk.external.VideoContentListener
    public final void onProgress(int i5, int i11) {
    }
}
