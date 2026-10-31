package e20;

import android.content.Context;
import b.u4;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final Context f52015a;

    public d(Context context) {
        this.f52015a = context.getApplicationContext();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, ContinuationImpl continuationImpl) {
        a aVar;
        Ref.ObjectRef objectRef;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f52004w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f52004w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f52002u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f52004w;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            t5.g gVarA = e.a(this.f52015a);
            b bVar = new b(str, objectRefL, null);
            aVar.f52001t = objectRefL;
            aVar.f52004w = 1;
            if (gVarA.a(bVar, aVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = aVar.f52001t;
            ResultKt.b(obj);
        }
        return objectRef.f71863a;
    }

    public final w70.m b() {
        return e.a(this.f52015a).getData();
    }
}
