package q0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import n0.w;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final r1.e f83313a = new r1.e(new c[16]);

    /* JADX WARN: Removed duplicated region for block: B:16:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0063 -> B:19:0x0066). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(h2.c cVar, ContinuationImpl continuationImpl) {
        a aVar;
        h2.c cVar2;
        int i5;
        Object[] objArr;
        int i11;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i12 = aVar.f83312z;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                aVar.f83312z = i12 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f83310x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = aVar.f83312z;
        if (i13 == 0) {
            ResultKt.b(obj);
            r1.e eVar = this.f83313a;
            Object[] objArr2 = eVar.f85077a;
            int i14 = eVar.f85079c;
            cVar2 = cVar;
            i5 = i14;
            objArr = objArr2;
            i11 = 0;
            if (i11 < i5) {
            }
        } else {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = aVar.f83309w;
            i11 = aVar.f83308v;
            objArr = aVar.f83307u;
            h2.c cVar3 = aVar.f83306t;
            ResultKt.b(obj);
            cVar2 = cVar3;
            i11++;
            if (i11 < i5) {
                c cVar4 = (c) objArr[i11];
                w wVar = new w(cVar2, 8);
                aVar.f83306t = cVar2;
                aVar.f83307u = objArr;
                aVar.f83308v = i11;
                aVar.f83309w = i5;
                aVar.f83312z = 1;
                if (io.sentry.config.a.y(cVar4, wVar, aVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                i11++;
                if (i11 < i5) {
                    return Unit.f71706a;
                }
            }
        }
    }
}
