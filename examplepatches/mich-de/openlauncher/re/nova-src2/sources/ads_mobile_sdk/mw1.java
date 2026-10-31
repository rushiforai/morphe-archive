package ads_mobile_sdk;

import android.widget.FrameLayout;
import android.widget.ImageView;
import b.r1;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class mw1 implements b.w5 {

    /* renamed from: a, reason: collision with root package name */
    public final zt1 f7351a;

    /* renamed from: b, reason: collision with root package name */
    public final c7 f7352b;

    public mw1(zt1 nativeAdCore) {
        Intrinsics.g(nativeAdCore, "nativeAdCore");
        this.f7351a = nativeAdCore;
        this.f7352b = new c7(9, (byte) 0);
    }

    @Override // b.w5
    public final Object a(boolean z11, Continuation continuation) {
        FrameLayout frameLayoutC;
        if (z11) {
            c7 c7Var = this.f7352b;
            if (c7Var.f1694a != null && (frameLayoutC = ((ew1) ((r1) c7Var.a("The backing field has not yet been initialized."))).c()) != null) {
                Map mapB = ((ew1) ((r1) c7Var.a("The backing field has not yet been initialized."))).b();
                ImageView.ScaleType mediaviewScaleType = ((ew1) ((r1) c7Var.a("The backing field has not yet been initialized."))).e();
                if (mediaviewScaleType == null) {
                    mediaviewScaleType = iw1.f4976i;
                }
                zt1 zt1Var = this.f7351a;
                zt1Var.getClass();
                Intrinsics.g(mediaviewScaleType, "mediaviewScaleType");
                if (!zt1Var.f12652a.getAndSet(true)) {
                    zt1Var.a(frameLayoutC, mediaviewScaleType, mapB);
                }
            }
        }
        return Unit.f71706a;
    }
}
