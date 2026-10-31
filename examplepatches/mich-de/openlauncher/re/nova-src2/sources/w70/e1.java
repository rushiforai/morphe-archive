package w70;

import kotlin.coroutines.EmptyCoroutineContext;

/* loaded from: classes.dex */
public abstract /* synthetic */ class e1 {
    /* JADX WARN: Removed duplicated region for block: B:19:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final x1 a(m mVar, int i5) {
        v70.m.f92191rp.getClass();
        int i11 = v70.l.f92190b;
        if (i5 >= i11) {
            i11 = i5;
        }
        int i12 = i11 - i5;
        if (mVar instanceof x70.d) {
            x70.d dVar = (x70.d) mVar;
            v70.a aVar = dVar.f95221c;
            m mVarG = dVar.g();
            if (mVarG != null) {
                int i13 = dVar.f95220b;
                if (i13 != -3 && i13 != -2 && i13 != 0) {
                    i12 = i13;
                } else if (aVar == v70.a.f92141a) {
                    if (i13 == 0) {
                        i12 = 0;
                    }
                } else if (i5 == 0) {
                    i12 = 1;
                }
                return new x1(i12, dVar.f95219a, aVar, mVarG);
            }
        }
        return new x1(i12, EmptyCoroutineContext.f71803a, v70.a.f92141a, mVar);
    }
}
