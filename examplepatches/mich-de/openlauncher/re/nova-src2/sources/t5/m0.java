package t5;

import java.io.FileOutputStream;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;

/* loaded from: classes2.dex */
public final class m0 extends f0 implements o1 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // t5.o1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Object obj, ContinuationImpl continuationImpl) {
        l0 l0Var;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2;
        if (continuationImpl instanceof l0) {
            l0Var = (l0) continuationImpl;
            int i5 = l0Var.f88649x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l0Var.f88649x = i5 - Integer.MIN_VALUE;
            } else {
                l0Var = new l0(this, continuationImpl);
            }
        }
        Object obj2 = l0Var.f88647v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l0Var.f88649x;
        if (i11 == 0) {
            ResultKt.b(obj2);
            if (this.f88583c.get()) {
                throw new IllegalStateException("This scope has already been closed.");
            }
            FileOutputStream fileOutputStream3 = new FileOutputStream(this.f88581a);
            try {
                c1 c1Var = this.f88582b;
                m90.b0 b0Var = new m90.b0(fileOutputStream3);
                l0Var.f88645t = fileOutputStream3;
                l0Var.f88646u = fileOutputStream3;
                l0Var.f88649x = 1;
                if (c1Var.writeTo(obj, b0Var, l0Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                fileOutputStream2 = fileOutputStream3;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream3;
                throw th;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fileOutputStream2 = l0Var.f88646u;
            fileOutputStream = l0Var.f88645t;
            try {
                ResultKt.b(obj2);
            } catch (Throwable th3) {
                th = th3;
                try {
                    throw th;
                } catch (Throwable th4) {
                    CloseableKt.a(fileOutputStream, th);
                    throw th4;
                }
            }
        }
        fileOutputStream2.getFD().sync();
        Unit unit = Unit.f71706a;
        CloseableKt.a(fileOutputStream, null);
        return Unit.f71706a;
    }
}
