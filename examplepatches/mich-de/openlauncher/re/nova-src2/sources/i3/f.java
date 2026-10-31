package i3;

import com.google.android.gms.internal.consent_sdk.e0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import n3.k;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public int f61237a;

    /* renamed from: b, reason: collision with root package name */
    public float f61238b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f61239c;

    public f(int i5, f1.i iVar) {
        this.f61237a = i5;
        this.f61239c = iVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public float a(boolean z11, boolean z12, boolean z13, int i5) {
        boolean z14;
        k kVar = (k) this.f61239c;
        int i11 = 1;
        if (z11) {
            int iH = e0.H(kVar.f77764f, i5, z11);
            z14 = i5 == kVar.f77764f.getLineStart(iH) || i5 == kVar.f(iH);
        }
        int i12 = i5 * 4;
        if (!z13) {
            i11 = z14 ? 2 : 3;
        } else if (z14) {
            i11 = 0;
        }
        int i13 = i12 + i11;
        if (this.f61237a == i13) {
            return this.f61238b;
        }
        float fH = z13 ? kVar.h(i5, z11) : kVar.i(i5, z11);
        if (z12) {
            this.f61237a = i13;
            this.f61238b = fH;
        }
        return fH;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object b(float f11, ContinuationImpl continuationImpl) {
        e eVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f61236v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f61236v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object objInvoke = eVar.f61234t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f61236v;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            f1.i iVar = (f1.i) this.f61239c;
            Float f12 = new Float(f11);
            eVar.f61236v = 1;
            objInvoke = iVar.invoke(f12, eVar);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objInvoke);
        }
        this.f61238b += ((Number) objInvoke).floatValue();
        return Unit.f71706a;
    }

    public f(k kVar) {
        this.f61239c = kVar;
        this.f61237a = -1;
    }
}
