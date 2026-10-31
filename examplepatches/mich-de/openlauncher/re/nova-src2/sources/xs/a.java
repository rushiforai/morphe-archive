package xs;

import b0.h0;
import b2.r;
import k0.y;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import p1.t;
import ps.f0;
import ps.i0;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f96231b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f96232c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96233a;

    public /* synthetic */ a(int i5) {
        this.f96233a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x006a  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f96233a) {
            case 0:
                y VerificationBodyContainer = (y) obj;
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                Intrinsics.g(VerificationBodyContainer, "$this$VerificationBodyContainer");
                if ((iIntValue & 17) == 16) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        f0.d(null, null, oVar, 0, 3);
                    }
                }
                break;
            default:
                h0 AnimatedVisibility = (h0) obj;
                p1.o oVar2 = (p1.o) obj2;
                ((Number) obj3).intValue();
                Intrinsics.g(AnimatedVisibility, "$this$AnimatedVisibility");
                t tVar2 = (t) oVar2;
                tVar2.b0(-443512897);
                os.b bVar = (os.b) tVar2.j(os.g.f80779c);
                tVar2.p(false);
                i0.c(androidx.compose.foundation.layout.e.o(androidx.compose.ui.platform.a.a(r.f17024a, "verification_resend_loader_tag"), 18), bVar.f80749m, 0L, 3, oVar2, 3078, 4);
                break;
        }
        return Unit.f71706a;
    }
}
