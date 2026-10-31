package q10;

import android.content.Context;
import android.os.SystemClock;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import h50.q;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import mx.e0;
import t70.l1;
import t70.m0;

/* loaded from: classes.dex */
public final class i extends l {

    /* renamed from: h, reason: collision with root package name */
    public final b f83448h;

    /* renamed from: i, reason: collision with root package name */
    public final a70.d f83449i;

    public i() {
        super(NativeAdContent.ViewTag.ROOT, 3, 2132019438, 2132019450);
        this.f83448h = b.f83431e;
        this.f83449i = LazyKt.a(new q(24));
    }

    @Override // q10.l
    public final Object d(Context context, SuspendLambda suspendLambda) {
        b bVar = this.f83448h;
        Process process = bVar.f83432a;
        return (process == null || !process.isAlive()) ? bVar.b(suspendLambda) : Boolean.TRUE;
    }

    @Override // q10.l
    public final boolean g(Context context) {
        b bVar = b.f83431e;
        return ul.b.M();
    }

    @Override // q10.l
    public final boolean h() {
        b bVar = b.f83431e;
        return ul.b.M();
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x007a, code lost:
    
        if (r9 == r0) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x008b, code lost:
    
        if (r9 == r0) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // q10.l
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(Context context, Continuation continuation) {
        h hVar;
        if (continuation instanceof h) {
            hVar = (h) continuation;
            int i5 = hVar.f83447v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f83447v = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = hVar.f83445t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f83447v;
        if (i11 == 0) {
            ResultKt.b(objA);
            a70.d dVar = this.f83449i;
            int iIntValue = ((Number) dVar.getValue()).intValue();
            b bVar = this.f83448h;
            if (iIntValue != 0) {
                String str = "service call power " + ((Number) dVar.getValue()).intValue() + " i64 " + SystemClock.uptimeMillis() + " i32 0 i32 0";
                hVar.f83447v = 1;
                objA = bVar.a(str, hVar);
            } else {
                hVar.f83447v = 2;
                objA = bVar.a("input keyevent KEYCODE_POWER", hVar);
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objA);
            ((Boolean) objA).getClass();
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            ((Boolean) objA).getClass();
        }
        return Boolean.TRUE;
    }

    @Override // q10.l
    public final void j(Context context) {
        this.f83448h.c();
        m0.t(l1.f88818a, null, null, new e0(this, (Continuation) null, 16), 3);
    }
}
